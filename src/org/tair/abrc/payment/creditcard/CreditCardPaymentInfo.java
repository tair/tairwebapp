//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
//$Revision: 1.6 $
//$Date: 2006/03/02 23:08:30 $
//------------------------------------------------------------------------------
package org.tair.abrc.payment.creditcard;

import org.tair.utilities.WebApp;

/**
 * this class serves as a datatype defined to hold credit card information
 * as required by the Cybersource vendor 
 * MerchantID and BIN are values provided by Cybersource and are not settable
 * MerchantID=700000001754 
 * BIN=000002
 * optional fields are initialized to ""
 *
 * <p>
 * CreditCardPaymentInfo allows only package level access to the class
 * and protected access to the member methods. This is done to encourage
 * all client code to use the central CreditCardController class for
 * all credit card tasks to minimize binding to Paymentech specific info.
 */

class CreditCardPaymentInfo { 

    private String traceNumber = "";
    private String messageType = "";
    private String merchantID = WebApp.getProperty("MERCHANT_ID");
    private String BIN = "000002";
    private String accountNum;
    private String orderID;
    private String amount;
    private String exp;
    private String AVSname;
    private String AVScity;
    private String AVSstate;
    private String AVSzip;
    private String comments = "";
    private String shippingRef = "";
    private String XID = "";
    private String CAVV = "";
    private String cardSecVal = "";
    private String cardSecValInd = "";
    private String ECOrderNum = ""; 
    private String txRefNum;
    private String txRefIdx; 
    private String adjustedAmt;
    private String authCd;  

    /**
     * set the TraceNumber
     */
    protected void setTraceNumber( String traceNumber ) { 
        this.traceNumber = traceNumber; 
    } 
    /**
     * @return String value of TraceNumber
     */
    protected String getTraceNumber() { 
    	return traceNumber;
    }
   
    protected void setMessageType( String messageType ) { 
        this.messageType = messageType; 
    } 
    
    protected String getMessageType() {
    	return messageType;
    }
    
    
    /**
     * set the MerchantID
     * this value should not be settable only gettable
     * it is provided to us by Paymentech
     */
    /*protected void setMerchantID( String merchantID ) { 
      this.merchantID = merchantID; 
      } */
    /**
     * @return String value of MerchantID
     */
    protected String getMerchantID() { 
    	return merchantID;
    }
    /**
     * set the BIN
     * this value should not be settable only gettable
     * it is provided to us by Paymentech
     */
    /*protected void setBIN( String BIN ) { 
      this.BIN = BIN; 
      }*/ 
    /**
     * @return String value of BIN
     */
    protected String getBIN() { 
    	return BIN;
    }
            
    /**
     * set the AccountNum
     */
    protected void setAccountNum( String accountNum ) { 
        this.accountNum = accountNum; 
    } 
    /**
     * @return String value of AccountNum
     */
    protected String getAccountNum() { 
    	return accountNum;
    }
    
    /**
     * set the OrderID
     */
    protected void setOrderID( String orderID ) { 
        this.orderID = orderID; 
    } 
    /**
     * @return String value of OrderID
     */
    protected String getOrderID() { 
    	return orderID;
    }
    
    /**
     * set the Amount
     */
    protected void setAmount( String amount ) { 
        this.amount = amount; 
    } 
    /**
     * @return String value of Amount
     */
    protected String getAmount() { 
    	return amount;
    }
    
    /**
     * set the Exp
     */
    protected void setExp( String exp ) { 
        this.exp = exp; 
    } 
    /**
     * @return String value of Exp
     */
    protected String getExp() { 
    	return exp;
    }
    
    /**
     * set the AVSname
     */
    protected void setAVSname( String AVSname ) { 
        this.AVSname = AVSname; 
    } 
    /**
     * @return String value of AVSname
     */
    protected String getAVSname() { 
    	return AVSname;
    }
    
    /**
     * set the AVScity
     */
    protected void setAVScity( String AVScity ) { 
        this.AVScity = AVScity; 
    } 
    /**
     * @return String value of AVScity
     */
    protected String getAVScity() { 
    	return AVScity;
    }
    
    /**
     * set the AVSstate
     */
    protected void setAVSstate( String AVSstate ) { 
        this.AVSstate = AVSstate; 
    } 
    /**
     * @return String value of AVSstate
     */
    protected String getAVSstate() { 
    	return AVSstate;
    }
    
    /**
     * set the AVSzip
     */
    protected void setAVSzip( String AVSzip ) { 
        this.AVSzip = AVSzip; 
    } 
    /**
     * @return String value of AVSzip
     */
    protected String getAVSzip() { 
    	return AVSzip;
    }
    
    /**
     * set the Comments
     */
    protected void setComments( String comments ) { 
        this.comments = comments; 
    } 
    /**
     * @return String value of Comments
     */
    protected String getComments() { 
    	return comments;
    }
    
    /**
     * set the ShippingRef
     */
    protected void setShippingRef( String shippingRef ) { 
        this.shippingRef = shippingRef; 
    } 
    /**
     * @return String value of ShippingRef
     */
    protected String getShippingRef() { 
    	return shippingRef;
    }
    
    /**
     * set the XID
     */
    protected void setXID( String XID ) { 
        this.XID = XID; 
    } 
    /**
     * @return String value of XID
     */
    protected String getXID() { 
    	return XID;
    }
    
    /**
     * set the CAVV
     */
    protected void setCAVV( String CAVV ) { 
        this.CAVV = CAVV; 
    } 
    /**
     * @return String value of CAVV
     */
    protected String getCAVV() { 
    	return CAVV;
    }
    
    /**
     * set the CardSecVal
     */
    protected void setCardSecVal( String cardSecVal ) { 
        this.cardSecVal = cardSecVal; 
    } 
    /**
     * @return String value of CardSecVal
     */
    protected String getCardSecVal() { 
    	return cardSecVal;
    }
    
    /**
     * set the CardSecValInd
     */
    protected void setCardSecValInd( String cardSecValInd ) { 
        this.cardSecValInd = cardSecValInd; 
    } 
    /**
     * @return String value of CardSecValInd
     */
    protected String getCardSecValInd() { 
    	return cardSecValInd;
    }
    
    /**
     * set the ECOrderNum
     */
    protected void setECOrderNum( String ECOrderNum ) { 
        this.ECOrderNum = ECOrderNum; 
    } 
    /**
     * @return String value of ECOrderNum
     */
    protected String getECOrderNum() { 
    	return ECOrderNum;
    }
    
    /**
     * set the TxRefNum
     */
    protected void setTxRefNum( String txRefNum ) { 
        this.txRefNum = txRefNum; 
    } 
    /**
     * @return String value of TxRefNum
     */
    protected String getTxRefNum() { 
    	return txRefNum;
    }
    
    /**
     * set the TxRefIdx
     */
    protected void setTxRefIdx( String txRefIdx ) { 
        this.txRefIdx = txRefIdx; 
    } 
    /**
     * @return String value of TxRefIdx
     */
    protected String getTxRefIdx() { 
    	return txRefIdx;
    }
    
    /**
     * set the AdjustedAmt
     */
    protected void setAdjustedAmt( String adjustedAmt ) { 
        this.adjustedAmt = adjustedAmt; 
    } 
    /**
     * @return String value of AdjustedAmt
     */
    protected String getAdjustedAmt() { 
    	return adjustedAmt;
    }
    
    /**
     * set the AuthCd
     */
    protected void setAuthCd( String authCd ) { 
        this.authCd = authCd; 
    } 
    /**
     * @return String value of AuthCd
     */
    protected String getAuthCd() { 
    	return authCd;
    }    
    
  
    /**
     * test CreditCardPaymentInfo content
     */
    public void test() {
        System.out.println( "****** CreditCardPaymentInfo content test ******" );
    	System.out.println( "TraceNumber: " + getTraceNumber() );
        System.out.println( "MerchantID: " + getMerchantID() );
        System.out.println( "BIN: " + getBIN() );
    	System.out.println( "AccountNum: " + getAccountNum() );
    	System.out.println( "OrderID: " + getOrderID() );
    	System.out.println( "Amount: " + getAmount() );
    	System.out.println( "Exp: " + getExp() );
    	System.out.println( "AVSname: " + getAVSname() );
    	System.out.println( "AVScity: " + getAVScity() );
    	System.out.println( "AVSstate: " + getAVSstate() );
    	System.out.println( "AVSzip: " + getAVSzip() );
    	System.out.println( "Comments: " + getComments() );
        System.out.println( "ShippingRef: " + getShippingRef() );
    	System.out.println( "XID: " + getXID() );
    	System.out.println( "CAVV: " + getCAVV() );
    	System.out.println( "CardSecVal: " + getCardSecVal() );
        System.out.println( "CardSecValInd: " + getCardSecValInd() );
    	System.out.println( "ECOrderNum: " + getECOrderNum() );
    	System.out.println( "TxRefNum: " + getTxRefNum() );
    	System.out.println( "TxRefIdx: " + getTxRefIdx() );
    	System.out.println( "AdjustedAmt: " + getAdjustedAmt() );
        System.out.println( "AuthCd: " + getAuthCd() );
    	System.out.println( "**** CreditCardPaymentInfo content test end ****" );
    }
    

    /**
     * main function is used to for testing only 
     */
    public static void main( String[] args ) {
    	CreditCardPaymentInfo ccpi = new CreditCardPaymentInfo();     
    	/*ccpi.setTraceNumber( "TraceNumber" );
          ccpi.setAccountNum( "AccountNum" );
          ccpi.setOrderID( "OrderID" );
          ccpi.setAmount( "Amount" );
          ccpi.setExp( "Exp" );
          ccpi.setAVSname( "AVSname" );
          ccpi.setAVScity( "AVScity" );
          ccpi.setAVSstate( "AVSstate" );
          ccpi.setAVSzip( "AVSzip" );
          ccpi.setComments( "Comments" );
          ccpi.setShippingRef( "ShippingRef" );
          ccpi.setXID( "XID" );
          ccpi.setCAVV( "CAVV" );
          ccpi.setCardSecVal( "CardSecVal" );
          ccpi.setCardSecValInd( "CardSecValInd" );
          ccpi.setECOrderNum( "ECOrderNum" );
          ccpi.setTxRefNum( "TxRefNum" );
          ccpi.setTxRefIdx( "TxRefIdx" );
          ccpi.setAdjustedAmt( "AdjustedAmt" );
          ccpi.setAuthCd( "AuthCd" );*/
    	ccpi.test();
    }
}
