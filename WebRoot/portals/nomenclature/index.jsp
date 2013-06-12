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
<jsp:param name="id" value="117" />
</jsp:include>

<jsp:include page="/jsp/includes/nomenclatureSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="" />
</jsp:include>
<div id="rightcolumn">

<!--CONTENT HERE-->
<span class="mainheader"> Nomenclature</span>
<p>This page presents links to guidelines for gene nomenclature for Arabidopsis and other organisms.</p>
<dl>
<dt><a href="/portals/nomenclature/guidelines.jsp">Arabidopsis Nomenclature</a></dt>
<dd>Suggested guidelines for naming Arabidopsis genes and other datatypes.  </dd>
<dt><a href="/portals/nomenclature/nomenclature.jsp">Nomenclature Resources</a></dt>
<dd>Useful information about gene product classification, gene family nomenclature rules for Arabidopsis and other organisms.</dd>
<dt><a href="/servlets/processor?type=genesymbol&amp;update_action=view_symbol">Browse Registered Arabidopsis Gene Symbols</a></dt>
<dd>Comprehensive list of registered symbols.</dd>
<dt><a href="/portals/nomenclature/symbol_main.jsp">Register Arabidopsis Gene Class Symbols</a></dt>
<dd>Register your gene symbol pre-publication.</dd>
<dt><a href="/submit/locus_identifier_request.jsp">Request Locus Identifier</a></dt>
<dd>Information on requesting a new locus identifier.</dd>
</dl>

<center>Last modified on May 31, 2006</center>		    
                </div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

