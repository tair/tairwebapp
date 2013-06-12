<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%!
String pageName = "Stocks";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%= cssfile %>" />
<jsp:param name="id" value="102" />
</jsp:include>

<jsp:include page="/jsp/includes/stockSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Major ABRC Stocks" />
</jsp:include>

<div id="rightcolumn">


<span class="mainheader">Supplement to ABRC Catalog</span>
<p>Additional information not included in the ABRC catalog on insertion  lines, RI lines and other seed stocks.</p> 
<dl>
    <dd><a href="ecker_flank.jsp">Sequence-indexed T-DNA Lines from Joseph Ecker</a><br />
    <dd><a href="cshl_gtet.jsp">Gene and Enhancer Trap Lines from Cold Spring Harbor Laboratory</a><br />
    <dd><a href="tdna_lines.jsp">T-DNA seed pools and lines</a><br />
    <dd><a href="akf.jsp">Seed pools from the Arabidopsis Knockout Facility</a><br />
    <dd><a href="ima.jsp">Transposon lines</a><br />
    <dd><a href="henikoff.jsp">TILLING lines</a><br />
    <dd><a href="ri_mapping.jsp">Recombinant inbred and mapping populations</a><br />
    <dd><a href="ftp://ftp.arabidopsis.org/home/tair/Maps">RI Mapping data</a><br />
    <dd><a href="poethig.jsp">Enhancer Trap Lines from Scott Poethig</a><br />
    <dd><a href="brassica.jsp">Brassica Seed Stocks</a><br />
</dl>
<center>Last modified on September 26, 2006</center>
		</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
