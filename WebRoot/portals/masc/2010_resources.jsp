<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "MASC";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="115" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="MASC Submcomittees" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE//-->
<span class="mainheader">AT2010 Project Resources</span>
<p>
<LI><A HREF="#dis"> <b>Important Disclaimer About the AT2010 Resource List</b></A>    
<LI><A HREF="#table"> <b>2010 Resources Spreadsheet</b></A>
    <LI><A HREF="#update"> <b>How the Community Can Provide Updates to the Table</b></A>
<hr>
<dl>
    
    <A NAME="dis"><b>AT2010 Project Resource Disclaimer</b></a><p>
    <dd>

Cataloging of publicly-available data and resources generated by NSF-funded AT2010 projects began in 2006 following requests to the MASC Coordinator, Joanna Friesner, from members of the Arabidopsis community.
Information was obtained on behalf of NAASC and MASC. The NSF was not involved in the effort and has not verified the accuracy of the information.
<p>
The goal of this effort was to provide a service to the community by developing a centralized resource listing project websites, databases, investigator contact information, and most importantly,
the availability to the community of data and physical resources. The desired outcomes of this resource are increased sharing of knowledge and resources and leveraging of the gains achieved through 2010 project funding.
<br><i>Clearly this is a work-in-progress and will require input from project investigators to make (and keep) the resource current.</i>
<p>The Coordinator, assisted by other Arabidopsis resource experts, culled information from public sources and followed-up with investigators by email and phone conversations as needed.
Responses, if received, were used to update the table. Those involved diligently tried to ensure the accuracy of their information. However, there are bound to be omissions and inaccuracies, which we hope to correct through community input.
<p>
<i>Information to populate this table came from these sources:</i>
<li> NSF award abstract pages
<li> Project websites
<li> TAIR
<li> ABRC
<li> Feedback from project PIs obtained through contacts by TAIR and the MASC Coordinator
<p>
    
    
<dl>
<dd><A NAME="table"><a href="http://spreadsheets.google.com/pub?key=p-Rc2FXcsr88pObzTsB_hdA&ouput=html"><IMG SRC="/images/redball.gif"> <b>Click here to view the AT2010 Project Resources information</b></a></dd>
</dl>
<p>
<A NAME="update"><b>Directions to Update the Spreadsheet</b></a><p>
    <dd>
For now, updates can be sent directly to the NAASC Coordinator, Joanna Friesner (jdfriesner@gmail.com).
<p>Check this site for updates to this policy.

</dd>
</dl>


<center>Last modified on January 27, 2010</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

