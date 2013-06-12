<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("RNAi Lines") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("7") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<!--This file created 1/27/04 4:18 PM by Claris Home Page version 3.0-->
<HEAD>
    <TITLE>RNAi Lines</TITLE>
    <META NAME=GENERATOR CONTENT="Claris Home Page 3.0">
    <X-CLARIS-WINDOW TOP=79 BOTTOM=754 LEFT=6 RIGHT=633>
    <X-CLARIS-TAGVIEW MODE=minimal>
</HEAD>
<BODY BGCOLOR="#FFFFFF">
<H3><CENTER><B><IMG SRC="/images/abrc.gif" WIDTH=86 HEIGHT=30 
X-CLARIS-USEIMAGEWIDTH X-CLARIS-USEIMAGEHEIGHT ALIGN=left></B>RNAi
Lines from the <FONT FACE="Times"><BR>
Chromatin Functional Genomics Consortium</FONT></CENTER></H3>

<P>&nbsp;</P>

<P>These lines were produced using Agrobacterium-mediated
transformation using a binary vector containing a fragment of the
target gene in an inverted repeat orientation for RNAi silencing. The
transformation was carried out using the floral dip method. The
transgene is a single-copy or low-copy insertion event. The vectors
were built using pCAMBIA vectors.</P>

<P>Details of these lines can be found at the <A 
HREF="http://www.chromdb.org">Chromatin
website</A>. Links to stock details are provided.</P>

<P>Searching for any line by stock number from the TAIR <A 
HREF="/servlets/Search?action=new_search&type=germplasm">germplasm
search page</A> should locate the correct line or you can <A 
HREF="/servlets/Community">order
online</A> if you already know the stock# that you would like to
order. Many of the constructs used to generate these lines are also
available for ordering using the <A 
HREF="/servlets/Search?action=new_search&type=dna">DNA
search page</A>.</P>

<center>Last modified on January 27, 2004</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
