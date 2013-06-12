<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
    String loci = "";
    if (request.getParameter("loci") != null)
    {
        loci = request.getParameter("loci");
    }
%>

<%
String pageName = "TAIR - Bulk Download - PO";
String cssfile="/css/page/search.css";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="90" />
</jsp:include>

<script type="text/javascript">
var highlight = 2; var helpfile="";
function mySubmit(target) {
document.po_form.action = target;
document.po_form.submit();
}
</script>

  <span class="mainheader">Plant Ontology (PO) search and download</span>
		   
  Paste locus identifiers (such as At1g01030) into the textbox and press one of the submit buttons below. The 
  identifiers have to be separated by tabs, commas, carriage returns or spaces. Alternatively, you can upload 
  a file, same formatting as for the textbox. Clicking on Get all PO annotations will display in detail all 
  the PO annotations done to your set of genes.</p>
		   
  <div id="searchbox">
		    <form action=/cgi-bin/bulk/po/getpo.pl name="po_form" method=post enctype="multipart/form-data">
		    
		    <fieldset>
		    <legend>PO Annotations</legend>
		    <dl>
                    <dt><label for="loci">Locus Identifiers: </label>
                    </dt>
                    <dd>
			<TEXTAREA name="loci" rows=10 cols=40><%= loci %></TEXTAREA>
		    </dd>
		    <dt>
		    Upload file: 
		    </dt>
		    <dd><input type="file" name="file"></dd>
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

			(Please note that if more than 1000 loci are entered, only text output will be given)
		    </dd>
                    </dl>
		    </fieldset>	
 
		    <div id="search_buttons">
		    <input type=reset>
                    <input type=submit Value="Get all PO Annotations" 
                           onClick="mySubmit('/cgi-bin/bulk/po/getpo.pl')">
		    
		    </div>  

		    </form>
 
  </div>

<center>Page last modified on April 7, 2010 and the data is updated weekly</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

