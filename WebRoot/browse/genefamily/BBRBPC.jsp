<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "BBR/BPC Transcription Factor Family";
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
<h2>BBR/BPC Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>

<b>Santi, Luca,Wang, Yamei,Stile, Maria Rosaria,Berendzen, Kenneth,Wanke, Dierk,Roig, Cristina,Pozzi, Carlo,Mueller, Kai,Mueller, Judith,Rohde, Wolfgang,Salamini, Francesco</b> (2003) <a href="/servlets/TairObject?type=publication&amp;id=501707003">The GA octodinucleotide repeat binding factor BBR participates in the transcriptional regulation of the homeobox gene Bkn3.</a> THE PLANT JOURNAL <b>34</b>
</li> <li>
<b>Kooiker M, Airoldi CA, Losa A, Manzotti PS, Finzi L, Kater MM, Colombo L</b> (2005) <a href="/servlets/TairObject?type=publication&amp;id=501714708">BASIC PENTACYSTEINE1, a GA Binding Protein That Induces Conformational Changes in the Regulatory Region of the Homeotic Arabidopsis Gene SEEDSTICK.</a> THE PLANT CELL <b></b>
</li> <li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li> <li>
<b>Meister, R. J.,Williams, L. A.,Monfared, M. M.,Gallagher, T. L.,Kraft, E. A.,Nelson, C. G.,Gasser, C. S.</b> (2004) <a href="/servlets/TairObject?type=publication&amp;id=501711763">Definition and interactions of a positive regulatory element of the Arabidopsis INNER NO OUTER promoter.</a> THE PLANT JOURNAL <b>37</b>

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
		<td>BBR/BPC Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g01930">At2g01930</a></td>
		<td>BBR/BPC1</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g14685">At1g14685</a></td>
		<td>BBR/BPC2</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68120">At1g68120</a></td>
		<td>BBR/BPC3</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g21240">At2g21240</a></td>
		<td>BBR/BPC4</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g38910">At4g38910</a></td>
		<td>BBR/BPC5</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g42520">At5g42520</a></td>
		<td>BBR/BPC6</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g35550">At2g35550</a></td>
		<td>BBR/BPC7</td>
		<td>&nbsp;</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
