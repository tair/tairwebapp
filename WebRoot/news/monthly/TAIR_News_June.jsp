<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h1>TAIR June News Release</h1>		
Dear Arabidopsis Researchers:<br>
<P>
The Arabidopsis Information Resource (<a href="/index.jsp">TAIR</a>) emails TAIR registered users a monthly news release at the beginning of each month. The news release includes information on new or updated data and software.<BR>
<P>
*********************************************************************************************<P>
For the past month through 7/11/2003:<br>
1. New tools/features:<br>
1.1 
<a href = "/servlets/Search?type=expr&search_action=new_search">Microarray Experiment Search</a><br>
<p>
Now you can search microarray experiments by name, description,
experimenter's last name, or keywords, and download the related experiment
results for your own analysis.
<P>
Current available data includes 514 hybridizations received from the
Arabidopsis Functional Genomics Consortium (AFGC). The hybridizations are
grouped into 113 experiment sets by TAIR. The information about samples,
experiment and array designs is curated according to MicroArray Gene
Expression (MAGE) guidelines. The entire experiment result data sets can
be downloaded directly from TAIR's
<a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/">ftp site</a>.
<p>
1.2 <a href="/tools/bulk/microarray/analysis/index.jsp">Microarray Data Analysis</a>
<P>
Download the TAIR globally clustered and annotated AFGC microarray data
along with the software VxInsight&#174;. You will be able to view the large
scale gene expression data on a intuitive 3D, mountain terrain map that is
easy to explore. The same data can also be viewed with the downloadable
software Java TreeView.
<P>
1.3<a href="/jsp/processor/genesymbol/symbol_main.jsp"> Gene Class Symbol Registration</a>
<P>
View existing symbols and register/reserve a unique symbol for the class
of genes that you are studying. Registration prior to publication of your
work will minimize accidental duplications in gene nomenclature.
<P>


2. New data<br>
2.1 Additional SALK T-DNA insertion data<br>
<P>
An additional 6229 T-DNA insertion sequences were received from the Salk
Institute. 2988 of them are mapped to loci. The locations of these T-DNA
insertions will soon be visible using the SeqViewer.
<P>
The SALK T-DNA data are searchable using TAIR's 
<a href="/servlets/Search?action=new_search&type=polyallele">Polymorphism Search</a>
 The T-DNAs are also added to the "Insertion Flank Sequences" dataset so
that you can find out whether your sequence has a SALK T-DNA insertion by
using TAIR's Blast, WU-Blast, Fasta, or PatMatch tools.<br>
<P>
2.2 Additional TILLING polymorphism data
<p>
An additional 429 polymorphisms received from The Arabidopsis Tilling
Project have been added to TAIR. So far, a total of 2440 Tilling lines
available from The Arabidopsis Tilling Project are searchable using TAIR's
Polymorphism Search, and can be viewed in Seqviewer.
<p>
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
