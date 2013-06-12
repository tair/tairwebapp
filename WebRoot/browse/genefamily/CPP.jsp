<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "CPP Transcription Factor Family";
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
<h2>CPP Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Riechmann, J. L.,Heard, J.,Martin, G.,Reuber, L.,Jiang, C.,Keddie, J.,Adam, L.,Pineda, O.,Ratcliffe, O. J.,Samaha, R. R.,Creelman, R.,Pilgrim, M.,Broun, P.,Zhang, J. Z.,Ghandehari, D.,Sherman, B. K.,Yu, G.</b> (2000) <a href="/servlets/TairObject?type=publication&amp;id=1345963">Arabidopsis transcription factors: genome-wide comparative analysis among eukaryotes.</a> SCIENCE <b>290</b>
</li> <li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li></ul></td></tr>
	<tr><th valign="top">Gene Family Criteria:</th> <td>A few representative proteins were used to perform a Blast on the TAIR website. The resultant sequences with an E-value smaller than 10-5 were considered a good match, then the last sequence was used in a subsequent Blast, and so forth until all similar sequences were identified, then they were aligned, and any mismatched sequences were discarded</td></tr>
	<tr><th valign="top">Contact:</th> <td></td></tr>
</table>

<table align="center" border="1" cellspacing="0" cellpadding="2">
	<tr>
		<th><b>Gene Family</b></th>
		<th><b>Locus ID</b></th>
		<th><b>Gene/Protein Name</b></th>
		<th><b>Submitter Description</b></th>
	</tr>
<tr>		<td>CPP Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g22760">At3g22760</a></td>
		<td>&nbsp;</td>
		<td>CXC domain containing TSO1-related protein 1 (SOL1</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g22780">At3g22780</a></td>
		<td>&nbsp;</td>
		<td>DNA binding protein -related, identical to putativ</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g14770">At4g14770</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g20110">At2g20110</a></td>
		<td>&nbsp;</td>
		<td>expressed protein, and genscan</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g04850">At3g04850</a></td>
		<td>&nbsp;</td>
		<td>expressed protein, similar to hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g16160">At3g16160</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g25790">At5g25790</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein, various predicted proteins</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g29000">At4g29000</a></td>
		<td>&nbsp;</td>
		<td>transcription factor -related, leghemoglobin activ</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
