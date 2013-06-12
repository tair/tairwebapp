<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "MAPKKK Gene Family";
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
<h2><i>Arabidopsis</i> MAPKKK Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Jonak C, &Ouml;kr&eacute;sz L, B&ouml;gre L, Hirt H (2002) <a href="/servlets/TairObject?type=publication&id=501681769">Complexity, cross talk and integration of plant MAP kinase signalling.</a> Curr. Opin. Plant Biol. 5: 415-424.<br>
<a href="http://personal.rhul.ac.uk/ujba/110/mapk/mapkkk_genes.htm" target=display>http://personal.rhul.ac.uk/ujba/110/mapk/mapkkk_genes.htm</a><br>
The B&ouml;gre Lab web site<br>
<a href="http://personal.rhul.ac.uk/ujba/110/bogrelab.htm" target=display>http://personal.rhul.ac.uk/ujba/110/bogrelab.htm</a></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td><li><A href="3KSIG.html">MAPKKK Sequence Alignments</A> 

<br><li>Table of <a href="motifs.jsp" target=new>Characteristic Sequence Motifs</A>
<li>
</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=/servlets/Community?action=view&type=person&communityID=1213417 target=new>Laszlo B&ouml;gre</A><br><a href="/servlets/Community?action=view&type=person&communityID=7034" target=new>Laszlo Okresz</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation:</B></TH>

         </TR>

<tr class="alt"><td valign=top rowspan=21><b>MAPKKK Family<br>MEKK subfamily</b></td>

       <td>MAPKKK1</td>

       <td>F7G19.13<br><a href=/servlets/TairObject?type=locus&name=At1g09000 target="new">At1g09000</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09000 target="new">putative NPK1-related protein kinase 2</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK2</td>

       <td>F14C21.49<br><a href=/servlets/TairObject?type=locus&name=At1g54960 target="new">At1g54960</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54960 target="new">NPK1-related protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK3</td>

       <td>T3F20.12<br><a href=/servlets/TairObject?type=locus&name=At1g53570 target="new">At1g53570</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53570 target="new">MAP3K alpha protein kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK4</td>

       <td>F24D7.11<br><a href=/servlets/TairObject?type=locus&name=At1g63700 target="new">At1g63700</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g63700 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK5</td>

       <td>MUD21.11<br><a href=/servlets/TairObject?type=locus&name=At5g66850 target="new">At5g66850</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g66850 target="new">MAP protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK6</td>

       <td>F17A17.32<br><a href=/servlets/TairObject?type=locus&name=At3g07980 target="new">At3g07980</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g07980 target="new">putative MAP3K epsilon protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK7</td>

       <td>MRP15.15<br><a href=/servlets/TairObject?type=locus&name=At3g13530 target="new">At3g13530</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13530 target="new">MAP3K epsilon protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK8</td>

       <td>T15F16.5<br><a href=/servlets/TairObject?type=locus&name=At4g08500 target="new">At4g08500</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g08500 target="new">MEKK1/MAP kinase kinase kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK9</td>

       <td>T15F16.3<br><a href=/servlets/TairObject?type=locus&name=At4g08480 target="new">At4g08480</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g08480 target="new">putative mitogen-activated protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK10</td>

       <td>T15F16.2<br><a href=/servlets/TairObject?type=locus&name=At4g08470 target="new">At4g08470</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g08470 target="new">putative mitogen-activated protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK11</td>

       <td>F16J13.90<br><a href=/servlets/TairObject?type=locus&name=At4g12020 target="new">At4g12020</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g12020 target="new">putative disease resistance protein</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK12</td>

       <td>F24F17.1<br><a href=/servlets/TairObject?type=locus&name=At3g06030 target="new">At3g06030</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06030 target="new">NPK1-related protein kinase 3</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK13</td>

       <td>F10K1.14<br><a href=/servlets/TairObject?type=locus&name=At1g07150 target="new">At1g07150</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07150 target="new">MAP3K gamma protein kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK14</td>

       <td>F23F1.4<br><a href=/servlets/TairObject?type=locus&name=At2g30040 target="new">At2g30040</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30040 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK15</td>

       <td>MCO15.4<br><a href=/servlets/TairObject?type=locus&name=At5g55090 target="new">At5g55090</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55090 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK16</td>

       <td>F10M23.230<br><a href=/servlets/TairObject?type=locus&name=At4g26890 target="new">At4g26890</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g26890 target="new">putative NPK1-related protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK17</td>

       <td>T26B15.7<br><a href=/servlets/TairObject?type=locus&name=At2g32510 target="new">At2g32510</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32510 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK18</td>

       <td>T7A14.2<br><a href=/servlets/TairObject?type=locus&name=At1g05100 target="new">At1g05100</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05100 target="new">putative NPK1-related MAP kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK19</td>

       <td>K21H1.4<br><a href=/servlets/TairObject?type=locus&name=At5g67080 target="new">At5g67080</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g67080 target="new">protein kinase-like protein</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK20</td>

       <td>F11C1.150<br><a href=/servlets/TairObject?type=locus&name=At3g50310 target="new">At3g50310</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g50310 target="new">protein kinase -like protein</A></td>

        </tr>
<tr class="alt">

       <td>MAPKKK21</td>

       <td>AP22.87<br><a href=/servlets/TairObject?type=locus&name=At4g36950 target="new">At4g36950</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g36950 target="new">pseudogene, hypothetical protein</A></td>

        </tr>
<tr><td valign=top rowspan=11><b>MAPKKK Family<br>ZIK subfamily</b></td>

       <td>ZIK1</td>

       <td>T18N14.10<br><a href=/servlets/TairObject?type=locus&name=At3g51630 target="new">At3g51630</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g51630 target="new">MAP kinase</A></td>

        </tr>
<tr>

       <td>ZIK2</td>

       <td>MCK7.22<br><a href=/servlets/TairObject?type=locus&name=At5g58350 target="new">At5g58350</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58350 target="new">At5g58350</A></td>

        </tr>
<tr>

       <td>ZIK3</td>

       <td>MCB17.15<br><a href=/servlets/TairObject?type=locus&name=At3g22420 target="new">At3g22420</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g22420 target="new">putative protein kinase</A></td>

        </tr>
<tr>

       <td>ZIK4</td>

       <td>T9J14.14<br><a href=/servlets/TairObject?type=locus&name=At3g04910 target="new">At3g04910</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g04910 target="new">putative mitogen activated protein kinase kinase</A></td>

        </tr>
<tr>

       <td>ZIK5</td>

       <td>MVE11.20<br><a href=/servlets/TairObject?type=locus&name=At3g18750 target="new">At3g18750</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g18750 target="new">mitogen activated protein kinase kinase, putative</A></td>

        </tr>
<tr>

       <td>ZIK6</td>

       <td>MJC20.9<br><a href=/servlets/TairObject?type=locus&name=At5g41990 target="new">At5g41990</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g41990 target="new">MAP kinase</A></td>

        </tr>
<tr>

       <td>ZIK7</td>

       <td>F27J15.7<br><a href=/servlets/TairObject?type=locus&name=At1g49160 target="new">At1g49160</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g49160 target="new">serine/threonine protein kinase, putative</A></td>

        </tr>
<tr>

       <td>ZIK8</td>

       <td>MTE17.22<br><a href=/servlets/TairObject?type=locus&name=At5g55560 target="new">At5g55560</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55560 target="new">putative protein</A></td>

        </tr>
<tr>

       <td>ZIK9</td>

       <td>T24G3.10<br><a href=/servlets/TairObject?type=locus&name=At5g28080 target="new">At5g28080</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g28080 target="new">mitogen activated protein kinase - like</A></td>

        </tr>
<tr>

       <td>ZIK10</td>

       <td>F1N19.20<br><a href=/servlets/TairObject?type=locus&name=At1g64630 target="new">At1g64630</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64630 target="new">protein kinase, putative</A></td>

        </tr>
<tr>

       <td>ZIK11</td>

       <td>T29H11.220<br><a href=/servlets/TairObject?type=locus&name=At3g48260 target="new">At3g48260</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g48260 target="new">Expressed protein </A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=48><b>MAPKKK Family<br>Raf subfamily</b></td>

       <td>CTR1 (Raf1)</td>

       <td>F17C15.150<br><a href=/servlets/TairObject?type=locus&name=At5g03730 target="new">At5g03730</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g03730 target="new">SERINE/THREONINE-PROTEIN KINASE CTR1</A></td>

        </tr>
<tr class="alt">

       <td>EDR1 (Raf2)</td>

       <td>F22O13.20<br><a href=/servlets/TairObject?type=locus&name=At1g08720 target="new">At1g08720</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08720 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf3</td>

       <td>F14F18.20<br><a href=/servlets/TairObject?type=locus&name=At5g11850 target="new">At5g11850</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g11850 target="new">MAP3K delta-1 protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf4</td>

       <td>T10O22.13<br><a href=/servlets/TairObject?type=locus&name=At1g18160 target="new">At1g18160</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18160 target="new">MAP kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>Raf5</td>

       <td>F25P22.8<br><a href=/servlets/TairObject?type=locus&name=At1g73660 target="new">At1g73660</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73660 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf6</td>

       <td>T22A6.310<br><a href=/servlets/TairObject?type=locus&name=At4g24480 target="new">At4g24480</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g24480 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf7</td>

       <td>F5E6.5<br><a href=/servlets/TairObject?type=locus&name=At3g06620 target="new">At3g06620</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06620 target="new">protein kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>Raf8</td>

       <td>F5E6.4<br><a href=/servlets/TairObject?type=locus&name=At3g06630 target="new">At3g06630</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06630 target="new">protein kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>Raf9</td>

       <td>F5E6.3<br><a href=/servlets/TairObject?type=locus&name=At3g06640 target="new">At3g06640</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06640 target="new">protein kinase, putative </A></td>

        </tr>
<tr class="alt">

       <td>Raf10</td>

       <td>K7J8.16<br><a href=/servlets/TairObject?type=locus&name=At5g49470 target="new">At5g49470</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49470 target="new">protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf11</td>

       <td>T23K23.26<br><a href=/servlets/TairObject?type=locus&name=At1g67890 target="new">At1g67890</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67890 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf12</td>

       <td>F7H19.240<br><a href=/servlets/TairObject?type=locus&name=At4g23050 target="new">At4g23050</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g23050 target="new">putative serine/threonine kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf13</td>

       <td>F7F1.22<br><a href=/servlets/TairObject?type=locus&name=At2g31010 target="new">At2g31010</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31010 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf14</td>

       <td>F14N22.10<br><a href=/servlets/TairObject?type=locus&name=At2g42630 target="new">At2g42630</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42630 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf15</td>

       <td>F14P22.230<br><a href=/servlets/TairObject?type=locus&name=At3g58640 target="new">At3g58640</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g58640 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf16</td>

       <td>T1G11.5<br><a href=/servlets/TairObject?type=locus&name=At1g04700 target="new">At1g04700</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04700 target="new">putative Ser/Thr protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf17</td>

       <td>F7A19.9<br><a href=/servlets/TairObject?type=locus&name=At1g14000 target="new">At1g14000</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14000 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf18</td>

       <td>F3O9.7<br><a href=/servlets/TairObject?type=locus&name=At1g16270 target="new">At1g16270</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16270 target="new">putative Ser/Thr protein kinase </A></td>

        </tr>
<tr class="alt">

       <td>Raf19</td>

       <td>F24O1.13<br><a href=/servlets/TairObject?type=locus&name=At1g62400 target="new">At1g62400</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g62400 target="new">protein kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>Raf20</td>

       <td>T8K14.1<br><a href=/servlets/TairObject?type=locus&name=At1g79570 target="new">At1g79570</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79570 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf21</td>

       <td>T17A5.2<br><a href=/servlets/TairObject?type=locus&name=At2g17700 target="new">At2g17700</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g17700 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf22</td>

       <td>T28I24.9<br><a href=/servlets/TairObject?type=locus&name=At2g24360 target="new">At2g24360</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24360 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf23</td>

       <td>F20M17.16<br><a href=/servlets/TairObject?type=locus&name=At2g31800 target="new">At2g31800</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31800 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf24</td>

       <td>F19I3.28<br><a href=/servlets/TairObject?type=locus&name=At2g35050 target="new">At2g35050</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g35050 target="new"> putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf25</td>

       <td>F18O19.4<br><a href=/servlets/TairObject?type=locus&name=At2g43850 target="new">At2g43850</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43850 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf26</td>

       <td>FCAALL.308<br><a href=/servlets/TairObject?type=locus&name=At4g14780 target="new">At4g14780</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g14780 target="new">kinase like protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf27</td>

       <td>F13C5.120<br><a href=/servlets/TairObject?type=locus&name=At4g18950 target="new">At4g18950</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18950 target="new">protein kinase - like protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf28</td>

       <td>F6E21.90<br><a href=/servlets/TairObject?type=locus&name=At4g31170 target="new">At4g31170</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g31170 target="new">protein kinase - like protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf29</td>

       <td>F8D20.290<br><a href=/servlets/TairObject?type=locus&name=At4g35780 target="new">At4g35780</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g35780 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf30</td>

       <td>F22I13.1<br><a href=/servlets/TairObject?type=locus&name=At4g38470 target="new">At4g38470</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g38470 target="new">protein kinase like protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf31</td>

       <td>T20L15.120<br><a href=/servlets/TairObject?type=locus&name=At5g01850 target="new">At5g01850</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g01850 target="new">protein kinase ATN1-like protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf32</td>

       <td>MNF13.60<br><a href=/servlets/TairObject?type=locus&name=At5g40540 target="new">At5g40540</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40540 target="new">protein kinase - like protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf33</td>

       <td>K6A12.4<br><a href=/servlets/TairObject?type=locus&name=At5g50000 target="new">At5g50000</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g50000 target="new">protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf34</td>

       <td>K6A12.4<br><a href=/servlets/TairObject?type=locus&name=At5g50180 target="new">At5g50180</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g50180 target="new">protein kinase ATN1-like protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf35</td>

       <td>MUA2.19<br><a href=/servlets/TairObject?type=locus&name=At5g57610 target="new">At5g57610</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g57610 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf36</td>

       <td>K19M22.20<br><a href=/servlets/TairObject?type=locus&name=At5g58950 target="new">At5g58950</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58950 target="new">protein kinase 6 - like</A></td>

        </tr>
<tr class="alt">

       <td>Raf37</td>

       <td>MSN2.10<br><a href=/servlets/TairObject?type=locus&name=At5g66710 target="new">At5g66710</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g66710 target="new">protein kinase ATN1-like protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf38</td>

       <td>F4P13.4<br><a href=/servlets/TairObject?type=locus&name=At3g01490 target="new">At3g01490</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g01490 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>Raf39</td>

       <td>MWI23.12<br><a href=/servlets/TairObject?type=locus&name=At3g22750 target="new">At3g22750</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g22750 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf40</td>

       <td>K7P8.1<br><a href=/servlets/TairObject?type=locus&name=At3g24720 target="new">At3g24720</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g24720 target="new">protein kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>Raf41</td>

       <td>MMJ24.11<br><a href=/servlets/TairObject?type=locus&name=At3g27560 target="new">At3g27560</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g27560 target="new">putative protein kinase, ATN1</A></td>

        </tr>
<tr class="alt">

       <td>Raf42</td>

       <td>T6H20.50<br><a href=/servlets/TairObject?type=locus&name=At3g46920 target="new">At3g46920</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g46920 target="new">protein kinase - like protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf43</td>

       <td>T6H20.40<br><a href=/servlets/TairObject?type=locus&name=At3g46930 target="new">At3g46930</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g46930 target="new">protein kinase 6-like protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf44</td>

       <td>T3A5.100<br><a href=/servlets/TairObject?type=locus&name=At3g50720 target="new">At3g50720</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g50720 target="new">protein kinase ATN1 -like protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf45</td>

       <td>T3A5.110<br><a href=/servlets/TairObject?type=locus&name=At3g50730 target="new">At3g50730</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g50730 target="new">protein kinase ATN1 - like protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf46</td>

       <td>F24G16.100<br><a href=/servlets/TairObject?type=locus&name=At3g59830 target="new">At3g59830</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g59830 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf47</td>

       <td>T20N10.110<br><a href=/servlets/TairObject?type=locus&name=At3g58760 target="new">At3g58760</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g58760 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>Raf48</td>

       <td>F16M2.110<br><a href=/servlets/TairObject?type=locus&name=At3g63260 target="new">At3g63260</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g63260 target="new">ATMRK1</A></td>

        </tr>
</table><P>
<center>Last modified on January 15, 2004</center>    

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
