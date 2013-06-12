<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*,java.io.*"%>


<%!
String pageName = "Functional Categorization Charts";
String highlight = "1";
%>

<%
String compGifName = (String)request.getAttribute("comp_gif_name");
String procGifName = (String)request.getAttribute("proc_gif_name");
String funcGifName = (String)request.getAttribute("func_gif_name");
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<form action="<%=response.encodeURL("/servlet/Search")%>" name="goslim_pie" method="get">
<input type="hidden" name="action" value="chartify">

<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
       <tr>
      	<td>&nbsp;</td>
      </tr>
      <tr>
	<td width="100%" align="left"> 
          <b><font size="+1">Charts for Functional Categorization</font></b> 
	[<A href="/help/helppages/go_slim_help.jsp" target="_blank">Help</A>]
	</td>
      </tr> 
      <tr>
	<td width="100%" align="center"> 
	<% if ( request.getParameter("chartType").equals("loci")) {%>
          <img style="margin:10px" src="/i/GOslim_formula.jpg" alt="GOslim Formula"/>
	<% } %>
	<% if ( request.getParameter("chartType").equals("annotation")) {%>
		<img style="margin:10px" src="/i/GOslim_formula_pie.jpg" alt="GOslim Formula"/>
		<% } %>
	</td>
      </tr> 
       <tr>
      	<td>&nbsp;</td>
      </tr>

	<% if(compGifName != null && compGifName.length() > 0){ %>
	 <tr><td>
	  <img style="margin: 10px 0" src="<%=compGifName%>" alt="GO Cellular Component">
	 </td></tr>
	<% } %>

	<% if(procGifName != null && procGifName.length() > 0){ %>
	 <tr><td>
	  <img style="margin: 10px 0" src="<%=procGifName%>" alt="GO Biological Process">
	 </td></tr>
	<% } %>

	<% if(funcGifName != null && funcGifName.length() > 0){ %>
	 <tr><td>
	  <img style="margin: 10px 0" src="<%=funcGifName%>" alt="GO Molecular Function">
	 </td></tr>
	<% } %>

      <tr>
        <td><A href="/tools/bulk/go/index.jsp">Go back to search page</A>
        </td>
      </tr>        
</table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
