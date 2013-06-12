<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<c:import url="/sitemap_tair.xsl" var="xslsite"/>

<%
String pageName = "TAIR - Sitemap";
String cssfile="/css/page/ais.css";
%>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<!--Sitemap content-->

<c:remove var="mapxml" scope="application"/>
<c:remove var="xslnav" scope="application"/>

<c:import url="/navigation.xsl" var="xslnav" scope="application"/>
<c:import url="/sitemap.xml" var="mapxml" scope="application"/>

<x:transform xml="${mapxml}" xslt="${xslsite}"/>

<!--End Sitemap content-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
