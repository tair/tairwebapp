<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR";
	String highlight = "3";
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

<!-- Content goes here //-->
<table width="602" align=center border=0 cellspacing=0 cellpadding=2>
        <tr>
                <td width="602">
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="
F5F9FF">


<!-- HEADER using external JavaScript file -->

<script language='JavaScript' SRC='/js/header'>
</script><p>

<!-- End of header -->


<p>
<table width="602" align="center" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td width="602">
		
		<!-- Content goes here //--> 

<span class="header">Sequence Alignments of kinase catalytic domain to find the characteristic sequence motives</span><br>
<B>Contact:</B> <A href="/servlets/Community?action=view&type=person&communityID=1213417">Laszlo Bogre</A>, <A href="/servlets/Community?action=view&type=person&communityID=7034">Laszlo Okresz</A>
<p>
<body><TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0  BGCOLOR="
FFFFFF">
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><font color="
000000" face="Courier" size="3">0</font></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">e</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">l</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
</TR>
</TABLE>
<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0  BGCOLOR="
FFFFFF">
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">h</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">n</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">W</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">m</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">p</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">e</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
</TR>
</TABLE>
<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0  BGCOLOR="
FFFFFF">
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">s</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">f</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">w</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">m</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">p</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">e</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">v</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">d</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">w</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">s</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">e</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">p</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">v</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">l</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
</TR>
</TABLE>
<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0  BGCOLOR="
FFFFFF">
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">*</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">W</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">5</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">W</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">W</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">9</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">7</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Y</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">t</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">g</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">1</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">4</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">8</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">0</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">T</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">R</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
000000"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">L</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">G</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">D</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">K</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD BGCOLOR="
808080"><FONT COLOR="
FFFFFF" FACE="Courier" SIZE="3">V</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">H</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">-</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">N</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">A</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">F</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">M</FONT></TD>
<TD BGCOLOR="
C0C0C0"><FONT COLOR="
000000" FACE="Courier" SIZE="3">E</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">S</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">Q</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">I</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">:</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">3</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">2</FONT></TD>
</TR>
<TR>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">s</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">f</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">C</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">L</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">p</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">R</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">P</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">a</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">6</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">h</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">f</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">k</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
<TD><FONT COLOR="
000000" FACE="Courier" SIZE="3">&nbsp;</FONT></TD>
</TR>
</TABLE></body>
<P>
  <center>Last modified on July 29, 2002</center>

                  </td>
          </tr>
                    </TABLE>

                        <!-- FOOTER -->
              <script language="javascript" src="/js/footer.js"></script>
                              </body>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
