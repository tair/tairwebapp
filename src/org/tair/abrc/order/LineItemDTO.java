// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc.order;

class LineItemDTO
{
	private Long pending_order_id;
	private Long stock_id;
	private String name;
	private String status;
	private String type;
	private String stock_type;
	private Long quantity;
	private String waived;
	private String mutable;
	private Float amount;

	public void setPendingOrderId(Long pending_order_id){
		this.pending_order_id = pending_order_id;
	}

	public Long getPendingOrderId(){
		return pending_order_id;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getName(){
		return name;
	}

	public void setStatus(String status){
		this.status = status;
	}

	public String getStatus(){
		return status;
	}

	public void setAmount(Float amount){
		this.amount = amount;
	}

	public Float getAmount(){
		return amount;
	}

	public void setType(String type){
		this.type = type;
	}

	public String getType(){
		return type;
	}

	public void setStockId(Long id){
		this.stock_id = id;
	}

	public Long getStockId(){
		return stock_id;
	}

	public void setQuantity(Long q){
		this.quantity = q;
	}

	public Long getQuantity(){
		return quantity;
	}

	public void setStockType(String stock_type){
		this.stock_type = stock_type;
	}

	public String getStockType(){
		return stock_type;
	}

	public void setMutable(String mutable){
		this.mutable = mutable;
	}

	public String getMutable(){
		return mutable;
	}

	public void setWaived(String waived){
		this.waived = waived;
	}

	public String getWaived(){
		return waived;
	}
}
