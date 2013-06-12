<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR Help") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("0") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
<jsp:param name="colspan" value="2" />
</jsp:include>
<span class="mainheader">Curator Question/Answer Search</span>
<br>
<script language="JavaScript" SRC="/js/genhelpheader.js">
</script>
<br>
<p>This page has been removed. For frequently asked questions please see our <a href="faq.jsp">FAQ page</a>. Or email <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">TAIR curators</a>.</p>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
