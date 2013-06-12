<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Data Submission";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="12" />
</jsp:include>

<jsp:include page="/jsp/includes/datasubmissionSidebar.jsp" flush ="true">
<jsp:param name="sidebarName" value="Data Submission" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->

<span class="mainheader">Data Submission Overview</span>


<p>We encourage users of TAIR to share their data with the research community. </p>
<p>Please see below <a href="#tair">Data Types Accepted by TAIR</a> and <a href="#other">Other Repositories</a> (for data types not accepted by TAIR).</a></p>


<!--
<dd><B>Warning:</b> A default setting in Microsoft Excel causes some genetic information to be displayed and processed 
incorrectly. The Excel forms available on these pages have been formatted as text to work around this issue, but problems 
may still arise when pasting data from a Microsoft Word file. Use the Paste Special
-> Paste: As: Text command to insert text into these forms when copying from another Microsoft application.
Please see <a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=pubmed&dopt=Abstract&list_uids=15214961">this article</a> for more information.</dd>
-->
<a name="tair"></a><b>DATA TYPES ACCEPTED BY TAIR</b>
<dl>

<dd>Please take a look at the specific guidelines below for submitting data to TAIR. You will be asked to download an 
Excel worksheet to fill in and submit to TAIR. If you have any questions or suggestions, please contact us at:
<a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org </a></dd>

<dt><B>ABRC Stock Donation</b> - <a href="https://abrc.osu.edu/donate-stocks">Guidelines</a> - <a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/ABRC_Seed_Donation_Form.xls">Seed Donation Form</a> - <a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/ABRC_DNA_Donation_Form.xls">Clone Donation Form</a></dt>
<dd>For seed stocks, clones, vectors, libraries, host strains and other similar resources of potential interest to the community.
</dd>

<dt><B>External Links</b> - <a href="/submit/ExternalLinkSubmission.jsp">Guidelines</a> - <a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/external_link_data_form.xls">Submission Form</a></dt>
<dd>We provide links from TAIR detail pages to other stable and generally useful data resources.</dd>

<dt>Gene Class Symbol Registration - <a href="/portals/nomenclature/symbol_main.jsp">Guidelines</a> - <a href="/portals/nomenclature/symbol_main.jsp">Online Form</a></dt>
<dd>Reserve a gene symbol prior to publication to ensure uniqueness and consistency in gene nomenclature.</dd>


<dt><B>Gene Family Data</b> - <a href="/submit/genefamily_submission.jsp">Guidelines</a> - <a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/gene_family_data_form.xls">Submission Form</a></dt>
<dd>For inclusion on the TAIR <a href="/browse/genefamily/index.jsp" target="display">Arabidopsis Gene Family</a> page.</dd>

<dt><B>Gene Function Submission Forms for Authors and Others</b> - <a href="/doc/submit/functional_annotation/123">Online Form</a> - <a href="/doc/submit/functional_annotation_spreadsheet/123">Large Dataset Submission Form</a></dt>
<dd>Please submit your summary level data regarding all aspects of gene function, including gene product function, biological process, subcellular localization, expression pattern, and interactions with other gene products.  See <a href="#other">Other Repositories</a> below for submission of quantitative experimental results.</dd>

<dt><B>Gene Structure Additions/Modifications</b> - <a href="/submit/gene_annotation.submission.jsp">Guidelines</a> - <a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/structural_annotation_data_form.xls">Submission Form</a></dt>
<dd>If you have found missing information, errors or discrepancies in the structure of an existing gene in TAIR, we would like to update our gene information to include your data.</dd>

<dt><B>Locus Identifier Request</b> - <a href="/submit/locus_identifier_request.jsp">Guidelines</a> - <a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/locus_identifier_request_data_form.xls">Submission Form</a></dt>
<dd>TAIR is the central agency responsible for assigning Arabidopsis locus identifiers (for example At1g01010, etc.).  To ensure that each locus has a unique and consistent identifier please use this form to submit new genes to TAIR prior to publication.</dd>


<dt><B>Marker and Polymorphism Data</b> - <a href="/submit/marker_submission.jsp">Guidelines</a> - <a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/marker_polymorphism_data_form.xls">Submission Form</a></dt>
<dd>Submit data on sequenced alleles and markers (including CAPS, SSLP, AFLP, RFLP and RAPD) for inclusion in TAIR.</dd>


<dt><B>Metabolic Pathway Data</b> - <a href="/submit/pathway_submission.jsp">Guidelines</a> - <a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/pathway_data_form.xls">Submission Form</a></dt>
<dd>Use this form to submit additions or corrections to <a href="/biocyc/index.jsp">AraCyc</a> metabolic pathway data.</dd>

<dt><B>Phenotypes</b> - <a href="/submit/phenotype_submission.jsp">Guidelines</a> - <a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/phenotype_data_form.xls">Submission Form</a></dt>
<dd>Submit phenotype descriptions for plants that you have characterized, whether they are your own stocks or were obtained from a stock center like ABRC.</dd>

<dt><B>Protocols</b> - <a href="/submit/protocol_submission.jsp">Guidelines</a> - <a href="/servlets/Search?action=new_search&type=protocol">Online Form</a></dt>
<dd>Make your protocol available through the <a href="/servlets/Search?action=new_search&type=protocol">TAIR Protocol Search.</a></dd>

<dt><B>2010 Functional Genomics Gene List</B> - <a href="/submit/submit_2010.jsp">Guidelines</a> - <a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/functional_genomics_data_form.xls">Submission Form</a></dt>
<dd>If you are working on a group of genes as a part of a functional genomics initiative, we will include your data
on the <a href="/portals/masc/projects.jsp" target="display">2010 Projects</a> section.</dd>
   
</dl>

<a name="other"></a><b>OTHER REPOSITORIES (for data types not accepted by TAIR)</b>

<dl>

<dt>Nucleotide and Protein Sequences</dt>
<dd>Please submit cDNA, EST, genomic clone and protein sequence data to <a href="http://www.ncbi.nlm.nih.gov/Genbank/submit.html">GenBank</a>, 
<a href="http://www.ebi.ac.uk/embl/Submission/index.html">EMBL</a>, 
<a href="http://www.ddbj.nig.ac.jp/sub-e.html">DDBJ</a>, 
<a href="http://www.ebi.ac.uk/swissprot/Submissions/spin/">UniProt</a>
</dd>

<dt>Expression data</dt>
<dd>Please submit microarray and tiling array data to <a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=gds">GEO</a>, 
<a href="http://affymetrix.arabidopsis.info/narrays/experimentbrowse.pl">NASCArrays</a>, 
<a href="http://www.ebi.ac.uk/arrayexpress/">ArrayExpress</a></dd>

<dt>Protein interaction data</dt>
<dd>Please submit protein interaction data to <a href="http://www.ebi.ac.uk/intact/site/">IntAct</a></dd>

<dt>Protein structure data</dt>
<dd>Please submit protein structures to <a href="http://www.rcsb.org/pdb/Welcome.do;jsessionid=Waczb2JjOTFJ9oJecxrXcw**">PDB</a></dd>

</dl>

<p>
<center>Last modified on June 5, 2007</center>
</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


