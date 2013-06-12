<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR August/September News Release</h1>		

<P>

For the months of August and September 2004:<BR>
1. New data<BR>
1.1 New polymorphisms submitted by the Nordborg group<BR />

Over 10900 single nucleotide polymorphisms covering a reference collection
of 96 accessions of Arabidopsis thaliana have been submitted by Magnus
Nordborg and his co-workers (http://walnut.usc.edu/2010/) and are now
available at TAIR. Of these, 4925 are mapped to loci while the rest are
mapped to intergenic regions. You can find these polymorphisms using the
<a href="http://arabidopsis.org/servlets/Search?action=new_search&type=polyallele">Polymorphism/Allele Search</a>
To get the complete list, enter [start with] BKN in the name search. To
view the locations of the polymorphisms within the genome use the
<a href="http://arabidopsis.org/servlets/sv">SeqViewer</a> genome browser.<br />

<P>
1.2 New T-DNA insertions<br />

We have recently mapped an additional 61,096 T-DNAs, bringing the total
number of genes with at least one T-DNA insertion (excluding promoter
insertions) to 22,660.  As with other polymorphisms, T-DNA insertions can
be searched using the Polymorphism/Allele search and viewed in the
SeqViewer. Seed stocks for the T-DNA lines are displayed and can be
ordered from the polymorphism detail page.

<P>
1.3 Additional cDNAs and ESTs<br />

We have also recently mapped 132,619 additional ESTs.  To date, a total of
34,587 cDNAs have been mapped to 15,503 loci, and 309,634 ESTs have been
mapped to 21,092 loci.  cDNAs and ESTs can be searched using the <a href="http://arabidopsis.org/servlets/Search?action=new_search&type=dna">DNA
Search</a> and viewed in the SeqViewer.  DNA stocks can be found on the clone detail
page which is accessible from the SeqViewer (click on the cDNA or EST of
interest in the Transcript band) or from the DNA Search.

<P>
1.4 Functional annotations<br />

TAIR has been accepting functional annotations (annotations of genes with
controlled vocabulary terms describing their cellular locations, molecular
function, biological processes and expression patterns) from users.  Some
of the recent submissions are now viewable from our website, for example,
you can view annotations from one of these submissions on the annotation
detail page at
<a href="/servlets/Search?action=search&type=annotation&tair_object_id=1007964440&gene_name=ATCNFU3">http://www.arabidopsis.org/servlets/Search?action=search&type=annotation&tair_object_id=1007964440&gene_name=ATCNFU</a>
Users are encouraged to submit the functional annotations from their
current or past work to TAIR using a user-friendly submission form
available at <a href="/doc/submit/functional_annotation/123">Functional annotation submission form</a>.
<P>
As of Oct. 5th, 2004, TAIR has annotated 23960 genes with biological
process information (2910 to known processes based on the literature),
15689 genes with molecular function information (5103 to known functions
based on the literature), and 26309 genes with cellular location
information (1280 to known locations based on the literature). For details
on our annotation procedures, see our June 2004 <a href="http://arabidopsis.org/about/functional.pdf">Plant Physiol.</a> paper. For a guide to accessing
and using this information, check out our <a href="http://arabidopsis.org/help/tutorials/go_intro.jsp">tutorial</a>
.

<P>
2. New and updated user <a href="http://arabidopsis.org/submit/index.jsp">data submission forms</a>.<br />


Use the updated <a href="http://arabidopsis.orghttps://abrc.osu.edu/donate-stocks">Clone and Seed Donation forms</a>
to donate stocks to ABRC
(Arabidopsis Biological Resource Center) in a much easier way!
<P>
We also encourage our users to submit external links associated to data
objects found in TAIR. Submitted links will be added to the external link
band on the object detail pages. Data objects accepted include: Loci,
Clones, Genes, Polymorphisms, Genetic Markers, and Clone Ends. Find out
the guidelines and submission forms at <a href="/submit/ExternalLinkSubmission.jsp">External Link Submission</a>.

<P>
3. Abstracts from the 2004 Arabidopsis conference in Berlin are available
in PDF format. You can browse them at <A href="http://arabidopsis.org/news/15ArabAbstract.pdf">http://arabidopsis.org/news/15ArabAbstract.pdf</a>.
<P>
********************************************************************
<P>
Note: if you prefer not to receive future email updates from us, please
login your TAIR account and update your profile by unchecking the
'Email me monthly TAIR release notes' check box.
<P>
Please also note that we will not include the Arabidopsis news group, arab-gen@net.bio.net and arab-gen@dl.ac.uk in our email list in the future. If you are not a TAIR registered user and want to receive our monthly email updates please register at TAIR <BR>(<a href="/servlets/Community?action=edit&new=true&type=person">/servlets/Community?action=edit&new=true&type=person</a>). 
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

