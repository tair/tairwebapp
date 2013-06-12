<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>

<%
String cssfile="/css/page/ais.css";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("Contact TAIR") %>' />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="3" />
</jsp:include>


		<!--
		
			Content goes here
			
		//-->
	
<span class="header">Contacting TAIR</span>
<P>For general questions, problems with the data/database,  contact the TAIR curators by email:
<a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</A></p>
<BR>
<span class="header">Contacting ABRC</span>
<p>For questions about seed and DNA stocks, please contact the ABRC staff:
<a href="mailto:abrc@osu.edu">abrc@osu.edu</a></p>

<BR>
<span class="header">Mailing Addresses</span>
<br />
<TABLE WIDTH="602">
<TR>
<TD VALIGN="TOP">
<B>Address for TAIR staff at the Carnegie Institution:</B>
 <A HREF="#ciwmap">(MAP)</A><BR>
<BR>
TAIR<BR>
Carnegie Institution of Washington<BR>
Dept. of Plant Biology<BR>
260, Panama<BR>
Stanford, CA 94305<BR>
USA<BR>
<BR>
Phone: 1-(650) 325 1521<BR>
Fax:   1-(650) 325 6857<BR>
<BR>
<A HREF="/about/staff.jsp">Individual phones & addresses</A><BR> 
</TD>


<A HREF="/about/staff.jsp#ncgr">Individual phones & addresses</A><BR> 
<BR>
</TD>
</TR>
<TR>
<TD colspan="2" valign="TOP">
<B>Address for ABRC staff at Ohio State:</B>
<A HREF="#abrcmap">(MAP)</A><BR>
<BR>
ABRC<BR>
The Ohio State University<BR>
055 Rightmire Hall<BR>
1060 Carmack Rd<BR>
Columbus OH 43210<BR>
USA<BR>
<BR>
<BR>
Phone: (614) 292-9371<BR>
Fax: (614) 292-0603<BR>
<BR>
<A HREF="https://abrc.osu.edu/directory">Individual phones & addresses</A><BR>
<BR>
</TD>
</TR>
</TABLE>

</TD>
</TR>
<TR>
<TD>
<BR>
<BR>

<B>Maps</B>
<BR>
<BR>
<CENTER>
<A NAME="ciwmap"><B>Carnegie vicinity map, Stanford, California:</B>
 <A HREF="#top">(GO TO TOP)</A><BR>
<BR>
<IMG SRC="/images/contact/CarnegieLocation.gif">
<BR>
<BR>



<A NAME="abrcmap"><B>ABRC vicinity map, Columbus, Ohio:</B>
 <A HREF="#top">(GO TO TOP)</A><BR>
<BR>
<IMG SRC="/images/contact/ABRCLocation.gif">
<BR>
<BR>
</CENTER>
	
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
