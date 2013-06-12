<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "CCAAT-HAP5 Transcription Factor Family";
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
<h2>CCAAT-HAP5 Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Edwards, D.,Murray, J. A.,Smith, A. G.</b> (1998) <a href="/servlets/TairObject?type=publication&amp;id=2423">Multiple genes encoding the conserved CCAAT-box transcription factor complex are expressed in Arabidopsis.</a> PLANT PHYSIOLOGY <b>117</b>
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
<tr>		<td>CCAAT-HAP5 Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g48590">At3g48590</a></td>
		<td>HAP5A</td>
		<td>transcription factor Hap5a</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g08970">At1g08970</a></td>
		<td>HAP5C</td>
		<td>putative transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g07980">At1g07980</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g54830">At1g54830</a></td>
		<td>&nbsp;</td>
		<td>heme activated protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g50490">At5g50490</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g50470">At5g50470</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g38140">At5g38140</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g27910">At5g27910</a></td>
		<td>&nbsp;</td>
		<td>transcription factor - like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g50480">At5g50480</a></td>
		<td>&nbsp;</td>
		<td>transcription factor Hap5a-like</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g63470">At5g63470</a></td>
		<td>&nbsp;</td>
		<td>transcription factor Hap5a-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g56170">At1g56170</a></td>
		<td>&nbsp;</td>
		<td>transcription factor, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g12480">At3g12480</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g43250">At5g43250</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
