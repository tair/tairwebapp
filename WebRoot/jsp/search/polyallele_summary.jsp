<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*"%>

<%!
String pageName = "Polymorphism/Allele Search Results";
String highlight = "1";
%>

<% 
// populate values needed for retrieving and displaying search results
// if the search was initiated from GeneralSearchHandler the search criteria will exist 
// in a SearchResultsCollection object the first time through, otherwise it will exist 
// in the request object
String summary_type = "polyallele";
String query_id = ( String ) request.getAttribute( "query_id" );
// default values
int page_size = 25;
int current_page = 1;
String search_criteria = " ";
if ( request.getAttribute( "searchCriteria" ) != null ) {
  search_criteria = ( String )request.getAttribute( "searchCriteria" );
  page_size = ( ( Integer )request.getAttribute( "size" ) ).intValue();
  current_page = ( ( Integer )request.getAttribute( "pageNum" ) ).intValue();
} else {
  SearchResultsCollection searchCollection = ( SearchResultsCollection ) request.getAttribute( "searchCollection" );
  search_criteria = searchCollection.getSearchCriteria();
}
ResultsFetcher results = new ResultsFetcher( query_id, summary_type );
results.setPageSize( page_size );
results.setSummaryPage( current_page );
// set up the paging links for display at the bottom of the page
String scrollLinks = null;
if ( results.getTotPages() > 0 ) {
  scrollLinks = ScrollCalculator.getTableScrollLinks( page_size, current_page, results.getResultSetSize(), results.getTotPages(), search_criteria, query_id );
}
 
%>


<SCRIPT LANGUAGE="JavaScript">
<!--

function mySubmit(pageNum, action, size, searchCriteria, query_id) {
    document.polyallele_search_result.pageNum.value = pageNum;
    document.polyallele_search_result.action.value = action;
    document.polyallele_search_result.size.value = size;
    document.polyallele_search_result.searchCriteria.value = searchCriteria;		
    document.polyallele_search_result.query_id.value = query_id;
    document.polyallele_search_result.submit();
}


function checkAll()
    {
	for(i=0;i<document.polyallele_search_result.elements.length;i++)
           {
             var c = document.polyallele_search_result.elements[i];   
             c.checked = i;   
	   }
    }
// here if ya need it
function unCheckAll()
    {
	for(i=0;i<document.polyallele_search_result.elements.length;i++)
           {
             var c = document.polyallele_search_result.elements[i];   
             c.checked ='';   
	   }
    }

// -->
</SCRIPT>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<form action="<%=response.encodeURL("/servlet/Search")%>" name="polyallele_search_result" method="get">
<input type="hidden" name="action" value="search">
<input type="hidden" name="type" value="<%=summary_type%>" />
<input type="hidden" name="size" value="<%=page_size%>" />
<input type="hidden" name="pageNum" value="<%=current_page%>" />
<input type="hidden" name="searchCriteria" value="<%=search_criteria%>" />
<input type="hidden" name="query_id" value="" />
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
      <tr>
	<td width="100%" align="left"> 
      <%--    <H1>TAIR Polymorphism/Allele Search Results</H1>[<a href="/help/helppages/polyres.jsp">Help</a>] --%>

           <b><font size="+1">TAIR Polymorphism/Allele Search Results</font></b> [<a href="/help/helppages/polyres.jsp">Help</a>]<br>

	  <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#F1EFEC">
	    <tr>
	      <td align="center" width="33%" class="sm">
		<input type="button" value="new search" onClick="javaScript:mySubmit('1','new_search', 25)" ><BR>
		new polymorphism/allele search
	      </td>
	      <td align="center" width="34%" class="sm">
		<input type="button" value="download" onClick="javaScript:mySubmit( 0,'download', 25, '','<%=query_id%>')" ><BR>
		check the boxes below and download results
	      </td>
	    </tr>
	  </table>
	</td>
      </tr>
      
      <tr>
	<td>&nbsp;</td>
      </tr>
	 <tr>
	   <% if ( results.getResultSetSize() > 0 ) { %>
         	<td>
           	<%=search_criteria%> <%=results.getResultSetSize()%> records.
            	<p>
             	 Displaying <%=results.getStartRow()%> - <%=results.getEndRow()%> of <%=results.getResultSetSize()%> records on page <%=current_page%> of <%=results.getTotPages()%> pages.
         	</td>
	   <% } else { %>
		<td>
           	<%=search_criteria%> <%=results.getResultSetSize()%> records.
            	<p>
            	Please consider the following as you modify your query and try again:<br><br>
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Check the spelling.<br><br>
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- For a broader or narrower search make the appropiate selection from the name drop-down menu.<br>
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- If you are searching based upon location, check that the appropriate map type or range is entered.</font></P><br>
	 	</td>
	<% } %>
       </tr>
           <% if ( results.getResultSetSize() > 0 ) { %>

        <tr valign="top" bgcolor="#F5F9FF">
           <td><input type="button" name="check7" value="Check All" onClick="checkAll()"><input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()"></td>
        </tr> 

	<tr>
	   <td>
            <table width="100%" border="0" cellspacing="0">
              <tr  <%=myBgColor.toggleBgColor()%> > 
                <td class="sm">&nbsp; </td>
                <td class="sm" align="center"><%=results.getDisplayName("original_name")%><br><%=DefinitionsLookup.createPopupLink("Polymorphism","name")%></td>
                <td class="sm" align="center"><%=results.getDisplayName("aliases")%><br><%=DefinitionsLookup.createPopupLink("Alias","class")%></Td>
                <td class="sm" align="center"><%=results.getDisplayName("type")%><br><%=DefinitionsLookup.createPopupLink("Polymorphism","type")%></td>
		<td class="sm" align="center"><%=results.getDisplayName("locus")%><br><%=DefinitionsLookup.createPopupLink("Locus","class")%></td>
                <td class="sm" align="center"><%=results.getDisplayName("chromo_ui")%></td>
                <td class="sm" align="center">Start Position</td>
                <td class="sm" align="center">Map Links</td>
		<%--<td class="sm" align="center"><%=results.getDisplayName("map_links")%><br><%=DefinitionsLookup.createPopupLink("Tools","seqviewer")%></td>--%>
		<%-- <td class="sm" align="center">Germplasms (with phenotypes)<%=DefinitionsLookup.createPopupLink("Germplasm","class")%></td> --%>
             </tr>

          <%for (int row_num = 0; row_num < results.getPageSize(); row_num ++) {
		if ((results.getStartRow() + row_num) <= results.getResultSetSize()) {%>

             <tr <%=myBgColor.toggleBgColor()%> valign="top">
		<td class="sm" align="left" valign="top"><%=(results.getStartRow() + row_num)%><input type="checkbox" name="id" value="<%=results.getCell(row_num,"id")%>"></td>
		<td class="sm" nowrap valign="top"><A href="/servlets/TairObject?id=<%=results.getCell(row_num,"id")%>&type=polyallele"><%=results.getCell(row_num,"original_name")%>&nbsp;</A></td>
                <td class="sm" valign="top"><%=results.getCell(row_num,"aliases")%>&nbsp;</td>
                <td class="sm" valign="top"><%=results.getCell(row_num,"type")%>&nbsp;</td>

		<td class="sm" valign="top">
                <% String[] loci = results.getLookupCell( row_num,"locus" );
                   String[] locus_ids = results.getLookupCell( row_num,"locus_id" );                    
                   for ( int i = 0; i < locus_ids.length; i ++ )  { 
                        if ( i > 0 ) %> , <% ; %>
                        <A href="/servlets/TairObject?id=<%=locus_ids[i]%>&type=locus"><%=loci[i]%></A>
	        <% }%>
                &nbsp;</td>

		<td class="sm" valign="top"><%=results.getCell(row_num,"chromo_ui")%>&nbsp;</td>
		<td class="sm" valign="top"><%=results.getCell(row_num,"position")%>&nbsp;</td>
		<% if (results.getCell(row_num,"seqviewer").length() != 0){ %>
            <td class="sm" valign="top"><%=results.getCell(row_num,"seqviewer")%>&nbsp; <br> 
            <A href="/cgi-bin/gbrowse/arabidopsis/?name=<%=results.getCell(row_num, "original_name")%>">GBrowse</A>    
            </td>
	    <% }else{%>
            <td> &nbsp; </td>
        <% }    %>
<%--		<td class="sm" valign="top" align="center">
<%
		String has_germplasms_phenotypes = "none available";
		String[] has_germplasms_array = results.getLookupCell( row_num, "has_germplasms" );
		if( has_germplasms_array != null &&
		    has_germplasms_array.length > 0 &&
		    has_germplasms_array[0].equalsIgnoreCase("true") )
		{
			String has_phenotypes = "none available";
			String[] has_phenotypes_array = results.getLookupCell( row_num, "has_phenotypes" );
			if( has_phenotypes_array != null &&
			    has_phenotypes_array.length > 0 &&
			    has_phenotypes_array[0].equalsIgnoreCase("true") )
			{
				has_phenotypes = "yes";
			}

			has_germplasms_phenotypes = "yes (" + has_phenotypes + ")";
		}
%>
		<%=has_germplasms_phenotypes%>
		&nbsp;</td>--%>

            </tr>
<%
	String description = results.getCell(row_num,"description");
	if( description != null && false == description.trim().equals( "" ) )
	{
%>
	    <tr <%=myBgColor.sameBgColor()%>>
		<td class="sm" valign="top"><b>Description:</b></td>
	        <td colspan="7" class="sm" valign="top"><%=description%>&nbsp;</td>
	    </tr>
<%
	}
%>
	  <% }%>
	  <% }%>
          <% }%>
         </table>
        </td>
      </tr>
</table>
</form>

    <% if ( scrollLinks != null ) { %>
      <tr>
          <td class="sm" align="center"><%= scrollLinks %></td>
      </tr>
    <% } %>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
