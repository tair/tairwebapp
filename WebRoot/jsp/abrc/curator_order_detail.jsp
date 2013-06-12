<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, java.util.*, org.tair.abrc.*, org.tair.abrc.payment.*, org.tair.abrc.stock.*, org.tair.community.*, org.tair.tfc.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Order Detail"; 


public String showLineItemCharge( Float charge, boolean paid ) {
    StringBuffer buffer = new StringBuffer();


    if ( paid ) {

        buffer.append( "<td class=\"sm\" align=\"center\">" );
        buffer.append( "<img src=\"/images/paid.jpg\"></td>\n" );
        buffer.append( "<td class=\"sm\" align=\"right\">" );
    } else {
        buffer.append( "<td colspan=\"2\" class=\"sm\" align=\"right\">" );
    } 

    buffer.append( TextConverter.floatToMoneyString( charge ) );
    buffer.append( "</td>" );

    return buffer.toString();
}

%>

<%
String currentDate = TextConverter.dateToString( new java.util.Date() );
Vector orderVector = (Vector) request.getAttribute( "orderVector" );
CompositeOrder order = null;
if ( orderVector != null ) {
      order = (CompositeOrder) orderVector.get( 0 );
} else {
      order = (CompositeOrder) request.getAttribute( "order" );
}


request.setAttribute( "order", order );
boolean orderEditable = ( !DataConstants.getCompletedOrder().equals( order.get_status() ) && !DataConstants.getCancelledOrder().equals( order.get_status() ) );

%>

<SCRIPT language="javascript">
<!--

function checkAll( form ) {
      for ( i=0; i < form.elements.length; i++ ) {
          var element = form.elements[ i ];
          if ( element.type == "checkbox" && element.name.indexOf( "stock_id_" ) >= 0 ) {
               element.checked = true;
          }
      }

}

//-->
</script>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<form action="/servlets/Order" method="post" name="orderForm">
<input type="hidden" name="state" value="maintain">
<input type="hidden" name="mode" value="detail">
<input type="hidden" name="orders_id" value="<%= order.get_orders_id() %>">

<table cellpadding="1" border="0" align="center" width="100%" cellspacing="0">
	<tr>
	  <td class="sm" align="center" colspan="3"><font class="mainheader">Order # <%= order.get_order_number() %></font> (<%= order.get_orders_id() %>)</td>
	</tr>

	<tr valign="top">
	  <td class="sm" align="center">
	    <table cellpadding="1" cellspacing="1">
	      <tr>
		<td class="sm"><font class="formheader">Status:</font></td>
		<td class="sm"><font class="status"><%= order.get_status() %></font></td>
	      </tr>

	      <tr>
		<td class="sm"><font class="formheader">Date:</font></td>
		<td class="sm"><%= TextConverter.dateToString( order.get_order_date() ) %></td>
	      </tr>

              <tr>
	         <td class="sm"><font class="formheader">Charges Waived?</font></td>
	         <td class="sm"><%= TextConverter.booleanToWord( order.get_no_charge() ) %></td>
	      </tr>

	    <% if ( order.get_date_complete() != null ) { %>
	      <tr>
 	         <td class="sm"><font class="formheader">Date Complete:</font></td>
	         <td class="sm"><%= TextConverter.dateToString( order.get_date_complete() ) %></td>
 	      </tr>
	    <% } %>

              <tr>
 	         <td class="sm"><font class="formheader">Seed Stock Ctr:</font></td>
	         <td class="sm"><%= order.get_format_stock_center() %></td>
 	      </tr>


            <% if ( order.hasInvoice() ) { %>
                <% CompositeInvoice invoice = order.getInvoice(); %>
               <tr valign="top">
	         <td class="sm" nowrap><font class="formheader">Payment Method:</font></td>
		 <td class="sm">
                    <%= invoice.get_payment_method() %>
                    <% if ( invoice.get_payment_method().equals( DataConstants.getPurchaseOrderPaymentMethod() ) &&
                            invoice.get_payment_ref_id() != null ) { %>
                          <br>(PO # <%= invoice.get_payment_ref_id() %>)
                    <% } %>
                 </td>
               </tr>
	    <% } %>
	      

            <% if ( order.get_orderer_comments() != null ) { %>
              <tr valign="top">
	         <td class="sm" nowrap><font class="formheader">User Comments:</font></td>
	         <td class="sm"><%= TextConverter.dbToHTML( order.get_orderer_comments() ) %></td>
	      </tr>
	    <% } %>

             </table>
	</td>
	<td class="sm" align="center">
	  <table cellpadding="3" cellspacing="2">
	    <tr valign="top">
	      <td class="sm">
		<font class="formheader">Shipping Information</font><br>
		<a href="/servlets/TairObject?type=person&id=<%= order.get_person_community_id() %>"><%= order.get_person_name() %></a> 
		<%= EmptyTextConverter.convert( order.get_person_suffix() ) %> (<%= order.get_person_id() %>)<br>
		<%= EmptyTextConverter.convert( TextConverter.dbToHTML( order.get_person_address() ) ) %><br>
		<%= EmptyTextConverter.convert( order.get_person_city() ) %>
		<% if ( order.get_person_state() != null ) { %>, <%= order.get_person_state() %><% } %>
		&nbsp; <%= EmptyTextConverter.convert( order.get_person_postal_code() ) %><br>
		<%= EmptyTextConverter.convert( order.get_person_country() ) %><br><br>
		<%= order.get_person_email() %><br>
		<% if ( order.get_person_phone() != null ) { %>Work Phone: <%= order.get_person_phone() %><br><% } %>
		<% if ( order.get_person_fax() != null ) { %>Fax: <%= order.get_person_fax() %><br><% } %>
		
	      </td>
		
	      <td class="sm">
		<font class="formheader">Billing Information</font><br>
		<a href="/servlets/TairObject?type=organization&id=<%= order.get_organization_community_id() %>"><%= order.get_organization_name() %></a> (<%= order.get_organization_id() %>)<br>
		<%= EmptyTextConverter.convert( TextConverter.dbToHTML( order.get_organization_address() ) ) %><br>
		<%= EmptyTextConverter.convert( order.get_organization_city() ) %>
		<% if ( order.get_organization_state() != null ) {%>, <%= order.get_organization_state() %><% } %>
		&nbsp; <%= EmptyTextConverter.convert( order.get_organization_postal_code() ) %><br>
		<%= order.get_organization_country() %>
		<br><br>
		<% if ( order.get_organization_phone() != null ) { %>Phone: <%= order.get_organization_phone() %><br><% } %>
		<% if ( order.get_organization_fax() != null ) { %>Fax: <%= order.get_organization_fax() %><br><% } %>
		
		  <% if ( orderEditable ) { %>
		  Enter new lab ID: <input type="input" name="organization_id" value="" size="10" maxlength="10">
		  <% } %>
	      </td>
	    </tr>
	  </table>
	</td>
      </tr>


      <tr>
	<td class="sm" align="center" colspan="3">
          <!-- display dna/seed stock counts -->
          <jsp:include page="/jsp/abrc/stock_count_include.jsp" flush="true" />
	</td>
      </tr>
      
      <tr>
	<td class="sm" colspan="3">
	  <% if ( order.hasStocks() ) { %>
	  
	  <table cellpadding="1" border="1" cellspacing="0" width="100%">
	    <tr valign="bottom">
	      <td class="sm" nowrap align="center"><font class="formheader">Select</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Stock #</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Qty</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Status</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Waive Charge</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Last<br>Updated</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Unit<br>Price</font></td>
              <td class="sm" colspan="2" nowrap align="center"><font class="formheader">Extended<br>Price</font></td>
	    </tr>
	    
	      <% 
	            Iterator stockIter = order.getStocks(); 
 	            while ( stockIter.hasNext() ) {
	                Stock stock = (Stock) stockIter.next();



                        // allow stock status to be set unless item has been paid for
                        boolean stockPaid = ( order.hasInvoice() && order.getInvoice().stockItemPaid( stock.get_stock_id() ) );

                        // disallow quantity updates if order is cancelled/completed or
                        // stock has been paid for
                        boolean quantityEditable = true;

                        if ( !orderEditable || stockPaid  ) {
                           quantityEditable = false;
                        }
	      %>

	      <tr>

		<td class="sm" align="center">
                    <% if ( !stockPaid ) { %>
                          <input type="checkbox" name="stock_id_<%= order.get_orders_id() %>" value="<%= stock.get_stock_number() %>">
                    <% } %>
                    &nbsp;
                </td>
 	        <td class="sm" align="center"><a href="/servlets/TairObject?type=stock&id=<%= stock.get_stock_id() %>"><%= stock.get_stock_number() %></a></td>
		<td class="sm" align="center">
	           <% if ( quantityEditable ) { %>
	               <input type="text" size="3" maxlength="3" name="quantity_<%= stock.get_stock_number() %>" value="<%= stock.get_quantity() %>">
   	           <% } else { %>
	             <%= stock.get_quantity() %>
	           <% } %>
	        </td>
		<td class="sm" align="center"><%= stock.get_status() %></td>

                <% String waiver = stock.hasWaiver() ? stock.get_waive_charge() : "no waiver"; %>
		<td class="sm" align="center"><%= waiver %></td>

		<td class="sm" align="center"><%= TextConverter.dateToString( stock.get_order_date_last_modified() ) %></td>

	        <td class="sm" align="center"><%= TextConverter.floatToString( stock.get_stock_charge() ) %>&nbsp;</td>

                <%= showLineItemCharge( order.getLineItemStockCharge( stock.get_stock_id() ), order.stockLineItemPaid( stock.get_stock_id() ) ) %>
	      </tr>

             <% } %>


	      <tr>
		<td class="sm" colspan="7" align="right"><i>Total Stock Charges</i>&nbsp;</td>
                <%= showLineItemCharge( order.getTotalStockCharges(), order.stockLineItemsPaid() ) %>
	      </tr>


            <% if ( order.hasOrderCharge() ) { %>
             <tr>
                <td colspan="7" class="sm" align="right"><i>Order Charge</i></td>
                <%= showLineItemCharge( order.getOrderCharge(), order.orderChargePaid() ) %>
             </tr>
            <% } %>
 

            <% if ( order.hasExpressShippingCharge() ) { %>
             <tr>
               <td colspan="7" class="sm" align="right"><i>Express Shipping Charge</i></td>
               <%= showLineItemCharge( order.getExpressShippingCharge(), order.expressShippingChargePaid() ) %>
             </tr>
            <% } %>


            <% if ( order.hasPhytosanitaryCharge() ) { %>
               <% TfcLineItem item = order.getInvoice().getPhytosanitaryLineItem(); %>
             <tr>
               <td colspan="7" class="sm" align="right">               
                      <!-- (<font class="status"><%= item.get_status() %></font>) -->
                   <% //} %>
                   <i>Phytosanitary Certificate Charge</i>
               </td>
               <%= showLineItemCharge( order.getPhytosanitaryCharge(), order.phytosanitaryChargePaid() ) %>
             </tr>
            <% } %>



            <% if ( order.hasInvoice() ) { %>
             <tr>
               <td colspan="7" class="sm" align="right">
                    <!-- show link to adjust charges if any balance still due -->
                    <% if ( order.hasBalanceDue() ) { %>
                      <a href="/servlets/Order?state=updateCharges&orders_id=<%= order.get_orders_id() %>">Update Order Charges</a>
                      &nbsp;
                    <% } %>

                    <font class="formheader">Total Charges</font>
               </td>

              <td colspan="2" class="sm" align="right"><%= TextConverter.floatToMoneyString( order.getTotalCharges() ) %></td>
             </tr>

             <tr>
               <td colspan="7" class="sm" align="right"><font class="formheader">Total Paid</font></td>
               <td colspan="2" class="sm" align="right"><%= TextConverter.floatToMoneyString( order.getPaymentTotal() ) %></td>
             </tr>

             <tr>
               <td colspan="7" class="sm" align="right"><font class="formheader">Balance Due</font></td>
               <td colspan="2" class="sm" align="right"><%= TextConverter.floatToMoneyString( order.getBalanceDue( ) ) %></td>
             </tr> 
            <tr>
	    		<td colspan=7 class="sm" align="right"><b>Balance Eligible for Payment Now</b>
	    		</td>
	    		<td colspan=8 class="sm" align="right">
	    			<b><%= TextConverter.floatToMoneyString( order.getEligibleForPayment() ) %></b>
	    		</td>
	    	</tr>
           <% } %>



	    </table>

           <% } else { %>
              <br><br>
              <center>
	      <font class="formheader">No stocks in order</font>
	      </center>
              <br><br>
           <% } %>

	  </td>
	</tr>

	<tr>
	  <td colspan="3">&nbsp;</td>
	</tr>


	<tr>
	  <td class="sm" colspan="3">
	    <table cellpadding="3" width="100%">
 	      <tr valign="bottom">
               <% if ( orderEditable ) { %>
		 <td class="sm">
	             <font class="formheader">Date for Status Change</font>
	             <br>
	             <input type="text" name="date_last_modified" size="10" maxlength="10" value="<%= currentDate %>">
	         </td>
	       <% } else { %>
                 <td class="sm">&nbsp;</td>
	       <% } %>
      
		<td class="sm" align="center" rowspan="2">
		  <font class="formheader">ABRC Comments</font>
	          <br>
		  <textarea name="ABRC_comments" rows="3" cols="12" wrap="virtual"><%= EmptyTextConverter.convert( TextConverter.dbToText( order.get_ABRC_comments() ) ) %></textarea>
		</td>

 	         <td class="sm" align="center" rowspan="2">
	           <font class="formheader">ABRC Public Comments</font>
	           <br>
	           <textarea name="ABRC_public_comments" rows="3" cols="12" wrap="virtual"><%= EmptyTextConverter.convert( TextConverter.dbToText( order.get_ABRC_public_comments() ) ) %></textarea>
	         </td>
	      </tr>

	      <tr>
	        <td class="sm">
	            <font class="formheader">Stock Action</font>
	            <br>
                    <select name="action">
                      <option value="">Select One</option>
                      <option value="download_order">Download Order</option>
                      <option value="download_stock">Download Item</option>
                      <option value="<%= DataConstants.getBackOrderedStock() %>">Set Back-Ordered</option>
                      <option value="<%= DataConstants.getShippedStock() %>">Set Shipped</option>
                      <option value="<%= DataConstants.getInProgressStock() %>">Set In Progress</option>
                      <option value="<%= DataConstants.getNewStock() %>">Set New</option>
                      <option value="<%= DataConstants.getInactiveStock() %>">Set Inactive</option>
                      <option value="<%= DataConstants.getMTAStock() %>">Set Waiting for MTA</option>
                      <option value="<%= DataConstants.getNASCStock() %>">Change Center to NASC (no fee)</option>
                      <option value="<%= DataConstants.getNASCShipStock() %>">Change Center to NASC (fee)</option>
                    </select>
	        </td>
	      </tr>

	    </table>
	  </td>
      </tr>	

	<tr>
	  <td class="sm" align="center" nowrap colspan="3">
	    <input type="submit" value="Update Order">
	    &nbsp;
	  <% if ( orderEditable ) { %>
	    <input type="button" value="Cancel Order" onClick="document.location.href='/servlets/Order?state=maintain&mode=detail&orders_id=<%= order.get_orders_id() %>&cancel=true'">
	    &nbsp;
	  <% } %>
	    <input type="button" value="Reload" onClick="document.location.href='/servlets/Order?state=search&search_action=detail&mode=curator&orders_id=<%= order.get_orders_id() %>'">
	  &nbsp;
	    <input type="button" value="Search Again" onClick="document.location.href='/servlets/Order?state=search&mode=curator'">
	    &nbsp;
	    <input type="button" value="Select All" onClick="checkAll( this.form )">
	    &nbsp;
	    <% if ( order.hasInvoice() ) { %>
	    <input type="button" value="Invoice" onClick="document.location.href='/servlets/Search?type=invoice&orders_id=<%= order.get_orders_id() %>&search_action=detail'">
	  	&nbsp;
	  	<input type="button" value="User Invoice" onClick="document.location.href='/servlets/Search?type=invoice&orders_id=<%= order.get_orders_id() %>&search_action=userdetail'">
	  	
	  	<% } %>
	  </td>
	  &nbsp;
	  
	  
	</tr>
    </table>

</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
