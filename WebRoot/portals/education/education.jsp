<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%!
String pageName = "Education";
String highlight = "3";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%= cssfile %>" />
</jsp:include>

<jsp:include page="/jsp/includes/educationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Education/Outreach" />
</jsp:include>

<div id="rightcolumn">
<dl class="results">
<p>
This page presents links to educational resources for Arabidopsis, plant biology, genomics and biotechnology that may be of interest to students and teachers looking for information as well as researchers who are seeking opportunities to participate in education/outreach programs.
</p>

<dt><a href="/portals/education/programs.jsp">Science Education/Outreach Programs</a></dt>
<dd>Programs for scientists, teachers, students and the general public.</dd>

<dt><a href="http://www.plantgdb.org/PGROP/pgrop.php">Plant Genome Research Outreach Portal</a></dt>
<dd>A centralized clearinghouse for NSF Plant Genome Research Program sponsored education programs and resources for materials for scientists, educators and students.</dd>

<dt><a href="/portals/education/outreach.jsp">Education and Outreach for Scientists</a></dt>
<dd>Links to NSF guidelines for meeting 'Broader Impacts" merit criteria and resources to assist researchers in developing/participating in relevant activities.</dd>

<dt><a href="/portals/education/teach.jsp">Resources for Educators and Students</a></dt>
<dd>Links to resources for teaching and learning about Arabidopsis, plant biology and biotechnology. Many other interesting sites and resources are included in Web Resources page.</dd>

<dt><a href="/portals/education/teach.jsp">Web Resources for Science Education</a></dt>
<dd>Links to useful web-based educational sites.</dd>

<dt><a href="/portals/education/email.jsp">Plant Biology Education Newsgroup</a></dt>
<dd>Information about and links to newsgroups related to Arabidopsis and Plant Biology education.</dd>
</dl>

		</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
