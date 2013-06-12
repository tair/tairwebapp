<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Inorganic Solute Cotransporter Gene Families";
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
 

<A NAME="Cotransporter"><h2>Inorganic Solute Cotransporter Gene Families</h2></A>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD> <TD><A HREF="http://www.cbs.umn.edu/arabidopsis/"> Arabidopsis Membrane Protein Library</A></td></tr>

<td valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Ward, J. (2001) <a href="/servlets/TairObject?type=publication&id=501680716">Identification of novel families of membrane proteins from the model plant <i>Arabidopsis thaliana</i>.</a> <i>Bioinformatics</i>, <b>17</b>, 560-563.</td></tr>

<TR><TD><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=6083"" target="display">John Ward</A></td></tr>
</table>




    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th>   </TR>
	    

<tr class="alt">    <TD ROWSPAN=12 valign=top><B>Putative sulfate transporter<br>family</B></TD>
<TD>&nbsp;</TD>
	<TD>T10P11_3<BR>AT4g02700</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01079">T01079</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g02700">sulfate transporter protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T26J12_13<BR>At1g23090</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2829902">AAC00610</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23090">putative sulphate transporter protein</A></TD></TR>
<tr class="alt">	<TD>&nbsp;</TD>
         <TD>MSL1_3<BR>AT3g15990</TD>
	 <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294446">BAB02665</A></TD>
         <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g15990">putative sulfate transporter</A></TD></TR>
	 
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T29J13_20<BR>AT5g19600</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48901">T48901</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g19600">putative protein </A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T6I14_80<BR>AT5g13550</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9955547">CAC05432</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g13550">sulfate transporter</A></TD></TR>
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MSL1_3<BR>AT3g15990</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294446">BAB02665</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g15990">putative sulfate transporter</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T3F12_7<BR>AT4g08620</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00946">T00946</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g08620">putative sulfate transporter</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F28K19_21<BR>At1g77990</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6573773">AAF17693</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77990">sulfate transporter, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F28K19_22<BR>At1g78000</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6573765">AAF17685</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78000">high affinity sulphate transporter, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T2E22_117<BR>AT3g12520</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10645530">AAG21641</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g12520">sulfate transporter, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F2E2_7<BR>At1g22150</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10716805">BAB16410</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22150">high affinity sulphate transporter, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T31P16_170<BR>AT5g10180</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T50022">T50022</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g10180">sulfate transporter</A></TD></TR>

<TR>    <TD ROWSPAN=2 valign=top><B>Putative sulfate transporter<BR>family</B></TD>	<TD>&nbsp;</TD>
	<TD>F5I6_6<BR>At1g80310</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6751706">AAF27688</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80310">putative sulfate transporter</A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>F3N11.13<BR>At2g25680</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D84651">D84651</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25680"> hypothetical protein</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=6 valign=top><B>Nramp2 family</B></TD>	<TD>AtNRAMP1</TD>
	<TD>F23A5_13<BR>At1g80830</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7108911">AAF36535</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80830">metal ion transporter </A></TD></TR>

<tr class="alt">	<TD>AtNRAMP6</TD>
	<TD>T24D18_6<BR>At1g15960</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6587802">AAF18493</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15960">metal ion transporter, putative</A></TD></TR>

<tr class="alt">	<TD>AtNRAMP3</TD>
	<TD>T20D16.22<BR>At2g23150</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00517">T00517</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g23150">putative metal ion transporter (Nramp)</A></TD></TR>

<tr class="alt">	<TD>AtNRAMP2</TD>
	<TD>F8G22_4<BR>At1g47240</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10092413">AAG12818</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g47240">natural resistance-associated macrophage protein family protein</A></TD></TR>

<tr class="alt">	<TD>AtNRAMP4</TD>
	<TD>K8K14_5<BR>AT5g67330</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758432">BAB09018</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g67330">natural resistance-associated macrophage protein</A></TD></TR>

<tr class="alt">	<TD>AtNRAMP5</TD>
	<TD>F28A21_200<BR>AT4g18790</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04871">T04871</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18790">ion transporter - like protein</A></TD></TR>

<TR>    <TD ROWSPAN=7 valign=top><B>High affinity nitrate transporter<BR>family</b></TD>	<TD>&nbsp;</TD>
	<TD>F14D17_130<BR>AT3g45060</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48982">T48982</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g45060">high-affinity nitrate transporter - like protein</A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>T6D22_6<BR>At1g08090</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T51836">T51836</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08090">high-affinity nitrate transporter NRT2 </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T6D22_7<BR>At1g08100</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3608364">AAC35884</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08100">high-affinity nitrate transporter ACH2</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T15N1_60<BR>AT5g14570</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48630">T48630</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g14570">high affinity nitrate transporter - like protein</A></TD></TR>	

<TR>	<TD>&nbsp;</TD>
	<TD>F13K23_15<BR>At1g12940</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3242062">CAB09794</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g12940">nitrate transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>mae1_20<BR>AT5g60770</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176905">BAB10098</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g60770">high-affinity nitrate transporter ACH1 - like protein </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>mae1_30<BR>AT5g60780</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176906">BAB10099</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g60780">high affinity nitrate transporter protein - like</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=11 valign=top><B>Fe(II) transporter isolog family</B></TD><TD>IRT2</TD>
	<TD>T16H5_40<BR>AT4g19680</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04750">T04750</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19680">putative Fe(II) transport protein</A></TD></TR>

<tr class="alt">	<TD>IRT1</TD>
	<TD>T16H5_50<BR>AT4g19690</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3250678">CAA19686 </A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19690">Fe(II) transport protein</A></TD></TR>

<tr class="alt">	<TD>ZIP5</TD>
	<TD>YUP8H12_8<BR>At1g05300</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2388566">AAB71447</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05300">putative zinc transporter</A></TD></TR>

<tr class="alt">	<TD>ZIP12</TD>
	<TD>mtg10_180<BR>AT5g62160</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176934">BAB10178 </A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g62160">iron-regulated transporter - like protein</A></TD></TR>
	
<tr class="alt">	<TD>ZIP6</TD>
	<TD>T27E13.18<BR>At2g30080</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3150412">AAC16964</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30080">putative Fe(II) transport protein </A></TD></TR>

<tr class="alt">	<TD>IRT3</TD>
	<TD>T7P1_10<BR>At1g60960</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6751686">AAF27669</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60960">putative iron-regulated transporter</A></TD></TR>

<tr class="alt">	<TD>ZIP3</TD>
	<TD>T32F6.21<BR>At2g32270</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3831472">AAC69954</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32270">putative Fe(II) transporter</A></TD></TR>

<tr class="alt">	<TD>ZIP4</TD>
	<TD>T19D16_11<BR>At1g10970</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1931645">AAB65480</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10970">ZIP4, a putative zinc transporter</A></TD></TR>

<tr class="alt">	<TD>ZIP9</TD>
	<TD>F26P21_140<BR>AT4g33020</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3688183">CAA21211</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33020">putative protein</A></TD></TR>

<tr class="alt">	<TD>ZIP1</TD>
	<TD>MBK21_11<BR>AT3g12750</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T52183">T52183</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g12750">putative zinc transporter</A></TD></TR>
	
<tr class="alt">	<TD>ZIP10</TD>
	<TD>T19E23_6<BR>At1g31260</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6692132">AAF24597</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31260">iron-regulated transporter protein, putative</A></TD></TR>

<TR>    <TD ROWSPAN=13 valign=top><B>Putative potassium transporter family</B></TD>	<TD>&nbsp;</TD>
	<TD>F18F4_60<BR>AT4g19960</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2827650">CAA16604</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19960">potassium transporter-like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T9E8_160<BR>AT4g13420</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4584547">CAB40777</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g13420">potassium transporter - like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T27E13.19<BR>At2g30070</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3150413">AAC16965</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30070">high affinity K+ transporter (AtKUP1/AtKT1p)</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T13D8_5<BR>At1g60160</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02268">T02268</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60160">potassium transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F1C9_17<BR>AT3g02050</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6513926">AAF14830</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g02050">putative potassium transporter</A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>T9L3_180<BR>AT5g14880</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T51433">T51433</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g14880">putative cation transport protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F9D16_110<BR>AT4g23640</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4454033">CAA23030</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g23640">putative potassium transport protein (TRH1)</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T2P4.11<BR>At2g40540</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2651303">AAB87583</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40540">putative potassium transporter </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F17O7_17<BR>At1g70300</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01493">T01493</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70300">potassium transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T5E8_200<BR>AT5g09400</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9955527">CAC05466</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g09400">potassium transport protein-like</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F28K20_5<BR>At1g31120</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3033401">AAC12845</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31120">putative potassium transporter </A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>F19I3.29<BR>At2g35060</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00487">T00487</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g35060">putative potassium transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T16L1_20<BR>AT4g33530</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E85394">E85394</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33530">putative potassium transporter AtKT5p (AtKT5) </A></TD></TR>

<tr class="alt">    <TD ROWSPAN=2 valign=top><B>Putative zinc transporter<BR>ZIP2 - like family</B></TD>	<TD>ZIP11</TD>
	<TD>F14J16_22<BR>At1g55910</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778309">AAF79318</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55910">hypothetical protein </A></TD></TR>

<tr class="alt">	<TD>ZIP2</TD>
	<TD>f2o15_180 <BR>AT5g59520</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T52184"> T52184</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g59520">putative zinc transporter ZIP2 - like</A></TD></TR>

<TR>    <TD ROWSPAN=2 valign=top><B>Cation-chloride co-transporter<BR>family</B></TD>	<TD>&nbsp;</TD>
	<TD>F10A8.16<BR>At2g01280</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4262235">AAD14528 </A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01280">putative transcription factor IIIB 70 KD subunit (TFIIIB)</A></TD></TR>

<TR>	<TD>AtCCC1</TD>
	<TD>F26G16_9<BR>At1g30450</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6634764">AAF19744</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30450">cation-chloride co-transporter, putative</A></TD></TR>
	
<tr class="alt">    <TD ROWSPAN=4 valign=top><B>Zinc transporter<BR>(ZAT) family</B></TD>	<TD>AtMTPb1</TD>
	<TD>F16P2.21<BR>At2g29410</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3980394">AAC95197</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29410">putative zinc transporter</A></TD></TR>

<tr class="alt">	<TD>ZAT<BR>(AtMTP1)</TD>
	<TD>F19D11.8<BR>At2g46800</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3510254">AAC33498</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46800">putative zinc transporter</A></TD></TR>

<tr class="alt">	<TD>AtMTPa1</TD>
	<TD>F21F14_110<BR>AT3g61940</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47986">T47986</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g61940">zinc transporter-like protein</A></TD></TR>

<tr class="alt">	<TD>AtMTPa2</TD>
	<TD>T20N10_160<BR>AT3g58810</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T49164">T49164</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g58810">zinc transporter -like protein</A></TD></TR>

<TR>    <TD ROWSPAN=5 valign=top><B>Ammonium transporter family</B></TD>	<TD>&nbsp;</TD>
	<TD>T6G15_60<BR>AT4g13510</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4678377">CAB41109</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g13510">ammonium transport protein (AMT1)</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F16A16_190<BR>AT4g28700</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4218128">CAA22982</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g28700">ammonium transporter - like protein </A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>K7M2_4<BR>AT3g24290</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5880355">AAD54638</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g24290">ammonium transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>K7M2_5<BR>AT3g24300</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5880355">AAD54638</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g24300">ammonium transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F13O11_9<BR>At1g64780</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5042414">AAD38253</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64780">ammonium transporter, puitative</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=3 valign=top><B>Putative potassium transporter<BR>family</B></TD>	<TD>AtKEA1</TD>
	<TD>T1N6_15<BR>At1g01790 </TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4101473">AAD01191</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01790 ">K Efflux antiporter KEA1 </A></TD></TR>

<tr class="alt">	<TD>AtKEA3</TD>
	<TD>T4B21_3<BR>AT4g04850</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A85061">A85061</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g04850">putative potassium transporter</A></TD></TR>

<tr class="alt">	<TD>AtKEA2</TD>
	<TD>F6N23_15<BR>AT4g00630</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267402">CAB80872</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g00630">putative potassium/H+ antiporter</A></TD></TR>
	
<TR>    <TD ROWSPAN=5 valign=top><B>Copper transport protein-like<BR>family</B></TD> <TD>&nbsp;</TD>
	<TD>T6H20_70<BR>AT3g46900</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T12958">T12958</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g46900">copper transport protein - like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T8P21.17<BR>At2g37920</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G84798">G84798</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37920">hypothetical protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T1M15_50<BR>AT5g20650</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g20650">putative protein</A></TD></TR>


<TR>	<TD>&nbsp;</TD>
	<TD>k18b18_10<BR>AT5g59030</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177631">BAB10779</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g59030">copper transport protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>k18b18_20<BR>AT5g59040</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g59040">copper transport protein - like</A></TD></TR>
	
<tr class="alt">    <TD ROWSPAN=9 valign=top><B>Inorganic phosphate transporter<BR>family</B></TD>	<TD>&nbsp;</TD>
	<TD>T5N23_60<BR>AT3g54700</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47629">T47629</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g54700">phosphate transport protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T7F6.11<BR>At2g38940</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C84811">C84811</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38940">phosphate transporter (AtPT2)</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F14G6_3<BR>At1g76430</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6642662">AAF20242</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76430">putative phosphate transporter</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MWF20_3<BR>AT5g43340</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3869190">BAA34390</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g43340">inorganic phosphate transporter (dbj|BAA34390.1) </A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MWF20_4<BR>AT5g43350</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8843888">BAA97414</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g43350">phosphate transporter (gb|AAB17265.1)</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MWF20_5<BR>AT5g43360</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2780347">BAA24281</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g43360">inorganic phosphate transporter (dbj|BAA24281.1)</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MWF20_6<BR>AT5g43370</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2780348">BAA24282</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g43370">inorganic phosphate transporter (dbj|BAA24282.1) </A></TD></TR>
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T21L14.23<BR>At2g32830</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2702279">AAB91982</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32830">putative phosphate transporter</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F9H16_16<BR>At1g20860</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20860">putative inorganic phosphate transporter protein</A></TD></TR>

<TR>    <TD ROWSPAN=1 valign=top><B>Ammonium transporter</B></TD>	<TD>&nbsp;</TD>
	<TD>F16M14.22<BR>At2g38290</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01260">T01260</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38290">putative ammonium transporter</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=1 valign=top><B>Sodium transporter</B></TD>	<TD>AtHKT1</TD>
	<TD>F24G24_110<BR>AT4g10310</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04046">T04046</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g10310">potassium uptake transporter - like protein</A></TD></TR>

<TR>    <TD ROWSPAN=1 valign=top><B>Putative phosphate permease</B></TD>	<TD>&nbsp;</TD>
	<TD>MFE16_9<BR>AT3g26570</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9293936">BAB01839</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g26570">phosphate transporter, putative</A></TD></TR>
</TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
