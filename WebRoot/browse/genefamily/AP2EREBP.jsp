<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "AP2-EREBP Transcription Factor Family";
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
<h2>AP2-EREBP Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li> <li>
<b></b> () <a href="/servlets/TairObject?type=publication&amp;id="></a>  <b></b>
</li> <li>
<b>Riechmann, J. L.,Meyerowitz, E. M.</b> (1998) <a href="/servlets/TairObject?type=publication&amp;id=2298">The AP2/EREBP family of plant transcription factors.</a> BIOLOGICAL CHEMISTRY <b>379</b>
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
		<td>AP2-EREBP Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g40220">At2g40220</a></td>
		<td>ABI4</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g72570">At1g72570</a></td>
		<td>AIL1</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g17430">At5g17430</a></td>
		<td>AIL2</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g57390">At5g57390</a></td>
		<td>AIL5</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g10510">At5g10510</a></td>
		<td>AIL6</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g65510">At5g65510</a></td>
		<td>AIL7</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g37750">At4g37750</a></td>
		<td>ANT</td>
		<td>ovule development protein aintegumenta (ANT)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g36920">At4g36920</a></td>
		<td>AP2</td>
		<td>Involved in meristem,  petal identity & seed dev.</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g17500">At4g17500</a></td>
		<td>AtERF1</td>
		<td>ethylene responsive element binding factor 1 (fram</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g44840">At2g44840</a></td>
		<td>AtERF13</td>
		<td>putative ethylene response element binding protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g04370">At1g04370</a></td>
		<td>AtERF14</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g31230">At2g31230</a></td>
		<td>AtERF15</td>
		<td>ethylene response factor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g47220">At5g47220</a></td>
		<td>AtERF2</td>
		<td>ethylene responsive element binding factor 2 (EREB</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g15210">At3g15210</a></td>
		<td>AtERF4</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g47230">At5g47230</a></td>
		<td>AtERF5</td>
		<td>ethylene responsive element binding factor 5 (AtER</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g17490">At4g17490</a></td>
		<td>AtERF6</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g53170">At1g53170</a></td>
		<td>AtERF8</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g25490">At4g25490</a></td>
		<td>CBF1</td>
		<td>C-repeat</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g25470">At4g25470</a></td>
		<td>CBF2</td>
		<td>DRE binding protein (DREB1C)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g25480">At4g25480</a></td>
		<td>CBF3</td>
		<td>DRE binding protein (DREB1A)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g05410">At5g05410</a></td>
		<td>DREB2A</td>
		<td>ethylene responsive element binding factor 4 (AtER</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g11020">At3g11020</a></td>
		<td>DREB2B</td>
		<td>ethylene responsive element binding factor 9</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g16770">At3g16770</a></td>
		<td>EBP</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g23240">At3g23240</a></td>
		<td>ERF1</td>
		<td>ethylene response factor 1 (ERF1)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g36900">At4g36900</a></td>
		<td>HAP12</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g13910">At5g13910</a></td>
		<td>LET</td>
		<td>AP2</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g74930">At1g74930</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain containing protein, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g18560">At5g18560</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain -like protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g72360">At1g72360</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain protein RAP2.2</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g50080">At5g50080</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain protein RAP2.3</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g16750">At4g16750</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain TINY-related protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g20880">At2g20880</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g40340">At2g40340</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g40350">At2g40350</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g13620">At4g13620</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor (RAP2), putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g36060">At1g36060</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor RAP2, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g47520">At2g47520</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor RAP2, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g22200">At2g22200</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor RAP2, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g33710">At2g33710</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor RAP2, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g57600">At3g57600</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor RAP2, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g64750">At5g64750</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68550">At1g68550</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g25890">At3g25890</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g49120">At1g49120</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g25470">At1g25470</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g67000">At5g67000</a></td>
		<td>&nbsp;</td>
		<td>AP2 domain transcription factor-like</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g77640">At1g77640</a></td>
		<td>&nbsp;</td>
		<td>AP2 transcription factor - like protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g44830">At1g44830</a></td>
		<td>&nbsp;</td>
		<td>AP2-containing DNA-binding protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g75490">At1g75490</a></td>
		<td>&nbsp;</td>
		<td>AP2-domain DNA-binding protein -like</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g31060">At4g31060</a></td>
		<td>&nbsp;</td>
		<td>AP2-domain transcription factor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g11140">At4g11140</a></td>
		<td>&nbsp;</td>
		<td>DNA binding protein - like</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g51990">At5g51990</a></td>
		<td>&nbsp;</td>
		<td>DRE binding protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g12630">At1g12630</a></td>
		<td>&nbsp;</td>
		<td>DRE binding protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g36450">At2g36450</a></td>
		<td>&nbsp;</td>
		<td>DRE binding protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g39780">At4g39780</a></td>
		<td>&nbsp;</td>
		<td>DRE binding protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g21910">At1g21910</a></td>
		<td>&nbsp;</td>
		<td>DRE binding protein (DREB2A)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g18450">At5g18450</a></td>
		<td>&nbsp;</td>
		<td>DRE binding protein (DREB2B)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g38340">At2g38340</a></td>
		<td>&nbsp;</td>
		<td>DREB-like AP2 domain transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g06160">At1g06160</a></td>
		<td>&nbsp;</td>
		<td>ethylene response factor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g18450">At4g18450</a></td>
		<td>&nbsp;</td>
		<td>ethylene response factor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g61590">At5g61590</a></td>
		<td>&nbsp;</td>
		<td>ethylene responsive element binding factor - like</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g03800">At1g03800</a></td>
		<td>&nbsp;</td>
		<td>ethylene responsive element binding factor 10</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g50640">At1g50640</a></td>
		<td>&nbsp;</td>
		<td>ethylene responsive element binding factor 3 (AtER</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g20310">At3g20310</a></td>
		<td>&nbsp;</td>
		<td>ethylene responsive element binding factor 7</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g61600">At5g61600</a></td>
		<td>&nbsp;</td>
		<td>ethylene responsive element binding factor 8</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g23230">At3g23230</a></td>
		<td>&nbsp;</td>
		<td>ethylene responsive element binding protein, putat</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g23220">At3g23220</a></td>
		<td>&nbsp;</td>
		<td>ethylene responsive element binding protein, putat</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g25190">At5g25190</a></td>
		<td>&nbsp;</td>
		<td>ethylene-responsive element - like protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g28370">At1g28370</a></td>
		<td>&nbsp;</td>
		<td>ethylene-responsive element binding factor 11(AtER</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g28360">At1g28360</a></td>
		<td>&nbsp;</td>
		<td>ethylene-responsive element binding factor 12(AtER</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g22985">At1g22985</a></td>
		<td>&nbsp;</td>
		<td>Expressed protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g71130">At1g71130</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g61890">At5g61890</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g71520">At1g71520</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g12980">At1g12980</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g24590">At1g24590</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g28160">At1g28160</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g12890">At1g12890</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g41710">At2g41710</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g16060">At1g16060</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g79700">At1g79700</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g41710">At2g41710</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g65510">At5g65510</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g43410">At5g43410</a></td>
		<td>&nbsp;</td>
		<td>Nicotiana EREBP-3 like</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g44210">At5g44210</a></td>
		<td>&nbsp;</td>
		<td>putative Ap2 domain protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g23750">At4g23750</a></td>
		<td>&nbsp;</td>
		<td>putative Ap2 domain protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g35700">At2g35700</a></td>
		<td>&nbsp;</td>
		<td>putative AP2 domain transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g44940">At2g44940</a></td>
		<td>&nbsp;</td>
		<td>putative AP2 domain transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g63040">At1g63040</a></td>
		<td>&nbsp;</td>
		<td>putative AP2 domain transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g23340">At2g23340</a></td>
		<td>&nbsp;</td>
		<td>putative AP2 domain transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g46768">At1g46768</a></td>
		<td>&nbsp;</td>
		<td>putative AP2 domain transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g19210">At1g19210</a></td>
		<td>&nbsp;</td>
		<td>putative AP2 domain transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g46310">At2g46310</a></td>
		<td>&nbsp;</td>
		<td>putative AP2 domain transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g20350">At2g20350</a></td>
		<td>&nbsp;</td>
		<td>putative AP2 domain transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g28140">At4g28140</a></td>
		<td>&nbsp;</td>
		<td>putative DNA-binding protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g07310">At5g07310</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g78080">At1g78080</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g51190">At5g51190</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g27950">At4g27950</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g53290">At5g53290</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g53910">At1g53910</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g61630">At3g61630</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g67190">At5g67190</a></td>
		<td>&nbsp;</td>
		<td>putative transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g25820">At2g25820</a></td>
		<td>&nbsp;</td>
		<td>TINY-like AP2 domain transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g65130">At5g65130</a></td>
		<td>&nbsp;</td>
		<td>TINY-like protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g64380">At1g64380</a></td>
		<td>&nbsp;</td>
		<td>TINY-like protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g22810">At1g22810</a></td>
		<td>&nbsp;</td>
		<td>TINY-like transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g60490">At3g60490</a></td>
		<td>&nbsp;</td>
		<td>transcription factor - like protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g63030">At1g63030</a></td>
		<td>&nbsp;</td>
		<td>transcription factor DREB1A, putative, dwarf and delayed-flowering2</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g16280">At3g16280</a></td>
		<td>&nbsp;</td>
		<td>transcription factor TINY, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g11590">At5g11590</a></td>
		<td>&nbsp;</td>
		<td>transcription factor TINY, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g33760">At1g33760</a></td>
		<td>&nbsp;</td>
		<td>transcription factor TINY, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g32800">At4g32800</a></td>
		<td>&nbsp;</td>
		<td>transcription factor TINY, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g77200">At1g77200</a></td>
		<td>&nbsp;</td>
		<td>transcription factor TINY, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g71450">At1g71450</a></td>
		<td>&nbsp;</td>
		<td>transcription factor TINY, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g01250">At1g01250</a></td>
		<td>&nbsp;</td>
		<td>transcription factor TINY, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g13330">At5g13330</a></td>
		<td>&nbsp;</td>
		<td>transcription factor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g07580">At5g07580</a></td>
		<td>&nbsp;</td>
		<td>transcription factor-like protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g12610">At1g12610</a></td>
		<td>&nbsp;</td>
		<td>transcriptional activator CBF1, putative, dwarf and delayed-flowering1</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g80580">At1g80580</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g20840">At3g20840</a></td>
		<td>PLT1</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g51190">At1g51190</a></td>
		<td>PTL2</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g50260">At3g50260</a></td>
		<td>Rap2.1</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g52020">At5g52020</a></td>
		<td>Rap2.10</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g19790">At5g19790</a></td>
		<td>RAP2.11</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g34410">At4g34410</a></td>
		<td>Rap2.12</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g14230">At3g14230</a></td>
		<td>Rap2.2</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g22190">At1g22190</a></td>
		<td>Rap2.4</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g43160">At1g43160</a></td>
		<td>Rap2.6</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g25390">At5g25390</a></td>
		<td>SHINE2</td>
		<td>AP2 domain containing protein, SHINE2</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g11190">At5g11190</a></td>
		<td>SHINE3</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g54990">At3g54990</a></td>
		<td>SMZ</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g39250">At2g39250</a></td>
		<td>SNZ</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g25810">At5g25810</a></td>
		<td>TINY</td>
		<td>transcription factor TINY</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g28550">At2g28550</a></td>
		<td>TOE1</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g60120">At5g60120</a></td>
		<td>TOE2</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g15360">At1g15360</a></td>
		<td>WIN1</td>
		<td>putative ethylene responsive element, WIN1, SHINE1</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g54320">At3g54320</a></td>
		<td>WRI1</td>
		<td>&nbsp;</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
