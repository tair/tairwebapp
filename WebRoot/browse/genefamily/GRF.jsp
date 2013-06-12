<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "GRF Transcription Factor Family";
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
<h2>GRF Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Kim, J. H.,Choi, D.,Kende, H.</b> (2003) <a href="/servlets/TairObject?type=publication&amp;id=501710542">The AtGRF family of putative transcription factors is involved in leaf and cotyledon growth in Arabidopsis.</a> THE PLANT JOURNAL <b>36</b>
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
<tr>		<td>GRF Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g22840">At2g22840</a></td>
		<td>AtGRF1</td>
		<td>transcription activator (GRL1), annotation tempora</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g37740">At4g37740</a></td>
		<td>AtGRF2</td>
		<td>transcription activator (GRL2), annotation tempora</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g36400">At2g36400</a></td>
		<td>AtGRF3</td>
		<td>transcription activator (GRL3), annotation tempora</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g52910">At3g52910</a></td>
		<td>AtGRF4</td>
		<td>expressed protein, growth-regulating factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g13960">At3g13960</a></td>
		<td>AtGRF5</td>
		<td>transcription activator (GRL5), annotation tempora</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g06200">At2g06200</a></td>
		<td>AtGRF6</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g53660">At5g53660</a></td>
		<td>AtGRF7</td>
		<td>hypothetical protein, similar to unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g24150">At4g24150</a></td>
		<td>AtGRF8</td>
		<td>hypothetical protein, various predicted proteins</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g45480">At2g45480</a></td>
		<td>AtGRF9</td>
		<td>expressed protein, and genscan</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
