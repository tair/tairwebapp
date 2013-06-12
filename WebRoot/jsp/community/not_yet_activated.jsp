<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "User Account Not Activated";
String highlight = "1";
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


<center>
<font class="mainheader">User Account Not Activated</font>
</center>

<p>
Your registration data has been loaded into the database but your
account has not yet been activated.  You will be notified by email as
soon as your account has been activated. Activation usually takes less 
than 24 hours, after which you can place stock orders.  Please wait and 
try again later.

<p>
If you do not receive an email notifying you that your 
account has been activated within 24 hours, please contact
<a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
