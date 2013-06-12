<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - PerlCyc and JavaCyc";
String cssfile="/css/page/ais.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="7320" />
</jsp:include>
<center>


<table width=600><tr><td>
<font face=verdana,arial,helvetica,sans-serif size=2>
    <a href="/biocyc/index.jsp"><IMG SRC=../aracyc_logo_mini.gif border=0></a>
<h2>PerlCyc and JavaCyc</h2>

<p>PerlCyc and JavaCyc are modules in Perl and Java, respectively, that allow these languages to access <a href="http://bioinformatics.ai.sri.com/ptools/ptools-fns.html" target="_blank">Pathway Tools internal functions</a> and data structures.</p>
<p>**Pathway Tools needs to be started with the -api option for PerlCyc and JavaCyc to work.</p>
<p>PerlCyc and JavaCyc are maintained by the <a href="http://sgn.cornell.edu/" target="_blank">SGN</a>.</p>
<h2>Downloads:</h2>
    <p><a href="http://sgn.cornell.edu/downloads/" target="_blank">PerlCyc</a></p>
   
    <p><a href="http://sgn.cornell.edu/downloads/" target="_blank">JavaCyc</a></p>
    
<hr>
<address></address>
<!-- hhmts start -->
Last modified: Mon Sept 22 17:58:00 PDT 2008
<!-- hhmts end -->
    </td></tr>
</table>
</font>
</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
