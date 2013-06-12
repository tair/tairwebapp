<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<h2 class="header">TAIR November and December 2005 News Release</h2>		
1. Updated mapping of Affymetrix probe sets on the AG and ATH1 arrays to the recently released Arabidopsis genome TAIR6
<P>
Mapping was performed using the BLASTN program to match the 25-mer nucleotide sequences of the Arabidopsis probes on the 
AG (8k) and ATH1 (25k) arrays against the Arabidopsis TAIR6 Transcript dataset.  Files containing the locus assignments 
of either individual 25-mer probes or whole probe sets are available at 
<a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Affymetrix/">ftp://ftp.arabidopsis.org/home/tair/Microarrays/Affymetrix/</a>. 
For information about the sequence analysis 
protocol, file contents and statistics see the README file on the same ftp directory as the data files.
<P>
The updated genome mapping data can be searched using the <a href="http://arabidopsis.org/tools/bulk/microarray/index.jsp">
Microarray Element Search tool</a>.
Note: These data have not yet been updated in the TAIR database. Until data loading is complete you may find 
locus association discrepancies between the ftp files (and results from Microarray Element Search) and other 
tools/pages (Microarray Expression search, and on Locus and Array Element detail pages).
<P>
Genome mapping updates of the array elements on the AFGC and CATMA arrays to the Arabidopsis TAIR6 genome are 
currently in progress and will be made available shortly. In addition, genome mapping of the Agilent array elements 
will also be included.

<P>
2. Plant cyberinfrastructure workshop report
<P>
An outline for the next stage of the functional genomics research landscape, the report from an NSF-sponsored 
workshop held on October 17-18, 2005 documents the need and goals for a plant cyberinfrastructure for facilitating 
the synthesis of new biological insights from all available functional genomics data. Public comments to this 
document are welcome and should be sent to Sue Rhee (rhee@acoma.stanford.edu) by Jan 31st.

<P>
3. Announcements for future Arabidopsis Conferences
<P>
The 17th International Conference on Arabidopsis Research will be in Madison, WI, USA, 27 June-2 July 2006
<P>
The 18th International Arabidopsis Conference on Arabidopsis Research will be held from June 20-24th, 2007 at the 
Beijing International Convention Center, Beijing, China.
<P>
The official web sites for these conferences will be available later.
<P>
**************************************************************************************************************************

<P>
TAIR is committed to providing the best possible service to the Arabidopsis community. Should you have any questions or 
suggestions please contact us at <a href="mailto:curator@arabidopsis.org">curator@arabidopsis.org</a>
<P>
The TAIR Team<br>
<a href="/index.jsp"></a>
		<!-- Content goes here //--> 
<P>
<center><a href="/doc/news/breaking_news/140">Go back to TAIR News page</a></center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

