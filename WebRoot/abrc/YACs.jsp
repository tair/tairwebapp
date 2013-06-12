<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "TAIR -Clones/DNA Resources-YACLibraries";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11130" />
</jsp:include>

<jsp:include page="/jsp/includes/clonesSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Arabidopsis YAC libraries" />
</jsp:include>

<div id="rightcolumn">


<!--CONTENT IN HERE -->
<span class="header">Arabidopsis YAC libraries</span>
<p>The ABRC distributes individual sequenced clones from the
<a href="/servlet/TairObject?id=6&type=library">CICYAC LIBRARY</a>, as well as pools and filters. Sequenced YAC clones
can be found by name through the <a href="/servlets/Search?action=new_search&type=dna">DNA
search</a> using the prefix CIC, and are also displayed on the<a href="/servlets/mapper">Mapviewer</a> and <a href="http://tairvm09.tacc.utexas.edu/servlets/sv">Seqviewer</a>.</p>

<p>YAC libraries previously available from ABRC have been archived.
Please <a href="mailto:abrc@osu.edu">contact us</a> to
request specific libraries or clones.</p>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

