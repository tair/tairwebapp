<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR: Gene Description Search and Download";
String cssfile="/css/page/search.css";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="151" />
</jsp:include>

  <span class="mainheader">Gene Description Search and Download</span>
<p>
This tool allows you to download and view gene descriptions.
</p>

<p>
Paste locus or Gene Model identifiers (for example AT1G01010) in the
textbox below and press the submit button. Separate identifiers  by tabs, commas or carriage returns. Alternatively, a file with a list of identifiers may also be uploaded. Choose the output type text if you want to save the results into your local computer.
</p>

  <div id="searchbox">
	<form action=/cgi-bin/bulk/genes/gene_descriptions method=post enctype="multipart/form-data">
	<fieldset>
  		<legend>Get Gene Descriptions</legend>
		<dl>
		<dt>Locus or Gene Model identifiers:
		</dt>
		<dd><TEXTAREA name=search_for rows=10 cols=40></TEXTAREA>
		</dd>
		<dt>Upload file:
		</dt>
		<dd><input type="file" name="file">
		</dd>
		<dt>Search Against:</dt>

		<dd>

		<input type="radio" name="search_against" value="rep_gene" checked>Get one description per locus (representative gene model/splice form only)
 		<br>
        <input type="radio" name="search_against" value="both">Get descriptions for all gene models/splice forms
		<br>
        <input type="radio" name="search_against" value="genemodel">Get descriptions for only the gene model/splice form matching my query
		</dd>
		</dl>
	</fieldset>
	<fieldset>
		    <legend>Output Options:</legend>
                    <dl>
		    <dt>Select output type:
		    </dt>
                    <dd>
		    <input type=radio name=output_type value=html checked>HTML
		    <input type=radio name=output_type value=text>Text<br />
		    </dd>
                    </dl>
	</fieldset>	

	<div id="search_buttons">
		<input type=reset>		    
	      	<input type=submit Value="Get Gene Descriptions">
	</div>   
	</form>
  </div>
<center>Last modified on January 13, 2006</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


