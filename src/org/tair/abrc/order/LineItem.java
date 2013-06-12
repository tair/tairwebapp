// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc.order;

import java.util.Date;
import org.tair.utilities.DataConstants;

public class LineItem
{
	public enum Status { NONE, UNPAID, UNAVAILABLE, AVAILABLE, RESTRICTED, ERROR, NASC_STOCK};
	public enum Type { NONE, STOCK, ORDER_CHARGE, EXPRESS_SHIPPING, PHYTOSANITARY_CHARGE};
	private String name;
	private Long stock_id;
	private Status status;
	private Type type;
	private float unit_price;
	private long quantity;
	private boolean mutable_quantity;
	private String stock_type;
	private Date last_changed;
	private String avail_type;

	public LineItem(){
		name = null;
		stock_id = null;
		status = Status.NONE;
		type = Type.NONE;
		unit_price = 0.0f;
		quantity = DataConstants.DEFAULT_QUANTITY;
		stock_type = "";
		mutable_quantity = false;
		last_changed = new Date();
		avail_type = null;
	}

	public void setName(String name){
		this.name = name;
		last_changed = new Date();
	}

	public String getName(){
		return name;
	}

	public void setStatus(String status){
		for(Status s: Status.values())
			if(s.toString().equals(status)){
				this.status = s;
				last_changed = new Date();
			}
	}

	public void setStatus(Status status){
		this.status = status;
		last_changed = new Date();
	}

	public Status getStatus(){
		return status;
	}

	public void setPrice(float unit_price){
		this.unit_price = unit_price;
		last_changed = new Date();
	}

	public float getPrice(){
		return unit_price;
	}

	public float getCharge(){
		return unit_price * quantity;
	}

	public void setType(String type){
		for(Type t: Type.values())
			if(t.toString().equals(type)){
				this.type = t;
				last_changed = new Date();
			}
	}

	public void setType(Type type){
		this.type = type;
		last_changed = new Date();
	}

	public Type getType(){
		return type;
	}

	public void setStockId(Long id){
		this.stock_id = id;
		last_changed = new Date();
	}

	public Long getStockId(){
		return stock_id;
	}

	public long getQuantity(){
		return quantity;
	}

	public void setQuantity(long q){
		quantity = q;
		last_changed = new Date();
	}

	public void setStockType(String type){
		stock_type = type;
		last_changed = new Date();
	}

	public String getStockType(){
		return stock_type;
	}

	public Date getDateLastModified(){
		return last_changed;
	}

	public String toString(){
		return "LineItem " + type + " " + status;
	}

	public void setMutableQuantity(boolean b){
		mutable_quantity = b;
		last_changed = new Date();
	}

	public boolean getMutableQuantity(){
		return mutable_quantity;
	}

	public void setAvailabilityType(String atype){
		avail_type = atype;
		last_changed = new Date();
	}

	public String getAvailabilityType(){
		return avail_type;
	}
}
