<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String pageName = "TAIR Nomenclature Guidelines";
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

<jsp:include page="/jsp/includes/nomenclatureSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="" />
</jsp:include>

<div id="rightcolumn">
<!--CONTENT HERE-->
		 
<span class="header"><a href="http://www.tigr.org/tdb/e2k1/ath1/"><img src="/images/tigr.gif" width="100" height="30"></a>&nbsp;&nbsp;&nbsp;&nbsp;Gene Naming Conventions</span>
<P>
<table width="500" align="left" border="1" cellspacing="0" cellpadding="2">
<tr>
<td><B>Database match</B></td>
<td><b>Name</b></td>
<td><b>(Commentfield)</b></td>
<td><b>Example</b></td>
</tr>
<tr>
<td>Identical</td>
<td>Gene</td>
<td>identical to.</td>
<td>aquaporin
</td>
</tr>  
<tr>
<td>Similar </td>
<td>Gene, putative </td>
<td>similar to...</td>
<td>aquaporin, putative 
Comment: similar to GP:2677614</td>
</tr>  
<tr>
<td>Gene family </td>
<td>Gene family or name of gene family e.g. carbohydrate transporter </td>
<td>&nbsp;</td>
<td>aquaporin family</td>
</tr>  
<tr>
<td>Low similarity </td>
<td>Gene-related </td>
<td>&nbsp;</td>
<td>aquaporin-related</td>
</tr>  
<tr>
<td>Uncharacterized EST/cDNA with no other database match</td>
<td>Expressed protein </td>
<td>&nbsp;</td>
<td>Expressed protein</td>
</tr>  
<tr>
<td>Conserved hypothetical protein within this organism</td>
<td>Hypothetical protein common family (2 or more matches within this organism)</td>
<td>similar to accession</td>
<td>hypothetical protein common family
Comment: similar to GP:2677614 and GP:2678234
</td>
</tr>  
<tr>
<td>Conserved hypothetical protein from another species</td>
<td>Conserved hypothetical protein (1 or more match with another organism)</td>
<td>similar to accession (organism.)</td>
<td>conserved hypothetical protein
Comment: similar to GP:2345678</td>
</tr>  
<tr>
<td>No database match 
 /predicted model</td>
<td>Hypothetical protein </td>
<td>&nbsp;</td>
<td>hypothetical protein</td>
</tr>  
</table>
                </div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
