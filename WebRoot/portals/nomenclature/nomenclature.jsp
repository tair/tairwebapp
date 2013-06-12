<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "TAIR Nomenclature Resources";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1171" />
</jsp:include>

<jsp:include page="/jsp/includes/nomenclatureSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Nomenclature Resources" />
</jsp:include>
<div id="rightcolumn">


<!--CONTENT HERE-->
<span class="mainheader"> Nomenclature Resources</span>
<p>This page presents links to guidelines for gene nomenclature for Arabidopsis and other organisms</p>
<dl>

<dt><a href="http://chromdb.org/help/nomenclature.html">ChromDB Nomenclature Guidelines</a></dt>
<dd>Recommended nomenclature for Arabidopsis and Maize genes involved in chromatin remodeling.</dd>
<dt><a href="http://www.expasy.ch/cgi-bin/lists?nomlist.txt">Swiss-Prot links to nomenclature guidelines</a></dt>
<dd>Nomenclature guidelines for many classes of proteins as  well as links to nomenclature documents for other organisms.</dd>
<dt> <a href="http://mips.helmholtz-muenchen.de/plant/athal/about/nomenclature.jsp ">MIPS Classification of Arabidopsis Proteins</a></dt>
<dd>Link to MIPS functional classification of Arabidopsis proteins.</dd>
</dl>
<center>Last modified on February 8, 2011</center>		    
                </div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
