<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.search.*, org.tair.utilities.*, org.tair.community.*, org.tair.abrc.stock.*, java.util.*, org.tair.querytools.*, org.tair.tfc.*" %>

<%!
String pageName = "Germplasm Search Results";
%>

<% 
// get results of search
SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );
GermplasmSummary[] results = (GermplasmSummary[]) searchCollection.getResults();
int resultSize = searchCollection.getResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String query_id = (String) request.getAttribute( "query_id");
String scrollLinks = searchCollection.getScrollLinks();
String searchCriteria = searchCollection.getSearchCriteria();
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

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
<input type="hidden" name="type" value="germplasm" />
<input type="hidden" name="search_action" value="" />
<input type="hidden" name="size" value="25" />
<input type="hidden" name="pageNum" value="" />
<input type="hidden" name="state" value="" />
<input type="hidden" name="query_id" value="" />

<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2" bgcolor="#ffffff">
      <tr>
	<td width="100%"> 
	  
          <h1>TAIR Germplasm Search Results</h1>
	  <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#F1EFEC">
	    <tr>
	      <td align="center" width="33%" class="sm">
		<input type="button" value="new search" onClick="javaScript:mySubmit('1','new_search', 25 )" ><BR>
		new germplasm search
	      </td>
	      
	      <td align="center" width="33%" class="sm" color="#666666">&nbsp; 
                <!--<input type="button" value="refine_search"><BR> -->
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
	<table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
	  <tr>
	    <td colspan="6">
	        <input type="button" name="check7" value="Check All" onClick="checkAll()">
	        &nbsp;&nbsp;&nbsp;
	        <input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()">
	    </td>
	    <td align="right" colspan="3"><input type="button" value="Order Checked Stock" onClick="mySubmit( 0, 'order', 25 )"></td>
	  </tr>

	<% for ( int i = 0; i < results.length; i++ ) { %>

          <tr align="left" <%=myBgColor.toggleBgColor()%> valign="bottom"> 
            <th class="sm">Check to<br>Download</th>
            <th class="sm">Germplasm<br>Name/Image</th>
            <th class="sm">Polymorphism/Locus</th>
            <th class="sm" align="center">Background</th>
            <th class="sm">Donor/<br>Originator</th>
            <th class="sm" align="center">Stock<br>Number/Type</th>
            <th class="sm" align="center">Order</th>
           </tr>

	  <tr <%=myBgColor.get_color()%> valign="top">
      	    <td class="sm" align="left"><%= floor++ %> <input type="checkbox" name="id" value="<%= results[ i ].getGermplasmID() %>"></td>
            <td class="sm">
               <a href="/servlets/TairObject?id=<%= results[ i ].getTairObjectID() %>&type=germplasm"><%= results[ i ].getGermplasmName() %></a>
               <% if ( results[ i ].hasImages() ) { 
                      out.println( "<br>" );
                      Iterator imageIter = results[ i ].getImages();
                      TfcImage image = null;
                      boolean firstImage = true;
                      while ( imageIter.hasNext() ) { 
                          image = (TfcImage) imageIter.next();
                          if ( !firstImage ) {
                              out.write( "<br>" );
                          }
                          firstImage = false;
                %>
                          <a href="/jsp/common/image.jsp?id=<%= image.get_image_id() %>&format=<%= image.getLinkSuffix() %>"><img src="/images/camera.gif" border="0"></a>
                   <% } %>
                <% } %>
            </td>

            <td class="sm">
                <% if ( results[ i ].hasPolymorphisms() ) { %>
                   <table cellpadding="0" cellspacing="1" border="0">
                <%
                      Iterator polyIter = results[ i ].getPolymorphisms();
                      PolymorphismLite poly = null;
                      while ( polyIter.hasNext() ) {
                          poly = (PolymorphismLite) polyIter.next();
                %>
                      <tr valign="top">
                         <td class="sm"><a href="/servlets/TairObject?id=<%= poly.getRefPolymorphismID() %>&type=polyallele"><%= poly.getOriginalName() %></a>&nbsp;</td>
                         <td class="sm">
                            <% if ( poly.hasLocus() ) {  
                               Iterator locusIter = poly.getLocus();
                               TfcLocus locus = null;
                               while ( locusIter.hasNext() ) {
                                  locus = (TfcLocus) locusIter.next();
                             %>
                               <a href="/servlets/TairObject?id=<%= locus.get_locus_id() %>&type=locus"><%= locus.get_name() %></a><br>
                             <% } %>
                            <% } else { %>
                               &nbsp;
                            <% } %>
                          </td>
                        </tr>
                     <% } %>
                   </table>
                 <% } %>
                &nbsp;
            </td>

            <td class="sm" align="center">
                <% if ( results[ i ].hasSpeciesVariants() ) { 
                     Iterator baseNameIter = results[ i ].getSpeciesVariants();
                     String baseName = null; 
                     Long speciesVariantID = null;
                     while ( baseNameIter.hasNext() ) {
                         baseName = (String) baseNameIter.next();
                         speciesVariantID = results[ i ].getSpeciesVariantID( baseName );
                %>
                         <a href="/servlets/TairObject?type=species_variant&id=<%= speciesVariantID %>"><%= baseName %></a><br>
                 <% } %>
               <% } %>
                &nbsp;
            </td>

            <td class="sm">
                <% Iterator donorIter = results[ i ].getDonors();
                   ListCommunity donor = null;
                   if ( donorIter != null ) {
                      while ( donorIter.hasNext() ) {
                          donor = (ListCommunity) donorIter.next();
                %>
                          <a href="/servlets/TairObject?type=<%= donor.getCommunityType() %>&id=<%= donor.getCommunityID() %>"><%= donor.getDisplayName() %></a><br>
                     <% } %>
                <% } %>
                &nbsp;
            </td>

             <!-- only show order checkbox if germplasm has a stock that is available -->
            <% if ( results[ i ].getStocks() != null ) { %>
                 <% Iterator stockIter = results[ i ].getStocks();
                    boolean first = true;
                    while ( stockIter.hasNext() ) {
                       TfcStock stock = (TfcStock) stockIter.next();
                 %>
                   <% if ( !first ) { %>
                     <tr>     
                         <td class="sm" colspan="7">&nbsp;</td>   
                   <% } %>

                       <td class="sm" align="center"><a href="/servlets/TairObject?type=stock&id=<%= stock.get_stock_id() %>"><%= stock.get_name() %></a><br><%= stock.get_stock_type() %></td>
                       <% if ( DataConstants.getAvailableStock().equals( stock.get_stock_availability_type() ) ) { %>
 		          <td class="sm" align="center"><input type="checkbox" name="stock_number" value="<%= stock.get_name() %>"></td>
                        <% } else { %>
 		          <td class="sm" align="center"><%= stock.get_stock_availability_type() %></td>
                        <% } %>

                     <% first = false; %>
                   </tr>
                <% } %>
 
            <% } else { %>
	   	 <td class="sm" colspan="2">not an ABRC stock</td>
	       </tr>

  	    <% } %>

	       <tr <%=myBgColor.get_color()%>>
	       <th class="sm" valign="top">Phenotype</th>
	       <td class="sm" colspan="6"><%= EmptyTextConverter.convert( TextConverter.truncateString( results[ i ].getPhenotype(), 300 ) ) %>&nbsp;</td>
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
