<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "ABRC User Invoice Management";
String highlight = "7";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<form action="<%=response.encodeURL("/servlets/Search")%>" method="POST">
<input type="hidden" name="type" value="userinvoice">
<input type="hidden" name="search_action" value="search">
      
<table width="100%" align="center">
	<tr>
	  <td align="center">
	    <font class="mainheader">ABRC Invoice Management</font>
	    <p>
	      Use this form to get a list of invoices.
	  </td>
	</tr>
	<tr>
	  <td>
	    <table border="0" cellpadding="3" cellspacing="0" align="center" width="100%" bgcolor="<%= DataConstants.BGCOLOR %>">

              <tr>
		<td class="sm" align="right"><font class="formheader">Invoice type:</font></td>
		<td class="sm">
		  <select name="invoice_type">
		    <option value="any" selected>any</option>          
		    <option value="credit card">credit card</option>
		    <option value="purchase order">purchase order</option>
		  </select>
		</td>
	      </tr>

          <tr>
	<td class="sm" align="right"><font class="formheader">Invoice number range:</font></td>
		<td class="sm" nowrap>
		  <input type="text" size="12" maxlength="12" name="invoice_id_from">
		  - <input type="text" size="12" maxlength="12" name="invoice_id_to">
		</td>
          </tr>
        
	      <tr>
	<td class="sm" align="right"><font class="formheader">Unpaid line item type:</font></td>
		<td class="sm">
		  <select name="line_item_type">
		    <option value="any" selected>any</option>
  		    <option value="seed">seed only</option>            
   		    <option value="dna">dna only</option>            
		    <option value="seed and dna">both seed and dna</option>
            <option value="seed or dna">seed, dna or both</option>
		  </select>
		</td>
	     </tr>
         
	      <tr>
		<td class="sm" align="right"><font class="formheader">Invoice created date range:</font></td>
		<td class="sm">
		  <input type="text" size="10" maxlength="10" name="date_invoice_created_from"> 
		  - <input type="text" size="10" maxlength="10" name="date_invoice_created_to">           
		</td>
	      </tr>                     
	      <tr>
		<td class="sm" align="right"><font class="formheader">Items shipped date range:</font></td>
		<td class="sm">
		  <input type="text" size="10" maxlength="10" name="shipped_date_from"> 
		  - <input type="text" size="10" maxlength="10" name="shipped_date_to">           
		</td>
	     </tr>
         <tr>
		<td class="sm" align="right"><font class="formheader">Last notified date range:</font></td>
		<td class="sm">
		  <input type="text" size="10" maxlength="10" name="notified_date_from"> 
		  - <input type="text" size="10" maxlength="10" name="notified_date_to">           
		</td>
	     </tr>
          <tr>
		<td class="sm" align="right"><font class="formheader">Invoice Status:</font></td>
		<td class="sm">
		  <select name="invoice_status">		  	
		    <option value="in_progress" selected>in progress</option>
   		    <option value="paid_in_full">paid in full</option>
   		    <option value=new>new</option>
            <option value=cancelled>cancelled</option> 
            <option value="any" selected>any</option>               
		  </select>
		</td>
          </tr>
	      
	      <tr>
		<td class="sm" align="right"><font class="formheader">Sort by:</font></td>
		<td class="sm">
		  <select name="order">
		    <option value="invoice_total">invoice total</option>
		    <option value="date_invoice_created">invoice created date</option>
   		    <option value="invoice_type" selected >invoice type</option>
		  </select>
		</td>
              </tr>

              <tr>
		<td class="sm" align="right"><font class="formheader">Records per page:</font></td>
		<td class="sm">
		  <select name="size">
		    <option value="25" selected>25</option>
		    <option value="50">50</option>
		    <option value="100">100</option>
		    <option value="200">200</option>
		    <option value="500">500</option>
		  </select>
		</td>
	      </tr>

	      <tr>
		<td class="sm" colspan="2">&nbsp;</td>
	      </tr>
	      
	    </table>
	  </td>
	</tr>
	
	<tr>
	  <td class="sm" align="center">
	    <input type="submit" value="Submit">
	    &nbsp;
	    <input type="reset" value="Reset">
	    
	  </td>
	</tr>
</table>
	
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
