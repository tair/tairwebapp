<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - About TAIR";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="40" />
</jsp:include>

<jsp:include page="/jsp/includes/aboutSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value=""/>  
</jsp:include>


<div id="rightcolumn">
<h3>TAIR Survey Results</h3>


<p>TAIR conducted a survey of Arabidopsis researchers aimed at 
measuring the level of satisfaction with various aspects of TAIR's 
performance and learning what new data and tools the community is 
interested in having TAIR provide.  The survey, which ran from  
April 23 - May 8, 2008, was administered in two ways: by email to 
a random sample of 300 abstract submitters to the 18th ICAR 
conference (95 responses) and by posting a link to the survey 
within the header for all TAIR pages (293 responses).</p> 

<p>The survey results are available in the following formats:</p>
<ul>
	<li>Survey results <a href="SurveySummary_final.pdf">PDF</a></li>

	<li>Statistical analysis of <a href="bob_survey_rept_2008.pdf">survey results</a></li>

	<li>A <a href="comments.jsp">page</a> showing all comments from the survey<br />
    (Feel free to add comments on the survey or your own feedback and suggestions for TAIR.)</li> 
</div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
