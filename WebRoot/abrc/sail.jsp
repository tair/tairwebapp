<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("SAIL Lines from Syngenta") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("7") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<!--This file created 6/8/04 2:43 PM by Claris Home Page version 3.0-->
<HEAD>
    <TITLE>Syngenta SAIL Collection</TITLE>
    <META NAME=GENERATOR CONTENT="Claris Home Page 3.0">
    <X-CLARIS-WINDOW TOP=50 BOTTOM=632 LEFT=15 RIGHT=655>
    <X-CLARIS-TAGVIEW MODE=minimal>
</HEAD>
<BODY BGCOLOR="#FFFFFF">
<H3><CENTER><B><IMG SRC="/images/abrc.gif" WIDTH=86 HEIGHT=30 
X-CLARIS-USEIMAGEWIDTH X-CLARIS-USEIMAGEHEIGHT ALIGN=left>SAIL
Lines from Syngenta</B></CENTER></H3>

<P>&nbsp;</P>

<P>&nbsp;</P>
<P>The ABRC is distributing approximately 54,000 lines from the Syngenta 
Arabidopsis Insertion Library (SAIL) collection. Approximately 4,000 
lines are not available because we did not receive enough seed for 
distribution. These lines will be grown upon request. Some lines are 
listed as germplasm in TAIR, but are not stocks. We did not receive any 
seed of these lines and they will not be distributed.</P>

<P>SAIL is an insertion collection which was generated from
approximately 100,000 individual T-DNA mutagenized Arabidopsis plants
(Columbia ecotype). A modified approach to Thermal Asymmetric
Interlaced-Polymerase Chain Reaction (TAIL-PCR) was adopted to
identify left border flanking sequences for these plants. The average
number of T-DNA insertions per line is 1.5 to 2.0. The typical TAIL
PCR border sequence from each plant is over 300 nucleotides in length
and often contains sequence from two separate TAIL products.</P>

<P>Two different constructs were used for these lines: pCSA110 and
pDAP101. The construct used for a particular line is displayed on the
germplasm detail page. Click on the links below for detailed
information on primers and the sequences of the constructs.</P>

<P><A HREF="pCSA110.pdf">pCSA110</A> (pdf)<BR>
<A HREF="pDAP101.pdf">pDAP101</A> (pdf)</P>

<center>Last modified on August 31, 2005</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
