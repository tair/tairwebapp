<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
    String loci = "";
    if (request.getParameter("loci") != null)
    {
        loci = request.getParameter("loci");
    }
%>

<%
String pageName = "TAIR - Bulk Download - GO";
String cssfile="/css/page/search.css";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="82" />
</jsp:include>

<script type="text/javascript">
var highlight = 2; var helpfile="";
function mySubmit(target) {
document.go_form.action = target;
document.go_form.submit();
}
</script>

  <span class="mainheader">GO annotation search, functional categorization and download </span>
  <p id="help">[ <a href="/help/helppages/bulkgohelp.jsp">Help</a> ]</p>

<a href="/portals/genAnnotation/functional_annotation/go.jsp">Gene Ontology at TAIR</a>
<p>
		   Paste locus identifiers (such as At1g01030) into the textbox and press one of the submit buttons below. The identifiers have to be separated by tabs, commas, carriage returns or spaces. Alternatively, you can upload a file, same formatting as for the textbox. Clicking on Get all GO annotations will display in detail all the GO annotations done to your set of genes. Clicking on Functional categorization will group the genes into broad functional categories based on the high level terms in GO hierarchy.</p>
		   <!--<p>To compare your gene set against all genes represented on the following chips, please select a dataset below <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Affymetrix/README">(more info)</a>, download it to your computer, and then upload it into this tool to do a GO functional categorization analysis. More current files may be available in our <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Affymetrix/">ftp folder</a>:<br />
		   <ul>
		   <li>TAIR8 mappings - Agilent</li>
		   <li><a href="affy_ATH1_array_elements-2008-5-29-list.txt">TAIR8 mappings - Affymetrix, ATH1</a></li>
		   </ul></p>-->

		   
		   <p>
You may download the whole genome GO annotations from <a href="ftp://ftp.arabidopsis.org/home/tair/Ontologies/Gene_Ontology/">TAIR FTP site.</a>
</p>

<p><b>Do you want to look for over-represented terms in your data set?</b><br />
Try <b><a href="http://amigo.geneontology.org/cgi-bin/amigo/term_enrichment">GO Term Enrichment</a></b> : A GO tool for statistical comparisons of non-electronic annotations between two data sets</p>
  <div id="searchbox">
		    <form action=/cgi-bin/bulk/go/getgo.pl name="go_form" method=post enctype="multipart/form-data">
		    <fieldset>
		    <legend>Whole Genome Categorization</legend>
                    <dl>
		    <dt>Get:
		    </dt>
                    <dd>
                    <INPUT type="hidden" name="type" value="goslim">
    	            <INPUT type="hidden" name="search_action" value="build">
                    <INPUT type="hidden" name="mode" value="list">

            		<input type="button" name="whole" value="Whole Genome Categorization" 
                           onClick="document.go_form.mode.value='whole';mySubmit('/servlets/MultiServlet')" >
		    </dd>
                    </dl>
		    </fieldset>
		     
		    
		    <fieldset>
		    <legend>GO Annotations</legend>
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
                    <input type=submit Value="Get all GO Annotations" 
                           onClick="mySubmit('/cgi-bin/bulk/go/getgo.pl')">
		    <input type="button" value="Functional Categorization"
                           onClick="document.go_form.mode.value='list';mySubmit('/servlets/MultiServlet')" >

		    </div>  

		    </form>
 
  </div>

<center>Page last modified on August 2, 2005 and the data is updated weekly</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

