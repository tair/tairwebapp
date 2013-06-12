<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR April/May News Release</h1>		

<P>

For the months of April and May 2004:<BR>
1. New data<br>
1.1 Microarray data submitted by MPI Tubingen<br>
MPI Tubingen (Schmid, Lohmann and Weigel labs) has submitted data from 280
Affymetrix arrays, representing 100 experimental treatments. The data
includes the Developmental Affymetrix Gene Expression Atlas as part of the
AtGenExpress Project. You can download the entire dataset from TAIR 
<a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/AtGenExpress">
(ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/AtGenExpress)</a>.
The data will soon be searchable through TAIR's microarray search tools.

<P>
1.2 SAIL lines from Syngenta<br>
ABRC is now distributing T-DNA insertion lines from the Syngenta
Arabidopsis Insertion Library (SAIL) collection. These lines are
searchable using TAIR's Germplasm Search
(<a href="/servlets/Search?action=new_search&type=germplasm">http://www.arabidopsis.org/servlets/Search?action=new_search&type=germplasm</a>)
and can be ordered through TAIR. The locations of the insertions will soon
be displayed in the SeqViewer.
<P>
1.3 Clones in Invitrogen's Gateway TM system<BR>
ABRC has received a number of full length cDNA clones in a GatewayTM entry
vector and these can be ordered through TAIR. If you have generated
materials using this system ABRC is now accepting donations. Please
contact abrc@osu.edu.
<P>
2. Updated features/tools<BR>
2.1 Protocol search<Br>
<A href="/servlets/Search?type=protocol&action=new_search">http://www.arabidopsis.org/servlets/Search?type=protocol&action=new_search</a><BR>
Search for protocols in TAIR by title, author, description and keyword.
Protocols include methods in plant genetics, molecular biology, microarray
analysis of gene expression and more. Protocols have been obtained from
individual submissions and compilations such as the Complete Guide, and
EMBO and CSHL Arabidopsis Course manuals. Send us
(curator@arabidopsis.org) your latest and greatest protocols to share with
the research community
<P>
2.2 New TAIR site map<BR>
<a href="/sitemap.jsp">http://www.arabidopsis.org/sitemap.jsp</a><br>
A tree style map is provided that conceptually categorizes web pages to
assist you finding pages that might not be obvious.
<P>
3. Updated features and tools<BR>
3.1 Gene Ontology annotation search, functional categorization and
download
<a href="/tools/bulk/go/index.jsp">http://www.arabidopsis.org/tools/bulk/go/index.jsp</a><BR>
The functional categorization option now uses a new list of goslim terms
which are more robust and easy to interpret. View the goslim terms at
http://www.arabidopsis.org/help/helppages/go_slim_help.jsp
In addition, you can sort results (HTML format) by either category or
frequency.
<P>
3.2 Update publications in your TAIR community record!<BR>
Since January 2004, registered researchers can add or delete publications
to their personal profile. Please log in and click on 'Update your record'
to associate your papers to your record. For help with adding/deleting
publications see <a href="/help/helppages/addpub.jsp">http://www.arabidopsis.org/help/helppages/addpub.jsp</a>


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
