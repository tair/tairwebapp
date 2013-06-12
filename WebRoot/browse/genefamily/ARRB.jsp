<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "ARR-B Transcription Factor Family";
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
<h2>ARR-B Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Mason, Michael G, Mathews, Dennis E, Argyros, D Aaron, Maxwell, Bridey B, Kieber, Joseph J, Alonso, Jose M, Ecker, Joseph R, Schaller, G Eric</b> (2005) <a href="/servlets/TairObject?type=publication&amp;id=501717904">Multiple Type-B Response Regulators Mediate Cytokinin Signal Transduction in Arabidopsis.</a> THE PLANT CELL <b></b>
</li> <li>
<b>Imamura, A.,Kiba, T.,Tajima, Y.,Yamashino, T.,Mizuno, T.</b> (2003) <a href="/servlets/TairObject?type=publication&amp;id=501683622">In Vivo and In Vitro Characterization of the ARR11 Response Regulator Implicated in the His-to-Asp Phosphorelay Signal Transduction in Arabidopsis thaliana.</a> PLANT AND CELL PHYSIOLOGY <b>44</b>
</li> <li>
<b>Doi, K.,Izawa, T.,Fuse, T.,Yamanouchi, U.,Kubo, T.,Shimatani, Z.,Yano, M.,Yoshimura, A.</b> (2004) <a href="/servlets/TairObject?type=publication&amp;id=501712280">Ehd1, a B-type response regulator in rice, confers short-day promotion of flowering and controls FT-like gene expression independently of Hd1.</a> GENES AND DEVELOPMENT <b>18</b>
</li> <li>
<b>Sakai, H.,Aoyama, T.,Oka, A.</b> (2000) <a href="/servlets/TairObject?type=publication&amp;id=1345936">Arabidopsis ARR1 and ARR2 response regulators operate as transcriptional activators.</a> THE PLANT JOURNAL <b>24</b>
</li> <li>
<b>Rashotte, A. M.,Carson, S. D.,To, J. P.,Kieber, J. J.</b> (2003) <a href="/servlets/TairObject?type=publication&amp;id=501710151">Expression profiling of cytokinin action in Arabidopsis.</a> PLANT PHYSIOLOGY <b>132</b>
</li> <li>
<b>Kaczorowski, K. A.,Quail, P. H.</b> (2003) <a href="/servlets/TairObject?type=publication&amp;id=501711256">Arabidopsis PSEUDO-RESPONSE REGULATOR7 (PRR7) Is a Signaling Intermediate in Phytochrome-Regulated Seedling Deetiolation and Phasing of the Circadian Clock.</a> THE PLANT CELL <b></b>
</li> <li>
<b>Tajima, Y.,Imamura, A.,Kiba, T.,Amano, Y.,Yamashino, T.,Mizuno, T.</b> (2004) <a href="/servlets/TairObject?type=publication&amp;id=501712005">Comparative Studies on the Type-B Response Regulators Revealing their Distinctive Properties in the His-to-Asp Phosphorelay Signal Transduction of Arabidopsis thaliana.</a> PLANT AND CELL PHYSIOLOGY <b>45</b>
</li> <li>
<b>Hwang, I.,Chen, H. C.,Sheen, J.</b> (2002) <a href="/servlets/TairObject?type=publication&amp;id=501681565">Two-component signal transduction pathways in Arabidopsis.</a> PLANT PHYSIOLOGY <b>129</b>
</li> <li>
<b>D'Agostino, I. B.,Deruere, J.,Kieber, J. J.</b> (2000) <a href="/servlets/TairObject?type=publication&amp;id=1345976">Characterization of the response of the arabidopsis response regulator gene family to cytokinin.</a> PLANT PHYSIOLOGY <b>124</b>
</li> <li>

<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li> <li>
<b>Kiba T, Naitou T, Koizumi N, Yamashino T, Sakakibara H, Mizuno T</b> (2005) <a href="/servlets/TairObject?type=publication&amp;id=501714621">Combinatorial Microarray Analysis Revealing Arabidopsis Genes Implicated in Cytokinin Responses through the His-to-Asp Phosphorelay Circuitry.</a> PLANT AND CELL PHYSIOLOGY <b></b>
</li> <li>
<b>Mason, M. G.,Li, J.,Mathews, D. E.,Kieber, J. J.,Schaller, G. E.</b> (2004) <a href="/servlets/TairObject?type=publication&amp;id=501712722">Type-B response regulators display overlapping expression patterns in Arabidopsis.</a> PLANT PHYSIOLOGY <b>135</b>
</li> <li>
<b>Hass, C.,Lohrmann, J.,Albrecht, V.,Sweere, U.,Hummel, F.,Yoo, S. D.,Hwang, I.,Zhu, T.,Schafer, E.,Kudla, J.,Harter, K.</b> (2004) <a href="/servlets/TairObject?type=publication&amp;id=501712764">The response regulator 2 mediates ethylene signalling and hormone signal integration in Arabidopsis.</a> THE EMBO JOURNAL <b></b>
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
<tr>		<td>ARR-B Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g49240">At5g49240</a></td>
		<td>APRR4</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68210">At1g68210</a></td>
		<td>APRR6</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g00760">At4g00760</a></td>
		<td>APRR8</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g16857">At3g16857</a></td>
		<td>ARR1</td>
		<td>ARR1 protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g31920">At4g31920</a></td>
		<td>ARR10</td>
		<td>similar to putative two-component response regulat</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g67710">At1g67710</a></td>
		<td>ARR11</td>
		<td>F12A21.15</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g25180">At2g25180</a></td>
		<td>ARR12</td>
		<td>putative two-component response regulator protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g27070">At2g27070</a></td>
		<td>ARR13</td>
		<td>putative two-component response regulator protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g01760">At2g01760</a></td>
		<td>ARR14</td>
		<td>putative two-component response regulator protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g58080">At5g58080</a></td>
		<td>ARR18</td>
		<td>ARR2 - like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g49190">At1g49190</a></td>
		<td>ARR19</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g16110">At4g16110</a></td>
		<td>ARR2</td>
		<td>hypothetical protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g62670">At3g62670</a></td>
		<td>ARR20</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g07210">At5g07210</a></td>
		<td>ARR21</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g48100">At3g48100</a></td>
		<td>&nbsp;</td>
		<td>response reactor 2 (ATRR2)</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
