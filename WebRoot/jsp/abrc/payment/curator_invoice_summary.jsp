<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page
	import="org.tair.utilities.*,org.tair.community.*,org.tair.search.*,org.tair.abrc.payment.*,java.util.*,java.text.*,java.math.*,org.tair.bs.community.*"%>
<%!String pageName = "Invoice Search Results";%>

<%
  // get results of search
  String summaryType = "invoice";
  String queryId = (String)request.getAttribute("query_id");
  String searchCriteria =
    (request.getAttribute("searchCriteria") != null) ? (String)request.getAttribute("searchCriteria")
        : " ";
  Integer pageSize = (Integer)request.getAttribute("size");
  int currentPage =
    (request.getAttribute("pageNum") != null) ? ((Integer)request.getAttribute("pageNum")).intValue()
        : 1;
  String sortColumn =
    (request.getAttribute("sortColumn") != null) ? (String)request.getAttribute("sortColumn")
        : " ";
  String selected = " "; // default value for re-sort drop down menu, selected option 
  String selectFunction = " "; // default value for drop down menu, selected option
  // Get the session. 
  SearchSession searchSession = SessionHandler.getSearchSession(request);
  // Only display if there is a valid search session.
  if (searchSession != null) {
  ISearchResultsManager<InvoiceSearchResult, Long> results =
    searchSession.getInvoiceResultsManager(queryId);
  String scrollLinks = null;
  if (results.pages() > 0) {
    scrollLinks =
      ScrollCalculator.getTableScrollLinks(pageSize,
                                           currentPage,
                                           results.pages(),
                                           queryId);
  }
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page"
	class="org.tair.utilities.BgColorBean" />

<script type="text/javascript">

function mySubmit( pageNum, action, size, queryId ) {
document.invoice_search_result.pageNum.value = pageNum;
document.invoice_search_result.action.value = action;
document.invoice_search_result.size.value = size;
document.invoice_search_result.query_id.value = queryId;
if(document.invoice_search_result.selectFunction.value == 'set_in_progress'){
	if(confirm("Any payments applied to the selected invoices will be set to 0.  Are you sure you want to continue?"))
		document.invoice_search_result.submit();
}
else
	document.invoice_search_result.submit();
}

function checkAll()
{
for(i=0;i<document.invoice_search_result.elements.length;i++)
{
var c = document.invoice_search_result.elements[i];   
c.checked = i;   
}
}
// here if ya need it
function unCheckAll()
{
for(i=0;i<document.invoice_search_result.elements.length;i++)
{
var c = document.invoice_search_result.elements[i];   
c.checked ='';   
}
}

</script>

<form action="<%=response.encodeURL("/servlet/Search")%>"
	name="invoice_search_result" method="post">
	<input type="hidden" name="action" value="search" />
	<input type="hidden" name="type" value="<%=summaryType%>" />
	<input type="hidden" name="size" value="<%=pageSize%>" />
	<input type="hidden" name="pageNum" value="<%=currentPage%>" />
	<input type="hidden" name="query_id" value="<%=queryId%>" />
	<table width="100%" align="center" border="0" cellspacing="0"
		cellpadding="2">
		<tr>
			<td width="100%" align="left">
				<SPAN class="header">ABRC Invoice Search</SPAN> [
				<A href="/help/helppages/invoice_search.jsp" target="_blank">Help</A>]
			</td>
		</tr>
		<tr>
			<%
			  if (results.currentPageSize() > 0) {
			%>
			<td>
				<%=searchCriteria%><font class="emphasis"><%=results.size()%></font>
				records.
				<p>
					Displaying
					<%=pageSize < results.currentPageSize() ? pageSize
            : results.currentPageSize()%>
					of
					<%=results.size()%>
					records on page
					<%=currentPage%>
					of
					<%=results.pages()%>
					<%=results.pages() == 1 ? "page." : "pages."%>
			</td>
			<%
			  } else {
			%>
			<td>
				<%=searchCriteria%><font class="emphasis"> <%=results.size()%></font>
				records.
			</td>
			<%
			  }
			%>
		</tr>
		<%
		  if (results.size() > 0) {
		%>
		<tr valign="top" bgcolor="#F5F9FF">
			<td>
				<input type="button" value="search"
					onClick="javaScript:mySubmit('1','new_search', 25, '<%=queryId%>')">
				<input type="button" name="check7" value="check all"
					onClick="checkAll()">
				<input type="button" name="check8" value="uncheck all"
					onClick="unCheckAll()">
				<input type="button" value="re-sort by"
					onClick="javaScript:mySubmit( 1,'re_sort','<%=pageSize%>', '<%=queryId%>')">
				<select name="sortColumn">
					<%
					  selected = (sortColumn.equalsIgnoreCase("TYPE")) ? "selected" : " ";
					%>
					<option <%=selected%> value="TYPE">
						Invoice Type
					</option>

					<%
					  selected = (sortColumn.equalsIgnoreCase("CREATED")) ? "selected" : " ";
					%>
					<option <%=selected%> value="CREATED">
						Date Created (old to new)
					</option>
					<%
					  selected =
					      (sortColumn.equalsIgnoreCase("CREATED_DESC")) ? "selected" : " ";
					%>
					<option <%=selected%> value="CREATED_DESC">
						Date Created (new to old)
					</option>

					<%
					  selected = (sortColumn.equalsIgnoreCase("ID")) ? "selected" : " ";
					%>
					<option <%=selected%> value="ID">
						Invoice Id
					</option>
					<%
					  selected = (sortColumn.equalsIgnoreCase("ID_DESC")) ? "selected" : " ";
					%>
					<option <%=selected%> value="ID_DESC">
						Invoice Id (desc)
					</option>

					<%
					  selected = (sortColumn.equalsIgnoreCase("ORDER")) ? "selected" : " ";
					%>
					<option <%=selected%> value="ORDER">
						Order No. (low to high)
					</option>
					<%
					  selected =
					      (sortColumn.equalsIgnoreCase("ORDER_DESC")) ? "selected" : " ";
					%>
					<option <%=selected%> value="ORDER_DESC">
						Order No. (high to low)
					</option>

					<%
					  selected = (sortColumn.equalsIgnoreCase("TOTAL")) ? "selected" : " ";
					%>
					<option <%=selected%> value="TOTAL">
						Total (low to high)
					</option>
					<%
					  selected =
					      (sortColumn.equalsIgnoreCase("TOTAL_DESC")) ? "selected" : " ";
					%>
					<option <%=selected%> value="TOTAL_DESC">
						Total (high to low)
					</option>

				</select>
				<select name="selectFunction">
					<option value="download">
						Download
					</option>
					<option value="downloadlineitems">
						Download items
					</option>
					<option value="process" selected>
						Process
					</option>
					<option value="sendpastdue">
						Send past due
					</option>
					<option value="set_paid_in_full">
						Set paid_in_full
					</option>
					<option value="set_in_progress">
						Set in_progress
					</option>
					<option value="set_cancelled">
						Set cancelled
					</option>
				</select>
				<input type="button" value=submit
					onClick="javaScript:mySubmit( <%=currentPage%>,'selectFunction',25, '<%=queryId%>')">
			</td>
		</tr>
		<tr>
			<td>
				<table width="100%" border="0" cellspacing="0">
					<tr <%=myBgColor.toggleBgColor()%>>
						<td class="sm">
							&nbsp;
						</td>
						<th class="sm">
							Invoice Id
						</th>
						<th class="sm">
							Lab
						</th>
						<th class="sm">
							Date Invoice Created
						</th>
						<th class="sm">
							Status
						</th>
						<th class="sm">
							Order No.
						</th>
						<th class="sm" nowrap>
							Last Notified Date
						</th>
						<th class="sm" nowrap>
							Last Shipped Date
						</th>
						<th class="sm" style="padding-left: 10px">
							Total
						</th>
						<th class="sm">
							Eligible Amount
						</th>
						<th class="sm">
							Amount Difference
						</th>
						<th class="sm">
							Type
						</th>

					</tr>

					<%
					  for (InvoiceSearchResult result : results) {
					      Format format = new SimpleDateFormat("MM/dd/yyyy");
					      java.sql.Timestamp lastNotifiedDate = result.getLastNotifiedDate();
					      String lastNotifiedDateStr =
					        lastNotifiedDate != null ? format.format(lastNotifiedDate)
					            : "&nbsp;";
					      java.sql.Timestamp lastShippedDate = result.getLastShippedDate();
					      String lastShippedDateStr =
					        lastShippedDate != null ? format.format(lastShippedDate) : "&nbsp;";
					%>
					<tr <%=myBgColor.toggleBgColor()%> valign="top">
						<TD class="sm" align="left" valign="top">
							<input type="checkbox" name="id" value="<%=result.getId()%>">
						</td>
						<td class="sm">
							<A
								href="/servlets/Search?type=invoice&amp;orders_id=<%=result.getOrdersId()%>&amp;search_action=detail"
								target="_blank"> <%=result.getId()%></A>
						</td>
						<td class="sm" align="left"><%=result.getLabName()%></td>
						<td class="sm" nowrap align="left"><%=format.format(result.getDateInvoiceCreated())%></td>
						<td class="sm" align="center" nowrap><%=result.getInvoiceStatus()%></td>
						<td class="sm" align="left">
							<A
								href="/servlets/Order?state=search&amp;search_action=detail&amp;mode=curator&amp;orders_id=<%=result.getOrdersId()%>"
								target="_blank"> <%=result.getOrderNumber()%></A>
						</td>
						<td class="sm" nowrap align="right"><%=lastNotifiedDateStr%></td>
						<td class="sm" nowrap align="right"><%=lastShippedDateStr%></td>
						<td class="sm" align="right" style="padding-left: 10px"><%=result.getInvoiceTotal().setScale(2, RoundingMode.HALF_UP)%></td>
						<td class="sm" align="right"><%=result.getEligibleAmount().setScale(2, RoundingMode.HALF_UP)%></td>

						<%
						  BigDecimal amtDifference =
						        result.getInvoiceTotal().subtract(result.getEligibleAmount()).setScale(2,
						                                                                               RoundingMode.HALF_UP);

						      if (!result.getInvoiceTotal().equals(result.getEligibleAmount())) {
						%>
						<td class="sm" align="center">
							<i><%=amtDifference%></i>
						</td>
						<%
						  } else {
						%>
						<td class="sm" align="center">
							--
						</td>
						<%
						  }
						%>
						<td class="sm" align="center"><%=result.getPaymentMethod().equals("credit_card") ? "cc"
              : "po"%></td>
					</tr>

					<%
					  }
					%>
					<%
					  }
					%>

				</table>
			</td>
		</tr>
	</table>
</form>

<%
  if (scrollLinks != null) {
%>
<div style="text-align: center;"><%=scrollLinks%></div>
<%
  }
} else {
%>
<div style="color: red; font-size: large;">No search in progress</div>
<%} %>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

