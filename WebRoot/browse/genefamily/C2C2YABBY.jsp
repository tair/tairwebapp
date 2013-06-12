<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "C2C2-YABBY Transcription Factor Family";
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
<h2>C2C2-YABBY Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Siegfried, K. R.,Eshed, Y.,Baum, S. F.,Otsuga, D.,Drews, G. N.,Bowman, J. L.</b> (1999) <a href="/servlets/TairObject?type=publication&amp;id=1256">Members of the YABBY gene family specify abaxial cell fate in Arabidopsis.</a> DEVELOPMENT <b>126</b>
</li> <li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li></ul></td></tr>
	<tr><th valign="top">Gene Family Criteria:</th> <td>Families were found through a domain search and blast technique. Publications were found through PubMed and the conserved domain motif that characterizes each TF family was identified. Using the motif, a Blast was conducted in the TAIR website, the resultant sequences were then aligned and mismatches were discarded.</td></tr>
	<tr><th valign="top">Contact:</th> <td></td></tr>
</table>

<table align="center" border="1" cellspacing="0" cellpadding="2">
	<tr>
		<th><b>Gene Family</b></th>
		<th><b>Locus ID</b></th>
		<th><b>Gene/Protein Name</b></th>
		<th><b>Submitter Description</b></th>
	</tr>
<tr>		<td>C2C2-YABBY Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g69180">At1g69180</a></td>
		<td>CRC</td>
		<td>transcription factor CRC</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g45190">At2g45190</a></td>
		<td>YAB1</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g08465">At1g08465</a></td>
		<td>YAB2</td>
		<td>putative YABBY3 axial regulator</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g00180">At4g00180</a></td>
		<td>YAB3</td>
		<td>putative YABBY3 axial regulator</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g23420">At1g23420</a></td>
		<td>YAB4</td>
		<td>F28C11.5</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g26580">At2g26580</a></td>
		<td>YABBY5</td>
		<td>&nbsp;</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
