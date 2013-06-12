<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Gene Family: MAP Kinase";
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

<h2><i>Arabidopsis</i> MAP Kinase Gene Family</span></h2>

<TABLE border=0 cellspacing=0 cellpadding=2>

<TR><TD valign=top><B>Source:</B></TD>
<TD><li><b>Asai, T., Tena, G., Plotnikova, J., Willmann, M. R., Chiu, W. L., Gomez-Gomez, L., Boller, T., Ausubel, F. M., Sheen, J. </b> (2002) <A href="/servlets/TairObject?type=publication&id=1547411" target="new">MAP kinase signalling cascade in Arabidopsis innate immunity.</a>Nature  <b>415: </b>977-983
<BR><li><b>Tena G, Asai T, Chiu WL, Sheen J.</b> (2001) <a href="/servlets/TairObject?type=publication&id=501710452">Plant mitogen-activated protein kinase signaling cascades.</a> Curr Opin Plant Biol. <b>4: </b>392-400
<BR><li><b>Kovtun, Y., Chiu, W. L., Tena, G., Sheen, J.</b> (2000) <A href="/servlets/TairObject?type=publication&id=658" target=new>Functional analysis of oxidative stress-activated mitogen-activated protein kinase cascade in plants.</a> PNAS <b>97: </b>2940-2945
<br><li><b>(Kazuya Ichimura et al ) MG, Ichimura K, Shinozaki K, Tena G, Sheen J, Henry Y, Champion A, Kreis M, Zhang S, Hirt H, Wilson C, Heberle-Bors E, Ellis BE, Morris PC, Innes RW, Ecker JR, Scheel D, Klessig DF, Machida Y, Mundy J, Ohashi Y, Walker JC.</b> (2002) <a href="/servlets/TairObject?type=publication&id=501683496">Mitogen-activated protein kinase cascades in plants: a new nomenclature.</a> Trends Plant Sci <b>7:</b> 301-308
<li><A href="http://genetics.mgh.harvard.edu/sheenweb/">The Sheen Lab web site</A>
</TD></TR>


<TR><TD valign=top><B>Gene Family<BR>Criteria:</B></TD><TD> The necessary and sufficient criterion used is the presence of the signature TxYVxxRWYRAPEL in the activation domain (also called T-loop) between kinase subdomains VII and VIII, which includes the phosphorylated residues TxY. Only MPK3/4/6 were experimentally determined to act biochemically and/or physiologically as MAPKs.</TD></TR>

<TR><TD></TD></TR><TR><TD valign=top><B>Contact:</B></TD>
<TD><A HREF=/servlets/Community?action=view&type=person&communityID=6184 target="new">Jen Sheen
<BR>
<A href="/servlets/Community?action=view&type=person&communityID=1012626" target=new>Guillaume Tena</A>
<BR>
<A href="/servlets/Community?action=view&type=person&communityID=218" target=new>Yanxia Liu</A>
<BR>
<A href="/servlets/Community?action=view&type=person&communityID=1113137" target=new>Cheri Chen</A></TD></TR>
</TABLE><P>


  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation:</B></TH>

         </TR>

<tr class="alt"><td rowspan=20 valign=top><b>MAP Kinase</b></td>

       <td>MPK1</td>

       <td>F14N23.4<br><a href=/servlets/TairObject?type=locus&name=At1g10210 target="new">At1g10210</A></td>

       <td>AAD32871</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10210 target="new">putative mitogen-activated protein kinase, MAP Kinase 1</A></td>

        </tr>
<tr class="alt">

       <td>MPK2</td>

       <td>T30E16.13<br><a href=/servlets/TairObject?type=locus&name=At1g59580 target="new">At1g59580</A></td>

       <td>AAK59639</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g59580 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>MPK3</td>

       <td>F9K21.220<br><a href=/servlets/TairObject?type=locus&name=At3g45640 target="new">At3g45640</A></td>

       <td>AAK62406</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g45640 target="new">mitogen-activated protein kinase 3</A></td>

        </tr>
<tr class="alt">

       <td>MPK4</td>

       <td>f2n1.2<br><a href=/servlets/TairObject?type=locus&name=At4g01370 target="new">At4g01370</A></td>

       <td>AAK64089</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g01370 target="new">MAP kinase 4 (MPK4)</A></td>

        </tr>
<tr class="alt">

       <td>MPK5</td>

       <td>F8L21.120<br><a href=/servlets/TairObject?type=locus&name=At4g11330 target="new">At4g11330</A></td>

       <td>CAB81234</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11330 target="new">MAP kinase (ATMPK5)</A></td>

        </tr>
<tr class="alt">

       <td>MPK6</td>

       <td>F18O19.10<br><a href=/servlets/TairObject?type=locus&name=At2g43790 target="new">At2g43790</A></td>

       <td>AAB64027</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43790 target="new">MAP kinase (ATMPK6) </A></td>

        </tr>
<tr class="alt">

       <td>MPK7</td>

       <td>F8D23.5<br><a href=/servlets/TairObject?type=locus&name=At2g18170 target="new">At2g18170</A></td>

       <td>AAD31349</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18170 target="new">MAP kinase (ATMPK7)</A></td>

        </tr>
<tr class="alt">

       <td>MPK8</td>

       <td>T10O22.5  <br><a href=/servlets/TairObject?type=locus&name=At1g18150 target="new">At1g18150</A></td>

       <td>AAK76605</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18150 target="new">mitogen-activated protein kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>MPK9</td>

       <td>MRC8.2<br><a href=/servlets/TairObject?type=locus&name=At3g18040 target="new">At3g18040</A></td>

       <td>BAA92223</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g18040 target="new">putative MAP kinase</A></td>

        </tr>
<tr class="alt">

       <td>MPK10</td>

       <td>F24G16.60<br><a href=/servlets/TairObject?type=locus&name=At3g59790 target="new">At3g59790</A></td>

       <td>CAB75798</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g59790 target="new">mitogen-activated protein kinase-like protein</A></td>

        </tr>
<tr class="alt">

       <td>MPK11</td>

       <td>F22L4.15<br><a href=/servlets/TairObject?type=locus&name=At1g01560 target="new">At1g01560</A></td>

       <td>AAF81314</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01560 target="new">MAP kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>MPK12</td>

       <td>T3F17.28<br><a href=/servlets/TairObject?type=locus&name=At2g46070 target="new">At2g46070</A></td>

       <td>AAC62906</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46070 target="new">putative mitogen-activated protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>MPK13</td>

       <td>F24B9.3<br><a href=/servlets/TairObject?type=locus&name=At1g07880 target="new">At1g07880</A></td>

       <td>AAF75067</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07880 target="new">MAP kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>MPK14</td>

       <td>C7A10.910<br><a href=/servlets/TairObject?type=locus&name=At4g36450 target="new">At4g36450</A></td>

       <td>CAB16812</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g36450 target="new">MAP kinase like protein</A></td>

        </tr>
<tr class="alt">

       <td>MPK15</td>

       <td>F25P22.9<br><a href=/servlets/TairObject?type=locus&name=At1g73670 target="new">At1g73670</A></td>

       <td>AAG52072</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73670 target="new">putative MAP kinase </A></td>

        </tr>
<tr class="alt">

       <td>MPK16</td>

       <td>T16G12.50<br><a href=/servlets/TairObject?type=locus&name=At5g19010 target="new">At5g19010</A></td>

       <td>AAN15447<br>AAL32607</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g19010 target="new">MAP kinase -like protein</A></td>

        </tr>
<tr class="alt">

       <td>MPK17</td>

       <td>F2I9.7<br><a href=/servlets/TairObject?type=locus&name=At2g01450 target="new">At2g01450</A></td>

       <td>AAC67338</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01450 target="new">putative MAP kinase</A></td>

        </tr>
<tr class="alt">

       <td>MPK18</td>

       <td>T3F20.17<br><a href=/servlets/TairObject?type=locus&name=At1g53510 target="new">At1g53510</A></td>

       <td>AAG51978</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53510 target="new">MAP kinase ATMPK9, putative</A></td>

        </tr>
<tr class="alt">

       <td>MPK19</td>

       <td>MIE1.22<br><a href=/servlets/TairObject?type=locus&name=At3g14720 target="new">At3g14720</A></td>

       <td>BAB02403</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g14720 target="new">putative MAP kinase</A></td>

        </tr>
<tr class="alt">

       <td>MPK20</td>

       <td>F7D19.12<br><a href=/servlets/TairObject?type=locus&name=At2g42880 target="new">At2g42880</A></td>

       <td>AAD21721</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42880 target="new">putative MAP kinase</A></td>

        </tr>
</table><P>
<center>Last modified on January 13, 2006</center>     

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
