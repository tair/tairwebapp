<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "Genome Annotation Tools: Database Searches";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11437" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Database Searches" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE-->
<span class="mainheader">Database Searches</span>
<p>A collection of nucleotide/protein databases and sequence similarity searches.This page is divided into 2 sections: <a href="#dbs">Nucleotide and Protein Databases</a> and <a href="#blast">BLAST servers</a></p>
<a name="top"></a>
<a name="dbs"></a>
<dl>
<dt>Nucleotide and Protein Databases</dt>
<dd>
		<dl>
                <dt><a href="http://www.ncbi.nlm.nih.gov/Entrez/index.html">Entrez</a></dt>
                <dd>NCBI's Entrez Databases -retrieve sequences and other data, including literature, from PubMed.</dd>
                
                <dt>
		    <a href="http://www.pir.uniprot.org/">UNI-PROT</a></dt>
                <dd>UniProt reflects a merge of 3 databases, SwissProt,PIR and TrEMBL and replaces these databases.Search UniProtKB, a database of curated protein sequences (formerly Swiss-Prot). </dd>
               
                <dt>
		    <a href="http://www.atcg.com/vectordb/">VectorDB</a>
                <dd>Contains annotations and sequence information for many vectors commonly used in molecular biology.
               
                <dt>
		    <a href="http://www.rcsb.org/pdb/">PDB</a>
                <dd>Protein Data Bank, the repository for the processing and distribution of 3-D macromolecular structure data.
                
		<dt><a href="http://srs.ebi.ac.uk/srsbin/cgi-bin/wgetz?-page+srsq2+-noSession">SRS- Sequence Retrieval System</a></dt>
		<dd> Homogeneous interface to over 80 biological databases</dd>
		
		<dt><a href="http://www.tigr.org/tdb/e2k1/plant.repeats/index.shtml">TIGR Plant Repeat Database</a></dt>
		<dd>TIGRs database of Plant repeat sequences</dd>
		
                <dt>
		<a href="http://www.tigr.org/tdb/agi/index.html">TIGR Arabidopsis Gene Index</a>
                <dd>Assembled Arabidopsis ESTs with Arabidopsis transcripts into Tentative Consensus (TC) sequences.
                
		<dt><a href="http://www.ba.itb.cnr.it/BIG/UTRHome/">UTR Database</a></dt>
		<dd>Includes UTRs in a variety of organisms including Arabidopsis. Contains a BLAST page and a tool for searching UTR functional elements.</dd>
		
		<dt><a href="http://microrna.sanger.ac.uk/sequences/">miRBase</a></dt>
		<dd>micro-RNA database for micro-RNA sequences from A. thaliana, C.elegans, D. melanogaster, H. sapiens and M.musculus.</dd>
		<dt><a href="http://asrp.cgrb.oregonstate.edu/db/">Arabidopsis Small RNA Project</a></dt>
		<dd>Database of small RNAs (siRNA) and micro RNAs (miRNA) from the Arabidopsis Small RNA Project</dd>
		<dt><a href="http://sundarlab.ucdavis.edu/mirna/">miRNA Precursor Candidates</a></dt>
		<dd>Computationally predicted Arabidopsis miRNAs and miRNA precursors.</dd>
		<dt><a href="http://nucleus.cshl.org/protarab/AtRepBase.htm">AtRepBase</a></dt>
		<dd>A database of genomic sequences repeated in the Arabidopsis genome.</dd>	
</dl>
</dl>
<p>Back to <a href="#top">top</a></p>
<a name="blast"></a>
<dl class="results">
<dt>BLAST and FASTA servers</dt>
<dd>
            <dl>
	       <dt><a href="/Blast/">TAIR BLAST</a></dt>
                 
                <dd>Search against all public Arabidopsis
                sequences, several subsets of them, or all higher
                plant sequences from GenBank. These datasets can be
                downloaded by <a href="ftp://ftp.arabidopsis.org/home/tair/">FTP</a>.</dd>
               
		<dt><a href="/cgi-bin/fasta/nph-TAIRfasta.pl">TAIR FASTA</a></dt>
                <dd>Similar to BLAST, but uses a different method to search sequence similarities. For nucleotide searches, FASTA may be more sensitive than BLAST.</dd>
                
	        <dt><a href="http://www.ncbi.nlm.nih.gov/BLAST/">NCBI BLAST</a><dt>
                <dd>BLAST server at NCBI</dd>
                
	     
		<dt><a href="http://blast.wustl.edu/blast/README.html">BLAST2 (Wash. U.)</a></dt>
                <dd>Read about and Download WU-BLAST 2.0 Software</dd>
                
		<dt><a href="http://www.ncbi.nlm.nih.gov/BLAST/blast_help.html">BLAST help</a></dd>
                <dd>BLAST manual and user guide from NCBI</dd>.
                </dl>    
</dd>
</dl>
            </div> <!--right column-->

<center>Last modified on April 11, 2006</center>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
