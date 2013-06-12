<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR December 2004/January 2005 News Release</h1>		

<P>

For the months of December 2004 and January 2005:

<P>
1. <a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression">Updated Data in Microarray Expression Search</a><br>

The expression values from experiments using Affymetrix chips (1515
slides), including those of the AtGenExpress project, are now searchable
using the TAIR Microarray Expression Search tool. The data can be
downloaded either from the search result pages or from the TAIR ftp site
ftp://ftp.arabidopsis.org/home/tair/Microarrays/.
<P>

2. <a href="http://arabidopsis.org/help/tutorials/micro_intro.jsp">Tutorial on Microarray Resources at TAIR</a><br>

The new tutorial provides step by step instructions and examples of how to
access microarray gene expression data in TAIR.

<P>
3. User-submitted Functional Annotation Data<br>
TAIR has been accepting functional annotations (annotations of genes using
the Gene Ontology and TAIR Ontology controlled vocabulary terms) from
users. The recent submission from Harvey Millar's group (The University of
Western
Australia) on their large scale proteomics work is now viewable in TAIR.
Users are highly encouraged to submit functional annotations from their
current or past work to us using the standard submission form available at
<a href="/doc/submit/functional_annotation/123">
http://www.arabidopsis.org/submit/functional_annotation.submission.jsp</a>.
<P>
4. New seed stocks at ABRC<br>
The DsLox T-DNA lines donated by Patrick Krysan, Michael Sussman and
Richard Amasino (University of Wisconsin) are now available from ABRC.
These lines have the added feature that a Ds launchpad construct and LoxP
sites were included in the construct. Hence, transposition of the Ds from
any of these sites is possible - followed by recombination-induced
chromosomal deletion, if desired. You can search and order these lines
from TAIR <a href="http://arabidopsis.org/servlets/Search?action=new_search&type=germplasm">
http://arabidopsis.org/servlets/Search?action=new_search&type=germplasm</a>.

<P>
**************************************************************************************************************************
<P>
Note: if you prefer not to receive future email updates from us, please
log in to your TAIR account and update your profile by unchecking the '
Email me monthly TAIR release notes' check box.
<P>
To view previous news releases, go to <a href="http://arabidopsis.org/doc/news/breaking_news/140">http://arabidopsis.org/doc/news/breaking_news/140</a>
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
