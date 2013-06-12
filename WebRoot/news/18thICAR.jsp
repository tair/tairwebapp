<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - News - ICAR Abstracts";
String highlight = "4";
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

<jsp:include page="/jsp/includes/newsSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="ICAR Abstracts"/>  
</jsp:include>


<div id="rightcolumn">


<span class="mainheader">Information about the 18th International Conference on Arabidopsis Research</span>

<img src="/i/2007_ICAR_banner.jpg" width="550" height="83" alt="Conference Banner" />


<dl>

<dt>
<dd><b>Beijing, China, June 20-23, 2007</b></dd>
<dd><a href="/news/Arabidopsis2007.pdf">Final Announcement</a>
<dd><a href="/news/18th_ICAR_2007_program.pdf">Conference Overview Program</a>
<dd><a href="/news/2007_18thICAR_CompleteProgram.pdf">Complete Conference Program, with Abstracts <i>(large 25 Mb file)</i></a>
<dd><a href="/news/2007_conference_shirt.pdf">Conference T-Shirt</a>

<dd><a href="/news/2007_abstract_speakers.pdf">Speakers Selected from Abstracts</a>

<dd><a href="/news/2007_sponsors_exhibitors.pdf">Meeting Sponsors and Exhibitors</a>

<dd> <b> Pictures from the Conference Banquet:</b></dd>

<img src="/i/2007ICAR_conf1.jpg" width="400" height="277" alt="Conference Banquet 1" />
<img src="/i/2007ICAR_conf2.jpg" width="401" height="249" alt="Conference Banquet 2" />
<img src="/i/2007ICAR_conf3.jpg" width="400" height="370" alt="Conference Banquet 3" />
<br>
<b>Image credits: Gerrit Beemster</b>
</dd>
<center>Last modified on August 31, 2007</center>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
