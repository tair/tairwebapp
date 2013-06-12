// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc.order;

import org.tair.abrc.CompositeOrder;
import org.tair.tfc.TfcPayment;

public class ProcessedPayment
{
	private TfcPayment payment;
	private PaymentResult result;
	private CompositeOrder comp_order;

	public ProcessedPayment(PaymentResult result){
		comp_order = null;
		payment = null;
		this.result = result;
	}

	public void setCompositeOrder(CompositeOrder comp_order){
		this.comp_order = comp_order;
	}

	public CompositeOrder getCompositeOrder(){
		return comp_order;
	}

	public void setTfcPayment(TfcPayment payment){
		this.payment = payment;
	}

	public TfcPayment getTfcPayment(){
		return payment;
	}

	public void setPaymentResult(PaymentResult result){
		this.result = result;
	}

	public PaymentResult getPaymentResult(){
		return result;
	}

	public String toString(){
		return result.toString();
	}
};
