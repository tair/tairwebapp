<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.search.*, org.tair.utilities.*, org.tair.abrc.stock.*, java.util.*, org.tair.querytools.*, org.tair.tfc.*" %>

<%!
String pageName = "Protein Search Results";
%>

<% request.setAttribute("helpfile", "/help/helppages/protres.jsp"); %>

<% 
// get results of search
SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );
AASequenceSummary[] results = (AASequenceSummary[]) searchCollection.getResults();
String queryID = (String) request.getAttribute( "query_id" );
int resultSize = searchCollection.getResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String scrollLinks = searchCollection.getScrollLinks();
String searchCriteria = searchCollection.getSearchCriteria();
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<script language='JavaScript'>
<!--


function mySubmit(page_number, action, size, query_id ) {
    document.search_result.pageNum.value = page_number;
    document.search_result.search_action.value = action;
    document.search_result.size.value = size;
    document.search_result.query_id.value = query_id;
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
<input type="hidden" name="type" value="protein" />
<input type="hidden" name="search_action" value="" />
<input type="hidden" name="size" value="25" />
<input type="hidden" name="pageNum" value="" />
<input type="hidden" name="query_id" value="" />

<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
      <tr>
	<td width="100%"> 
	   <b><font size="+1">TAIR Protein Search Results</font></b> [<a href="/help/helppages/protres.jsp">Help</a>]<br>
 
	  <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#F1EFEC">
	    <tr>
	      <td align="center" width="33%" class="sm">
		<input type="button" value="new search" onClick="javaScript:mySubmit('1','new_search', 25 )" ><BR>
		new protein search
	      </td>
	      
	      <td align="center" width="33%" class="sm" color="#666666">&nbsp;</td>

	      <td align="center" width="34%" class="sm">
		<input type="button" value="download" onClick="javaScript:mySubmit( 0, 'download', 25, '<%=queryID%>')" ><BR>
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
	<table width="100%" border="0" cellspacing="0" cellpadding="2">
	  <tr>
	    <td colspan="8">
	        <input type="button" name="check7" value="Check All" onClick="checkAll()">
	        &nbsp;&nbsp;&nbsp;
	        <input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()">
	    </td>
	  </tr>

          <tr align="left" <%= myBgColor.toggleBgColor()%> valign="bottom"> 
            <th class="sm">Check to<br>Download</th>
            <th class="sm">Name</th>
            <th class="sm" nowrap>Calc MW</th>
            <th class="sm" nowrap>Calc PI</th>
            <th class="sm">Length</th>
            <th class="sm">Locus/Gene Models</th>
            <th class="sm">Gene Symbol/Full Name</th>
            <th class="sm">Description</th>
           </tr>

	<% for ( int i = 0; i < results.length; i++ ) { %>
	  <tr <%=myBgColor.toggleBgColor()%> valign="top">

      	    <td class="sm" align="left"><%= floor++ %> <input type="checkbox" name="id" value="<%= results[ i ].getAASequenceID() %>"></td>
            <td class="sm"><a href="/servlets/TairObject?id=<%= results[ i ].getTairObjectID() %>&type=aa_sequence"><%= results[ i ].getName() %>&nbsp;</a></td>
            <td class="sm"><%= EmptyTextConverter.convert( results[ i ].getCalcMW() ) %>&nbsp;</td>
            <td class="sm"><%= EmptyTextConverter.convert( results[ i ].getCalcPI() ) %>&nbsp;</td>
            <td class="sm"><%= EmptyTextConverter.convert( results[ i ].getLength() ) %>&nbsp;</td>

           <% if ( results[ i ].hasGenes() ) { %>
               <% Iterator geneIter = results[ i ].getGenes();
                    GeneModelLite gene = null;
                    boolean first = true;
                    while ( geneIter.hasNext() ) {
                       gene = (GeneModelLite) geneIter.next();
               %>
                <% if ( !first ) { %>
                 <tr valign="top" <%= myBgColor.get_color()%>>
                   <td class="sm" colspan="5">&nbsp;</td>
                <% } %>

                   <td class="sm">
                        <% if ( gene.hasLocus() ) {
                               Iterator locusIter = gene.getLocus();
                               Locus locus = null;
                               while ( locusIter.hasNext() ) {
                                  locus = (Locus) locusIter.next();
                        %>
                        <a href="/servlets/TairObject?type=locus&id=<%= locus.get_locus_id() %>"><%= locus.get_name() %></a><br>
                        <% } %>
                        <% } %>/
                        <a href="/servlets/TairObject?type=gene&id=<%= gene.getGeneID() %>"><%= gene.getName() %></a></td>
                   <td class="sm">
                        <% if ( gene.hasLocus() ) {
                            Iterator locusIter = gene.getLocus();
                            Locus locus = null;
                            while (locusIter.hasNext() ){
                                locus = (Locus) locusIter.next();
                            %>
                            <%= locus.getSymbolDisplay() %></td>     
                        <% } %>
                        <% } %>
                    </td>
                   <td class="sm"><%= EmptyTextConverter.convert( TextConverter.truncateString( gene.getDescription(), 100 ) ) %>&nbsp;</td>


                <% first = false; %>
              <% } %>
          <% } else {%>
             <td colspan="3">&nbsp;</td>
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
