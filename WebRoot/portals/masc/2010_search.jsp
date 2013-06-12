<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "2010 Project Search";
String highlight = "3";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
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

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="2010 Program" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE//-->
<span class="mainheader">Search  Genes included in 2010 Functional Genomics Project Lists</span>


                  <p>Select a search category in the drop down menu and enter
                  the query string in the input box. For multiple inputs, please
                  separate each input string by a semicolon (e.g. At2g41140;
                  AT2G32530; AC004681; T04189). The search is case insensitive
                  and uses regular expression wild-cards.
                  </p>
<dl>
<dt>Search for Genes in 2010 Project Lists</dt>
<dd>                  <form action="/cgi-bin/2010_projects/2010_search.pl" method="get">Query Text: <textarea name="qstring" width="50" height="4"></textarea>
                  <select name="stype"> <option value="any" selected>Any<option
                    value=accession>Genbank Accession #<option value=locus>Locus
                    Name<option value=other_gene_names>Other Gene Names<option
                    value=lead_pi>PI Name<option value=proposal>Proposal
                    Title</option></select> <input type="submit" value="Submit Query"> </form>

 </dd> 


</dl>

</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>