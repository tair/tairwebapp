<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR-Arabidipsis Meeting 2003") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("0") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<table>
<tr>
<td>
<h2>TAIR at the <a href="http://www.union.wisc.edu/conferenceservices/arabidopsis/">14th Arabidopsis Meeting 2003</a></h2>
<P>
<h4>Talks</h4>
<ul>
<li><b>Genome Annotation Workshop </b>Sunday 4-5:30 PM, Union Theater
<li><b>AtGenExpress Workshop</b> Sunday 4-5:30 PM 
</ul>

<P>
<P>
<P>
<h4>Workshops</h4>
<ul>
<li><b>Beginners Workshop </b>Monday 8-9:30 PM, Humanities 1111
<li><b>Advanced Workshop</b> Monday 8-9:30 PM, Humanities 2650
</ul>

<P>
<P>
<P>
<h4>Posters</h4>
<ul>
<li><b>#537</b>:  Public Access to Microarray Data from the Arabidopsis Information Resource
<li><b>#540</b>:  TAIRway to Heaven - New Tools and Data at TAIR
<li><b>#543</b>:  AraCyc, a biochemical pathway database for Arabidopsis thaliana
<li><b>#544</b>:  TAIR 2 GO: Controlled Vocabularies and Functional Annotation at TAIR
<li><b>#553</b>:  New Gene Symbol Registration Functionality at TAIR
</ul>

<h4>Find us at : <a href="/index.jsp">www.arabidopsis.org</a></h4>
<h4>Contact us at: <a href="mailto:curator@arabidopsis.org">curator@arabidopsis.org</a></h4>
</td></tr></table>

<P>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
