<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "CAMTA Transcription Factor Family";
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
<h2>CAMTA Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Bouche, N.,Scharlat, A.,Snedden, W.,Bouchez, D.,Fromm, H.</b> (2002) <a href="/servlets/TairObject?type=publication&amp;id=501681381">A novel family of calmodulin-binding transcription activators in multicellular organisms.</a> JOURNAL OF BIOLOGICAL CHEMISTRY <b>277</b>
</li> <li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li></ul></td></tr>
	<tr><th valign="top">Gene Family Criteria:</th> <td>Data was taken directly from published literature by searching Pubmed and verified by manual curation</td></tr>
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
		<td>CAMTA Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g09410">At5g09410</a></td>
		<td>AtCAMTA1</td>
		<td>CALMODULIN-BINDING TRANSCRIPTION ACTIVATOR</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g64220">At5g64220</a></td>
		<td>AtCAMTA2</td>
		<td>CALMODULIN-BINDING TRANSCRIPTION ACTIVATOR</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g22300 ">At2g22300 </a></td>
		<td>AtCAMTA3</td>
		<td>CALMODULIN-BINDING TRANSCRIPTION ACTIVATOR</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=AT1G67310">AT1G67310</a></td>
		<td>AtCAMTA4</td>
		<td>CALMODULIN-BINDING TRANSCRIPTION ACTIVATOR</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g16150">At4g16150</a></td>
		<td>AtCAMTA5</td>
		<td>CALMODULIN-BINDING TRANSCRIPTION ACTIVATOR</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g16940">At3g16940</a></td>
		<td>AtCAMTA6</td>
		<td>CALMODULIN-BINDING TRANSCRIPTION ACTIVATOR</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
