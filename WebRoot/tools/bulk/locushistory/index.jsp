<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<%
String pageName = "TAIR - Bulk Download - Locus History";
String cssfile="/css/page/search.css";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="85" />
</jsp:include>

  <span class="mainheader">Locus History Search</span> 
[<a href="/help/helppages/locushistoryhelp.jsp">help</a>]
<p>
		    Paste locus identifiers (such as At1g01030) into the textbox below and press the submit button. The identifiers have to be separated by tabs, commas, carriage returns or spaces. Alternatively, you can upload a file, same formatting as for the textbox. </p>
<p>
Downloadable Text Files: [ 
<a href=/cgi-bin/bulk/locushistory/gethistory.pl?list=inuse>Loci in use</a> |
<a href=/cgi-bin/bulk/locushistory/gethistory.pl?list=obsoleted> Obsolete loci</a> ]
</p>
  <div id="searchbox">
	<form action=/cgi-bin/bulk/locushistory/gethistory.pl method=post enctype="multipart/form-data">
	<fieldset>
	<legend>Get Locus History</legend>
        <dl>
	<dt>Locus identifiers:</dt>
	<dd><TEXTAREA name=loci rows=10 cols=40></TEXTAREA>
	</dd>
	<dt>Upload file:</dt>
	<dd><input type="file" name="file"></dd>
	</dl>
	</fieldset>
	<fieldset>
	<legend>Output Options:</legend>
	<dl>
	<dt>Output Format:</dt>
	<dd>
	<INPUT TYPE=RADIO NAME=outputtype VALUE=html checked>HTML
	<INPUT TYPE=RADIO NAME=outputtype VALUE=text>Text
	</dd>
	</dl>
	</fieldset>
	
	<div id="search_buttons">
	<input type=reset>
	<input type=submit Value="Get Locus history">
	</div>
			    
	</form>
  </div>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

