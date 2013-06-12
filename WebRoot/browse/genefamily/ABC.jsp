<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - ABC Transporter Gene Family";
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
 

<A NAME="ABC"><h2><b><i> Arabidopsis</i> ABC Transporters</B></h2></A>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD> <TD><A HREF="http://www.cbs.umn.edu/arabidopsis/"> Arabidopsis Membrane Protein Library</A></td></tr>

<td valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Ward, J. (2001) <a href="/servlets/TairObject?type=publication&id=501680716">Identification of novel families of membrane proteins from the model plant <i>Arabidopsis thaliana</i>.</a> <i>Bioinformatics</i>, <b>17</b>, 560-563.</td></tr>

<TR><TD><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=6083"" target="display">John Ward</A></td></tr>

</TABLE> 

 <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<TH><B>TIGR Annotation:</TH>    </TR>
	    

<tr class="alt">    <TD ROWSPAN=16 valign=top><B>ABC transporter-like</B></TD>
        <TD>&nbsp;</TD>
        <TD>F17J16_190<BR>AT3g59140</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47796">T47796</A></TD>
      <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g59140" target="new">ABC transporter-like protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>MXL8_11<BR>AT3g21250</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9280227">BAB01717</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g21250" target="new">unknown protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T2O9_140<BR>AT3g60160</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47840">T47840</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g60160" target="new">multi resistance protein homolog</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T27I15_60<BR>AT3g60970</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T50518">T50518</a></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g60970" target="new">ABC transporter-like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F17A22.19<BR>At2g47800</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F84919">F84919</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47800" target="new">glutathione-conjugate transporter AtMRP4 </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F26K9_130<BR>AT3g62700</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48059">T48059</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g62700" target="new">ABC transporter-like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F3I17_2<BR>At1g71330</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6714334">AAF26026</a></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71330" target="new"> putative ABC transporter</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T4K22_1<BR>At1g30420</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12322120">AAG51094</a></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30420" target="new">hypothetical protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T4K22_13<BR>At1g30410</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12322126">AAG51100</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30410" target="new">ABC transporter, putative</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T4K22_12<BR>At1g30400</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12322122">AAG51096</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30400" target="new">glutathione S-conjugate transporting ATPase (AtMRP1) </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T5E7.1<BR>At2g07680</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F84487">F84487</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g07680" target="new"> putative ABC transporter</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T29F13.13<BR>At2g34660</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01369">T01369</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34660" target="new">ABC transporter (AtMRP2)</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F20D22_11<BR>At1g04120</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T52080">T52080</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04120" target="new">multi-drug resistance protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>MJG19_2<BR>AT3g13080</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10172595">BAB01399</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g13080" target="new">ABC transporter, putative</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>MJG19_3<BR>AT3g13090</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10172596">BAB01400</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g13090" target="new">ABC transporter, putative</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>MJG19_4<BR>AT3g13100</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10172597">BAB01401</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g13100" target="new">ABC transporter, putative</a></TD></TR>

<TR>	<TD rowspan=27 valign=top><B>P-glycoprotein-2</B></TD>
        <TD>&nbsp;</TD>
        <TD>MXF12_50<BR>AT5g39040</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177549">BAB10828</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g39040" target="new">ABC transporter -like protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>K11I1_13<BR>AT5g46540</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177591">BAB10822</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g46540" target="new">multidrug resistance p-glycoprotein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>MZF16_14<BR>AT3g28344</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=11994581">BAB02627</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g28344" target="new">P-glycoprotein, 5' partial</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>MFJ20_1<BR>AT3g28345</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=11994581">BAB02627</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g28345" target="new">P-glycoprotein, putative, 3'partial </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>MFJ20_3<BR>AT3g28360</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294571">BAB02852</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g28360" target="new">P-glycoprotein, putative</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>MFJ20_6<BR>AT3g28390</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294574">BAB02855</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g28390" target="new">P-glycoprotein, putative</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T1J8.9<BR>At2g36910 </TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A42150">A42150</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36910" target="new">putative ABC transporter </a></TD> </TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F14M4.17<BR>At2g47000</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02187">T02187</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47000" target="new">putative ABC transporter </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>MLD15_2<BR>AT3g28860</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294227">BAB02129</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g28860" target="new">P-glycoprotein, putative</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F8F6_120<BR>AT5g03910</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48418">T48418</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g03910" target="new">ABC transporter -like protein </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T5F17_70<BR>AT4g28620</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T10656">T10656</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g28620" target="new">ABC transporter - like protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T5F17_80<BR>AT4g28630</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9964117">AAG09827</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g28630" target="new">ABC transporter - like protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T17J13_110<BR>AT3g62150</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48007">T48007</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g62150" target="new">P-glycoprotein-like proetin</a></TD></TR>



<TR>	<TD>&nbsp;</TD>
        <TD>T26I12_200<BR>AT3g55320</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47671">T47671</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55320" target="new">P-glycoprotein - like</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
<TD>F12L6.14<BR>At2g39480</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00558">T00558</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39480" target="new">putative ABC transporter </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F13K9_5<BR>At1g27940</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12322992">AAG51482</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27940" target="new">P-glycoprotein, putative</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F13K9_11<BR>At1g28010</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12322986">AAG51476</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g28010" target="new">P-glycoprotein, putative</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>MCK7_14<BR>AT5g58270</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8777328">BAA96918</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g58270" target="new">ABC transporter-like protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T14P4_18<BR>At1g02530</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9972377">AAG10627</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02530" target="new">hypothetical protein</a></TD></TR>	

<TR>	<TD>&nbsp;</TD>
        <TD>T14P4_19<BR>At1g02520</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9972378">AAG10628</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02520" target="new">P-glycoprotein, putative</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F5A18_21<BR>At1g70610</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6453908">AAF09091</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70610" target="new">putative ABC transporter</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F20B24_12<BR>At1g10680</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6573748">AAF17668</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10680" target="new">P-glycoprotein, putative</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F15J5_20<BR>AT4g18050</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268557">CAB78807</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18050" target="new">multidrug resistance protein/P-glycoprotein - like </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T7B11_8<BR>AT4g01820</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268566">CAB80675</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g01820" target="new">P-glycoprotein-like protein pgp3</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T7B11_9<BR>AT4g01830</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268567">CAB80676</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g01830" target="new"> putative P-glycoprotein-like protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>M7J2_180<BR>AT4g25450</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T05802">T05802</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25450" target="new">putative P-glycoprotein-like protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F20B18_70<BR>AT4g25960</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04251">T04251</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25960" target="new">P-glycoprotein-2 (pgp2)</a></TD></TR>

<tr class="alt">    <TD ROWSPAN=26 valign=top><B>Putative ABC transporter</B></TD>
        <TD>&nbsp;</TD>
        <TD>T25B15_80<BR>AT3g52310</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T46101">T46101</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g52310" target="new">ABC transporter, putative</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T10F5.15<BR>At2g13610</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A84509">A84509</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g13610" target="new">putative ABC transporter</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>MSA6_13<BR>AT3g21090</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10092349">AAG12758</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g21090" target="new">ABC transporter, putative</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F10A8.20<BR>At2g01320</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C84423">C84423</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01320" target="new">putative ABC transporter </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F4P12_210<BR>AT3g53510</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T45891">T45891</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g53510" target="new">ABC transporter -like protein </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F27G19_20<BR>AT4g27420</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T08934">T08934</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g27420" target="new">putative protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F3G5.15<BR>At2g37360</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G84791">G84791</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37360" target="new">putative ABC transporter</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F7K24_160<BR>AT5g19410</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177100">BAB10434</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g19410" target="new">membrane transporter - like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F2H15_6<BR>At1g17840</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9665062">AAF97264</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17840" target="new">ABC transporter, putative</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>MSH12_4<BR>AT5g13580</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758023">BAB08684</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g13580" target="new">ABC transporter-like protein </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F5D21_6<BR>At1g51500</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10092349">AAG12758</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51500" target="new">ATP-dependent transmembrane transporter, putative</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F5D21_8<BR>At1g51460</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10092361">AAG12770</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51460" target="new"> ATP-dependent transmembrane transporter, putative</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T15C9_80<BR>AT3g55090</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47648">T47648</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55090" target="new">ABC transporter - like protein </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T15C9_100<BR>AT3g55100</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47649">T47649</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55100" target="new">ABC transporter - like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T15C9_110<BR>AT3g55110</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47650">T47650</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55110" target="new">ABC transporter - like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T26I12_10<BR>AT3g55130</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47652">T47652</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55130" target="new">ABC transporter - like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T16B24.1<BR>At2g39350</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02567">T02567</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39350" target="new">putative ABC transporter</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F15M7_6<BR>AT5g06530</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10178109">BAB11402</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g06530" target="new">ABC transporter-like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T5M7_4<BR>AT3g25620</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9229868">BAB00598</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g25620" target="new">membrane transporter, putative</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F12M16_17<BR>At1g53270</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7769856">AAF69534</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53270" target="new">hypothetical protein</a></TD></TR>	

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>MXC20_8<BR>AT5g52860</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177100">BAB10434</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g52860" target="new">ABC transporter-like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F17M19_11<BR>At1g71960</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6978921">AAF34313</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71960" target="new">putative ABC transporter</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F14M19_30<BR>AT4g25750</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04229">T04229</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25750" target="new">putative membrane transporter</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F24D13.14<BR>At2g28070</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D84680">D84680</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28070" target="new">putative ABC transporter </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>MJG19_16<BR>AT3g13220</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10172610">BAB01414</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g13220" target="new">ABC transporter</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>F27M3_2<BR>At1g31770</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12321303">AAG50724</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31770" target="new">hypothetical protein </a></TD></TR>

<TR>    <TD ROWSPAN=11 valign=top><B>Putative ABC transporter</B></TD>	       <TD>&nbsp;</TD>
        <TD>F1O11.1<BR>At2g36380</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A84780">A84780</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36380" target="new">putative ABC transporter protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T16N11_3<BR>At1g15520</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8072390">AAF71978</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15520" target="new">ABC transporter, putative</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F4P12_180<BR>AT3g53480</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T45888">T45888</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g53480" target="new">ABC transporter - like protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F3G5.7<BR>At2g37280</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G84790">G84790</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37280" target="new">putative ABC transporter</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F23F1.14<BR>At2g29940</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02491">T02491</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29940" target="new">putative ABC transporter </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T4O24_9<BR>At1g66950</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12320927">AAG50592</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66950" target="new"> unknown protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F23H11_19<BR>At1g59870</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5080820">AAD39329</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g59870" target="new">ABC transporter, putative</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>MYA6_15<BR>AT3g16340</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9279716">BAB01273</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g16340" target="new">putative ABC transporter </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>dl3660w<BR>AT4g15230</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268269">CAB78565</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15230" target="new">ABC transporter like protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F12C20.5<BR>At2g26910</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02644">T02644</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26910" target="new">putative ABC transporter </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F9L1_15<BR>At1g15210</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5103820">AAD39650</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15210" target="new"> putative ABC transporter</a></TD></TR>

<tr class="alt">    <TD ROWSPAN=3 valign=top><B>ABC-type transport-like</B></TD>	       <TD>&nbsp;</TD>
        <TD>k11j9_21<BR>AT5g61690</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758484">BAB09013</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g61690" target="new">ABC transport protein - like</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>mac9_30<BR>AT5g61730</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176866">BAB10073</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g61730" target="new">ABC transport protein - like</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
        <TD>T23J7_60<BR>AT3g47730</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T07712">T07712</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47730" target="new">ABC-type transport protein-like protein</a></TD></TR>

<TR>    <TD ROWSPAN=8 valign=top><B>ABC transporter-like</B></TD>	       <TD>&nbsp;</TD>
        <TD>k11j9_220<BR>AT5g61700</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176863">BAB10070</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g61700" target="new">ABC family transporter - like protein </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>mac9_40<BR>AT5g61740</TD>
        <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176867">BAB10074</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g61740" target="new">ABC family transporter - like protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T23J7_70<BR>AT3g47740</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T07713">T07713</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47740" target="new">ABC family transporter - like protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T23J7_80<BR>AT3g47750</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T07714">T07714</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47750" target="new">ABC family transporter - like protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T23J7_90<BR>AT3g47760</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T07715">T07715</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47760" target="new">ABC-type transport protein-like protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T23J7_100<BR>AT3g47770</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T07716">T07716</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47770" target="new"> ABC-type transport protein-like protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T23J7_110<BR>AT3g47780</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T07717">T07717</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47780" target="new">ABC-type transport protein-like protein    </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>T23J7_120<BR>AT3g47790</TD>
        <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T07718">T07718</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47790" target="new">ABC-type transport protein-like protein   </a></TD></TR>

<tr class="alt">    <TD ROWSPAN=2 valign=top><B>ABC transporter-like</B></TD>
        <TD>&nbsp;</TD>
	<TD>F12M16_28<BR>At1g53390</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7769862">AAF69540</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53390" target="new"> hypothetical protein  </a></TD></TR>

<tr class="alt">        <TD>&nbsp;</TD>
	<TD>mup24_150<BR>AT5g60740</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759338">BAB09847</A></TD>	
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g60740" target="new">xABC transporter - like protein</A></TD></TR>
    
<TR>    <TD ROWSPAN=1 valign=top><B>Putative ABC transporter</B></TD>
        <TD>&nbsp;</TD>
	<TD>T11A7.20<BR>At2g41700</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A84845">A84845</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g41700" target="new">putative ABC transporter   </a></TD></TR>


	
	
	</TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
