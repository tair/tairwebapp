<!DOCTYPE HTML PUBLIC "-//W3C//dtD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "TAIR Gene Structural Annotation Tools";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11430" />
</jsp:include>


<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Gene Structural Annotation Tools" />
</jsp:include>

<div id="rightcolumn">
<!--Content here -->
<span class="mainheader">Gene Structural Annotation Tools</span>

	<dl>
	<dt><a href="http://www.repeatmasker.org/">Repeat Masker</a></dt>
	<dd>RepeatMasker is a program that screens DNA sequences for interspersed repeats and low complexity DNA sequences. The output of the program is a detailed annotation of the repeats that are present in the query sequence as well as a modified version of the query sequence in which all the annotated repeats have been masked.</dd>
	
	<dt><a href="http://www.kazusa.or.jp/codon/">Codon Usage Database (Kazusa)</a></dt>
	<dd>Codon usage tables for many organisms, including Arabidopsis thaliana, from the Kazusa Institute.</dd>
	
	<dt><a href="http://www.plantgdb.org/PlantGDB-cgi/GeneSeqer/PlantGDBgs.cgi?GDBFlag=ATGDB&chr=1&_a=1&_b=10001">Arabidopsis GenSequer</a></dt>
	<dd>AtGDB GeneSeqer webserver for predicting splice junctions in Arabidopsis sequences. Includes a tutorial on how to use the tool.</dd>
	
	<dt><a href="http://exon.gatech.edu/GeneMark/">GENEMARK</a></dt>
	<dd>Family of gene prediction  programs provided by the Bioinformatics Group at the Georgia Institute of Technology.</dd>
	
	<dt><a href="http://mendel.cs.rhul.ac.uk/mendel.php?topic=fgen">TSSP-TCM</a></dt>
	<dd>Plant promoter identification</dd>
	
        <dt><a href="http://www.ebi.ac.uk/Wise2/">WISE2</a></dt>
        <dd>Wise2 compares a protein sequence to a genomic DNA sequence, allowing for introns and frameshifting errors.</dd>
        
        <dt><a href="http://compbio.ornl.gov/grailexp/">GrailEXP</a></dt>
        <dd>Software package that predicts exons, genes, promoters, polyas, CpG islands, EST similarities, and repetitive elements within DNA sequence.</dd>
        
	<dt><a href="http://genes.mit.edu/GENSCAN.html">GeneScan</a></dt>
                <dd>MIT's new webserver for GeneScan. GeneScan is used to predict the location and intron/exon boundaries in a genomic sequence. Select Arabidopsis as the organism of choice for finding Arabidopsis genes in a genomic sequence.</dt>
                
                <dt><a href="http://www.cbs.dtu.dk/services/NetPGene/">NetPlantGene</a> | <A HREF="http://www.cbs.dtu.dk/services/NetGene2/">NetGene2</a></dt>
                <dd>Predictions of Arabidopsis splice sites from CBS.</dd>
                
                <dt><a href="http://www.cbs.dtu.dk/services/NetStart/">NetStart</a></dt>
                <dd>Prediction software for  Arabidopsis translation starts from CBS.</dd>
               
                <dt><a href="http://rulai.cshl.org/tools/genefinder/ARAB/arab.htm">GeneFinder</a></dt>
                <dd>Search splice sites, protein coding exons and gene models construction, promoter and poly-A signals.</a></dd>
                </dl>

</dl>
</div><!--right column-->

<center>Last modified on April 13, 2006</center>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

