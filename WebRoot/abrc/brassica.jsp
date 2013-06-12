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
X-CLARIS-USEIMAGEWIDTH X-CLARIS-USEIMAGEHEIGHT ALIGN=left>Collection
of <I>Brassica</I> Seed Stocks</B></CENTER></H3>

<P>&nbsp;</P>

<P>ABRC is pleased to be able to establish a collection of accessions
and genetic stocks of various Brassica species.  The current types of
holdings are listed below. </P>

<P>These stocks can be located through the <A 
HREF="/servlets/Search?type=ecotype&search_action=new_search">germplasm
Ecotype/Species search page</A>, and can be ordered using the
ordering interface.  These seed stocks will be subject to the same
fee structure as we use for Arabidopsis stocks.</P>

<P>Further details of these lines can be found at the <A 
HREF="http://polyploid.agronomy.wisc.edu/index.html">Functional
Genomics of Plant Polyploids homepage</A>.</P>

<P>&nbsp;</P>

<P>Below is a table of contents of groups of stocks currently
available:</P>

<P>1.  Doubled haploid lines of Brassica oleracea and Brassica
rapa</P>

<P></P>
<P>
<center>Last modified on December 2, 2003</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
