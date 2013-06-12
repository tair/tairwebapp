<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, java.util.*, org.tair.abrc.*, org.tair.abrc.stock.*, org.tair.abrc.payment.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "User Orders Management System";


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
Vector orderVector = (Vector) request.getAttribute( "orderVector" );
CompositeOrder order = (CompositeOrder) orderVector.get( 0 );
request.setAttribute( "order", order );

if ( order == null ) {
      InvalidActionException iae = new InvalidActionException( "Invalid Request" );
      request.setAttribute( "exception", iae );
      pageContext.forward( "/jsp/common/invalid_action_error.jsp" );
}

// order info. can only be updated while order is "new"
boolean updateable = DataConstants.getNewOrder().equals( order.get_status() );
String mode = request.getParameter( "mode" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>


<form action="/servlets/Order" method="post">
<% if ( updateable ) { %>
   <input type="hidden" name="orders_id" value="<%= order.get_orders_id() %>">
   <input type="hidden" name="state" value="maintain">
   <input type="hidden" name="mode" value="<%= mode %>">
<% } %>

<table cellpadding="2" align="center" border="0" width="100%">

      <tr valign="top">
	<td class="sm" align="center">
             <font class="mainheader">Order # <%= order.get_order_number() %></font> 
              &nbsp;(<font class="status"><%= order.get_status() %></font>)

             <br>
        </td>
     </tr>
      <tr>
        <td class="sm">
	      
	   <% if ( updateable ) { %>
	       Items can be cancelled from the order by checking the box next the item and 
               clicking "Update Order". You cannot add stocks to this order.

               <br><br>
  	       The entire order may be cancelled by clicking "Cancel Order".
	       <br>
	  <% } %>

	</td>
      </tr>


     <tr>
	<td class="sm">
           <table cellpadding="2" cellspacing="2" border="0" align="center">
            <tr>
              <td>
                 <table border="0">
                   <tr valign="top">
                      <td class="sm" nowrap align="right"><b>Ordered By</b></td>
	              	  <td class="sm" nowrap><a href="/servlets/TairObject?type=person&id=<%= order.get_person_community_id() %>"><%= order.get_person_name() %></a></td>
                   </tr>

                   <tr>
		      		  <td class="sm" nowrap align="right"><b>Billed To</b></td>
    		      	  <td class="sm" nowrap><a href="/servlets/TairObject?type=organization&id=<%= order.get_organization_community_id() %>"><%= order.get_organization_name() %></a></td>
                   </tr>

                   <tr>
                      <td class="sm" nowrap align="right"><b>Order Date</b></td>
                      <td class="sm"><%= TextConverter.dateToString( order.get_order_date() ) %></td>
                   </tr>

 
                <% if ( order.get_date_complete() != null ) { %>
                   <tr>	
	              	  <td class="sm" align="right"><b><b>Date Complete</b></td>
                      <td class="sm"><%= TextConverter.dateToString( order.get_date_complete() ) %></td>
                   </tr>
                <% } %>
       
	        <% if ( order.hasInvoice() ) { %>
                    <% CompositeInvoice invoice = order.getInvoice(); %>
             <tr valign="top">
	  	        <td class="sm" nowrap align="right"><b>Payment Type</b></td>
		        <td class="sm"> 
		        <% if ( invoice.get_payment_method().equals( DataConstants.getPurchaseOrderPaymentMethod() ) ) { %>
						&nbsp;Purchase Order/Other Reference: <%= order.getInvoice().get_payment_ref_id() %>
						. (Invoice will be sent by emaiil when your stocks are shipped.
						Please send payment at that time.)<br>
				<% } else { %> 
						Credit Card (Your credit card will be charged when
						your stocks are shipped.) <% } %></td>
			</tr>
			<% } %>
   </table>
      </td>
              <td class="sm" valign="top">
               <% if ( updateable || order.get_orderer_comments() != null ) { %>
	         <b>Comments</b><br>
                    <% if ( updateable ) { %>
                       <textarea name="orderer_comments" rows="3" cols="20" wrap="virtual"><%= EmptyTextConverter.convert( TextConverter.dbToText( order.get_orderer_comments() ) ) %></textarea>
                    <% } else { %>
                       <%= TextConverter.dbToHTML( order.get_orderer_comments() ) %>
                    <% } %>
                 <% } %>
                 &nbsp;
              </td>
             </tr>



           <% if ( !TextConverter.isEmpty( order.get_ABRC_public_comments() ) ) { %>
            <tr>
               <td>&nbsp;</td>
	       <td class="sm">
                  <b>ABRC Comments</b><br>
	          <%= order.get_ABRC_public_comments() %>
               </td>
	    </tr>
           <% } %>

          </table>
        </td>
      </tr>

      <% if ( order.hasStocks() ) { %>

       <tr>
          <td class="sm" align="center">
              <!-- display dna/seed stock counts -->
              <jsp:include page="/jsp/abrc/stock_count_include.jsp" flush="true" />
          </td>
       </tr>

       <tr>
          <td align="center">
 	    <table cellpadding="2" cellspacing="2" border>
	      <tr valign="bottom">
		<th class="sm">Cancel<br>Item</th>
		<th class="sm" nowrap>Qty</th>
		<th class="sm">Stock #</th>
		<th class="sm">Shipping Status</th>
		<th class="sm">Last<br>Updated</th>
	        <th class="sm">Unit Price</th>
	        <th class="sm" colspan="2">Extended Price</th>
	      </tr>

	       <% 
	             Iterator stockIter = order.getStocks();
	            
	             while ( stockIter.hasNext() ) { 
	                Stock stock = (Stock) stockIter.next();
	       %>
	    
	      <tr>
	         <!-- Allow editing of quantity or removal of stock if order is updateable -->
	         <% if ( updateable && !stock.completed() ) { %>
                   <td class="sm" align="center"><input type="checkbox" name="stock_number" value="<%= stock.get_stock_number() %>"></td>

                   <td class="sm" align="center">
                       <%= stock.get_quantity() %>
                   </td>
                 <% } else { %>
                   <td class="sm" align="center">N/A</td>
		   <td class="sm" align="center"><%= stock.get_quantity() %></td>
                 <% } %>

		<td class="sm"><a href="/servlets/TairObject?type=stock&id=<%= stock.get_stock_id() %>"><%= stock.get_stock_number() %></a></td>

		<td class="sm"><%= stock.get_status() %></td>
		<td class="sm" align="center"><%= TextConverter.dateToString( stock.get_order_date_last_modified() ) %></td>
                <td class="sm" align="center"><%= stock.get_calculated_stock_charge() %></td>
                <%= showLineItemCharge( order.getLineItemStockCharge( stock.get_stock_id() ), order.stockLineItemPaid( stock.get_stock_id() ) ) %>
	      </tr>

             <% } %>


	      <tr>
		<td class="sm" colspan="6" align="right"><i>Total Stock Charges</i>&nbsp;</td>
                <%= showLineItemCharge( order.getTotalStockCharges(), order.stockLineItemsPaid() ) %>
	      </tr>


            <% if ( order.hasOrderCharge() ) { %>
             <tr>
                <td colspan="6" class="sm" align="right">(<a href="/jsp/abrc/payment/whats_this_order_charge.jsp">What's this?</a>)<i>Order Charge</i></td>
                <%= showLineItemCharge( order.getOrderCharge(), order.orderChargePaid() ) %>
             </tr>
            <% } %>
 

            <% if ( order.hasExpressShippingCharge() ) { %>
             <tr>
               <td colspan="6" class="sm" align="right">(<a href="/jsp/abrc/payment/whats_this_mandatory_express_shipping.jsp">What's this?</a>)<i>Express Shipping Charge</i></td>
               <%= showLineItemCharge( order.getExpressShippingCharge(), order.expressShippingChargePaid() ) %>
             </tr>
            <% } %>
            
            <% if ( order.hasPhytosanitaryCharge() ) { %>
             <tr>
               <td colspan="6" class="sm" align="right">(<a href="/jsp/abrc/whats_this_phytosanitary.jsp">What's this?</a>)<i>Phytosanitary Charge</i></td>
               <%= showLineItemCharge( order.getPhytosanitaryCharge(), order.phytosanitaryChargePaid() ) %>
             </tr>
            <% } %>
            </table>
           </td>
        </tr>

        <% } else { %>

        <tr>
          <td>No stocks in order</td>
        </tr>

        <% } %>

    <tr>
      <td align="center">
	<% if ( updateable ) { %>
	  <input type="submit" value="Update Order">
	  &nbsp;&nbsp;
	  <input type="reset" value="Reset">
	  &nbsp;&nbsp;
          <input type="button" value="Cancel Order" onClick="document.location.href='/servlets/Order?state=maintain&mode=detail&orders_id=<%= order.get_orders_id() %>&cancel=true'">
	  &nbsp;&nbsp;
	<% } %>

	<input type="button" value="Search Orders" onClick="document.location.href='/servlets/Order?state=search&mode=<%= mode %>&organization_id=<%= order.get_organization_id() %>'">
    &nbsp;&nbsp;
	
    <% if ( order.hasInvoice()) { 
    		if ( !order.getInvoice().get_status().equals("new") ) {%>
    		<input type="button" value="Invoice" onClick="document.location.href='/servlets/Search?type=invoice&orders_id=<%= order.get_orders_id() %>&search_action=userdetail'">
    		&nbsp;&nbsp;
			<% } %>
	<% } %>
      </td>
      
    </tr>
  </table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
