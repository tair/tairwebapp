<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "CCAAT-HAP3 Transcription Factor Family";
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
<h2>CCAAT-HAP3 Transcription Factor Family</h2>
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
	<tr class="alt">
		<td>CCAAT-HAP3 Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g47670">At5g47670</a></td>
		<td>L1L</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g21970">At1g21970</a></td>
		<td>LEC1</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g14540">At4g14540</a></td>
		<td>&nbsp;</td>
		<td>CCAAT-binding transcription factor subunit A(CBF-A</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g09030">At1g09030</a></td>
		<td>&nbsp;</td>
		<td>putative CCAAT-binding transcription factor subuni</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g38880">At2g38880</a></td>
		<td>&nbsp;</td>
		<td>putative CCAAT-binding transcription factor subuni</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g47810">At2g47810</a></td>
		<td>&nbsp;</td>
		<td>putative CCAAT-box binding trancription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g37060">At2g37060</a></td>
		<td>&nbsp;</td>
		<td>putative CCAAT-box binding trancription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g13570">At2g13570</a></td>
		<td>&nbsp;</td>
		<td>putative CCAAT-box binding trancription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g47640">At5g47640</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g53340">At3g53340</a></td>
		<td>&nbsp;</td>
		<td>transcription factor NF-Y, CCAAT-binding - like pr</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
