<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%!
String pageName = "Order Placed";
%>

<%--
CompositeOrder order = (CompositeOrder) request.getAttribute( "order" );
--%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
</jsp:include>

<%=session.getAttribute("result")%>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
