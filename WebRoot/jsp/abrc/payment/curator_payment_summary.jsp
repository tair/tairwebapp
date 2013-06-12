<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, org.tair.utilities.TextConverter" %>
<%!
String pageName = "Payment Search Results";
%>

<% 
// get results of search
String summaryType = "payment";
String query_id = (String) (request.getAttribute( "query_id" ) );
//String sessionID = ( String )request.getSession( true ).getId();
String searchCriteria = ( request.getAttribute( "searchCriteria" ) != null ) ? ( String )request.getAttribute( "searchCriteria" ) : " ";
String pageSizeStr = (String) ( request.getAttribute( "size" ) );
int pageSize = Integer.valueOf(pageSizeStr).intValue();
int currentPage = ( request.getAttribute( "pageNum" ) != null ) ? ( ( Integer )request.getAttribute( "pageNum" ) ).intValue() : 1;
String sortColumn = ( request.getAttribute( "sortColumn" ) != null ) ? ( String )request.getAttribute( "sortColumn" ) : " ";
String reSort = ( request.getAttribute( "reSort" ) != null ) ? ( String )request.getAttribute( "reSort" ) : " ";
String selected = " "; // default value for re-sort drop down menu, selected option    
ResultsFetcher results = new ResultsFetcher( query_id, summaryType, "payment_id" );
results.setPageSize( pageSize );
String paymentAmount = null;
float paymentTotal = 0;
if ( ( !reSort.equals( " " ) || reSort.equals( "T" ) ) && !sortColumn.equals( " " ) ) {
    results.setSort( sortColumn );
    currentPage = 1;    
}
results.setSummaryPage( currentPage );
String scrollLinks = null;
if ( results.getTotPages() > 0 ) {
scrollLinks = ScrollCalculator.getTableScrollLinks( pageSize, currentPage, results.getTotPages(), query_id );
}

%>

<SCRIPT LANGUAGE="JavaScript">

function mySubmit( pageNum, action, size, query_id) {
document.payment_search_result.pageNum.value = pageNum;
document.payment_search_result.action.value = action;
document.payment_search_result.size.value = size;
document.payment_search_result.query_id.value = query_id;
document.payment_search_result.submit();
}

function checkAll()
{
for(i=0;i<document.payment_search_result.elements.length;i++)
{
var c = document.payment_search_result.elements[i];   
c.checked = i;   
}
}
// here if ya need it
function unCheckAll()
{
for(i=0;i<document.payment_search_result.elements.length;i++)
{
var c = document.payment_search_result.elements[i];   
c.checked ='';   
}
}

</SCRIPT>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<form action="<%=response.encodeURL("/servlet/Search")%>" name="payment_search_result" method="post">
<input type="hidden" name="action" value="search" />
<input type="hidden" name="type" value="<%=summaryType%>" />
<input type="hidden" name="size" value="<%=pageSize%>" />
<input type="hidden" name="pageNum" value="<%=currentPage%>" />
<input type="hidden" name="query_id" value="<%=query_id%>" />
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
<tr>
<td width="100%" align="left"> 
<SPAN class="header">ABRC Payment Search</SPAN>
[<A href="/help/helppages/payment_search.jsp" target="_blank">Help</A>]
</td>
</tr>
	  <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#D5D9DD">
	    <tr>
	      <td align="center" width="25%" class="sm">
		<input type="button" value="new search" onClick="javaScript:mySubmit('1','new_search', 25, '<%=query_id%>')" ><BR>
		new payment search
	      </td>
	      <td align="center" width="25%" class="sm">
		<input type="button" value="download" onClick="javaScript:mySubmit( 0,'download', 25, '<%=query_id%>')" ><BR>
		download selected rows
	      </td> 
	    </tr>
	  </table>
<tr>
<% if ( results.getResultSetSize() > 0 ) { %>
        <td>
        <%=searchCriteria%><font class="emphasis"><%=results.getResultSetSize()%></font> records. 
        <p>Displaying <%=results.getStartRow()%> - <%=results.getEndRow()%> of <%=results.getResultSetSize()%> records on page <%=currentPage%> of <%=results.getTotPages()%> pages.
        </td>
<% } else { %>
        <td>
        <%=searchCriteria%><font class="emphasis"> <%=results.getResultSetSize()%></font> records.        
        </td>
<% } %>
</tr>      
<% if ( results.getResultSetSize() > 0 ) { %>
<tr>
   <tr valign="top" bgcolor="#F5F9FF">
      <td>
      <input type="button" name="check7" value="check all" onClick="checkAll()">
	  <input type="button" name="check8" value="uncheck all" onClick="unCheckAll()"> 
      <input type="button" value="re-sort by" onClick="javaScript:mySubmit( 1,'re_sort','<%=pageSize%>', '<%=query_id%>')" > 
      			<select name="sortColumn">
                    <%selected = ( sortColumn.equalsIgnoreCase( "payment_date" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="payment_date"><%=results.getDisplayName("payment_date")%> (newest to oldest)</option>            		
              		<%selected = ( sortColumn.equalsIgnoreCase( "payment_date DESC" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="payment_date DESC"><%=results.getDisplayName("payment_date")%> (oldest to newest)</option>
                    
                    <%selected = ( sortColumn.equalsIgnoreCase( "invoice_id" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="invoice_id"><%=results.getDisplayName("invoice_id")%></option>
                    <%selected = ( sortColumn.equalsIgnoreCase( "invoice_id DESC" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="invoice_id DESC"><%=results.getDisplayName("invoice_id")%> (descending)</option>
               		
               		<%selected = ( sortColumn.equalsIgnoreCase( "payment_amount" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="payment_amount"><%=results.getDisplayName("payment_amount")%> (low to high)</option>
                    <%selected = ( sortColumn.equalsIgnoreCase( "payment_amount DESC" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="payment_amount DESC"><%=results.getDisplayName("payment_amount")%> (high to low)</option>
		          	
		          	<%selected = ( sortColumn.equalsIgnoreCase( "type" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="payment_type"><%=results.getDisplayName("type")%></option>
                  	<%selected = ( sortColumn.equalsIgnoreCase( "type DESC" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="payment_type DESC"><%=results.getDisplayName("type")%> (descending)</option>
            	</select> 
	  </td>
    </tr> 
<td>
<table width="100%" border="0" cellspacing="0">
<tr  <%=myBgColor.toggleBgColor()%> >
<td class="sm">&nbsp; </td> 
<th class="sm"align="right"><%=results.getDisplayName("payment_date")%></th>
<th class="sm"align="right"><%=results.getDisplayName("payment_amount")%></th>
<th class="sm"align="right"><%=results.getDisplayName("invoice_id")%></th>
<th class="sm"align="center"><%=results.getDisplayName("order_number")%></th>
<th class="sm"align="center"><%=results.getDisplayName("type")%></th>


</tr>

<%for (int row_num = 0; row_num < results.getPageSize(); row_num ++) {
if ((results.getStartRow() + row_num) <= results.getResultSetSize()) {%>
<tr <%=myBgColor.toggleBgColor()%> valign="top">
<TD class="sm"align="center" valign="top"><input type="checkbox" name="id" value="<%=results.getCell(row_num,"payment_id")%>"></td>
<td class="sm"align="right" ><%=results.getCell(row_num,"payment_date")%></td>
<td class="sm"align="right" ><%=results.getCell(row_num,"payment_amount")%></td>
<td class="sm"align="right" ><%=results.getCell(row_num,"invoice_id")%></td>
<td class="sm"align="center" ><%=results.getCell(row_num,"order_number")%></td>
<td class="sm"align="center" ><%=results.getCell(row_num,"type")%></td>

<%//stores the paymentAmount for Payment Total calculation%>
<%paymentAmount = results.getCell(row_num,"payment_amount");%>

<%paymentTotal = paymentTotal + Float.valueOf(paymentAmount.trim()).floatValue(); %>

</tr>

<% }%>
<% }%>

<% }%>
<tr>
	<td>&nbsp;</td>
</tr>
<tr>
	<TD class="sm" align="left" valign="top"><b>Payment Total</b></td>
	<td class="sm" nowrap align="right" >&nbsp;</td>
	<td class="sm" nowrap align="right"><b><%=paymentTotal%>0</b></td>

	<td class="sm" align="right" >&nbsp;</td>
	<td class="sm" align="center" >&nbsp;</td>

</tr>

</table>
<br>
</td>
<tr>
</tr>
</table>
</form>

<% if ( scrollLinks != null ) { %>
<table width="52%" align="center" border="0" cellspacing="0">
<tr>
	<td class="sm" align="left"><%= scrollLinks %></td>
</tr>
</table>
<% } %>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

