<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.search.dna.*, org.tair.utilities.*, org.tair.abrc.stock.*, java.util.*, org.tair.tfc.*, org.tair.querytools.*" %>

<%!
String pageName = "Host Strain Search Results";
String highlight = "1";
%>
<% 
// get results of search
SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );
HostStrainSummary[] results = (HostStrainSummary[]) searchCollection.getResults();
int resultSize = searchCollection.getResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String scrollLinks = searchCollection.getScrollLinks();
String searchCriteria = searchCollection.getSearchCriteria();
String query_id = (String) request.getAttribute( "query_id" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean"/>

<%@ include file="/jsp/includes/order_functions.jsp" %>


<script language='JavaScript'>
<!--

var helpfile = "";

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

<form action="<%= response.encodeURL( "/servlet/Search" ) %>" name="search_result" method="get">
<input type="hidden" name="type" value="dna" />
<input type="hidden" name="dna_type" value="strain" />
<input type="hidden" name="search_action" value="" />
<input type="hidden" name="size" value="25" />
<input type="hidden" name="pageNum" value="" />
<input type="hidden" name="state" value="" />
<input type="hidden" name="query_id" value="" />


<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
      <tr>
	<td width="100%"> 
	  
          <h1>Host Strain Search Results</h1>
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
		<input type="button" value="download" onClick="javaScript:mySubmit( 0, 'download', 25, '<%=query_id%>')" ><BR>
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
	    <td colspan="3">
	        <input type="button" name="check7" value="Check All" onClick="checkAll()">
	        &nbsp;&nbsp;&nbsp;
	        <input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()">
	    </td>
	    <td align="right" colspan="3"><input type="button" value="Order Checked Stock" onClick="javaScript:mySubmit( 0, 'order', 25 )" ></td>
	  </tr>

          <tr align="left" <%=myBgColor.toggleBgColor()%> valign="bottom"> 
            <th class="sm">Check to Download</th>
            <th class="sm">Name</th>
            <th class="sm">Taxon</th>
            <th class="sm">Description</th>
            <th class="sm" align="center">Stock Number</th>
            <th class="sm" align="center">Order</th>
           </tr>

	<% for ( int i = 0; i < results.length; i++ ) { %>
          <% String bgColor = myBgColor.toggleBgColor(); %> 
	  <tr <%= bgColor %> valign="top">

      	    <td class="sm" align="left"><%= floor++ %><input type="checkbox" name="id" value="<%= results[ i ].getHostStrainID() %>"></td>
            <td class="sm"><a href="/servlets/TairObject?id=<%= results[ i ].getHostStrainID() %>&type=host_strain"><%= results[ i ].getOriginalName() %>&nbsp;</a></td>
            <td class="sm"><%= results[ i ].getScientificName() %></td>
            <td class="sm"><%= EmptyTextConverter.convert( results[ i ].getAbbrevDescription() ) %>&nbsp;</td>
  
             <!-- only show order checkbox if strain has a stock that is available -->
              <% if ( results[ i ].hasStocks() ) { %>

                  <% Iterator stockIter = results[ i ].getStocks();
                     boolean firstStock = true;
                     while ( stockIter.hasNext() ) {
                       StockObject stock = (StockObject) stockIter.next();
                  %>
                   <% if ( !firstStock ) { %>
                    <tr <%= bgColor %> >
                       <td class="sm" colspan="4">&nbsp;</td>
                   <% } %>
             
 	               <td align="center" class="sm"><a href="/servlets/TairObject?type=stock&id=<%= stock.get_stock_id() %>"><%= stock.get_name() %></a></td>

                    <% if ( DataConstants.getAvailableStock().equals( stock.get_stock_availability_type() ) ) { %>
 		       <td class="sm" align="center"><input type="checkbox" name="stock_number" value="<%= stock.get_name() %>"></td>
                    <% } else { %>
                       <td class="sm" align="center"><%= stock.get_stock_availability_type() %></td>
                    <% } %>

                    <% firstStock = false; %>

                   </tr>

                 <% } %>

            <% } else { %>
	   	  <td class="sm" colspan="2" align="center">not an ABRC stock</td>
	       </tr> 
   	    <% } %>
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
