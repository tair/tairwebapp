<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - AraCyc - Contributors";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="734" />

</jsp:include>
<!-- SIDEBAR -->


<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Contributors" />
</jsp:include>

<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<p align="center"><img src="aracyc_files/aracyc_logo.gif" width="100" height="58"></p>
<p class="mainheader">Contributors</p>
<p>All the people that are/were involved in making AraCyc</p>
<dl>
	<dd><strong>Current Contributors</strong></dd>
	<dd>A.S Karthikeyan, Ph.D. - Curator<br>
	Kate Dreher, Ph.D. - Curator<br>
	Peifen Zhang, Ph.D. - Head Curator<br>
	<a href="http://carnegiedpb.stanford.edu/research/research_rhee.php"><strong>Seung Yon (Sue) Rhee</strong></a>, Ph.D. - PI</dd>
</dl>
<dl>
	<dd><strong>Editorial Board</strong></dd>
	<dd><a href="http://www.ccrc.uga.edu/~mao/biosyn/text.htm"><strong>Maor Bar-Peled</strong></a>, Ph.D.<br>
	<a href="http://www.ars.usda.gov/pandp/people/people.htm?personid=32032"><strong>Ed Cahoon</strong></a>, Ph.D.<br>
	<a href="http://www.biochem.purdue.edu/faculty/chapple.html"><strong>Clint Chapple</strong></a>, Ph.D.<br>
	<a href="http://www.bio.ucalgary.ca/divisions/plantbio/facchini.html"><strong>Peter Facchini</strong></a>, Ph.D.<br>
	<a href="http://www.pbi.nrc.gc.ca/en/research/ropage/page.htm"><strong>Jonathan Page</strong></a>, Ph.D.<br>
	<a href="http://www.life.uiuc.edu/plantbio/PlantBioWeb/FacultyPages/Seigler.html"><strong>David Seigler</strong></a>, Ph.D. </dd>
</dl>
<dl>
	<dd><strong>Past Contributors</strong></dd>
	<dd>Lukas M&uuml;ller, Ph.D. - Curator<br>
	Hartmut Foerster, Ph.D. - Curator<br>
	Christophe Tissier, Ph.D. - Curator</dd>
</dl>

<p>&nbsp;</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

