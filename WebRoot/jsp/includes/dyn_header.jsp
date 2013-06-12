<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="tt" uri="/WEB-INF/tairtags.tld"%>
<%
    String pageName = request.getParameter("pageName");
    if(pageName == null) pageName = "TAIR";
    String cssfiles[] = request.getParameterValues("cssfile");
%>
<html>
<head>
 <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
 <meta name="google-site-verification" content="SEVsCs5SRo40Yv69trkf5mDpaKLbU1zI-D_tfu6LMvU" />
 <title><%=pageName%></title>
 <link rel="Shortcut Icon" href="/favicon.ico" />
 <link rel="stylesheet" type="text/css" href="<tt:unique file="/css/main.css"/>" />
 <link rel="stylesheet" type="text/css" href="<tt:unique file="/css/search.css"/>" />
 <link rel="stylesheet" type="text/css" href="<tt:unique file="/css/base.css"/>" />
<% if(cssfiles != null) { for(String cssfile: cssfiles) { %>
 <link rel="stylesheet" type="text/css" href="<%= cssfile %>" />
<% }} %>
 <script type="text/javascript" src="/js/prototype.js"></script>
 <script type="text/javascript" src="/js/global.js?20091013141700"></script>
 <script type="text/javascript" src="/js/menu.js"></script>
 <script type="text/javascript" src="/js/footerNew.js"></script>
 <script type="text/javascript" src="/js/init.js"></script>
</head>
<body>

<div id="container">
<jsp:include page="/jsp/includes/header.jsp" flush ="true" />
<div id="content" class="clearfix">

<script type="text/javascript">is_logged_in(<%=org.tair.community.LoginChecker.isLoggedIn(request)%>)</script>

<% String pageId = request.getParameter("id");
   if(pageId != null && pageId.length() > 0) { %>

<%-- NOTE:
 mapxml and xslnav are variable global to the application that
 contain the cached sitemap.xml and navigation.xsl. They will need to be
 refreshed if either sitemap.xml or navigation.xsl are changed.  To
 refresh them, simply visit sitemap.jsp with a browser.
--%>
<c:if test="${(empty mapxml) or (empty xslnav)}">
	<c:import url="/navigation.xsl" var="xslnav" scope="application"/>
	<c:import url="/sitemap.xml" var="mapxml" scope="application"/>
</c:if>
<x:transform xml="${mapxml}" xslt="${xslnav}">
	<x:param name="id"><%=pageId%></x:param>
</x:transform>

<% } %>

<!-- end dyn_header.jsp -->
