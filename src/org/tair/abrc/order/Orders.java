// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc.order;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.jboss.logging.Logger;
import org.tair.abrc.CompositeOrder;
import org.tair.abrc.OrderEmailHandler;
import org.tair.abrc.payment.CompositeInvoice;
import org.tair.abrc.payment.HOP;
import org.tair.abrc.stock.ListStock;
import org.tair.tfc.TfcOrderNumber;
import org.tair.tfc.TfcPayment;
import org.tair.utilities.DataConstants;

public class Orders
{
  
  private static final Logger logger = Logger.getLogger(Orders.class);
  
	/** Retrieve an Order by order id. */
	public static Order byId(Long id) {
		return Storage.orderDataById(id);
	}

	/** Retrieve an Order by person id.
	  * If the person already has an order in the system, that order
	  * will be returned, otherwise a new order will be created.
	  */
	public static Order byPersonId(BigInteger id) {
		return Storage.orderDataByPersonId(id);
	}

	/** Retrieve an Order by person id and make it ready to be a proxy order. */
	public static Order proxyOrder(BigInteger pid) {
		Order order = Storage.proxyOrderDataByPersonId(pid);
		if(order == null)
			order = new Order(pid);
		order.setProxyOrder(true);
		Storage.save(order);
		return order;
	}

	/** Retrieve all pending Orders. */
	public static List<Order> pendingOrders() {
		return Storage.getOrdersSortedByLastChanged();
	}

	/** Removes a person's pending Order from the system. */
	public static void removePersonOrder(BigInteger pid) {
		Order o = Storage.orderDataByPersonId(pid);
		if(o != null) Storage.delete(o);
	}

	public static void removePendingOrder(Order o) {
		if(o != null) Storage.delete(o);
	}

	public static boolean hasPaymentError(CompositeOrder order)
	{
		if(order == null) return false;
		Long num = order.get_order_number();
		PendingPayment pay = Storage.getLatestPendingPaymentFor(num);
		return pay != null && "ERROR".equals(pay.getStatus());
	}

	public static boolean readyForPayment(CompositeOrder order)
	{
		if(order == null || !order.hasInvoice()) return false;
		CompositeInvoice invoice = order.getInvoice();
		if(invoice == null || !invoice.hasBalanceDue()) return false;
		if(!invoice.get_payment_method().equals(DataConstants.getPurchaseOrderPaymentMethod())) return false;
		return true;
	}

	public static boolean paymentInProgress(Order order)
	{
		if(order == null) return false;
		return null != Storage.getPendingPaymentFor(order.getOrderNumber());
	}

	public static boolean paymentInProgress(CompositeOrder order)
	{
		if(order == null) return false;
		return null != Storage.getPendingPaymentFor(order.get_order_number());
	}

	/** Retrieves the Date the order was last changed. */
	public static Date getDateLastChanged(Long order_id){
		return Storage.getDateLastChanged(order_id);
	}

	/** Retrieves a List of orders recently ordered be the specified organization. */
	public static List<ListStock> recentlyOrdered(BigInteger org_id)
	{
		GregorianCalendar now = new GregorianCalendar();
		now.add(Calendar.DAY_OF_YEAR, -60);
		return Storage.recentlyOrdered(org_id, now.getTime());
	}

	/** Retrieves the PaymentInfo by order number. */
	public static Payment getPaymentInfo(Long num)
	{
		return Storage.getPaymentInfo(num);
	}

	public static void cancelPendingPaymentsFor(Long num)
	{
		for(PendingPayment p : Storage.getPendingPaymentsFor(num))
			if(p.getStatus().equals("PENDING")){
				p.setStatus("CANCELLED");
				p.save();
			}
	}

  public static CompositeOrder processPendingPayment(Payment pmt) {
    CompositeOrder order = null;
    if (pmt != null) {
      Long orderNumber = new Long(pmt.orderNumber);
      PendingPayment pending = Storage.getPendingPaymentFor(orderNumber);
      List<Payment> payments = Arrays.asList(pmt);

      if ("sale".equals(pmt.orderPage_transactionType)) {
        order = CompositeOrder.byOrderNumber(orderNumber);
      } else if ("authorization".equals(pmt.orderPage_transactionType)) {
        order = getOrder(orderNumber).makeCompositeOrder();
      }

      if (order != null) {
        order = _processPendingPayment(order, pending, payments);
        if (order != null && order.get_orders_id() != null) {
          Storage.delete(getOrder(orderNumber));
        }
      }
    }
    return order;
  }

	public static CompositeOrder processPendingPayment(Order order)
	{
		CompositeOrder comp = order.makeCompositeOrder();
		if (comp != null) {
		  comp = processPendingPayment(comp);
		  if(comp != null && comp.get_orders_id() != null) {
			Storage.delete(order);
		  }
		}
		return comp;
	}

	public static CompositeOrder processPendingPayment(CompositeOrder order)
	{
		logger.debug("Processing pending payment for order number " + order.get_order_number());
		PendingPayment pending = Storage.getPendingPaymentFor(order.get_order_number());
		if(pending == null){
		  logger.debug("Pending payment list is null for order " + order.get_order_number());
			return order;
		}
		List<Payment> payments = pending.getPayments();
		if(payments.size() == 0){
		  logger.debug("Payment list is empty for order number " + order.get_order_number());
			return order;
		}
		return _processPendingPayment(order, pending, payments);
	}

  /**
   * Implements the process-pending-payment functionality. If the order is not
   * null, the method processes payments, then loops through the processed
   * payments and stores all payments with result ACCEPT_DECISION, then sends
   * confirmation email to the user/pi who placed the order.
   * @param order
   * @param pending
   * @param payments
   * @return
   */
  public static CompositeOrder _processPendingPayment(CompositeOrder order,
                                                      PendingPayment pending,
                                                      List<Payment> payments) {
    if (order != null)
      try {
        for (ProcessedPayment pp : processPayments(order, payments))
          if (PaymentResult.ACCEPT_DECISION.equals(pp.getPaymentResult())) {
            store(order, pending, pp.getPaymentResult(), pp.getTfcPayment());
            // If no error in storing and not paying purchase order,
            // send confirmation email.
            try {
              boolean isPurchaseOrder = 
                order.getInvoice().get_payment_method().equalsIgnoreCase(DataConstants.PURCHASE_ORDER_PAYMENT_METHOD);
              if (!isPurchaseOrder)
              OrderEmailHandler.sendOrderConfirmation(order);
            } catch (Throwable e) {
              // Log and proceed.
              logger.warn("Proceeding with processed payment despite not sending confirmation email.", e);
            }
          }
      } catch (Throwable t) {
        // Something threw an exception, log it and continue on.
        logger.error("Error while processing order pending payment for order " + 
                     order.get_order_number(), t);
      }
    return order;
  }

	public static List<ProcessedPayment> processPayments(CompositeOrder order, List<Payment> payments)
	{
		List<ProcessedPayment> pplist = new ArrayList<ProcessedPayment>();
		for(Payment info : payments)
			pplist.add(makePayment(order,info));
		return pplist;
	}

	/** Process credit card or purchase order payment info and return the result. */
	static private ProcessedPayment makePayment(CompositeOrder order, Payment pmt)
	{
		if("sale".equals(pmt.orderPage_transactionType))
			return processPO(order, pmt);
		if("authorization".equals(pmt.orderPage_transactionType))
			return processCC(order, pmt);
		return new ProcessedPayment(PaymentResult.BAD_TRANS_TYPE);
	}

  /** Process purchase order (sale) payment info. */
  /**
   * @param order
   * @param pmt
   * @return
   */
  static ProcessedPayment processPO(CompositeOrder order, Payment pmt) {
    ProcessedPayment processedPayment = null;
    try {
      PaymentResult result = verifyPaymentInfo(order, pmt);
      processedPayment = new ProcessedPayment(result);
      processedPayment.setCompositeOrder(order);
      if (result.equals(PaymentResult.ACCEPT_DECISION)) {
        Float paymentTotal = order.getEligibleForPayment();
        if (!paymentTotal.equals(new Float(pmt.orderAmount))) {
          throw new RuntimeException("Order charge amount discrepancy.");
        }
        TfcPayment payment = new TfcPayment();
        payment.set_type("online_credit_card");
        payment.set_amount(paymentTotal);
        payment.set_payment_date(new java.util.Date());
        payment.set_payment_ref_id(pmt.requestID);
        payment.set_request_token(pmt.orderPage_requestToken);
        processedPayment.setTfcPayment(payment);
      }
    } catch (Throwable e) {
      logger.error("Error processing purchase order payment for order number "
                   + order.get_order_number(), e);
      processedPayment = new ProcessedPayment(PaymentResult.ERROR);
    }
    return processedPayment;
  }

  /** Process credit card (authorize) payment info. */
  static ProcessedPayment processCC(CompositeOrder order, Payment pmt) {
    ProcessedPayment payment = null;
    try {
      Long order_number = new Long(pmt.orderNumber);
      if (!order_number.equals(order.get_order_number())) {
        payment = new ProcessedPayment(PaymentResult.ERROR);
      } else if (order == null) {
        payment = new ProcessedPayment(PaymentResult.CONVERSION_ERROR);
      } else {
        PaymentResult result = verifyPaymentInfo(order, pmt);
        payment = new ProcessedPayment(result);
        payment.setCompositeOrder(order);
        if (result.equals(PaymentResult.ACCEPT_DECISION)) {
          CompositeInvoice invoice = order.getInvoice();
          invoice.set_payment_ref_id(pmt.requestID);
          invoice.set_request_token(pmt.orderPage_requestToken);
          invoice.set_auth_amount(new Float(pmt.orderAmount));
          invoice.set_payment_method(DataConstants.CREDIT_CARD_PAYMENT_METHOD);
        }
      }
    } catch (Exception e) {
      logger.error("Error processing credit card payment for order number " + 
                   order.get_order_number(), e);
      payment = new ProcessedPayment(PaymentResult.ERROR);
    }

    return payment;
  }

	/** Verifies payment info signatures and decision. */
	private static PaymentResult verifyPaymentInfo(CompositeOrder order, Payment pmt)
	{
		if(pmt.checkSignatures() && !verifySigs(pmt))
			return PaymentResult.BAD_SIGNATURE;
		try{ new Float(pmt.orderAmount); }
		catch(Exception e){return PaymentResult.BAD_AUTH_AMOUNT;}
		if(!order.hasStocks())
			return PaymentResult.NO_STOCKS_IN_ORDER;
		if("REJECT".equals(pmt.decision))
			return PaymentResult.REJECT_DECISION;
		if("REVIEW".equals(pmt.decision))
			return PaymentResult.REVIEW_DECISION;
		if("ACCEPT".equals(pmt.decision))
			return PaymentResult.ACCEPT_DECISION;
		return PaymentResult.BAD_DECISION;
	}

	/** Verifies public signatures given a PaymentInfo object. */
	private static boolean verifySigs(Payment pmt) {
		return HOP.verifySignature(pmt.orderCurrency, pmt.orderCurrency_publicSignature) &&
		       HOP.verifySignature(pmt.orderNumber, pmt.orderNumber_publicSignature) &&
		       HOP.verifySignature(pmt.orderAmount, pmt.orderAmount_publicSignature) &&
		       HOP.verifySignature(pmt.decision, pmt.decision_publicSignature);
	}

	static void store(CompositeOrder order, PendingPayment pending, PaymentResult result, TfcPayment payment)
	{
		try {
			boolean save_success = false;
			if(payment == null)
				save_success = Storage.save(order);
			else
				save_success = Storage.save(order, payment);
			if(save_success && pending != null && result != null) {
				pending.setStatus(result.toString());
				pending.save();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static Order getOrder(Long num){
		return Storage.orderDataByNumber(num);
	}

	public static boolean save(Order order){
		return Storage.save(order);
	}

	public static void delete(Order order){
		Storage.delete(order);
	}

	/** Places an order without creating an invoice.
	  * This method is for placing an order that has no charges (usually this is a proxy order).
	  * A CompositeOrder is created and saved. No CompositeInvoice is created. The pending order
	  * is deleted from the system.
	  * @return A CompositeOrder or null if there is an order charge or if a CompositeOrder could not be created.
	 * @throws Exception 
	  */
	public static CompositeOrder placeOrder(Order o) throws Exception
	{
		if(o == null) return null;
		// All charges must be waived.
		if(o.getTotalOrderCharges() > 0) return null;
		CompositeOrder order = o.makeCompositeOrder(null);
		if(order == null) return null;
		Storage.save(order);
		o.setOrderNumber(order.get_order_number());
		OrderEmailHandler.sendOrderConfirmation(order);
		return order;
	}

	public static CompositeOrder placePurchaseOrder(Order o, String po_number) throws Exception
	{
		if(o == null || po_number == null)
			return null;
		CompositeOrder order = o.placePurchaseOrder(po_number);
		if(order == null)
			return null;
		Storage.save(order);
		if(order.get_orders_id() == null)
			return null;
		Storage.delete(o);
		o.setOrderNumber(order.get_order_number());
		return order;
	}

	/** Place a credit card order.
	  * This method retrieves the next order number from the OrderNumber table,
	  * sets the order_number, and saves the pending Order.
	  * @return true if the order number was successfully set, false if not.
	  */
	public static boolean placeCreditCardOrder(Order o)
	{
		if(o == null) return false;
		Long num = o.getOrderNumber();
		if(num == null || num.longValue() == 0){
			num = TfcOrderNumber.getNextOrderNumber();
			if(num == null) return false;
		}
		o.placeCreditCardOrder(num);
		return save(o);
	}
	public static boolean purgeAbandonedOrders( int number) throws Exception
	{
		return Storage.purgeAbandonedOrders(number);
	}
	public static boolean purgeOrder (Order o ) throws Exception
	{
		if (o == null) { return false; }
		Long num = o.getOrderNumber();
		return Storage.purgeOrder( num );
	}
}
