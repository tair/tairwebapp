<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "Education";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%= cssfile %>" />
<jsp:param name="id" value="112" />
</jsp:include>

<jsp:include page="/jsp/includes/educationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="" />
</jsp:include>

<div id="rightcolumn">
<span class="mainheader">Education and Outreach portal</span>
<p>
This portal presents links to educational resources and outreach programs for Arabidopsis, plant biology, genomics and biotechnology, which may be of interest to students, teachers, and researchers.
</p>
<dl>
<dt><a href="/portals/education/aboutarabidopsis.jsp">About Arabidopsis</a></dt>
<dd>Everything you wanted to know about Arabidopsis thaliana.</dd>



<dt><a href="/servlets/Search?type=protocol&amp;action=new_search">Search Arabidopsis Protocols and Manuals</a></dt>
<dd>Find methods and techniques in Arabidopsis research such as plant growth methods, DNA extraction, etc...</dd>

<dt><a href="/portals/education/programs.jsp">Science Education and Outreach Programs</a>
<dd>A compilation of science education and outreach programs which provide opportunities and models for scientists participation in education and outreach activities.
<dt><a href="/portals/education/teach.jsp">Teaching Resources</a></dt>
<dd>Links to resources for teaching and learning about Arabidopsis, plant biology and biotechnology. </dd>


<dt><a href="/portals/education/outreach.jsp">Funding for Education and Outreach</a></dt>
<dd>Information on funding opportunities for education and outreach programs for scientists, teachers, students and the general public.</dd>


<dt><a href="/portals/education/email.jsp">Plant Biology Education Newsgroups</a></dt>
<dd>Information about newsgroups related to Arabidopsis and Plant Biology education.</dd>


<dt><a href="/portals/education/presentations.jsp">TAIR Presentations</a></dt>
<dd>Presentations given by TAIR staff at numerous conferences; useful teaching material for GO annotations, TAIR, AraCyc, etc...</dd>

<dt><a href="/help/index.jsp">TAIR Help</a></dt>
<dd>Several resources can help you learn how to use TAIR including <a href="/help/tutorials/index.jsp">tutorials</a>, a <a href="/help/quickstart.jsp">beginner's guide</a>, a <a href="/servlets/processor?type=definition&update_action=glossary">glossary</a>, <a href="/help/helpcontents.jsp">help pages</a>, and <a href="/help/faq.jsp">FAQs</a>.

</dl>
<center>Last modified on November 19, 2008</center>
		</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
