<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR January News Release</h1>		
Dear Arabidopsis Researchers:<br>
<P>
The Arabidopsis Information Resource (<a href="/index.jsp">TAIR</a>) emails TAIR registered users a monthly news release at the beginning of each month. The news release includes information on new or updated data and software.<BR>
<P>
*********************************************************************************************<P>
For the month of January 2003:<br>
1. New data:<br>
1.1 Chloroplast and mitochondrial genes and sequences:<br>
Chloroplast and mitochondrial genes and genomic, cDNA, and protein
sequences are available from TAIR. The sequences and annotations were
derived from Genbank records AP000423.1 for the chloroplast genome and
NC_001284.1 for the mitochondrial genome. You can search for a specific
gene, or search for all chloroplast or mitochondrial genes from the TAIR
Gene Search
(<a href="/servlets/Search?action=new_search&type=gene">/servlets/Search?action=new_search&type=gene</a>).
Genomic, cDNA and protein sequences are linked from the gene detail page.
<p>
The chloroplast and mitochondrial genes are not yet visible on the
SeqViewer but we hope to add this functionality in the coming months.
<p>
2. Updated data:<br>
2.1 Additional SALK T-DNA insertion data:<br>
In January we received an additional 10,000 T-DNA insertion sequences from
the Salk Institute. The SALK T-DNA data are searchable from the TAIR
Polymorphism Search (<a href="/servlets/Search?action=new_search&type=polyallele">
http://arabidopsis.org/servlets/Search?action=new_search&type=polyallele</a>).
They were also added to the "Insertion Flank Sequences" dataset so that
you can find out whether your sequence has a SALK T-DNA insertion by using
the TAIR Blast, Fasta, and PatternMatch tools.
<p>
2.2 Additional microarray elements:<br>
522 AFGC microarray elements were added along with locus assignments and
annotations. All the microarray elements are searchable and downloadable
at:<br>
<a href="/tools/bulk/microarray/index.jsp">/tools/bulk/microarray/index.html</a>
<p>
3. New features:<br>
3.1 Linkout from Genbank<br>
Over 400,000 Arabidopsis sequence entries in GenBank are linked out to
TAIR through the GenBank LinkOut feature. Once you find an interesting
sequence in GenBank, check out the "Links" to see if there is a "LinkOut"
feature to TAIR. You can then easily navigate to TAIR to learn more about
this sequence.
<p>
3.2 The Arabidopsis gene expression information page:<br>
(<a href="/info/expression/">/info/expression/</a>)<br>
This new page is under "Arabidopsis Info" and has all available
information related to gene expression analysis in Arabidopsis. It has
links to functional genomics projects, to downloadable microarray, SAGE
and MPSS datasets, and to microarray facilities among others. Please
contact us if you would like to include your projects, datasets or
services on this page.
<p>
3.3 The latest review articles about TAIR
For an in-depth description of the TAIR projects, data contents and site
functionalities, please see our most recent review articles:<br>
1) TAIR: a resource for integrated Arabidopsis data. (Garcia-Hernandez et
al., 2002. Functional & Integrative Genomics 2: 239-253).
A pdf file is available at:<br>
<a href="/about/23226.pdf">www.arabidopsis.org/about/23226.pdf</a>
<p>
2) The Arabidopsis Information Resource (TAIR): a model organism database
providing a centralized, curated gateway to Arabidopsis biology, research
materials and community. (Rhee et al., 2003. Nucleic Acids Res. 31(1):
224-8).<br>
A pdf file is available at:<br>
<a href="/about/23690.pdf">www.arabidopsis.org/about/23690.pdf</a>
<p>
************************************************************************<br>
Note: if you prefer not to receive future email updates from us, please
log in to your TAIR account and update your profile by unchecking the
'Email me monthly TAIR release notes' check box.
<p>
To view previous monthly news releases, go to<a href="/doc/news/breaking_news/140">
http://arabidopsis.org/news/news.html</a>
<P>
TAIR is committed to providing the best possible service to the Arabidopsis community. Should you have any questions or suggestions please contact us at <a href="mailto:curator@arabidopsis.org">curator@arabidopsis.org</a>
<P>
The TAIR Team <br>
<a href="/index.jsp"></a>	
	<!-- Content goes here //--> 
<P>
<center><a href="/doc/news/breaking_news/140">Go back to TAIR News page</a></center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
