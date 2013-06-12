<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, java.util.*, org.tair.abrc.payment.*, org.tair.tfc.*, org.tair.community.*, org.tair.bs.community.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%! 
String pageName = "Invoice Detail"; 
%>
<%
    InvoiceDetail  detail =
       (InvoiceDetail)request.getAttribute("detail");
    LineItemCollection readyForPayment = detail.getReadyForPayment();
    ArrayList payments = detail.getPayments();
    CompositePayment payment = null;
   	TfcInvoice invoice = detail.getInvoice();
    TfcOrders order = detail.getOrder();
    BsOrganization organization = detail.getOrganization();
    BsPerson person = detail.getPerson();
    TfcStock stock = null;
    TfcOrdersStock ordersStock = null;
    String stockType = null;
    TfcLineItem item = null;
    Iterator itemIter = null;
%>
<SCRIPT LANGUAGE="JavaScript">

function mySubmit( method ) {
document.invoiceDetail.method.value = method;
document.invoiceDetail.submit();
}
function checkAll()
{
for(i=0;i<document.invoiceDetail.elements.length;i++)
{
var c = document.invoiceDetail.elements[i];   
c.checked = i;   
}
}
// here if ya need it
function unCheckAll()
{
for(i=0;i<document.invoiceDetail.elements.length;i++)
{
var c = document.invoiceDetail.elements[i];   
c.checked ='';   
}
}

</SCRIPT>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<form action="/servlets/Search" method="post" name="invoiceDetail">
<input type="hidden" name="type" value="invoice">
<input type="hidden" name="search_action" value="new_payment">
<input type="hidden" name="mode" value="curator">
<input type="hidden" name="orders_id" value="<%= order.get_orders_id() %>">
<input type="hidden" name="method" value="<%= invoice.get_payment_method() %>">

<table cellpadding="1" border="0" align="center" width="100%" cellspacing="0">
	<tr>
	  <td class="sm" align="center" colspan="3"><font class="mainheader">Invoice # <%= invoice.get_invoice_id() %></font></td>
	</tr>

	<tr valign="top">
     
    
	  <td class="sm" align="center">
	    <table cellpadding="1" cellspacing="1">
	      <tr>
		<td class="sm"><font class="formheader">Status:</font></td>
		<td class="sm"><font class="status"><%= TextConverter.uscoreToSpace( invoice.get_status() ) %></font></td>
        <td class="sm"><font class="formheader">Date:</font></td>
		<td class="sm"><%= TextConverter.dateToString( invoice.get_date_invoice_created() ) %></td>
        <td class="sm"><font class="formheader">Total:</font></td>
		<td class="sm"><%= TextConverter.floatToMoneyString( invoice.get_invoice_total() ) %></td>
  		<td class="sm"><font class="formheader">Type:</font></td>
		<td class="sm"><%= TextConverter.uscoreToSpace( invoice.get_payment_method() )%></td>
	      </tr>

	      <tr>
		<td class="sm"><font class="formheader">Order number:</font></td>
		<td class="sm"><%= order.get_order_number() %></td>
        <td class="sm"><font class="formheader">Orderer:</font></td>
		<td class="sm"><%= person.getCommunity().getName() %></td>
        <td class="sm"><font class="formheader">Lab:</font></td>
		<td class="sm"><%= organization.getName() %></td>
  		<td class="sm">&nbsp;</td>
		<td class="sm">&nbsp;</td>
	      </tr>
        </table>
       </td>

              
      <tr>
	<td class="sm" colspan="3">
	<% if ( !invoice.get_status().equals("new") ) { %>

	  <% if ( !payments.isEmpty() ) {  

 	            Iterator payIter = payments.iterator(); 
                int payCtr = 0;
                int liCtr = 0;
                if ( payIter != null ) {
 	            while ( payIter.hasNext() ) {
                %>
	  <table cellpadding="1" border="1" cellspacing="0" width="100%">
	    <tr valign="bottom">
	      <td class="sm" nowrap align="center"><font class="formheader">Item Type</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Stock #</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Qty</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Status</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Unit<br>Price</font></td>
              <td class="sm" colspan="2" nowrap align="center"><font class="formheader">Extended<br>Price</font></td>
	    </tr>                  
 	    <% 
                    payment = (CompositePayment) payIter.next();
                    if ( payment != null  ) {
                    
                    itemIter = payment.getLineItems();
                        if ( itemIter != null ) {
                         	while ( itemIter.hasNext() ) {
                            	item = (TfcLineItem) itemIter.next();
                            	
	      %>

	      <tr>
        <% 
        		if ( item.get_type().equalsIgnoreCase( DataConstants.getStockChargeLineItem() ) ) { 
                	stock = payment.getStock( item.get_line_item_id() );
                	ordersStock = payment.getOrdersStock( item.get_line_item_id() );
                    if ( stock.get_is_seed() != null ) {
                    	stockType = stock.get_is_seed().booleanValue() ? "seed stock" : "dna stock";
                    } else {
                    	stockType = "&nbsp;";
                    }
        %>
 				<td class="sm" align="center"><%= stockType %></td>
				<td class="sm" align="center"><%= stock.get_name() %></td>
           		<td class="sm" align="center"><%= ordersStock.get_quantity() %></td>
				<td class="sm" align="center"><%= item.get_status() %></td>
				<td class="sm" align="center"><%= TextConverter.floatToString( ordersStock.get_stock_charge() ) %></td>
       	<%
        		} else { 
        %>
        		<td class="sm" align="center"><%= TextConverter.uscoreToSpace( item.get_type() ) %></td>
                <td class="sm" align="center">&nbsp;</td>
            	<td class="sm" align="center">&nbsp;</td>
				<td class="sm" align="center"><%= item.get_status() %></td>
				<td class="sm" align="center">&nbsp;</td>
        <% 
        		} 
        %>
		<td class="sm" align="center"><%= TextConverter.floatToString( item.get_amount() ) %></td>
	      </tr>

             <% } 
             
             } %> 
       </table> 
	      <tr>
		<td class="sm" colspan="5" align="center"> <font class="formheader">PAYMENT PROCESSED</font></td>
          </tr>
          
	<tr valign="top">
	
	  <td class="sm" align="center">
	    <table cellpadding="1" cellspacing="1">
	      <tr>
        		<td class="sm"><font class="formheader">Payment type:</font></td>
				<td class="sm"><%= TextConverter.uscoreToSpace( payment.get_type() ) %></td>
        		<td class="sm"><font class="formheader">Payment date:</font></td>
				<td class="sm"><%= payment.get_payment_date() %></td>
        		<td class="sm"><font class="formheader">Amount:</font></td>
				<td class="sm"><%= TextConverter.floatToString( payment.get_amount() ) %></td>
	      
	      </tr>
        </table>
        <br>
             <% } } } %>           

           <% } else { %>

    <tr> 
      <td align="center">
          <br><br>
	      <font class="formheader">No payments made to this invoice</font>
          <br><br>
           <% } %>

	  </td>
	</tr>       
                     
    <tr>
	<td class="sm" colspan="3">
	  <% if ( readyForPayment.size() > 0 ) { %>
	  
	  <table cellpadding="1" border="1" cellspacing="0" width="100%">
	    <tr valign="bottom">
	      <td class="sm" nowrap align="center"><font class="formheader">&nbsp;</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Item Type</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Stock #</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Qty</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Status</font></td>
	      <td class="sm" nowrap align="center"><font class="formheader">Unit<br>Price</font></td>
              <td class="sm" colspan="2" nowrap align="center"><font class="formheader">Extended<br>Price</font></td>
	    </tr>
	    
	      <% 
				itemIter = readyForPayment.iterator(); 
                if ( itemIter != null ) {
 	            while ( itemIter.hasNext() ) {
	                item = (TfcLineItem) itemIter.next();
	      %>

	      <tr>
        <% 
        		if ( item.get_type().equalsIgnoreCase( DataConstants.getStockChargeLineItem() ) ) { 
                	stock = detail.getStock( item.get_line_item_id() );
                	ordersStock = detail.getOrdersStock( item.get_line_item_id() ); %>
                	<% //select the checkbox for shipped and unpaid items %>
                	<% if ( ordersStock.get_status().equals("shipped") 
		    				&& item.get_status().equals("unpaid") )
		    		   { %>
						<td class="sm" align="center"><input checked type="checkbox" name="id" value="<%= item.get_line_item_id() %>"></td>
  					<% } else { %>
        				<td class="sm" align="center"><input type="checkbox" name="id" value="<%= item.get_line_item_id() %>"></td>
        			<% } %>

                    <%if ( stock.get_is_seed() != null ) {
                    	stockType = stock.get_is_seed().booleanValue() ? "seed stock" : "dna stock";
                    } else {
                    	stockType = "&nbsp;";
                    }        
        %>
 				<td class="sm" align="center"><%= stockType %></td>
                <td class="sm" align="center"><%= stock.get_name() %></td>
           		<td class="sm" align="center"><%= ordersStock.get_quantity() %></td>
				<td class="sm" align="center"><%= item.get_status() %></td>
				<td class="sm" align="center"><%= TextConverter.floatToString( ordersStock.get_stock_charge() ) %></td>
       	<%
        		} else { 
        %>
        		<td class="sm" align="center"><input checked type="checkbox" name="id" value="<%= item.get_line_item_id() %>"></td>
        		<td class="sm" align="center"><%= TextConverter.uscoreToSpace( item.get_type() ) %></td>
                <td class="sm" align="center">&nbsp;</td>
            	<td class="sm" align="center">&nbsp;</td>
				<td class="sm" align="center"><%= item.get_status() %></td>
				<td class="sm" align="center">&nbsp;</td>
        <% 
        		} 
        %>
		<td class="sm" align="center"><%= TextConverter.floatToString( item.get_amount() ) %></td>
	    </tr>
             <% } } %>       
	    </table>
	<tr>
	
	  <td class="sm" align="center" nowrap colspan="3">
	  <br>
        <input type="button" name="check7" value="select all for payment" onClick="checkAll()">
        &nbsp;
	    <input type="button" name="check8" value="unselect all" onClick="unCheckAll()">
        &nbsp; 
	    <input type="button" value="make a credit card payment" onClick="javaScript:mySubmit('credit')">
	    &nbsp;
	    <input type="button" value="make a check payment" onClick="javaScript:mySubmit('check')">
	    &nbsp;
	  </td>
	</tr>
</table>
        	<% } %> 
           <% } else { %>

		<tr>
		<td>
              <br><br>
              <center>
	      <font class="formheader">No items ready for payment</font>
	      </center>
              <br><br>
           <% } %>
        </td>
        <tr>
                


</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
