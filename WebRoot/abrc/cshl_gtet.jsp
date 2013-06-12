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
X-CLARIS-USEIMAGEWIDTH X-CLARIS-USEIMAGEHEIGHT ALIGN=left>Transposon
Insertion Lines</B><FONT FACE="Times"><BR>
</FONT><B>from R. Martienssen</B></CENTER></H3>

<P>&nbsp;</P>

<P>These 338 transposon insertion lines were produced in a Landsberg
erecta (Ler) background and carry a unique insertion of a genetrap
(GT) or enhancer trap (ET) transposable Ds element, which
simultaneously disrupts gene function and monitors gene
expression.</P>

<P>For more information, see the <A 
HREF="http://genetrap.cshl.org/">Cold Spring Harbor Arabidopsis Genetrap website</A></P>


<P>&nbsp;</P>
<P>
<center>Last modified on October 5, 2004</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
