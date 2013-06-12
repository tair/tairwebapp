<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "Education - Outreach";
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



<jsp:include page="/jsp/includes/educationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="About NSF Broader Impacts" />
</jsp:include>
<!--
<div id="breadcrumbs"><a href="index.jsp">Home</a>&gt;<a href="/links/index.jsp">Link To</a></div>
-->

<div id="rightcolumn">
<span class="mainheader">About NSF Broader Impacts</span>
<dl>
<DT>NSF Merit Review Broader Impacts Criterion:Representative Activities</DT>
<DD>The National Science Foundation advisory notice (published on FastLane, June 17,2002) provides information about representative activities that address the Broader Impacts Criterion for merit review of proposals. Starting October 1,2002 proposals must address both scientific and broader impacts merit review criteria in separate statement in the proposal summary. Download the PDF from <a href="bicexamples.pdf">TAIR</a> or<a href="http://www.nsf.gov/pubs/2002/nsf022/bicexamples.pdf"> NSF</a></DD>
<DT>Broader impact criterion  covered in the advisory are:</DT>
<dd>Advance Discovery and Understanding While Promoting Teaching, Training and Learning</dd>
<dd>Broaden Participation of Underrepresented Groups</dd>
<dd>Enhance Infrastructure for Research and Education</dd>
<dd>Broad Dissemination to Enhance Scientific and Technological Understanding</dd>
<dd>Benefits to Society</dd>


<DT><h3>Federal Funding For Education/Outreach</h3></DT>
<DD>Below are some links to programs of interest to researchers seeking funding for educational programs, opportunities to partner with K-16 teachers and students, or those seeking information about existing supported programs.</DD>

<dt><a href="http://www.nsf.gov">National Science Foundation</a></dt>
<dd>The NSF has numerous programs for science education mostly through the <a href="http://www.nsf.gov/home/ehr/"> Directorate for Education and Human Resources</a>. Additional programs that may be of interest to researchers include: <a href="http://www.nsf.gov/pubs/2002/nsf02090/nsf02090.html">Research Experiences for Teachers</a>, <a href="http://www.nsf.gov/home/crssprgm/gk12/start.htm"> Graduate Teaching Fellows in K-12 Education</a>, and <a href="http://www.nsf.gov/home/crssprgm/reu/start.htm">Research Experiences for Undergraduates</a>.</dd>
<dd><a href="http://usda.gov/wps/portal/usdahome">USDA</a><dd>
<dd>The USDA has many education programs. Some examples are: <a href="http://www.csrees.usda.gov/fo/fundview.cfm?fonum=1082">Higher Education Challenge Grants Program</a>, <a href="http://www.csrees.usda.gov/fo/fundview.cfm?fonum=1083">Secondary and Two-Year Postsecondary Agriculture Education Challenge Grants Program (SPEC)</a></dd>


</DL>

                </div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>