<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("Recombinant Inbred Lines from M. Koornneef and C.  Alonso-Blanco") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("7") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<H3><CENTER><IMG SRC="/images/abrc.gif" WIDTH=86 HEIGHT=30 X-CLARIS-USEIMAGEWIDTH X-CLARIS-USEIMAGEHEIGHT ALIGN=left>Recombinant
inbred lines <FONT FACE="Times"><BR>
</FONT>from Dr. Maarten Koornneef and Dr. Carlos
Alonso-Blanco</CENTER></H3>

<P>&nbsp;</P>

<P>The parental strains, Cape Verde Islands and Landsberg erecta,
were used to generate 162 recombinant inbred lines. Extensive AFLP
data and associated maps have been developed for this population and
integrated with selected markers from the Lister/Dean map. The
complete population, stock number CS22000 costs $225 from ABRC. A
base set of 50 lines, stock number CS22477, which have relatively
high recombination and low segregation distortion are also
available.</P>

<P>&nbsp;</P>

<P><B>Sets available:</B><FONT FACE="Times"><B><BR>
</B></FONT><B>CS22000</B>, complete set of 162 stocks (includes
CS22477 + CS22478)<FONT FACE="Times"><BR>
</FONT><B> &nbsp;&nbsp;CS22477</B>, base set of 50 lines<FONT FACE="Times"><BR>
</FONT><B> &nbsp;&nbsp;CS22478</B>, 112 lines not in base set</P>

<P></P>
<P>
<center>Last modified on August 29, 2001</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
