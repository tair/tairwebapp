<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR November News Release</h1>		
Dear Arabidopsis Researchers:<br>
<P>
The Arabidopsis Information Resource (<a href="/index.jsp">TAIR</a>) emails TAIR registered users a monthly news release at the beginning of each month. The news release includes information on new or updated data and software.<BR>
<P>
*********************************************************************************************<P>
For the month of November 2002:<br>
1. New data:<br>
<P>
1.1 AFGC data and tools moved to TAIR <br>
(<a href="/info/2010_projects/comp_proj/AFGC/index.html">/info/2010_projects/comp_proj/AFGC/index.html</a>)<br>
<P>
The Arabidopsis Functional Genomics Consortium (AFGC) project has terminated. The AFGC web site has been updated to reflect the termination and has been moved to TAIR. You can access AFGC data and tools from Arabidopsis Info/Functional Genomics/Projects/Completed Projects.
<P>
Major updates made recently to AFGC tools:<br>
* Several Analysis Tools developed by AFGC have either been replaced by or upgraded with TAIR tools. Among them are the AFGC Clone list (replaced by TAIR's Microarray element search); Expression viewer; Retrieve 5' upstream sequences for AFGC microarray elements; Motif finding of co-clustered 5' upstream sequences.
<P>
* A new tool, Reformat AFGC data, developed by Carolyn Schultz has been added as a link. It enables you to perform cross-experiment comparisons of expression ratios of your genes of interest.
<P>
1.2 A new functional genomics project added to TAIR
<P>
NSF functional genomics project, Low Temperature Regulator Circuits and
Gene Regulons in Higher Plants, now has a link at TAIR (<a href="
http://www.arabidopsis.org/info/2010_projects/projects.jsp">http://www.arabidopsis.org/info/2010_projects/projects.jsp</a>).<br>
The goal of the project is to further understanding of how plants respond to
low temperature in terms of altering gene expression. Cold-regulated gene
expression during a time course spanning 30 min to 7d of low temperature
treatment was investigated using Affymetrix genechips. Files containing the
raw data from 14 genechips and 28 comparison analyses are available to TAIR users.
<P>
2. Data updates:
<P>
2.1 Aracyc
<P>
New pathways added:<br>
* auxin biosynthesis<br>
* glyoxylate cycle II<br>
<P>
Pathways that have been substantially updated:<br>
* polyamine biosynthesis<br>
* sulfur assimilation (old name: sulfur degradation II)<br>
* ethylene biosynthesis from methionine<br>
* lipoxygenase pathway<br>
* lipases pathway (old name: lipases biosynthesis)<br>
* phospholipid biosynthesis II (old name: phosphatidic acid and phospholipid biosynthesis)<br>
* sucrose biosynthesis<br>
<P>
3. New features/tools:<br>
<P>
3.1 Motif analysis<br>
(<a href="/tools/bulk/motiffinder/index.jsp">/tools/bulk/motiffinder/index.jsp</a>)
<P>
This tool allows you to find over-represented 6-mer oligos within a set of input sequences.<br>
Enter sequences in fasta format and the program detects the frequency of 6-mers in your input sequences and the frequency in the whole genome promoter dataset (500bp upstream of genes, latest TIGR release of July 2002). You can use this tool to find potential conserved cis-elements in a microarray cluster.
<P>
3.2 Chromosome map tool<br>
(<a href="/jsp/ChromosomeMap/tool.jsp">/jsp/ChromosomeMap/tool.jsp</a>)
<P>
This utility allows you to paint the Arabidopsis genome with a set of genes, such as genes of a gene family. All you have to do is to supply a list of locus names (for example AT1G01010) that you wish to display on the genome. You can choose to use an alternate display name for any locus by including the second name after a space. The resulting customized genome map can be displayed at different zoom levels. <P>

4. Feature/tool updates:
<P>
4.1 Gene hunter<br>
A bug in the data file has been fixed.
<P>
********************************************************************************************<P>
Please note: if you prefer not to receive future email updates from us, please log in to your TAIR account and update your profile by unchecking the ' Email me monthly TAIR release notes' check box. 
<P>
TAIR is committed to providing the best possible service to the Arabidopsis community. Should you have any questions or suggestions please contact us at <a href="mailto:curator@arabidopsis.org">curator@arabidopsis.org</a>
<P>
The TAIR Team <br>
<a href="/index.jsp"></a>	
	<!-- Content goes here //--> 
<P>
<center><a href="/doc/news/breaking_news/140">Go back to TAIR News page</a></center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
