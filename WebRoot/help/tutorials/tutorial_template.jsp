<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
e<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("<!--page title here//-->TutorialTemplate") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("0") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
</td></tr></table>
<link rel="stylesheet" type="text/css" href="/css/tutorial.css" />
<table width= "800 px">
<tr><td width ="200 px" style="background-color: #CCCCCC" valign="top" cellpadding="12">
<!--table of contents goes here //-->
<ul>
<h1><a name="top" class="menu"><!--anchors link to the top of the page//--></a><!--title here//--></h1>
<li><a href=""class="menu"><!--title here//--></a></li>
<li><a href="" class="menu"><!--title here//--> </a></li>
<li><a href=""class="menu"><!--title here//--></li>
<li class="on"><a href="" class="menu"><!--title of currently open page here//--></a></li>
<li><a href="" class="menu"><!--title here//--></a></li>
<li><a href=""class="menu"><!--title here//--></a></li>
<li><a href=""class="menu"><!--title here//--></a></li>
<li><a href=""class="menu"><!--title here//--></a></li>
</ul>
</td>

<!--End of menubar section//-->
<td width ="600 px" valign ="top">
<!--content goes  here//-->
</td></tr>
<tr><td width="200 px" style ="background-color:#CCCCCC" valign ="bottom"><a href="<!--prev page//-->"><img src="prev.jpg"/></a> <a href="#top"><img src="top.jpg"/></a> <a href="<!--next page//-->"><img src="next.jpg"/></a></td></tr>
</table>
