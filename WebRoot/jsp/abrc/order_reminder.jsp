<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="Order In Progress" />
</jsp:include>

<table align="center">
 <tr>
  <td align="center"><font class="mainheader">Order In Progress</font></td>
 </tr>
 <tr>
  <td>
   <p>You have a stock order in progress.</p>
   <p>If you would like to complete the order, <a href="/servlets/Order/current">Click here</a></p>
   <p>If you would like to logout and cancel the order, <a href="/servlets/Community?action=logout&cancel=true">Click here</a>.</p>
   <p>If you would like to cancel the order and remain logged in, <a href="#" onclick="document.href = '/servlets/Order/cancel'">Click here</a>.</p>
  </td>
 </tr>
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
