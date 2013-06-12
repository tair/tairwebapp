<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - ABC superfamily";
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

<h2><A NAME="ABC_proteins"><b>Arabidopsis ABC superfamily</B></A></h2>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD> 
<TD>Sanchez-Fernandez, R.,Davies, T. G.,Coleman, J. O.,Rea, P. A. (2001)
<A HREF="/servlets/TairObject?type=publication&id=501680567" target="display">The Arabidopsis thaliana ABC Protein Superfamily, a Complete Inventory.
</A> Journal of Biological Chemistry. 276: 30231-44.
</TD></TR>

<TD valign=top><B>Gene Family<BR>Summary:</B></TD>
<TD>ATP binding cassette proteins are molecule transporters which contain one or two ATP-binding cassettes or nucleotide binding folds. Each NBF contains Walker A and B boxes separated by an ABC signature motif. ABC proteins also contain two or three hydrophobic integral membrane domains each of which contains four to six transmembrane-helices. </TD></TR>

<TR><TD valign=top><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=7102" target="display"> Rocio Sanchez-Fernandez</A><br><A HREF="/servlets/Community?action=view&type=person&communityID=4559" target="display"> Philip A. Rea</a><br><A HREF="/servlets/Community?action=view&type=person&communityID=444" target="display"> Emyr Davies</A></TD></TR>

</TABLE> 

<TABLE align="center" border="1" cellspacing="0" cellpadding="2">
    

	 

<TR><th><b>Gene Family<BR>Name:</b></th>
   <th><b>Protein Name:</b></th>
   <th><b>Genomic Locus:</b></th>
   <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th>
	 </TR>
	  

<tr class="alt"><TD ROWSPAN=22 valign=top><B>MDR subfamily</B></TD>
	<TD>AtMDR1<br>(PGP1)</TD>
	<TD>T1J8_9<BR>At2g36910</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD31576&doptcmdl=GenPept" target="display">AAD31576</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36910" target="display2">putative ABC transporter</A></TD></TR>
	
<tr class="alt">	<TD>AtMDR2<br>(PGP2)</TD>
	<TD>F20B18_70<BR>At4g25960</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB79451&doptcmdl=GenPept" target="display">CAB79451</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g25960" target="display2">P-glycoprotein-2 (pgp2)</A></TD></TR>

<tr class="alt">	<TD>AtMDR3<br>(PGP3)</TD>
	<TD>T7B11_8<BR>At4g01820</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB80675&doptcmdl=GenPept" target="display">CAB80675</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g01820" target="display2">P-glycoprotein-like protein pgp3</A></TD></TR>

<tr class="alt">	<TD>AtMDR4</TD>
	<TD>F14M4_17<BR>At2g47000</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC34225&doptcmdl=GenPept" target="display">AAC34225</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47000" target="display2">putative ABC transporter</A></TD></TR>

<tr class="alt">	<TD>AtMDR5</TD>
	<TD>T7B11_9<BR>At4g01830</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB80676&doptcmdl=GenPept" target="display">CAB80676</A><br>
	<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD22645&doptcmdl=GenPept">AAD22645</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g01830" target="display2">putative P-glycoprotein-like protein</A></TD></TR>

<tr class="alt">	<TD>AtMDR6</TD>
	<TD>F12L6_14<BR>At2g39480</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC27839&doptcmdl=GenPept" target="display">AAC27839</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39480" target="display2">putative ABC transporter</A></TD></TR>

<tr class="alt">	<TD>AtMDR7</TD>
	<TD>K11I1_13<BR>At5g46540</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10822&doptcmdl=GenPept" target="display">BAB10822</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g46540" target="display2">multidrug resistance p-glycoprotein</A></TD></TR>

<tr class="alt">	<TD>AtMDR8</TD>
	     <td>T14P4.15 (N)<br>T14P4_19 (M)<BR>At1g02520</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG10628&doptcmdl=GenPept" target="display">AAG10628</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02520" target="display2">P-glycoprotein, putative</A></TD></TR>

<tr class="alt">	<TD>AtMDR9</TD>
	<TD>F15J5_20<BR>At4g18050</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78807&doptcmdl=GenPept" target="display">CAB78807</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18050" target="display2">multidrug resistance protein/P-glycoprotein - like</A></TD></TR>

<tr class="alt">	<TD>AtMDR10</TD>
	<TD>F20B24_12<BR>At1g10680</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF17668&doptcmdl=GenPept" target="display">AAF17668</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10680" target="display2">P-glycoprotein, putative</A></TD></TR>

<tr class="alt">	<TD>AtMDR11</TD>
	<TD>MLD15_2<BR>At3g28860</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02129&doptcmdl=GenPept" target="display">BAB02129</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g28860" target="display2">P-glycoprotein, putative</A></TD></TR>

<tr class="alt">	<TD>AtMDR12</TD>
	<TD>F13K9_11<BR>At1g28010</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51476&doptcmdl=GenPept" target="display">AAG51476</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g28010" target="display2">P-glycoprotein, putative</A></TD></TR>

<tr class="alt">	<TD>AtMDR13</TD>
	     <td>MFJ20_1+<br>+MZF16_14 (M)<br>=MZF16.16 (N)<BR>At3g28345+<br>+At3g28344</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02627&doptcmdl=GenPept" target="display">BAB02627</A></TD>
   <TD>&nbsp;</TD></TR>

<tr class="alt">	<TD>AtMDR14</TD>
	<TD>T26I12_200<BR>At3g55320</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB75766&doptcmdl=GenPept" target="display">CAB75766</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55320">P-glycoprotein - like</A></TD></TR>

<tr class="alt">	<TD>AtMDR15</TD>
	<TD>F13K9_5<BR>At1g27940</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51482&doptcmdl=GenPept" target="display">AAG51482</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27940" target="display2">P-glycoprotein, putative</A></TD></TR>

<tr class="alt">	<TD>AtMDR16</TD>
	         <td>T14P4.14 (N)<br>T14P4_18 (M)<BR>At1g02530</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG10627&doptcmdl=GenPept" target="display">AAG10627</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02530" target="display2">hypothetical protein</A></TD></TR>

<tr class="alt">	<TD>AtMDR17</TD>
	<TD>T17J13_110<BR>At3g62150</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB71875&doptcmdl=GenPept" target="display">CAB71875</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g62150" target="display2">P-glycoprotein-like proetin</A></TD></TR>

<tr class="alt">	<TD>AtMDR18</TD>
     <td>MFJ20.4 (N)<br>MFJ20_3 (M)<BR>At3g28360</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02852&doptcmdl=GenPept" target="display">BAB02852</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g28360" target="display2">P-glycoprotein, putative</A></TD></TR>

<tr class="alt">	<TD>AtMDR19</TD>
     <td>MFJ20.6 (N)<br>MFJ20_5 (M)<BR>At3g28380</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02854&doptcmdl=GenPept" target="display">BAB02854</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g28380" target="display2">P-glycoprotein, putative</A></TD></TR>

<tr class="alt">	<TD>AtMDR20</TD>
     <td>MFJ20.7 (N)<br>MFJ20_6 (M)<BR>At3g28390</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02855&doptcmdl=GenPept" target="display">BAB02855</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g28390" target="display2">P-glycoprotein, putative</A></TD></TR>

<tr class="alt">	<TD>AtMDR21</TD>
	<TD>MFJ20.11 (N)<br>&nbsp;</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02858&doptcmdl=GenPept" target="display">BAB02858</A></TD>
   <TD>&nbsp;</TD></TR>

<tr class="alt">	<TD>AtMDR22</TD>
	<TD>MJI6.16 <br>MJI6_4<br>&nbsp;</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02613&doptcmdl=GenPept" target="display2">BAB02613</A></TD>
   <TD>&nbsp;</TD></TR>

<TR><TD ROWSPAN=15 valign=top><B>MRP subfamily</b></td>
 <TD>AtMRP1</TD>
	<TD>T4K22_12<BR>At1g30400</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51096&doptcmdl=GenPept" target="display">AAG51096</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30400" target="display2">glutathione S-conjugate transporting ATPase (AtMRP1)</A></TD></TR>

<Tr>	<TD>AtMRP2</TD>
	     <td>T29F13_13<BR>At2g34660</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC16268&doptcmdl=GenPept" target="display">AAC16268</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34660" target="display2">ABC transporter (AtMRP2)</A></TD></TR>
	
<TR>	<TD>AtMRP3</TD>
     <td>MJG19.3 (N)<br>MJG19_2 (M)<BR>At3g13080</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB01399&doptcmdl=GenPept" target="display">BAB01399</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13080" target="display2">ABC transporter, putative</A></TD></TR>

<TR>	<TD>AtMRP4</TD>
	<TD>F17A22_19<BR>At2g47800</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC63634&doptcmdl=GenPept" target="display">AAC63634</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47800" target="display2">glutathione-conjugate transporter AtMRP4</A></TD></TR>

<TR>	<TD>AtMRP5</TD>
	<TD>F20D22_11<BR>At1g04120</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC16754&doptcmdl=GenPept" target="display">AAC16754</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04120" target="display2">multi-drug resistance protein</A></TD></TR>

<TR>	<TD>AtMRP6</TD>
	<TD>MXL8_11<BR>At3g21250</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB01717&doptcmdl=GenPept" target="display">BAB01717</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g21250" target="display2">unknown protein</A></TD></TR>

<TR>	<TD>AtMRP7</TD>
	     <td>MJG19.5 (N)<br>MJG19_4 (M)<BR>At3g13100</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB01401&doptcmdl=GenPept" target="display">BAB01401</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13100" target="display2">ABC transporter, putative</A></TD></TR>

<TR>	<TD>AtMRP8</TD>
     <td>MJG19.4 (N)<br>MJG19_3 (M)<BR>At3g13090</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB01400&doptcmdl=GenPept" target="display">BAB01400</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13090" target="display2">ABC transporter, putative</A></TD></TR>

<TR>	<TD>AtMRP9</TD>
	<TD>T2O9_140<BR>At3g60160</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB75931&doptcmdl=GenPept" target="display">CAB75931</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g60160" target="display2">multi resistance protein homolog</A></TD></TR>

<TR>	<TD>AtMRP10</TD>
	<TD>F26K9_130<BR>At3g62700</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB83120&doptcmdl=GenPept" target="display">CAB83120</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g62700" target="display2">ABC transporter-like protein</A></TD></TR>

<TR>	<TD>AtMRP11</TD>
	<TD>T5E7_1<BR>At2g07680</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD37023&doptcmdl=GenPept" target="display">AAD37023</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g07680" target="display2">putative ABC transporter</A></TD></TR>


<TR>	<TD>AtMRP12</TD>
	<TD>T4K22_1 =<br>= F26G16.1<BR>At1g30420</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF19743&doptcmdl=GenPept" target="display">AAF19743</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30420" target="display2">ABC transporter, putative</A></TD></TR>

<TR>	<TD>AtMRP13</TD>
	<TD>T4K22_13<BR>At1g30410</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG50592&doptcmdl=GenPept" target="display">AAG50592</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30410" target="display2">ABC transporter, putative</A></TD></TR>


	
<TR>	<TD>AtMRP14</TD>
	<TD>F17J16_190<BR>At3g59140</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB86942&doptcmdl=GenPept" target="display">CAB86942</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g59140" target="display2">ABC transporter-like protein</A></TD></TR>

<TR>	<TD>AtMRP15</TD>
	<TD>T27I15_60<BR>At3g60970</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB94133&doptcmdl=GenPept" target="display">CAB94133</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g60970" target="display2">ABC transporter-like protein</A></TD></TR>

<tr class="alt"><TD ROWSPAN=13 valign=top><B>PDR subfamily</b></td>	<TD>AtPDR1</TD>
	<TD>MYA6.14 (N)<br>MYA6_15 (M)<BR>At3g16340</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB01273&doptcmdl=GenPept" target="display">BAB01273</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16340" target="display2">putative ABC transporter</A></TD></TR>

<tr class="alt">	<TD>AtPDR2</TD>
	<TD>ATFCA0<BR>At4g15220 At4g15230</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78564&doptcmdl=GenPept" target="display">CAB78564+</A><br><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78565&doptcmdl=GenPept">CAB78565</A></TD>
   <TD>&nbsp;</TD></TR>

<tr class="alt">	<TD>AtPDR3</TD>
	<TD>F23F1_14<BR>At2g29940</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC31858&doptcmdl=GenPept" target="display">AAC31858</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29940">putative ABC transporter</A></TD></TR>

<tr class="alt">	<TD>AtPDR4</TD>
	<TD>F12C20_5<BR>At2g26910</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC32236&doptcmdl=GenPept" target="display">AAC32236</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26910" target="display2">putative ABC transporter</A></TD></TR>

<tr class="alt">	<TD>AtPDR5</TD>
	<TD>F3G5_7<BR>At2g37280</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC98048&doptcmdl=GenPept" target="display">AAC98048</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37280" target="display2">putative ABC transporter</A></TD></TR>

<tr class="alt">	<TD>AtPDR6</TD>
	<TD>F1O11_1<BR>At2g36380</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD24623&doptcmdl=GenPept" target="display">AAD24623</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36380" target="display2">putative ABC transporter</A></TD></TR>

<tr class="alt">	<TD>AtPDR7</TD>
	<TD>F9L1_15<BR>At1g15210</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD39650&doptcmdl=GenPept" target="display">AAD39650</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15210" target="display2">putative ABC transporter</A></TD></TR>

<tr class="alt">	<TD>AtPDR8</TD>
	<TD>F23H11_19<BR>At1g59870</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD39329&doptcmdl=GenPept" target="display">AAD39329</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g59870" target="display2">ABC transporter, putative</A></TD></TR>

	<tr class="alt">	<TD>AtPDR9</TD>
	<TD>F4P12_180<BR>At3g53480</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB67655&doptcmdl=GenPept" target="display">CAB67655</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g53480" target="display2">ABC transporter - like protein</A></TD></TR>

<tr class="alt">	<TD>AtPDR10</TD>
	     <td>MJI6.3<br>MJI6_10<BR>&nbsp;</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02609&doptcmdl=GenPept" target="display">BAB02609</A></TD>
   <TD>&nbsp;</TD></TR>

<tr class="alt">	<TD>AtPDR11</TD>
	<TD>F1O19.3 (N)<br>F1O19_2 (M)<BR>At1g61020</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF71978&doptcmdl=GenPept" target="display">AAF71978</A></TD>
   <TD>&nbsp;</TD></TR>

	
<tr class="alt">	<TD>AtPDR12</TD>
	<TD>T16N11_3<BR>At1g15520</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF71978&doptcmdl=GenPept" target="display">AAF71978</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15520" target="display2">ABC transporter, putative</A></TD></TR>

	<tr class="alt">	<TD>AtPDR13</TD>
	<TD>T4O24_9<BR>At1g66950</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG31197&doptcmdl=GenPept" target="display">AAG50592</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66950" target="display2">ABC transporter, putative</A></TD></TR>

<TR><TD ROWSPAN=1 valign=top><B>AOH subfamily</b></td>	<TD>AtAOH1</TD>
	<TD>T11A7_20<BR>At2g41700</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC02761&doptcmdl=GenPept" target="display">AAC02761</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g41700" target="display2">hypothetical protein</A></TD></TR>

<tr class="alt"><TD ROWSPAN=2 valign=top><B>PMP subfamily</b></td>	<TD>AtPMP1</TD>
	<TD>F20D21_17<BR>At1g54350</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD25615&doptcmdl=GenPept" target="display">AAD25615</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54350" target="display2">hypothetical protein</A></TD></TR>

<tr class="alt">	<TD>AtPMP2</TD>
	<TD>T5J17_20<BR>At4g39850</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB80648&doptcmdl=GenPept" target="display">CAB80648</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g39850" target="display2">putative protein</A></TD></TR>

<TR><TD ROWSPAN=29 valign=top><B>WBC subfamily</b></td>	<TD>AtWBC1</TD>
	<TD>T16B24_1<BR>At2g39350</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC28975&doptcmdl=GenPept" target="display">AAC28975</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39350" target="display2">putative ABC transporter</A></TD></TR>

<TR>	<TD>AtWBC2</TD>
	<TD>F3G5_15<BR>At2g37360</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC98055&doptcmdl=GenPept" target="display">AAC98055</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37360" target="display2">putative ABC transporter</A></TD></TR>

<TR>	<TD>AtWBC3</TD>
	<TD>F24D13_14<BR>At2g28070</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC98459&doptcmdl=GenPept" target="display">AAC98459</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28070" target="display2">putative ABC transporter</A></TD></TR>

<TR>	<TD>AtWBC4</TD>
	<TD>F14M19_30<BR>At4g25750</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB81385&doptcmdl=GenPept" target="display">CAB81385</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g25750" target="display2">putative membrane transporter</A></TD></TR>

<TR>	<TD>AtWBC5</TD>
	<TD>T10F5_15<BR>At2g13610</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD22683&doptcmdl=GenPept" target="display">AAD22683</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g13610" target="display2">putative ABC transporter</A></TD></TR>

<TR>	<TD>AtWBC6</TD>
	<TD>MSH12_4<BR>At5g13580</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB08684&doptcmdl=GenPept" target="display">BAB08684</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g13580" target="display2">ABC transporter-like protein</A></TD></TR>

<TR>	<TD>AtWBC7</TD>
	<TD>F10A8_20<BR>At2g01320</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD14532&doptcmdl=GenPept" target="display">AAD14532</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01320" target="display2">putative membrane transporter</A></TD></TR>

<TR>	<TD>AtWBC8</TD>
	<TD>MXC20_8<BR>At5g52860</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10434&doptcmdl=GenPept" target="display">BAB10434</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g52860" target="display2">ABC transporter-like protein</A></TD></TR>

<TR>	<TD>AtWBC9</TD>
	<TD>F27G19_20<BR>At4g27420</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB81392&doptcmdl=GenPept" target="display">CAB81392</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g27420" target="display2">putative protein</A></TD></TR>

<TR>	<TD>AtWBC10</TD>
	<TD>F12M16_17<BR>At1g53270</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF69534&doptcmdl=GenPept" target="display">AAF69534 
   </A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53270" target="display2">hypothetical protein</A></TD></TR>

<TR>	<TD>AtWBC11</TD>
	     <td>F2H15.7 (N)<BR>At1g17840</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF97264&doptcmdl=GenPept" target="display">AAF97264</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17840" target="display2">ABC transporter, putative</A></TD></TR>

<TR>	<TD>AtWBC12</TD>
	<TD>F5D21_6<BR>At1g51500</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52619&doptcmdl=GenPept" target="display">AAG52619</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51500" target="display2">ATP-dependent transmembrane transporter, putative</A></TD></TR>

<TR>	<TD>AtWBC13</TD>
	<TD>F5D21_8<BR>At1g51460</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52631&doptcmdl=GenPept" target="display">AAG52631</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51460" target="display2">ATP-dependent transmembrane transporter, putative</A></TD></TR>

<TR>	<TD>AtWBC14</TD>
     <td>F27M3_2 = =F5M6_22<BR>At1g31770</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&amp;db=Protein&amp;term=AAG50724&amp;doptcmdl=GenPept" target="display">AAG50724</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31770" target="display2">ABC transporter, putative</A></TD></TR>

<TR>	<TD>AtWBC15</TD>
	<TD>MSA6_1<BR>At3g21090</TD> 
	<TD>&nbsp;</TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g21090" target="display2">ABC transporter, putative</A></TD></TR>

<TR>	<TD>AtWBC16</TD>
	<TD>T15C9_80<BR>At3g55090</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB82704&doptcmdl=GenPept" target="display">CAB82704</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55090" target="display2">ABC transporter - like protein</A></TD></TR>

<Tr>	<TD>AtWBC17</TD>
	<TD>T15C9_100<BR>At3g55100</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB82705&doptcmdl=GenPept" target="display">CAB82705</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55100" target="display2">ABC transporter - like protein</A></TD></TR>

<TR>	<TD>AtWBC18</TD>
	<TD>T15C9_110<BR>At3g55110</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB82706&doptcmdl=GenPept" target="display">CAB82706</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55110" target="display2">ABC transporter - like protein</A></TD></TR>

<TR>	<TD>AtWBC19</TD>
	<TD>T26I12_10<BR>At3g55130</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB75747&doptcmdl=GenPept" target="display">CAB75747</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55130" target="display2">ABC transporter - like protein</A></TD></TR>

<TR>	<TD>AtWBC20</TD>
	<TD>F4P12_210<BR>At3g53510</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB67658&doptcmdl=GenPept" target="display">CAB67658</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g53510" target="display2">ABC transporter -like protein</A></TD></TR>


<TR>	<TD>AtWBC21</TD>
	     <td>T5M7.6 (N)<BR>At3g25620</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB03081&doptcmdl=GenPept" target="display">BAB03081</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g25620" target="display2">membrane transporter, putative</A></TD></TR>

<TR>	<TD>AtWBC22</TD>
	<TD>MSA6_13<BR>At3g21090</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB01452&doptcmdl=GenPept" target="display">BAB01452</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g21090" target="display2">ABC transporter, putative</A></TD></TR>

<TR>	<TD>AtWBC23</TD>
	<TD>F15M7_6<BR>At5g06530</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB11402&doptcmdl=GenPept" target="display">BAB11402</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g06530" target="display2">ABC transporter-like protein</A></TD></TR>

<TR>	<TD>AtWBC24</TD>
	<TD>F7K24_160<BR>At5g19410</TD> 
	<TD>&nbsp;</TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g19410" target="display2">membrane transporter - like protein</A></TD></TR>

<TR>	<TD>AtWBC25</TD>
	<TD>F12M16_28<BR>At1g53390</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF69540&doptcmdl=GenPept" target="display">AAF69540</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53390" target="display2">hypothetical protein</A></TD></TR>

<TR>	<TD>AtWBC26</TD>
     <td>F17M19_11 =<br>= F28P5<BR>At1g71960</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52231&doptcmdl=GenPept" target="display">AAG52231</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71960" target="display2">putative ABC transporter</A></TD></TR>

<TR>	<TD>AtWBC27</TD>
	     <td>MJG19.19 (N)<br>MJG19_16 (M)<BR>At3g13220</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB01414&doptcmdl=GenPept" target="display">BAB01414</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13220" target="display2">ABC transporter</A></TD></TR>

<TR>	<TD>AtWBC28</TD>
	<TD>T25B15_80<BR>At3g52310</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC07922&doptcmdl=GenPept" target="display">CAC07922</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g52310" target="display2">ABC transporter, putative</A></TD></TR>

<TR>	<TD>AtWBC29</TD>
	<TD>mup24_150<BR>At5g60740</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB09847&doptcmdl=GenPept" target="display">BAB09847</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60740" target="display2">xABC transporter - like protein</A></TD></TR>

<tr class="alt"><TD ROWSPAN=16 valign=top><B>ATH subfamily</B></td>	<TD>AtATH1</TD>
	<TD>T23J7_60<BR>At3g47730</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB41856&doptcmdl=GenPept" target="display">CAB41856</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47730" target="display2">ABC-type transport protein-like protein</A></TD></TR>

<tr class="alt">	<TD>AtATH2</TD>
	<TD>T23J7_70<BR>At3g47740</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB41857&doptcmdl=GenPept" target="display">CAB41857</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47740" target="display2">ABC-type transport protein-like protein</A></TD></TR>

<tr class="alt">	<TD>AtATH3</TD>
	<TD>T23J7_80<BR>At3g47750</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB41858&doptcmdl=GenPept" target="display">CAB41858</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47750" target="display2">ABC-type transport protein-like protein</A></TD></TR>

<tr class="alt">	<TD>AtATH4</TD>
	<TD>T23J7_90<BR>At3g47760</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB41859&doptcmdl=GenPept" target="display">CAB41859</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47760" target="display2">ABC-type transport protein-like protein</A></TD></TR>

<tr class="alt">	<TD>AtATH5</TD>
	<TD>T23J7_100<BR>At3g47770</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB41860&doptcmdl=GenPept" target="display">CAB41860</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47770" target="display2">ABC-type transport protein-like protein</A></TD></TR>

<tr class="alt">	<TD>AtATH6</TD>
	<TD>T23J7_110<BR>At3g47780</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB41861&doptcmdl=GenPept" target="display">CAB41861</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47780" target="display2">ABC-type transport protein-like protein</A></TD></TR>

<tr class="alt">	<TD>AtATH7</TD>
	<TD>T23J7_120<BR>At3g47790</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB41862&doptcmdl=GenPept" target="display">CAB41862</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47790" target="display2">ABC-type transport protein-like protein</A></TD></TR>

<tr class="alt">	<TD>AtATH8</TD>
	<TD>T16B24_17<BR>At2g39190</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC28988&doptcmdl=GenPept" target="display">AAC28988</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39190" target="display2">putative ABC transporter</A></TD></TR>

<tr class="alt">	<TD>AtATH9</TD>
	<TD>T29M21_25<BR>At2g40090</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAB95294&doptcmdl=GenPept">AAB95294</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40090" target="display2">putative ABC1 protein</A></TD></TR>	

	
<tr class="alt">	<TD>AtATH10</TD>
	<TD>T15B16_14<BR>At4g01660</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB77736&doptcmdl=GenPept" target="display">CAB77736</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g01660" target="display2">putative ABC transporter</A></TD></TR>	


<tr class="alt">	<TD>AtATH11</TD>
	<TD>MAC9.4 (N)<br>mac9_30 (M)<BR>At5g61730</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10073&doptcmdl=GenPept" target="display">BAB10073</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g61730" target="display2">ABC transport protein - like</A></TD></TR>

<tr class="alt">	<TD>AtATH12</TD>
     <td>F8F6_120 =<br>= MED24<BR>At5g03910</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB85511&doptcmdl=GenPept" target="display">CAB85511</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g03910" target="display2">ABC transporter -like protein</A></TD></TR>

<tr class="alt">	<TD>AtATH13</TD>
	<TD>MXK3_17<BR>At5g64940</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAA97306&doptcmdl=GenPept" target="display">BAA97306</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g64940" target="display2">ABC transporter-like</A></TD></TR>

<tr class="alt">	<TD>AtATH14</TD>
	     <td>MAC9.5 (N)<br>mac9_40 (M)<BR>At5g61740</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10074&doptcmdl=GenPept" target="display">BAB10074</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g61740" target="display2">ABC family transporter - like protein</A></TD></TR>

<tr class="alt">	<TD>AtATH15</TD>
	<TD>K11J9_210<BR>At5g61690</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB09013&doptcmdl=GenPept" target="display">BAB09013</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g61690" target="display2">ABC transport protein - like</A></TD></TR>

<tr class="alt">	<TD>AtATH16</TD>
	     <td>MAC9.1 (N)<br>K11J9_23 (M)<BR>At5g61700</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10070&doptcmdl=GenPept" target="display">BAB10070</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g61700" target="display2">ABC family transporter - like protein</A></TD></TR>

<TR>	<TD ROWSPAN=3 valign=top><B>ATM subfamily</b></td><TD>AtATM1</TD>
	<TD>T5F17_80<BR>At4g28630</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB81451&doptcmdl=GenPept" target="display">CAB81451</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g28630" target="display2">ABC transporter - like protein</A></TD></TR>

<TR>	<TD>AtATM2</TD>
	<TD>T5F17_70<BR>At4g28620</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB81450&doptcmdl=GenPept" target="display">CAB81450</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g28620" target="display2">ABC transporter - like protein</A></TD></TR>

<TR>	<TD>AtATM3<br>(STA1)</TD>
	<TD>MCK7_14<BR>At5g58270</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAA96918&doptcmdl=GenPept" target="display">BAA96918</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG09829&doptcmdl=GenPept" target="display">AAG09829</a></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58270" target="display2">ABC transporter-like protein</A></TD></TR>

<tr class="alt"><TD ROWSPAN=2 valign=top><B>TAP subfamily</b></td>	<TD>AtTAP1</TD>
	<TD>F5A18_21 = <br>= F24J13_18<BR>At1g70610</TD> 
	<TD><A HREF="<a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52334&doptcmdl=GenPept" target="display">AAG52334</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52466&doptcmdl=GenPept" target="display">AAG52466</a></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70610" target="display2">putative ABC transporter</A></TD></TR>

<tr class="alt">	<TD>AtTAP2</TD>
	     <td>MXF12.6 (N)<br>MXF12_50 (M)<BR>At5g39040</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10828&doptcmdl=GenPept" target="display">BAB10828</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g39040" target="display2">ABC transporter -like protein</A></TD></TR>

<TR><TD ROWSPAN=2 valign=top><B>RLI subfamily</b></td>	<TD>AtRLI1</TD>
	<TD>MMM17_3<BR>At3g13640</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB01911&doptcmdl=GenPept" target="display">BAB01911</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13640" target="display2">RNase L inhibitor, putative</A></TD></TR>

<TR>	<TD>AtRLI2</TD>
	<TD>T18B16_180<BR>At4g19210</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78923&doptcmdl=GenPept" target="display">CAB78923</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g19210" target="display2">RNase L inhibitor-like protein</A></TD></TR>

<tr class="alt">	<TD ROWSPAN=5 valign=top><B>GCN subfamily</b></td><TD>AtGCN1</TD>
	<TD>MAE1_40<BR>At5g60790</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10100&doptcmdl=GenPept" target="display">BAB10100</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60790" target="display2">ABC transporter homolog PnATH - like</A></TD></TR>

<tr class="alt">	<TD>AtGCN2</TD>
	<TD>MYH9_14<BR>At5g09930</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB09414&doptcmdl=GenPept" target="display">BAB09414</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g09930" target="display2">ABC transporter, ATP-binding protein-like</A></TD></TR>

<tr class="alt">	<TD>AtGCN3</TD>
	     <td>F1N19.11(N)<br>F1N19_12(M)<BR>At1g64550</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF19673&doptcmdl=GenPept" target="display">AAF19673</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64550" target="display2">ABC transporter protein, putative</A></TD></TR>

<tr class="alt">	<TD>AtGCN4</TD>
	<TD>T14E10_110<BR>At3g54540</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB77574&doptcmdl=GenPept" target="display">CAB77574</A></TD>
   <TD>&nbsp;</TD></TR>

<tr class="alt">	<TD>AtGCN5</TD>
	<TD>MXK3_6<BR>At5g64840</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAA97296&doptcmdl=GenPept" target="display">BAA97296</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g64840">ABC transporter protein 1-like</A></TD></TR>

<TR><TD ROWSPAN=4 valign=top><B>SMC subfamily</b></td>	<TD>AtSMC1</TD>
	<TD>T5N23_30<BR>At3g54670</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB77587&doptcmdl=GenPept" target="display">CAB77587</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g54670" target="display2">structural maintenance of chromosomes (SMC) - like protein</A></TD></TR>

<TR>	<TD>AtSMC2</TD>
	<TD>F1P2_10<BR>At3g47460</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB61972&doptcmdl=GenPept" target="display">CAB61972</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47460" target="display2">chromosome assembly protein homolog</A></TD></TR>

<TR>	<TD>AtSMC3</TD>
	<TD>K15N18_7<BR>At5g48600</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10693&doptcmdl=GenPept" target="display">BAB10693</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g48600" target="display2">chromosome condensation protein</A></TD></TR>

<TR>	<TD>AtSMC4</TD>
	     <td>MMI9.24 (N)<br>mmi9_230 (M)<BR>At5g62410</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB11491&doptcmdl=GenPept" target="display">BAB11491</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g62410" target="display2">chromosomal protein - like</A></TD></TR>

<tr class="alt"><TD ROWSPAN=15 valign=top><B>NAP subfamily</b></td>	<TD>AtNAP1<br>(LAF6)</TD>
	<TD>T4B21_16<BR>At4g04770</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB80842&doptcmdl=GenPept" target="display">CAB80842</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD03441&doptcmdl=GenPept" target="display">AAD03441</a></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g04770" target="display2">putative ABC transporter</A></TD></TR>


<tr class="alt">	<TD>AtNAP2<br>(POP1)</td>
   	<TD>MLN1_3<BR>At5g44110</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10978&doptcmdl=GenPept" target="display">BAB10978</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD20643&doptcmdl=GenPept" target="display">AAD20643</a></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g44110" target="display2">NBD-like protein (gb|AAD20643.1)</A></TD></TR>

<tr class="alt">	<TD>AtNAP3</TD>
	<TD>T23K23_21<BR>At1g67940</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52004&doptcmdl=GenPept" target="display">AAG52004</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67940" target="display2">putative ABC transporter</A></TD></TR>

<tr class="alt">	<TD>AtNAP4</TD>
	<TD>F21M11_17<BR>At1g03900</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB68198&doptcmdl=GenPept" target="display">CAB68198</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g03900" target="display2">unknown protein</A></TD></TR>

<tr class="alt">	<TD>AtNAP5</TD>
	<TD>F3I17_2<BR>At1g71330</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51884&doptcmdl=GenPept" target="display">AAG51884</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71330" target="display2">putative ABC transporter</A></TD></TR>

<tr class="alt">	<TD>AtNAP6</TD>
	     <td>F5D14.28 (N)<br>F5D14_26 (M)<BR>At1g32500</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF81348&doptcmdl=GenPept" target="display">AAF81348</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32500" target="display2">hypothetical protein</A></TD></TR>

<tr class="alt">	<TD>AtNAP7</TD>
	     <td>F13M14_4 F18K10_29<BR>At3g10670</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51398&doptcmdl=GenPept" target="display">AAG51398</A><br><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF76373&doptcmdl=GenPept" target="display">AAF76373</a></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g10670" target="display2">putative ABC transporter ATPase</A></TD></TR>

<tr class="alt">	<TD>AtNAP8</TD>
	<TD>M7J2_180<BR>At4g25450</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB81355&doptcmdl=GenPept" target="display">CAB81355</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g25450" target="display2">putative protein</A></TD></TR>

<tr class="alt">	<TD>AtNAP9</TD>
	<TD>T1E22_30<BR>At5g02270</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB85532&doptcmdl=GenPept" target="display">CAB85532</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g02270" target="display2">ABC transporter -like protein</A></TD></TR>

<tr class="alt">	<TD>AtNAP10</TD>
	<TD>F9N12_11<BR>At1g63270</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52155&doptcmdl=GenPept" target="display">AAG52155</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g63270" target="display2">hypothetical protein</A></TD></TR>

<tr class="alt">	<TD>AtNAP11</TD>
	<TD>T8F5_19<BR>At1g65410</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC27147&doptcmdl=GenPept" target="display">AAC27147</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65410" target="display2">hypothetical protein</A></TD></TR>

<tr class="alt">	<TD>AtNAP12</TD>
	<TD>T1J8_19<BR>At2g37010</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD31586&doptcmdl=GenPept" target="display">AAD31586</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37010" target="display2">putative ABC transporter</A></TD></TR>

<tr class="alt">	<TD>AtNAP13</TD>
	<TD>F17M5_220<BR>At4g33460</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB80063&doptcmdl=GenPept" target="display">CAB80063</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g33460" target="display2">putative protein</A></TD></TR>

<tr class="alt">	<TD>AtNAP14</TD>
	<TD>MUA22_10<BR>At5g14100</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB08289&doptcmdl=GenPept" target="display">BAB08289</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g14100" target="display2">expressed protein</A></TD></TR>

<tr class="alt">	<TD>AtNAP15</TD>
	<TD>F17I23_360<BR>At4g30300</TD> 
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB81023&doptcmdl=GenPept" target="display">CAB81023</A></TD>
   <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g30300" target="dispay2">RNase L inhibitor-like protein</A></TD></TR>


	</TABLE>

<BR>
<tr><td colspan="5"><p><font size="2">(N): code according to the NCBI database (<a href="http://www.ncbi.nlm.nih.gov/">http://www.ncbi.nlm.nih.gov/</a>) 
          </font></p></td></tr>
<tr><td colspan="5">       <p><font size="2">(M): code according to the MIPS database (<a href="http://www.mips.biochem.mpg.de/proj/thal/">http://www.mips.biochem.mpg.de/proj/thal/</a>) 
          </font></p></td></tr>
      </td>

	

<tr><td colspan="5"><A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
