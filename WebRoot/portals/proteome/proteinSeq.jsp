<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Proteome Resources- Primary Sequence";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11800" />
</jsp:include>

<jsp:include page="/jsp/includes/proteomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Primary Sequence" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Primary Sequence</span>

<DL>
       
<DT> <a href="ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/">AGI proteins</a></DT>
<dd> Complete protein sequences from TAIR's Arabidopsis genome release. Please refer to the README for details.</dd>

<DT> <a href="http://www.pir.uniprot.org/database/download.shtml">UniProt</a></DT>
<dd> Download complete UniProtKB/Swiss-Prot (curated) and UniProtKB/TrEMBL protein sequences. Alternatively, choose <a href="ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/taxonomic_divisions/"> species-specific datasets</a>.</dd> 

<DT> <a href="http://genomics.msu.edu/plant_specific/index.html">The Plant Specific Database</a></DT>
<dd> Lists of Arabidopsis proteins that are plant-specific, or only found in certain taxonomic divisions.</dd> 

<DT> <a href="http://plantsp.genomics.purdue.edu/plantsp/html/families.html">PlantsP</a></DT>
<dd> Lists of all kinases and phosphatases in Arabidopsis, and plants. </dd>

</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

