<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "MASC";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11521" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Europe" />
</jsp:include>
<div id="rightcolumn">


<!--CONTENT HERE//-->
<span class="mainheader">Europe</span>

<dl>


<dt><A HREF="/portals/masc/countries/Austria.jsp">Austria</a>
<dt><A HREF="/portals/masc/countries/Belgium.jsp">Belgium</a>
<dt><A HREF="/portals/masc/countries/EU.jsp">European Union</a>
<dt><A HREF="/portals/masc/countries/France.jsp">France</a>
<dt><A HREF="/portals/masc/countries/Germany.jsp">Germany</a> 
<dt><A HREF="/portals/masc/countries/Italy.jsp">Italy</a>
<dt><A HREF="/portals/masc/countries/Netherlands.jsp">Netherlands</a>
<dt><A HREF="/portals/masc/countries/Nordic.jsp">The Nordic Arabidopsis Network</a>
<dt><A HREF="/portals/masc/countries/Spain.jsp">Spain</a>
<dt><A HREF="/portals/masc/countries/United_Kingdom.jsp">United Kingdom</a>

</DL>
<p>


<center>Last modified on August 18, 2008</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>




