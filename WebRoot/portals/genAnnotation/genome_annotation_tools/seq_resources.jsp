<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "Genome Annotation Tools: Comprehensive Toolkits";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11433" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Comprehensive Sequence Analysis Resources" />
</jsp:include>
<div id="rightcolumn">

		
		<!-- Content goes here //--> 
<span class="mainheader">Comprehensive Sequence Analysis Resources</span>
<P>Launch sites for a variety of sequence analysis tools.


                <DL>
                <DT><a href="http://searchlauncher.bcm.tmc.edu/">BCM Launcher</A>
                <DD>Molecular biology-related search and analysis services from Baylor College of Medicine. 
               
		<DT><a href="http://www.ebi.ac.uk/Tools/">EBI Toolbox</A>
		<DD>List of bioinformatic tools and resources
		
                <DT><a href="http://www.genepalette.org">GenePalette</A>

                <DD>A cross-platform and cross-species desktop application for genome sequence visualization and navigation.
                </DL>

		
            </div> <!--right column-->

<center>Last modified on April 13, 2006</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


