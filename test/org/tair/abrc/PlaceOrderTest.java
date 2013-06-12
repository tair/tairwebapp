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

public class PlaceOrderTest
{
/*
	public static void main(String args[]) {
		try{
			//test_cc(args);
			//test_po(args);
			//test(args);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static void test_po(String args[]) throws Exception {
		LineItem item;
		Long user = 1501415888L;
		Long org = 1001208032L;
		// =============================================================
		System.out.println("*** ADD A STOCK AND PLACE PO");
		Order order = Order.orderInProgress(user,org);
		order.clear();
		for(String stock : Arrays.asList("CS901")){
			item = order.addStockByName(stock);
			System.out.println(item.getStatus() + " ("+item.getStockId()+")");
		}
		order.save();
		CompositeOrder comp = order.placeOrder("ant_test");
		setAllShipped(comp);
		print(order);
		// =============================================================
		String url = "https://orderpagetest.ic3.com/hop/orderform.jsp";
		System.out.println("*** FINALIZE PO");
		Long num = order.getOrderNumber();
		Map<String,String> info = HOPTest.doSale(url, num, order.getOrderTotal());
		System.out.println(info);
		System.out.println(Order.processPaymentInfo(info));
		// =============================================================
		System.out.println("DONE");

	public static void test_cc(String args[]) throws Exception {

		LineItem item;
		Long user = 1501415888L;
		Long org = 1001208032L;
		// =============================================================
		//System.out.println("*** ADD STOCKS AND AUTHORIZE CC");
		Order order = Order.orderInProgress(user);
		order.clear();
		order.setOrgId(org);
		for(String stock : Arrays.asList("CS901","CS1001")){
			item = order.addStockByName(stock);
			System.out.println(item.getStatus() + " ("+item.getStockId()+")");
		}
		order.save();
		order.placeOrder();
		print(order);
		// =============================================================
		String url = "https://orderpagetest.ic3.com/hop/orderform.jsp";
		System.out.println("*** AUTHORIZE CC");
		Long num = order.getOrderNumber();
		Map<String,String> info = HOPTest.doAuthorize(url, num, order.getTotalOrderCharges());
		System.out.println(info);
		System.out.println(Order.processPaymentInfo(info));
		// =============================================================
		System.out.println("DONE");
	}

	public static void print(Order order){
		System.out.println("------------------------------------------------");
		//for(LineItem itemm: order.getItems())
		//	System.out.println(String.format("%12s %10s %20s %20s % 4.2f",itemm.getStockId(), itemm.getName(), itemm.getType(), itemm.getStatus(), itemm.getAmount()));
		System.out.println("------------------------------------------------");
	}

	public static void setAllShipped(CompositeOrder comp) throws Exception {
		DBWriteManager pool = DBWriteManager.getInstance();
		DBconnection conn = pool.get_connection();
		Iterator stockIter = comp.getStocks();
		if(stockIter == null)
			throw new Exception("Null stock iterator");
		Date dateModified = new Date();
		while(stockIter.hasNext()){
			Stock stock = (Stock) stockIter.next();
			stock.set_status("shipped");
			stock.set_order_date_last_modified(dateModified);
			stock.store(conn);
		}
		pool.return_connection(conn);
	}
*/
}
/*
	public static void test(String args[]) throws Exception {

		LineItem item;
		// sample org and user (Aaron Wiig) for testing restricted stock
		//Long user = 2010L;
		//Long org = 1001206493L;
		Long user = 1501415888L; 
		Long org = 1001208032L;
		String stocks[] = {"cs901","foobar","CD2-225","EG1C4","SALK_067070","CS981","CSH9","CD4-11"};

		// =============================================================
		System.out.println("*** ADD A BUNCH OF STOCKS, SOME VALID, SOME NOT, THEN SAVE, STORE, AND PRINT");
		OrderManager.removePending(user,org);
		OrderInProgress oip = OrderManager.getPending(user,org);
		for(String stock : stocks){
			item = OrderManager.addStockToOrder(stock, oip);
			System.out.println(item.status + " ("+item.stock_id+")");
		}
		OrderManager.save(oip);
		oip = OrderManager.getPending(user,org);
		print(oip);
		// =============================================================


		// =============================================================
		System.out.println("*** ADD TWO MORE STOCKS, INCLUDING A DUPLICATE");
		for(String stock : Arrays.asList("cs901","cs1001")){
			item = OrderManager.addStockToOrder(stock, oip);
			System.out.println(item.status + " ("+item.stock_id+")");
		}
		OrderManager.save(oip);
		oip = OrderManager.getPending(user,org);
		print(oip);
		// =============================================================


		// =============================================================
		System.out.println("*** ADD EXPRESS SHIPPING");
		OrderManager.setExpressShipping(oip,true);
		OrderManager.save(oip);
		oip = OrderManager.getPending(user,org);
		print(oip);
		// =============================================================


		// =============================================================
		System.out.println("*** REMOVE EXPRESS SHIPPING");
		OrderManager.setExpressShipping(oip,false);
		OrderManager.save(oip);
		oip = OrderManager.getPending(user,org);
		print(oip);
		// =============================================================


		// =============================================================
		System.out.println("*** USE removePending AND SAVE AN EMPTY ORDER");
		OrderManager.removePending(user,org);
		oip = OrderManager.getPending(user,org);
		OrderManager.save(oip);
		print(oip);
		// =============================================================


		// =============================================================
		System.out.println("*** MANUALLY REMOVE STOCKS AND SAVE AN EMPTY ORDER");
		for(String stock : Arrays.asList("cs901","cs1001")){
			item = OrderManager.addStockToOrder(stock, oip);
			System.out.println(item.status + " ("+item.stock_id+")");
		}
		List<LineItem> rm = new ArrayList<LineItem>();
		oip = OrderManager.getPending(user,org);
		for(LineItem ite: oip.getItems(LineItem.Type.STOCK))
			rm.add(ite);
		for(LineItem ite: rm)
			oip.removeItem(ite);
		OrderManager.save(oip);
		oip = OrderManager.getPending(user,org);
		print(oip);
		// =============================================================


		// =============================================================
		System.out.println("*** ADD A STOCK THAT REQUIRES EXPRESS SHIPPING");
		OrderManager.removePending(user,org);
		oip = OrderManager.getPending(user,org);
		for(String stock : Arrays.asList("CD4-24F")){
			item = OrderManager.addStockToOrder(stock, oip);
			System.out.println(item.status + " ("+item.stock_id+")");
		}
		OrderManager.save(oip);
		oip = OrderManager.getPending(user,org);
		print(oip);
		// =============================================================


		// =============================================================
		System.out.println("*** ADD A STOCK THAT HAS HIGH EXPRESS SHIPPING PRICE");
		OrderManager.removePending(user,org);
		oip = OrderManager.getPending(user,org);
		for(String stock : Arrays.asList("CD4-29")){
			item = OrderManager.addStockToOrder(stock, oip);
			System.out.println(item.status + " ("+item.stock_id+")");
		}
		OrderManager.save(oip);
		oip = OrderManager.getPending(user,org);
		print(oip);
		// =============================================================


		// =============================================================
		System.out.println("*** ADD A STOCK THAT HAS NASC_request = 'T'");
		OrderManager.removePending(user,org);
		oip = OrderManager.getPending(user,org);
		for(String stock : Arrays.asList("CS55057")){
			item = OrderManager.addStockToOrder(stock, oip);
			System.out.println(item.status + " ("+item.stock_id+")");
		}
		OrderManager.save(oip);
		oip = OrderManager.getPending(user,org);
		print(oip);
		System.out.println("NOT IMPLEMENTED");
		// =============================================================


		// =============================================================
		System.out.println("*** ADD A STOCK THAT HAS MTA_signature = 'T'");
		OrderManager.removePending(user,org);
		oip = OrderManager.getPending(user,org);
		for(String stock : Arrays.asList("CS55085")){
			item = OrderManager.addStockToOrder(stock, oip);
			System.out.println(item.status + " ("+item.stock_id+")");
		}
		OrderManager.save(oip);
		oip = OrderManager.getPending(user,org);
		print(oip);
		System.out.println("NOT IMPLEMENTED");
		// =============================================================


		System.out.println("DONE");
	}
*/
