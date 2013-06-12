<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR -  Amino Acid/Auxin Permease Family";
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
 
<A NAME="AAAP"><b><h2>The Amino Acid/Auxin Permease (AAAP) Family</h2></B></A>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD> <TD><A HREF="http://www.cbs.umn.edu/arabidopsis/"> Arabidopsis Membrane Protein Library</A></td></tr>

<td valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Ward, J. (2001) <a href="/servlets/TairObject?type=publication&id=501680716">Identification of novel families of membrane proteins from the model plant <i>Arabidopsis thaliana</i>.</a> <i>Bioinformatics</i>, <b>17</b>, 560-563.</td></tr>

<TR><TD><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=6083" target="display">John Ward</A></td></tr>

</TABLE> 


  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</B></TH></TR>	    


<tr class="alt"> <TD ROWSPAN=43 valign=top><B>AAAP family</B></TD>   <TD>&nbsp;</TD>
	<TD>F1O11.22<BR>At2g36590</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D84782">D84782</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36590">putative proline transporter</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F12B7_20<BR>At1g67640</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6382531">AAF07813</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67640">putative amino acid permease</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F28J7_9<BR>AT3g01760</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6091720">AAF03432</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01760">putative amino acid permease</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T7O23_19<BR>At1g44100</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=608673">CAA54632 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g44100">amino acid permease, putative</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>K2A18_5<BR>AT5g65990</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177114">BAB10404</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g65990">amino acid transporter protein-like</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F11P17_1<BR>At1g61270</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2443875">AAB71468</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61270">lysine and histidine specific transporter, putative</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F5E19_80<BR>AT5g16740</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9755726"> CAC01838 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g16740">putative protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>K16L22_8<BR>AT5g41800</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177364">BAB10655 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g41800">amino acid permease-like protein; proline transporter-like protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T32E8_2<BR>At1g77690</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12323298">AAG51630</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77690">putative AUX1-like permease</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T28M21.5<BR>At2g39890</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1769901">CAA65052</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39890">proline transporter 1</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F2G14_60<BR>AT5g14940</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9755661"> CAC01813</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g14940">oligopeptide transporter -like protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T7H20_220<BR>AT5g02170</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7340691">CAB82990 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g02170">putative protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F2J7_5<BR>At1g25530</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F86385">F86385</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g25530">hypothetical protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>K1B16_3<BR>AT5g40780</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177957">BAB11340 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g40780">amino acid permease</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T3K9.4<BR>At2g41190</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3402699">AAD11993</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g41190">unknown protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T6J22_16<BR>AT3g30390</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294342">BAB02239</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g30390">putative amino acid permease</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T23G18_9<BR>At1g08230</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6579208">AAF18251 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08230">hypothetical protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>K5K13_7<BR>AT3g28960</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7939546">BAA95749</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g28960">putative amino acid permease</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T27I1_3<BR>At1g10010</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3540179">AAC34329</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10010">putative amino acid permease</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F16M14.5<BR>At2g38120</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1531758">CAA67308</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38120">unknown protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F26K24_19<BR>AT3g11900</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6671946">AAF23206 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g11900">putative amino acid permease</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MKD10_120<BR>AT5g38820</TD>
	<TD>&nbsp;</TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g38820">transporter -like protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T21F11_16<BR>At1g80510</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A96837">A96837</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80510">hypothetical protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T7H20_230<BR>AT5g02180</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7340692"> CAB82991 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g02180">putative protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MGI19_5<BR>AT5g63850</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177673">BAB11033</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g63850">amino acid transporter AAP4 (pir||S51169)</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F3L24_20<BR>AT3g09330</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6478926">AAF14031 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g09330">putative amino acid permease</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F3L24_21<BR>AT3g09340</TD>
	<TD>&nbsp;</TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g09340">putative amino acid permease</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T7F6.30<BR>At2g39130</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6598488">AAC79623</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39130">unknown protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MNI5_1<BR>AT5g49630</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1769887">CAA65051 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g49630">amino acid permease 6 (emb|CAA65051.1)</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F8M21_130<BR>AT5g15240</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7671493">CAB89334 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g15240">putative protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F19C14_3<BR>At1g58360</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=22641">CAA47603 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g58360">amino acid permease I</A></TD></TR>

<tr class="alt">     <TD>&nbsp;</TD>
	<TD>F11I4_17<BR>At1g48640</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12597815"> AAG60126</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48640">lysine and histidine specific transporter, putative</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F16N3_4<BR>At1g47670</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F96517">F96517</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g47670"> hypothetical protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F26H11.19<BR>At2g21050</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4803938">AAD29811</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21050">AUX1-like amino acid permease</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T5E8_20<BR>AT5g09220</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=510236">CAA50672 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g09220">amino acid transport protein AAP2</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F14O23_2<BR>At1g71680</TD>
	<TD>&nbsp;</TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71680"> unknown protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F18O21_160<BR>AT3g56200</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7572918">CAB87419 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g56200">putative amino acid permease</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F21J9_260<BR>At1g24400</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9293860">BAB01766 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24400">putative lysine/histidine-specific permease</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F22I13_20<BR>AT4g38250</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4539333">CAB37481</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38250">putative protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F28P10_190<BR>AT3g54830</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4678310">CAB41101 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g54830">putative amino acid permease</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F2P24_9<BR>At1g77380</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=11079491">AAG29203 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77380">amino acid carrier, putative</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MRO11_15<BR>AT5g23810</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176848">BAB10054</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g23810">amino acid transporter</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T12J5_50<BR>AT4g35180</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7270469">CAB80235</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g35180">amino acid permease - like protein</A></TD></TR>
	</TABLE>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
