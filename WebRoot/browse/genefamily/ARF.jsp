<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "ARF Transcription Factor Family";
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
<h2>ARF Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Guilfoyle, T. J.,Ulmasov, T.,Hagen, G.</b> (1998) <a href="/servlets/TairObject?type=publication&amp;id=2245">The ARF family of transcription factors and their role in plant hormone-responsive transcription.</a> CELLULAR AND MOLECULAR LIFE SCIENCES <b>54</b>
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
<tr>		<td>ARF Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g59750">At1g59750</a></td>
		<td>ARF1</td>
		<td>auxin response transcription factor (ARF1)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g28350">At2g28350</a></td>
		<td>ARF10</td>
		<td>auxin respone transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g46530">At2g46530</a></td>
		<td>ARF11</td>
		<td>putative ARF1 family auxin responsive transcriptio</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g34310">At1g34310</a></td>
		<td>ARF12</td>
		<td>auxin response factor 1, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g34170">At1g34170</a></td>
		<td>ARF13</td>
		<td>auxin response factor 1, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g35540">At1g35540</a></td>
		<td>ARF14</td>
		<td>auxin response factor, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g35520">At1g35520</a></td>
		<td>ARF15</td>
		<td>auxin response factor, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g30080">At4g30080</a></td>
		<td>ARF16</td>
		<td>transcription factor-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g77850">At1g77850</a></td>
		<td>ARF17</td>
		<td>auxin response factor, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g61830">At3g61830</a></td>
		<td>ARF18</td>
		<td>auxin response factor-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g19220">At1g19220</a></td>
		<td>ARF19</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g62010">At5g62010</a></td>
		<td>ARF2</td>
		<td>auxin response transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g35240">At1g35240</a></td>
		<td>ARF20</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g34410">At1g34410</a></td>
		<td>ARF21</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g34390">At1g34390</a></td>
		<td>ARF22</td>
		<td>auxin response factor, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g43950">At1g43950</a></td>
		<td>ARF23</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g33860">At2g33860</a></td>
		<td>ARF3</td>
		<td>auxin response transcription factor 3 (ETTIN</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g60450">At5g60450</a></td>
		<td>ARF4</td>
		<td>auxin response transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g19850">At1g19850</a></td>
		<td>ARF5</td>
		<td>auxin response transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g30330">At1g30330</a></td>
		<td>ARF6</td>
		<td>auxin response transcription factor(ARF6)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g20730">At5g20730</a></td>
		<td>ARF7</td>
		<td>auxin response transcription factor (ARF7)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g37020">At5g37020</a></td>
		<td>ARF8</td>
		<td>auxin response transcription factor(ARF8)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g23980">At4g23980</a></td>
		<td>ARF9</td>
		<td>auxin response transcription factor (ARF9)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g62000">At5g62000</a></td>
		<td>&nbsp;</td>
		<td>auxin response factor - like protein</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
