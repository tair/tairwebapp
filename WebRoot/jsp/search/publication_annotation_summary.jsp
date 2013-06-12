<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*"%>
<%!
String pageName = "Annotation Search Results";
%>

<% 
// get results of search
String summaryType = "annotation";
String query_id = ( String ) request.getAttribute( "query_id" );
//String sessionID = (String)request.getSession( true ).getId();
String searchCriteria = ( request.getAttribute( "searchCriteria" ) != null ) ? ( String )request.getAttribute( "searchCriteria" ) : " ";
int pageSize = ( request.getAttribute( "size" ) != null ) ? ( ( Integer )request.getAttribute( "size" ) ).intValue() : 25;
int currentPage = ( request.getAttribute( "pageNum" ) != null ) ? ( ( Integer )request.getAttribute( "pageNum" ) ).intValue() : 1;
String sortColumn = "keyword_category"; // sort preference for display of annotations from publication detail page  
ResultsFetcher results = new ResultsFetcher( query_id, summaryType );
results.setPageSize( pageSize );
results.setSort( sortColumn );
int end = currentPage * pageSize;
int start = end - pageSize;
//if ( currentPage == 1 ) { // invoke sorting only before display of first page
//results.setSort( sortColumn, start, end );
//}
results.setSummaryPage( currentPage );
// set up the paging links for display at the bottom of the page
String scrollLinks = null;
if ( results.getTotPages() > 0 ) {
scrollLinks = ScrollCalculator.getTableScrollLinks( pageSize, currentPage, results.getTotPages(), query_id );
}
%>

<SCRIPT LANGUAGE="JavaScript">
<!--

function mySubmit( pageNum, action, size, query_id ) {
document.annotation_search_result.pageNum.value = pageNum;
document.annotation_search_result.action.value = action;
document.annotation_search_result.size.value = size;
document.annotation_search_result.query_id.value = query_id;
document.annotation_search_result.submit();
}

// -->
</SCRIPT>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<form action="<%=response.encodeURL("/servlet/Search")%>" name="annotation_search_result" method="post">
<input type="hidden" name="action" value="search">
<input type="hidden" name="type" value=<%=summaryType%>>
<input type="hidden" name="size" value=<%=pageSize%>>
<input type="hidden" name="query_id" value=<%=query_id%>>
<input type="hidden" name="pageNum" value=<%=currentPage%>>
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
<tr>
<td width="100%" align="left"> 
<SPAN class="header">TAIR Annotation Search</SPAN>
[<A href="/help/helppages/annotation_search.jsp" target="_blank">Help</A>]
</td>
</tr>

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
<td>
<table width="100%" border="0" cellspacing="0">
<tr  <%=myBgColor.toggleBgColor()%> >
<%--
<th class="sm"><%=results.getDisplayName("locus_links")%></th>
<th class="sm"><%=results.getDisplayName("tair_object_name")%></th>
--%>
<th class="sm">Locus/ Gene Model</th>
<th class="sm">Gene Symbol/Full Name</th>

<th class="sm"><%=results.getDisplayName("relationship_type")%><BR><%= DefinitionsLookup.createPopupLink("RelationshipType","relationship_type") %></th>
<th class="sm"><%=results.getDisplayName("keyword")%><BR></th>
<th class="sm"><%=results.getDisplayName("keyword_category")%><BR><%= DefinitionsLookup.createPopupLink("KeywordType","keyword_type") %></th>
<th class="sm" nowrap>
        <I><%=results.getDisplayName("evidence_code")%></I><%= DefinitionsLookup.createPopupLink("EvidenceDescription","evidence_code") %><B>:</B><BR>
	 <%=results.getDisplayName("evidence_description")%><%= DefinitionsLookup.createPopupLink("EvidenceDescription","description") %><B>:</B><BR>
	 <%=results.getDisplayName("evidence_with")%><%= DefinitionsLookup.createPopupLink("TairObjKeyEvidence","evidence_with") %><B>:</B><BR>
	 <%=results.getDisplayName("reference_label")%><%= DefinitionsLookup.createPopupLink("Reference","class") %>
</th>
<th class="sm" nowrap><%=results.getDisplayName("annotated_by")%>/<BR><%=results.getDisplayName("date_last_modified")%></th>
</tr>

<%for (int row_num = 0; row_num < results.getPageSize(); row_num ++) {
if ((results.getStartRow() + row_num) <= results.getResultSetSize()) {%>
<tr <%=myBgColor.toggleBgColor()%> valign="top">
<td class="sm"><%=results.getCell(row_num,"locus_links")%></td>
<td class="sm"><%=results.getCell(row_num,"locus_symbol_links")%></td>
<%--
<td class="sm"><%=results.getCell(row_num,"locus_links")%></td>
<td class="sm">
    <A href="/servlets/TairObject?accession=<%=results.getCell(row_num,"tair_object_type")%>:<%=results.getCell(row_num,"tair_object_id")%>">
      <%=results.getCell(row_num,"tair_object_name")%></A></td>
--%>
<td class="sm"><%=results.getCell(row_num,"relationship_type")%></td>
<td class="sm">
  <A href="/servlets/TairObject?type=keyword&id=<%=results.getCell(row_num,"keyword_id")%>">
    <%=results.getCell(row_num,"keyword")%></A></td>
<td class="sm"><%=results.getCell(row_num,"keyword_category")%></td>
<td class="sm"> 
    <I><%=results.getCell(row_num,"evidence_code")%></I><B>:</B><BR>
       <%=results.getCell(row_num,"evidence_description")%><B>:</B><BR>
       <%=AnnotationSummary.buildEvidenceWithInfo(results.getCell(row_num,"evidence_with"))%><B>:</B><BR>       
       <A href="/servlets/TairObject?type=<%=results.getCell(row_num,"reference_type")%>&id=<%=results.getCell(row_num,"reference_id")%>">
       <%=results.getCell(row_num,"reference_label")%></A>
</td>    
<td class="sm"> 
       <%=results.getCell(row_num,"annotated_by")%>/
       <%=results.getCell(row_num,"date_last_modified")%>
</td> 
</tr>

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

