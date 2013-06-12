<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR October News Release</h1>		
Dear Arabidopsis Researchers:<P>
<P>

The Arabidopsis Information Resource (<a href="/index.jsp">TAIR</a>) is pleased to announce that a monthly TAIR news release will be emailed to TAIR registered users starting this month. The news release will be sent out at the beginning of each month and will include information on new or updated data and software.
<P>
********************************************************************************************<P>
For the month of October 2002:<br>
1. New data:<br>
1.1 Polymorphisms and alleles<br>
(<a href="/servlets/Search?action=new_search&type=polyallele">/servlets/Search?action=new_search&type=polyallele</a>)
	<P>
Polymorphism/allele data is now searchable. Use this search to find visible polymorphisms (i.e. classical genetic markers), and sequence polymorphisms such as substitutions, insertions, and deletions. You can search using the name of your favorite gene to find any associated polymorphisms. Link to the SeqViewer to see where the polymorphisms fall on the genome. Link to a seed stock search to order lines containing these polymorphisms.
<P>
Searchable data (around 115,500 total entries) includes over 9000 new Col/Ler SNPs submitted by the Stanford Genome Consortium, about 600 characterized
polymorphisms from the Arabidopsis Tilling Project, and over 67,000 T-DNA
insertions from the SALK Institute, as well as alleles from lines
submitted to the Arabidopsis Biological Resource Center (ABRC) and
individual submissions from research laboratories. 
<P>
1.2 Mutant gene symbol list<br>
(<a href="/info/Gene_Symbols.jsp">/info/Gene_Symbols.html</a>)
<P>
The list contains about 1380 official mutant gene symbols collected by David Meinke. Use this list to view gene names currently in use . Check here first and avoid duplicate gene names!
<P>
2. Updated data: <br>
2.1 Arabidopsis Genome Updates<br>
(<a href="/portals/genAnnotation/gene_structural_annotation/agicomplete.jsp">/info/agicomplete.html</a>)
<P>
A new table of remaining gaps and incomplete clones has been added with
comments from TAIR, TIGR and other AGI groups including priority rankings
for finishing the remaining clones.
<P>
2.2 Microarray element search<br>
(<a href="/tools/bulk/microarray/index.jsp">/tools/bulk/microarray/index.html</a>)
<P>
Locus assignments for microarray elements have been updated using the latest TIGR genome release (July,2002). In addition to AFGC and Affymetrix 8k data, Affymetrix 25K data is available now for searching and downloading.
<P>
3. New features:<br>
3.1 'Expression viewer' for microarray elements<br>
<P>
An expression viewer link can be found on the microarray element search result page. Following the link you will be able to graphically visualize the expression profile for a selected array element across all the 579 AFGC public experiments. The expression viewer also provides a cluster data for up to 19 genes that share a similar expression profile.
<P>
3.2 'Add comment' <br>
<P>
To further assist communication among Arabidopsis researchers, an 'add comment' function can be found within the detail pages for Gene, Locus, and Protein. If you are registered at TAIR, you can post comments regarding the gene/locus/protein and annotations, and share data corrections, insights and concerns with other researchers.
<P>
3.3 Publications are now displayed on the Community (person) detail page <br>
<P>
TAIR Community/person pages now display TAIR collected publications where the Community/person is one of the authors on the paper. In the near future we will enable you to add (or remove) publications from your person detail page.
<P>
********************************************************************************************<P>
Please note: if you prefer not to receive future email updates from us, please log in to your TAIR account and update your profile by unchecking the ' Email me monthly TAIR release notes' check box. 
<P>
Please also note that we will not include the Arabidopsis news group, arab-gen@net.bio.net and arab-gen@dl.ac.uk in our email list in the future. If you are not a TAIR registered user and want to receive our monthly email updates please register at TAIR (<a href="/servlets/Community?action=edit&new=true&type=person">/servlets/Community?action=edit&new=true&type=person</a>). 
<P>
<P>
TAIR is committed to providing the best possible service to the Arabidopsis community. Should you have any questions or suggestions please contact us at <a href="mailto:curator@arabidopsis.org">curator@arabidopsis.org</a>
<P>
The TAIR Team<br>
<a href="/index.jsp"></a>
		<!-- Content goes here //--> 
<P>
<center><a href="/doc/news/breaking_news/140">Go back to TAIR News page</a></center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
