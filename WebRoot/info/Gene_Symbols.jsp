<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("Gene Symbols") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("3") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<font color=red>
NOTE: This page is no longer in use. Please go to the <a href="/jsp/processor/genesymbol/symbol_main.jsp">New Gene Symbol Registry Page</a>. You will be redirected there in 5 seconds. Please update your bookmarks.
</font>
<P>
<span class=header>Mutant Gene Symbol List</span><br>
		    <br>
<jsp:include page="/jsp/includes/infominiheader.jsp" flush ="true">
<jsp:param name="link" value="genesymbols" />
</jsp:include>

<script language="javascript" src="/js/footer.js"></script>



</body>

</html>
