// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc.order;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.tair.abrc.CompositeOrder;
import org.tair.abrc.payment.CompositeInvoice;
import org.tair.abrc.stock.ListStock;
import org.tair.db.DB;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcLineItem;
import org.tair.tfc.TfcPayment;
import org.tair.utilities.DataConstants;
import org.tair.utilities.TextConverter;
public class Storage
{
    private static final Logger logger = Logger.getLogger(Storage.class);
	/*
	* made this a public method so that we can check db to see if order session's and 
	* order in db match in OrderBuilder
	*/
	public static Order orderDataById(Long id) {
		return id == null ? null : orderData("pending_order_id = ?", new BigInteger(id.toString()));
	}

	static Order orderDataByPersonId(BigInteger id) {
		return id == null ? null : orderData("person_id = ? AND proxy = 'F'", id);
	}

	static Order orderDataByNumber(Long num) {
		return num == null ? null : orderData("order_number = ?", new BigInteger(num.toString()));
	}

	static Order proxyOrderDataByPersonId(BigInteger id) {
		return id == null ? null : orderData("person_id = ? AND proxy = 'T'", id);
	}

	private static Order orderData(String clause, BigInteger param)
	{
		Order order = null;
		DBconnection conn = DB.getRead();
		try {
			conn.setQuery("SELECT * FROM "+ Const.PENDING_ORDER_TABLE +" WHERE " + clause);
			conn.setQueryVariable(1, param);
			ResultSet rs = conn.getResultSet();
			if(rs.next())
				order = loadOrderData(conn, rs);
		} catch(Exception e) {
			e.printStackTrace();
		}
		DB.release(conn);
		return order;
	}

	/** Load an Order from the ResultSet, query the database for the LineItems for that order, and load them. */
	private static Order loadOrderData(DBconnection conn, ResultSet rs) throws SQLException
	{
		Order order = getOrderData(rs);
		conn.setQuery(String.format("SELECT * FROM %s WHERE pending_order_id = ?", Const.PENDING_LINE_ITEM_TABLE));
		conn.setQueryVariable(1, order.getId());
		loadLineItems(order, getLineItems(conn.getResultSet()));
		return order;
	}

	private static Order getOrderData(ResultSet rs) throws SQLException
	{
		BigInteger pid = getBigIntegerOrNull(rs,"person_id");
		Order order = new Order(pid);
		order.setId(rs.getLong("pending_order_id"));
		order.setOrgId(getBigIntegerOrNull(rs,"organization_id"));
		order.setOrdererComments(rs.getString("orderer_comments"));
		order.setABRCComments(rs.getString("ABRC_comments"));
		order.setABRCPublicComments(rs.getString("ABRC_public_comments"));
		order.setAcceptDisclaimer(TextConverter.stringToBoolean(rs.getString("accept_disclaimer")));
		order.setNoCharge(TextConverter.stringToBoolean(rs.getString("no_charge")));
		order.setProxyOrder(TextConverter.stringToBoolean(rs.getString("proxy")));
		order.setPaymentMethod(rs.getString("payment_method"));
		order.setOrderNumber(getLongOrNull(rs,"order_number"));
		order.setDateLastChanged(getDateOrNull(rs,"last_changed"));
		return order;
	}

	private static List<LineItemDTO> getLineItems(ResultSet rs) throws SQLException
	{
		List<LineItemDTO> items = new ArrayList<LineItemDTO>();
		while(rs.next()){
			LineItemDTO dto = new LineItemDTO();
			dto.setPendingOrderId(rs.getLong("pending_order_id"));
			dto.setStockType(rs.getString("stock_type"));
			dto.setQuantity(rs.getLong("quantity"));
			dto.setMutable(rs.getString("mutable"));
			dto.setStockId(getLongOrNull(rs, "stock_id"));
			dto.setAmount(rs.getFloat("amount"));
			dto.setStatus(rs.getString("status"));
			dto.setWaived(rs.getString("waived"));
			dto.setName(rs.getString("name"));
			dto.setType(rs.getString("lineitem_type"));
			items.add(dto);
		}
		return items;
	}

	private static void loadLineItems(OrderData order, List<LineItemDTO> items)
	{
		for(LineItemDTO dto : items)
		{
			LineItem li = new LineItem();
			li.setStockId(dto.getStockId());
			li.setStatus(dto.getStatus());
			li.setPrice(dto.getAmount());
			li.setName(dto.getName());
			li.setType(dto.getType());
			li.setStockType(dto.getStockType());
			li.setMutableQuantity(TextConverter.stringToBoolean(dto.getMutable()));
			li.setQuantity(dto.getQuantity());
			order.addItem(li);
			if(TextConverter.stringToBoolean(dto.getWaived()))
				order.waive(li);
			if(li.getType().equals(LineItem.Type.EXPRESS_SHIPPING))
				order.setExpressShipping(true);
		}
	}

	static List<Order> getOrdersSortedByLastChanged(){
		return getOrders("ORDER BY last_changed DESC");
	}

	static List<Order> getOrders(String sql)
	{
		List<Order> orders = new ArrayList<Order>();
		DBconnection conn = DB.getRead();
		try {

			conn.setQuery("SELECT * FROM " + Const.PENDING_LINE_ITEM_TABLE);
			Map<Long,List<LineItemDTO>> all = new HashMap<Long,List<LineItemDTO>>();
			for(LineItemDTO item : getLineItems(conn.getResultSet())){
				if(!all.containsKey(item.getPendingOrderId()))
					all.put(item.getPendingOrderId(), new ArrayList<LineItemDTO>());
				all.get(item.getPendingOrderId()).add(item);
			}

			conn.setQuery("SELECT * FROM "+ Const.PENDING_ORDER_TABLE + " " + sql);
			ResultSet rs = conn.getResultSet();
			while(rs.next())
				try{
					Order order = getOrderData(rs);
					List<LineItemDTO> items = all.get(order.getId());
					if(items == null) items = Collections.emptyList();
					loadLineItems(order, items);
					orders.add(order);
				} catch(Exception e) {e.printStackTrace();}
		} catch(Exception e) {
			e.printStackTrace();
		}
		DB.release(conn);
		return orders;
	}

	private static void updateOrder(OrderData order, DBconnection conn) throws Exception
	{
		Long id = order.getId();
		Long order_num = order.getOrderNumber();
		BigInteger person_id = order.getPersonId();
		BigInteger org_id = order.getOrgId();
		String comm_orderer = order.getOrdererComments();
		String comm_abrc = order.getABRCComments();
		String comm_pub = order.getABRCPublicComments();
		String method = order.getPaymentMethod();
		boolean proxy = order.getProxyOrder();
		boolean no_charge = order.getNoCharge();
		boolean accept = order.getAcceptDisclaimer();
		String COLUMNS = "organization_id=?,orderer_comments=?,ABRC_comments=?,ABRC_public_comments=?,no_charge=?,person_id=?,payment_method=?,order_number=?,accept_disclaimer=?,proxy=?,last_changed=?";
		conn.setQuery("UPDATE " + Const.PENDING_ORDER_TABLE + " SET " + COLUMNS + " WHERE pending_order_id = ?");
		if(org_id == null) conn.setNullLongQueryVariable(1);
		else conn.setQueryVariable(1, org_id);
		if(comm_orderer == null) conn.setNullStringQueryVariable(2);
		else conn.setQueryVariable(2, comm_orderer);
		if(comm_abrc == null) conn.setNullStringQueryVariable(3);
		else conn.setQueryVariable(3, comm_abrc);
		if(comm_pub == null) conn.setNullStringQueryVariable(4);
		else conn.setQueryVariable(4, comm_pub);
		conn.setQueryVariable(5, TextConverter.booleanToString(no_charge));
		conn.setQueryVariable(6, person_id);
		conn.setQueryVariable(7, method);
		if(order_num == null) conn.setNullIntQueryVariable(8);
		else conn.setQueryVariable(8, order_num);
		conn.setQueryVariable(9, TextConverter.booleanToString(accept));
		conn.setQueryVariable(10, TextConverter.booleanToString(proxy));
		conn.setQueryVariable(11, order.getDateLastChanged());
		conn.setQueryVariable(12, id);
		conn.executeUpdate();
	}

	private static Long insertOrder(OrderData order, DBconnection conn) throws Exception
	{
		Long order_num = order.getOrderNumber();
		BigInteger person_id = order.getPersonId();
		BigInteger org_id = order.getOrgId();
		String comm_orderer = order.getOrdererComments();
		String comm_abrc = order.getABRCComments();
		String comm_pub = order.getABRCPublicComments();
		String method = order.getPaymentMethod();
		boolean proxy = order.getProxyOrder();
		boolean no_charge = order.getNoCharge();
		boolean accept = order.getAcceptDisclaimer();
		String COLUMNS = "pending_order_id, organization_id,orderer_comments,ABRC_comments,ABRC_public_comments,no_charge,person_id,payment_method,order_number,accept_disclaimer,proxy,last_changed";
		conn.setInsertQuery("INSERT INTO "+ Const.PENDING_ORDER_TABLE +" (" + COLUMNS + ") VALUES (PENDINGORDER_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?)", "PENDING_ORDER_ID");
		if(org_id == null) conn.setNullLongQueryVariable(1);
		else conn.setQueryVariable(1, org_id);
		if(comm_orderer == null) conn.setNullStringQueryVariable(2);
		else conn.setQueryVariable(2, comm_orderer);
		if(comm_abrc == null) conn.setNullStringQueryVariable(3);
		else conn.setQueryVariable(3, comm_abrc);
		if(comm_pub == null) conn.setNullStringQueryVariable(4);
		else conn.setQueryVariable(4, comm_pub);
		conn.setQueryVariable(5, TextConverter.booleanToString(no_charge));
		if(person_id == null) conn.setNullLongQueryVariable(6);
		else conn.setQueryVariable(6, person_id);
		conn.setQueryVariable(7, method);
		if(order_num == null) conn.setNullIntQueryVariable(8);
		else conn.setQueryVariable(8, order_num);
		conn.setQueryVariable(9, TextConverter.booleanToString(accept));
		conn.setQueryVariable(10, TextConverter.booleanToString(proxy));
		conn.setQueryVariable(11, order.getDateLastChanged());
		//ResultSet rs = conn.getResultSet();
		return conn.executeInsert();
		//return rs.next() ? rs.getLong(1) : null;
	}

	static boolean delete(OrderData order)
	{
		if(order == null || order.getId() == null)
			return false;
		DBconnection conn = DB.getWrite();
		try {
			conn.setQuery("DELETE FROM "+ Const.PENDING_LINE_ITEM_TABLE +" WHERE pending_order_id = ?");
			conn.setQueryVariable(1, order.getId());
			conn.executeUpdate();
			conn.setQuery("DELETE FROM "+ Const.PENDING_ORDER_TABLE +" WHERE pending_order_id = ?");
			conn.setQueryVariable(1, order.getId());
			conn.executeUpdate();
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			DB.release(conn);
		}
	}

	static boolean save(OrderData order)
	{
		DBconnection conn = DB.getWrite();
		try {
			if(!conn.autoCommit(true))
				return false;
			Date now = new Date();
			order.setDateLastChanged(now);
			if(order.getId() == null)
				order.setId(insertOrder(order, conn));
			else
				updateOrder(order, conn);
			saveLineItems(order, conn);
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			conn.autoCommit(false);
			DB.release(conn);
		}
	}

	private static void saveLineItems(OrderData order, DBconnection conn) throws SQLException
	{
		conn.setQuery("DELETE FROM "+ Const.PENDING_LINE_ITEM_TABLE +" WHERE pending_order_id = ?");
		conn.setQueryVariable(1, order.getId());
		conn.executeUpdate();

		conn.setQuery("INSERT INTO "+ Const.PENDING_LINE_ITEM_TABLE +" (pending_order_id, stock_id, name, status, lineitem_type, amount, stock_type, waived, mutable, quantity) VALUES (?,?,?,?,?,?,?,?,?,?)");
		conn.setQueryVariable(1, order.getId());
		for(LineItem item: order.getItems()){
			Long stock_id = item.getStockId();
			if(stock_id == null) conn.setNullIntQueryVariable(2);
			else conn.setQueryVariable(2, stock_id);
			conn.setQueryVariable(3, item.getName());
			conn.setQueryVariable(4, item.getStatus().toString());
			conn.setQueryVariable(5, item.getType().toString());
			conn.setQueryVariable(6, item.getPrice());
			conn.setQueryVariable(7, item.getStockType());
			conn.setQueryVariable(8, TextConverter.booleanToString(order.isWaived(item)));
			conn.setQueryVariable(9, TextConverter.booleanToString(item.getMutableQuantity()));
			conn.setQueryVariable(10,item.getQuantity());
			conn.executeUpdate();
		}
	}

	@SuppressWarnings("unchecked")
  static boolean save(CompositeOrder order, TfcPayment payment) throws Exception
	{
		DBconnection conn = DB.getWrite();
		try {
			conn.remove_auto_commit_mode();
			payment.store(conn);
			Iterator iter = order.getEligibleForPaymentLineItems();
			TfcLineItem item = null;
			if(iter != null) while(iter.hasNext()) {
				item = (TfcLineItem) iter.next();
				Float f = item.get_amount();
				if(f != null && f > 0){
					item.set_status("paid");
					item.set_payment_id(payment.get_payment_id());
				}
			}
			CompositeInvoice invoice = order.getInvoice();
			if(!invoice.hasBalanceDue())
				invoice.set_status("paid_in_full");
			order.store(conn, false);
			conn.commit();
			return true;
		} catch(Exception e) {
			if(order != null) order.set_orders_id(null);
			conn.rollback();
			e.printStackTrace();
		} finally {
			try { conn.set_auto_commit_mode(); } catch(Exception e) {}
			DB.release(conn);
		}
		return false;
	}

	@SuppressWarnings("unchecked")
  static Payment loadPaymentInfo(ResultSet rs) throws SQLException
	{
		Map m = new HashMap();
		m.put("decision", rs.getString("decision"));
		m.put("requestID", rs.getString("requestID"));
		m.put("orderNumber", rs.getString("orderNumber"));
		m.put("orderAmount", rs.getString("orderAmount"));
		m.put("orderCurrency", rs.getString("orderCurrency"));
		m.put("orderPage_requestToken", rs.getString("orderPage_requestToken"));
		m.put("decision_publicSignature", rs.getString("decision_publicSignature"));
		m.put("orderPage_transactionType", rs.getString("orderPage_transactionType"));
		m.put("orderAmount_publicSignature", rs.getString("orderAmount_publicSignature"));
		m.put("orderNumber_publicSignature", rs.getString("orderNumber_publicSignature"));
		m.put("orderCurrency_publicSignature", rs.getString("orderCurrency_publicSignature"));
		return new Payment(m);
	}

	static PendingPayment loadPendingPayment(ResultSet rs) throws SQLException
	{
		return new PendingPayment(rs.getLong("id"),rs.getLong("order_number"),rs.getString("token"),rs.getString("status"));
	}

	static List<ListStock> recentlyOrdered(BigInteger org_id, Date start)
	{
		if(org_id == null || start == null) return Collections.emptyList();
		String query = "SELECT os.orders_id, s.stock_id " +
		               "  FROM Orders_Stock os, Orders o, Stock s " +
		               " WHERE os.orders_id = o.orders_id " +
		               "   AND os.stock_id = s.stock_id " +
		               "   AND o.organization_id = ? " +
		               "   AND o.order_date >= TO_DATE(?, 'mm/dd/yyyy') " +
		               "   AND ( os.waive_charge != ? OR os.waive_charge is null ) " +
		               "   AND o.status != ? " +
		               " ORDER BY s.name, o.order_date";
		List<ListStock> recent = new ArrayList<ListStock>();
		DBconnection conn = DB.getRead();
		try {
			conn.setQuery(query);
			conn.setQueryVariable(1, org_id);
			conn.setQueryVariable(2, TextConverter.dateToString(start));
			conn.setQueryVariable(3, DataConstants.getReshipNoCharge());
			conn.setQueryVariable(4, DataConstants.getCancelledOrder());
			ResultSet rs = conn.getResultSet();
			while(rs.next())
				try{ recent.add(new ListStock(conn, rs.getLong("orders_id"), rs.getLong("stock_id"))); }
				catch(Exception e){}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.release(conn);
		}
		return recent;
	}

	static Payment getPaymentInfo(Long num)
	{
		if(num == null) return null;
		DBconnection conn = DB.getRead();
		try {
			conn.setQuery("SELECT * FROM "+Const.PAYMENT_INFO_TABLE+" WHERE orderNumber = ? ORDER BY order_date DESC");
			conn.setQueryVariable(1, num.toString());
			ResultSet rs = conn.getResultSet();
			if(rs.next())
				return loadPaymentInfo(rs);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.release(conn);
		}
		return null;
	}

	static List<Payment> getPaymentInfoByPendingPaymentToken(String token)
	{
		DBconnection conn = DB.getRead();
		try {
			conn.setQuery("SELECT * FROM "+Const.PAYMENT_INFO_TABLE+" WHERE pending_payment_token = ? ORDER BY order_date");
			conn.setQueryVariable(1, token);
			ResultSet rs = conn.getResultSet();
			List<Payment> list = new ArrayList<Payment>();
			while(rs.next())
				list.add(loadPaymentInfo(rs));
			return list;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.release(conn);
		}
		return Collections.emptyList();
	}

	static boolean savePendingPayment(PendingPayment pmt)
	{
		DBconnection conn = DB.getWrite();
		try {
			if(pmt.getId() == null)
				return insertPendingPayment(pmt, conn);
			conn.setQuery("SELECT 1 FROM "+Const.PENDING_PAYMENT_TABLE+" WHERE id = ?");
			conn.setQueryVariable(1, pmt.getId());
			ResultSet rs = conn.getResultSet();
			if(rs.next())
				return updatePendingPayment(pmt, conn);
			return insertPendingPayment(pmt, conn);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.release(conn);
		}
		return false;
	}

	static boolean insertPendingPayment(PendingPayment pmt, DBconnection conn) throws SQLException
	{
		conn.setInsertQuery("INSERT INTO "+Const.PENDING_PAYMENT_TABLE+" (id, order_number,token,status) VALUES (PENDINGPAYMENT_SEQ.NEXTVAL,?,?,?)", "ID");
		System.out.println("insert pending payment");
		if(pmt.getOrderNumber() == null) conn.setNullLongQueryVariable(1);
		else conn.setQueryVariable(1, pmt.getOrderNumber());
		if(pmt.getToken() == null) conn.setNullStringQueryVariable(2);
		else conn.setQueryVariable(2, pmt.getToken());
		if(pmt.getStatus() == null) conn.setNullStringQueryVariable(3);
		else conn.setQueryVariable(3, pmt.getStatus());
		
		Long id = conn.executeInsert();
		pmt.setId(id);
		return true;
	}

	static boolean updatePendingPayment(PendingPayment pmt, DBconnection conn) throws SQLException
	{
		conn.setQuery("UPDATE "+Const.PENDING_PAYMENT_TABLE+" SET order_number = ?, token = ?, status = ? WHERE id = ?");
		if(pmt.getOrderNumber() == null) conn.setNullLongQueryVariable(1);
		else conn.setQueryVariable(1, pmt.getOrderNumber());
		if(pmt.getToken() == null) conn.setNullStringQueryVariable(2);
		else conn.setQueryVariable(2, pmt.getToken());
		if(pmt.getStatus() == null) conn.setNullStringQueryVariable(3);
		else conn.setQueryVariable(3, pmt.getStatus());
		conn.setQueryVariable(4, pmt.getId());
		conn.executeUpdate();
		return true;
	}

	static PendingPayment getLatestPendingPaymentFor(Long num)
	{
		List<PendingPayment> pmts = getPendingPaymentsFor(num);
		return pmts.size() > 0 ? pmts.get(0) : null;
	}

	static PendingPayment getPendingPaymentFor(Long num)
	{
		if(num != null)
			for(PendingPayment pmt : getPendingPaymentsFor(num))
				if("PENDING".equals(pmt.getStatus()))
					return pmt;
		return null;
	}

	/**
	 * Get a list of pending payments for a specific order.
	 * 
	 * @param num the order number
	 * @return a list of payments pending for the order
	 */
	public static List<PendingPayment> getPendingPaymentsFor(Long num)
	{
		if(num == null)
			return Collections.emptyList();
		DBconnection conn = DB.getRead();
		try {
		    String query = "SELECT * FROM "+Const.PENDING_PAYMENT_TABLE+" WHERE order_number = ? ORDER BY created DESC";
			conn.setQuery(query);
			conn.setQueryVariable(1, num);
			logger.debug("Querying pending payments for order number " + num);
			logger.debug(query);
			ResultSet rs = conn.getResultSet();
			List<PendingPayment> list = new ArrayList<PendingPayment>();
			while(rs.next()) {
				list.add(loadPendingPayment(rs));
				logger.debug("Added payment " + rs.getLong("id") );
			}
			return list;
		} catch(Exception e) {
			logger.error("Error querying pending payments", e);
		} finally {
			DB.release(conn);
		}
		return Collections.emptyList();
	}

	static boolean save(CompositeOrder order) throws Exception
	{
	  boolean returnCode = false;
		DBconnection conn = DB.getWrite();
		try {
			order.store(conn); // this method assigns a new order_number if not set
			returnCode = true;
		} catch(Exception e) {
			// Set the orders id to null, then re-throw exception
			if(order != null)
				order.set_orders_id(null);
			throw e;
		} finally {
			DB.release(conn);
		}
		return returnCode;
	}

	static Date getDateLastChanged(Long order_id)
	{
		if(order_id == null) return null;
		DBconnection conn = DB.getRead();
		try {
			conn.setQuery("SELECT last_changed FROM "+Const.PENDING_ORDER_TABLE+" WHERE pending_order_id = ?");
			conn.setQueryVariable(1, order_id);
			ResultSet rs = conn.getResultSet();
			return rs.next() ? rs.getTimestamp(1) : null;
		} catch(Exception e) {}
		finally{ DB.release(conn); }
		return null;
	}

    private static Long getLongOrNull(ResultSet rs, String column) throws SQLException {
      Long l = rs.getLong(column);
      return rs.wasNull() ? null : l;
  }

    private static BigInteger getBigIntegerOrNull(ResultSet rs, String column) throws SQLException {
      BigDecimal l = rs.getBigDecimal(column);
      return rs.wasNull() ? null : l.toBigInteger();
  }

	private static Date getDateOrNull(ResultSet rs, String column) throws SQLException {
		Date d = rs.getTimestamp(column);
		return rs.wasNull() ? null : d;
	}
	/** Delete PendingOrders and PendingLIneItems that have not been updated in specified number of days. */
	public static boolean purgeAbandonedOrders(int age_in_days) throws Exception 
	{
		DBconnection conn = DB.getWrite();
		try {
			GregorianCalendar now = new GregorianCalendar();
			now.roll(Calendar.DAY_OF_YEAR, -age_in_days);
			Date d = now.getTime();
			conn.autoCommit(false);
			
			String deleteItems = "DELETE FROM %s WHERE pending_order_id in (SELECT pending_order_id FROM %s WHERE last_changed < " + TextConverter.dbQuote(d, "mm/dd/yyyy") + " )";
			conn.setQuery(String.format(deleteItems, Const.PENDING_LINE_ITEM_TABLE, Const.PENDING_ORDER_TABLE));
			System.out.println("date : " + TextConverter.dbQuote(d, "mm/dd/yyyy"));
			System.out.println("table : " + String.format(deleteItems, Const.PENDING_LINE_ITEM_TABLE, Const.PENDING_ORDER_TABLE));
			conn.executeUpdate();

			String deleteOrders = "DELETE FROM %s WHERE last_changed < " + TextConverter.dbQuote(d, "mm/dd/yyyy") + " ";
			conn.setQuery(String.format(deleteOrders, Const.PENDING_ORDER_TABLE));
			System.out.println("date : " + TextConverter.dbQuote(d, "mm/dd/yyyy"));
			System.out.println("table " + String.format(deleteOrders, Const.PENDING_ORDER_TABLE));
			conn.executeUpdate();

			conn.commit();
			return true;
		} catch(Exception e) {
			conn.rollback();
			e.printStackTrace();
		} finally {
			conn.autoCommit(true);
			DB.release(conn);
		}
		return false;
	}
	/** Delete PendingOrders and PendingLIneItems for pending orderNumber */
	public static boolean purgeOrder(Long id ) throws Exception
	{
		DBconnection conn = DB.getWrite();
		try {
			conn.autoCommit(false);
			
			String deleteItems = "DELETE FROM %s WHERE pending_order_id in (SELECT pending_order_id FROM %s WHERE order_number = " + TextConverter.dbQuote(id) + ")";
			conn.setQuery(String.format(deleteItems, Const.PENDING_LINE_ITEM_TABLE, Const.PENDING_ORDER_TABLE));
			System.out.println("table : " + String.format(deleteItems, Const.PENDING_LINE_ITEM_TABLE, Const.PENDING_ORDER_TABLE));
			conn.executeUpdate();

			String deleteOrders = "DELETE FROM %s WHERE order_number = " + TextConverter.dbQuote(id);
			conn.setQuery(String.format(deleteOrders, Const.PENDING_ORDER_TABLE));
			System.out.println("table " + String.format(deleteOrders, Const.PENDING_ORDER_TABLE));
			conn.executeUpdate();

			conn.commit();
			return true;
		} catch(Exception e) {
			conn.rollback();
			e.printStackTrace();
		} finally {
			conn.autoCommit(true);
			DB.release(conn);
		}
		return false;
	}
}
/*
create table PendingLineItem (
}
/*
create table PendingLineItem (
 pending_order_id numeric(12) not null,
 stock_id numeric(12) null,
 name varchar(200) null,
 status varchar(30),
 lineitem_type varchar(30),
 stock_type varchar(90),
 quantity numeric(12),
 waived char(1) null,
 mutable char(1) null,
 amount money)

create table PendingOrder (
 pending_order_id numeric(12) identity not null,
 person_id numeric(12) null,
 organization_id numeric(12) null,
 order_number numeric(12) null,
 orderer_comments text null,
 ABRC_comments text null,
 ABRC_public_comments text null,
 payment_method varchar(100) null,
 accept_disclaimer char(1) null,
 proxy char(1) null,
 status varchar(20) default 'BUILDING',
 last_changed datetime default GETDATE(),
 no_charge char(1) null)

create table PaymentInfo (
 order_date datetime default getdate(),
 decision varchar(2000),
 decision_publicSignature varchar(2000),
 orderAmount varchar(2000),
 orderAmount_publicSignature varchar(2000),
 orderCurrency varchar(2000),
 orderCurrency_publicSignature varchar(2000),
 orderNumber varchar(2000),
 orderNumber_publicSignature varchar(2000),
 orderPage_requestToken varchar(2000),
 orderPage_transactionType varchar(2000),
 requestID varchar(2000),
 pending_payment_token varchar(100))

create table PendingPayment (
 id numeric(12) identity not null,
 order_number numeric(12) null,
 token varchar(100) null,
 status varchar(50) null,
 created datetime default getdate())
*/
