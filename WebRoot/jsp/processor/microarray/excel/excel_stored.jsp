<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.processor.microarray.data.LoadableExpressionSet, org.tair.processor.microarray.data.InsertLogger, org.tair.utilities.EmptyTextConverter"
%>


<%!
String pageName = "Microarray Data Stored";
%>

<%
LoadableExpressionSet expressionSet = (LoadableExpressionSet) request.getAttribute( "expressionSet" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>




<H4>Microarray Data Loaded</H4>

<p>
Data has been loaded for the the following expression set. 
Review data using the TAIR expression set detail pages by clicking on the
hyperlink provided:

<p>
<a href="/servlets/TairObject?type=expression_set&id=<%= expressionSet.get_tair_object_id() %>"><%= expressionSet.get_original_name() %></a>

<br><br><br>

<!-- display loading log messages, then reset log for use in another load -->
<%= EmptyTextConverter.convert( InsertLogger.getHTMLLoadMessages() ) %>

<% InsertLogger.reset(); %>



<p>
<a href="/servlets/processor?type=upload_microarray&upload_action=new">Load another Excel file</a>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />