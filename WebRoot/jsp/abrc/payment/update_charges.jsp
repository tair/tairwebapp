<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, java.util.*, org.tair.abrc.*, org.tair.abrc.payment.*, org.tair.abrc.stock.*, org.tair.community.*, org.tair.tfc.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Update Order Charges"; 

public String showLineItemCharge( Float charge, boolean paid ) {
    String retString = null;

    if ( paid ) {
        retString = makePaidItem( charge );
    } else {
        StringBuffer buffer = new StringBuffer();
        buffer.append( "<td colspan=\"2\" class=\"sm\" align=\"right\">" );
        buffer.append( TextConverter.floatToMoneyString( charge ) );
        buffer.append( "</td>\n" );
        retString = buffer.toString();
    }
        
    return retString;

}

private String makePaidItem( Float charge ) {
    StringBuffer buffer = new StringBuffer();

    buffer.append( "<td class=\"sm\" align=\"center\">" );
    buffer.append( "<img src=\"/images/paid.jpg\"></td>\n" );
    buffer.append( "<td class=\"sm\" align=\"right\">" );
    buffer.append( TextConverter.floatToMoneyString( charge ) );
    buffer.append( "</td>\n" );

    return buffer.toString();
}

        

public String showLineItemCharge( String field, Float charge, boolean paid ) {
    String retString = null;

    if ( paid ) {
        retString = makePaidItem( charge );

    } else {
        StringBuffer buffer = new StringBuffer();
        buffer.append( "<td colspan=\"2\" class=\"sm\" align=\"right\">" );
	buffer.append( HTMLFactory.createTextField( field, 
	                                            6, 
                                                    6, 
                                                    TextConverter.floatToString( charge ) ) );

	buffer.append( "</td>" );
        retString = buffer.toString();
    } 

    return retString;
}


%>

<%

String currentDate = TextConverter.dateToString( new java.util.Date() );
CompositeOrder order = (CompositeOrder) request.getAttribute( "order" );
CompositeInvoice invoice = order.getInvoice();
String stockIDs ="";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<script language=javascript>

function setAllCharges(price) {
    var form = document.orderForm;
    var stockIDs_unfiltered = form.stock_ids.value;
    var stockIDs = stockIDs_unfiltered.split("|");
    price = price.split("set all stock charges to ");
    for (i=1; i<stockIDs.length; i++){
        if (document['orderForm']['stock_charge_'+stockIDs[i]].value != 0.00){
            document['orderForm']['stock_charge_'+stockIDs[i]].value = price[1];
        }
    }
    return false;
}
</script>

<form action="/servlets/Order" method="post" name="orderForm">
<input type="hidden" name="state" value="updateCharges">
<input type="hidden" name="update_action" value="update">
<input type="hidden" name="orders_id" value="<%= order.get_orders_id() %>">

<table cellpadding="1" border="0" align="center" width="100%" cellspacing="0">
	<tr>
	  <td class="sm" align="center"><font class="mainheader">Update Charges: Order # <%= order.get_order_number() %></font> (<%= order.get_orders_id() %>)</td>
	</tr>

        <tr>
          <td class="sm">&nbsp;</td>
        </tr>


	<tr valign="top">
	  <td class="sm" align="center">
	    <table cellpadding="2" cellspacing="2">

              <tr>
                 <td class="sm"><font class="formheader">Placed by</font></td>
                 <td class="sm"><a href="/servlets/TairObject?type=person&id=<%= order.get_person_community_id() %>"><%= order.get_person_name() %></a> (<%= order.get_person_id() %>)</td>
              </tr>

              <tr>
                 <td class="sm"><font class="formheader">Billed to</font></td>
                 <td class="sm"><a href="/servlets/TairObject?type=organization&id=<%= order.get_organization_community_id() %>"><%= order.get_organization_name() %></a> (<%= order.get_organization_id() %>)</td>
              </tr>

               <tr valign="top">
	         <td class="sm" nowrap><font class="formheader">Payment Method:</font></td>
		 <td class="sm">
                    <%= invoice.get_payment_method() %>
                    <% if ( invoice.get_payment_method().equals( DataConstants.getPurchaseOrderPaymentMethod() ) &&
                            invoice.get_payment_ref_id() != null ) { %>
                           (PO # <%= invoice.get_payment_ref_id() %>)
                    <% } %>
                 </td>
               </tr>

               <tr>
                  <td class="sm" colspan="2">&nbsp;</td>
               </tr>

              <!-- Curator can waive all charges for order as long as no payments have been made -->
              <% if ( !invoice.hasPayments() ) { %>
              <tr>
	         <td class="sm" align="center" colspan="2">
                     <font class="formheader">Waive all charges?</font>
                     &nbsp;&nbsp;
                     <%= HTMLFactory.createCheckBox( "no_charge", "T", order.get_no_charge() ) %>
                 </td>
	      </tr>
              <% } %>

            </table>
	</td>
      </tr>
      
      <tr>
	<td class="sm">
	  <table cellpadding="1" border="1" cellspacing="0" width="100%">
	    <tr valign="bottom">
	        <td class="sm" nowrap align="center"><font class="formheader">Stock #</font></td>
	        <td class="sm" nowrap align="center"><font class="formheader">Qty</font></td>
	        <td class="sm" nowrap align="center"><font class="formheader">Status</font></td>
	        <td class="sm" nowrap align="center"><font class="formheader">Waive Charge</font></td>
	        <td class="sm" colspan="2" nowrap align="center"><font class="formheader">Unit<br>Price</font></td>
            <td class="sm" colspan="2" nowrap align="center"><font class="formheader">Extended<br>Price</font></td>
	    </tr>
	    
	      <% 
	        Iterator stockIter = order.getStocks(); 
 	        while ( stockIter.hasNext() ) {
	            Stock stock = (Stock) stockIter.next();

                boolean paid = invoice.stockItemPaid( stock.get_stock_id() );
	      %>

	      <tr>
 	        <td class="sm" align="center"><a href="/servlets/TairObject?type=stock&id=<%= stock.get_stock_id() %>"><%= stock.get_stock_number() %></a></td>
		    <td class="sm" align="center"><%= stock.get_quantity() %></td>
		    <td class="sm" align="center"><%= stock.get_status() %></td>
		    <td class="sm" align="center">
                <% String waiver = stock.hasWaiver() ? stock.get_waive_charge() : "no waiver"; %>

                <% if ( !paid ) { %>
                    <%= HTMLFactory.createWaiveChargeSelect( "waive_charge_" + stock.get_stock_number(), waiver, false, true ) %>
                <% } else { %> 
                     <%= waiver %>
                <% } %>
            </td>
            
            <% //row for unit price %>
	        <td class="sm" align="center">
                <% if ( !paid ) { %>
                    <% //set this stockID to stockIDs so that we can use it in the javascript function setAllCharges %>
                    <% stockIDs = stockIDs + "|" + stock.get_stock_number(); %>
                    <input type="text" size="8" maxlength="8" name="stock_charge_<%= stock.get_stock_number() %>" value="<%= TextConverter.floatToString( stock.get_stock_charge() ) %>">
            </td><td align="center">
                    <input type="button" name="this_price" value="set all stock charges to <%= TextConverter.floatToString( stock.get_stock_charge() )%>" onClick="setAllCharges(this.value)">
            </td>
                <% } else { %>
                    <%= TextConverter.floatToString( stock.get_stock_charge() ) %>&nbsp;
            </td><td>&nbsp;</td>
                <% } %>
            </td>

                <%= showLineItemCharge( order.getLineItemStockCharge( stock.get_stock_id() ), order.stockLineItemPaid( stock.get_stock_id() ) ) %>
	        </tr>

             <% } %>

            <input type="hidden" name="stock_ids" value="<%= stockIDs %>">

             <tr>
                <td colspan="6" class="sm" align="right"><i>Order Charge</i></td>
                <%= showLineItemCharge( "order_charge", order.getOrderCharge(), order.orderChargePaid() ) %>
             </tr>

             <tr>
               <td colspan="6" class="sm" align="right"><i>Express Shipping Charge</i></td>
               <%= showLineItemCharge( "express_shipping_charge", order.getExpressShippingCharge(), order.expressShippingChargePaid() ) %>
             </tr>

			 
             <!-- allow curator to toggle phytosanitary charge status between
                  "hidden" and "unpaid".

                  show radio buttons only if line item already exists for order -->

             <% TfcLineItem item = order.getInvoice().getPhytosanitaryLineItem(); %>
             <% boolean hasPhyto = order.hasPhytosanitaryCharge( ); %>

             <tr>
               <td colspan="6" class="sm" align="right">

				<% //mjr - took out phytosanitary charge radio buttons and constant variables code block%>
                
                   <i>Phytosanitary Certificate Charge</i>
               </td>
               <%= showLineItemCharge( "phytosanitary_charge", order.getPhytosanitaryCharge(), order.phytosanitaryChargePaid() ) %>
             </tr>

             <tr>
               <td colspan="6" class="sm" align="right"><font class="formheader">Total Charges</font></td>
               <td colspan="2" class="sm" align="right"><%= TextConverter.floatToMoneyString( order.getTotalCharges() ) %></td>
             </tr>

             <tr>
               <td colspan="6" class="sm" align="right"><font class="formheader">Total Paid</font></td>
               <td colspan="2" class="sm" align="right"><%= TextConverter.floatToMoneyString( order.getPaymentTotal() ) %></td>
             </tr>

             <tr>
               <td colspan="6" class="sm" align="right"><font class="formheader">Balance Due</font></td>
               <td colspan="2" class="sm" align="right"><%= TextConverter.floatToMoneyString( order.getBalanceDue() ) %></td>
             </tr> 
             <tr>
	    		<td colspan=6 class="sm" align="right"><b>Balance Eligible for Payment Now</b>
	    		</td>
	    		<td colspan=2 class="sm" align="right">
	    			<b><%= TextConverter.floatToMoneyString( order.getEligibleForPayment() ) %></b>
	    		</td>
	    	 </tr>

	    </table>
	  </td>
	</tr>

	<tr>
	  <td>&nbsp;</td>
	</tr>


	<tr>
	  <td class="sm" align="center" nowrap>
	    <input type="submit" value="Update Charges">
            &nbsp;&nbsp;
            <input type="button" value="Back to Order Detail" onClick="document.location.href='/servlets/Order?state=search&search_action=detail&mode=curator&orders_id=<%= order.get_orders_id() %>'">
	  </td>
	</tr>
    </table>

</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
