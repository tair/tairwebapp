package org.tair.abrc;

import java.util.*;
//import org.tair.abrc.payment.HOPTest;
//import org.tair.abrc.handler.CyberSourceHandler;
//import org.tair.abrc.order.*;
//import org.tair.abrc.stock.Stock;
//import org.tair.tfc.DatabaseManager;
//import org.tair.tfc.DBWriteManager;
//import org.tair.tfc.DBReadManager;
//import org.tair.tfc.DBconnection;

public class OrderCRUD
{
/*
	public static void main(String args[]) {
		try{
			test_it(args);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static void test_(String args[]) throws Exception
	{
		Long user = 1501415888L;
		Order order = Order.byPersonId(user);
		System.out.println(order);
	}

	public static void test_it(String args[]) throws Exception
	{
		Map map = new HashMap();
		map.put("decision","D");
		map.put("decision_publicSignature","DPS");
		map.put("orderAmount","OA");
		map.put("orderAmount_publicSignature","OAPS");
		map.put("orderCurrency","OC");
		map.put("orderCurrency_publicSignature","OCPS");
		map.put("orderNumber","ON");
		map.put("orderNumber_publicSignature","ONPS");
		map.put("orderPage_requestToken","RT");
		map.put("orderPage_transactionType","TT");
		map.put("requestID", "RID");
		PaymentInfo pay = new PaymentInfo(map);
		//OrderController.savePaymentInfo(pay);
	}

	public static void test_iit(String args[]) throws Exception
	{
		LineItem item;
		Long user = 1501415888L;
		Long org = 1001208032L;

		Order order = new Order();
		order.save();
		System.out.println("*** Blank order, save - id is:" + order.getId());
		// =============================================================
		order.setPersonId(user);
		order.setOrgId(org);
		order.setProxyOrder(true);
		order.setAcceptDisclaimer(true);
		order.save();
		Order o2 = Order.byId(order.getId());
		System.out.println(String.format("*** Save, restore, compare: %s %s %s %s", o2.getAcceptDisclaimer(), o2.getPersonId().equals(user), o2.getOrgId().equals(org), o2.getProxyOrder()));
		// =============================================================
		System.out.println("*** ADD A STOCK AND PLACE PO");
		for(String stock : Arrays.asList("CS901","cs1001")){
			item = order.addStock(stock);
			System.out.println(item.getStatus() + " ("+item.getStockId()+")");
		}
		order.save();
		o2 = Order.byId(order.getId());
		for(LineItem i : o2.getItems())
			System.out.println("  LINE ITEM " + i.getName() + " " + i.getStockId());
		System.out.println("DONE");
	}
*/
}
