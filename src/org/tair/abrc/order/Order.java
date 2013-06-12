// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc.order;


import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.jboss.logging.Logger;
import org.tair.abrc.AbrcConstantCollection;
import org.tair.abrc.CompositeOrder;
import org.tair.abrc.payment.CompositeInvoice;
import org.tair.abrc.stock.Stock;
import org.tair.bs.community.BsCountry;
import org.tair.bs.community.BsOrganization;
import org.tair.bs.community.BsPerson;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.OrganizationDelegate;
import org.tair.bs.community.PersonDelegate;
import org.tair.db.community.CommunityFactory;
import org.tair.tfc.TfcLineItem;
import org.tair.utilities.DataConstants;

import com.poesys.db.pk.IPrimaryKey;
import com.poesys.db.pk.SequencePrimaryKey;


/**
 * A stock order containing line items and charges.
 * 
 * @author Robert J. Muller
 */
public class Order extends OrderData {
  /** The logger for this class */
  private static final Logger logger = Logger.getLogger(Order.class);

  // TODO Get rid of float: Effective Java 2nd ed. Item 48
  float comm_multiplier = 8f;
  float order_charge = 15f;
  float special_order_charge = 15f;
  String full_name;

  {
    try {
      comm_multiplier =
        AbrcConstantCollection.getInstance().getValue("commercial stock").floatValue();
      order_charge =
        AbrcConstantCollection.getInstance().getValue("order charge").floatValue();
      special_order_charge =
        AbrcConstantCollection.getInstance().getValue("special order charge").floatValue();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  /**
   * Create a Order object.
   * 
   * @param pid
   */
  public Order(BigInteger pid) {
    setPersonId(pid);
  }

  /**
   * @param name
   * @return
   */
  public LineItem addStock(String name) {
    return addStock(Stock.getStock(name));
  }

  /**
   * Add a stock by stock id.
   * 
   * @param stock_id the stock id of the stock to add
   * @return the line item for the added stock
   */
  public LineItem addStock(Long stock_id) {
    return addStock(Stock.getStock(stock_id));
  }

  /**
   * Adds a stock to order.
   * 
   * @param stock the stock to add
   * @return the line item for the added stock
   */
  public LineItem addStock(Stock stock) {
    LineItem item = new LineItem();
    item.setType(LineItem.Type.STOCK);

    if (stock == null) {
      new Exception("Can't add null stock").printStackTrace();
      item.setStatus(LineItem.Status.ERROR);
      return item;
    }

    BigInteger org_id = getOrgId();
    Long stock_id = stock.get_stock_id();

    // Check if the stock is already in the order
    for (LineItem i : getItems(LineItem.Type.STOCK))
      if (stock_id.equals(i.getStockId()))
        return i;

    Boolean fixed = stock.get_fixed_price();
    item.setMutableQuantity(fixed != null && fixed.booleanValue());
    item.setQuantity(DataConstants.DEFAULT_QUANTITY);
    item.setName(stock.get_name());
    item.setStockId(stock_id);
    item.setStockType(stock.get_format_stock_type());

    if (org_id == null) {
      new Exception("Order has no organization").printStackTrace();
      item.setStatus(LineItem.Status.ERROR);
      return item;
    }

    BsOrganization orgg = getOrganization();
    if (orgg == null) {
      new Exception("Failed to find organization where org id is: " + org_id).printStackTrace();
      item.setStatus(LineItem.Status.ERROR);
      return item;
    }
    setNoCharge(Boolean.TRUE.equals(orgg.getAbrcFeesWaived()));

    if (!DataConstants.AVAILABLE_STOCK.equals(stock.get_available())) {
      item.setStatus(LineItem.Status.UNAVAILABLE);
      item.setAvailabilityType(stock.get_available());
      return item;
    }

    boolean is_commercial = Boolean.TRUE.equals(orgg.getCommercial());
    if (Boolean.TRUE.equals(stock.get_is_restricted()) && is_commercial) {
      item.setStatus(LineItem.Status.RESTRICTED);
      return item;
    }

    if (DataConstants.NASC_STOCK_CENTER.equals(orgg.getSeedStockCenter())
        && stock.is_seed()) {
      item.setStatus(LineItem.Status.NASC_STOCK);
      return item;
    }

    float price = stock.get_base_price();
    System.out.println("stock type : " + stock.get_stock_type());
    if (is_commercial
        && !stock.get_stock_type().equalsIgnoreCase("phytosanitary_certificate"))
      price *= comm_multiplier;
    item.setPrice(price);

    item.setStatus(LineItem.Status.UNPAID);
    addItem(item);
    applyOrderCharge();
    applyExpressShipping();

    return item;
  }

  /**
   * Place a purchase order. This method creates and saves a CompositeOrder,
   * deletes the pending Order from the system, and sends an order confirmation
   * email.
   * 
   * @param po_number The purchase order number to use.
   * @return A CompositeOrder or null if the CompositeOrder or CompositeInvoice
   *         could not be created.
   */
  public CompositeOrder placePurchaseOrder(String po_number) {
    CompositeOrder order = makeCompositeOrder();
    if (order == null)
      return null;
    CompositeInvoice invoice = order.getInvoice();
    if (invoice == null)
      return null;
    invoice.set_payment_method(DataConstants.PURCHASE_ORDER_PAYMENT_METHOD);
    invoice.set_payment_ref_id(po_number);
    setPaymentMethod(DataConstants.PURCHASE_ORDER_PAYMENT_METHOD);
    return order;
  }

  /**
   * Place a credit card order. This method retrieves the next order number from
   * the OrderNumber table, sets the order_number, and saves the pending Order.
   * @param num the order number
   * 
   * @return true if the order number was successfully set, false if not.
   */
  public void placeCreditCardOrder(Long num) {
    setPaymentMethod(DataConstants.CREDIT_CARD_PAYMENT_METHOD);
    setOrderNumber(num);
  }

  /**
   * Convert a pending Order to a CompositeOrder.
   * 
   * @return a composite order
   */
  CompositeOrder makeCompositeOrder() {
    CompositeInvoice invoice = new CompositeInvoice();
    invoice.set_payment_method(getPaymentMethod());
    return makeCompositeOrder(invoice);
  }

  /**
   * Convert a pending Order to a CompositeOrder.
   * 
   * @param invoice the invoice for the pending order
   * @return the composite order
   */
  CompositeOrder makeCompositeOrder(CompositeInvoice invoice) {
    try {
      CompositeOrder order = new CompositeOrder();
      if (invoice != null)
        order.setInvoice(invoice);
      order.set_order_number(getOrderNumber());
      order.set_orderer_comments(getOrdererComments());
      order.set_ABRC_comments(getABRCComments());
      order.set_ABRC_public_comments(getABRCPublicComments());
      order.set_no_charge(getNoCharge());
      order.set_person(getCompositePerson());
      order.set_organization(getOrganization());
      for (LineItem item : getItems()) {
        TfcLineItem li = new TfcLineItem();
        li.set_status(mapStatus(item.getStatus()));
        li.set_amount(isWaived(item) ? 0f
            : (item.getPrice() * item.getQuantity()));
        li.set_type(mapType(item.getType()));
        if (item.getType().equals(LineItem.Type.STOCK)) {
          Long stock_id = item.getStockId();
          li.set_stock_id(stock_id);
          Stock stock = Stock.getStock(stock_id);
          stock.set_quantity((int)item.getQuantity());
          order.addStock(stock);
          if (isWaived(item) && stock != null)
            stock.set_waive_charge(DataConstants.getReshipNoCharge());
        }
        if (invoice != null)
          invoice.addLineItem(li);
      }
      return order;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  /** Determines if express shipping is mandatory for the Order. 
   * @return */
  public boolean isExpressShippingMandatory() {
    for (LineItem item : getItems(LineItem.Type.STOCK))
      if (Stock.expressShippingRequired(item.getStockId()) && !isWaived(item))
        return true;
    return false;
  }

  /** Determines the express shipping charge. 
   * @return */
  public float getExpressShippingCharge() {
    float charge = 0;
    for (LineItem item : getItems(LineItem.Type.STOCK))
      if (!isWaived(item)) {
        float f = Stock.expressShippingCharge(item.getStockId());
        if (f > charge)
          charge = f;
      }
    int multi = 1;

    BsOrganization _org = getOrganization();
    BsCountry country = null;

    if (_org != null && _org.getCommunity().getAddress() != null) {
      country = _org.getCommunity().getAddress().getCountryObject();
    }

    if (country != null && country.getExpressShippingMultiplier() != null) {
      multi = country.getExpressShippingMultiplier().intValue();
    }

    return charge * multi;
  }

  /** Applies express shipping to the Order. */
  public void applyExpressShipping() {
    for (LineItem item : getItems(LineItem.Type.EXPRESS_SHIPPING))
      removeItem(item);
    if (getExpressShipping() || isExpressShippingMandatory()) {
      float charge = getExpressShippingCharge();
      if (charge > 0) {
        LineItem item = new LineItem();
        item.setType(LineItem.Type.EXPRESS_SHIPPING);
        item.setStatus(LineItem.Status.UNPAID);
        item.setPrice(charge);
        addItem(item);
      }
    }
  }

  /** Applies order charge to the Order. */
  public void applyOrderCharge() {
    for (LineItem item : getItems(LineItem.Type.ORDER_CHARGE)) {
      removeItem(item);
    }
    /*
     * If there are any stock charges, and if there are both seed and DNA stocks
     * in the set of items, apply the order charge and the special order charge.
     * Otherwise, if there are just seed or DNA stocks, apply the order charge.
     */
    if (getTotalStockCharges() > 0) {
      if (seedAndDna()) {
        // Both kinds, add the special order charge.
        addItem(createOrderChargeLineItem(order_charge + special_order_charge));
      } else {
        // Only one kind, don't add the special charge.
        addItem(createOrderChargeLineItem(order_charge));
      }
    }
  }

  /**
   * Create a line item containing a specified order charge
   * @param orderCharge 
   * 
   * @return the new line item
   */
  private LineItem createOrderChargeLineItem(float orderCharge) {
    LineItem item = new LineItem();
    item.setType(LineItem.Type.ORDER_CHARGE);
    item.setStatus(LineItem.Status.UNPAID);
    item.setPrice(orderCharge);
    return item;
  }

  /** Determines the order charge. 
   * @return */
  public float getTotalOrderCharges() {
    if (getNoCharge())
      return 0;
    float total = 0;
    for (LineItem item : getItems())
      if (!isWaived(item))
        total += item.getCharge();
    return total;
  }

  /**
   * Determines the total stock charges (order charge, express shipping are not
   * included).
   * @return 
   */
  public float getTotalStockCharges() {
    if (getNoCharge())
      return 0;
    float total = 0;
    for (LineItem item : getItems(LineItem.Type.STOCK))
      if (!isWaived(item))
        total += item.getCharge();
    return total;
  }

  /**
   * Maps status string used in the pending order system to the status string
   * used in the placed order system.
   * @param status 
   * @return 
   */
  private static String mapStatus(LineItem.Status status) {
    if (LineItem.Status.UNPAID.equals(status))
      return DataConstants.LINE_ITEM_STATUS_UNPAID;
    if (LineItem.Status.UNAVAILABLE.equals(status))
      return DataConstants.UNAVAILABLE_STOCK;
    if (LineItem.Status.AVAILABLE.equals(status))
      return DataConstants.AVAILABLE_STOCK;
    return null;
  }

  /**
   * Maps type string used in the pending order system to the type string used
   * in the placed order system.
   * @param type 
   * @return 
   */
  private static String mapType(LineItem.Type type) {
    if (LineItem.Type.STOCK.equals(type))
      return DataConstants.STOCK_CHARGE_LINE_ITEM;
    if (LineItem.Type.ORDER_CHARGE.equals(type))
      return DataConstants.ORDER_CHARGE_LINE_ITEM;
    if (LineItem.Type.EXPRESS_SHIPPING.equals(type))
      return DataConstants.EXPRESS_SHIPPING_LINE_ITEM;
    return null;
  }

  /** Waive charge for given LineItem. 
   * @param item */
  public void waiveCharge(LineItem item) {
    if (item == null)
      return;
    waive(item);
    applyOrderCharge();
    applyExpressShipping();
  }

  public void setExpressShipping(boolean b) {
    super.setExpressShipping(b);
    applyExpressShipping();
  }

  /**
   * Does the order have any stocks?
   * 
   * @return true if there are stocks, false if not
   */
  public boolean hasStocks() {
    for (LineItem item : getItems())
      if (item.getType().equals(LineItem.Type.STOCK))
        return true;
    return false;
  }

  /**
   * Remove a stock from the order by id.
   * @param ids the list of ids to remove
   */
  public void remove(List<Long> ids) {
    List<LineItem> remove = new ArrayList<LineItem>();
    for (LineItem item : getItems()) {
      Long id = item.getStockId();
      if (id != null && ids.contains(id))
        remove.add(item);
    }
    for (LineItem item : remove)
      removeItem(item);
    applyExpressShipping();
  }

  /**
   * Does the order contain both seed and DNA stock line items?
   * 
   * @return true if there are both kinds of line items, false if not
   */
  private boolean seedAndDna() {
    boolean foundSeed = false;
    boolean foundDna = false;
    for (LineItem item : getItems(LineItem.Type.STOCK)) {
      // Get the stock.
      Stock stock = Stock.getStock(item.getStockId());
      if (stock.is_seed()) {
        foundSeed = true;
      } else {
        foundDna = true;
      }
      if (foundSeed && foundDna) {
        break; // can stop looking now
      }
    }

    return foundSeed && foundDna;
  }

  /**
   * Get the number of DNA-stock line items.
   * 
   * @return the count of DNA-stock line items
   */
  public int getDNAStockCount() {
    int count = 0;
    for (LineItem item : getItems(LineItem.Type.STOCK)) {
      // Get the stock.
      Stock stock = Stock.getStock(item.getStockId());
      if (!stock.is_seed()) {
        count++;
      }
    }
    return count;
  }

  /**
   * Get the number of seed-stock line items.
   * 
   * @return a count of the seed-stock line items
   */
  public int getSeedStockCount() {
    int count = 0;
    for (LineItem item : getItems(LineItem.Type.STOCK)) {
      // Get the stock.
      Stock stock = Stock.getStock(item.getStockId());
      if (stock.is_seed()) {
        count++;
      }
    }
    return count;
  }

  /**
   * Get the total number of stock line items.
   * 
   * @return the number of stock line items
   */
  public int getStockCount() {
    List<LineItem> list = getItems(LineItem.Type.STOCK);
    return list.size();
  }

  /**
   * Get the seed stock center of the organization for the order.
   * 
   * @return the name of the seed stock center
   */
  public String getSeedStockCenter() {
    BsOrganization O = getOrganization();
    if (O == null)
      return "";
    String c = O.getSeedStockCenter();
    if (c == null)
      return "";
    return c;
  }

  /**
   * Get the organization for which the order was placed.
   * 
   * @return an organization
   */
  public BsOrganization getOrganization() {
    BsOrganization organization = null;
    if (getOrgId() != null) {
      OrganizationDelegate delegate =
        CommunityDelegateFactory.getOrganizationDelegate();
      IPrimaryKey key = CommunityFactory.getOrganizationPrimaryKey(getOrgId());
      organization = delegate.getObject((SequencePrimaryKey)key);
    }
    return organization;
  }

  /**
   * Get the full name of the person who placed the order.
   * 
   * @return a name
   */
  public String getPersonFullName() {
    BsPerson person = getCompositePerson();
    if (person != null) {
      full_name = person.getCommunity().getName();
    } else if (full_name == null) {
      getCompositePerson();
      if (person != null) {
        full_name = person.getCommunity().getName();
      } else {
        logger.debug("Couldn't get person for person id " + getPersonId());
      }
    }
    return full_name;
  }

  /**
   * Get the person who placed the order.
   * 
   * @return a person
   */
  public BsPerson getCompositePerson() {
    BsPerson person = null;
    if (getPersonId() != null) {
      PersonDelegate delegate = CommunityDelegateFactory.getPersonDelegate();
      IPrimaryKey key = CommunityFactory.getPersonPrimaryKey(getPersonId());
      person = delegate.getObject((SequencePrimaryKey)key);
    } else {
      throw new RuntimeException("Person id null, cannot get Composite Person");
    }
    return person;
  }

  /**
   * Get the pending payment for the order.
   * 
   * @return a pending payment
   */
  public PendingPayment getPendingPayment() {
    return Storage.getPendingPaymentFor(getOrderNumber());
  }

  /**
   * Get all the pending payments for the order.
   * 
   * @return a List of pending payments
   */
  public List<PendingPayment> getPendingPayments() {
    return Storage.getPendingPaymentsFor(getOrderNumber());
  }
}
