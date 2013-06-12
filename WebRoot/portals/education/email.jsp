<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "Email Lists";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1124" />
</jsp:include>


<jsp:include page="/jsp/includes/educationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Plant Biology Education Newsgroups" />  
</jsp:include>


<!--
<div id="breadcrumbs"><a href="index.jsp">Home</a> &gt; <a href="/links/index.jsp">Link To</a></div>
-->
<div id="rightcolumn">
<span class="mainheader">Plant Biology Education Newsgroups</span>
<dl>
<dt>Bionet.Plants.Education Newsgroup and Archives</dt>
<dd>The purpose of the PLANT-EDUCATION newsgroup is to function as a means for communication among all educators, including faculty, instructors, lab preparators, and graduate assistants, involved in courses on any aspect of plant biology. Primarily designed for post-secondary school audience.The forum provides the following resources:</dd>
<UL>
<LI> A forum for the exchange of innovative laboratory and classroom activities.</li>
<LI>A forum for discussing the role of plant education in introductory biology courses and ways for improving student perceptions of plants.</li>
<LI>A forum for the exchange of information about educational opportunities for students and faculty (REU programs, teaching workshops, etc.)</li>
<LI>A forum for the exchange of information about textbooks, internet resources, visual materials, and interactive computer programs.</li>
<LI> A source of quick help for last-minute troubleshooting, conditions for plant growth, sources of materials, and practical advice.</li>
<LI> An archive of searchable information for future use by instructors of plant courses</li>
</ul>
<dt>For more information see:<a href ="http://csm.jmu.edu/biology/monroejd/planted.html">http://csm.jmu.edu/biology/monroejd/planted.html</a></dt>
</dl>
<center>Last modified on May 31, 2006</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>



