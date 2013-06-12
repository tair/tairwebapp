<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="Curator Order" />
</jsp:include>

<div style="text-align:center">
<form action="/servlets/Order/proxy" method="post">
 <p class="mainheader">Curator Proxy Order</p>
 <p>To place an order for a user, enter his/her person ID below and click "Submit".</p>
 <p>Person ID: <input type="text" name="personID" size="10" maxlength="10"></p>
 <p><input type="submit" value="Submit"></p>
</form>
</div>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
