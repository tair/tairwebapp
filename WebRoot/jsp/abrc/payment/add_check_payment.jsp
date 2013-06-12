<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import = "org.tair.utilities.*, java.util.*, org.tair.abrc.payment.*, org.tair.tfc.*, org.tair.community.*, org.tair.bs.community.*" 
%>

<%!
String pageName = "Add Check Payment";
%>
<%
    ArrayList lineItemIDs = new ArrayList();
    if ( request.getAttribute( "ids" ) != null ) {
		lineItemIDs = ( ArrayList )request.getAttribute( "ids" );
  	}
    StringBuffer idList = new StringBuffer("");
    if ( lineItemIDs != null && lineItemIDs.size() > 0 ) {
    	Iterator iter = lineItemIDs.iterator();
        if ( iter != null ) {
            boolean first = true;
            while ( iter.hasNext() ) {
    			if ( !first ) {
                    idList.append( ";" );
                }
                idList.append( ( ( Long )iter.next() ).toString() );
                first = false;
            }
     	}    
    }
    InvoiceDetail  detail =
       (InvoiceDetail)request.getAttribute("detail");
    LineItemCollection readyForPayment = detail.getReadyForPayment();
    TfcInvoice invoice = detail.getInvoice();
    TfcOrders order = detail.getOrder();
    BsOrganization organization = detail.getOrganization();
    BsPerson person = detail.getPerson();
    TfcLineItem item = null;
    Iterator itemIter = null;
    float paymentTotal = 0;
    // figure out the payment total by going through each of the line items in the invoice, 
    // checking to see if its in the arraylist, if it is the add to the total for payment
   	itemIter = readyForPayment.iterator(); 
  	if ( itemIter != null ) {
		while ( itemIter.hasNext() ) {
	  		item = (TfcLineItem) itemIter.next();
        	if ( lineItemIDs.contains( item.get_line_item_id() ) ) {
            	paymentTotal += item.get_amount().floatValue();
        	}	
    	}
    }      

%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<form action="<%=response.encodeURL("/servlets/Search")%>" method="post" name="paymentForm">
<input type="hidden" name="type" value="invoice">
<input type="hidden" name="search_action" value="payment">
<input type="hidden" name="mode" value="curator">
<input type="hidden" name="method" value="check">
<input type="hidden" name="invoice_id" value="<%= invoice.get_invoice_id() %>">
<input type="hidden" name="id_list" value="<%= idList.toString() %>">
<table cellpadding="1" border="0" align="center" width="100%" cellspacing="0">
	<tr>
	  <td class="sm" align="center" colspan="3"><font class="mainheader">Check Payment for Invoice # <%= invoice.get_invoice_id() %></font></td>
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
  
	    <table>

          <tr>
		<td class="sm" align="right"><font class="formheader">Payment amount ( link to adjust charges, refresh to see any changes ):</font></td>
		<td class="sm" align="left"><A href="/servlets/Order?state=updateCharges&orders_id=<%= invoice.get_orders_id() %>" target="_blank"><%= TextConverter.floatToMoneyString( paymentTotal ) %></td>
	      </tr>

	      <tr>
		<td class="sm"><font class="formheader">Check date:</font> (mm/dd/yyyy)</td>
		<td class="sm"><input type="text" size="10" maxlength="10" name="check_date"> </td>
	      </tr>

	      <tr>
		<td class="sm"><font class="formheader">Check number:</font></td>
		<td class="sm"><input type="text" size="20" maxlength="20" name="check_number"> </td>
	      </tr>

	      <tr>
        <td class="sm" ><font class="formheader">Name/Bank on check:</font></td>
		<td class="sm" nowrap>
		  <input type="text" size="40" maxlength="100" name="name_on_check">
		</td>
	      </tr>
          
	    </table>
        
	  </td>
	</tr> 
          
 	<tr>
	  <td class="sm">&nbsp;</td>
	</tr>
    	
 	<tr>
	<td class="sm" align="center">
	  <input type="submit" value="Submit Payment">
	  &nbsp;&nbsp;
	  <input type="reset" value="Reset">
	  &nbsp;&nbsp;&nbsp;
	</td>
 	</tr> 
    
    </table>
        
	  </td>
	</tr>


      </table>
</form>	      

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
