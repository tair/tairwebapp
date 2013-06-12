<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%!
String pageName = "TAIR - Gene Expression - Microarray Standards and Forums";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11305" />
</jsp:include>

<jsp:include page="/jsp/includes/expressionSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Microarray Standards and User Groups"/>  
</jsp:include>

	<div id="rightcolumn">
	<span class="mainheader">Microarray Standards and User Groups</span>

		<dl>
							
		<dt><a href="http://www.mged.org/Workgroups/MIAME/miame.html">MIAME</a></dt>
		<dd>Minimum Information About a Microarray Experiment that is needed for unambiguous interpretation and reproducibility.</dd>
		<dt><a href="/portals/expression/microarray/MIAME-plant_Dec2005.pdf">MIAME/Plant white paper</a> [pdf format]</dt>
		<dd>Extension of MIAME standards for describing plant microarray experiments and samples.</dd>
		<dt><a href="http://www.mged.org/">Microarray Gene Expression Database Group</a></dt>
		<dd>Open discussion group involved in facilitating the adoption of standards for DNA-arrays analysis, technology and warehousing.</dd>

		<dt><a href="http://www.egroups.com/group/microarray">Microarray Newsgroup</a></dt>
		<dd>The web based Microarray Newsgroup at egroups.</dd>

		</dl>
	</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
