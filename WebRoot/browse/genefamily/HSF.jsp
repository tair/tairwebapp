<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "HSF Transcription Factor Family";
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
<h2>HSF Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Hubel, A.,Lee, J. H.,Wu, C.,Schoffl, F.</b> (1995) <a href="/servlets/TairObject?type=publication&amp;id=4338">Arabidopsis heat shock factor is constitutively active in Drosophila and human cells.</a> MOLECULAR AND GENERAL GENETICS <b>248</b>
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
<tr>		<td>HSF Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g17750">At4g17750</a></td>
		<td>HSFA1A</td>
		<td>heat shock transcription factor HSF1</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g16820">At5g16820</a></td>
		<td>HSFA1B</td>
		<td>Heat Shock Factor 3</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g32330">At1g32330</a></td>
		<td>HSFA1D</td>
		<td>heat shock transcription factor HSF8, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g02990">At3g02990</a></td>
		<td>HSFA1E</td>
		<td>putative heat shock transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g26150">At2g26150</a></td>
		<td>HSFA2</td>
		<td>putative heat shock transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g03720">At5g03720</a></td>
		<td>HSFA3</td>
		<td>heat shock transcription factor -like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g18880">At4g18880</a></td>
		<td>HSFA4A</td>
		<td>heat shock transcription factor - like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g45710">At5g45710</a></td>
		<td>HSFA4C</td>
		<td>heat shock transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g13980">At4g13980</a></td>
		<td>HSFA5</td>
		<td>Expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g43840">At5g43840</a></td>
		<td>HSFA6A</td>
		<td>heat shock transcription factor-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g22830">At3g22830</a></td>
		<td>HSFA6B</td>
		<td>putative heat shock protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g51910">At3g51910</a></td>
		<td>HSFA7A</td>
		<td>putative heat shock transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g63350">At3g63350</a></td>
		<td>HSFA7B</td>
		<td>heat shock transcription factor-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g67970">At1g67970</a></td>
		<td>HSFA8</td>
		<td>heat shock transcription factor-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g54070">At5g54070</a></td>
		<td>HSFA9</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g36990">At4g36990</a></td>
		<td>HSFB1</td>
		<td>heat shock transcription factor HSF4</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g62020">At5g62020</a></td>
		<td>HSFB2A</td>
		<td>heat shock factor 6</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g11660">At4g11660</a></td>
		<td>HSFB2B</td>
		<td>heat shock transcription factor - like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g41690">At2g41690</a></td>
		<td>HSFB3</td>
		<td>putative heat shock transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g46264">At1g46264</a></td>
		<td>HSFB4</td>
		<td>putative heat shock transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g24520">At3g24520</a></td>
		<td>HSFC1</td>
		<td>heat shock transcription factor HSF1, putative</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
