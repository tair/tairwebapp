<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Aquaporin Gene Families";
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
 

<h2><A NAME="Aquaporins"><b><i> Arabidopsis</i> Aquaporin Gene Families</B></A></h2>

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
	<th><b>TIGR Accession:</B></TH></TR>
      	

<tr class="alt">    <TD ROWSPAN=34 valign=top><B>Delta tonoplast integral protein family</B></TD><TD>&nbsp;</TD>	
	<TD>68069_m00151<BR>At1g31880</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31880">major intrinsic protein, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F23A5_10<BR>At1g80760</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6503288">AAF14664</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80760">nodulin-like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T18K17_14<BR>At1g73190</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S22201">S22201</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73190">tonoplast intrinsic protein, alpha (alpha-TIP)</a></TD></TR>
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F4I18.6 <BR>At2g45960</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02451">T02451</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g45960">aquaporin (plasma membrane intrinsic protein 1B)</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD> F28L1_3<BR>AT3g06100</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6862914">AAF30303</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g06100">putative major intrinsic protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MNJ7_4<BR>AT5g47450</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758773">BAB09071</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g47450">membrane channel protein-like; aquaporin (tonoplast intrinsic protein)-like</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F4P12_120<BR>AT3g53420</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=472877">CAA53477</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g53420">plasma membrane intrinsic protein 2a</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T1J8.1<BR>At2g36830</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S22202">S22202</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36830">putative aquaporin (tonoplast intrinsic protein gamma) </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T2N18.7<BR>At2g37170</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D84789">D84789</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37170">aquaporin (plasma membrane intrinsic protein 2B) </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T2N18.6<BR>At2g37180</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E84789">E84789</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37180">aquaporin (plasma membrane intrinsic protein 2C)</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>M4E13_150<BR>AT4g35100</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T05780">T05780</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g35100">plasma membrane intrinsic protein (SIMIP)</a></TD></TR>


<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T27A16.3<BR>At2g29870</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F84701">F84701</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29870">putative aquaporin (plasma membrane intrinsic protein)</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F22L4_12<BR>At1g01620</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=396218">CAA49155</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01620">plasma membrane intrinsic protein 1c, putative </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F2A19_30<BR>AT3g61430</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47935">T47935</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g61430">plasma membrane intrinsic protein 1a</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F28P10_200<BR>AT3g54820</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T06738">T06738</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g54820">aquaporin/MIP - like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F2H15_3<BR>At1g17810</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2605714">AAB84183</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17810">tonoplast intrinsic protein, putative</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T21L8_190<BR>AT3g47440</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T12999">T12999</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47440">aquaporin-like protein </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F12A24.3<BR>At2g16850</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A84545">A84545</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16850">putative aquaporin (plasma membrane intrinsic protein)</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T7F6.18<BR>At2g39010</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A84812">A84812</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39010">putative aquaporin (water channel protein)</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MYA6_6<BR>AT3g16240</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9279707">BAB01264</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g16240">delta tonoplast integral protein (delta-TIP)</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F9I5_3<BR>At1g52180</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6850340">AAF29403</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g52180">aquaporin, putative</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F16G20_100<BR>AT4g23400</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T05378">T05378</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g23400">water channel - like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F17H15.16<BR>At2g25810</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A84653">A84653</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25810">putative aquaporin (tonoplast intrinsic protein) </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>A_IG005I10_2<BR>AT4g00430</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01528">T01528</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g00430">probable plasma membrane intrinsic protein 1c </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>K22F20_50<BR>AT5g37810</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177171">BAB10360</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g37810">Membrane integral protein (MIP) -like</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>K22F20_60<BR>AT5g37820</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177172">BAB10361</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g37820">Membrane integral protein (MIP) -like</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>dl4705w<BR>AT4g17340</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F71442">F71442</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g17340">membrane channel like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F24G24_180<BR>AT4g10380</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4538967">CAB39791</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g10380">major intrinsic protein (MIP) - like </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T31E10.27<BR>At2g34390</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3128232">AAC26712</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34390">nodulin-26-like protein </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F11O4_1<BR>AT4g01470</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01947">T01947</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g01470">putative water channel protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MFE16_3<BR>AT3g26520</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9293929">BAB01832</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g26520">gamma tonoplast intrinsic protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F13C5_80<BR>AT4g18910</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2832619">CAA16748</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18910">major intrinsic protein (MIP)- like</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>mup24_70<BR>AT5g60660</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759330">BAB09839</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g60660">mipC protein - like (aquaporin)</a></TD></TR>
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F13C5_200<BR>AT4g19030</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H85214">H85214</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19030">nodulin-26 - like protein </a></TD></TR>

<TR>    <TD ROWSPAN=1 valign=top><B>Putative major intrinsic protein family</B></TD>	<TD>&nbsp;</TD>
	<TD>F26H11.22<BR>At2g21020</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B84596">B84596</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21020">putative nodulin protein</a></TD></TR>

	</TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
