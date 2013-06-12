<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "C2C2-Gata Transcription Factor Family";
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
<h2>C2C2-Gata Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li> <li>
<b>Teakle, G. R.,Manfield, I. W.,Graham, J. F.,Gilmartin, P. M.</b> (2002) <a href="/servlets/TairObject?type=publication&amp;id=501682012">Arabidopsis thaliana GATA factors: organisation, expression and DNA-binding characteristics.</a> PLANT MOLECULAR BIOLOGY <b>50</b>
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
		<td>C2C2-Gata Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g24050">At3g24050</a></td>
		<td>GATA-1</td>
		<td>GATA transcription factor 1 (AtGATA-1)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g08000">At1g08000</a></td>
		<td>GATA-10</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g08010">At1g08010</a></td>
		<td>GATA-11</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g25830">At5g25830</a></td>
		<td>GATA-12</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g28340">At2g28340</a></td>
		<td>GATA-13</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g45170">At3g45170</a></td>
		<td>GATA-14</td>
		<td>GATA zinc finger protein, contains GATA-type zinc</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g06740">At3g06740</a></td>
		<td>GATA-15</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g49300">At5g49300</a></td>
		<td>GATA-16</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g16870">At3g16870</a></td>
		<td>GATA-17</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g50870">At3g50870</a></td>
		<td>GATA-18</td>
		<td>GATA zinc finger protein, HANABA TARANU</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g36620">At4g36620</a></td>
		<td>GATA-19</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g45050">At2g45050</a></td>
		<td>GATA-2</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g18380">At2g18380</a></td>
		<td>GATA-20</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g56860">At5g56860</a></td>
		<td>GATA-21</td>
		<td>GATA zinc finger protein, similar to unknown prote</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g26150">At4g26150</a></td>
		<td>GATA-22</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g26930">At5g26930</a></td>
		<td>GATA-23</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g21175">At3g21175</a></td>
		<td>GATA-24</td>
		<td>GATA zinc finger protein, ZIM-LIKE1(ZML1)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g34680">At4g34680</a></td>
		<td>GATA-3</td>
		<td>GATA transcription factor 3</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g60530">At3g60530</a></td>
		<td>GATA-4</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g66320">At5g66320</a></td>
		<td>GATA-5</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g51080">At3g51080</a></td>
		<td>GATA-6</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g36240">At4g36240</a></td>
		<td>GATA-7</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g54810">At3g54810</a></td>
		<td>GATA-8</td>
		<td>GATA zinc finger protein, GATA transcription facto</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g32890">At4g32890</a></td>
		<td>GATA-9</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g20750">At3g20750</a></td>
		<td>&nbsp;</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g17570">At4g17570</a></td>
		<td>&nbsp;</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g47140">At5g47140</a></td>
		<td>&nbsp;</td>
		<td>GATA zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g16141">At4g16141</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g24470">At4g24470</a></td>
		<td>ZIM</td>
		<td>mRNA for ZIM, complete cds</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g51600">At1g51600</a></td>
		<td>ZML2</td>
		<td>&nbsp;</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
