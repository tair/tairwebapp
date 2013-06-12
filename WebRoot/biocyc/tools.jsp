<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - AraCyc - Tools";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="731" />
</jsp:include>
<!-- SIDEBAR -->

<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Tools" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->

<p align="center"><img src="aracyc_files/aracyc_logo.gif" width="100" height="58"></p>
<p class="mainheader">AraCyc Tools </p>
<p>Here are a number of applications offered with the AraCyc database...</p>
<dl>
	<dd><b><a href="http://pmn.plantcyc.org/ARA/expression.html">OMICS Viewer</a> </b>The Viewer lets you overlay large scale data from experiments such as <strong>microarray expression</strong>, <strong>proteomics</strong>, and <strong>metabolic profiling</strong> onto a Metabolic Map. Visit the <a href="../../help/tutorials/aracyc5.jsp">Tutorial</a> to learn how to use this tool. Data can also be visualized using the new <a href=" http://pmn.plantcyc.org/overviewsWeb/celOv.shtml">Metabolic (Cellular) Overview</a>  </dd>
	<dd><b><a href="http://pmn.plantcyc.org/ARA/comp-genomics?">Comparative Analysis</a> </b>Draws summary tables comparing the metabolic profiles of <i>Arabidopsis thaliana</i> col. and <i>E. coli</i> K12 according to the information contained in AraCyc and <a href="http://ecocyc.org/">EcoCyc</a></dd>
	<dd><b><a href="http://pmn.plantcyc.org/query.html">Advanced Query Page</a> </b>Enables users to generate specific datasets from within the database, e.g. by querying for compounds with a specific molecular formula, etc. </dd>
</dl>
<p class="mainheader">Other Tools </p>
<p>Many useful metabolomics-related resources, software applications, and databases can be accessed through our <a href="/portals/metabolome/index.jsp">Metabolomics Portal</a></p>

<p>&nbsp;</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

