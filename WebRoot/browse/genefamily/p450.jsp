<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - P450 Gene Family";
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


<!-- End of header -->

		
		<!-- Content goes here //--> 

<h2><A NAME="P450"><B><i>Arabidopsis</i> P450 Gene Family</B></A></h2>


<TABLE  border="0" cellspacing="0" cellpadding="2">
	
<TR><td valign="top"><b>Source:</B></TD>    <TD><A HREF="http://www.p450.kvl.dk">The Arabidopsis P450, cytochrome b5, P450 reductase, and Glycosyltransferase Family 1 Site at PlaCe</A></TD>
    <TD><A HREF="/servlets/Community?action=view&type=person&communityID=958" target="display">Dr. Soren Bak</TD></TR>
   
<TR>  <td>&nbsp;</TD>  <TD><A HREF="http://drnelson.utmem.edu/Arablinks.html">Dr. David Nelson's Cytochrome P450 website</A></TD>
   <td> <A HREF="/servlets/Community?action=view&type=person&communityID=912138" target="display">Dr. David Nelson</A></TD></TR>

<TR>  <td>&nbsp;</TD>
<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/">NSF2010: Arabidopsis P450 project</td>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=4512">Dr. Mary Schuler</A></td>
    
<tr> <td valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td colspan=2>Arabidopsis genes were considered P450 if their amino acid sequences fell into one of these sequence similarity categories and contained the three key amino acid signature motifs located torwards the C-terminus<br>
<table><tr><td><u>The sequence similarity ranges:</u></td><td><li> Family inclusion: >40% </td></tr>
<tr><td>&nbsp;</td><td><li> Subfamily inclusion: >55% </td></tr>
<tr><td>&nbsp;</td><td><li> Allelic variant inclusion: >95%</td></tr>
<tr><td><u>The P450 signature motifs:</u></td><td><li> the PERF consensus (PXRX)</td></tr>
<tr><td>&nbsp;</td><td><li> the K-helix (XEXXR)</td></tr>
<tr><td>&nbsp;</td><td><li> the heme-binding motif (only the Cystein <br>is required to be in the correct location)</td></tr>
</table>

</td>
</tr>

</TABLE>
    <p>



<TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
<tr>
  <th><b>Sub Family</b></th>
  <th><b>Gene Name</b></th>
  <th><b>Genomic Locus Tag</b></th>
  <th><b>Refseq ID</b></th>
  <th><b>Protein Function</b></th>
</tr><tr class="alt">
  <td rowspan="2">CYP51G</td>
  <td>CYP51G2</td>
  <td>AT2G17330</td>
  <td>NM_127288</td>
  <td>putative obtusifoliol 14-alpha demethylase similar to family of CYP51 gene products</td>
</tr><tr class="alt">
  <td>CYP51G1</td>
  <td>AT1G11680</td>
  <td>NM_101040</td>
  <td>putative obtusifoliol 14-alpha demethylase</td>
</tr><tr>
  <td>CYP701A</td>
  <td>CYP701A3</td>
  <td>AT5G25900</td>
  <td>NM_122491</td>
  <td>cytochrome P450 GA3</td>
</tr>
<tr class="alt">
  <td rowspan="8">CYP702A</td>
  <td>CYP702A1</td>
  <td>AT1G65670</td>
  <td>NM_105240</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP702A2</td>
  <td>AT4G15300</td>
  <td>NM_117618</td>
  <td>cytochrome P450 like protein</td>
</tr>
<tr class="alt">
  <td>CYP702A3</td>
  <td>AT4G15310</td>
  <td>NM_117619</td>
  <td>cytochrome P450 like protein</td>
</tr>
<tr class="alt">
  <td>CYP702A4P</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP702A5</td>
  <td>At4g15393</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP702A6</td>
  <td>At4g15396</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP702A7P</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP702A8</td>
  <td>AT3G30290</td>
  <td>NM_113928</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP703A</td>
  <td>CYP703A2</td>
  <td>AT1G01280</td>
  <td>NM_100010</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td rowspan="2">CYP704A</td>
  <td>CYP704A1</td>
  <td>AT2G44890</td>
  <td>NM_130053</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP704A2</td>
  <td>AT2G45510</td>
  <td>NM_130113</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP704B</td>
  <td>CYP704B1</td>
  <td>At1g69500</td>
  <td>&nbsp;</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td rowspan="31">CYP705A</td>
  <td>CYP705A1</td>
  <td>AT4G15330</td>
  <td>NM_117621</td>
  <td>cytochrome P450 like protein</td>
</tr>
<tr class="alt">
  <td>CYP705A12</td>
  <td>AT5G42580</td>
  <td>NM_123622</td>
  <td>cytochrome P450</td>
</tr>
<tr class="alt">
  <td>CYP705A13</td>
  <td>AT2G14100</td>
  <td>NM_126982</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP705A14P</td>
  <td>At3g20075</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP705A15</td>
  <td>AT3G20080</td>
  <td>NM_112899</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP705A16</td>
  <td>At3g20083</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP705A17P</td>
  <td>At3g20087</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP705A18</td>
  <td>AT3G20090</td>
  <td>NM_112900</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP705A19</td>
  <td>AT3G20100</td>
  <td>NM_112901</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP705A2</td>
  <td>AT4G15350</td>
  <td>NM_117623</td>
  <td>cytochrome P450 like protein</td>
</tr>
<tr class="alt">
  <td>CYP705A20</td>
  <td>AT3G20110</td>
  <td>NM_112902</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP705A21</td>
  <td>AT3G20120</td>
  <td>NM_112903</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP705A22</td>
  <td>AT3G20130</td>
  <td>NM_112904</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP705A23</td>
  <td>AT3G20140</td>
  <td>NM_112905</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP705A24</td>
  <td>AT1G28430</td>
  <td>NM_102611</td>
  <td>hypothetical protein</td>
</tr>
<tr class="alt">
  <td>CYP705A25</td>
  <td>AT1G50560</td>
  <td>NM_103937</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP705A26P</td>
  <td>At1g50550</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP705A27</td>
  <td>AT1G50520</td>
  <td>NM_103935</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP705A28</td>
  <td>At3g20935</td>
  <td>NM_112986</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP705A29P</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP705A3</td>
  <td>AT4G15360</td>
  <td>NM_117624</td>
  <td>cytochrome P450 like protein</td>
</tr>
<tr class="alt">
  <td>CYP705A30</td>
  <td>At3g20940</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP705A31P</td>
  <td>AT3G20960</td>
  <td>NM_112988</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP705A32</td>
  <td>AT3G20950</td>
  <td>NM_112987</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP705A33</td>
  <td>AT3G20960</td>
  <td>NM_112988</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP705A34</td>
  <td>At3g32047</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP705A4</td>
  <td>AT4G15380</td>
  <td>NM_117626</td>
  <td>cytochrome P450 like protein</td>
</tr>
<tr class="alt">
  <td>CYP705A5</td>
  <td>AT5G47990</td>
  <td>NM_124173</td>
  <td>cytochrome P450</td>
</tr>
<tr class="alt">
  <td>CYP705A6</td>
  <td>AT2G05180</td>
  <td>NM_126545</td>
  <td>putative cytochrome P450</td>
</tr>
<tr class="alt">
  <td>CYP705A8</td>
  <td>AT2G27000</td>
  <td>NM_128258</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP705A9</td>
  <td>AT2G27010</td>
  <td>NM_128259</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td rowspan="7">CYP706A</td>
  <td>CYP706A1</td>
  <td>AT4G22690</td>
  <td>NM_118395</td>
  <td>cytochrome P450 like protein</td>
</tr>
<tr>
  <td>CYP706A2</td>
  <td>AT4G22710</td>
  <td>NM_118397</td>
  <td>cytochrome P450 - like protein</td>
</tr>
<tr>
  <td>CYP706A3</td>
  <td>AT5G44620</td>
  <td>NM_123829</td>
  <td>flavonoid 3',5'-hydroxylase-like; cytochrome P450</td>
</tr>
<tr>
  <td>CYP706A4</td>
  <td>AT4G12300</td>
  <td>NM_117300</td>
  <td>flavonoid 3',5'-hydroxylase -like protein</td>
</tr>
<tr>
  <td>CYP706A5</td>
  <td>AT4G12330</td>
  <td>NM_117303</td>
  <td>flavonoid 3',5'-hydroxylase like protein</td>
</tr>
<tr>
  <td>CYP706A6</td>
  <td>AT4G12320</td>
  <td>NM_117302</td>
  <td>cytochrome P450 homolog</td>
</tr>
<tr>
  <td>CYP706A7</td>
  <td>AT4G12310</td>
  <td>NM_117301</td>
  <td>flavonoid 3,5-hydroxylase -like protein</td>
</tr>
<tr class="alt">
  <td rowspan="4">CYP707A</td>
  <td>CYP707A1</td>
  <td>AT4G19230</td>
  <td>NM_118043</td>
  <td>cytochrome P450</td>
</tr>
<tr class="alt">
  <td>CYP707A2</td>
  <td>AT2G29090</td>
  <td>NM_128466</td>
  <td>putative cytochrome P450</td>
</tr>
<tr class="alt">
  <td>CYP707A3</td>
  <td>AT5G45340</td>
  <td>NM_123902</td>
  <td>cytochrome P450</td>
</tr>
<tr class="alt">
  <td>CYP707A4</td>
  <td>AT3G19270</td>
  <td>NM_112814</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td rowspan="3">CYP708A</td>
  <td>CYP708A1</td>
  <td>AT1G55940</td>
  <td>NM_104472</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP708A2</td>
  <td>AT5G48000</td>
  <td>NM_124174</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr>
  <td>CYP708A3</td>
  <td>AT1G78490</td>
  <td>NM_106496</td>
  <td>hypothetical protein</td>
</tr>
<tr class="alt">
  <td rowspan="2">CYP735A</td>
  <td>CYP735A1</td>
  <td>AT5G38450</td>
  <td>NM_123206</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr class="alt">
  <td>CYP735A2</td>
  <td>AT1G67110</td>
  <td>NM_105381</td>
  <td>hypothetical protein</td>
</tr>
<tr>
  <td rowspan="3">CYP709B</td>
  <td>CYP709B1</td>
  <td>AT2G46960</td>
  <td>&nbsp;</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP709B2</td>
  <td>AT2G46950</td>
  <td>NM_130263</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP709B3</td>
  <td>AT4G27710</td>
  <td>NM_118910</td>
  <td>cytochrome P450 - like protein</td>
</tr>
<tr class="alt">
  <td rowspan="4">CYP710A</td>
  <td>CYP710A1</td>
  <td>AT2G34500</td>
  <td>NM_129002</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP710A2</td>
  <td>AT2G34490</td>
  <td>NM_129001</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP710A3</td>
  <td>AT2G28850</td>
  <td>NM_128444</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP710A4</td>
  <td>AT2G28860</td>
  <td>NM_128445</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP711A</td>
  <td>CYP711A1</td>
  <td>AT2G26170</td>
  <td>NM_128175</td>
  <td>putative thromboxane-A synthase</td>
</tr>
<tr class="alt">
  <td rowspan="2">CYP712A</td>
  <td>CYP712A1</td>
  <td>AT2G42250</td>
  <td>NM_129787</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP712A2</td>
  <td>AT5G06905</td>
  <td>&nbsp;</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr>
  <td rowspan="2">CYP714A</td>
  <td>CYP714A1</td>
  <td>AT5G24910</td>
  <td>NM_122400</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr>
  <td>CYP714A2</td>
  <td>AT5G24900</td>
  <td>NM_122399</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr class="alt">
  <td>CYP715A</td>
  <td>CYP715A1</td>
  <td>AT5G52400</td>
  <td>NM_124619</td>
  <td>cytochrome P-450-like protein</td>
</tr>
<tr>
  <td rowspan="2">CYP716A</td>
  <td>CYP716A1</td>
  <td>AT5G36110</td>
  <td>NM_123002</td>
  <td>cytochrome P450-like</td>
</tr>
<tr>
  <td>CYP716A2</td>
  <td>AT5G36140</td>
  <td>NM_123005</td>
  <td>putative protein</td>
</tr>
<tr class="alt">
  <td>CYP718</td>
  <td>CYP718</td>
  <td>AT2G42850</td>
  <td>NM_129846</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td rowspan="17">CYP71A</td>
  <td>CYP71A12</td>
  <td>AT2G30750</td>
  <td>NM_128628</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP71A13</td>
  <td>AT2G30770</td>
  <td>NM_128630</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP71A14</td>
  <td>AT5G24960</td>
  <td>NM_122405</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr>
  <td>CYP71A15</td>
  <td>AT5G24950</td>
  <td>NM_122404</td>
  <td>cytochrome P-450-like protein</td>
</tr>
<tr>
  <td>CYP71A16</td>
  <td>AT5G42590</td>
  <td>NM_123623</td>
  <td>cytochrome P450</td>
</tr>
<tr>
  <td>CYP71A17P</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP71A18</td>
  <td>AT1G11610</td>
  <td>NM_101034</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP71A19</td>
  <td>AT4G13290</td>
  <td>NM_117402</td>
  <td>cytochrome p450 - like protein</td>
</tr>
<tr>
  <td>CYP71A20</td>
  <td>AT4G13310</td>
  <td>NM_117404</td>
  <td>cytochrome p450 like protein</td>
</tr>
<tr>
  <td>CYP71A21</td>
  <td>At3g48320</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP71A22</td>
  <td>At3g48310</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP71A23</td>
  <td>At3g48300</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP71A24</td>
  <td>At3g48290</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP71A25</td>
  <td>At3g48280</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP71A26</td>
  <td>At3g48270</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP71A27</td>
  <td>At4g20240</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP71A28</td>
  <td>At4g20240</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td rowspan="37">CYP71B</td>
  <td>CYP71B10</td>
  <td>AT5G57260</td>
  <td>NM_125108</td>
  <td>cytochrome P450</td>
</tr>
<tr class="alt">
  <td>CYP71B11</td>
  <td>AT5G25120</td>
  <td>NM_122421</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr class="alt">
  <td>CYP71B12</td>
  <td>AT5G25130</td>
  <td>NM_122422</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr class="alt">
  <td>CYP71B13</td>
  <td>AT5G25140</td>
  <td>NM_122423</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr class="alt">
  <td>CYP71B14</td>
  <td>AT5G25180</td>
  <td>NM_122427</td>
  <td>cytochrome P450 71B1 - like protein</td>
</tr>
<tr class="alt">
  <td>CYP71B15</td>
  <td>AT3G26830</td>
  <td>NM_113595</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B16</td>
  <td>AT3G26150</td>
  <td>NM_113522</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B17</td>
  <td>AT3G26160</td>
  <td>NM_113523</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B18P</td>
  <td>At3g26165</td>
  <td>&nbsp;</td>
  <td>pseudogene, cytochrome P450</td>
</tr>
<tr class="alt">
  <td>CYP71B19</td>
  <td>AT3G26170</td>
  <td>NM_113524</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B2</td>
  <td>AT1G13080</td>
  <td>NM_101178</td>
  <td>putative cytochrome P450 monooxygenase</td>
</tr>
<tr class="alt">
  <td>CYP71B20</td>
  <td>AT3G26180</td>
  <td>&nbsp;</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B21</td>
  <td>AT3G26190</td>
  <td>NM_113526</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B22</td>
  <td>AT3G26200</td>
  <td>NM_113527</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B23</td>
  <td>AT3G26210</td>
  <td>&nbsp;</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B24</td>
  <td>AT3G26230</td>
  <td>NM_113530</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B25</td>
  <td>AT3G26270</td>
  <td>NM_113534</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B26</td>
  <td>AT3G26290</td>
  <td>NM_113536</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B27</td>
  <td>AT1G13070</td>
  <td>NM_101177</td>
  <td>putative cytochrome P450 monooxygenase</td>
</tr>
<tr class="alt">
  <td>CYP71B28</td>
  <td>AT1G13090</td>
  <td>NM_101179</td>
  <td>putative cytochrome P450 monooxygenase</td>
</tr>
<tr class="alt">
  <td>CYP71B29</td>
  <td>AT1G13100</td>
  <td>NM_101180</td>
  <td>putative cytochrome P450 monooxygenase</td>
</tr>
<tr class="alt">
  <td>CYP71B3</td>
  <td>AT3G26220</td>
  <td>NM_113529</td>
  <td>cytochrome P450 monooxygenase (CYP71B3)</td>
</tr>
<tr class="alt">
  <td>CYP71B30P</td>
  <td>AT3G53290</td>
  <td>NM_115189</td>
  <td>CYTOCHROME P450 - like protein</td>
</tr>
<tr class="alt">
  <td>CYP71B31</td>
  <td>AT3G53300</td>
  <td>NM_115190</td>
  <td>CYTOCHROME P450-like protein</td>
</tr>
<tr class="alt">
  <td>CYP71B32</td>
  <td>AT3G53300</td>
  <td>NM_115190</td>
  <td>CYTOCHROME P450-like protein</td>
</tr>
<tr class="alt">
  <td>CYP71B33</td>
  <td>At3g26295</td>
  <td>&nbsp;</td>
  <td>pseudogene, cytochrome P450</td>
</tr>
<tr class="alt">
  <td>CYP71B34</td>
  <td>AT3G26300</td>
  <td>&nbsp;</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B35</td>
  <td>AT3G26310</td>
  <td>NM_113538</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B36</td>
  <td>AT3G26320</td>
  <td>NM_113539</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B37</td>
  <td>AT3G26330</td>
  <td>&nbsp;</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP71B38</td>
  <td>AT3G44250</td>
  <td>NM_114293</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr class="alt">
  <td>CYP71B4</td>
  <td>AT3G26280</td>
  <td>NM_113535</td>
  <td>cytochrome P450 monooxygenase (CYP71B4)</td>
</tr>
<tr class="alt">
  <td>CYP71B5</td>
  <td>AT3G53280</td>
  <td>NM_115188</td>
  <td>CYTOCHROME P450 71B5</td>
</tr>
<tr class="alt">
  <td>CYP71B6</td>
  <td>AT2G24180</td>
  <td>NM_127979</td>
  <td>putative cytochrome P450 identical to GB:D78604</td>
</tr>
<tr class="alt">
  <td>CYP71B7</td>
  <td>AT1G13110</td>
  <td>NM_101181</td>
  <td>putative cytochrome P450 monooxygenase</td>
</tr>
<tr class="alt">
  <td>CYP71B8</td>
  <td>At5g35715</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP71B9</td>
  <td>AT2G02580</td>
  <td>NM_126314</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP720A</td>
  <td>CYP720A1</td>
  <td>At1g73340</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP721A</td>
  <td>CYP721A1</td>
  <td>AT1G75130</td>
  <td>NM_106169</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP722A</td>
  <td>CYP722A1</td>
  <td>AT1G19630</td>
  <td>NM_101819</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP724A</td>
  <td>CYP724A1</td>
  <td>AT5G14400</td>
  <td>NM_121444</td>
  <td>putative protein</td>
</tr>
<tr>
  <td rowspan="9">CYP72A</td>
  <td>CYP72A10</td>
  <td>AT3G14640</td>
  <td>NM_112325</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP72A11</td>
  <td>AT3G14650</td>
  <td>NM_112326</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP72A12P</td>
  <td>AT3G14640</td>
  <td>NM_112325</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP72A13</td>
  <td>AT3G14660</td>
  <td>NM_112327</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP72A14</td>
  <td>AT3G14680</td>
  <td>NM_112329</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP72A15</td>
  <td>AT3G14690</td>
  <td>NM_112330</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP72A7</td>
  <td>AT3G14610</td>
  <td>NM_112322</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP72A8</td>
  <td>AT3G14620</td>
  <td>NM_112323</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP72A9</td>
  <td>AT3G14630</td>
  <td>NM_112324</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP734A</td>
  <td>CYP734A1</td>
  <td>AT2G26710</td>
  <td>NM_128228</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP72C</td>
  <td>CYP72C1</td>
  <td>AT1G17060</td>
  <td>NM_101566</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP734A</td>
  <td>CYP734A1</td>
  <td>At2g26710</td>
  <td>&nbsp;</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td rowspan="2">CYP735A</td>
  <td>CYP735A1</td>
  <td>AT5g38450</td>
  <td>&nbsp;</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr>
  <td>CYP735A2</td>
  <td>At1g67110</td>
  <td>&nbsp;</td>
  <td>hypothetical protein</td>
</tr>
<tr class="alt">
  <td>CYP73A</td>
  <td>CYP73A5</td>
  <td>AT2G30490</td>
  <td>NM_128601</td>
  <td>cinnamate-4-hydroxylase molecular marker C4H (GB:U71080)</td>
</tr>
<tr>
  <td>CYP74A</td>
  <td>CYP74A1</td>
  <td>AT5G42650</td>
  <td>NM_123629</td>
  <td>allene oxide synthase (emb|CAA73184.1)</td>
</tr>
<tr class="alt">
  <td>CYP74B</td>
  <td>CYP74B2</td>
  <td>AT4G15440</td>
  <td>NM_117633</td>
  <td>hydroperoxide lyase (HPOL) like protein</td>
</tr>
<tr>
  <td>CYP75B</td>
  <td>CYP75B1</td>
  <td>AT5G07990</td>
  <td>NM_120881</td>
  <td>flavonoid 3'-hydroxylase - like protein</td>
</tr>
<tr class="alt">
  <td rowspan="8">CYP76C</td>
  <td>CYP76C1</td>
  <td>AT2G45560</td>
  <td>NM_130118</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP76C2</td>
  <td>AT2G45570</td>
  <td>NM_130119</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP76C3</td>
  <td>AT2G45580</td>
  <td>NM_130120</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP76C4</td>
  <td>AT2G45550</td>
  <td>NM_130117</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP76C5</td>
  <td>AT1G33730</td>
  <td>NM_103093</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP76C6</td>
  <td>AT1G33720</td>
  <td>NM_103092</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP76C7</td>
  <td>At3g61040</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP76C8P</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP76G</td>
  <td>CYP76G1</td>
  <td>AT3G52970</td>
  <td>&nbsp;</td>
  <td>cytochrome P450 - like protein</td>
</tr>
<tr class="alt">
  <td rowspan="5">CYP77A</td>
  <td>CYP77A4</td>
  <td>At5g04630</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP77A5P</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td>CYP77A6</td>
  <td>AT3G10570</td>
  <td>NM_111893</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP77A7</td>
  <td>AT3G10560</td>
  <td>NM_111892</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP77A9</td>
  <td>AT5G04630</td>
  <td>NM_120545</td>
  <td>cytochrome P450 - like protein</td>
</tr>
<tr>
  <td>CYP77B</td>
  <td>CYP77B1</td>
  <td>AT1G11600</td>
  <td>NM_101033</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td rowspan="6">CYP78A</td>
  <td>CYP78A10</td>
  <td>AT1G74110</td>
  <td>NM_106071</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP78A5</td>
  <td>AT1G13710</td>
  <td>NM_101240</td>
  <td>hypothetical protein</td>
</tr>
<tr class="alt">
  <td>CYP78A6</td>
  <td>AT2G46660</td>
  <td>NM_130231</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP78A7</td>
  <td>AT5G09970</td>
  <td>NM_121034</td>
  <td>cytochrome P450</td>
</tr>
<tr class="alt">
  <td>CYP78A8</td>
  <td>AT1G01190</td>
  <td>NM_100001</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP78A9</td>
  <td>AT3G61880</td>
  <td>NM_116053</td>
  <td>cytochrome p450 (CYP78A9)</td>
</tr>
<tr>
  <td rowspan="3">CYP79A</td>
  <td>CYP79A2</td>
  <td>AT5G05260</td>
  <td>NM_120608</td>
  <td>cytochrome P450</td>
</tr>
<tr>
  <td>CYP79A3P</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP79A4P</td>
  <td>AT5G35920</td>
  <td>NM_122983</td>
  <td>cytochrome P450-like</td>
</tr>
<tr class="alt">
  <td rowspan="3">CYP79B</td>
  <td>CYP79B2</td>
  <td>AT4G39950</td>
  <td>NM_120158</td>
  <td>cytochrome P450 - like protein</td>
</tr>
<tr class="alt">
  <td>CYP79B3</td>
  <td>AT2G22330</td>
  <td>NM_127798</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP79B4P</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td rowspan="5">CYP79C</td>
  <td>CYP79C1</td>
  <td>AT1G79370</td>
  <td>NM_106585</td>
  <td>hypothetical protein</td>
</tr>
<tr>
  <td>CYP79C2</td>
  <td>AT1G58370</td>
  <td>NM_104617</td>
  <td>xylan endohydrolase, putative</td>
</tr>
<tr>
  <td>CYP79C3P</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP79C4P</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP79C5P</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr class="alt">
  <td rowspan="2">CYP79F</td>
  <td>CYP79F1</td>
  <td>AT1G16410</td>
  <td>NM_101507</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP79F2</td>
  <td>AT1G16400</td>
  <td>NM_101506</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td rowspan="8">CYP81D</td>
  <td>CYP81D1</td>
  <td>AT5G36220</td>
  <td>NM_123013</td>
  <td>cytochrome P450</td>
</tr>
<tr>
  <td>CYP81D2</td>
  <td>AT4G37360</td>
  <td>NM_119899</td>
  <td>cytochrome p450 - like protein</td>
</tr>
<tr>
  <td>CYP81D3</td>
  <td>AT4G37340</td>
  <td>NM_119898</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr>
  <td>CYP81D4</td>
  <td>AT4G37330</td>
  <td>NM_119897</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr>
  <td>CYP81D5</td>
  <td>AT4G37320</td>
  <td>NM_119896</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr>
  <td>CYP81D6</td>
  <td>AT2G23220</td>
  <td>NM_127886</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP81D7</td>
  <td>AT2G23190</td>
  <td>NM_127883</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP81D8</td>
  <td>AT4G37370</td>
  <td>NM_119900</td>
  <td>cytochrome P450 - like protein</td>
</tr>
<tr class="alt">
  <td rowspan="4">CYP81F</td>
  <td>CYP81F1</td>
  <td>AT4G37430</td>
  <td>NM_119906</td>
  <td>cytochrome P450 monooxygenase (CYP91A2)</td>
</tr>
<tr class="alt">
  <td>CYP81F2</td>
  <td>AT5G57220</td>
  <td>NM_125104</td>
  <td>cytochrome P450</td>
</tr>
<tr class="alt">
  <td>CYP81F3</td>
  <td>AT4G37400</td>
  <td>NM_119903</td>
  <td>cytochrome P450 monooxygenase -like protein</td>
</tr>
<tr class="alt">
  <td>CYP81F4</td>
  <td>AT4G37410</td>
  <td>NM_119904</td>
  <td>cytochrome P450 monooxygenase - like protein</td>
</tr>
<tr>
  <td>CYP81G</td>
  <td>CYP81G1</td>
  <td>AT5G67310</td>
  <td>NM_126131</td>
  <td>cytochrome P450</td>
</tr>
<tr class="alt">
  <td>CYP81H</td>
  <td>CYP81H1</td>
  <td>AT4G37310</td>
  <td>NM_119895</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr>
  <td rowspan="2">CYP81K</td>
  <td>CYP81K1</td>
  <td>AT5G10610</td>
  <td>NM_121099</td>
  <td>cytochrome P450 - like protein</td>
</tr>
<tr>
  <td>CYP81K2</td>
  <td>AT5G10600</td>
  <td>NM_121098</td>
  <td>cytochrome P450 - like protein</td>
</tr>
<tr class="alt">
  <td rowspan="3">CYP82C</td>
  <td>CYP82C2</td>
  <td>AT4G31970</td>
  <td>NM_119348</td>
  <td>Cytochrome P450-like protein</td>
</tr>
<tr class="alt">
  <td>CYP82C3</td>
  <td>AT4G31950</td>
  <td>NM_119346</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr class="alt">
  <td>CYP82C4</td>
  <td>AT4G31940</td>
  <td>NM_119345</td>
  <td>Cytochrome P450-like protein</td>
</tr>
<tr>
  <td>CYP82F</td>
  <td>CYP82F1</td>
  <td>AT2G25160</td>
  <td>NM_128073</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP82G</td>
  <td>CYP82G1</td>
  <td>AT3G25180</td>
  <td>NM_113423</td>
  <td>cytochrome P450 monooxygenase, putative</td>
</tr>
<tr>
  <td>CYP83A</td>
  <td>CYP83A1</td>
  <td>AT4G13770</td>
  <td>NM_117451</td>
  <td>cytochrome P450 monooxygenase (CYP83A1)</td>
</tr>
<tr class="alt">
  <td>CYP83B</td>
  <td>CYP83B1</td>
  <td>AT4G31500</td>
  <td>NM_119299</td>
  <td>cytochrome P450 monooxygenase</td>
</tr>
<tr>
  <td>CYP84A</td>
  <td>CYP84A1</td>
  <td>AT4G36220</td>
  <td>NM_119790</td>
  <td>ferulate-5-hydroxylase (FAH1)</td>
</tr>
<tr class="alt">
  <td>CYP85A</td>
  <td>CYP85A1</td>
  <td>AT5G38970</td>
  <td>NM_123259</td>
  <td>cytochrome P450 - like protein</td>
</tr>
<tr>
  <td rowspan="5">CYP86A</td>
  <td>CYP86A1</td>
  <td>AT5G58860</td>
  <td>NM_125276</td>
  <td>cytochrome P450 CYP86A1</td>
</tr>
<tr>
  <td>CYP86A2</td>
  <td>AT4G00360</td>
  <td>NM_116260</td>
  <td>probable cytochrome P450</td>
</tr>
<tr>
  <td>CYP86A4</td>
  <td>AT1G01600</td>
  <td>NM_100042</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP86A7</td>
  <td>AT1G63710</td>
  <td>NM_105048</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP86A8</td>
  <td>AT2G45970</td>
  <td>NM_130160</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP86B</td>
  <td>CYP86B1</td>
  <td>AT5G23190</td>
  <td>NM_122225</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr>
  <td rowspan="4">CYP86C</td>
  <td>CYP86C1</td>
  <td>AT1G24540</td>
  <td>NM_102298</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP86C2</td>
  <td>At3g26125</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP86C3</td>
  <td>AT1G13140</td>
  <td>NM_101184</td>
  <td>putative cytochrome P450 monooxygenase</td>
</tr>
<tr>
  <td>CYP86C4</td>
  <td>AT1G13150</td>
  <td>NM_101185</td>
  <td>putative cytochrome P450 monooxygenase</td>
</tr>
<tr class="alt">
  <td>CYP87A</td>
  <td>CYP87A2</td>
  <td>At1g12740</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td rowspan="2">CYP88A</td>
  <td>CYP88A3</td>
  <td>AT1G05160</td>
  <td>NM_100394</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP88A4</td>
  <td>AT2G32440</td>
  <td>NM_128803</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td rowspan="7">CYP89A</td>
  <td>CYP89A2</td>
  <td>AT1G64900</td>
  <td>NM_105164</td>
  <td>hypothetical protein</td>
</tr>
<tr class="alt">
  <td>CYP89A3</td>
  <td>AT5G61320</td>
  <td>NM_125525</td>
  <td>cytochrome P450 - like protein</td>
</tr>
<tr class="alt">
  <td>CYP89A4</td>
  <td>AT2G12180</td>
  <td>&nbsp;</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP89A5</td>
  <td>AT1G64950</td>
  <td>NM_105169</td>
  <td>hypothetical protein</td>
</tr>
<tr class="alt">
  <td>CYP89A6</td>
  <td>AT1G64940</td>
  <td>NM_105168</td>
  <td>hypothetical protein</td>
</tr>
<tr class="alt">
  <td>CYP89A7</td>
  <td>AT1G64930</td>
  <td>NM_105167</td>
  <td>hypothetical protein</td>
</tr>
<tr class="alt">
  <td>CYP89A9</td>
  <td>AT3G03470</td>
  <td>NM_111218</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP90A</td>
  <td>CYP90A1</td>
  <td>AT5G05690</td>
  <td>NM_120651</td>
  <td>cytochrome P450 90A1 (sp|Q42569)</td>
</tr>
<tr class="alt">
  <td>CYP90B</td>
  <td>CYP90B1</td>
  <td>AT3G50660</td>
  <td>NM_114926</td>
  <td>steroid 22-alpha-hydroxylase (DWF4)</td>
</tr>
<tr>
  <td>CYP90C</td>
  <td>CYP90C1</td>
  <td>AT4G36380</td>
  <td>NM_119801</td>
  <td>cytochrome P450 like protein</td>
</tr>
<tr class="alt">
  <td>CYP90D</td>
  <td>CYP90D1</td>
  <td>AT3G13730</td>
  <td>NM_112223</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP93D</td>
  <td>CYP93D1</td>
  <td>AT5G06900</td>
  <td>NM_120772</td>
  <td>cytochrome P450</td>
</tr>
<tr class="alt">
  <td rowspan="3">CYP94B</td>
  <td>CYP94B1</td>
  <td>AT5G63450</td>
  <td>NM_125740</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr class="alt">
  <td>CYP94B2</td>
  <td>AT3G01900</td>
  <td>NM_111056</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td>CYP94B3</td>
  <td>AT3G48520</td>
  <td>NM_114710</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr>
  <td>CYP94C</td>
  <td>CYP94C1</td>
  <td>AT2G27690</td>
  <td>NM_128328</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr class="alt">
  <td rowspan="2">CYP94D</td>
  <td>CYP94D1</td>
  <td>AT1G34540</td>
  <td>NM_103176</td>
  <td>cytochrome p450, putative</td>
</tr>
<tr class="alt">
  <td>CYP94D2</td>
  <td>AT3G56630</td>
  <td>NM_115522</td>
  <td>cytochrome P450-like protein</td>
</tr>
<tr>
  <td rowspan="14">CYP96A</td>
  <td>CYP96A1</td>
  <td>AT2G23180</td>
  <td>NM_127882</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP96A10</td>
  <td>AT4G39490</td>
  <td>NM_120109</td>
  <td>cytochrome P450 - like protein</td>
</tr>
<tr>
  <td>CYP96A11</td>
  <td>AT4G39500</td>
  <td>NM_120110</td>
  <td>cytochrome P450 -like protein</td>
</tr>
<tr>
  <td>CYP96A12</td>
  <td>AT4G39510</td>
  <td>NM_120111</td>
  <td>cytochrome P450 -like protein</td>
</tr>
<tr>
  <td>CYP96A13</td>
  <td>AT5G02900</td>
  <td>NM_120368</td>
  <td>cytochrome P450 - like protein</td>
</tr>
<tr>
  <td>CYP96A14P</td>
  <td>At1g66030</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP96A15</td>
  <td>At1g57750</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>CYP96A2</td>
  <td>AT4G32170</td>
  <td>NM_119369</td>
  <td>cytochrome p450 - like protein</td>
</tr>
<tr>
  <td>CYP96A3</td>
  <td>AT1G65340</td>
  <td>NM_105208</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP96A4</td>
  <td>AT5G52320</td>
  <td>NM_124611</td>
  <td>cytochrome P450</td>
</tr>
<tr>
  <td>CYP96A5</td>
  <td>AT2G21910</td>
  <td>NM_127760</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP96A7</td>
  <td>AT1G47630</td>
  <td>NM_103656</td>
  <td>hypothetical protein</td>
</tr>
<tr>
  <td>CYP96A8</td>
  <td>AT1G47620</td>
  <td>NM_103655</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP96A9</td>
  <td>AT4G39480</td>
  <td>NM_120108</td>
  <td>cytochrome P450 - like protein</td>
</tr><tr class="alt">
  <td>CYP97A</td>
  <td>CYP97A3</td>
  <td>At1g31800</td>
  <td>&nbsp;</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP97B</td>
  <td>CYP97B3</td>
  <td>AT4G15110</td>
  <td>NM_117600</td>
  <td>cytochrome P450 like protein</td>
</tr>
<tr class="alt">
  <td>CYP97C</td>
  <td>CYP97C1</td>
  <td>AT3G53130</td>
  <td>&nbsp;</td>
  <td>Cytochrom P450 -like protein</td>
</tr>
<tr>
  <td rowspan="3">CYP98A</td>
  <td>CYP98A3</td>
  <td>AT2G40890</td>
  <td>NM_129652</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP98A8</td>
  <td>AT1G74540</td>
  <td>NM_106114</td>
  <td>cytochrome P450, putative</td>
</tr>
<tr>
  <td>CYP98A9</td>
  <td>AT1G74550</td>
  <td>NM_106115</td>
  <td>cytochrome P450, putative</td>
</tr>
</table>

 <center>Last modified on December 8, 2009</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
