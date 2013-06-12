<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR- Metabolomics Resources- Chemical Structure Tools";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1195" />
</jsp:include>

<jsp:include page="/jsp/includes/metabolomeSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Chemical Structure Tools" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->
<span class="mainheader">Chemical Structure Tools</span>


<DL>

          

                        
<DT><a href="http://www.chemaxon.com/product/msketch.html" target="_blank">Marvin Sketch</a></DT>
<dd>Marvin Sketch allows users to draw compounds, import existing compounds, edit their structures, depict reactions, and perform many other tasks. It is a Java-based program provided by ChemAxon.</dd>

<DT><a href="http://www.chemaxon.com/product/mspace.html" target="_blank">Marvin Space</a></DT>
<dd>MarvinSpace allows high-powered visualization of chemical structures in 3D. It can be used on a range of platforms including Windows, Linux, Mac OS X, and Solaris</dd>

<DT><a href="http://www.chemaxon.com/product/mview.html" target="_blank">Marvin View</a></DT>
<dd>Marvin View provides a large set of visualization tools to allow the viewing of one or more compounds or reactions. It is a Java-based program provided by ChemAxon.</dd>

<DT><a href="http://www.chemaxon.com/products.html" target="_blank">ChemAxon Tools</a></DT>
<dd>In addition to MarvinSketch, MarvinSpace, and MarvinView, ChemAxon provides several additional tools such as the Reactor and Fragmenter tools that could be useful to biochemists.</dd>

<DT><a href="http://jmol.sourceforge.net/" target="_blank">Jmol</a></DT>
<dd>Jmol is a java-based open-source tool for viewing chemical structurs in 3D.</dd>

<DT><a href="http://www.softstore2.com/Chemistry/Discovery_Studio_Visualizer_2_0.html" target="_blank">Discovery Studio Visualizer 2.0</a></DT>
<dd>The DS Visualizer enables users to view molecules and to generate high quality graphics files.</dd>



                    
                        
                    </dd>

</DL>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

