<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "Education - Outreach";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1123" />
</jsp:include>



<jsp:include page="/jsp/includes/educationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Funding for Education and Outreach" />
</jsp:include>

<div id="rightcolumn">


<span class="mainheader">Funding for Education and Outreach</span>
<dl>

<DT></DT>
<DD>Below are some links to programs of interest to researchers seeking funding for educational programs, opportunities to partner with K-16 teachers and students, or those seeking information about existing supported programs.</DD>

<dt><a href="http://www.nsf.gov">National Science Foundation</a></dt>
<dd>The NSF has numerous programs for science education mostly through the <a href="http://www.nsf.gov/dir/index.jsp?org=EHR"> Directorate for Education and Human Resources</a>. Additional programs that may be of interest to researchers include: <a href="http://www.nsf.gov/pubs/2002/nsf02090/nsf02090.html">Research Experiences for Teachers</a>, <a href="http://www.nsf.gov/home/crssprgm/gk12/start.htm"> Graduate Teaching Fellows in K-12 Education</a>, and <a href="http://www.nsf.gov/home/crssprgm/reu/start.htm">Research Experiences for Undergraduates</a>.</dd>

<DD>Starting October 1,2002 proposals must address both scientific and broader impacts merit review criteria in separate statement in the proposal summary. Download the PDF from <a href="bicexamples.pdf">TAIR</a> or<a href="http://www.nsf.gov/pubs/2002/nsf022/bicexamples.pdf"> NSF</a></DD>


<dt><a href="http://usda.gov/wps/portal/usdahome">USDA</a><dt>
<dd>The USDA has many education programs. Some examples are: <a href="http://www.csrees.usda.gov/fo/fundview.cfm?fonum=1082">Higher Education Challenge Grants Program</a>, <a href="http://www.csrees.usda.gov/fo/fundview.cfm?fonum=1083">Secondary and Two-Year Postsecondary Agriculture Education Challenge Grants Program (SPEC)</a></dd>


</DL>
<center>Last modified on May 31, 2006</center>
                </div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
