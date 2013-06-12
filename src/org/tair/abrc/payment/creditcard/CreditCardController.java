//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.16 $
// $Date: 2006/05/05 16:44:57 $
//------------------------------------------------------------------------------

package org.tair.abrc.payment.creditcard;

import java.sql.*;
import java.util.Map;
import java.util.HashMap;
import java.util.Properties;

import com.cybersource.ws.client.*;
import org.tair.tfc.*;
import org.tair.abrc.CompositeOrder;
import org.tair.abrc.payment.CompositeInvoice;

import org.tair.utilities.WebApp;

/**
 * CreditCardController is the single interface between all ABRC business code
 * and data objects and the Paymentech SDK classes for handling all credit card
 * payment tasks. CreditCardController abstracts Paymentech functions into order
 * maintenance specific tasks by presenting public methods that take ABRC data
 * classes as arguments. These methods then will create and populate a
 * CreditCardInfo instance and call the appropriate method on the
 * CreditCardProcessor class to handle the concrete Paymentech action.
 */

	public class CreditCardController {

	    private static Properties cybsProps = WebApp.getCyberSourceProperties();
	    /**
	     * Retrieves and validates submitted credit card info and sets values for
	     * CreditCardPaymentInfo data object to be used for authorizing charge
	     * through Paymentech services
	     * 
	     * @param requestInfo
	     *            Map containing validated credit card info as submitted through
	     *            web form
	     * @param order
	     *            Order to be paid for
	     * @return Credit card payment info. object populated with validated credit
	     *         card information from form submission along with order info.
	     *         needed for authorizing charge
	     */
	    private static CreditCardPaymentInfo getOrderChargeInfo(Map requestInfo,
	                                                            CompositeOrder order, 
                                                                String authCapture) {
	        // retrieve validated values
	        //String name = (String) requestInfo.get("cardholder_name");
	        String city = (String) requestInfo.get("city");
	        String state = (String) requestInfo.get("region");
	        String zip = (String) requestInfo.get("zip_code");
	        
	        // convert numeric values back to String for submission to Cybersource
	        // except for expMonth and security value where we need it not to be an 
            // integer to keep digits properly padded with leading zeros
	        String securityValue = (String) requestInfo.get("security_value");
	        String expMonth = (String) requestInfo.get("exp_month");

            Integer expYearInt = (Integer) requestInfo.get("exp_year");
	        Long cardNumberLong = (Long) requestInfo.get("card_number");
	        
	        String expYear = expYearInt.toString();
	        String cardNumber = cardNumberLong.toString();
	        
	        // truncate 4 digit year to just keep last two for card exp. date
	        String expDate = expMonth + expYear.substring(2);
	        String amt = "0";
	        
	        CreditCardPaymentInfo info = new CreditCardPaymentInfo();
	        //info.setAVSname(name);
	        info.setAVScity(city);
	        info.setAVSstate(state);
	        info.setAVSzip(zip);
	        info.setCardSecVal(securityValue);
	        info.setExp(expDate);
	        info.setAccountNum(cardNumber);
	        // set order specific info
	        info.setOrderID(order.get_order_number().toString());
	        info.setMessageType(authCapture);
	        
	        // call method to get eligible for payment amount
	        String newAmt = getEligibleAmt( order, amt );
	        
	        //call method for converting amt to string for Paymentech
	        newAmt = convertAmttoString( newAmt );
	        
	        info.setAmount(newAmt);
	        
	        return info;
	    }
	    
	    /**
	     * Converts submitted String to a string with decimals removed This is used
	     * in the Paymentech XML document format i.e., 16.00 becomes 1600. Also,
	     * calculates
	     * 
	     * @param f
	     *            Primitive float to convert to a string
	     * @return String with decimals removed,
	     */
	    private static String convertAmttoString( String amt ) {
	        // convert amt to remove decimal and trailing zeroes and multiply by 100
	        // for
	        // Paymentech to convert on their side
	        // check for total charges if new or eligible for payment if partial
	        // payment is made already
	        double amtDouble = 0.00;
	        int amtInt = 0;
	        String newAmt = null;
	        
	        // call the method to convert amt to a string for Paymentech processing
	        amtDouble = Double.valueOf( amt ).doubleValue();
	        amtDouble = amtDouble * 100;
	        amtInt = (int) amtDouble;
	        newAmt = Integer.toString(amtInt);
	        
	        return newAmt;
	    }
	    
	    /**
	     * This method is used to calculate the eligible amount for payment to
	     * send to Cybersource
	     * 
	     * @param 
	     * @return String, either eligible payment or total charges.
	     */
	    private static String getEligibleAmt( CompositeOrder order, String amt ) {
	        // check to see if a partial payment has been made
	        // if so, use that for the new amt to be charged
	        
	        if ( order.getEligibleForPayment().floatValue() != 0 ) {
	            amt = order.getEligibleForPayment().toString();
	        } else {
	            amt = order.getTotalCharges().toString();
	        }
	        return amt;
	    }
	    
	    
	/**
	* Performs a Capture service request for a single invoice. 
	*
	* @param CompositeInvoice
	*            The previously authorized invoice for which to capture funds for.
	* @param amount
	*            The amount of funds to capture in US dollars.
	* @return CreditCardReply containing data returned from transaction
	*         with remote service including whether authorization succeeded
	*         or was declined.
	*/
	public static CreditCardReply captureOrderPayment(CompositeInvoice invoice, TfcOrders order, Float amt) throws Exception
	{
		if(invoice == null)
			throw new Exception("Null invoice");

		if(order  == null)
			throw new Exception("Null order");

		if(amt == null)
			throw new Exception("Null payment amount");

		CreditCardReply reply = null;
		Map request = new HashMap();
		request.put("ccCaptureService_run","true");
		request.put("merchantReferenceCode",order.get_order_number().toString());
		request.put("ccCaptureService_authRequestID",invoice.get_request_id());
		request.put("ccCaptureService_authRequestToken",invoice.get_request_token());
		request.put("purchaseTotals_currency","USD");
		request.put("purchaseTotals_grandTotalAmount",amt.toString());

		try {
			reply = new CreditCardReply(Client.runTransaction(request,cybsProps));
		} catch (ClientException e) {
			String msg = " - Invoice ID: "+invoice.get_invoice_id();
			throw new Exception(e.getMessage() + msg );
		} catch (FaultException e) {
			String msg = " - Invoice ID: "+invoice.get_invoice_id();
			throw new Exception(e.getMessage() + msg );
		}

		if(reply.errorOccurred()) {
			String msg = " - Invoice ID: "+invoice.get_invoice_id();
			throw new Exception(reply.getMessage() + msg );
		}

		return reply;
	}
	    
	public static void fullVoid(CompositeInvoice invoice) throws Exception
	{
		String token = invoice.get_request_token();
		if(token == null || token.equals(""))
			throw new Exception("ERROR: trying to void an invoice that doesn't have a request token. InvoiceID - "+invoice.get_invoice_id());
		else
			fullVoidCyberSource(invoice);
	}

	private static CreditCardReply fullVoidCyberSource(CompositeInvoice invoice) throws Exception
	{
		if(invoice == null)
			throw new Exception("Null invoice");

		DBconnection conn = null;
		DBReadManager pool = null;
        CreditCardReply reply = null;
		Map request = new HashMap();

		try {
			pool = DBReadManager.getInstance();
			conn = pool.get_connection();
			Long orderNum = TfcInvoice.translateOrdersNumber(conn,invoice.get_orders_id());
			request.put("merchantReferenceCode",orderNum.toString());
			request.put("voidService_run","true");
			request.put("voidService_voidRequestID",invoice.get_request_id());
			request.put("voidService_voidRequestToken",invoice.get_request_token());
			reply = new CreditCardReply(Client.runTransaction(request,cybsProps));
		} catch (ClientException e) {
			String msg = " - Invoice ID: "+invoice.get_invoice_id();
			throw new Exception(e.getMessage() + msg );
		} catch (FaultException e) {
			String msg = " - Invoice ID: "+invoice.get_invoice_id();
			throw new Exception(e.getMessage() + msg );
		} catch (SQLException e) {
			String msg = " - Invoice ID: "+invoice.get_invoice_id();
			throw new Exception(e.getMessage() + msg );
		}
		finally{pool.return_connection(conn);}

		if(reply.errorOccurred()) {
			String msg = " - Invoice ID: "+invoice.get_invoice_id();
			throw new Exception(reply.getMessage() + msg );
		}

		return reply;
	}

}
