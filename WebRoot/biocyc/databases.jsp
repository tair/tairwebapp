<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Title of Page";
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
<!-- SIDEBAR -->

<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Other DataBases" />
</jsp:include>

<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<p align="center"><img src="aracyc_files/aracyc_logo.gif" width="100" height="58"></p>
<p class="mainheader">Databases</p>
<p>Here is a list of other databases which might be of relevance to your work. </p>
<dl>
	<dd><b><a href="http://www.metacyc.org/">MetaCyc</a> </b>A database of nonredundant, experimentally elucidated metabolic pathways. This universal database was used as reference database to generate AraCyc.</dd>
	<dd><b><a href="http://www.genome.jp/kegg/">KEGG</a> </b>A universal database compiling information on genes, enzymes and much more.</dd>
	<dd><b><a href="http://www.brenda.uni-koeln.de/">Brenda</a> </b> A database collecting  enzyme functional data available to the scientific community.</dd>
	<dd><b><a href="http://www.expasy.uniprot.org/">UniProt</a> </b> The central repository of protein sequence and function created by joining the information contained in Swiss-Prot, TrEMBL, and PIR.</dd>
	<dd><b><a href="http://www.chem.qmul.ac.uk/iubmb/">Enzyme Nomenclature</a></b> The IUBMB site offers a wealth of information on enzymes and reactions. All you need to know about the EC nomenclature.</dd>
</dl>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

