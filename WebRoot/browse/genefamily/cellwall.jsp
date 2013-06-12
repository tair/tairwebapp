<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Cell Wall Biosynthesis Gene Families";
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
 

<A NAME="cellwall"><h2><i>Arabidopsis</i> Plant Cell Wall Biosynthesis Gene Families</A></h2>
<TABLE><TR>

<TD valign=top><B>Source:</B></TD>
<TD><A HREF="http://cellwall.stanford.edu/"> CELL WALL</A></TD></TR>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD> </TD></TR>

<TR><TD><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=4778" target="display">Todd Richmond</A></TD></TR>

</TABLE>

    <p>

 
<TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
    
        
<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
        <th><b>TIGR Annotation:</B></TH>
      </TR>

<tr class="alt">
  <TD ROWSPAN= 10 valign=top><B>Cellulose Synthase;</B><BR><B>AtCesA</B></TD>
  <TD>CesA01</TD>
  <TD>F8B4_110<BR>AT4g32410</TD>
  <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T05351">T05351</A></TD>
  <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g32410">cellulose synthase catalytic subunit (RSW1)</A></TD></TR>

<tr class="alt">
  <TD>CesA02</TD>
  <TD>T22F8_250<BR>AT4g39350</TD>
  <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T08583">T08583</A></TD>
  <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g39350">cellulose synthase catalytic subunit (Ath-A)</A></TD>
</TR>


  
<tr class="alt">
  <TD>CesA03</TD>
  <TD>K2A11_4<BR>AT5g05170</TD>
  <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759258">BAB09693</A></TD>
  <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g05170">cellulose synthase catalytic subunit (gb|AAC39336.1)</A></TD></TR>

<tr class="alt">
  <TD>CesA04</TD>
  <TD>MRH10_14<BR>AT5g44030</TD>
  <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758562">BAB09063</A></TD> <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g44030">cellulose synthase catalytic subunit-like protein</A></TD> </TR>

<tr class="alt">
  <TD>CesA05</TD>
  <TD>MYH9_8<BR>AT5g09870</TD>
  <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758965">BAB09408</A></TD> <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g09870">cellulose synthase catalytic subunit </A></TD> </TR>

 <tr class="alt">
  <TD>CesA06</TD>
  <TD>MVP7_7<BR>AT5g64740</TD>
  <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177205">BAB10307</A></TD>
  <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64740">cellulose synthase catalytic subunit</A></TD></TR>

<tr class="alt">
  <TD>CesA07</TD>
  <TD>T10B6_80<BR>AT5g17420</TD>
  <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T51579">T51579</A></TD> <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g17420">cellulose synthase catalytic subunit (IRX3)</A></TD> </TR>

 <tr class="alt">
  <TD>CesA08</TD>
  <TD>F28A21_190<br>AT4g18780</TD>
  <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04870">T04870</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18780">cellulose synthase - like protein</A></TD>
</TR>

<tr class="alt">
  <TD>CesA09</TD>
  <TD>F7D8.9<BR>At2g21770</TD>
  <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H84604">H84604</A></TD> <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21770">putative cellulose synthase catalytic subunit </A></TD> </TR>

<tr class="alt">
  <TD>CesA10</TD>
  <TD>F13B15.20<BR>At2g25540</TD>
  <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F84649">F84649</A></TD> <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25540">putative cellulose synthase catalytic subunit</A></TD> </TR>  
  
<TR>
      <TD ROWSPAN= 9 valign=top><B>Cellulose Synthase-like;</B><BR><B>AtCslA</B></TD>
      <TD>AtCslA01</TD>
      <TD>FCA6</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</td></TR>

<TR>
      <TD>AtCslA02</TD>
      <TD>MDJ22</TD>
      <TD>&nbsp;</TD>
       <TD>&nbsp;</td></TR>
<TR>
      <TD>AtCslA03</TD>
      <TD>F5O8</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</td></TR>
<TR>
      <TD>AtCslA07</TD>
      <TD>T20F21</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</td></TR>

<TR>
      <TD>AtCslA09</TD>
      <TD>MED24</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</td></TR>

<TR>
      <TD>AtCslA10</TD>
      <TD>T23E23</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</td></TR>

<TR>
      <TD>AtCslA11</TD>
      <TD>T21H19</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</td></TR>
<TR>
      <TD>AtCslA14</TD>
      <TD>F27K19</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</td></TR>

<TR>
      <TD>AtCslA15</TD>
      <TD>T9E8</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</td></TR>	  
	  
<tr class="alt">
    <TD Rowspan= 6 valign=top><B>Cellulose Synthase-like;</B><BR><B>AtCslB</B></TD>
    <TD>AtCslB01</TD>
    <TD>T26B15.9<BR>At2g32530</TD>
    <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3298541">AAC25935</A></TD>
    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32530">putative cellulose synthase</A></td></TR>

<tr class="alt">
    <TD>AtCslB02</TD>   
    <TD>T26B15.10<BR>At2g32540</TD>
    <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3298542">AAC25936</A></TD>
    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32540">putative cellulose synthase</A></td></TR>

<TR bgcolor=
D5D9DD >
    <TD>AtCslB03</TD>
    <TD>T26B15.17<BR>At2g32610</TD>
    <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3298549">AAC25943</A></TD>
    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32610">putative cellulose synthase</A></td></TR>

 <tr class="alt">
    <TD>AtCslB04</TD>
    <TD>T26B15.18<BR>At2g32620</TD>
    <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3298550">AAC25944</A></TD>
    <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32620">putative cellulose synthase</A></td></TR>

<tr class="alt">
    <TD>AtCslB05</TD>
    <TD>FCA3</TD>
    <TD>&nbsp;</TD>
    <TD>&nbsp;</td></TR>

<tr class="alt">
    <TD>AtCslB06</TD>
    <TD>FCA3</TD>
    <TD>&nbsp;</TD>
    <TD>&nbsp;</td></TR>    
<TR>

      <TD Rowspan=5 valign=top><B>Cellulose Synthase-like;</B><BR><B>AtCslC</B></TD>
      <TD>AtCslC04</TD>
      <TD>MIG10</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</td></TR>

<TR>

      <TD>AtCslC05</TD>
      <TD>F3L17</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</td></TR>

<TR>
      <TD>AtCslC06</TD>
      <TD>F21O3</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</td></TR>

<TR>

      <TD>AtCslC08</TD>
      <TD>F25P17</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</td></TR>

<TR>
      <TD>AtCslC12</TD>
      <TD>F1K3</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</td></TR>


<tr class="alt">

      <TD ROWSPAN=6 valign=top><B>Cellulose Synthase-like;</B><BR><B>AtCslD</B></TD>
      <TD>AtCslD1</TD>
      <TD>F25I18_16<BR>At2g33100</TD>
      <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2924781">AAC04910</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33100">putative cellulose synthase</A></TD></TR>

<TR bgcolor=
D5D9DD >

      <TD>AtCslD2</TD>
      <TD>F2K13_60<BR>AT5g16910</TD>
      <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9755692">CAC01704</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g16910">cellulose synthase catalytic subunit -like protein </A></TD></TR>

<tr class="alt">

      <TD>AtCslD3<BR>(<i>KOJAK</i>)</TD>   
      <TD>T17B22_26<BR>AT3g03050</TD>
      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AF232907.1">AF232907</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g03050">putative cellulose synthase catalytic subunit</A></TD> </TR>

<tr class="alt">
      <TD>AtCslD4</TD>
      <TD>F20D10_310<BR>AT4g38190</TD>
      <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4467125">CAB37559</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38190">putative protein</A></TD></TR>

<tr class="alt">

      <TD>AtCslD5</TD>
      <TD>F22D16</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</TD>	  
</TR>

<tr class="alt">

      <TD>AtCslD6</TD>
      <TD>F3C3_4<BR>At1g32180</TD>
      <TD><A HREF="http://www3.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAG23436.1&form=6&db=p&Dopt=g">AAG23436</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32180">cellulose synthase catalytic subunit, putative</A></TD></TR>


      
<TR>    <TD valign=top><B>Cellulose Synthase-like;<BR>AtCslE</B></TD>
	<TD>AtCslE1</TD>
	<TD>F14J16_20<BR>At1g55850</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778304">AAF79313</A></TD>   
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55850">cellulose synthase catalytic subunit, putative</A></TD></TR>
	
<tr class="alt">    <TD Rowspan= 3 valign=top><B>Cellulose Synthase-like;</B><BR><B>AtCslG</B></TD>
	<TD>AtCslG1</TD>
	<TD>T32A16_160<BR>AT4g23990</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4972103">CAB43899</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g23990">cellulose synthase catalytic subunit - like protein</A></TD></TR>

<tr class="alt">	<TD>AtCslG2</TD>
	<TD>T32A16_170<BR>AT4g24000</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4972104">CAB43900</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g24000">putative protein</A></TD></TR>

<tr class="alt">    <TD>AtCslG3</TD>
	<TD>T32A16_180<BR>AT4g24010</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4972105">CAB43901</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g24010">putative protein</A></TD></TR>


<TR>    <TD ROWSPAN= 12 valign=top><B>Glucan Synthase-like;</B><BR><B>AtGsl</B></TD>
	<TD>AtGsl01</TD>
	<TD>C17L7</TD>    
	<TD>&nbsp;</TD>
        <TD>&nbsp;</TD></TR>

<TR>    <TD>AtGsl02</TD>
	<TD>F13J11</TD>
	<TD>&nbsp;</TD>
        <TD>&nbsp;</TD></TR>
	
<TR>    <TD>AtGsl03</TD>
	<TD>F20M17</TD>
	<TD>&nbsp;</TD>
        <TD>&nbsp;</TD></TR>

<TR>    <TD>AtGsl04</TD>
	<TD>MIE1_7<BR>AT3g14570</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294379">BAB02389</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g14570">hypothetical protein</A></TD></TR>

<TR>    <TD>AtGsl05</TD>
	<TD>T5L23</TD>
	<TD>&nbsp;</TD>
        <TD>&nbsp;</TD></TR>

<TR>    <TD>AtGsl06</TD>
	<TD>T25N20</TD>
	<TD>&nbsp;</TD>
        <TD>&nbsp;</TD></TR>

<TR>    <TD>AtGsl07</TD>
	<TD>F12K11_26<BR>At1g06490</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294379">BAB02389</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06490">glucan synthase, putative</A></TD></TR>
	
<TR>    <TD>AtGsl08</TD>
	<TD>T1J8.3<BR>At2g36850</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4883602">AAD31571</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36850">putative glucan synthase</A></TD></TR>

<TR>    <TD>AtGsl09</TD>
	<TD>F5H8_100<BR>AT5g36870</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8953707">BAA98065</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g36870">putative glucan synthase</A></TD> </TR>


<TR>    <TD>AtGsl10</TD>
	<TD>T1B9_18<BR>AT3g07160</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6642649">AAF20230</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07160">putative glucan synthase</A></TD></TR>

<TR>    <TD>AtGsl11</TD>
	<TD>F17J16_150<BR>AT3g59100</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47792">T47792</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g59100">putative protein</A></TD></TR>

<TR>    <TD>AtGsl12</TD>
	<TD>T24H18_170<BR>AT5g13000</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T49914">T49914</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g13000">callose synthase catalytic subunit -like protein </A></TD></TR>


	    
</TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
