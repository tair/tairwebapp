<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Proteome Resources- Proteome Facilities";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11807" />
</jsp:include>

<jsp:include page="/jsp/includes/proteomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Proteome Facilities" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Proteome Facilities</span>



<dl>

<dt><a href="http://www.uwstructuralgenomics.org">Arabidopsis Structural Genomics</a></dt>
<dd>Center for Eukaryotic Structural Genomics, University of Wisconsin. You can suggest specific proteins to be solved by a 3-D structure determination project.</dd>


<dt><a href="http://ca.expasy.org/ch2d/service/2dservice-home.html">Proteomics Core Facility</a></dt>
<dd>Proteomics Core Facility, University of Geneva, Switzerland. Send your samples for 2-D PAGE analysis, peptide mass fingerprinting and/or tandem mass spectrometry.</dd>

<dt><a href="http://www.agrisera.com/">Agrisera</a></dt>
<dd>Provider of commercial primary antibodies to plant proteins
(Arabidopsis, algae and others). Services: poly and monoclonal custom
antibody production, specializing in plant antigens.</dd>
<dt><a href="http://www.plantprobes.net/">PlantProbes</a></dt>

<dd>Antibodies of cell wall glycans developed by the <a href="http://www.bmb.leeds.ac.uk/staff/jpk/antibodies.htm">
Paul Knox lab</a> at the University of Leeds are available. The distribution of the antibodies is provided via PlantProbes. 
Go to their website to see a full catalog.</dd>

</dl>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

