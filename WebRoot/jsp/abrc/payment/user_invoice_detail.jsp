<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, java.util.*, java.text.*, org.tair.abrc.*, org.tair.abrc.stock.*, org.tair.abrc.payment.*"%>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>

<%
boolean showPayButton = Boolean.TRUE.equals((Boolean)request.getAttribute("show-payment-button"));
boolean showWait= Boolean.TRUE.equals((Boolean)request.getAttribute("show-wait"));
boolean showErrMsg = Boolean.TRUE.equals((Boolean)request.getAttribute("show-err-msg"));
CompositeOrder order = (CompositeOrder) request.getAttribute( "order" );
if(order == null){
      InvalidActionException iae = new InvalidActionException( "Invalid Request" );
      request.setAttribute( "exception", iae );
      pageContext.forward( "/jsp/common/invalid_action_error.jsp" );
}
%>

<html>
<head>
<title>ABRC Invoice</title>
<link rel="stylesheet" type="text/css" href="/css/main.css">
<link rel="stylesheet" type="text/css" href="/css/search.css">
</head>

<body bgcolor="#F5F9FF">

<table width="60%" align="center" border="0" cellspacing="0" cellpadding="2">
 <tr valign="top">
  <td class="sm" align="center"><h2><font class="mainheader">ABRC Invoice# <%=order.getInvoice().get_invoice_number()%></font></h2></td>
 </tr>
 <tr>
  <td>
	<table align="center" border="0">
	<tr>
		<td class="sm" nowrap align="center" colspan="2"><font class="header"><b>Arabidopsis Biological Resource Center</b></font></td>
	</tr>
	<tr>
		<td class="sm" nowrap>The Ohio State University</td>
		<td class="sm" nowrap>Phone:  (614) 292-9371</td>
	</tr>
	<tr>
		<td class="sm" nowrap>055 Rightmire Hall</td>
		<td class="sm" nowrap>Fax:  (614) 292-0603</td>
	</tr>
	<tr>
		<td class="sm" nowrap>1060 Carmack Road</td>
		<td class="sm" nowrap>&nbsp;</td>
	</tr>
	<tr>
		<td class="sm" nowrap>Columbus, OH 43210 USA</td>
		<td class="sm" nowrap>E-mail: <a href="mailto:abrc@osu.edu">abrc@osu.edu</a></td>
	</tr>
	</table>
  </td>
 </tr>
 <tr>
  <td>
	<table border="0" align="center" width="100%">
	 <tr valign="top">
	  	<td class="sm" nowrap align="left"><b>Order#:</b> <%=order.get_order_number()%></td>
	 </tr>
	 <tr>
	  	<td class="sm" nowrap align="left"><b>Date of Invoice:</b> <%=TextConverter.dateToString( order.getInvoice().get_invoice_date() )%></td>
	 </tr>

	 <% if ( order.hasInvoice() ) { %>
	 <% CompositeInvoice invoice = order.getInvoice(); %>
	 <tr>
		<td class="sm" nowrap align="left"><b>Payment Type:</b>
		<% if ( invoice.get_payment_method().equals( DataConstants.getPurchaseOrderPaymentMethod() ) ) { %>
		&nbsp;Purchase Order/Other Reference: (PO#<%= order.getInvoice().get_payment_ref_id() %>)<br></td>
		<% } else { %>
		&nbsp;Credit Card
		<% } %>
	 </tr>
	 <tr>
		<td class="sm" nowrap align="left"><b> Shipped to:</b> <%=order.get_person_first_name()+" "+order.get_person_last_name()%></td>
	 </tr>
	 <tr>
		<td class="sm" nowrap align="left"><b>Billed to:</b> <%= order.get_organization_name() %></td>
	 </tr>
	 <tr>
		<td class="sm" nowrap align="left">
		<%= EmptyTextConverter.convert( TextConverter.dbToHTML( order.get_organization_address() ) ) %></td>
	 </tr>
	 <tr>
		<td class="sm" nowrap align="left"><%= EmptyTextConverter.convert( order.get_organization_city() ) %> 
		<% if ( order.get_organization_state() != null ) {%>, <%= order.get_organization_state() %><% } %>
		&nbsp; <%= EmptyTextConverter.convert( order.get_organization_postal_code() ) %></td> 
	 </tr>
	 <tr>
		<td class="sm" nowrap align="left"><%=order.get_organization_country()%></td>
	 </tr>
	 <tr>
		<td>&nbsp;</td>
	 </tr>
	 <tr>
		<td class="sm" nowrap align="left"><b>Total Charges: </b>
		<b>&nbsp;<%=TextConverter.floatToMoneyString( order.getTotalCharges() )%></b></td>
	 </tr>
	 <tr>
		<td class="sm" nowrap align="left"><b>Total Paid: </b>
		<b>&nbsp;<%=TextConverter.floatToMoneyString( order.getPaymentTotal() )%></b></td>
	 </tr>
	 <tr>
		<td class="sm" nowrap align="left"><b>Balance Due: </b>
		<b>&nbsp;<%=TextConverter.floatToMoneyString( order.getBalanceDue() )%></b></td>
	 </tr>
	</table>
  </td>
 </tr>
 <tr>
  <td>
    <%if(showErrMsg){%>
     <div style="text-align:center; border:3px double red; width:500px; margin: 0 auto;">
      <p>A payment for this order has been received, but we were unable to process it.</p>
      <p>Please contact ABRC before attempting another payment.</p>
     </div>
    <% } %>
	<table align="center" border="0">
	<tr><td>
	<div id="wait-content" style="padding: 10px; 0; display: <%=(showWait ? "block" : "none")%>">
		<table align="center" width="600" style="background-color:#ECECEC; padding:0 20px; border:1px solid #D8D8D8">
		<tr><td style="text-align:center">
		 <p class="mainheader">Payment in Progress</p>
		 <img src="/i/boxes.gif" alt="Payment in Progress" />
		</td><tr>
		<tr><td>
		 <h4>Please use the popup window window to complete the payment process.</h4>
		 <h4>Your invoice will be updated as soon as we receive your payment information. <a href="" alt="check payment">Check for your payment information now.</a></h4>
		 <p>If a popup window has not appeared, please cancel this payment, check your browser settings, and try again.</p>
		 <p>If several minutes have passed since you completed your payment and your invoice has not been updated, you will need to contact ABRC.
			Please reference <b>order number <%=order.get_order_number()%></b> in your email.</p>
		 <p>You may cancel this payment if you wish to make a payment at another time.</p>
		</td><tr>
		<tr><td style="text-align:center">
		 <form action="/servlets/po-payment" method="POST">
		  <input type="button" value="Cancel Payment" onclick="do_submit(this.form)" />
		  <input type="hidden" value="" name="origin" />
		  <input type="hidden" value="<%=order.get_order_number()%>" name="order-number" />
		 </form>
		</td></tr></table>
	</div>

	   <div id="pay-content" style="display: <%=(!showWait && showPayButton ? "block" : "none")%>">
	    <p class="sm">Please pay by credit card using the button below, or send check payable to <b>The Ohio State University</b> to the address above. We cannot accept electronic transfers to our bank, or credit card information sent by mail, fax or phone.</p>
	    <p style="text-align:center">
	     <input type="button" value="Make a credit card payment via a secure server" onclick="do_popup()" id="the-button">
	    </p>
	   </div>
	   </td>
	  </tr>
	<% } %>
	</table>
  </td>
 </tr>
 <tr>
  <td align="center"><b>Invoice Details:</b></td>
 </tr>
 <tr>
  <td>
	<% if ( order.hasStocks() ) { %>
	 <table align="center" cellpadding="2" cellspacing="1" border="1">
	 <tr align="center" valign="bottom">
	 <td class="sm" width="2"><b>Qty</b></td>
	 <td class="sm"><b>Stock #</b></td>
	 <td class="sm"><b>Status</b></td>
	 <td class="sm"><b>Date Shipped</b></td>
	 <td class="sm"><b>Unit Price</b></td>
	 <td class="sm" nowrap><b>Extended Price</b></td>
	</tr>
	<% Iterator stockIter = order.getStocks();
	   while ( stockIter.hasNext() ) { 
	     Stock stock = (Stock) stockIter.next();
	     java.util.Date sdate = stock.get_date_shipped();
	     //if(DataConstants.getShippedStock().equals(status) && sdate != null)
	     //    status += " on " + (new SimpleDateFormat("MM/dd/yyyy")).format(sdate);
	
	     //don't display any stocks that have been forward to NASC per Debbie Crist
	   if ( !stock.get_status().equals( "forwarded_to_NASC" ) && !stock.get_status().equals( "inactive" ) )  { %>
	<tr>
		<td class="sm" width="2" align="center"><%= stock.get_quantity() %></td>
		<td class="sm" align="center"><a href="/servlets/TairObject?type=stock&amp;id=<%= stock.get_stock_id() %>"><%= stock.get_stock_number() %></a></td>
		<td class="sm" align="right"><%= stock.get_status() %></td>
		<td class="sm" align="right"><%= sdate == null ? "&nbsp;" : (new SimpleDateFormat("MM/dd/yyyy")).format(sdate) %></td>
		<td class="sm" align="right"><%= stock.get_calculated_stock_charge() %></td>
		<td class="sm" align="right"><%= TextConverter.floatToMoneyString( order.getLineItemStockCharge( stock.get_stock_id() ) ) %></td>
	</tr>
	<%  } %>
	<% } %>

	<tr>
		<td class="sm" colspan="5" align="right"><i>Total Stock Charges</i>&nbsp;</td>
		<td class="sm" align="right"><%= TextConverter.floatToMoneyString( order.getTotalStockCharges() ) %></td>
	</tr>

	<% if ( order.hasOrderCharge() ) { %>
	<tr>
		<td class="sm" colspan="5" align="right">(<a href="/jsp/abrc/payment/whats_this_order_charge.jsp">What's this?</a>)<i>Order Charge</i></td>
		<td class="sm" align="right"><%= TextConverter.floatToMoneyString( order.getOrderCharge() ) %></td>
	</tr>
	<% } %>

	<% if ( order.hasExpressShippingCharge() ) { %>
	<tr>
		<td class="sm" colspan="5" align="right">(<a href="/jsp/abrc/payment/whats_this_mandatory_express_shipping.jsp">What's this?</a>)<i>Express Shipping Charge</i></td>
		<td class="sm" align="right"><%= TextConverter.floatToMoneyString( order.getExpressShippingCharge() ) %></td>
	</tr>
	<% } %>

	<% if ( order.hasPhytosanitaryCharge() ) { %>
	<tr>
		<td class="sm" colspan="5" align="right">(<a href="/jsp/abrc/whats_this_phytosanitary.jsp">What's this?</a>)<i>Phytosanitary Charge</i></td>
		<td class="sm" align="right"><%= TextConverter.floatToMoneyString( order.getPhytosanitaryCharge() ) %></td>
	</tr>
	<% } %>

	<% if ( order.hasInvoice() ) { %>
	<tr>
		<td class="sm" colspan="5" align="right"><font class="formheader">Total Charges</font></td>
		<td class="sm" align="right"><%= TextConverter.floatToMoneyString( order.getTotalCharges() ) %></td>
	</tr>

	<tr>
		<td class="sm" colspan="5" align="right"><font class="formheader">Total Paid</font></td>
		<td class="sm" align="right"><%= TextConverter.floatToMoneyString( order.getPaymentTotal() ) %></td>
	</tr>

	<tr>
		<td class="sm" colspan="5" align="right"><font class="formheader">Balance Due</font></td>
		<td class="sm" align="right"><b><%= TextConverter.floatToMoneyString( order.getBalanceDue( ) ) %></b></td>
	</tr>
	<% } %>

	</table>
	<% } %>
  </td>
 </tr>
 <tr>
 <td>&nbsp;</td>
 </tr>
 <tr>
 <td class="sm">To search for this invoice online, go to the <a href="/user_invoice_form.jsp">user invoice form</a> 
and enter the invoice number or the order number.</td>
 </tr>
</table>

<script type="text/javascript" src="/js/prototype.js"></script>
<script type="text/javascript">
var b = $('the-button');
if(b) b.disabled = false;
function do_popup(){
 $('the-button').disabled = true;
 var win = window.open("/servlets/payment-popup-po?orders_id=<%=order.get_orders_id()%>", "paymentpopup", "menubar=no,width=530,height=500,toolbar=no,scrollbars=yes");
 win.focus();
 setTimeout(refresh, 10000);
 //$('pay-content').hide();
}
function refresh(){
 location.reload();
}
function do_submit(da_form){
 da_form.origin.value = location.href;
 da_form.submit();
}
<% if(showWait) {%> setTimeout(refresh, 10000);<%}%>
</script>

</body>
</html>
