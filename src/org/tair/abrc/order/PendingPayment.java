// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc.order;

import java.util.*;

public class PendingPayment
{
	private Long id;
	private Long order_number;
	private String token;
	private String status;

	public PendingPayment(){
	}

	public PendingPayment(Long id, Long order_number, String token, String status){
		this.order_number = order_number;
		this.status = status;
		this.token = token;
		this.id = id;
	}

	public void save(){
		Storage.savePendingPayment(this);
	}

	public void setId(Long id){
		this.id = id;
	}

	public Long getId(){
		return this.id;
	}

	public void setOrderNumber(Long order_number){
		this.order_number = order_number;
	}

	public Long getOrderNumber(){
		return this.order_number;
	}

	public void setToken(String token){
		this.token = token;
	}

	public String getToken(){
		return this.token;
	}

	public void setStatus(String status){
		this.status = status;
	}

	public String getStatus(){
		return this.status;
	}

	public List<Payment> getPayments(){
		return Storage.getPaymentInfoByPendingPaymentToken(token);
	}
}
