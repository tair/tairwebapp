<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!String pageName = "TAIR - About TAIR - TAIR Software";
  String cssfile = "/css/page/pagelevels.css";%>

<%@ page errorPage="/jsp/common/gen_error.jsp"
	import="org.tair.tfc.*,org.tair.querytools.*,org.tair.utilities.*,java.util.*,java.net.*"%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="cssfile" value="<%=cssfile %>" />
	<jsp:param name="id" value="406" />
</jsp:include>

<jsp:include page="/jsp/includes/aboutSidebar.jsp" flush="true">
	<jsp:param name="sidebarName" value="TAIR Software" />
</jsp:include>

<div id="rightcolumn">


	<!--		
			Content goes here
			
		//-->
	<span class="mainheader">TAIR Software</span>
	<p>
		On this page you will find documentation and licenses for the software
		developed at TAIR.
	</p>
	<dl>

		<dt>
			<a href="/about/non-profit.pdf"> Source Code License for
				Non-Profit Organizations</a>
		<dt>
			<a href="/about/profit.pdf"> Source Code License for For-Profit
				Organizations</a>
		<dt>
			<a href="https://github.com/tair/psql">Plant/SQL</a>
		<dd>
			An AntLR parser for the ANSI SQL SELECT statement that extends the
			SQL syntax with plant-biology-related expressions useful in querying
			information from the
			<a href="/about/data_warehouse.jsp">PLAIN Data Warehouse.</a>
		<dt>
			<a href="/biocyc/perlcyc/index.jsp">PerlCyc</a>
		<dd>
			A Perl module for accessing internal Pathway-Tools functions.
		<dt>
			<a href="/about/Perl_Scripts.jsp">Useful Perl Scripts</a>
		<dd>
			Miscellaneous Perl scripts used at TAIR.
	</DL>


	<center>
		Last modified on March 31, 2006
	</center>
</div>
<!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
