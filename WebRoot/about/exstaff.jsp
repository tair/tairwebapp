<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "TAIR - About TAIR - Staff";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="4000" />
</jsp:include>

<jsp:include page="/jsp/includes/aboutSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="TAIR Staff"/>  
</jsp:include>
<div id="rightcolumn">	

<span class="mainheader">About TAIR: People previously associated with TAIR</span>

<p><a name="carnegie"></a></p>
<a href="http://carnegiedpb.stanford.edu/">Carnegie Institution of Washington</a><br />
Shanker Singh, Database Administrator<br />
Phillipe Lamesch, Ph.D., Curator<br />
Margarita Garcia-Hernandez, Ph.D., Curator<br />
Kate Dreher, Ph.D., Curator<br />
April Wensel, Programmer<br />
Cynthia Lee, Senior Software Developer<br/>
Chris Wilks, Programmer<br />
Raymond Chetty, Senior Software Developer<br />
David Swarbreck, Ph.D., Lead Scientific Curator, Structural Annotation<br />
Peifen Zhang, Ph.D., Lead Scientific Curator, Metabolism/Proteomics<br />
Tom Meyer, Software Engineer<br />
Rajkumar Sasidharan, Ph.D., Scientific Curator, Structural Annotation<br />
Anjo Chi, Junior Programmer<br />
Vanessa Kirkup, Webmaster<br />
Suzanne Fleshman, Assistant Curator <br />
Christophe Tissier, Ph. D., Curator <br />
Hartmut Foerster, Ph. D., Curator <br />
Joseph Filla, System Administrator <br />
Julie Horvath, Web Developer <br />
Katica Ilic,  Ph.D., Curator<br />
Suparna Mundodi, Ph.D., Curator<br />
Jon Slenk, Programmer <br />
Thomas Yan, Intern <br />
Iris Xu, Programmer<br />
Danny Yoo, Programmer<br />
Doug Becker, Tech team lead <br />
Brandon Zoeckler<br />
Leonore Reiser, Ph.D.<br />


Shijun Li, Ph.D., Post-Doc<br />

Nick Moseyko, Ph.D., Curator<br />

Yigong Lou, Ph.D., Post-Doc<br />

Behzad Mahini, Bioinformatics Specialist<br />

Lukas Mueller, Ph.D., Curator<br />

Rashmi Nunn, Programmer<br />

Jungwon(J) Yoon, M.S., Curator Assistant<br />

Gabriel Lander, Curator Assistant<br />

Aisling Doyle, Curator Assistant<br />

Mark Lambrecht, Ph.D., Post-Doc<br />

Bryan Murtha, Programmer<br />

Bengt Anell, Bioinformatics intern<br />

Debika Bhattacharyya, Bioinformatics intern<br />

Wen Huang, Software Engineer

Smita Mitra, Exchange Student<br />

Devaki Bhaya, Ph.D., Curator<br />
<p>
<a name="ncgr"></a>
</p>
<a href="http://www.ncgr.org">NCGR</a><br />

Dan Weems, Database Developer<br />

Neil Miller, Software Developer<br />

Mary Montoya, Project Leader<br />

Guanghong Chen, Software Developer<br />

Yihe Wu, Software Developer<br />

Allan Dickerman, Ph.D., NCGR Project Leader<br />

Bruno Sobral, Co-PI<br />

Don Kiphart, IT Architect<br />

David Hanley, IT Architect<br />

Frank LaFond, Web Developer<br />

Wen Huang, Web Developer<br />






</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
