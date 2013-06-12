<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - Weeds World";
String cssfile="/css/page/ais.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="641" />
</jsp:include>



<p style="text-align:center"> <IMG SRC="logo2.gif"><br />
<span class="mainheader">The International Electronic Arabidopsis Newsletter</span></p>

<h2 style="text-align:center">
ISSN 1358-6912</h2><br />

<p><B>Edited by:</B> <A HREF="mailto:arabidopsis@nottingham.ac.uk">Mary Anderson</A>, Nottingham
Arabidopsis Stock Centre, University of Nottingham, UK. <br />NOTE: Weeds World is no longer maintained.</p>


<hr />
<p><B>Please note:</B> You can also view the archived contents of the <A HREF="http://weedsworld.arabidopsis.org.uk/">original WeedsWorld at NASC</a> (Nottingham Arabidopsis Stock Centre) in the UK.</p> 

<hr />
<UL>
<LI>
<A HREF="/servlets/Search?action=new_search&type=publication">Search
all Volumes of WeedsWorld using TAIR's Publication Search</A></LI>
</UL>

<UL>


<LI>
<A HREF="/weedsworld/Nov98RImaps/index.html">
[November '98 Dean & Lister RI map]</A></LI>


<LI>
<A HREF="/weedsworld/Aug98RImaps/index.jsp">
[August '98 Dean & Lister RI map]</A></LI>

<LI>
<A HREF="/weedsworld/Feb98RImaps/index.jsp">
[February '98 Dean & Lister RI map]</A></LI>


<LI>
<A HREF="/weedsworld/Vol4ii/index.jsp">Vol4ii
</A>October 1997</LI>

<LI>
<A HREF="/weedsworld/Vol4i/index.jsp">Vol4i</A>
May 1997</LI>

<LI>
<A HREF="/weedsworld/Vol3iii/index.jsp">Vol3iii</A>
December 1996</LI>

<LI>
<A HREF="/weedsworld/Vol3ii/index.jsp">Vol3ii</A>
September 1996</LI>

<LI>
<A HREF="/weedsworld/Vol3i/contents.html">Vol3i</A>
April 1996</LI>

<LI>
<A HREF="/weedsworld/Vol2iii/contents.html">Vol2(iii)</A>
December 1995</LI>

<LI>
<A HREF="/weedsworld/Vol2ii/contents.html">Vol2(ii)</A>
August 1995</LI>

<LI>
<A HREF="/weedsworld/Vol2/contents.html">Vol2(i)</A>
March 1995</LI>

<LI>
<A HREF="/weedsworld/Vol1/contents.html">Vol1</A>
November 1994</LI>
</UL>


<p style="text-align: center">Last modified on February 14, 2007</p>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

