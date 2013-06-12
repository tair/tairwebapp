<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "NAC Transcription Factor Family";
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
<h2>NAC Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Xie, Q.,Frugis, G.,Colgan, D.,Chua, N. H.</b> (2000) <a href="/servlets/TairObject?type=publication&amp;id=1346003">Arabidopsis NAC1 transduces auxin signal downstream of TIR1 to promote lateral root development.</a> GENES AND DEVELOPMENT <b>14</b>
</li> <li>
<b>Olsen AN, Ernst HA, Leggio LL, Skriver K</b> (2005) <a href="/servlets/TairObject?type=publication&amp;id=501719840">NAC transcription factors: structurally distinct, functionally diverse.</a> TRENDS IN PLANT SCIENCE <b>10</b>
</li> <li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li> <li>
<b>Ren, T.,Qu, F.,Morris, T. J.</b> (2000) <a href="/servlets/TairObject?type=publication&amp;id=5805">HRT Gene Function Requires Interaction between a NAC Protein and Viral Capsid Protein to Confer Resistance to Turnip Crinkle Virus.</a> THE PLANT CELL <b>12</b>
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
<tr>		<td>NAC Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g52890">At1g52890</a></td>
		<td>ANAC019</td>
		<td>NAM-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g01720">At1g01720</a></td>
		<td>ATAF1</td>
		<td>NAC domain protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g08790">At5g08790</a></td>
		<td>ATAF2</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g15500">At3g15500</a></td>
		<td>AtNAC3</td>
		<td>putative jasmonic acid regulatory protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g15170">At3g15170</a></td>
		<td>CUC1</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g53950">At5g53950</a></td>
		<td>CUC2</td>
		<td>CUC2 (dbj|BAA19529.1)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g76420">At1g76420</a></td>
		<td>CUC3</td>
		<td>Expressed at the boundary between the shoot merist</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g56010">At1g56010</a></td>
		<td>NAC1</td>
		<td>NAC1</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g04410">At5g04410</a></td>
		<td>NAC2</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g52880">At1g52880</a></td>
		<td>NAM</td>
		<td>NAM-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g69490">At1g69490</a></td>
		<td>NAP</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g10490">At3g10490</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g10500">At3g10500</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g34180">At1g34180</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g10480">At3g10480</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g04420">At3g04420</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g77450">At1g77450</a></td>
		<td>&nbsp;</td>
		<td>GRAB1-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g29035">At3g29035</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g17730">At3g17730</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g02230">At1g02230</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g04410">At3g04410</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g65910">At1g65910</a></td>
		<td>&nbsp;</td>
		<td>jasmonic acid, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g39820">At5g39820</a></td>
		<td>&nbsp;</td>
		<td>NAC domain</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g33060">At1g33060</a></td>
		<td>&nbsp;</td>
		<td>NAC domain containing protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g44350">At3g44350</a></td>
		<td>&nbsp;</td>
		<td>NAC domain -like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g01010">At1g01010</a></td>
		<td>&nbsp;</td>
		<td>NAC domain protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g49530">At3g49530</a></td>
		<td>&nbsp;</td>
		<td>NAC2-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g04400">At5g04400</a></td>
		<td>&nbsp;</td>
		<td>NAC2-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g24590">At5g24590</a></td>
		<td>&nbsp;</td>
		<td>NAC2-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g22380">At5g22380</a></td>
		<td>&nbsp;</td>
		<td>NAC-domain protein-like</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g39610">At5g39610</a></td>
		<td>&nbsp;</td>
		<td>NAM</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g10350">At4g10350</a></td>
		<td>&nbsp;</td>
		<td>NAM</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g28530">At4g28530</a></td>
		<td>&nbsp;</td>
		<td>NAM</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g35580">At4g35580</a></td>
		<td>&nbsp;</td>
		<td>NAM</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g17980">At4g17980</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem) - like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g55210">At3g55210</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem) -like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g18270">At5g18270</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem)-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g24430">At2g24430</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem)-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g07680">At5g07680</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem)-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g46770">At2g46770</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem)-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g02450">At2g02450</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem)-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g17040">At2g17040</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem)-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g27300">At2g27300</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem)-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g43000">At2g43000</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem)-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g17260">At5g17260</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem)-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g22290">At5g22290</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem)-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g79580">At1g79580</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem)-like protein OsNAC4, puta</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g02220">At1g02220</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem)-like protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g02250">At1g02250</a></td>
		<td>&nbsp;</td>
		<td>NAM (no apical meristem)-like protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g54330">At1g54330</a></td>
		<td>&nbsp;</td>
		<td>NAM protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g61110">At1g61110</a></td>
		<td>&nbsp;</td>
		<td>NAM protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g28470">At1g28470</a></td>
		<td>&nbsp;</td>
		<td>NAM protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g32870">At1g32870</a></td>
		<td>&nbsp;</td>
		<td>NAM protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g34190">At1g34190</a></td>
		<td>&nbsp;</td>
		<td>NAM(no apical meristem) protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g61430">At5g61430</a></td>
		<td>&nbsp;</td>
		<td>NAM, no apical meristem - like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g46590">At5g46590</a></td>
		<td>&nbsp;</td>
		<td>NAM-like</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g56530">At3g56530</a></td>
		<td>&nbsp;</td>
		<td>NAM-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g61910">At3g61910</a></td>
		<td>&nbsp;</td>
		<td>NAM-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g13180">At5g13180</a></td>
		<td>&nbsp;</td>
		<td>NAM-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g04060">At3g04060</a></td>
		<td>&nbsp;</td>
		<td>NAM-like protein (no apical meristem)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g03200">At3g03200</a></td>
		<td>&nbsp;</td>
		<td>NAM-like protein (no apical meristem)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g04070">At3g04070</a></td>
		<td>&nbsp;</td>
		<td>NAM-like protein (no apical meristem)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g37130">At4g37130</a></td>
		<td>&nbsp;</td>
		<td>nucleoporin-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g60280">At1g60280</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g60300">At1g60300</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g60340">At1g60340</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g60350">At1g60350</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g60380">At1g60380</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g18400">At3g18400</a></td>
		<td>&nbsp;</td>
		<td>organ separation protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g32770">At1g32770</a></td>
		<td>&nbsp;</td>
		<td>OsNAC7 protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g15510">At3g15510</a></td>
		<td>&nbsp;</td>
		<td>putative jasmonic acid regulatory protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g33480">At2g33480</a></td>
		<td>&nbsp;</td>
		<td>putative NAM (no apical meristem)-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g26870">At1g26870</a></td>
		<td>&nbsp;</td>
		<td>putative NAM protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g63790">At5g63790</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g57150">At3g57150</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g09330">At5g09330</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g64060">At5g64060</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g56570">At3g56570</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g56620">At5g56620</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g39690">At5g39690</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g39540">At5g39540</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g56560">At3g56560</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g44290">At3g44290</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g28500">At4g28500</a></td>
		<td>&nbsp;</td>
		<td>similar to NAM protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g76420">At1g76420</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g33280">At1g33280</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g32510">At1g32510</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g27410">At4g27410</a></td>
		<td>RD26</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g24590">At5g24590</a></td>
		<td>TIP</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g18060">At2g18060</a></td>
		<td>VND1</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g36160">At4g36160</a></td>
		<td>VND2</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g66300">At5g66300</a></td>
		<td>VND3</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g12260">At1g12260</a></td>
		<td>VND4</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g62380">At5g62380</a></td>
		<td>VND6</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g71930">At1g71930</a></td>
		<td>VND7</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g62700">At1g62700</a></td>
		<td>VVND5</td>
		<td>&nbsp;</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
