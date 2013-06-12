<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "TAIR -Clones/DNA Resources";
String highlight = "7";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<div id="rightcolumn">
<!--CONTENT IN HERE -->

<span class="mainheader">Full Length cDNA Clones from The SSP Consortium</span>

<P>&nbsp;</P>

<P>These are full fength cDNA clones in pUNI vector (C CLONES) that
have been donated to ABRC by the PGEC Genome Sequencing and Analysis
Laboratory. Additional clones will be donated from this project so
that this will become a large collection.</P>

<P>&nbsp;</P>

<P><B>Salk Institute </B>(<A 
HREF="http://signal.salk.edu/cdnastatus.html">http://signal.salk.edu/cdnastatus.html</A>)<BR>
Joseph R. Ecker<BR>
10010 N. Torrey Pines Road<BR>
La Jolla, CA 92037</P>

<P><B>Stanford University</B> (<A 
HREF="http://sequence-www.stanford.edu/ara/ArabidopsisSeqStanford.html">http://sequence-www.stanford.edu/ara/ArabidopsisSeqStanford.html</A>)<BR>
Ronald W. Davis<BR>
Stanford, CA 94305</P>

<P><B>Plant Gene Expression Center </B>(<A 
HREF="http://pgec-genome.ars.usda.gov/public/submitted.php?clone=C&ABRC=ABRC">http://pgec-genome.ars.usda.gov/public/submitted.php?clone=C&amp;ABRC=ABRC</A>)<BR>
Athanasios Theologis<BR>
800 Buchanan Street<BR>
Albany, CA 94710</P>

<P>&nbsp;</P>

<P>Detailed information on these clones is available from each
website. ABRC stock numbers are the same as the "Clone"
identification provided in the tables.</P>

<P>&nbsp;</P>


</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
