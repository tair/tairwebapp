<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - About TAIR";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="40" />
</jsp:include>

<jsp:include page="/jsp/includes/aboutSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value=""/>  
</jsp:include>


<div id="rightcolumn">

<iframe width='550' height='600' frameborder='0' src='http://spreadsheets.google.com/pub?key=p-Rc2FXcsr8-u5lVH1ZXxMQ&output=html&gid=16&single=true&widget=true'></iframe>

<p>Feel free to add <a href="http://spreadsheets.google.com/viewform?key=p-Rc2FXcsr88bTLB7FIK1Kw">comments</a> 
on the survey or your own feedback and suggestions for TAIR.</p>

<p>Please take a look at the <a href="http://spreadsheets.google.com/pub?key=p-Rc2FXcsr88bTLB7FIK1Kw&amp;output=html&amp;gid=0&amp;single=true">comments</a> 
that people have added.</p>
 
</div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
