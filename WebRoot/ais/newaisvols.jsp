<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
		"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
String pageName = "TAIR - About AIS";
String highlight = "4";
String helpfile="";
String cssfile="/css/page/ais.css";
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

<!--Content-->

<br />


<p><span class="mainheader">Electronic AIS Volumes</span>
<br />
To go to the contents page of a particular AIS volume, click on the
appropriate link below. Further details <a
href="/ais/newaishint.jsp">
about EAIS</a> are available.To search AIS please use the <a href="/servlets/Search?action=new_search&amp;type=publication">TAIR Publication Search.</a>
</p>
<ul>
<li><a href="1964/index1964.html">Volume 01: 1964</a>
<li><a href="1965/contents01S.html">Volume 01 Supplement: 1965</a>
<li><a href="1965/index1965.html">Volume 02: 1965</a>
<li><a href="1966/index1966.html">Volume 03: 1966</a>
<li><a href="1967/index1967.html">Volume 04: 1967</a>
<li><a href="1968/index1968.html">Volume 05: 1968</a>
<li><a href="1969/index1969.html">Volume 06: 1969</a>
<li><a href="1970/index1970.html">Volume 07: 1970</a>
<li><a href="1971/index1971.html">Volume 08: 1971</a>
<li><a href="1972/index1972.html">Volume 09: 1972</a>
<li><a href="1973/index1973.html">Volume 10: 1973</a>
<li><a href="1974/contents11.html">Volume 11: 1974</a>
<li><a href="1975/contents12.html">Volume 12: 1975</a>
<li><a href="1976/contents13.html">Volume 13: 1976</a>
<li><a href="1977/contents14.html">Volume 14: 1977</a>
<li><a href="1978/contents15.html">Volume 15: 1978</a>
<li><a href="1979/contents16.html">Volume 16: 1979</a>
<li><a href="1980/contents17.html">Volume 17: 1980</a>
<li><a href="1981/contents18.html">Volume 18: 1981</a>
<li><a href="1982/contents19.html">Volume 19: 1982</a>
<li><a href="1983/contents20.html">Volume 20: 1983</a>
<li><a href="1984/contents21.html">Volume 21: 1984</a>
<li><a href="1985/contents22.html">Volume 22: 1985</a>
<li><a href="1987/contents23.html">Volume 23: 1987</a>
<li><a href="1987/contents25.html">Volume 25: 1987</a>
<li><a href="1988/contents26.html">Volume 26: 1988</a>
<li><a href="1990/contents27.html">Volume 27: 1990</a>
</ul>


<!--End Content-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
