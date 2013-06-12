<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.abrc.order.Order,org.tair.utilities.*"%>

<%
  Order order = (Order)request.getAttribute("order");
  float express = order.getExpressShippingCharge();
  boolean mandatory = order.isExpressShippingMandatory();
  boolean waived = order.getNoCharge();
  if (order != null && !mandatory && !waived) {
%>
<fieldset>
	<legend class="header">
		Shipping
	</legend>
	<p style="text-align: left">
		You may select express shipping below, but only the mail carrier and
		time in transit will be affected. The time for preparation of your
		order will remain the same. We must have your phone number to ship by
		express.
	</p>
	<form action="" method="post">
		<%
		  if (order.getExpressShipping()) {
		%>
		<span style="padding-left: 15px"><input type="radio" name="cmd"
				value="rm_expr_shipping" id="rm_expr_shipping"
				onclick="this.form.submit()"> <label for="rm_expr_shipping">
				Standard shipping (<%=TextConverter.floatToMoneyString(-express)%>)
			</label> </span>
		<span style="padding-left: 15px"><input type="radio" name="cmd"
				checked="checked" value="add_expr_shipping" id="add_expr_shipping"
				onclick="this.form.submit()"> <label for="add_expr_shipping">
				Express shipping
			</label> </span>
		<%
		  } else {
		%>
		<span style="padding-left: 15px"><input type="radio" name="cmd"
				checked="checked" value="rm_expr_shipping" id="rm_expr_shipping"
				onclick="this.form.submit()"> <label for="rm_expr_shipping">
				Standard shipping
			</label> </span>
		<span style="padding-left: 15px"><input type="radio" name="cmd"
				value="add_expr_shipping" id="add_expr_shipping"
				onclick="this.form.submit()"> <label for="add_expr_shipping">
				Express shipping (<%=TextConverter.floatToMoneyString(express)%>)
			</label> </span>
		<%
		  }
		%>
	</form>
</fieldset>
<fieldset>
	<legend class="header">
		<span style="color: darkred">IMPORTANT</span>
	</legend>
	<p style="text-align: left; color: darkred">
		<b>ABRC is not responsible for orders held by
			Customs. It is your responsibility to find out whether import
			documentation is required by your country. Please send import permits
			to abrc@osu.edu. </b>
	</p>
	<p style="text-align: left; color: darkred">
		<b>If you would like for us to provide a phytosanitary
			certificate, then you must add stock# 'PSC' to your order.</b>
	</p>
	<p style="text-align: left; color: darkred">
		<b>You must order a phytosanitary certificate for express shipment
			of seeds to the following locations: Brazil, Chile, China, Hong Kong,
			India, Israel, Japan, Korea, and Taiwan. Otherwise, ABRC will place a
			separate order for you and additional charges will apply. A
			certificate is also required for shipment of large seed orders (with
			more than 40 stocks), regardless of shipping method. </b>
	</p>
</fieldset>

<%
  }
%>
