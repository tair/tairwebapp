<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html>
<head>

<script type="text/javascript">
function setcode(code){
 document.forms.main.reasonCode.value = code;
}
function setdecision(d){
 document.forms.main.decision.value = d;
}
</script>

<title>Mock CyberSource Page</title>
<style type="text/css">
table.fields tr {border: 1px solid black}
table.fields    {border-collapse: collapse;}
tr.ignore       {height: 0}
.sml            {cursor: pointer; text-decoration: underline; color: blue}
</style>
</head>
<body>

<% String tstamp = (new java.text.SimpleDateFormat("yyyyMMddhhmmss")).format(new Date());
   Map paramMap = request.getParameterMap();
   Map<String,String> params = new HashMap();
   for(String k : (Set<String>)paramMap.keySet()){
     String[] v = (String[])paramMap.get(k);
     if(v.length > 0) params.put(k,v[0]);
   }
%>

<form method="post" action="/servlets/Payment" name="main">

<% // special: MissingField merchantDefinedData InvalidField
   List<String> std = Arrays.asList("billTo_city","billTo_company","billTo_country","billTo_email","billTo_firstName",
                                    "billTo_lastName","billTo_phoneNumber","billTo_postalCode","billTo_state","billTo_street1",
                                    "card_accountNumber","card_cardType","card_expirationMonth","card_expirationYear",
                                    "ccAuthReply_amount","ccAuthReply_authorizationCode","ccAuthReply_authorizedDateTime",
                                    "ccAuthReply_avsCode","ccAuthReply_avsCodeRaw","ccAuthReply_cvCode","ccAuthReply_cvCodeRaw",
                                    "ccAuthReply_processorResponse","ccAuthReply_reasonCode","comments","decision",
                                    "decision_publicSignature","merchantID","orderAmount","orderAmount_publicSignature",
                                    "orderCurrency","orderCurrency_publicSignature","orderNumber","orderNumber_publicSignature",
                                    "orderPage_requestToken","orderPage_serialNumber","orderPage_transactionType","paymentOption",
                                    "reasonCode","reconciliationID","requestID","signedFields","transactionSignature");

   List<String> extra = Arrays.asList("billTo_customerID","billTo_street2","card_ExpirationMonth","card_ExpirationYear","ccAuthReply_authFactorCode",
                                      "check_accountNumber","InvalidField","merchantDefinedData","MissingField","paySubscriptionCreateReply_reasonCode",
                                      "paySubscriptionCreateReply_subscriptionID","paySubscriptionCreateReply_subscriptionIDPublicSignature",
                                      "recurringSubscriptionInfo_amount","recurringSubscriptionInfo_amountPublicSignature","recurringSubscriptionInfo_automaticRenew",
                                      "recurringSubscriptionInfo_automaticRenewPublicSignature","recurringSubscriptionInfo_frequency",
                                      "recurringSubscriptionInfo_frequencyPublicSignature","recurringSubscriptionInfo_numberOfPayments",
                                      "recurringSubscriptionInfo_numberOfPaymentsPublicSignature","recurringSubscriptionInfo_startDate",
                                      "recurringSubscriptionInfo_startDatePublicSignature","shipTo_city","shipTo_company","shipTo_country","shipTo_firstName","shipTo_lastName",
                                      "shipTo_postalCode","shipTo_state","shipTo_street1","shipTo_street2","subscription_title","taxAmount");
%>


<div style="border: 1px solid black; margin-top:10px; padding:5px;">
<h3 style="margin:3px">controls for changing values below:</h3>
decision: <select onchange="setdecision(this.value)">
                  <option value="ACCEPT">ACCEPT: The request succeeded.</option>
                  <option value="ERROR">ERROR: There was a system error.</option>
                  <option value="REJECT">REJECT: One or more of the services was declined.</option></select><br>
reasonCode: <a href="#rcodes">select a reason code</a>
</div>

<div style="border: 1px solid black; margin-top:10px; padding:5px;">
<input type="submit" value="submit">

<div style="margin-right:30px; float:left">
<h3>standard fields</h3>
<table class="fields">
<%for(String f : std){String v = params.containsKey(f) ? params.get(f) : ""; %>
<tr><td><input type="checkbox" name="<%=f%>_cb" onclick="this.form.<%=f%>.disabled=!this.checked" checked> <%=f%></td><td><input type="text" name="<%=f%>" value="<%=v%>"></td></tr>
<% } %>
</table>
</div>

<div style="margin-right:30px; float:left">
<h3>extra fields</h3>
<table class="fields">
<%for(String f : extra){ %>
<tr><td><input type="checkbox" name="<%=f%>_cb" onclick="this.form.<%=f%>.disabled=!this.checked"> <%=f%></td><td><input type="text" name="<%=f%>" value="" disabled></td></tr>
<% } %>
</table>
</div>

<div style="clear:both"></div>

<input type="submit" value="submit">
</div>

</form>

<script type="text/javascript">
var pubsig = "PUBLIC_SIG_FOR_TESTING";
document.forms.main.decision.value = "ACCEPT";
document.forms.main.orderCurrency_publicSignature.value = pubsig;
document.forms.main.orderNumber_publicSignature.value = pubsig;
document.forms.main.orderAmount_publicSignature.value = pubsig;
document.forms.main.decision_publicSignature.value = pubsig;
document.forms.main.orderPage_requestToken.value = "<%=tstamp%>----TEST-REQUEST-TOKEN---TEST-REQUEST-TOKEN---TEST-REQUEST-TOKEN----------";
document.forms.main.requestID.value = "<%=tstamp%>00000000";
document.forms.main.orderAmount.value = "<%=params.containsKey("amount") ? params.get("amount") : ""%>";
setcode(100);
</script>

<div style="border: 1px solid black">
<h3>request parameters (<%=paramMap.size()%>)</h3>
<% for(Object name : paramMap.keySet())
     for(String p : (String[])paramMap.get(name)){ %>
<%=name%> : <%=p%><br>
<% } %>
</div>

<h3 style="border-top:1px solid black"><a name="rcodes">reason codes</a></h3>
from <a href="http://apps.cybersource.com/library/documentation/dev_guides/HOP_UG/html/ch_6_-_receiving_receipt.htm#ch_6___receiving_receipt_13114_87986">CyberSource hop documentation</a>
<table border="1" cellspacing="0">
<tr><td class="sml" onclick="setcode(100)">100</td><td><br><br>Successful transaction.</td></tr>
<tr><td class="sml" onclick="setcode(102)">102</td><td>One or more fields in the request are missing or invalid.<br><br>Possible action: See the reply fields InvalidField0...N and MissingField0...N for the invalid or missing fields. Resend the request with the correct information.<br><br>Important In the other API services, this reason code is split between 101 (missing fields) and 102 (invalid fields).</td></tr>
<tr><td class="sml" onclick="setcode(150)">150</td><td>Error: General system failure.<br><br>Possible action: Wait a few minutes and resend the request.</td></tr>
<tr><td class="sml" onclick="setcode(151)">151</td><td>Error: The request was received, but a server time-out occurred. This error does not include time-outs between the client and the server.<br><br>Possible action: To avoid duplicating the order, do not resend the request until you have reviewed the order status in the Business Center.</td></tr>
<tr><td class="sml" onclick="setcode(152)">152</td><td>Error: The request was received, but a service did not finish running in time.<br><br>Possible action: To avoid duplicating the order, do not resend the request until you have reviewed the order status in the Business Center.</td></tr>
<tr><td class="sml" onclick="setcode(200)">200</td><td>The authorization request was approved by the issuing bank but declined by CyberSource because it did not pass the Address Verification Service (AVS) check.<br><br>Possible action: You can capture the authorization, but consider reviewing the order for possible fraud.</td></tr>
<tr><td class="sml" onclick="setcode(201)">201</td><td>The issuing bank has questions about the request. You cannot receive an authorization code in the API reply, but you may receive one verbally by calling the processor.<br><br>Possible action: Call your processor or the issuing bank to obtain a verbal authorization code. For contact phone numbers, refer to your merchant bank information.</td></tr>
<tr><td class="sml" onclick="setcode(202)">202</td><td>The card is expired.<br><br>Possible action: Request a different card or other form of payment.</td></tr>
<tr><td class="sml" onclick="setcode(203)">203</td><td>The card was declined. No other information was provided by the issuing bank.<br><br>Possible action: Request a different card or other form of payment.</td></tr>
<tr><td class="sml" onclick="setcode(204)">204</td><td>The account has insufficient funds.<br><br>Possible action: Request a different card or other form of payment.</td></tr>
<tr><td class="sml" onclick="setcode(205)">205</td><td>The card was stolen or lost.<br><br>Possible action: Review the customer?s information to determine if you want to request a different card from the customer.</td></tr>
<tr><td class="sml" onclick="setcode(207)">207</td><td>The issuing bank was unavailable.<br><br>Possible action: Wait a few minutes and resend the request.</td></tr>
<tr><td class="sml" onclick="setcode(208)">208</td><td>The card is inactive or not authorized for card-not-present transactions.<br><br>Possible action: Request a different card or other form of payment.</td></tr>
<tr><td class="sml" onclick="setcode(210)">210</td><td>The credit limit for the card has been reached.<br><br>Possible action: Request a different card or other form of payment.</td></tr>
<tr><td class="sml" onclick="setcode(211)">211</td><td>The card verification number is invalid.<br><br>Possible action: Request a different card or other form of payment.</td></tr>
<tr><td class="sml" onclick="setcode(220)">220</td><td>The processor declined the request based on a general issue with the customer?s account.<br><br>Possible action: Request a different form of payment.</td></tr>
<tr><td class="sml" onclick="setcode(221)">221</td><td>The customer matched an entry on the processor?s negative file.<br><br>Possible action: Review the order and contact the payment processor.</td></tr>
<tr><td class="sml" onclick="setcode(222)">222</td><td>The customer?s bank account is frozen.<br><br>Possible action: Review the order or request a different form of payment.</td></tr>
<tr><td class="sml" onclick="setcode(230)">230</td><td>The authorization request was approved by the issuing bank but declined by CyberSource because it did not pass the card verification (CV) check.<br><br>Possible action: You can capture the authorization, but consider reviewing the order for possible fraud.</td></tr>
<tr><td class="sml" onclick="setcode(231)">231</td><td>The account number is invalid.<br><br>Possible action: Request a different card or other form of payment.</td></tr>
<tr><td class="sml" onclick="setcode(232)">232</td><td>The card type is not accepted by the payment processor.<br><br>Possible action: Request a different card or other form of payment, and/or check with CyberSource Customer Support to make sure that your account is configured correctly.</td></tr>
<tr><td class="sml" onclick="setcode(233)">233</td><td>The processor declined the request based on an issue with the request itself.<br><br>Possible action: Request a different form of payment.</td></tr>
<tr><td class="sml" onclick="setcode(234)">234</td><td>There is a problem with your CyberSource merchant configuration.<br><br>Possible action: Do not resend the request. Contact Customer Support to correct the configuration problem.</td></tr>
<tr><td class="sml" onclick="setcode(236)">236</td><td>A processor failure occurred.<br><br>Possible action: Wait a few minutes and resend the request.</td></tr>
<tr><td class="sml" onclick="setcode(240)">240</td><td>The card type sent is invalid or does not correlate with the credit card number.<br><br>Possible action: Ask your customer to verify that the card is really the type indicated in your Web store, and resend the request.</td></tr>
<tr><td class="sml" onclick="setcode(250)">250</td><td>Error: The request was received, but a time-out occurred with the payment processor.<br><br>Possible action: To avoid duplicating the transaction, do not resend the request until you have reviewed the transaction status in the Business Center.</td></tr>
<tr><td class="sml" onclick="setcode(475)">475</td><td>The customer is enrolled in payer authentication.<br><br>Possible action: Authenticate the cardholder before continuing with the transaction.</td></tr>
<tr><td class="sml" onclick="setcode(476)">476</td><td>The customer cannot be authenticated.<br><br>Possible action: Review the customer's order.<br></td></tr>
</table>


</body></html>
