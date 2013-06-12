<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.search.*, org.tair.utilities.*, java.util.*, java.net.*, org.tair.tfc.*"%>

<%!
String pageName = "Genetic Marker Search Results";
String highlight = "1";
%>

<% 
// get results of search
SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );
GeneticMarkerSummary[] results = (GeneticMarkerSummary[]) searchCollection.getResults();
String query_id = (String) request.getAttribute( "query_id" );
int resultSize = searchCollection.getResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String scrollLinks = searchCollection.getScrollLinks();
String searchCriteria = searchCollection.getSearchCriteria();
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<SCRIPT LANGUAGE="JavaScript">
<!--

function mySubmit(page_number, action, size, query_id) {
    document.marker_search_result.pageNum.value = page_number;
    document.marker_search_result.search_action.value = action;
    document.marker_search_result.size.value = size;
    document.marker_search_result.query_id.value = query_id;
    document.marker_search_result.submit();
}


function checkAll()
    {
	for(i=0;i<document.marker_search_result.elements.length;i++)
           {
             var c = document.marker_search_result.elements[i];   
             c.checked = i;   
	   }
    }
// here if ya need it
function unCheckAll()
    {
	for(i=0;i<document.marker_search_result.elements.length;i++)
           {
             var c = document.marker_search_result.elements[i];   
             c.checked ='';   
	   }
    }

// -->
</SCRIPT>



<form action="<%=response.encodeURL("/servlets/Search")%>" name="marker_search_result" method="get">
<input type="hidden" name="search_action" value="" />
<input type="hidden" name="type" value="marker" />
<input type="hidden" name="size" value="25" />
<input type="hidden" name="pageNum" value="" />
<input type="hidden" name="query_id" value="" />
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
      <tr>
	<td width="100%" align="left"> 
          <H1>TAIR Genetic Marker Search Results</H1>
	  <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#F1EFEC">
	    <tr>
	      <td align="center" width="33%" class="sm">
		<input type="button" value="new search" onClick="javaScript:mySubmit('1','new_search', 25 )" ><BR>
		new genetic marker search
	      </td>
	      
	      <td align="center" width="33%" class="sm" color="#666666"> 
                <!--<INPUT type="button" value="refine_search"><BR> -->
		<!--<FONT color="#666666">search within this list<br>
		  (available soon)</FONT> -->
                &nbsp;
	      </td>
	      <td align="center" width="34%" class="sm">
		<input type="button" value="download" onClick="javaScript:mySubmit( 0,'download', 25, '<%=query_id%>')" ><BR>
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

        <tr valign="top" bgcolor="#F5F9FF">
           <td><input type="button" name="check7" value="Check All" onClick="checkAll()"><input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()"></td>
        </tr> 

	<tr>
	   <td>
            <table width="100%" border="0" cellspacing="0">
              <tr  <%=myBgColor.toggleBgColor()%> > 
                <td class="sm">&nbsp; </td>
                <td class="sm"><A href="/help/helppages/markerre.jsp#447636">Marker Name</A></td>
                <td class="sm"><A href="/help/helppages/markerre.jsp#447724">Aliases</A></Td>
                <td class="sm"><A href="/help/helppages/markerre.jsp#447641">Type</A></td>
                <td class="sm"><A href="/help/helppages/markerre.jsp#447638">Chrom</A></td>
                <td class="sm"><A href="/help/helppages/markerre.jsp#447639">Start Position</A></td>
                <td class="sm">Map Links</td>
             </tr>

          <% for ( int i = 0; i< results.length; i++ ) { %>
             <tr <%=myBgColor.toggleBgColor()%> valign="top">
      		<td class="sm" align="left" valign="top"><%= floor++ %><input type="checkbox" name="id" value="<%= results[ i ].get_genetic_marker_id() %>"></td>
		<td class="sm" valign="top"><A href="/servlets/TairObject?id=<%= results[ i ].get_genetic_marker_id() %>&type=marker"><%= results[ i ].get_name() %></A>&nbsp;</td>
                <td class="sm" valign="top"><%= EmptyTextConverter.convert( results[ i ].get_alias_string() ) %>&nbsp;</td>
                <td class="sm" valign="top"><%= EmptyTextConverter.convert( results[ i ].get_geneticmarker_type() ) %>&nbsp;</td>
		<td class="sm" valign="top"><%= EmptyTextConverter.convert( Units.translateChromosome( results[ i ].get_chromosome() ) ) %>&nbsp;</td>

             <!-- only show assignment & link to mapper if marker has assignments -->
             <% Iterator assignIter = results[ i ].getUniqueAssignments(); %>
             <% if ( assignIter != null ) { %>
                  
	        <td class="sm" valign="top">

                    <% while ( assignIter.hasNext() ) { %>
                         <% TfcGlobalAssignment assignment = (TfcGlobalAssignment) assignIter.next(); %>
                         <%= assignment.getFormatStartPosition() %> <%= assignment.getUnits() %><br>
                    <% } %>
                </td>
		<td class="sm" valign="top">
                   <!-- create link to map viewer if possible -->
                    <% boolean needBreak = false; %>
                    <% if ( results[ i ].showMapViewerLink() ) { %>
                       <A href="/servlets/mapper?value=<%= URLEncoder.encode( results[ i ].get_name() ) %>&action=search">map view</A>
                       <% needBreak = true; %>
                    <% } %>
                   
                   <!-- create links to seq viewer if possible -->
                   <% if ( results[ i ].isAGIMap() ) { %>
                       <% if ( needBreak ) { %>
                          <br>
                       <% } %>
                       <%= HTMLFactory.createSeqViewerLinks( "seqview", "marker", results[ i ].get_tair_object_id(), results[ i ].getAGIChromosomes(), "<br>" ) %>
                   <% } %>
                   &nbsp;
                    
                   <!-- create links to Gbrowse -->
                    <br>
                    <A href="/cgi-bin/gbrowse/arabidopsis/?name=<%=results[i].get_name()%>">GBrowse</A>
                    &nbsp;
                </td>

             <% } else { %>
                <td class="sm" colspan="2">&nbsp;</td>
              <% }%>

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
