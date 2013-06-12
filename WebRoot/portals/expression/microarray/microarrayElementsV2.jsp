<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%!
String pageName = "TAIR - Gene Expression - Array Designs and Array Element Mapping";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11302" />
</jsp:include>

<jsp:include page="/jsp/includes/expressionSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Array Designs/Array Element Mapping"/>  
</jsp:include>

		<div id="rightcolumn">
                <span class="mainheader">Available Array Designs & Array Element Mapping</span>
			<dl id="results">

						<dd id="d_1">
						<dl>
							<dt><a href="/tools/bulk/microarray/index.jsp">TAIR Array Element Search</a></dt>
							<dd>Find the genome mapping for a list of array elements on the AFGC, Affymetrix 8K and 25K GeneChip&#239;&#191;&#189;, and CATMA arrays. Or find the array elements corresponding to a list of genes or GenBank accessions.</dd>
						                <dt><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Affymetrix/affy_AG_array_elements-2006-07-14.txt">Affymetrix 8k chip</a></dt>
							<dd>Retrieve the complete set of elements on this array, including their genome mapping done by TAIR.</dd>
							<dt><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Affymetrix/affy_ATH1_array_elements-2006-07-14.txt">Affymetrix 25k chip</a></dt>
							<dd>Retrieve the complete set of elements on this array, including their genome mapping done by TAIR.</dd>
							<dt><a href="http://www-biology.ucsd.edu/labs/schroeder/genechip.html"> Affymetrix GeneChip Files</a></dt>
							<dd>Retrieve the complete set of elements on Affymetrix arrays annotated by the Schroeder Lab, USA.</dd>
							<dt><a href="http://genetics.mgh.harvard.edu/sheenweb/search_affy.html">Affymetrix GeneChip Files</a></dt>
							<dd>Retrieve the complete set of elements on Affymetrix arrays annotated by the Sheen Lab, USA.</dd>
							<dt><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/AFGC/afgc_array_elements-2002-12-23.txt">AFGC Array Elements</a></dt>
							<dd>Retrieve the complete set of elements on all the AFGC arrays, including their genome mapping done by TAIR.</dd>
							<dt><a href="http://seeds.nottingham.ac.uk/Nasc/action.lasso?-response=browse/control/controlset.lasso&-token.user=19712588128">AFGC Microarray Control Set</a></dt>
							<dd>NASC, UK</dd>
							
							<dt><a href="http://www.chem.agilent.com/Scripts/PDS.asp?lPage=9892">Agilent Arabidopsis 2.0 Oligo Microarray Kit</a></dt>
							<dd>21,500 (60-mer) elements that represent over 80% genome coverage.</dd>
							<dt><a href="http://www.chem.agilent.com/Scripts/PDS.asp?lPage=16213">Agilent Arabidopsis 3.0 Oligo Microarray Kit</a></dt>
							<dd>Nearly 40,000 features representing 28,500 genes.</dd>
							<dt><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/CATMA/">CATMA Array Elements</a>
							<dd>Retrieve the complete set of elements on all the CATMA arrays, including their genome mapping done by TAIR</dd>
							<dt><a href="http://bbc.botany.utoronto.ca/ntools/cgi-bin/ntools_agi_converter.cgi">_at to AGI Converter</a> - <a href="http://bbc.botany.utoronto.ca/">BBC</a> 
							<dd> Will convert 25k Affy GeneChip IDs into AGI IDs and vice versa. Multiple mappings are highlighted.</dd> 						
						</dl>
						</dd>
			</dl>
		</div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

