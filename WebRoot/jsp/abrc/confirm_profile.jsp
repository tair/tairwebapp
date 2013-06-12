<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page import = "java.util.*, java.math.*, org.tair.community.*, org.tair.tfc.*, org.tair.abrc.*, org.tair.utilities.*, java.net.*, org.tair.bs.community.*" %>
<%@ page errorPage = "/jsp/common/gen_error.jsp" %>

<%
BsPerson person = (BsPerson) request.getAttribute("person");
BsAddress shipping = (BsAddress) request.getAttribute("shipping");
Map<BigInteger,String> affiliations = (Map<BigInteger,String>) request.getAttribute("affiliations");
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="Confirm Personal Info." />
</jsp:include>

<% if(person != null) { %>

<div style="text-align: center" class="mainheader">Confirm Personal Profile</div>

<p>Please check the shipping address and lab affiliations below.&nbsp;NOTE:
You must be affiliated with a <b>LABORATORY</b> to place an order.</p>

<p>Payment information is required to place an order.  Please have Credit Card number or Purchase Order
(<a href="/jsp/abrc/payment/whats_this_other_payment_options.jsp">Other Payment Options?</a>) ready before continuing.
You can view our fee structure <a href="https://abrc.osu.edu/fee-structure">here.</a><p>

<input type="button" value="Update Shipping Address" onClick="document.location.href='/servlets/Community?type=person&action=edit&continue_order=true&communityID=<%= person.getCommunityId() %>'">

<form action="/servlets/Order/current" method="post" name="continueform">

<table align="center" border="0" width="100%" cellspacing="0" cellpadding="3">

 <tr bgcolor="#D5D9DD">
  <td><font class="header">Shipping Address</font></td>
  <td><font class="header">Affiliations (select one)</font></td>
 </tr>

 <tr valign="top" bgcolor="#D5D9DD">
  <td>
  <%= person.getCommunity().getName() %> <%= EmptyTextConverter.convert( person.getSuffix()  ) %><br>
  <% if(shipping != null) { %>
  <%= shipping != null ? TextConverter.dbToHTML( shipping.getAddress() ) : "" %><br>
  <%= shipping != null ? shipping.getCity() : "" %>, <%= shipping != null ? shipping.getRegion() : "" %> &nbsp; <%= shipping != null ? shipping.getPostalCode() : "" %><br>
  <%= shipping != null && shipping.getCountryObject() != null ? shipping.getCountryObject().getName() : "" %><br><br>
  <% } %>
  <%= person.getCommunity().getEmail() %><br>
  </td>
  <td>
  <% boolean first = true; for(java.math.BigInteger org_id: affiliations.keySet()) { %>
   <div><input type="radio" name="communityID" value="<%=org_id.toString()%>" <% if(first){ %>checked<% } %> ><%=affiliations.get(org_id)%></div>
  <% first = false; } if(affiliations.size() == 0) { %>
   No active lab affiliations.
  <% } %>
  </td>
 </tr>

</table>

<div style="margin:20px">
<p><b>Please review carefully the following terms under which the Arabidopsis Biological Resource Center is transferring these materials to you, the Recipient:</b></p>
<ol id="disclaimer">
 <li>The service is treated as an academic collaboration without issues of indemnity.</li>
 <li>Although ABRC makes every reasonable attempt to ensure the correctness of stocks, ABRC and the donors of the stock do not imply any warranty whatsoever regarding the material and its use, nor do they guarantee (i) that the material or its use does not infringe on any rights or claims from third parties; or (ii) the material's suitability, novelty or safety for any purpose whatsoever.</li>
 <li>Any fees that we assess are substantially less than the real cost of storing, producing and distributing the material and therefore the service is not-for-profit and not commercial and all costs passed to you represent partial recovery of our production costs.</li>
 <li>You have read the available information published on this stock, including our stock descriptions, and are aware of the nature of the material that you have ordered including any special conditions, regulations and requirements for your local handling of the material.</li>
</ol>
<p>We strongly encourage you to characterize all stocks shortly after receipt.  Your confirmation/validation of diagnostic results may be useful to other users, so please send them to us if possible.</p>
<p><b>If you agree to these terms, please click on "I Accept / Continue with Order".</b></p>
<p><b>If you cannot comply with any of the above terms, please click on "Cancel Order".</b></p>
</div>

<input type="hidden" name="cmd" value="accept">
</form>

<div style="text-align: center">
<input type="button" value="I Accept / Continue with Order" onclick="document.continueform.submit()">
<input type="button" value="Cancel Order" onclick="document.location.href='/servlets/Order/cancel'">
</div>

<% } else { %>
user not logged in
<% } %>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

