<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Genefamily - Zinc finger-homeobox gene family";
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
<!-- Content goes here //-->
<!-- Content goes here //-->
<span class="mainheader">zinc finger-homeobox gene family</span>
<table>
	<tr><th>Source:</th> <td>&nbsp;</td></tr>
	<tr><th>Gene Family Criteria:</th> <td>Defined by the presence of a putative zinc finger and a homeodomain (for the ZHD
subfamily), <br> or by the presence of the putative zinc finger and loss of the
homeodomain (for the MIF subfamily).</td></tr>
	<tr><th>Contact:</th> <td><a target="display" href="/servlets/Community?action=view&amp;type=person&amp;communityID=1501421667">Wei	Hu</a></td></tr>
</table>

<table align="center" border="1" cellspacing="0" cellpadding="2">
	<tr>
		<th><b>Gene Family</b></th>
		<th><b>Locus ID</b></th>
		<th><b>Gene/Protein Name:</b></th>
		<th><b>GenBank Accession:</b></th>
		<th><b>Comment:</b></th>
	</tr>
	<tr class="alt">
		<td>ZHD subfamily</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g65410">At5g65410</a></td>
		<td>AtZHD1</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AAO00745">AAO00745</a></td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g24660">At4g24660</a></td>
		<td>AtZHD2</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AAM78073">AAM78073</a></td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g02540">At2g02540</a></td>
		<td>AtZHD3</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AAV63863">AAV63863</a></td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g14440">At1g14440</a></td>
		<td>AtZHD4</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AAL66963">AAL66963</a></td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g75240">At1g75240</a></td>
		<td>AtZHD5</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_565106">NP_565106</a></td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g18350">At2g18350</a></td>
		<td>AtZHD6</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_565436">NP_565436</a></td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g50890">At3g50890</a></td>
		<td>AtZHD7</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_190658">NP_190658</a></td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g15210">At5g15210</a></td>
		<td>AtZHD8</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_197025">NP_197025</a></td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g28920">At3g28920</a></td>
		<td>AtZHD9</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_189534">NP_189534</a></td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g39760">At5g39760</a></td>
		<td>AtZHD10</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_568570">NP_568570</a></td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g69600">At1g69600</a></td>
		<td>AtZHD11</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_177118">NP_177118</a></td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g60480">At5g60480</a></td>
		<td>AtZHD12</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_200856">NP_200856</a></td>
		<td>Pseudogene</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g42780">At5g42780</a></td>
		<td>AtZHD13</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_199092">NP_199092</a></td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g14687">At1g14687</a></td>
		<td>AtZHD14</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_563956">NP_563956</a></td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>MIF subfamily</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g74660">At1g74660</a></td>
		<td>AtMIF1</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AAM62558">AAM62558</a></td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g28917">At3g28917</a></td>
		<td>AtMIF2</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AAM63930">AAM63930</a></td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td>At1g18835</td>
		<td>AtMIF3</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=ABB20816">ABB20816</a></td>
		<td>&nbsp;</td>
	</tr>
</table>

<p><a href="index.jsp"><img src="/images/arrow.small.up.gif"
border="0">Return to Gene Family Index</a><br>
<br>
<br></p>
<center>Last modified on January 16, 2004</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include> 