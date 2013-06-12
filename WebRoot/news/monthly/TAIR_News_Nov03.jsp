<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR October/November News Release</h1>		
Dear Arabidopsis Researchers:<P>
<P>

The Arabidopsis Information Resource (<a href="/index.jsp">TAIR</a>) emails
TAIR registered users news releases about new or updated data and tools.
Starting with this release we will be sending you the releases on a
bimonthly schedule.
<P>
********************************************************************************************<P>
For the month of October and November 2003:<br>
1. New data:<br>
We have added the following new datasets to our BLAST, WU-BLAST and
PatMatch tools:
<P>
*Higher Plant ESTs: contains all Viridiplantae EST sequences from GenBank
dbEST.
<P>
*Higher Plant BAC ends: contains all Viridiplantae BAC end sequences from
GenBank GSS.
<P>
*Higher Plant, minus ESTs and BAC ends: contains all Viridiplantae
sequences from GenBank PLN, minus EST and BAC end sequences.

<P>
2. New features/tools:<br>
2.1 Microarray Expression Search
(<a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression">http://arabidopsis.org/servlets/Search?action=new_search&type=expression</a>)
<P>
You can now search microarray data for your gene of interest by its
expression values. For example, get all the experiments and data where the
expression level of gene AP1 or locus At5g01810 was increased by at least
2-fold and where the standard error was less than 0.5 within the replicate
set. In addition, you can limit the search to a specific array design, to
either using the averaged values from replicate hybridizations or across
all hybridizations regardless of the presence or absence of replicate
hybridizations. Try it out! This new function is in addition to the
existing Microarray Element Search which allows you to search microarray
data by array element (name, locus name, or Genbank accession), and the
Microarray Experiment Search which allows you to search data by experiment
(name, keyword, or category).
<P>
2.2 Data Submission
(<a href="http://arabidopsis.org/submit/index.jsp">http://arabidopsis.org/submit/index.jsp</a>)
<P>
It is easier than ever to submit data to Tair! Microarray Data and
Functional Annotation Data are now accepted, and new excel forms are
available for most types of data submission. We encourage you to submit
your data to TAIR and share your data with the research community. Please
follow the data submission guides and use the preformatted Excel forms.
The preformatted Excel sheets will assist you in properly formatting your
data for TAIR.
<P>
3. 3. Updated features/tools:<br>
3.1 Gene Search<br>
Additional search parameters were added to 'Restrict by Features'. You can
limit your gene search to a specific gene model type, such as to only
retrieve tRNA genes. You can also limit your search to whether or not the
gene has any associated literature, cDNA or ESTs.
<P>
3.2 Germplasm Search<br>
You can now search for germplasms based on whether they have images
associated with them.  One use of the images is to confirm the phenotype
of the mutant seeds you are growing.<P>
3.3 Bulk Protein Search and Download<br>
(<a href="http://arabidopsis.org/tools/bulk/protein/index.jsp">http://arabidopsis.org/tools/bulk/protein/index.jsp</a>)

SCOP's (<a href="http://scop.mrc-lmb.cam.ac.uk/scop/">http://scop.mrc-lmb.cam.ac.uk/scop/</a>) structural class information
has been incorporated into the protein data and is now available as a
search parameter in Bulk Protein Search and Download tool.

<P>
3.4 A 'Send to BLAST' button has been added to sequence detail pages. By
clicking the button, the sequence of interest will be directly sent to
TAIR BLAST for further analysis. Sequences, such as genomic, cDNA, EST,
and protein, can be retrieved from locus, gene, protein, and DNA searches.
Follow this link to see an example:
<a href="http://arabidopsis.org/servlets/TairObject?type=sequence&id=132192">http://arabidopsis.org/servlets/TairObject?type=sequence&id=132192</a>

<P>
3.5 AraCyc Pathways<br>
(<a href="http://arabidopsis.org/tools/aracyc">http://arabidopsis.org/tools/aracyc</a>)
<Br>
The underlying Pathway Tools software has been updated. The query results
are now grouped according to data types if you query ALL data types at
once. Clicking on a gene displayed on a pathway will direct you to TAIR's
locus page to view comprehensive gene details. We are starting to assign
evidence codes to pathways and enzymes in AraCyc. Evidence codes describe
whether the existence of a pathway or an enzyme activity that catalyzes a
reaction is based on experimental data or derived computationally. Follow
this link to see an example (click the flask icon on the upper right
corner):
<a href="http://www.plantcyc.org:1555/ARA/new-image?type=PATHWAY&object=PWY-1187">
http://www.plantcyc.org:1555/ARA/new-image?type=PATHWAY&object=PWY-1187</a>
<P>
Another recent enhancement was to include a MetaCyc (http://metacyc.org)
link on pathway detail pages. The link will direct you to the MetaCyc
counterpart pathway. From MetaCyc you could view enzyme information and
pathway variants information in other species.
<P>
Check out the AraCyc main page to see what pathways have been added or
updated recently.
<P>

3.6 Login (My Home)<br>
Registered TAIR users who are logged in can now access their 'Welcome
Page' via the 'My Home' link in the toolbar at the top of the page. Use
the Welcome Page to access and update your personal profile, view order
history, search stocks and create stock orders.
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
