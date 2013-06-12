<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Core Cell Cycle Genes";
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
<h2><i>Arabidopsis</i> Core Cell Cycle Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><b>Vandepoele K, Raes J, De Veylder L, Rouze P, Rombauts S, Inze D.</b> (2002) <a href="/servlets/TairObject?type=publication&id=501681321" target=new>Genome-wide analysis of core cell cycle genes in Arabidopsis. </a>Plant Cell <b>4</b>: 903-916</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>homology-based annotation using experimental references to build a full catalog with 61 core cell cycle genes of Arabidopsis
</td></tr>
<TR><TD valign=top><B>Contact:</b></td>
<td><a href=/servlets/Community?action=view&type=person&communityID=912276 target=new> Klaas Vandepoele</A></td></tr>
</table><p>

<TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

         </TR>

<tr class="alt"><td rowspan=61 valign=top><b>Core Cell Cycle Genes</b></td>

<td>CDKA;1</td>
<td>T21J18.20<br>AT3g48750</td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CDKB1;1 </td>
<td>F24B22.140<br>AT3g54180 </td>
<td>&nbsp;</td>
</tr>


<tr class="alt">
<td>CDKB1;2 </td>
<td>T6A23.18<br>AT2g38620 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CDKB2;1 </td>
<td>F14G6.14<br>AT1g76540 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CDKB2;2 </td>
<td>F9H16.8<br>AT1g20930 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CDKC;1 </td>
<td>F18D22.40<br>AT5g10270 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CDKC;2 </td>
<td>MXK3.19<br>AT5g64960 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CDKD;1 </td>
<td>F25P22.11<br>AT1g73690 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CDKD;2 </td>
<td>F4N21.12<br>AT1g66750 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CDKD;3 </td>
<td>T10F20.5<br>AT1g18040 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CDKE;1 </td>
<td>MBK5.8<br>AT5g63610 </td>
<td>&nbsp;</td>
</tr>


<tr class="alt">
<td>CDKF;1 </td>
<td>F25O24.8<br>AT4g28980 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCA1;1 </td>
<td>T7O23.18<br>AT1g44110 </td>
<td>&nbsp;</td>
</tr>


<tr class="alt">
<td>CYCA1;2 </td>
<td>F2P24.10<br>AT1g77390 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCA2;1 </td>
<td>F18G18.15<br>AT5g25380</td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCA2;2 </td>
<td>F2I11.190<br>AT5g11300 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCA2;3 </td>
<td>T16N11.8<br>AT1g15570 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCA2;4 </td>
<td>T16N11.8<br>AT1g80370 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCA3;1 </td>
<td>MMG4.10<br>AT5g43080 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCA3;2 </td>
<td>F8G22.8<br>AT1g47210 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCA3;3 </td>
<td>F8G22.6<br>AT1g47220 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCA3;4 </td>
<td>F8G22.5<br>AT1g47230 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCB1;1 </td>
<td>F6G17.140<br>AT4g37490 </td>
<td>&nbsp;</td>
</tr>


<tr class="alt">
<td>CYCB1;2 </td>
<td>K16F4.15<br>AT5g06150 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCB1;3 </td>
<td>F24K9.20<br>AT3g11520 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCB1;4 </td>
<td>F18A8.13<br>AT2g26760 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCB2;1 </td>
<td>T19E12.4<br>AT2g17620 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCB2;2 </td>
<td>F8D20.130<br>AT4g35620 </td>
<td>&nbsp;</td>
</tr>


<tr class="alt">
<td>CYCB2;3 </td>
<td>F5M15.6<br>AT1g20610 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCB2;4 </td>
<td>T23E18.24<br>AT1g76310 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCB3;1 </td>
<td>F3O9.13<br>AT1g16330 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCD1;1 </td>
<td>F20P5.7<br>AT1g70210 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCD2;1 </td>
<td>F14M13.11<br>AT2g22490 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCD3;1 </td>
<td>F28A23.80<br>AT4g34160 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCD3;2 </td>
<td>K21H1.30<br>AT5g67260 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCD3;3 </td>
<td>F3A4.150<br>AT3g50070 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCD4;1 </td>
<td>MNA5.15<br>AT5g65420 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCD4;2 </td>
<td>F12B17.210<br>AT5g10440 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCD5;1 </td>
<td>F19F18.120<br>AT4g37630 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCD6;1 </td>
<td>F4C21.20<br>AT4g03270 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCD7;1 </td>
<td>T7H20.160<br>AT5g02110 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CYCH;1 </td>
<td>F15A18.80<br>AT5g27620 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CKS1 </td>
<td>T1E2.12<br>AT2g27960 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>CKS2 </td>
<td>T1E2.11<br>AT2g27970 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>DEL1 </td>
<td>T24C20.40<br>AT3g48160 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>DEL2 </td>
<td>F2G14.80<br>AT5g14960 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>DEL3 </td>
<td>T22N4.4<br>AT3g01330 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>DPa </td>
<td>T1E22.4<br>AT5g02470 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>DPb </td>
<td>F12E4.160<br>AT5g03410 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>E2Fa </td>
<td>F11F19.8<br>AT2g36010 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>E2Fb </td>
<td>T6G21.10<br>AT5g22220 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>E2Fc </td>
<td>T2E6.2<br>AT1g47870 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>KRP1 </td>
<td>F26B6.8<br>AT2g23430 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>KRP2 </td>
<td>T3A5.10<br>AT3g50630 </td>
<td>&nbsp;</td>
</tr>


<tr class="alt">
<td>KRP3 </td>
<td>K24G6.15<br>AT5g48820 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>KRP4 </td>
<td>F24L7.15<br>AT2g32710 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>KRP5 </td>
<td>K7P8.10<br>AT3g24810 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>KRP6 </td>
<td>MVI11.5<br>AT3g19150 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>KRP7 </td>
<td>F14J22.14<br>AT1g49620 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>Rb </td>
<td>F28J15.11<br>AT3g12280 </td>
<td>&nbsp;</td>
</tr>

<tr class="alt">
<td>WEE1 </td>
<td>F22D16.3<br>AT1g02970 </td>
<td>&nbsp;</td>
</tr>

</table><P>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>
  <BR>


<center>Last modified on January 14, 2004</center>   

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
