<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.search.dna.*, org.tair.utilities.*, org.tair.abrc.stock.*, java.util.*, java.net.*, org.tair.tfc.*, org.tair.querytools.*" %>

<%!
String pageName = "Stock Search Results";
%>
<% 
// get results of search
SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );
StockSummary[] results = (StockSummary[]) searchCollection.getResults();
int resultSize = searchCollection.getResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String scrollLinks = searchCollection.getScrollLinks();
String searchCriteria = searchCollection.getSearchCriteria();
String query_id = (String) request.getAttribute( "query_id" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean"/>

<%@ include file="/jsp/includes/order_functions.jsp" %>


<script language='JavaScript'>
<!--

var helpfile="/help/helppages/cloneres.jsp";

function mySubmit(page_number, action, size, query_id ) {
    if ( action == "order" ) {
      document.search_result.action = "/servlets/Order/current";
      document.search_result.method = "POST";
      document.search_result.state.value = "addStock";

    } else {
      document.search_result.pageNum.value = page_number;
      document.search_result.search_action.value = action;
      document.search_result.size.value = size;
      document.search_result.query_id.value = query_id;
    }
    document.search_result.submit();
}

function checkAll() {
      if ( document.search_result.id.length >= 1 ) {
          for ( i = 0; i< document.search_result.id.length; i++ ) {
              document.search_result.id[ i ].checked = true;
          }
      } else {
          document.search_result.id.checked = true;
      }
}

function unCheckAll(){
      if ( document.search_result.id.length >= 1 ) {
          for ( i = 0; i < document.search_result.id.length; i++ ) {
              document.search_result.id[ i ].checked = false;
          }
      } else {
          document.search_result.id.checked = false;
      }
}

// -->
</SCRIPT>

<form action="<%= response.encodeURL( "/servlets/Search" ) %>" name="search_result" method="get">
<input type="hidden" name="type" value="dna" />
<input type="hidden" name="dna_type" value="stock" />
<input type="hidden" name="search_action" value="" />
<input type="hidden" name="size" value="25" />
<input type="hidden" name="pageNum" value="" />
<input type="hidden" name="state" value="" />
<input type="hidden" name="query_id" value="" />

<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
      <tr>
	<td width="100%"> 
	  
          <h1>TAIR Stock Search Results</h1>
	  <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#D5D9DD">
	    <tr>
	      <td align="center" width="33%" class="sm">
		<input type="button" value="new search" onClick="javaScript:mySubmit('1','new_search', 25 )" ><BR>
		new dna search
	      </td>
	      
	      <td align="center" width="33%" class="sm" color="#666666"> 
                &nbsp;
	      </td>
	      <td align="center" width="34%" class="sm">
		<input type="button" value="download" onClick="javaScript:mySubmit( 0, 'download', 25, '<%= query_id %>')" ><BR>
		check the boxes below and download results
	      </td>
	    </tr>
	  </table>
	</td>
      </tr>


       <tr>
           <td>&nbsp;</td>
       </tr>
      
      <% if ( resultSize >  0 ){ %>
       <tr>
         <td>
            <%= EmptyTextConverter.convert( searchCriteria ) %>
            <p>
              Displaying <%= floor %> - <%= ceiling %>.
         </td>
       </tr>

      <% } else { %>
       <tr>
         <td>
            <%= EmptyTextConverter.convert( searchCriteria ) %>
            <p>
            Please consider the following as you modify your query and try again:<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Check the spelling.<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- For a broader or narrower search make the appropriate selection from the name drop-down menu<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- If you are searching based upon location, check that the appropriate map type or valid range is entered.</font></P><br>
	 </td>
       </tr>
     <% } %>

     <% if ( resultSize > 0 ) { %>

    <tr >
      <td>
	<table width="100%" border="0" cellspacing="0">
	  <tr>
	    <td colspan="5">
	        <input type="button" name="check7" value="Check All" onClick="checkAll()">
	        &nbsp;&nbsp;&nbsp;
	        <input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()">
	    </td>
	    <td align="right" colspan="3"><input type="button" value="Order Checked Stock" onClick="javaScript:mySubmit( 0, 'order', 25 )" ></td>
	  </tr>

          <tr align="left" <%=myBgColor.toggleBgColor()%> valign="bottom"> 
            <th class="sm" align="center">&nbsp;</th>
            <th class="sm" align="center">Check to<br>Download</th>
            <th class="sm"><a href="/help/helppages/cloneres.jsp#447636">Stock Number</a></th>
            <th class="sm"><a href="/help/helppages/cloneres.jsp#447636">Name</a></th>
            <th class="sm">Stock Type</th>
            <th class="sm">Description</th>
            <th class="sm">Donors</th>
            <th class="sm" align="center">Order</th>
           </tr>

	<% for ( int i = 0; i < results.length; i++ ) { %>
	  <tr <%=myBgColor.toggleBgColor()%> valign="top">
      	    <td class="sm" align="center"><%= floor++ %></td>
      	    <td class="sm" align="center"><input type="checkbox" name="id" value="<%= results[ i ].get_stock_id() %>"></td>
            <td class="sm"><a href="/servlet/TairObject?id=<%= results[ i ].get_stock_id() %>&type=stock"><%= results[ i ].get_name() %>&nbsp;</a></td>

            <!-- display associated data item's name & description depending on 
                 stock type (i.e. library, clone, vector etc.) -->
            <td class="sm"><%= results[ i ].getDataTypeName() %></td>
            <td class="sm"><%= results[ i ].get_stock_type() %></td>
            <td class="sm"><%= EmptyTextConverter.convert( results[ i ].getAbbrevDataTypeDescription() ) %>&nbsp;</td>

            <td class="sm">
               <% if ( results[ i ].hasDonors() ) { 
                    Donor donor = null;
                    Iterator donorIter = results[ i ].getDonors();
                    while ( donorIter.hasNext() ) {
                       donor = (Donor) donorIter.next();
               %>
                      <a href="/servlets/TairObject?type=<%= donor.getCommunityType() %>&id=<%= donor.getCommunityID() %>"><%= donor.getDisplayName() %></a>
                  <% } %>
               <% } %>
               &nbsp;
            </td>
  
            <!-- only show order checkbox if stock is available -->
            <% if ( DataConstants.getAvailableStock().equals( results[ i ].get_stock_availability_type() ) ) { %>
 	      <td class="sm" align="center"><input type="checkbox" name="stock_number" value="<%= results[ i ].get_name() %>"></td>
            <% } else { %>
 	      <td class="sm" align="center"><%= results[ i ].get_stock_availability_type() %></td>
            <% } %>
         </tr>
      <% } %>

       </table>
     </td>
    </tr>
  <% } %>

  <% if ( scrollLinks != null ) { %>
    <tr>
      <td class="sm" align="center"><%= scrollLinks %></td>
    </tr>
  <% } %>

</table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
