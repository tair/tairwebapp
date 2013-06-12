/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.abrc.order;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.tair.utilities.DataConstants;

class OrderData
{
	Long id, order_num;
	BigInteger org;
	BigInteger person;
	List<LineItem> items;         // all items.
	List<LineItem> waived_items;  // subset of all items.
	boolean accept = false;
	boolean proxy = false;
	boolean no_charge = false;
	boolean expr_shipping = false;
	Date last_changed = null;
	String abrc_comments;
	String abrc_pub_comments;
	String orderer_comments;
	String payment_method;

	public OrderData(){
		this.last_changed = new Date();
		this.items = new ArrayList<LineItem>();
		this.waived_items = new ArrayList<LineItem>();
	}

	public void setId(Long id){
		this.id = id;
	}

	public Long getId(){
		return id;
	}

	public Long getOrderNumber(){
		return order_num;
	}

	public void setOrderNumber(Long id){
		order_num = id;
	}

	public BigInteger getPersonId(){
		return person;
	}

	public void setPersonId(BigInteger id){
		this.person = id;
	}

	public BigInteger getOrgId(){
		return org;
	}

	public void setOrgId(BigInteger id){
		this.org = id;
	}

	public String getPaymentMethod(){
		if(payment_method == null || payment_method.trim().equals(""))
			return DataConstants.NO_PAYMENT_METHOD;
		return payment_method;
	}

	public void setPaymentMethod(String s){
		payment_method = s;
	}

	public String getOrdererComments(){
		return orderer_comments;
	}

	public void setOrdererComments(String s){
		orderer_comments = s;
	}

	public String getABRCComments(){
		return abrc_comments;
	}

	public void setABRCComments(String s){
		abrc_comments = s;
	}

	public String getABRCPublicComments(){
		return abrc_pub_comments;
	}

	public void setABRCPublicComments(String s){
		abrc_pub_comments = s;
	}

	public boolean getAcceptDisclaimer(){
		return accept;
	}

	public void setAcceptDisclaimer(boolean b){
		accept = b;
	}

	public boolean getNoCharge(){
		return no_charge;
	}

	public void setNoCharge(boolean b){
		no_charge = b;
	}

	public void setProxyOrder(boolean b){
		proxy = b;
	}

	public boolean getProxyOrder(){
		return proxy;
	}

	public void removeItem(LineItem item){
		items.remove(item);
		waived_items.remove(item);
	}

	public void addItem(LineItem item){
		items.add(item);
	}

	public boolean isWaived(LineItem item){
		return waived_items.contains(item);
	}

	public void waive(LineItem item){
		if(items.contains(item))
			waived_items.add(item);
	}

	public List<LineItem> getItems(){
		return items;
	}

	public List<LineItem> getItems(LineItem.Type type){
		List<LineItem> list = new ArrayList<LineItem>();
		for(LineItem item: items)
			if(item.getType().equals(type))
				list.add(item);
		return list;
	}

	public void setExpressShipping(boolean b){
		expr_shipping = b;
	}

	public boolean getExpressShipping(){
		return expr_shipping;
	}

	public boolean isEmpty(){
		for(LineItem item: items)
			if(item.getType().equals(LineItem.Type.STOCK))
				return false;
		return true;
	}

	public Date getDateLastChanged(){
		return last_changed;
	}

	public void setDateLastChanged(Date changed){
		last_changed = changed;
	}
}
