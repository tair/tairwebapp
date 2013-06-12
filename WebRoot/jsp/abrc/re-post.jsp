<html>
<head><title>re-post</title></head>
<body>

<h1 style="color:red">test environment</h1>

<p style="width: 500px">
Select a url to post to, and click "do post".
The data shown below will be posted to selected url.
This page is not used in a production envirnment.</p>

<% for(String app: java.util.Arrays.asList("birmingham","bristol","cambridge","coventry","leeds","liverpool","london","oxford","test","york")) { %>
<a href="#" onclick="urlform.url.value = 'http://<%=app%>/servlets/Payment'"><%=app%></a>
<% } %>

<form action="" method="post" name="urlform">
<input type="text" name="url" value="http://test/servlets/Payment" size="45">
<input type="button" value="do post" onclick="params.action = this.form.url.value; params.submit()">
<span style="border: 2px solid red">
 <input type="button" value="post w/o data" onclick="this.form.action = this.form.url.value; this.form.submit()">
 Use this button to simulate a bad post.
</span><br>
</form>

<div style="float:left; padding: 0 20px; border: 1px solid black">
<h2>post data</h2>
<form action="" method="post" name="params">
<% java.util.Map map = request.getParameterMap(); %>
<% for(String name: (java.util.Set<String>) map.keySet()) { %>
<% for(String value: (String[]) map.get(name)) { %>
 <% if(name.equals("decision")) { %>
  <%=name%> :: <input type="text" name="<%=name%>" value="<%=value%>"><br>
 <% } else { %>
  <%=name%> ::: <%=value%> <input type="hidden" name="<%=name%>" value="<%=value%>"><br>
 <% } %>
<% }} %>
</form>
<% if(request.getParameterMap().size() == 0){ %>(no data)<% } %>
</div>

</body>
</html>
