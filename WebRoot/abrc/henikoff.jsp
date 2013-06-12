<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("0") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<H3><CENTER><B><IMG SRC="/images/abrc.gif" WIDTH=86 HEIGHT=30 
X-CLARIS-USEIMAGEWIDTH X-CLARIS-USEIMAGEHEIGHT ALIGN=left></B>TILLING
(Targeting Induced Local Lesions IN Genomes) lines <FONT FACE="Times"><BR>
</FONT>from S. Henikoff and L. Comai</CENTER></H3>

<P>&nbsp;</P>

<P>These stocks are individual lines descended from individual M2
plants from ethyl-methane sulfonate (EMS) mutagenesis. The current
generation is M3. Individual lines should be ordered from this
population as followup to positive results in the TILLING procedure
conducted by the Henikoff laboratory. The reverse genetics, TILLING
procedure employs methods which detect heteroduplex DNA for targeted
DNA sequences so that EMS-induced point mutations in specific genes
of interest can be identified. The background line for this
population is Columbia with an erecta (er-105) mutation. For further
details, and to search for TILLED mutations, please go to the
<A HREF="http://tilling.fhcrc.org/">Arabidopsis TILLING Project
website</A>. </P>

<P>Searching for any line by stock number from the TAIR <A 
HREF="/servlets/Search?action=new_search&type=germplasm">germplasm
search page</A> should locate the correct line or you can <A 
HREF="/servlets/Order/current">order
online</A> if you already know the stock# that you would like to
order.</P>
<P>
<center>Last modified on January 12, 2004</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
