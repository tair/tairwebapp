<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - Tools";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="7" />
</jsp:include>

<jsp:include page="/jsp/includes/toolsSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value=""/>  
</jsp:include>

<!-- CONTENT IN HERE -->
<div id="rightcolumn">
<span class="mainheader">Tools Overview</span>
<p>
This page provides links to all the analysis and visualization tools implemented at TAIR.</p>

               
		<dl>
        <dt><a href="/cgi-bin/gbrowse/arabidopsis/"><b>GBrowse</b></a></dt>
            <dd>A popular and versatile genome browser now available at TAIR. Search or browse a map of the Arabidopsis genome (including genes, cDNAs and ESTs, insertion mutants, SNPs, markers and BACs) or upload your own annotation track. GBrowse was developed by Lincoln Stein and the software is available from <a href="http://www.gmod.org/wiki/index.php/Gbrowse">GMOD</a>. <a href="/cgi-bin/gbrowse/arabidopsis/?help=general">Help pages</a> are available.</dd>
            
             <dt><b><a href="/cgi-bin/gbrowse_syn/arabidopsis/">Synteny Viewer</a></b></dt>
        <dd>The synteny viewer (gbrowse_syn, a GMOD project) is a tool that allows the user to compare syntenic regions 
        between two or more genomes. This tool was developed by Sheldon McKay(CSHL). The A. thaliana to A. 
        lyrata alignment was provided by Pedro Pattyn (Univ. of Ghent). Additional plant 
        genomes will be added in the future. More info about gbrowse_syn at 
        <a href="http://gmod.org/wiki/GBrowse_syn">http://gmod.org/wiki/GBrowse_syn</a></dd>
		
            <dt><a href="http://tairvm09.tacc.utexas.edu/servlets/sv"><b>SeqViewer</b></a></dt>
                <dd>A genome browser developed at TAIR for viewing Arabidopsis sequence and annotation. Search for names or short sequences and view search hits on the whole genome, in a closeup view or at the nucleotide level. Tracks include genes, cDNAs and ESTs, insertion mutants, SNPs, markers and BACs. <a href="/seqViewer/help/sv_intro.html">Help pages</a> are also available.</dd>

		<dt>
			<a href="/tools/nbrowse.jsp"><b>NBrowse</b>
			</a>
		</dt>

		<dd>
			N-Browse is an interactive graphical browser for biological networks.
			TAIR curators have collaborated with members of the Kris Gunsalus
			Lab, who have developed N-Browse, to create a N-Browse for
			Arabidopsis thaliana. The current curated TAIR Arabidopsis
			interaction network contains 8626 experimentally verified
			protein-protein interactions curated by TAIR, BioGrid and/or IntAct.
		</dd>

		<dt><a href="/servlets/mapper"><b>MapViewer</b></a></dt>
                <dd>TAIR's map comparison tool designed for viewing and comparing genetic, physical and sequence maps. Please read the <a href="/search/map_rel_01beta.html">release notes</a> before using this tool.</dd>
   
		<dt><a href="/biocyc/index.jsp"><b>AraCyc Pathways</b></a></dt>
                <dd>Arabidopsis biochemical pathways visualization and querying tool.</dd>

		<dt><a href="/Blast/"><b>BLAST</b></a></dt>
                <dd>Use your nucleotide or peptide
                sequence to search against all public Arabidopsis
                sequences, several subsets of them, or all higher
                plant sequences from GenBank. These datasets can be
                downloaded by <a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets">FTP</a>.</dd>

                <dt>
                <b><a href="/wublast/index2.jsp">WU-BLAST2</a></b></dt>
                <dd>A faster and more sensitive BLAST algorithm from Washington University is now available for testing 
                    at TAIR. WU-BLAST2 fixes some alignment bugs in NCBI-BLAST and has a very nice summary graphic.</dd>

                <dt>
                <b><a href="/cgi-bin/fasta/nph-TAIRfasta.pl"> FASTA</a></b></dt>
                <dd>Similar to BLAST, but uses a different method to search sequence similarities. For nucleotide searches, FASTA may be more sensitive than BLAST.</dd>

                <dt>
                <b><a href="/cgi-bin/patmatch/nph-patmatch.pl"> Pattern Matching</a></b></dt>
                <dd>Search TAIR's Arabidopsis dataset for short (< 20 residues) nucleotide or peptide sequences, or ambiguous/degenerate patterns.</dd>

                <dt>
                <b><a href="/tools/bulk/motiffinder/index.jsp"> Motif Analysis</a></b></dt>
                <dd>AFGC's Motif Finder gets a facelift and updated genome annotation dataset. This tool allows you to find overrepresented 6-mer oligos in upstream regions of genes.</dd>
				

                <dt>
                <b><a href="bulk/microarray/analysis/index.jsp#vx"> VxInsight&reg;</a></b></dt>
                <dd>VxInsight&reg; is data-mining software developed and patented by Sandia National Laboratories. 
	        The program maps 
		gene expression data to an intuitive 3D, mountain terrain map that is easy to explore and understand. 
		It is available free of charge for analysis of the gene expression datasets from TAIR.</dd>
				

                <dt>
                <b><a href="bulk/microarray/analysis/index.jsp#jtv"> Java TreeView</a></b></dt>
                <dd>Java TreeView is an open source, cross-platform gene expression visualization tool for interactive 
		display of clustered microarray data, similar to Eisen's TreeView program. It was developed by Alok Saldanha 
		at Stanford University and is provided by TAIR with a few minor modifications such as preset URLs 
		to <a href="bulk/microarray/index.jsp">Microarray Elements Search tool</a>.</dd>

                <dt>
                <b><a href="/tools/bulk/index.jsp"> Bulk Data Retrieval</a></b></dt>
                <dd>Search and bulk downloads of GO annotations, sequences, proteins, locus history and microarray elements.
		<ul>
                <li><a href="/tools/bulk/go/index.jsp"> GO Annotations</a></li>
                
                <li><a href="/tools/bulk/po/index.jsp"> PO Annotations</a></li>

                <li><a href="/tools/bulk/sequences/index.jsp"> Sequences</a></li>

                <li><a href="/tools/bulk/protein/index.jsp"> Proteins</a></li>

                <li><a href="/tools/bulk/locushistory/index.jsp"> Locus History</a></li>

                <li><a href="/tools/bulk/microarray/index.jsp"> Microarray Elements</a></li>
		</ul>
                <dt>
                <b><a href="/jsp/ChromosomeMap/tool.jsp"> Chromosome Map Tool</a></b>
                <dd>Draw maps of your favorite gene family.</dd>
                </dt>

                <dt>
                <b><a href="http://www.yeastgenome.org/cgi-bin/PATMATCH/RestrictionMapper"> Restriction Analysis</a></b></dt>
                <dd>Performs restriction analysis on any entered DNA sequence. Hosted at www.yeastgenome.org (SG).</dd>
                
                
		<dt>
		<b><a href="/portals/nomenclature/symbol_main.jsp">Gene Symbol Registry</a></b></dt>
		<dd>Register a Gene Class Symbol</dd>
        
        <dt>
        <b><a href="http://www.textpresso.org/arabidopsis/" onclick="javascript:urchinTracker('/outgoing/textpresso');">Textpresso Full Text</a></b></dt> 
        <dd>Textpresso is an information extracting and processing package for biological 
        literature. Textpresso for Arabidopsis allows users to search all abstracts and over 
        15,700 full-text publications in TAIR</dd>
        
</dl>
</div>
<center>Last modified on July 10, 2009</center>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

