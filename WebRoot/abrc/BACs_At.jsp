<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "TAIR -Clones/DNA Resources-BAC Libraries";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11131" />
</jsp:include>

<jsp:include page="/jsp/includes/clonesSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Arabidopsis BAC libraries" />
</jsp:include>

<div id="rightcolumn">


<!--CONTENT IN HERE -->
<span class="header">Arabidospis BAC Libraries</span>
<p>The ABRC distributes most of the BACs used for the AGI genome
sequencing project in addition to several other resources. Individual
BACs can be found by name using the <a href="/servlets/Search?action=new_search&type=dna">DNA
search</a>. Sequenced BACs are also displayed on the <a href="/servlets/mapper">Mapviewer</a>
and <a href="http://tairvm09.tacc.utexas.edu/servlets/sv">Seqviewer</a>.</p>


<dl>
<dt>The BAC libraries for which we distribute individual clones are:</dt>

<dd><a href="/servlets/TairObject?type=library&name=IGF-BAC%20LIBRARY">IGF-BAC LIBRARY</a></dd>
<dd><a href="/servlets/TairObject?type=library&name=MITSUI%20PAC%20(P1)%20LIBRARY">MITSUI PAC (P1) LIBRARY</a></dd>
<dd><a href="/servlets/TairObject?type=library&name=T%20BAC%20LIBRARY">T BAC LIBRARY</a></dd>
<dd><a href="/servlets/TairObject?type=library&name=TAC%20LIBRARY">TAC LIBRARY</a></dd>
<dd><a href="/servlets/TairObject?type=library&name=CHOI%20BAC%20LIBRARY">CHOI BAC LIBRARY</a></dd>
</dl>


<dl>
<dt>BAC libraries that we distribute as the entire library are:</dt>

<dd><a href="/servlets/TairObject?type=library&name=MITSUI%20PAC%20(P1)%20LIBRARY">MITSUI PAC (P1) LIBRARY</a></dd>
<dd><a href="/servlets/TairObject?type=library&name=TAC%20LIBRARY">TAC LIBRARY</a></dd>
<dd><a href="/servlets/TairObject?type=library&name=CHANG,%20ZHANG,%20PREUSS%20LANDSBERG%20BIBAC%20LIBRARY">CHANG,ZHANG, PREUSS LANDSBERG BIBAC LIBRARY</a></dd>
</dl>

<dl>
<dt>The BAC libraries for which colony blot filters are available are:</dt>

<dd><a href="/servlets/TairObject?type=library&name=IGF-BAC%20LIBRARY">IGF-BAC LIBRARY</a></dd>
<dd><a href="/servlets/TairObject?type=library&name=MITSUI%20PAC%20(P1)%20LIBRARY">MITSUI PAC (P1) LIBRARY</a></dd>
<dd><a href="/servlets/TairObject?type=library&name=T%20BAC%20LIBRARY">T BAC LIBRARY</a></dd>
<dd><a href="/servlets/TairObject?type=library&name=TAC%20LIBRARY">TAC LIBRARY</a></dd>
<dd><a href="/servlets/TairObject?type=library&name=T%20BAC%20LIBRARY"></a></dd>
</dl>

<p></p>
<center>Last modified on January 16, 2004</center>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
