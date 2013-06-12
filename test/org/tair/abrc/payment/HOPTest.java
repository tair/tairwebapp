package org.tair.abrc.payment;

import java.io.*;
import java.net.*;
import java.util.*;
import java.util.regex.*;

public class HOPTest
{
	public static void doSale(String cyb_url, Long order_number, Float amount) throws Exception {
		String action = getPaymentFormAction(cyb_url, "sale", order_number, amount);
		Thread.sleep(2000); // A pause to simulate filling out the form. (Yes, this is exercising an abundance of caution).
		if(action != null && !action.equals(""))
			submitPaymentForm(action);
	}

	public static void doAuthorize(String cyb_url, Long order_number, Float amount) throws Exception {
		String action = getPaymentFormAction(cyb_url, "authorization", order_number, amount);
		Thread.sleep(2000); // A pause to simulate filling out the form. (Yes, this is exercising an abundance of caution).
		if(action != null && !action.equals(""))
			submitPaymentForm(action);
	}

	/**
	 * Request the HOP and parse out the action attribute of the payment form.
	 * @return A string that is the action of the payment form.
	 */
	private static String getPaymentFormAction(String cyb_url, String type, Long order_number, Float amountf) throws Exception {

		String currency = "usd";
		String amount = amountf != null ? amountf.toString() : "0.00";
		String time = String.valueOf(System.currentTimeMillis());
		String merchantID = HOP.getMerchantID();
		String publicDigest = HOP.getPublicDigest(merchantID + amount + currency + time);
		String serialNumber = HOP.getSerialNumber();

		Map<String,String> params = new HashMap<String,String>();
		params.put("amount", amount);
		params.put("currency", currency);
		params.put("merchantID", merchantID);
		params.put("orderPage_timestamp", time);
		params.put("orderPage_signaturePublic", publicDigest);
		params.put("orderPage_transactionType", type);
		params.put("orderPage_serialNumber", serialNumber);
		params.put("orderPage_version", "4");
		params.put("orderNumber", order_number.toString());

		URL url = new URL(cyb_url);
		URLConnection conn = url.openConnection();
		post(conn, params);

		String line;
		Matcher match;
		Pattern pat = Pattern.compile("action=\\\"(.+?jsessionid.+?)\\\"");
		BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		while((line = rd.readLine()) != null){
			match = pat.matcher(line);
			if(match.find()){
				System.out.println(line);
				return url.getProtocol() + "://" + url.getHost() + match.group(1);
			}
		}

		return "";
	}

	public static void submitPaymentForm(String action) throws Exception {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.YEAR, 1);

		// The parameters here were pulled from org.tair.abrc.payment.HOP, The billing
		// information is not checked by CyberSource (we have configured our HOP to do no
		// verification), so the billing info submitted will be for a mock user.
		Map<String,String> params = new HashMap<String,String>();
		params.put("displayCVV", "[001, 002]");
		params.put("requireCVV", "[001, 002]");
		params.put("merchantID", HOP.getMerchantID());
		params.put("paymentOption", "card");
		params.put("card_accountNumber", "4200000000000000");
		params.put("card_cvNumber", "111");
		params.put("billTo_firstName", "MOCK");
		params.put("billTo_lastName", "MOCK");
		params.put("billTo_company", "MOCK");
		params.put("billTo_street1", "MOCK");
		params.put("billTo_street2", "MOCK");
		params.put("billTo_city", "Stanford");
		params.put("billTo_state", "CA");
		params.put("billTo_postalCode", "94305");
		params.put("billTo_country", "us");
		params.put("card_expirationMonth", "01");
		params.put("card_expirationYear", Integer.toString(c.get(Calendar.YEAR)));
		params.put("card_cardType", "001"); // VISA credit card

		URL url = new URL(action);
		URLConnection conn = url.openConnection();
		post(conn, params);

		InputStream is = conn.getInputStream();
		while(is.read() != -1);
		is.close();
	}

	private static void post(URLConnection conn, Map<String,String> params) throws Exception {
		int p = params.size();
		conn.setDoOutput(true);
		OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		for(String key: params.keySet())
			wr.write(URLEncoder.encode(key, "UTF-8") + "=" + URLEncoder.encode(params.get(key), "UTF-8") + ((--p>0)?"&":""));
		wr.flush();
		wr.close();
	}
}
