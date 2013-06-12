<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.tair.tfc.*, java.util.*, org.tair.abrc.*, org.tair.abrc.payment.*, org.tair.abrc.stock.*, org.tair.utilities.*, org.tair.abrc.handler.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="TAIR - Order Placed" />
</jsp:include>

<%
 CompositeOrder order = (CompositeOrder) request.getAttribute("order");
 if(order != null) {
%>

<table align="center">
      
      <tr>
      	<% if ( order.hasInvoice() && order.hasOrderCharge() ) { %>
			<td align="center"><font class="mainheader">Order Placed (Please print this page for your records)</font></td>
      	<% } else { %>
      		<td align="center"><font class="mainheader">Order Placed </font></td>
      	<% } %>
      </tr>
      <tr>
	  <td>
	  		Thank you for ordering from ABRC.<p>
	  		Your order# is <b><%= order.get_order_number() %>.</b>
	  <% if ( order.hasInvoice() && order.hasOrderCharge()) { %> 
      </td>
      </tr>     
      <tr>
      <td class="sm">
      	 The payment type is: &nbsp; &nbsp;
	  <% if ( order.getInvoice().get_payment_method().equalsIgnoreCase("purchase_order") ) { %>          
         Purchase Order/Other Reference: <%= order.getInvoice().get_payment_ref_id() %>
         .  (Invoice will be sent by email when your stocks are shipped.  Please send
         payment at that time.)<p>
	  <% } else { %>
		 Credit Card  (Your credit card will be charged when your stocks are shipped.)
<% } %>		         
      </td>
      </tr>
<% } %>	  
     <tr>
	 <td>
	 	<br>
	 	A confirming email of this order has been sent to you and the P.I. of your laboratory.<br>
		You can follow the status of this and other stock orders you have placed
	    <a href="<%= WebApp.getServerURL() %>/servlets/Order?state=search&mode=user">here</a> or from your 
        <a href="<%= WebApp.getServerURL() %>/servlets/Community?action=login">Personal Home</a> page.

	    <!-- if user tried to add stock already in order, show error message -->
	    <% if ( order.hasDuplicateStocks() ) { %>
      	       <p>
    	       The following stocks were already in the order, or were 
               entered more than once:

               <p>

               <% Iterator duplicateIter = order.getDuplicateStocks();
                  Stock duplicate = null;
                  while ( duplicateIter.hasNext() ) {
                       duplicate = (Stock) duplicateIter.next();
               %>
                      <font class="formheader"><%= duplicate.get_stock_number() %></font><br>

               <% } %>

	       <p>
                Quantities are limited to one aliquot for most stocks. 
                Enter requests for additional seeds in the comments field of the
                order form. Additional seeds will be supplied if sufficient 
                quantities are available.

                <!-- clear list of duplicate stocks to keep current -->
	        <% order.clearDuplicateStocks(); %>
            <% } %>

	  <p>

	</td>
      </tr>
</table>

<p>
<table cellpadding="3" border="0" align="center" width="100%" bgcolor="<%= DataConstants.BGCOLOR %>" cellspacing="0">

      <tr>
	<td align="center"><font class="header">Order Summary</font></td>
      </tr>



      <tr valign="top">
	<td align="center">

            <!-- display stocks and charges - use extra logic for displaying 
                 item status if any stocks have status other than "new"
             -->
            		<jsp:include page="/jsp/abrc/order_summary_include.jsp" flush="true">
              			<jsp:param name="useStatusLogic" value="true" />
            		</jsp:include>
            
            <br>

            <!-- display dna/seed stock counts -->
            <jsp:include page="/jsp/abrc/stock_count_include.jsp" flush="true" />
    </td>
   </tr>


  <% if ( order.get_orderer_comments() != null ) { %>
   <tr>
     <td class="sm">
         <font class="formheader">Comments</font><br>
         <%= EmptyTextConverter.convert( TextConverter.dbToHTML( order.get_orderer_comments() ) ) %>
     </td>
   </tr>
  <% } %>

   <!-- display stocks not ordered for any reason -->
   <tr>
      <td><jsp:include page="/jsp/abrc/unordered_stock_include.jsp" flush="true" />&nbsp;</td>
   </tr>

   <tr>
       <td align="center"><font class="header">Contact Information</font></td>
   </tr>

   <tr>
      <td>
         <table width="100%">
            <tr>
               <td class="sm"><font class="formheader">Shipping Address</font></td>
               <td class="sm"><font class="formheader">P.I/Lab Address</font></td>
            </tr>

            <tr valign="top">
               <td class="sm">
                   <%= order.get_person_first_name() %> <%= order.get_person_last_name() %> <%= EmptyTextConverter.convert( order.get_person_suffix() ) %><br>
                   <%= TextConverter.dbToHTML( order.get_person_address() ) %><br>
                   <%= order.get_person_city() %>, <%= order.get_person_state() %> &nbsp; <%= order.get_person_postal_code()%><br>
                   <%= order.get_person_country() %><br><br>
                   <%= order.get_person_email() %><br>
                   <%= EmptyTextConverter.convert( order.get_person_phone() ) %><br>
                   <%= EmptyTextConverter.convert( order.get_person_fax() ) %>
               </td>
 

               <td class="sm">
                   <%= EmptyTextConverter.convert( HTMLFactory.arrayToString( order.get_organization_pi_list(), ", " ) ) %><br>
                   <%= order.get_organization_name() %><br>
                   <%= TextConverter.dbToHTML( order.get_organization_address() ) %><br>
                   <%= order.get_organization_city() %>, <%= EmptyTextConverter.convert( order.get_organization_state() ) %> &nbsp; <%= order.get_organization_postal_code() %><br>
                   <%= order.get_organization_country() %><br>
                   <%= EmptyTextConverter.convert( order.get_organization_phone() ) %><br>
                   <%= EmptyTextConverter.convert( order.get_organization_fax() ) %><br>
               </td>
            </tr>
         </table>
       </td>
  </tr>

      <!-- If order is placed by curator on behalf of user, display curator comments -->
    <% if ( order.getProxyOrder() ) { %>
      <tr valign="top" bgcolor="<%= DataConstants.BGCOLOR %>">
         <td>
	   <font class="formheader">ABRC Comments</font><br>
           <%= EmptyTextConverter.convert( TextConverter.dbToHTML( order.get_ABRC_comments() ) ) %>
         </td>
      </tr>
      <tr valign="top" bgcolor="<%= DataConstants.BGCOLOR %>">

         <td>
	   <font class="formheader">ABRC Public Comments</font><br>
           <%= EmptyTextConverter.convert( TextConverter.dbToHTML( order.get_ABRC_public_comments() ) ) %>
        </td>
      </tr>
   <% } %>

   <tr>
      <td colspan="2">&nbsp;</td>
    </tr>

</table>

<% } %>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true"/>

