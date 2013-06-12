<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "ARID Transcription Factor Family";
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
<h2>ARID Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li> <li>
<b></b> () <a href="/servlets/TairObject?type=publication&amp;id="></a>  <b></b>
</li></ul></td></tr>
	<tr><th valign="top">Gene Family Criteria:</th> <td>Data was taken directly from published literature and verified by manual curation</td></tr>
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
		<td>ARID Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g04880">At1g04880</a></td>
		<td>&nbsp;</td>
		<td>ARID/BRIGHT DNA-binding domain-containing protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g20910">At1g20910</a></td>
		<td>&nbsp;</td>
		<td>ARID/BRIGHT DNA-binding domain-containing protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g55650">At1g55650</a></td>
		<td>&nbsp;</td>
		<td>ARID/BRIGHT DNA-binding domain-containing protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g76110">At1g76110</a></td>
		<td>&nbsp;</td>
		<td>ARID/BRIGHT DNA-binding domain-containing protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g76510">At1g76510</a></td>
		<td>&nbsp;</td>
		<td>ARID/BRIGHT DNA-binding domain-containing protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g13350">At3g13350</a></td>
		<td>&nbsp;</td>
		<td>ARID/BRIGHT DNA-binding domain-containing protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g43240">At3g43240</a></td>
		<td>&nbsp;</td>
		<td>ARID/BRIGHT DNA-binding domain-containing protein</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
