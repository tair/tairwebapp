<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "G2-like Transcription Factor Family";
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
<h2>G2-like Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>

<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS</a>
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
		<td>G2-like Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g20570">At2g20570</a></td>
		<td>GLK1</td>
		<td>expressed protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g44190">At5g44190</a></td>
		<td>GLK2</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g16560">At5g16560</a></td>
		<td>KAN</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g32240">At1g32240</a></td>
		<td>KAN2</td>
		<td>expressed protein, KANADI2 (KAN2)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g17695">At4g17695</a></td>
		<td>KAN3</td>
		<td>Expressed protein, KANADI3 (KAN3)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g42630">At5g42630</a></td>
		<td>KAN4</td>
		<td>putative protein, KANADI4 (KAN4)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g59570">At5g59570</a></td>
		<td>&nbsp;</td>
		<td>ARR1 protein - like</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g03500">At2g03500</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g25550">At1g25550</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g49560">At1g49560</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68670">At1g68670</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g25790">At3g25790</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g13040">At3g13040</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g13300">At1g13300</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g14600">At1g14600</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g40260">At2g40260</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g42660">At2g42660</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g06020">At2g06020</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g37180">At4g37180</a></td>
		<td>&nbsp;</td>
		<td>putative cytoskeletal protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g18020">At4g18020</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g46640">At3g46640</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g05090">At5g05090</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g29000">At5g29000</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g45580">At5g45580</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g13640">At4g13640</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g04580">At4g04580</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g06800">At5g06800</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g12730">At3g12730</a></td>
		<td>&nbsp;</td>
		<td>regulatory protein of P-starvation acclimation res</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g04450">At3g04450</a></td>
		<td>&nbsp;</td>
		<td>transfactor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g24120">At3g24120</a></td>
		<td>&nbsp;</td>
		<td>transfactor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g69580">At1g69580</a></td>
		<td>&nbsp;</td>
		<td>transfactor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g79430">At1g79430</a></td>
		<td>&nbsp;</td>
		<td>transfactor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g04030">At3g04030</a></td>
		<td>&nbsp;</td>
		<td>transfactor-like</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g18240">At5g18240</a></td>
		<td>&nbsp;</td>
		<td>transfactor-like protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g01060">At2g01060</a></td>
		<td>&nbsp;</td>
		<td>transfactor-like protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g10760">At3g10760</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g40970">At2g40970</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g02060">At2g02060</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g20400">At2g20400</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g28610">At4g28610</a></td>
		<td>PHR1</td>
		<td>&nbsp;</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
