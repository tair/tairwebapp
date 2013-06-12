<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2003 NCGR.  All rights 
  reserved.
-->

<%@ page 
import="javazoom.upload.*, org.tair.community.*, java.util.*, java.lang.ClassLoader"
errorPage="/jsp/common/gen_error.jsp" 
%>

<%!
String pageName = "Bulk Image Loader";
String highlight = "7";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<iframe src="image_upload_inner.jsp" height="600px" width="100%" scrolling="auto" frameborder="no">
<p> your browser does not support frames</p>
</iframe>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
