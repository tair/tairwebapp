<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR September News Release</h1>		
<P>
For the past month through 10/03/2003:<br>
1. New data<br>
1.1 <a href="http:/servlets/Order?state=catalog&category=mutant_seed&pageNum=1">Stock Images</a><br>
Stock images are now available for many seed stocks. There are about 880
total images. Image links can be found from germplasm search result pages,
germplasm detail pages, and stock catalog lists.
<P>
2. New tools/features<br>
2.1 <a href="/servlets/Order?state=catalog">ABRC seed and DNA stock catalog</a><br>
In addition to searching stocks, you can now browse stock lists such as
mutant seeds and full length cDNA clones, view details of the stocks, and
place order directly from the lists.
<P>
2.2 <a href="/servlets/Search?action=new_search&type=keyword">Keyword browser</a><br>
Browse the Gene Ontology (GO) controlled vocabulary terms and TAIR's
developmental stage and anatomy terms, and view term details and
relationships among terms. The browser also allows you to choose to
display genes, annotations, publications, or microarray experiments
associated with the terms.
<P>
3. Updated tools/features<Br>
3.1 <a href="/tools/bulk/go/index.jsp">GO annotations search</a><br>
In addition to downloading all GO (Gene Ontology) annotations for a set of
genes, you can now click on the Functional Categorization button to group
your genes into broader functional categories based on their annotations
to high level terms in the GO vocabularies. The data can be viewed in a
pie chart display or downloaded as a text file for further analysis.
<P>
3.2 <a href="/servlets/Search?action=new_search&type=protein">Protein search</a><br>
<a href="http://scop.mrc-lmb.cam.ac.uk/scop/">SCOP</a>'s ( structural class information
has been incorporated into the protein data and is now available as a
search parameter. We are grateful to Julian
Gough and Martin Madera for providing the SCOP annotation.
<P>
3.3 Microarray expression data added on locus detail pages
Locus detail pages now include information about microarray elements
associated with the locus. Follow the expression viewer link or spot
history link to graphically view expression patterns.
<P>
4. TAIR website converted to jsp<br>
We have recently changed the website to using Java Servlet Pages (jsp).
Please update your bookmarks. For example, change the old URL
http://arabidopsis.org/info/2010_projects/index.html to the new one
http://arabidopsis.org/info/2010_projects/index.jsp. Old html pages will
be redirected to the new pages for a few months and then they will be
permanently discontinued.
This conversion does not affect the contents of the website and has been
done so that we will be able to add new functionalities in the future.
<P>
************************************************************************
<P>
Note: if you prefer not to receive future email updates from us, please
log in to your TAIR account and update your profile by unchecking the
'Email me monthly TAIR release notes' check box.
<P>
To view previous monthly news releases, go to
<a href="http://arabidopsis.org/doc/news/breaking_news/140">Old News</a>
<P>
TAIR is committed to providing the best possible service to the
Arabidopsis community. Should you have any questions or suggestions please
contact us at curator@arabidopsis.org

<P>
The TAIR Team<br>
<a href="/index.jsp"></a>
		<!-- Content goes here //--> 
<P>
<center><a href="/doc/news/breaking_news/140">Go back to TAIR News page</a></center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />