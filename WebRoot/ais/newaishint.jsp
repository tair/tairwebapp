<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
		"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
String pageName = "TAIR - About AIS";
String cssfile="/css/page/ais.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="640" />
</jsp:include>


		<!-- Content goes here //--> 


<span class="mainheader">About the Electronic AIS</span><br />

<p>The Arabidopsis Information Service (AIS) and seed stock resource was maintained by Prof. A.  R. Kranz at the Botanical Institute of the Johann Wolfgang Goethe University in Frankfurt, Germany. The AIS newsletter was published from 1964 to 1990 and contains a goldmine of information in the form of brief reports on all aspects of Arabidopis research.</p>

<p>The contents of each AIS issue has been re-entered into computer readable format, and is available on-line through a WAIS search of keywords. The volumes have also been reformatted into HTML documents for WWW presentation.  This effort was carried out by the Boston AAtDB project (Sam Cartinhour, Mike Cherry, John Morris and Howard Goodman) and was undertaken with the permission and encouragement of Dr. Kranz.</p>

<ul style="list-style-image: url(/images/redball.gif);">

<li><a href="/ais/newaisvols.jsp">Browse the AIS by volume</a>.</li>

<li><a href="/servlets/Search?action=new_search&amp;type=publication">Search the AIS in TAIR's Publication Search</a>.</li>


<li>The AIS Collection of seed resources gathered by Dr. Kranz have been integrated into those of the <a href="http://nasc.nott.ac.uk/home.html">Nottingham Arabidopsis Stock Centre</a> (NASC). </li>

<li>In addition, colour images of several hundred of the AIS and numerous other lines can be viewed on-line using the NASC 
<a href="http://seeds.nottingham.ac.uk/Nasc/action.lasso?-token.user=16935254&amp;-response=/Nasc/picbook/picture_book.lasso">Picture Book</a>.</li>
</ul>



<!--End Content-->
<!-- FOOTER -->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

