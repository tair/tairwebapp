<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR April News Release</h1>		
Dear Arabidopsis Researchers:<br>
<P>
The Arabidopsis Information Resource (<a href="/index.jsp">TAIR</a>) emails TAIR registered users a monthly news release at the beginning of each month. The news release includes information on new or updated data and software.<BR>
<P>
*********************************************************************************************<P>
For the past month through 5/15/2003:<br>
1. New data:<br>
1.1 Additional SALK T-DNA insertion data:<br>
<p>
An additional 1273 T-DNA insertion sequences were received from the Salk
Institute. 695 of them are associated with loci. The SALK T-DNA data are
searchable from TAIR's <a href="/servlets/Search?action=new_search&type=polyallele">Polymorphism Search</a>.<br>
The T-DNAs were also added to the "Insertion Flank Sequences" dataset so
that you can find out whether your sequence has a SALK T-DNA insertion by
using the TAIR Blast, WU-Blast, Fasta, and PatternMatch tools.
<p>
1.2 Additional Tilling polymorphisms<br>

An additional 519 polymorphisms were received from The Arabidopsis Tilling
Project. So far, a total of 2011 Tilling lines are included in TAIR's
Polymorphism Search, and can be viewed in Seqviewer. 1971 of them are
associated with loci.<p>

2. Updated tools/features:<br>
2.1 Functional annotations from the Arabidopsis literature using
controlled vocabularies such as those developed by the Gene Ontology (GO)
Consortium are now displayed on TAIR's gene detail pages, and can be
searched from TAIR's <a href="/servlets/Search?action=new_search&type=gene">Gene Search</a> 
<p>
You can now search for all the genes annotated with a specific GO term
using the 'Search by associated keyword' feature within TAIR's Gene Search
page. In addition to GO terms, annotations of gene expression patterns
with anatomy and developmental stage controlled vocabularies developed by
TAIR are also searchable.
<P>
More information on controlled vocabulary can be found at:<br>
<a href="/info/ontologies">/info/ontologies</a>
<p>
More information on GO annotations at TAIR can be found at:<br>
<a href="/info/ontologies/go/">/info/ontologies/go/</a>
<p>
2.2 Links to NCBI BLINK have been added to TAIR's protein detail pages
Click on the NCBI BLINK link on the detail page of your favorite protein
to see all the Genbank similar proteins across species.<p>
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
