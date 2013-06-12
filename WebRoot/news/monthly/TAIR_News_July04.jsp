<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR June/July News Release</h1>		

<P>

For the months of June and July 2004:<BR>
1. New data<BR>
Additional tilling polymorphism data<BR>

An additional 846 polymorphisms (point mutations) received from The
Arabidopsis Tilling Project have been added to TAIR. The tilling lines are
searchable using TAIR's Polymorphism Search. The locations of these
polymorphisms are displayed in the SeqViewer, TAIR's graphical genome
viewer.

<P>
2. New features and tools<BR>
<a href="http://arabidopsis.org/help/tutorials/go_intro.jsp">Gene Ontology tutorial</a><BR>

TAIR has been using the Gene Ontology (GO, controlled vocabulary) to
functionally annotate the Arabidopsis genes. Using this tutorial to learn
about the Gene Ontology, where to find and how to use TAIR's GO
annotations. Read more from TAIR's recent publication
http://arabidopsis.org/about/functional.pdf

<P>
3. Updated data<BR>
3.1 <a href="http://arabidopsis.org/tools/aracyc/">Evidence codes added for the AraCyc biochemical pathways</a><Br>


Evidence codes describe what type of evidence supports the assertion that
a pathway exists in Arabidopsis as displayed in AraCyc. Evidence codes
appear as icons in the upper-right corner of pathway display pages. For
example, a flask icon indicates that experimental evidence supports the
existence of the pathway. Click on the flask icon to see more details
about the evidence and for associated citations. Pathways that have not
been manually curated since the initial build of AraCyc are labeled with a
computer icon.
<P>
3.2 Obsolete genes are now searchable using <a href="http://arabidopsis.org/servlets/Search?action=new_search&type=gene">Gene Search</a><br>


Locus and sequence detail pages, as well as the Update History band on
gene detail pages, now display histories of the data including merges,
splits, and obsolete genes.

<P>
4. Other<BR>
<a href="http://www.plantontology.org/">Plant Structure Ontology</a><br>


The first release of the Plant Structure Ontology is now available at the
POC web site! The ontology describes plant anatomy/morphology and
integrates existing species-specific vocabularies (Arabidopsis, maize and
rice) into unified ontology of flowering plants. The ontology can be used
to annotate gene expression data and phenotypes. Cross-species queries
across databases such as TAIR, Gramene and Maize GDB will soon be
available.

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
