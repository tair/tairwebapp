<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "VOZ-9 Transcription Factor Family";
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
<h2>VOZ-9 Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Mitsuda, N.,Hisabori, T.,Takeyasu, K.,Sato, M. H.</b> (2004) <a href="/servlets/TairObject?type=publication&amp;id=501713094">VOZ; isolation and characterization of novel vascular plant transcription factors with a one-zinc finger from Arabidopsis thaliana.</a> PLANT AND CELL PHYSIOLOGY <b>45</b>
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
<tr>		<td>VOZ-9 Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g28520">At1g28520</a></td>
		<td>VOZ1</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g42400">At2g42400</a></td>
		<td>VOZ2</td>
		<td>&nbsp;</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
