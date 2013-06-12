<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%!
String pageName = "Browse";
String highlight = "3";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%= cssfile %>" />
</jsp:include>

<jsp:include page="/jsp/includes/browseSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Monsanto SNP and Ler Collections" />
</jsp:include>

<div id="rightcolumn">
		
		<!-- Content goes here //--> 

<span class="mainheader">MONSANTO ARABIDOPSIS LANDSBERG ERECTA SEQUENCE COLLECTION HELP</span>
<table>
<tr>
<td colspan=2>
  <P>
<b>Released on Feb 28, 2002</b></a>
<P>
The Landsberg erecta genomic sequence provided here is the result of a low
coverage whole genome shotgun sequencing project carried out at Monsanto.  After removal of mitochondrial and chloroplast sequences, almost
500,000 traces containing 263Mb of sequence were used for assembly.  This
resulted in 50,262 contigs and 31,044 singletons totalling about 92Mb, which
are made available here.
</td>
</tr>
<tr>
<td colspan=2 align=center>
<br>
<br><a href="liability.jsp">General liability statement</a> | <a href="policy.jsp">Privacy policy and Security</a>
<P>
		</td>
	</tr>
</table>
</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>