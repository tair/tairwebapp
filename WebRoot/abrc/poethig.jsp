<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("Enhancer Trap Lines from Scott Poethig") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("7") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<H3><CENTER><IMG SRC="/images/abrc.gif" WIDTH=86 HEIGHT=30 
X-CLARIS-USEIMAGEWIDTH X-CLARIS-USEIMAGEHEIGHT 
ALIGN=left><B><FONT FACE="Times">Enhancer Trap Lines donated by Scott Poethig</FONT></B></CENTER></H3>

<CENTER>&nbsp;</CENTER>

<P>These seed stocks represent the T4 generation of individual Columbia
plants transformed with Jim Haseloff's GAL4-GFP enhancer trap vector.
<P>This vector contains GAL4 under the regulation of a minimal promoter,
and an ER-localized form of mGFP5 under the regulation of the GAL4
UAS. In addition to their usefulness as markers of tissue or organ
identity, these lines can be used to activate other transgenes fused
to the GAL4 UAS.  
<P>The stocks available from the ABRC were selected
because they have stable patterns of expression, or have T-DNA
insertions in predicted genes.  Information about the how these lines
were generated, their expression patterns, and T-DNA insertion sites
is available here: <a href="http://enhancertraps.bio.upenn.edu">http://enhancertraps.bio.upenn.edu</a>.
</P>
<P></P>
<P>
<center>Last modified on December 19, 2002</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
