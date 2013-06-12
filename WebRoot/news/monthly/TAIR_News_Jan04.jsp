<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR January News Release</h1>		

<P>

For the months of December 2003 and January 2004:<BR>
1. New data<br>
1.1 Additional Tilling polymorphism data
<br>
An additional 387 polymorphisms (point mutations) received from The
Arabidopsis Tilling Project have been added to TAIR. So far, a total of
2827 Tilling lines are searchable using TAIR's Polymorphism Search. The
locations of these polymorphisms are displayed in the SeqViewer, TAIR's
graphical genome viewer.
<P>
1.2 SAIL lines are coming!
<a href="/abrc/sail.jsp">(http://www.arabidopsis.org/abrc/sail.jsp)</a>
<br>
About 50,000 Syngenta T-DNA insertion lines will be distributed by ABRC
starting May. We will keep you posted once they are available.
<P>
2. Updated features/tools<BR>
2.1 GO Annotations
<a href=http://www.arabidopsis.org/tools/bulk/go/index.jsp>(http://www.arabidopsis.org/tools/bulk/go/index.jsp)</a><br>
Input a list of genes and hit the 'Get all GO annotations' button, you can
then view and download GO slim terms associated with your gene list. GO
slim terms are high level GO terms that can assist you functional
categorize your genes based on GO annotations.
<P>
2.2 Updating publications in your TAIR community record<BR>
You can now update the list of publications shown on your community
record. Login <a ref="/servlets/Community?action=login">
(http://www.arabidopsis.org/servlets/Community?action=login)</a>, and
associate new publications to or delete publications from your record.
Follow this link <a href="/help/helppages/addpub.jsp">(http://www.arabidopsis.org/help/helppages/addpub.jsp)</a> to
learn more about how to do it.
<P>
2.3 Microarray Elements Search<br>
<a href="http://arabidopsis.org/tools/bulk/microarray/index.jsp">(http://arabidopsis.org/tools/bulk/microarray/index.jsp)</a>
From Microarray Elements Search results, you can now find the average
value of signal intensity and its standard error of a given array element
across all experiments.
<P>
2.4 TAIR's locus detail pages now have links to the Arabidopsis MPSS<br>
(Massively Parallel Signature Sequencing,
http://mpss.udel.edu/at/java.html?) data, which provides quantitative or
'digital' gene expression information.
<P>
Note: if you prefer not to receive future email updates from us, please
login your TAIR account and update your profile by unchecking the
'Email me monthly TAIR release notes' check box.
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