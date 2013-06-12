<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR December News Release</h1>		
Dear Arabidopsis Researchers:<br>
<P>
The Arabidopsis Information Resource (<a href="/index.jsp">TAIR</a>) emails TAIR registered users a monthly news release at the beginning of each month. The news release includes information on new or updated data and software.<BR>
<P>
*********************************************************************************************<P>
For the month of December 2002:<br>
1. New data:<br>
1.1 A new dataset, AGI transcripts, was added to the Blast, Fasta and
Patmatch tools. It contains coding sequences (CDS) plus any annotated 5'
and 3' UTRs but no introns. This dataset is now the default dataset for
these tools. The previous default dataset, AGI genes, contains intron
sequences in addition to CDS and UTRs.
<p>
<p>
2. Data updates:<br>
2.1 About 90% (27875 out of 30475) of TAIR loci now have external
links to corresponding MIPS and TIGR gene pages. You can find the links
on TAIR locus detail pages.
<p>
2.2 Nearly 80% (18084 out of 23341) of TAIR's BAC clones now have
external links to the Arizona Genome Computational Laboratory's Web FPC
(fingerprint contig) Map. The link can be found on TAIR's clone detail
pages. The Web FPC Map uses BAC fingerprint data generated by the
Washington University Genome Sequence Center to display BACs in
assembled contigs with the selected clone highlighted.

2.3 An additional 900 polymorphisms received from The Arabidopsis Tilling
Project are now included in Polymorphism search, and can be viewed in
Seqviewer.
<p>
2.4 TIGR's 3.0 data release is now available from TAIR.  This release
contains 29084 genes including 10569 genes supported by full length
cDNAs, 175 genes with alternatively spliced gene models, many more UTRs
and 1967 pseudogenes. All TIGR genes now end with a decimal point and
extra digit to distinguish different splice variants of the same gene.
For example, AT5G01750.1 and AT5G01750.2 are splice varants of the same
gene at locus AT5G01750.
<p>
2.5 Chloroplast and mitochondrial locus assignments are now included in
the annotation for microarray elements. The annotated microarray
elements can be accessed through the Microarray Elements Search and
Download tool. In Total 63, 3, and 80 chloroplast loci were annotated to
AFGC, Affymetrix 8K and 25K data sets, respectively, and 9, 4, and
108 mitochondrial loci were annotated to AFGC, Affymetrix 8K and 25K data
sets, respectively.
<p>
<p>
3. Feature/tool updates:<br>
3.1 Updated Help Pages<br>
Recent updates to the help documentation include: New help sections for
registration, adding organizations and making affiliations as well as
help for Polymorphism,Publication and Community Searching. You can
access the help section of TAIR by clicking on the 'Help' link in the
toolbar which links to http://www.arabidopsis.org/help/. Clicking on the
word HELP on search, result, and detail pages will take you to the help
page specific for that document.
<p>
************************************************************************
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