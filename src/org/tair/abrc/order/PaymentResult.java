// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// -----------------------------------------------------------------------
package org.tair.abrc.order;

public enum PaymentResult
{
	NO_SUCH_ORDER,
	NO_STOCKS_IN_ORDER,
	REJECT_DECISION,
	REVIEW_DECISION,
	ACCEPT_DECISION,
	BAD_SIGNATURE,
	BAD_AUTH_AMOUNT,
	BAD_DECISION,
	BAD_TRANS_TYPE,
	CONVERSION_ERROR,
	ERROR;
}
