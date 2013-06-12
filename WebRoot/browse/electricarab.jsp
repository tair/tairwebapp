<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%!
String pageName = "Browse";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%= cssfile %>" />
<jsp:param name="id" value="64" />
</jsp:include>

<jsp:include page="/jsp/includes/browseSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Archived e-Journals" />
</jsp:include>

<div id="rightcolumn">


<span class="mainheader">Archived e-Journals</span>
<!-- CONTENT IN HERE -->
 <dl>
The following are old Arabidopsis publications that are only available as electronic files.
<p>
<dt><a href="/ais/newaishint.jsp"> The Electronic Arabidopsis Information Service</a></dt>
<dd> The original journal was published from 1964 to 1990 and is available here in a  browsable electronic format. The AIS contains information on all aspects of Arabidopsis research and many protocols for Arabidopsis.</dd>

<dt><a href="/weedsworld/index.jsp"> Weeds World</a></dt>
<dd>Browse the international electronic Arabidopsis newsletter. </dd>

<dt><a href="/servlets/Search?action=new_search&type=publication"> Search AIS and Weeds World</A></dt>
<dd>TAIR's Publication Search includes AIS and Weeds World.</dd>
</dl>

<p><center>Last modified on September 1, 2006</center></p>

</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


