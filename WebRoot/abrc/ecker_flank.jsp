<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("Sequence-indexed  T-DNA Lines donated by J. Ecker") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("7") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<H3><CENTER><B><IMG SRC="/images/abrc.gif" WIDTH=86 HEIGHT=30 
X-CLARIS-USEIMAGEWIDTH X-CLARIS-USEIMAGEHEIGHT 
ALIGN=left>Sequence-indexed
T-DNA Lines</B><FONT FACE="Times"><BR>
</FONT><B>donated by Dr. Joseph Ecker</B></CENTER></H3>

<CENTER>&nbsp;</CENTER>

<P>These single, segregating flank-tagged T-DNA lines were generated
by vacuum infiltration of Columbia (Col) plants with Agrobacterium
tumefaciens vector pROK2 (Baulcombe et al., 1986, Nature 321:446) by
J. Alonso, W. Crosby and J. Ecker. Each T1 transformant has been
maintained individually, and the original donation generation is T3.
The DNA sequence of each T-DNA flanking region was generated from
seedlings grown from the same sample of seeds as that provided to
ABRC for distribution; some lines have been bulked at ABRC and those
T4 lines will have a note on the tube you receive. The parental stock
is CS60000.</P>

<P>For a fairly large proportion of the Salk lines, gene silencing 
apparently occurs for the kanamycin resistance gene. Hence, the 
resistance may not be expressed in a line, or more likely, will be 
expressed in fewer seedlings than expected. This does not mean that 
the insertion is absent or even low in frequency, rather that 
molecular screening for its presence is will have to be used rather 
than the kanamycin resistance. The PCR- or hybridization-based 
segregation analyses will more accurately ascertain the frequencies 
of different genotypes in a particular line. The gene silencing 
phenomenon is mentioned in the FAQ page of the Salk web site.
Additional details concerning these lines can be found at <A 
HREF="http://signal.salk.edu/tabout.html">SIGnAL</A>
(The Salk Institute Genomic Analysis Laboratory).</P>

<P>Confirmed lines are being identified for many of these lines, 
and the original line will no longer be distributed, except by 
special request. </P>

<P><B>How to find and order flank-tag lines:</B></P>

<P>Use of Stock Numbers:</P>

<P>The stock numbers for these lines are all of the form SALK_xxxxxx, which are also the Ecker laboratory accession numbers for the lines. Please remove any extensions before trying to search for these lines. For example: SALK_139786.44.05.x must be searched using SALK_139786. The stock numbers for the confirmed lines are the same as the parent line with a C suffix: SALK_xxxxxxC.
Searching for any line by stock number from the TAIR <A 
HREF="/servlets/Search?action=new_search&type=germplasm">germplasm
search page</A> should locate the correct line or you can <A 
HREF="/servlets/Order/current">order
online</A> if you already know the stock# that you would like to
order.</P>

<P>&nbsp;</P>

<P>Use of genome project locus identifiers:</P>

<P>The tagged locus number from the genome sequencing project is
linked to the seed stock information. Hence, entering the locus
number in the locus name field on the <A 
HREF="/servlets/Search?action=new_search&type=germplasm">germplasm
search page</A> should locate a line based on this parameter.</P>

<P>&nbsp;</P>

<P>Use of blast searching:</P>

<P>Enter the sequnce of interest into the query sequence window of
the BLAST section of TAIR to locate flank-tag sequences. Please
select the Insertion Flank Sequences dataset for your query. The
results will have links to the appropriate seed stocks for
ordering.</P>


<P>
<center>Last modified on January 12, 2004</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
