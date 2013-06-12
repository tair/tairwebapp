<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "C3H Transcription Factor Family";
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
<h2>C3H Transcription Factor Family</h2>
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
<tr>		<td>C3H Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g21960">At1g21960</a></td>
		<td>&nbsp;</td>
		<td>ABI3-interacting protein 2</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g63730">At5g63730</a></td>
		<td>&nbsp;</td>
		<td>ARI-like RING zinc finger protein-like</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g63750">At5g63750</a></td>
		<td>&nbsp;</td>
		<td>ARI-like RING zinc finger protein-like</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g03550">At3g03550</a></td>
		<td>&nbsp;</td>
		<td>C3HC4-type RING zinc finger protein-like</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g06490">At5g06490</a></td>
		<td>&nbsp;</td>
		<td>C3HC4-type RING zinc finger protein-like</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g06490">At5g06490</a></td>
		<td>&nbsp;</td>
		<td>C3HC4-type RING zinc finger protein-like</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g02290">At3g02290</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g11020">At1g11020</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g41350">At5g41350</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g50440">At1g50440</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g37580">At2g37580</a></td>
		<td>&nbsp;</td>
		<td>Expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g08750">At5g08750</a></td>
		<td>&nbsp;</td>
		<td>Expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g16090">At3g16090</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g22510">At1g22510</a></td>
		<td>&nbsp;</td>
		<td>Expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g38895">At5g38895</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g04360">At1g04360</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g58720">At3g58720</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g19310">At1g19310</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g72175">At1g72175</a></td>
		<td>&nbsp;</td>
		<td>Expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g19910">At3g19910</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g26800">At1g26800</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g33940">At4g33940</a></td>
		<td>&nbsp;</td>
		<td>Expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g00335">At4g00335</a></td>
		<td>&nbsp;</td>
		<td>Expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g48655">At5g48655</a></td>
		<td>&nbsp;</td>
		<td>Expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g04790">At1g04790</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g69330">At1g69330</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g51930">At1g51930</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g22120">At2g22120</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g27470">At4g27470</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g02340">At3g02340</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g07040">At5g07040</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g18470">At1g18470</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g33565">At4g33565</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g67120">At5g67120</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g77830">At1g77830</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g22250">At4g22250</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g14970">At3g14970</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g18760">At1g18760</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g44330">At2g44330</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g28920">At2g28920</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g57730">At1g57730</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68200">At1g68200</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g31770">At2g31770</a></td>
		<td>&nbsp;</td>
		<td>putative ARI-like RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g31760">At2g31760</a></td>
		<td>&nbsp;</td>
		<td>putative ARI-like RING zinc finger proteinno</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g30580">At2g30580</a></td>
		<td>&nbsp;</td>
		<td>putative C3HC4 zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g55970">At5g55970</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g15820">At5g15820</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g63780">At5g63780</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g58030">At3g58030</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g26580">At4g26580</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g10150">At4g10150</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g10160">At4g10160</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g63530">At3g63530</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g42200">At5g42200</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g54990">At5g54990</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g08139">At5g08139</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g01960">At5g01960</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g04240">At2g04240</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g15740">At3g15740</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g19430">At5g19430</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g45290">At5g45290</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g12310">At5g12310</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g18110">At4g18110</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g23450">At4g23450</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g03000">At2g03000</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g38140">At4g38140</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g28270">At4g28270</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g10380">At5g10380</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g38190">At2g38190</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g20885">At5g20885</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g47610">At5g47610</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g05810">At5g05810</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g05830">At5g05830</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g28890">At4g28890</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g53910">At5g53910</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g30370">At4g30370</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g15790">At5g15790</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g05530">At5g05530</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g01980">At5g01980</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g55530">At3g55530</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g41450">At5g41450</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g41440">At5g41440</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g37150">At2g37150</a></td>
		<td>&nbsp;</td>
		<td>putative protein with C-terminal RING finger</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g12190">At4g12190</a></td>
		<td>&nbsp;</td>
		<td>putative protein, fragment</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g63900">At1g63900</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g44580">At2g44580</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g74370">At1g74370</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g74410">At1g74410</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g74990">At1g74990</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g59000">At5g59000</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g20910">At5g20910</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g65040">At1g65040</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g23780">At2g23780</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g27940">At2g27940</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g42030">At2g42030</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g18670">At2g18670</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g10810">At3g10810</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g74620">At1g74620</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g22670">At1g22670</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g63840">At1g63840</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68070">At1g68070</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g73760">At1g73760</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g76410">At1g76410</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g80400">At1g80400</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g15530">At2g15530</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g17450">At2g17450</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g18650">At2g18650</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g19610">At2g19610</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g20030">At2g20030</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g31510">At2g31510</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g34990">At2g34990</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g35000">At2g35000</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g35910">At2g35910</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g39100">At2g39100</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g41980">At2g41980</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g42350">At2g42350</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g42360">At2g42360</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g06140">At3g06140</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g07200">At3g07200</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g09770">At3g09770</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g10910">At3g10910</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g16720">At3g16720</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g01270">At4g01270</a></td>
		<td>&nbsp;</td>
		<td>putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g15100">At1g15100</a></td>
		<td>&nbsp;</td>
		<td>putative RING-H2 zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g15580">At2g15580</a></td>
		<td>&nbsp;</td>
		<td>putative RING-H2 zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g14320">At3g14320</a></td>
		<td>&nbsp;</td>
		<td>putative zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g11110">At3g11110</a></td>
		<td>&nbsp;</td>
		<td>putative zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g25030">At3g25030</a></td>
		<td>&nbsp;</td>
		<td>RING finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g07120">At3g07120</a></td>
		<td>&nbsp;</td>
		<td>RING finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g13100">At4g13100</a></td>
		<td>&nbsp;</td>
		<td>RING finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g60820">At5g60820</a></td>
		<td>&nbsp;</td>
		<td>ring finger protein - like</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g43430">At3g43430</a></td>
		<td>&nbsp;</td>
		<td>RING finger-like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g62370">At1g62370</a></td>
		<td>&nbsp;</td>
		<td>RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g30460">At3g30460</a></td>
		<td>&nbsp;</td>
		<td>RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g26730">At3g26730</a></td>
		<td>&nbsp;</td>
		<td>RING zinc finger protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g28040">At1g28040</a></td>
		<td>&nbsp;</td>
		<td>RING zinc finger protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g47990">At3g47990</a></td>
		<td>&nbsp;</td>
		<td>RING zinc finger protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g60080">At3g60080</a></td>
		<td>&nbsp;</td>
		<td>RING zinc-finger protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g49850">At1g49850</a></td>
		<td>&nbsp;</td>
		<td>RING-H2 finger protein RHY1a</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g72220">At1g72220</a></td>
		<td>&nbsp;</td>
		<td>RING-H2 zinc finger protein ATL3, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g53820">At1g53820</a></td>
		<td>&nbsp;</td>
		<td>RING-H2 zinc finger protein ATL3, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g17600">At5g17600</a></td>
		<td>&nbsp;</td>
		<td>RING-H2 zinc finger protein-like</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g08730">At5g08730</a></td>
		<td>&nbsp;</td>
		<td>similar to ARI-like RING zinc finger protein-like</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g20823">At1g20823</a></td>
		<td>&nbsp;</td>
		<td>similar to putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g45228">At1g45228</a></td>
		<td>&nbsp;</td>
		<td>similar to putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g01245">At4g01245</a></td>
		<td>&nbsp;</td>
		<td>similar to putative RING zinc finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g00305">At4g00305</a></td>
		<td>&nbsp;</td>
		<td>similar to RING finger protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g25410">At2g25410</a></td>
		<td>&nbsp;</td>
		<td>similar to RING zinc finger protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g46495">At2g46495</a></td>
		<td>&nbsp;</td>
		<td>similar to RING zinc finger protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g70910">At1g70910</a></td>
		<td>&nbsp;</td>
		<td>similar to RING-H2 zinc finger protein ATL3, putat</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68180">At1g68180</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g14200">At1g14200</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g18930">At3g18930</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g23060">At3g23060</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g66070">At5g66070</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g37950">At2g37950</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g02750">At5g02750</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g73950">At1g73950</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g33480">At1g33480</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g05910">At5g05910</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g41430">At5g41430</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g35420">At2g35420</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g04990">At1g04990</a></td>
		<td>&nbsp;</td>
		<td>zinc finger protein 2, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g53010">At1g53010</a></td>
		<td>&nbsp;</td>
		<td>zinc finger protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g01735">At2g01735</a></td>
		<td>RIE</td>
		<td>RING H2 zinc finger protein</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
