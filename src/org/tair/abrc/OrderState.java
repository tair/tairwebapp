// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc;


import java.io.Serializable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jboss.logging.Logger;
import org.tair.abrc.order.LineItem;
import org.tair.abrc.order.Order;
import org.tair.abrc.order.Orders;
import org.tair.abrc.order.PendingPayment;
import org.tair.abrc.stock.ListStock;
import org.tair.abrc.stock.Stock;
import org.tair.utilities.DataConstants;


public class OrderState implements Serializable {
  /**
   * Serial version UID for serializable object
   */
  private static final long serialVersionUID = -9078101660196155504L;
  private static final Logger logger = Logger.getLogger(OrderState.class);
  transient private Order cached_order;
  private List<String> failed;
  private List<Long> queued_stocks;
  private Map<String, String[]> queued_params;
  private Long comp_order_id; // The order id of the CompositeOrder once this
  // order is complete
  private Long order_id; // The order id of the pending order
  private BigInteger person_id;
  private BigInteger org_id;
  private boolean accept;
  private boolean reship;
  private boolean error;
  private boolean comment_missing;
  private String po_msg;
  private String currentState;

  public OrderState() {
    comment_missing = false;
    error = false;
    reship = false;
    queued_params = null;
    queued_stocks = null;
    comp_order_id = null;
    person_id = null;
    org_id = null;
    po_msg = "";
    failed = new ArrayList<String>();
  }

  public void purge() {
    cached_order = null;
  }

  /**
   * Compute the current state. This method does several things:
   * <ol>
   * <li>computes the current state string and sets it as a data member that you
   * can access with the getCurrentState() method</li>
   * <li>processes the pending payment if the Orders object has a payment in
   * progress, which can either complete the order or result in a
   * PAYMENT_IN_PROGRESS state</li>
   * <li>processes the queued items</li>
   * </ol>
   * <strong>You should call this method only once unless you fully understand
   * what it is doing internally.<strong> This public method wraps the
   * computation and stores the current state string in the currentState member,
   * which you can access with getCurrentState();
   * 
   * @return the current state string
   */
  public String currentState() {
    currentState = computeCurrentState();
    return currentState;
  }

  /**
   * Implements the computing of the current state (see currentState()).
   * 
   * @return the current state string
   */
  private String computeCurrentState() {
    Order order = getOrder();

    if (getPersonId() == null)
      return "WAIT_FOR_LOGIN";

    if (comp_order_id != null)
      return "ORDER_COMPLETE";

    if (Orders.paymentInProgress(order)) {
      CompositeOrder comp = Orders.processPendingPayment(order);
      comp_order_id = (comp == null) ? null : comp.get_orders_id();
      if (comp_order_id != null)
        return "ORDER_COMPLETE";
      return "PAYMENT_IN_PROGRESS";
    }

    if (!acceptedDisclaimer())
      return "WAIT_FOR_ACCEPT";

    if (order != null
        && DataConstants.CREDIT_CARD_PAYMENT_METHOD.equals(order.getPaymentMethod()))
      return "CC_PAYMENT";

    if (order != null
        && DataConstants.PURCHASE_ORDER_PAYMENT_METHOD.equals(order.getPaymentMethod()))
      return "PO_PAYMENT";

    processQueued();

    if (reship)
      return "WAIT_FOR_CONFIRM_RECENT";

    return "READY_FOR_CHANGES";
  }

  /**
   * Change the order state.
   * 
   * @param params A Map of key-value pairs (usually this is the POST data from
   *          an HTTP request).
   * @throws Exception 
   */
  public void change(Map<String, String[]> params) throws Exception {
    String state = getString(params, "state");
    String cmd = getString(params, "cmd");

    if ("addStock".equals(state) || "update".equals(cmd)) {
      queued_stocks = stockIds(params);
      queued_params = params;
      processQueued();
    }

    else if ("cancel-payment".equals(cmd))
      cancelPayment(params);

    else if ("po-number".equals(cmd))
      placePO(params);

    else if ("un-place".equals(cmd))
      setMethod(DataConstants.NO_PAYMENT_METHOD);

    else if ("place-po".equals(cmd))
      setMethod(DataConstants.PURCHASE_ORDER_PAYMENT_METHOD);

    else if ("place-cc".equals(cmd))
      setMethod(DataConstants.CREDIT_CARD_PAYMENT_METHOD);

    else if ("reship".equals(cmd))
      processReship(params);

    else if ("rm_expr_shipping".equals(cmd))
      setExpressShipping(false);

    else if ("add_expr_shipping".equals(cmd))
      setExpressShipping(true);

    else if ("delete".equals(cmd))
      removeStock(params);

    else if ("accept".equals(cmd))
      doAcceptDisclaimer(params);
  }

  /**
   * Add stocks to order if possible. If any of the stocks to be added were
   * ordered recently, this method will not add any stocks. Per ABRC policy, the
   * user is given the choice to have recently orderd stocks reshipped or
   * processed as usual.
   */
  private void processQueued() {
    if (getPersonId() == null || getOrgId() == null || !acceptedDisclaimer()
        || queued_stocks == null)
      return;
    this.reship = !getRecent().isEmpty();
    if (this.reship)
      return;
    try {
      Order order = getOrder(true);
      for (Long id : queued_stocks) {
        LineItem item = order.addStock(id);
        addToFailedIfFailed(item);
      }
      updateComments(order);
      // For proxies, set no-charge if it's not already set to true by the
      // organization's having their charges waived.
      if (order.getProxyOrder() && !order.getNoCharge())
        order.setNoCharge(queued_params.get("no_charge") != null);
      updateQuantities(order, queued_params);
      Orders.save(order);
      queued_params = null;
      queued_stocks = null;
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  /**
   * Add stocks to order, taking into consideration stocks that are to
   * reshipped, deleted, or processed as usual.
   */
  private void processReship(Map<String, String[]> params) {
    Order order = getOrder(true);
    if (order == null || queued_stocks == null)
      return;
    try {
      List<String> reship_ids = valuesWithPrefix("RESHIP:", params);
      String comment = getString(params, "reship_comment");
      comment_missing =
        (comment == null || "".equals(comment)) && !reship_ids.isEmpty();
      if (comment_missing) {
        this.reship = true;
        return;
      }
      for (String id : valuesWithPrefix("DELETE:", params))
        try {
          queued_stocks.remove(new Long(id));
        } catch (Exception e) {
        }
      for (Long id : queued_stocks) {
        LineItem item = order.addStock(id);
        if (reship_ids.contains(id.toString()))
          order.waiveCharge(item);
        addToFailedIfFailed(item);
      }
      updateComments(order);
      String cmnt = order.getOrdererComments();
      if (cmnt != null && !"".equals(cmnt))
        comment = cmnt + "\n" + comment;
      updateComments(order, comment, null, null);
      if (order.getProxyOrder())
        order.setNoCharge(queued_params.get("no_charge") != null);
      updateQuantities(order, queued_params);
      Orders.save(order);
      queued_params = null;
      queued_stocks = null;
      this.reship = false;
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  /** Save failed items (errors, restricted, etc) to be reported. */
  private void addToFailedIfFailed(LineItem item) {
    if (item == null)
      return;
    String reason = item.getAvailabilityType();
    reason = reason == null ? "unavailable" : reason.replaceAll("_", " ");
    if (item.getStatus().equals(LineItem.Status.RESTRICTED))
      failed.add(String.format("Stock '%s' is restricted", item.getName()));
    else if (item.getStatus().equals(LineItem.Status.UNAVAILABLE))
      failed.add(String.format("Stock '%s' is " + reason, item.getName()));
    else if (item.getStatus().equals(LineItem.Status.ERROR))
      failed.add(String.format("An error occurred while adding stock '%s' to your order",
                               item.getName()));
    else if (item.getStatus().equals(LineItem.Status.NASC_STOCK))
      failed.add(String.format("Plese order stock '%s' directly from NASC",
                               item.getName()));
  }

  /** Save unknown stock name to be reported. */
  private void addToFailed(String name) {
    if (name == null)
      return;
    failed.add(String.format("Unknown stock name '%s'", name));
  }

  public List<String> clearFailed() {
    List<String> f = failed;
    failed = new ArrayList<String>();
    return f;
  }

  public List<String> getFailed() {
    return failed;
  }

  private void cancelPayment(Map<String, String[]> params) {
    Order order = getOrder();
    if (order != null)
      for (PendingPayment p : order.getPendingPayments())
        if (p.getStatus().equals("PENDING")) {
          p.setStatus("CANCELLED");
          p.save();
        }
  }

  /**
   * Place a purchase order using the current order data. This method is
   * synchronized to avoid duplicate orders and emails.
   * @throws Exception 
   */
  synchronized private void placePO(Map<String, String[]> params) throws Exception {
    // Only process if the composite order id is still null.
    if (comp_order_id == null) {
      Order order = getOrder();
      po_msg = null;
      try {
        String po_number = getString(params, "po_number");
        if (po_number != null && !po_number.matches("\\s*")) {
          CompositeOrder comp =
            Orders.placePurchaseOrder(order, po_number.trim());
          if (comp != null) {
            try {
              OrderEmailHandler.sendOrderConfirmation(comp);
            } catch (Exception e) {
              // Don't let email failure interfere with setting order id.
              // If the id isn't set, this goes into an infinite loop while
              // payment hangs.
              logger.error("Error sending PO confirmation email, proceeding: "
                           + e.getMessage(), e);
            }
            comp_order_id = comp.get_orders_id();
          } else {
            po_msg = "Could not place purchase order";
          }
        } else {
          po_msg = "Purchase order number missing or invalid: " + po_number;
        }
      } catch (Exception e) {
        po_msg = "Problem while attempting to place purchase order";
        logger.error(po_msg, e);
        throw e;
      }
    } else {
      po_msg =
        "Trying to place purchase order for order that is already complete";
    }
  }

  private void setMethod(String method) {
    Order order = getOrder();
    if (order != null) {
      order.setPaymentMethod(method);
      Orders.save(order);
    }
  }

  private void setExpressShipping(boolean express) {
    Order order = getOrder();
    if (order == null)
      return;
    try {
      order.setExpressShipping(express);
      Orders.save(order);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  private void updateComments(Order order) {
    updateComments(order,
                   getString(queued_params, "orderer_comments"),
                   getString(queued_params, "ABRC_comments"),
                   getString(queued_params, "ABRC_public_comments"));
  }

  private void updateComments(Order order, String orderer, String ABRC,
                              String ABRC_public) {
    if (orderer != null && !orderer.equals(order.getOrdererComments()))
      order.setOrdererComments(orderer);
    if (ABRC != null && !ABRC.equals(order.getABRCComments()))
      order.setABRCComments(ABRC);
    if (ABRC_public != null
        && !ABRC_public.equals(order.getABRCPublicComments()))
      order.setABRCPublicComments(ABRC_public);
  }

  static void updateQuantities(Order order, Map<String, String[]> params) {
    String q;
    for (LineItem item : order.getItems(LineItem.Type.STOCK)) {
      if (item.getMutableQuantity()) {
        q = getString(params, "QUANTITY:" + item.getName().toUpperCase());
        if (q != null && q.matches("\\d+"))
          item.setQuantity(Long.parseLong(q));
      }
    }
  }

  private void removeStock(Map<String, String[]> params) {
    Order order = getOrder();
    if (order == null)
      return;
    List<Long> list = new ArrayList<Long>();
    for (String id : getList(params, "delete"))
      list.add(new Long(id));
    order.remove(list);
    try {
      Orders.save(order);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  private boolean acceptedDisclaimer() {
    if (cached_order != null)
      accept = cached_order.getAcceptDisclaimer();
    return accept;
  }

  private void doAcceptDisclaimer(Map<String, String[]> params) {
    // Note: "communityID" is an inappropriate name, it really is the org id
    BigInteger id = getBigInteger(params, "communityID");
    if (id == null)
      return;
    setOrgId(id);
    accept = true;
    if (cached_order != null)
      cached_order.setAcceptDisclaimer(true);
  }

  /**
   * Assemble a Map of recent stocks. Group recent stocks by stock id and
   * discard stocks that are not in the list of stocks to add.
   */
  public Map<Long, List<ListStock>> getRecent() {
    // TODO optimize by caching the result of this method.
    Long id;
    Map<Long, List<ListStock>> groups = new HashMap<Long, List<ListStock>>();
    if (getOrgId() == null || queued_stocks == null)
      return groups;
    for (ListStock stock : Orders.recentlyOrdered(getOrgId())) {
      id = stock.get_stock_id();
      if (queued_stocks.contains(id)) {
        if (!groups.containsKey(id))
          groups.put(id, new ArrayList<ListStock>());
        groups.get(id).add(stock);
      }
    }
    return groups;
  }

  public Long getCompositeOrderId() {
    return comp_order_id;
  }

  public BigInteger getOrgId() {
    if (cached_order != null)
      org_id = cached_order.getOrgId();
    return org_id;
  }

  public void setOrgId(BigInteger oid) {
    org_id = oid;
    Order order = getOrder(true);
    if (order != null) {
      order.setOrgId(org_id);
      Orders.save(order);
    }
  }

  public BigInteger getPersonId() {
    if (cached_order != null)
      person_id = cached_order.getPersonId();
    return person_id;
  }

  public void setPersonId(BigInteger pid) {
    person_id = pid;
    Order order = getOrder(true);
    if (order != null)
      order.setPersonId(pid);
  }

  public String getMsg() {
    return po_msg;
  }

  public boolean getError() {
    return this.error;
  }

  public void setError(boolean err) {
    this.error = err;
  }

  public boolean isCommentMissing() {
    return comment_missing;
  }

  @SuppressWarnings("unchecked")
  private List<String> valuesWithPrefix(String prefix, Map params) {
    List<String> ids = new ArrayList<String>();
    if (prefix == null)
      return ids;
    int len = prefix.length();
    for (String key : (Collection<String>)params.keySet())
      for (String value : (String[])params.get(key))
        if (value.startsWith(prefix))
          ids.add(value.substring(len));
    return ids;
  }

  public Order getOrder() {
    return getOrder(false);
  }

  public Order getOrder(boolean create_new) {
    Order order = cached_order;

    if (!outOfDate())
      return order;

    BigInteger pid = getPersonId();
    if (order == null && pid != null)
      order = Orders.byPersonId(pid);

    if (order == null && order_id != null)
      order = Orders.byId(order_id);

    if (order == null && pid != null && create_new) {
      order = new Order(pid);
      order.setOrgId(org_id);
      order.setAcceptDisclaimer(accept);
    }

    if (order != cached_order)
      setOrder(order);

    return order;
  }

  private boolean outOfDate() {
    if (order_id == null || cached_order == null)
      return true;
    java.util.Date d1 = cached_order.getDateLastChanged();
    java.util.Date d2 = Orders.getDateLastChanged(order_id);
    return d1 == null || d2 == null || d1.before(d2);
  }

  public static OrderState proxy(BigInteger pid) {
    Order order = Orders.proxyOrder(pid);
    Orders.save(order);
    OrderState state = new OrderState();
    state.setOrder(order);
    state.setPersonId(pid);
    return state;
  }

  private void setOrder(Order order) {
    cached_order = order;
    order_id = (order != null) ? order.getId() : null;
  }

  static String[] split(Map<String, String[]> params, String name) {
    if (params == null)
      return null;
    String[] list = params.get(name);
    if (list != null && list.length > 0)
      return list[0].split("[\\n\\t;:,]+");
    return new String[0];
  }

  static Long getLong(Map<String, String[]> params, String name) {
    String s = getString(params, name);
    if (s != null && s.matches("\\d+"))
      return new Long(s);
    return null;
  }

  static BigInteger getBigInteger(Map<String, String[]> params, String name) {
    String s = getString(params, name);
    if (s != null && s.matches("\\d+"))
      return new BigInteger(s);
    return null;
  }

  static String getString(Map<String, String[]> params, String name) {
    if (params == null)
      return null;
    String[] list = params.get(name);
    if (list != null && list.length > 0)
      return list[0];
    return null;
  }

  static String[] getList(Map<String, String[]> params, String name) {
    if (params == null)
      return new String[0];
    String[] list = params.get(name);
    return list == null ? new String[0] : list;
  }

  private List<Long> stockIds(Map<String, String[]> params) {
    String[] names = null;
    if ("addStock".equals(getString(params, "state")))
      names = getList(params, "stock_number");
    else if ("update".equals(getString(params, "cmd")))
      names = split(params, "stock_number");
    else
      names = new String[0];
    Long id;
    List<Long> ids = new ArrayList<Long>();
    Map<String, Long> m = resolveStockNames(Arrays.asList(names));
    for (String name : m.keySet()) {
      id = m.get(name);
      if (id != null)
        ids.add(id);
      else
        addToFailed(name);
    }
    return ids;
  }

  Map<String, Long> resolveStockNames(List<String> names) {
    Map<String, Long> ids = new HashMap<String, Long>();
    for (String name : names)
      if (!name.matches(" *")) {
        Stock stock = Stock.getStock(name);
        ids.put(name, (stock == null) ? null : stock.get_stock_id());
      }
    return ids;
  }

  /**
   * Set the current state string. This works around needing to compute the
   * string multiple times in a session and is valid only for the session or
   * until it changes again. If you call getCurrentState(), it sets this string.
   * 
   * @param currentState a string representing the current order state
   */
  private void setCurrentState(String currentState) {
    this.currentState = currentState;
  }

  /**
   * Get the current state string.
   * 
   * @return a string representing the current order state
   */
  public String getCurrentState() {
    return currentState;
  }
}
