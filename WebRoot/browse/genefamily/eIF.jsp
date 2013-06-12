<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Eukaryotic Initiation Factors Gene Family";
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
 





<A NAME="eIF.html"> <h2>Eukaryotic Initiation Factors Gene Family</h2></A>
<TABLE><TR>

<TD valign=top><B>Source:</B></TD>
<TD><A HREF="http://www.cm.utexas.edu/browning/db/">Browning Research Group Protein Synthesis Genomic Database</A></TD></TR>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD> </TD></TR>

<TR><TD><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=5220"target="display">Karen Browning</A></TD></TR>

</TABLE>

    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th>    
	    </TR>
	    
<tr class="alt"><td rowspan=4><b>eIF1</b><br>eukaryotic initiation factor 1</td>
<td>AteIF1-1</td>
<td>T24A18.80<BR>At4g27130</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=1800277">AAB68033</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=7269566">CAB79568</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=U81042">U81042</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AL161566">AL161566</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g27130">translation initiation factor</A></td></tr>

<tr  bgcolor=
D5D9DD><td>AteIF1-2</td>
<td>MBG8.2<BR>At5g54760</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=9758256">BAB08755</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AB005232">AB005232</a></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g54760">protein translation factor Sui1 homolog (sp P41568) </A></td></tr>

<tr  bgcolor=
D5D9DD><td>AteIF1-3</td>
<td>MBG8.21<BR>At5g54940</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=9758274">BAB08773</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AB005232">AB005232</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF385736">AF385736</a></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g54940">translation initiation factor-like protein</A></td></tr>

<tr  bgcolor=
D5D9DD><td>AteIF1-4</td>
<td>F20D21.11 <br>F20D21_53<BR>At1g54290</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=4585973">AAD25609</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF372910">AF372910</a><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC005287">AC005287</a></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54290">protein translation factor Sui1 homolog, putative</A></td></tr>

<tr><td rowspan=2><b>eIF1A</b> <br>eukaryotic initiation factor 1A</td>
<td>AteIF1A-1</td>
<td>MXH1.2<BR>At5g35680</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=9758641">BAB09265</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AB011485">AB011485</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g35680">expressed protein </A></td></tr>

<tr><td>AteIF1A-2</td>
<td>T1O3.7<BR>At2g04520</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=4587600">AAD25828</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC006951">AC006951</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AY052744">AY052744</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF378900">AF378900</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g04520">putative translation initiation factor eIF-1A </A></td></tr>

<tr class="alt"><td rowspan=2><b>eIF2</b> eIF2alpha <br>eukaryotic initiation factor 2alpha </td>
<td>AteIF2-A1</td>
<td>T3G21.6<BR>At2g40290</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=4588003">AAD25944</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF085279">AF085279</a><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=4586046">AAD25664</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC007020">AC007020</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40290">putative eukaryotic translation initiation factor 2 alpha subunit, eIF2 </A></td></tr>

<tr class="alt"><td>AteIF2-A2</td>
<td>K18I23.28<BR>At5g05470</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=13549160">AAK29673</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=11762124"> AAG40340</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF353096">AF353096</A><br><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF324988">AF324988</A><br><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AB010692">AB010692</A> </td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g05470">eukaryotic translation initiation factor 2 alpha subunit-like protein</A></td></tr>

<tr><td rowspan=3><b>eIF2beta</b><br>eukaryotic initiation factor 2beta</td>
<td>AteIF2-B1</td>
<td>F22D1.90<BR>At5g20920</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=13549158">AAK29672</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF353095">AF353095 </A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF296834">AF296834</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g20920">translation initiation factor eIF-2 beta chain - like protein</A></td></tr>

<tr><td>AteIF2-B2</td>
<td>T20L15.210<BR>At5g01940</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=7329667">CAB82764</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AL162351">AL162351</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g01940">translation initiation factor eIF-2 beta chain-like protein</A></td></tr>

<tr><td>AteIF2-B3</td>
<td>F17A17.26<BR>At3g07920</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=6648204">AAF21202</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC013483">AC013483</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g07920">putative eukaryotic translation initiation factor 2 beta subunit</A></td></tr>

<tr class="alt"><td rowspan=3><b>eIF2gamma</b> <br>eukaryotic initiation factor 2gamma</td>
<td>AteIF2-G1</td>
<td>  F20D22.6<BR>At1g04170</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=13549162">AAK29674</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=3142294">AAC16745</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF353097">AF353097</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC002411">AC002411</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04170">translation initiation factor eIF-2 gamma subunit, putative </A></td></tr>

<tr class="alt"><td>AteIF2-G2</td>
<td> T9A21.180<BR>At4g18330</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=2832707">CAA16805</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AL021713">AL021713</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18330"> translation initiation factor eIF-2 gamma chain-like protein</A></td></tr>

<tr class="alt"><td>AteIF2-G3</td>
<td> MSF3.10<BR>At2g18720</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=4185138">AAD08941</A><br><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC005724">AC005724</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18720">translation initiation factor eIF-2 gamma subunit, putative </A></td></tr>

<tr><td rowspan=3><b>eIF2Balpha</b> <br>eukaryotic initiation factor 2Balpha</td>
<td>AteIF2B-A1</td>
<td>T18A20.11<BR>At1g53880</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=6056396">AAF02860</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC009324">AC009324</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53880"> unknown protein</A></td></tr>

<tr><td>AteIF2B-A2</td>
<td> T10D10.19<BR>At1g72340</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=12325267">AAG52574</A><br>AC016529</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72340">putative translation initiation factor EIF-2B alpha subunit </A></td></tr>

<tr><td>AteIF2B-A3</td>
<td>T6P5.3<BR>At2g05830</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=4006818">AAC95160</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC005970">AC005970</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g05830">putative translation initiation factor eIF-2B alpha subunit </A></td></tr>

<tr class="alt"><td><b>eIF2Bbeta</B><br> eukaryotic initiation factor 2Bbeta</td>
<td>AteIF2B-B1</td>
<td>T1B9.3<BR>At3g07300</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=6041832">AAF02141</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC009853"> AC009853</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g07300">putative translation initiation factor EIF-2B beta subunit </A></td></tr>

<tr><td rowspan=3><b>eIF2Bdelta</B> <br>eukaryotic initiation factor 2Bdelta</td>
<td>AteIF2B-D1</td>
<td>MBB18.19<BR>At5g38640</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=10176832">BAB10154</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AB005231">AB005231</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g38640">putative protein </A></td></tr>

<tr><td>AteIF2B-D2</td>
<td>F6E13.43<br>F6E13_20<BR>At2g44070</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=3212863">AAC23414</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC004005">AC004005</a></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44070">putative translation initiation factor eIF-2B delta subunit </A></td></tr>

<tr><td>AteIF2B-D3</td>
<td>F27K7.2<br>F27J15_24<BR>At1g48970</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=7770335">AAF69705</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC016041">AC016041</a></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48970"> hypothetical protein </A></td></tr>

<tr class="alt"><td rowspan=3><b>eIF2Bepsilon, g</b><br>eukaryotic initiation factor 2Bepsilon, 2Bgamma </td>
<td>AteIF2B-E1</td>
<td>F19I3.20<BR>At2g34970</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=3033392">AAC12836</A><br><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC004238">AC004238</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34970">putative translation initiation factor eIF-2B epsilon subunit</A></td></tr>

<tr bgcolor=
D5D9DD ><td>AteIF2B-E2</td>
<td>F14P3.8<BR>At3g02270</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=6041791">AAF02111</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC009755">AC009755</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02270">putative translation initiation factor EIF-2B epsilon subunit </A></td></tr>

<tr class="alt"><td>AteIF2B-E3</td>
<td>T9A21.150<BR>At4g18300</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=2832704">CAA16802</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AL021713">AL021713</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18300"> initiation factor-2Bepsilon-like protein </A></td></tr>

<tr ><td rowspan=2><b>eIF2C</B> <br>eukaryotic initiation factor 2C </td>
<td>AGOI</td>
<td>T1N15.2<br>F11A17_3<BR>At1g48410</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=8778710">AAF79718</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC020889">AC020889</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48410"> leaf development protein Argonaute </A></td></tr>

<tr><td>ZWILLE</td>
<td>MQD19.17<BR>At5g43810</td>
<td><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=2959781">CAA11429</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AJ223508">AJ223508</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=5107374">AAD40098</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF154272">AF154272</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=10177951">BAB11310</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AB026651">AB026651</A></td>
<td><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g43810">PINHEAD (gb|AAD40098.1); translation initiation factor</td></tr>

<tr class="alt"><td><b>eIF3a</b><br>eukaryotic initiation factor 3a </td>
<td>AteIF3A-1</td>
<td>F25E4.40<BR>At4g11420</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=12407749">AAG53635</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF291711">AF291711</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=7321039">CAB82147</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AL050399">AL050399</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11420">putative protein</A></td></tr>

<tr><td rowspan=2><b>eIF3b</b> <br>eukaryotic initiation factor 3b </td>
<td>AteIF3B-1</td>
<td>F15A18.100<BR>At5g27640</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=12407662">AAG53615</A><br> <A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF285834">AF285834</a><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=14190411">AAK55686</A><br><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC007478">AC007478</a><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF378883">AF378883</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27640">TRANSLATION INITIATION FACTOR 3 SUBUNIT 9-like protein </A></td></tr>

<tr><td>AteIF3B-2</td>
<td><BR>At5g25780</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=7689383">AAF67758</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF255680">AF255680</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC007478">AC007478</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g25780">eukaryotic translation initiation factor - like protein</A></td></tr>

<tr class="alt"><td rowspan=2><b>eIF3c</b><br>eukaryotic initiation factor 3c </td>
<td>AteIF3C-1</td>
<td><BR>At3g56150</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=2789660">AAC83464</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF040102">AF040102</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=7572913">CAB87414</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AL163763">AL163763</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g56150">PROBABLE EUKARYOTIC TRANSLATION INITIATION FACTOR 3
 SUBUNIT 8 </A></td></tr>

<tr class="alt"><td>AteIF3C-2</td>
<td>F5N5.5<br>F5N5_3<BR>At3g22860</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=11994715">BAB03031</A><br><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AP001300">AP001300</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g22860">eukaryotic translation initiation factor 3 (subunit 8)</A></td></tr>

<tr><td rowspan=2><b>eIF3d</b> <br>eukaryotic initiation factor 3d </td>
<td>AteIF3D-1</td>
<td>T13K14.140<BR>At4g20980</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=5262788">CAB45893</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AL080282">AL080282</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g20980">translation initiation factor eIF3 - like protein</A></td></tr>

<tr><td>AteIF3D-2</td>
<td>K9L2.10<BR>At5g44320</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=10176887">BAB10117</A><br><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AB011475">AB011475</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g44320">eukaryotic translation initiation factor 3 subunit 7</A></td></tr>

<tr class="alt"><td><b>eIF3e</b> <BR>eukaryotic initiation factor 3e </td>
<td>AteIF3E-1</td>
<td>F28O9.140<BR>At3g57290</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=12407658">AAG53613</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF285832">AF285832</a><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=7689381">AAF67757</a><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF255679">AF255679 </a><br><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=6735308">CAB68135</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AL137080">AL137080</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AY039913">AY039913</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g57290">translation initiation factor 3 -like protein </A></td></tr>

<tr><td><b>eIF3f</b> <br>eukaryotic initiation factor 3f</td>
<td>AteIF3F-1</td>
<td>T28M21.15<BR>At2g39990</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=2351376">AAD03463</A><br><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=U54561">ATU54561</A><br><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=2088652">AAB95284</A><br><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF002109">AF002109</A><br><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AY045824">AY045824</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39990"> 26S proteasome regulatory subunit</A></td></tr>

<tr class="alt"><td rowspan=2><b>eIF3g</b> <br>eukaryotic initiation factor 3g </td>
<td>AteIF3G-1</td>
<td>F24K9.7<BR>At3g11400</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=12407751">AAG53636</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF291712">AF291712</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=9755847">CAC01929</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AJ293728">AJ293728</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=12322907">AAG51445</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC008153">AC008153</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g11400">putative eukaryotic translation initiation factor 3 subunit</A></td></tr>

<tr class="alt"><td>AteIF3G-2</td>
<td>K18J17.20<BR>At5g06000</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=10177573">BAB10805</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AB017060">AB017060</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g06000">eukaryotic translation initiation factor 3 subunit-like protein </A></td></tr>

<tr><td><b>eIF3h</b> <br>eukaryotic initiation factor 3h </td>
<td>AteIF3H-1</td>
<td>T16B5.2<BR>At1g10840</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=12407660">AAG53614</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF285833">AF285833</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=4874264">AAD31329</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC007354">AC007354</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10840">putative translation initiation factor</A></td></tr>

<tr class="alt"><td rowspan=2><b>eIF3i</b> <br>eukaryotic initiation factor 3i</td>
<td>AteIF3I-1</td>
<td>T3F17.45<br>T3F17_7<BR>At2g46280</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=12407664">AAG53616</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF285835">AF285835</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=1036803">AAC49079</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=U36765">U36765</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=3702321">AAC62878</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC005397">AC005397</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF370485">AF370485</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46280">eukaryotic translation initiation factor 3 delta subunit</A></td></tr>

<tr class="alt"><td>AteIF3I-2</td>
<td>T3F17.3<br>T3F17_6<BR>At2g46290</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=3702320"> AAC62877</A><br><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC005397">AC005397</a></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46290">eukaryotic translation initiation factor 3 delta subunit</A></td></tr>

<tr><td><b>eIF3k</b><br>eukaryotic initiation factor 3k</td>
<td>AteIF3K-1</td>
<td>F17M5.10<BR>At4g33250</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=12407753">AAG53637</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF291713">AF291713</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=4490292">CAB38783</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AL035678">AL035678</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AY050928">AY050928</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AY037191">AY037191</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g33250">putative protein </A></td></tr>

<tr class="alt"><td><b>eIF3l</b><br>eukaryotic initiation factor 3l </td>
<td>AteIF3L-1</td>
<td>this region of the                                                                      chromosome
                                                                                       is not
                                                                                       annotated yet</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC084432">AC084432</A></td>
<td>&nbsp;</td></tr>

<tr><td rowspan=2><b>eIF4A</b><br>eukaryotic initiation factor 4A</td>
<td>AteIF4A-1<br>AtRH4</td>
<td>MDC16.5<br>MDC16_4<BR>At3g13920</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=16554">CAA46188</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=X65052">X65052</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=11994363">BAB02322</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AB019229">AB019229</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AY052344">AY052344</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AY050957">AY050957</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13920">Eukaryotic initiation factor 4A, putative</A></td></tr>

<tr><td>AteIF4A-2<br>AtRH19</td>
<td>F20D21.9<br>F20D21_5<BR>At1g54270</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=4585969">AAD25605</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC005287">AC005287</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF386923">AF386923</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54270">eukaryotic translation initiation factor 4A, putative</A></td></tr>

<tr class="alt"><td rowspan=4><b>eIF4A-like</b><br>RNA helicases most related to eIF4A</td>
<td>RH23</td>
<td>F28P22.8<BR>At1g72730</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=3776021">CAA09211</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AJ010472">AJ010472</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=12323781">AAG51861</A><br>AC010926</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72730">putative Eukaryotic initiation factor 4A </A></td></tr>

<tr class="alt"><td>RH2</td>
<td>MMB12.4<br>MMB12_21<BR>At3g19760</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=3775985">CAA09195</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AJ010456">AJ010456</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=9294443">BAB02563</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AY050367">AY050367</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g19760">RNA helicase, putative</A></td></tr>

<tr class="alt"><td>RH15-1</td>
<td>F2I11.90<BR>At5g11200</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=3776005">CAA09205</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AJ010466">AJ010466</a><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=8953382">CAB96655</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AL360314">AL360314</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF378868">AF378868</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g11200">DEAD BOX RNA helicase RH15 </A></td></tr>

<tr class="alt"><td>RH15-2</td>
<td>F2I11.60<BR>At5g11170</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=8953379">CAB96652</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AL360314">AL360314</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AY052303">AY052303</a></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g11170">DEAD BOX RNA helicase RH15 - like protein</A></td></tr>


<TR> <TD rowspan=3 valign=top><b>eIF4B</B> <br>Eukaryotic initiation factor 4B </td>      <TD>AteIF4B-1</TD>
	      <TD>F20C19.16<br>F20C19_12<br>At3g26400</TD>
	      <TD>AAF05869<br>AF021805<br>BAB02201<br>AP001298</TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g26400">eukaryotic translation initiation factor 4B, putative</A></TD></TR>	

<tr><td>AteIF4B-2</td>
<td>F3F19.4<BR>At1g13020</td>
<td>AAF27287<br>AF136007<br>AAD31055<br>AC007357</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g13020"> unknown protein</A></td></tr>
	  
<tr><td>4B-3?<br>Has similarity to eIF4B
                                                                                                     family, but is smaller; could
                                                                                                     be eIF4H??</td>
<td>F20M13.270<BR>At4g38710</td>
<td>CAB37527<br>AL035540</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g38710">putative protein </A></td></tr>



<tr class="alt"><td rowspan=3><b>eIF4E</b><br>eukaryotic initiation factor 4E</td>
<td>AteIF4E-1</td>
<td>F15J5.10<BR>At4g18040</td>
<td> CAA71580<br>Y10548<br>CAB53645<br>AL110123<br>AF389286</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18040">translation initiation factor eIF4E</A></td></tr>

<tr class="alt"><td>AteIF4E-2</td>
<td>F15D2.16<BR>At1g29590</td>
<td>AAG51734<br>AC068667</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29590">eukaryotic translation initiation factor 4E, putative </A></td></tr>

<tr class="alt"><td>AteIF4E-3</td>
<td>F15D2.13<BR>At1g29550</td>
<td>AAG51741<br>AC068667</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29550">eukaryotic translation initiation factor 4E, putative</A></td></tr>

<tr><td><b>eIFiso4E</b> <br>eukaryotic initiation factor 4E, isozyme form</td>
<td>AteIFiso4E-1</td>
<td>MJE4.8<BR>At5g35620</td>
<td>CAA71579<br>Y10547<br>BAB09303<br>AB013393<br>AY054630</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g35620">eIF4Eiso protein (emb|CAA71579.1) </A></td></tr>

<tr class="alt"><td><b>nCBP</b> <br> novel cap binding protein</td>
<td>unassigned-nCBP</td>
<td>MRG7.7<BR>At5g18110</td>
<td>AAC17220<br>AF028809<br>BAB09469<br>AB012246</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g18110">eukaryotic cap-binding protein (gb|AAC17220.1)</A></td></tr>

<tr><td><b>eIF4G </b><br>eukaryotic initiation factor 4G</td>
<td>AteIF4G-1</td>
<td> F27H5.30<BR>At3g60240</td>
<td>AAF73054<br>AF263518<br>CAB87861<br>AL163852</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g60240">protein synthesis initiation factor - like</A></td></tr>

<tr class="alt"><td rowspan=2><b>eIFiso4G</b><br>eukaryotic initiation factor 4G, isozyme form</td><td>AteIFiso4G-1</td>
<td>MTI20.13<BR>At5g57870</td>
<td>BAB08857<br>AB013396<br>AY050478<br>AY039535</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g57870">eukaryotic initiation factor 4, eIF4-like protein</A></td></tr>

<tr class="alt"><td>AteIFiso4G-2</td>
<td>T29E15.25<BR>At2g24050</td>
<td>AAC63673<br>AC005170</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24050">putative eukaryotic initiation factor 4, eIF4</A></td></tr>

<tr><td rowspan=3><b>eIF4G-like</b> <br>related to eIF4G </td>
<td>unassigned</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td></tr>

<tr><td>unassigned, similarity to 4G</td>
<td>F24O1.14<br>F24O1_43<BR>At1g62410</td>
<td>AAF70840<br>AC003113</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g62410">initiation factor isozyme 4F p82 subunit, putative</A></td></tr>

<tr><td>unassigned-mystery-4G-like-protein</td>
<td>T10C21.30<BR>At4g30680</td>
<td>CAB79786<br>AL161577</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g30680">translation initiation factor-like protein</A></td></tr>

<tr class="alt"><td rowspan=2><b>eIF5</b> <br>eukaryotic initiation factor 5</td>
<td>AteIF5-1</td>
<td>T32E8.15<br>F28K19_5<BR>At1g77840</td>
<td>AAG51628<br>AC012193</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77840">eukaryotic initiation factor 5 (eIF-5), putative</A></td></tr>

<tr class="alt"><td>AteIF5-2</td>
<td>T15P17.7<BR>At1g36730</td>
<td>AAG51259<br>AC025782</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g36730">Eukaryotic translation initiation factor 5, putative</A></td></tr>

<tr><td rowspan=3><b>eIF5A</b> <br>eukaryotic initiation factor 5A</td>
<td>AteIF5A-1</td>
<td>T24P13.1<br>At1g26630</td>
<td>AAF87023<br>AC006535<br>AY039588</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26630">initiation factor 5A-4, putative</A></td></tr>

<tr><td>AteIF5A-2</td>
<td>F10D13.8<br>F23O10_2<BR>At1g69410</td>
<td>AAG52496<br>AC018364<br>AF372933</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69410">Eukaryotic initiation factor 5A , putative</A></td></tr>

<tr><td>AteIF5A-3</td>
<td>F16A14.17<br>F7A19_4<BR>At1g13950</td>
<td>AAD39281<br>AC007576</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g13950">initiation factor 5A-4 </A></td></tr>

<tr class="alt"><td rowspan=5><b>eIF5B</b> <br>eukaryotic initiation factor 5B </td>
<td>AteIF5B-1</td>
<td>F28O16.18<BR>At1g76810</td>
<td>AAF04442<br>AC010718</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76810">translation initiation factor eIF-2, putative </A></td></tr>

<tr class="alt"><td>AteIF5B-2</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td></tr>

<tr class="alt"><td>AteIF5B-3</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td></tr>


<tr class="alt"><td>AteIF5B-4</td>
<td>T22I11.2<BR>At1g21160</td>
<td>AAF80646<br>AC012190</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g21160">translation initiation factor eIF-2, putative</A></td></tr>

<tr class="alt"><td>AteIF5B-5</td>
<td>&nbsp;</td>
<td>AAC73030<br>AC005824</td>
<td>&nbsp;</td></tr>

<tr><td rowspan=2><b>eIF6</b><br>eukaryotic initiation factor 6</td>
<td>AteIF6-1</td>
<td>F1I16.30<BR>At3g55620</td>
<td>CAB81587<br>AL161667</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55620">eukaryotic translation initiation factor 6 (EIF-6) - like protein</A></td></tr>

<tr><td>AteIF6-2</td>
<td>T5I7.12<BR>At2g39820</td>
<td>AAB87131<br>AC003000</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39820">putative translation initiation factor </A></td></tr>

<tr class="alt"><td rowspan=9><b>PABP</b> <br>poly(A) binding protein</td>
<td>AtPAB1</td>
<td>T20D16.2<BR>At2g23350</td>
<td>AAK25927<br>AF360217<br>AC002391<br>AAB87097<br>AY050859<br>AF360217</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g23350">putative poly(A) binding protein</A></td></tr>

<tr class="alt"><td>AtPAB2</td>
<td>F28A23.130<BR>At4g34110</td>
<td>AAA61780<br>L19418<br>CAA17561<br>AL021961</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34110">poly(A)-binding protein </A></td></tr>

<tr class="alt"><td>AtPAB3</td>
<td>T22J18.7<BR>At1g22760</td>
<td>AAG02117<br>AF293840<br>CAA72907<br>Y12227<br>AAC25510<br>AC003979<br>AY054490</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22760">putative polyA-binding protein, PAB3</A></td></tr>

<tr class="alt"><td>AtPAB5</td>
<td>F14O23.15<BR>At1g71770</td>
<td>AAA32832<br>M97657<br>AAF43230<br>AC012654</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71770">polyadenylate-binding protein 5</A></td></tr>

<tr class="alt"><td>PAB6??</td>
<td>MYA6.16<br>MYA6_12<BR>At3g16380</td>
<td>AAB63640<br>AC001645<br></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16380">putative poly(A) binding protein</A></td></tr>

<tr class="alt"><td>unnamed-PAB-like</td>
<td>F14J22.3<br>F14J22_7<BR>At1g49760</td>
<td>AAK43894<br>AF370517<br>AAG13056<br>AC011807</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g49760">poly(A)-binding protein, putative </A></td></tr>

<tr class="alt"><td>unnamed-PAB-like</td>
<td>F13K3.6<BR>At2g36660</td>
<td>AAD20142<br>AC006282<br></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36660">poly(A)-binding protein, putative</A></td></tr>

<tr class="alt"><td>unnamed-PAB-like</td>
<td><BR>At1g34140</td>
<td>AAG12523<br>AC015446</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34140">poly(A)-binding protein, putative</A></td></tr>

<tr class="alt"><td>PAB2??</td>
<td>MQN23.20<BR>At5g65250</td>
<td>AAK62429<br>AF386984<br>BAB11661<br>AB013395<br>AY045959<br>AF386984</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65250">expressed protein</A></td></tr>

<tr><td rowspan=4><b>EF1A</b><br>elongation factor 1A</td>
<td>AteEF1A-1</td>
<td>T6D22.2<BR>At1g07920</td>
<td>CAA34453<br>X16430<br>AAB07882<br>U63815<br>AAF79822<br>AC026875</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07920">elongation factor 1-alpha (EF-1-alpha)</A></td></tr>

<tr><td>AteEF1A-2</td>
<td>T6D22.31<br>T6D22_3<BR>At1g07930</td>
<td>CAA34455<br>X16431<br>AAB07883<br>U63815<br>AAK32834<br>AF361822</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07930">elongation factor 1-alpha (EF-1-alpha) </A></td></tr>

<tr><td>AteEF1A-3</td>
<td>T6D22.3<br>T6D22_14<BR>At1g07940</td>
<td>CAA34454<br>X16431<br>AAB07884<br>U63815<br>AC026875<br>AY039583</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07940">elongation factor 1-alpha (EF-1-alpha) </A></td></tr>

<tr><td>AteEF1A-4</td>
<td>MUF9.8<br>MUF9_40<BR>At5g60390</td>
<td>CAA34456<br>X16432<br>BAB08224<br>AB011483<br>AF360167</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60390">elongation factor 1-alpha (EF-1-alpha)</A></td></tr>

<tr class="alt"><td rowspan=2><b>EF1Balpha</b><br> elongation factor 1Balpha</td>
<td>AteEF1B-A1</td>
<td>MXC9.7<BR>At5g12110</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=6686819">CAB64729</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AJ249596">AJ249596</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=6686823">CAB64731</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AJ249598">AJ249598</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=9759378">BAB10029</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AB007727">AB007727</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g12110"> elongation factor 1B alpha-subunit (emb|CAB64729.1) </A></td></tr>

<tr class="alt"><td>AteEF1B-A2</td>
<td>T20D1.30<BR>At5g19510</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=6686821">CAB64730</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AJ249597">AJ249597</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=13430784">AAK26014</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF360304">AF360304</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g19510">elongation factor 1B alpha-subunit </A></td></tr>

<tr><td rowspan=2><b>EF1Bbeta</b><br>elongation factor 1Bbeta</td>
<td>AteEF1B-B1</td>
<td>F12P21.12<BR>At1g30230</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=398608">CAA52751</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=X74733"> X74733</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=12320854">AAG50564</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC073506">AC073506</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30230">elongation factor 1-beta, putative</A></td></tr>

<tr><td>AteEF1B-B2</td>
<td>T27K22.2<br>F8D23_11<BR>At2g18110</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=398606"> CAA52752</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=X74734"> X74734</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=4874292">AAD31355</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC007212">AC007212</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18110">putative elongation factor beta-1 </A></td></tr>

<tr class="alt"><td rowspan=2><b>EF1Bgamma</b> <br>elongation factor 1Bgamma</td>
<td>AteEF1B-G1</td>
<td>F21M12.3<BR>At1g09640</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=2160158">AAB60721</A><BR><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC000132">AC000132</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09640">expressed protein</A></td></tr>

<tr class="alt"><td>AteEF1B-G2</td>
<td>T8L23.18<BR>At1g57720</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=14334818">AAK59587</A><BR><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AY035082">AY035082</A><BR><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=12321359">AAG50755</A><BR><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF370502">AF370502</A><BR><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC079733">AC079733</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g57720">elongation factor 1B gamma, putative </A></td></tr>

<tr><td rowspan=2><b>EF2</b><BR>elongation factor 2</td>
<td>AteEF2-1</td>
<td>T6H22.24<br>T6H22_13<BR>At1g56070</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=13605865">AAK32918</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF367331">AF367331</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=6056373">AAF02837</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC009894">AC009894</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AY054461">AY054461</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF367331">AF367331</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g56070">pseudogene, putative elongation factor</A></td></tr>

<tr><td>AteEF2-2</td>
<td>MXC7.1<BR>At3g22980</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=9294187">BAB02089</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AB026655">AB026655</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g22980">elongation factor Tu family protein </A></td></tr>

<tr class="alt"><td rowspan=3><b>RF1</b> <br>release factor 1 </td>
<td>AteRF1-1</td>
<td>MCA23.22<BR>At5g47880</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=1155261">AAA91169</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=U40217">U40217</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=10177924">BAB11335</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AB016886">AB016886</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AY050462">AY050462</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g47880">eukaryotic release factor 1 homolog (gb|AAA91169.1)</A></td></tr>

<tr class="alt"><td>AteRF1-2</td>
<td>F13K23.17<br>F13K23_19<BR>At1g12920</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=8698738">AAF78496</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AC012187">AC012187</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AY034963">AY034963</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g12920">eukaryotic peptide chain release factor subunit 1, putative</A></td></tr>

<tr class="alt"><td>AteRF1-3</td>
<td>MLJ15.16<br>MLJ15_1<BR>At3g26618</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=1495249">CAA66118</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=X97486">X97486</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=16514">CAA49172</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=X69375">X69375</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=1402882">CAA66813</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=X98130">X98130</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g26618">Eukaryotic peptide chain release factor subunit 1 (ERF1)</A></td></tr>

<tr><td><b>RF3</b> <br>release factor 3</td>
<td>AteRF3-1</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td></tr>

<tr class="alt"><td><b>RF-S?</b><br>release factor S?</td>
<td>AteRF-S?</td>
<td>F12B17.20<BR>At5g10630</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AL353995">AL353995</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g10630">putative protein </A></td></tr>
      
</table>
	   <P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
