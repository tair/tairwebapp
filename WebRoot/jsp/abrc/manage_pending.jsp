<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.tair.abrc.order.*, org.tair.community.*, java.util.*" %>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="Manage Pending Orders" />
</jsp:include>

<script type="text/javascript" src="/js/prototype.js"></script>

<div style="margin: 20px 30px 0 30px">
<% String msg = (String) request.getAttribute("msg"); if(msg != null) { %>
<p class="mainheader">Payment Result</p>
<p style="font-size: 1.2em"><%=msg%></p>
<% } %>
</div>

<% List<Order> orders = (List<Order>) request.getAttribute("orders"); %>
<h2 class="mainheader" style="margin-left: 30px">Pending Orders</h2>
<div style="border: 2px solid grey; height: 400px; overflow: auto">
<table align="center" width="700" cellpadding="2" cellspacing="0" border="1">
<tr>
 <th>ID</th>
 <th>Order Number</th>
 <th>Person</td>
 <th>Org</th>
 <th>Stocks</th>
 <th>Last Changed</th>
 <th>Actions</th>
</tr>

<% if(orders != null || orders.size() == 0) { for(Order o: orders) { %>
 <tr>
  <td><%=o.getId()%></td>
  <td><%=o.getOrderNumber()%></td>
  <td><%=o.getPersonFullName()%> (<%=o.getPersonId()%>)</td>
  <td><%=o.getOrgId()%></td>
  <td><%=o.getItems(LineItem.Type.STOCK).size()%></td>
  <td><%=String.format("%1$tF %1$tl:%1$tM %1$Tp", o.getDateLastChanged())%></td>
  <td><%if(o.getOrderNumber() != null){%><a href="#" onclick="post_it('<%=o.getOrderNumber()%>')">finalize from DB</a><%}%></td>
 </tr>
<% }} %>

</table>
</div>

<div style="margin: 20px 30px 0 30px">
<form action="" method="post">
<p class="mainheader">Clear Pending Orders</p>
Clear pending orders that are older than
  <input type="hidden" name="cmd" value="clear">
	<select id="pending_orders_date" name="pending_orders_date">
		<option value="7">one week</option>
  	<option value="14">two weeks</option>
  	<option value="30">30 days</option>
	</select>
	<input type="submit">
</form>
</div>

<div style="margin: 20px 30px 0 30px">
<p class="mainheader">Submit Payment Info</p>
<div style="border: 1px solid black" id="submit-box">
 <form action="" method="post">
  <p style="padding:5px 10px">Paste the payment info from the CyberSource email and press submit. <input type="submit" value="submit">
  <textarea cols="70" rows="15" name="payment-info"></textarea></p>
  <input type="hidden" name="cmd" value="finalize">
 </form>
</div>
</div>

<form id="finalize-form" action="" method="POST">
<input type="hidden" name="cmd" value="attempt">
<input type="hidden" name="order-number" value="" id="onum">
</form>
<script type="text/javascript">
function post_it(num){
 $('onum').value = num;
 $('finalize-form').submit();
}
</script>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
