<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Gene Family : Response Regulator";
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
<h2><i>Arabidopsis</i> Response Regulator Gene Family</h2>

<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><LI><b>Sheen, J.</b> (2002) <a href="/servlets/TairObject?type=publication&id=501681603">Phosphorelay and transcription control in cytokinin signal transduction.</a> Science <b>296:</b> 1650-1652
<BR><LI><b>Hwang, I. and Sheen, J.</b> (2001) <a href="/servlets/TairObject?type=publication&id=501680564">Two-component circuitry in Arabidopsis cytokinin signal transduction.</a> Nature <b>413: </b>383-389
<BR><LI><b>Hwang, I, Chen, H.-C. and Sheen. J.</b> (2002) <a href="/servlets/TairObject?type=publication&id=501681565">Two-Component Signal Transduction Pathways in Arabidopsis.</a> Plant Physiology <b>129:</b> 500-515 
<br><li><a href=http://genetics.mgh.harvard.edu/sheenweb/ target=new>The Sheen Lab Web Page</A></TD></TR>

<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Please refer to the papers above for more details. </td></tr>

<TR><TD valign=top><B>Contact:</b></td>
<td><A HREF=/servlets/Community?action=view&type=person&communityID=6184 target="new">Jen Sheen</A>
<br>
<a href="/servlets/Community?action=view&type=person&communityID=10719" target=new>Ildoo Hwang</a>
<br>
<a href="/servlets/Community?action=view&type=person&communityID=218" target=new>Yanxia Liu</A>
<br>
<a href="/servlets/Community?action=view&type=person&communityID=1113137" target=new>Cheri Chen</A>

</td></tr>

</table><p>
  



<TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation:</B></TH>

         </TR>

<tr class="alt"><td colspan=5><b>A- Type</b></td></tr>
<tr class="alt"><td rowspan=11 valign=top><b>Response Regulator</b></td>

       <td>ARR3 </td>

       <td>F23H11.25<br><a href=/servlets/TairObject?type=locus&name=At1g59940 target="new">At1g59940</A></td>

       <td>AAD39333</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g59940 target="new">response regulator 3</A></td>

        </tr>
<tr class="alt">

       <td>ARR4 (ATRR1)</td>

       <td>T10O24.8<br><a href=/servlets/TairObject?type=locus&name=At1g10470 target="new">At1g10470</A></td>

       <td>AAD39568</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10470 target="new">putative response regulator 3 </A></td>

        </tr>
<tr class="alt">

       <td>ARR5 (ATRR2)</td>

       <td>T17F15.30<br><a href=/servlets/TairObject?type=locus&name=At3g48100 target="new">At3g48100</A></td>

       <td>CAB41129</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g48100 target="new">response reactor 2 (ATRR2) </A></td>

        </tr>
<tr class="alt">

       <td>ARR6 </td>

       <td>MQB2.220<br><a href=/servlets/TairObject?type=locus&name=At5g62920 target="new">At5g62920</A></td>

       <td>BAB10861</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g62920 target="new">response regulator 6 (ARR6)</A></td>

        </tr>
<tr class="alt">

       <td>ARR7 </td>

       <td>F14D16.12<br><a href=/servlets/TairObject?type=locus&name=At1g19050 target="new">At1g19050</A></td>

       <td>AAF79300</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19050 target="new">response regulator 5, putative </A></td>

        </tr>
<tr class="alt">

       <td>ARR8 (ATRR3)</td>

       <td>F13H10.14<br><a href=/servlets/TairObject?type=locus&name=At2g41310 target="new">At2g41310</A></td>

       <td>AAC78541</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g41310 target="new">putative two-component response regulator 3 protein</A></td>

        </tr>
<tr class="alt">

       <td>ARR9 (ATRR4)</td>

       <td>F24I3.120<br><a href=/servlets/TairObject?type=locus&name=At3g57040 target="new">At3g57040</A></td>

       <td>CAB72174</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g57040 target="new">responce reactor 4</A></td>

        </tr>
<tr class="alt">

       <td>ARR15</td>

       <td>F25A4.14<br><a href=/servlets/TairObject?type=locus&name=At1g74890 target="new">At1g74890</A></td>

       <td>AAG51914</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74890 target="new">response regulator 7, putative</A></td>

        </tr>
<tr class="alt">

       <td>ARR16</td>

       <td>T7D17.15<br><a href=/servlets/TairObject?type=locus&name=At2g40670 target="new">At2g40670</A></td>

       <td>AAG40612</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40670 target="new">putative two-component response regulator protein</A></td>

        </tr>
<tr class="alt">

       <td>ARR17</td>

       <td>T5P19.30<br><a href=/servlets/TairObject?type=locus&name=At3g56380 target="new">At3g56380</A></td>

       <td>AAG40613</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g56380 target="new">response regulator-like protein</A></td>

        </tr>
<tr class="alt">

       <td>ARR22</td>

       <td>T6K12.10<br><a href=/servlets/TairObject?type=locus&name=At3g04280 target="new">At3g04280</A></td>

       <td>AAF26786</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g04280 target="new">putative response regulator protein (receiver component)</A></td>

        </tr>
<tr><td colspan=5><b>B- Type</b></td></tr>

<tr><td rowspan=12 valign=top><b>Response Regulator</b></td>

       <td>ARR1 </td>

       <td>MUH15.1<br><a href=/servlets/TairObject?type=locus&name=At3g16857 target="new">At3g16857</A></td>

       <td>BAB03073</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16857 target="new">ARR1 protein, putative</A></td>

        </tr>
<tr>

       <td>ARR2 </td>

       <td>dl4095w<br><a href=/servlets/TairObject?type=locus&name=At4g16110 target="new">At4g16110</A></td>

       <td>CAB10390</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g16110 target="new">hypothetical protein</A></td>

        </tr>
<tr>

       <td>ARR10</td>

       <td>F10N7.270<br><a href=/servlets/TairObject?type=locus&name=At4g31920 target="new">At4g31920</A></td>

       <td>CAB79910</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g31920 target="new">predicted protein</A></td>

        </tr>
<tr>

       <td>ARR11/ARP3</td>

       <td>F12A21.15<br><a href=/servlets/TairObject?type=locus&name=At1g67710 target="new">At1g67710</A></td>

       <td>AAG28891</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67710 target="new">F12A21.15 </A></td>

        </tr>
<tr>

       <td>ARR12</td>

       <td>F13D4.140<br><a href=/servlets/TairObject?type=locus&name=At2g25180 target="new">At2g25180</A></td>

       <td>AAF19224</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25180 target="new">putative two-component response regulator protein </A></td>

        </tr>
<tr>

       <td>ARR13</td>

       <td>T20P8.12<br><a href=/servlets/TairObject?type=locus&name=At2g27070 target="new">At2g27070</A></td>

       <td>AAC77865</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g27070 target="new">putative two-component response regulator protein</A></td>

        </tr>
<tr>

       <td>ARR14</td>

       <td>T8O11.7<br><a href=/servlets/TairObject?type=locus&name=At2g01760 target="new">At2g01760</A></td>

       <td>AAD12696</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01760 target="new">putative two-component response regulator protein</A></td>

        </tr>
<tr>

       <td>ARR18</td>

       <td>k21l19.60<br><a href=/servlets/TairObject?type=locus&name=At5g58080 target="new">At5g58080</A></td>

       <td>BAB10999</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58080 target="new">ARR2 - like protein</A></td>

        </tr>
<tr>

       <td>ARR19</td>

       <td>F27J15.4<br><a href=/servlets/TairObject?type=locus&name=At1g49190 target="new">At1g49190</A></td>

       <td>AAF69721</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g49190 target="new">hypothetical protein</A></td>

        </tr>
<tr>

       <td>ARR20</td>

       <td>F26K9.100<br><a href=/servlets/TairObject?type=locus&name=At3g62670 target="new">At3g62670</A></td>

       <td>CAB83117</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g62670 target="new">putative protein</A></td>

        </tr>
<tr>

       <td>ARR21</td>

       <td>T28J14.150<br><a href=/servlets/TairObject?type=locus&name=At5g07210 target="new">At5g07210</A></td>

       <td>CAB87277</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07210 target="new">putative protein</A></td>

        </tr>
<tr>

       <td>ARR23</td>

       <td>MTG10.15<br><a href=/servlets/TairObject?type=locus&name=At5g62120 target="new">At5g62120</A></td>

       <td>BAB10174</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g62120 target="new">putative protein</A></td>

        </tr>
<tr class="alt"><td colspan=5><b>Pseudo</b></td></tr>

<tr class="alt"><td rowspan=9 valign=top><b>Response Regulator</b></td>

       <td>APRR1/TOC1</td>

       <td>mfb13.150<br><a href=/servlets/TairObject?type=locus&name=At5g61380 target="new">At5g61380</A></td>

       <td>AAF86252</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g61380 target="new">pseudo-response regulator 1</A></td>

        </tr>
<tr class="alt">

       <td>APRR2</td>

       <td>T6K21.200 <br><a href=/servlets/TairObject?type=locus&name=At4g18020 target="new">At4g18020</A></td>

       <td>CAB78804</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18020 target="new">putative protein </A></td>

        </tr>
<tr class="alt">

       <td>APRR3</td>

       <td>mgo3.8<br><a href=/servlets/TairObject?type=locus&name=At5g60100 target="new">At5g60100</A></td>

       <td>BAA96939</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60100 target="new">pseudo-response regulator - like</A></td>

        </tr>
<tr class="alt">

       <td>APRR4</td>

       <td>K21P3.12<br><a href=/servlets/TairObject?type=locus&name=At5g49240 target="new">At5g49240</A></td>

       <td>BAB10342</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49240 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>APRR5</td>

       <td>T31K7.5<br><a href=/servlets/TairObject?type=locus&name=At5g24470 target="new">At5g24470</A></td>

       <td>BAB08930</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g24470 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>APRR6</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g68210 target="new">At1g68210</A></td>

       <td>AAG52609</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68210 target="new">hypothetical protein </A></td>

        </tr>
<tr class="alt">

       <td>APRR7 </td>

       <td>F9G14.120<br><a href=/servlets/TairObject?type=locus&name=At5g02810 target="new">At5g02810</A></td>

       <td>CAB86035</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g02810 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>APRR9</td>

       <td>F19D11.7<br><a href=/servlets/TairObject?type=locus&name=At2g46790 target="new">At2g46790</A></td>

       <td>AAC33497</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46790 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>APRR8</td>

       <td>T18A10.1<br><a href=/servlets/TairObject?type=locus&name=At4g00760 target="new">At4g00760</A></td>

       <td>CAB80885</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00760 target="new">putative protein</A></td>

        </tr>
</table><P>
<center>Last modified on January 16, 2004</center>    

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
