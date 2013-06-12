<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR February News Release</h1>		
Dear Arabidopsis Researchers:<br>
<P>
The Arabidopsis Information Resource (<a href="/index.jsp">TAIR</a>) emails TAIR registered users a monthly news release at the beginning of each month. The news release includes information on new or updated data and software.<BR>
<P>
*********************************************************************************************<P>
For the month of February 2003:<br>
1. New tools/features:<br>
1.1 <a href="/servlets/Search?action=new_search&type=germplasm">Germplasm Search</a> and <a href="/servlets/Search?action=new_search&type=ecotype">Ecotype Search</a><br>
<p>
These searches replace the old Seed Stock Search page.  The Germplasm
Search allows you to retrieve individual lines, individual pools, sets of
lines, or sets of pools using a number of parameters that were not
available in the old search like mutagen, genotype and transgene construct
type. If you are looking for specific natural variants or related species,
please use our Ecotype/Species Search which allows you to narrow your
search using details like country or city of collection and habitat. You
can order seed stocks directly from the search results page or from any of
the germplasm or ecotype detail pages.
<p>
2. Updated tools/features:<br>
2.1 T-DNA/Tn band added to <a href="http://tairvm09.tacc.utexas.edu/servlets/sv">SeqViewer</a>
<P>
88,338 T-DNA and transposon (Tn) insertions can now be viewed in the new
T-DNA/Tn SeqViewer band. The exact nucleotide position of the sequence
match to the flanking sequence and its predicted insertion point can be
viewed in the SeqViewer nucleotide page. The T-DNA/Tn band currently
includes Salk T-DNAs through Feb. 3, 2003 and will be updated monthly with
new insertions.  Click on an insertion to view associated sequence, gene
and germplasm information on a polymorphism detail page.  To order the
T-DNA or transposon stock, click on the hyperlinked name in the germplasm
band and then the "Order from ABRC" or "Order from NASC" buttons at the
bottom of the germplasm detail page.
<p>
2.2 Enhanced <a href="/servlets/Search?action=new_search&type=dna">DNA Search</a><br>
<p>
DNA search allows searching for Clones, Clone ends, Libraries, and Filters
among others. Many of these objects are available as DNA stocks from ABRC.
Recent enhancements include:
<p>
*Added 'stock' as a type to DNA search which allows you to retrieve all
the DNA stocks.
<p>
*Added 'gene name' as a search option for clones and clone ends so that
you can find clones such as full length cDNA clones or clone ends such as
EST and BAC ends that match your favorite genes.
<p>
*Vector type BiBAC was added to the 'Vector Type' list that is used to
restrict searches by features.
<p>
2.3 Detail pages of Clone Ends (such as ESTs and BAC ends) now display
associated locus and gene information. For example,<br>
<a href="/servlets/TairObject?id=32858&type=cloneend">/servlets/TairObject?id=32858&type=cloneend</a>.
<p>
2.4 Enhanced <a href="/servlets/Search?type=general&action=new_search">General Search</a>
<p>
Previously, the General Search feature searches gene names, locus names,
genetic markers, polymorphisms, clones, vectors, people's last names, and
organization names. The enhancement now also allows you to search clone
ends (e.g. EST, BAC ends) and libraries by name, and DNA stocks and seed
stocks by stock number.
<P>
2.5 Enhanced <a href="/help/">HELP</a> pages
<P>
The Help Central page was reorganized and updated to include a Quick Start
guide for new users that briefly describes TAIR and some common usages and
a new FAQ page that lists answers to frequently asked questions ordered by
major topics. Other curator answers to user questions in the old FAQ page
are now listed in the Curator Questions page. A Google search was added to
the Help pages that specifically searches Help documents.
<p>
3. New data:<br>
3.1 IMA transposon-tagged polymorphisms<br>
More than 800 Ds transposon insertion lines from the Institute for
Molecular Agrobiology (IMA) were loaded into the TAIR Polymorphism table.
They are searchable through the Polymorphism/Allele Search at
<a href="/servlets/Search?action=new_search&type=polyallele">/servlets/Search?action=new_search&type=polyallele</a>,
and are also displayed in the T-DNA/Tn band in SeqViewer.
<p>
4. Updated data:<br>
4.1 Chloroplast and mitochondrial sequences are now included in the
datasets (AGI transcripts, Intergenic, Loci upstream sequences, and Loci
downstream sequences) used within tools of BLAST, WU-BLAST, FASTA,
Patmatch, and Sequence Bulk Downloads.
<p>
4.2 Chromosome location information was added to over 80% of 170,000 total
Polymorphisms, about 25% of 243,000 total Clones, and nearly 50% of
249,000 total Clone Ends (mostly ESTs).
<p>
4.3 Locus associations were added to 20% of total 176,000 cDNA clones.
<p>
<b>JOB OPENINGS AT TAIR</B><br>
We are looking to staff two positions: bioinformatics analyst and curator
assistant. See:<br>
<a href="/news/job_postings/tairjobs2003.jsp">/news/job_postings/tairjobs2003.html</a>
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
