<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TCP Transcription Factor Family";
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
<h2>TCP Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Cubas, P.,Lauter, N.,Doebley, J.,Coen, E.</b> (1999) <a href="/servlets/TairObject?type=publication&amp;id=1446">The TCP domain: a motif found in proteins regulating plant growth and development.</a> THE PLANT JOURNAL <b>18</b>
</li>
<li><b>Cubas, P. </b>(2002)  <a href="/servlets/TairObject?type=publication&id=501722412">Role of TCP genes in the evolution of key morphological characters in angiosperms. </a> 	DEVELOPMENTAL GENETICS AND PLANT EVOLUTION </li>
<li><b>Palatnik JF, Allen E, Wu X, Schommer C, Schwab R, Carrington JC, Weigel D.</b> (2003) <a href="/servlets/TairObject?type=publication&id=501711833">Control of leaf morphogenesis by microRNAs.</a> Nature <b>425</b> </li>
<li><b>Koyama, Tomotsugu, Furutani, Masahiko, Tasaka, Masao, Ohme-Takagi, Masaru </b> (2007) <a href="/servlets/TairObject?type=publication&id=501720948">TCP Transcription Factors Control the Morphology of Shoot Lateral Organs via Negative Regulation of the Expression of Boundary-Specific Genes in Arabidopsis.</a> THE PLANT CELL </li>

<li><b>Aguilar JA, Poza C and Cubas P.</b> (2007) <a href="/servlets/TairObject?type=publication&id=501720953">Arabidopsis BRANCHED1 acts as an integrator of 
branching signals within axillary buds.</a> Plant Cell <b>19: 458-472</b> </li>
    

<li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li></ul></td></tr>
	
	<tr><th valign="top">Contact:</th> <td><a href="/entity/person_detail/6339">Pilar Cubas</a></td></tr>
</table>

<table align="center" border="1" cellspacing="0" cellpadding="2">
	<tr>
		<th><b>Gene Sub Family</b></th>
		<th><b>Locus ID</b></th>
		<th><b>Gene/Protein Name</b></th>
		<th><b>Refseq ID</b></th>
        <th><b>Genbank Protein Accession</b></th>
	</tr>
<tr>		<td>Class I subfamily</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g41030">At5g41030</a></td>
		<td>TCP6</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/145336854?report=genbank">NM_104592</a></td>
        <td><a target="display" href="http://www.ncbi.nlm.nih.gov/protein/15237545?report=genpept">NP_198919</a></td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g23280
">At5g23280
</a></td>
		<td>TCP7</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/30688894?report=genbank">NM_122234</a></td>
        <td>NP_197719</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g58100
">At1g58100
</a></td>
		<td>TCP8</td>
        <td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/145336854?report=genbank">NM_104592</a></td>
        <td>AAP37852</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g45680">At2g45680</a></td>
		<td>TCP9</td>
		<td><a target="display" href="">NM_130131</a></td>
        <td>AAC06168</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g37000">At2g37000</a></td>
		<td>TCP11</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/145361032?report=genbank">NM_129256</a></td>
        <td><a target="display" href="">AAS00344</a></td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g47620">At3g47620</a></td>
		<td>TCP14</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/30692900?report=genbank">NM_114630</a></td>
        <td>NP_190346</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g69690">At1g69690</a></td>
		<td>TCP15</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/42563080?report=genbank">NM_105637</a></td>
        <td>NP_564973</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g45150">At3g45150</a></td>
		<td>TCP16</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/18407923?report=genbank">NM_114384</a></td>
        <td>NP_190101</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g51910">At5g51910</a></td>
		<td>TCP19</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/145359135?report=genbank">NM_124570</a></td>
        <td><a target="display" href="http://www.ncbi.nlm.nih.gov/protein/31711724?report=genpept">AAP68218</a></td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g27010">At3g27010</a></td>
		<td>TCP20</td>
        <td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/30688598">NM_113615.2</a></td>
        <td>NP_189337</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g08330">At5g08330</a></td>
		<td>TCP21</td>
        <td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/30682338?report=genbank">NM_120916</a></td>
        <td><a target="display" href="http://www.ncbi.nlm.nih.gov/protein/15241596?report=genpept">NP_196450</a></td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g72010">At1g72010</a></td>
		<td>TCP22</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/42563156?report=genbank">NM_105859</a></td>
        <td><a target="display" href="http://www.ncbi.nlm.nih.gov/protein/15218305?report=genpept">NP_177346</a></td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g35560">At1g35560</a></td>
		<td>TCP23</td>
		<td>&nbsp;</td>
        <td>NP_174789</td>
	</tr>
<tr>		<td>Class II subfamily</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g67260">At1g67260</a></td>
		<td>TCP1</td>
		<td>&nbsp;</td>
        <td>NP_001077781</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g18390">At4g18390</a></td>
		<td>TCP2</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/42566927?report=genbank">NM_117950</a></td>
        <td><a target="display" href="http://www.ncbi.nlm.nih.gov/protein/7268632?report=genpept">CAB78841</a></td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g53230">At1g53230</a></td>
		<td>TCP3</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/42562725?report=genbank">NM_104201</a></td>
        <td>NP_564624</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g15030">At3g15030</a></td>
		<td>TCP4</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/42564178?report=genbank">NM_112365</a></td>
        <td>NP_850589</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g60970">At5g60970</a></td>
		<td>TCP5</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/145359508?report=genbank">NM_125490</a></td>
        <td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68800">At1g68800</a></td>
		<td>TCP12</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/116743827?report=genbank">AM408561</a></td>
        <td>CAL64011</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g02150">At3g02150</a></td>
		<td>TCP13</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/6681576?report=genbank">AB014465</a></td>
        <td><a target="display" href="http://www.ncbi.nlm.nih.gov/protein/30678498?report=genpept">NP_850501</a></td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g31070">At2g31070</a></td>
		<td>TCP10</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/30684806?report=genbank">NM_128662</a></td>
        <td><a target="display" href="http://www.ncbi.nlm.nih.gov/protein/18402545?report=genpept">NP_565712</a></td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g08070">At5g08070</a></td>
		<td>TCP17</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/186493972?report=genbank">NM_105554</a></td>
        <td><a target="display" href="http://www.ncbi.nlm.nih.gov/protein/15241512?report=genpept">NP_196424</a></td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g18550">At3g18550</a></td>
		<td>TCP18</td>
		<td>&nbsp;</td>
        <td><a target="display" href="http://www.ncbi.nlm.nih.gov/protein/116743826">CAL64010</a></td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g30210">At1g30210</a></td>
		<td>TCP24</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/nuccore/145336262?report=genbank">NM_102760</a></td>
        <td><a target="display" href="http://www.ncbi.nlm.nih.gov/protein/30691609?report=genpept">NP_849730</a></td>
	</tr>

</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
