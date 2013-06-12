<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*,java.io.*,java.util.*"%>

<%!
String pageName = "Expression Search Not Found LIsting";
String highlight = "1";
%>

<% 
// get not found list
String summaryType = ( request.getParameter( "type" ) != null ) ? ( String )request.getParameter( "type" ) : " ";
String sessionID = (String)request.getSession( true ).getId();
File uploadedFile =  ( request.getAttribute( "uploadedFile" ) != null ) ? ( File )request.getAttribute( "uploadedFile" ) : null;
String namesList =  ( request.getAttribute( "namesList" ) != null ) ? ( String )request.getAttribute( "namesList" ) : " ";
String nameType = ( request.getAttribute( "nameType" ) != null ) ? ( String )request.getAttribute( "nameType" ) : " ";
NotFoundFetcher ntfList = null;
if ( uploadedFile == null ) {
// use the namesList - the default
    ntfList = new NotFoundFetcher( sessionID, summaryType, namesList ); 
} else {
    ntfList = new NotFoundFetcher( sessionID, summaryType, uploadedFile );    
}
ntfList.setNTFList( nameType );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<form action="<%=response.encodeURL("/servlet/Search")%>" name="expression_ntf" method="post">
<input type="hidden" name="action" value="ntfListing">
<input type="hidden" name="type" value=<%=summaryType%>>
<input type="hidden" name="nameType" value=<%=nameType%>>
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
<tr>
<td width="100%" align="left"> 
<SPAN class="header">TAIR Microarray Expression Search Not Found List
</td>
</tr>
<tr>
<td class="sm">&nbsp; </td>
</tr>
<tr>
<% if ( ntfList.getResultSetSize() > 0 ) { %>
        <td>
Your submitted list of <%=nameType%> names resulted in <font class="emphasis"><%=ntfList.getResultSetSize()%></font> names that did not contribute to the expression search results set. 
        </td>
<% } else { %>
        <td>
no names were not found 
        </td>
<% } %>
</tr>      
<% if ( ntfList.getResultSetSize() > 0 ) { %>
        <tr>
        <td>
        <table width="100%" border="0" cellspacing="0">      
<%
String name = null;
Iterator iter = ntfList.getNTFNames();
while ( iter.hasNext() ) {
   name = ( String )iter.next();
%>
        <tr  <%=myBgColor.toggleBgColor()%> >
        <td class="sm">&nbsp; </td>  
        <td class="sm" align="left" valign="top"><%=name%></td>
        <td class="sm">&nbsp; </td> 
        </tr>
<% } %>
   </table>
<% }%> 


</table>
</form>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
