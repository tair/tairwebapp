<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%
    String htmlSource = (String)request.getAttribute("html_source");
    out.println(htmlSource);
%>
