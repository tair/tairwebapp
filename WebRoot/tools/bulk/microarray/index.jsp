<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR: Microarray Elements Search and Download";
String cssfile="/css/page/search.css";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="86" />
</jsp:include>

  <span class="mainheader">Microarray Elements Search and Download</span>
  [<A href="/help/helppages/microarray_readme.jsp" target="_blank">Help</A>]
<p>
This tool allows you to find information about the microarray elements
(AFGC clones and amplicons, Affymetrix probe sets, CATMA GSTs, and Agilent oligos) contained on the 
<a href="/portals/masc/AFGC" target="_blank">AFGC</a>, 
<a href="http://www.affymetrix.com" target="_blank">Affymetrix</a> AG (8K) and ATH1 (25K) GeneChip&reg;, <a href="http://www.catma.org" target="_blank">CATMA</a> and  <a href="http://www.chem.agilent.com/Scripts/pds.asp?lPage=2433"> Agilent </a>arrays. This includes their mapping to Arabidopsis locus identifiers. Information about AFGC array elements also includes links to cluster data from 512 public experiments using the Expression Viewer tool, and to the Spot History from <a href="http://genome-www5.stanford.edu/" target="_blank">SMD</a>. See <a
href="/help/helppages/microarray_readme.jsp" target="_blank">data
description</a> for information about how the data were generated. The complete data files can be downloaded from the <a
href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/" target="_blank">ftp
site</a>.
</p>

<p>
Paste locus
identifiers (e.g., At5g01810), 
GenBank Accession (e.g., T13762),
or array element names (e.g., 39B5T7 or 12647_s_at, CATMA1a00010, A_84_P10014) in the
textbox below and press the submit button. Separate identifiers  by tabs, commas or carriage returns. Alternatively, a file with a list of identifiers may also be uploaded. Choose the output type text if you want to save the results into your local computer.
</p>

  <div id="searchbox">
	<form action=/cgi-bin/bulk/microarray/microarray_probe.pl method=post enctype="multipart/form-data">
	<fieldset>
  		<legend>Get Microarray Elements</legend>
		<dl>
		<dt>Locus identifiers:
		</dt>
		<dd><TEXTAREA name=search_for rows=10 cols=40></TEXTAREA>
		</dd>
		<dt>Upload file:
		</dt>
		<dd><input type="file" name="file">
		</dd>
		<dt>Search Against:</dt>

		<dd>

 		<input type="radio" name="search_against" value="afgc">AFGC
		<input type="radio" name="search_against" value="affy8K">Affymetrix AG (8K)
 		<input type="radio" name="search_against" value="affy25K"checked>Affymetrix ATH1 (25K)
 		<input type="radio" name="search_against" value="catma">CATMA
 		<input type="radio" name="search_against" value="agilent">Agilent
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
	      	<input type=submit Value="Get Microarray Elements">
	</div>   
	</form>
  </div>
<center>Last modified on January 13, 2006</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


