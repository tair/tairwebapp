<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Gene Family";
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
<h2><i>Arabidopsis</i> ARIADNE Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><li>Web site: <A HREF="http://www.boku.ac.at/zag/AG_hauser.htm">ARIADNE family</A><br><li><b>Christina Mladek, Klaus Guger and Marie-Theres Hauser</b> (2003) <a href="/servlets/TairObject?type=publication&id=501683003">Identification and Characterization of the ARIADNE Gene Family in Arabidopsis. A Group of Putative E3 Ligases.</a> <i>Plant Physiology</i> <b>131:27</B> </td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Sequence homology<br>
Phylogenetic analyses<br>
Confirmation of exon-intron borders<br> 
Organ-specific expression analyses with real-time PCR</td></tr>
<TR><TD valign=top><B>Contact:</b></td>
<td><a href=/servlets/Community?action=view&type=person&communityID=4770 target=new>Marie-Theres Hauser</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=4 valign=top><b>ARIADNE subfamily A</b></td>

       <td>ARI1</td>

       <td>F10M10.140<br><a href=/servlets/TairObject?type=locus&name=At4g34370 target="new">At4g34370</A></td>

       <td>AJ510204</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34370 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>ARI2</td>

       <td>F7H1.11<br><a href=/servlets/TairObject?type=locus&name=At2g16090 target="new">At2g16090</A></td>

       <td>AJ510205</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16090 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>ARI3</td>

       <td>MGF10.11<br><a href=/servlets/TairObject?type=locus&name=At3g27710 target="new">At3g27710</A></td>

       <td>AJ510206</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g27710 target="new">expressed protein</A></td>

        </tr>
<tr class="alt">

       <td>ARI4</td>

       <td>MGF10.12<br><a href=/servlets/TairObject?type=locus&name=At3g27720 target="new">At3g27720</A></td>

       <td>AJ510207</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g27720 target="new">hypothetical protein</A></td>

        </tr>
<tr><td rowspan=8 valign=top><b>ARIADNE subfamily B</b></td>

       <td>ARI5</td>

       <td>T20M3.16<br><a href=/servlets/TairObject?type=locus&name=At1g05890 target="new">At1g05890</A></td>

       <td>AJ510208</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05890 target="new">unknown protein</A></td>

        </tr>
<tr>

       <td>ARI6</td>

       <td>F24D7.5<br><a href=/servlets/TairObject?type=locus&name=At1g63760 target="new">At1g63760</A></td>

       <td>AJ510209</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g63760 target="new">pseudogene, ARI protein</A></td>

        </tr>
<tr>

       <td>ARI7</td>

       <td>T9H9.3<br><a href=/servlets/TairObject?type=locus&name=At2g31510 target="new">At2g31510</A></td>

       <td>AJ510210</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31510 target="new">putative RING zinc finger protein</A></td>

        </tr>
<tr>

       <td>ARI8</td>

       <td>T8F5.21<br><a href=/servlets/TairObject?type=locus&name=At1g65430 target="new">At1g65430</A></td>

       <td>AJ510211</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65430 target="new">expressed protein</A></td>

        </tr>
<tr>

       <td>ARI9</td>

       <td>F20M17.19<br><a href=/servlets/TairObject?type=locus&name=At2g31770 target="new">At2g31770</A></td>

       <td>AJ510212</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31770 target="new">putative ARI-like RING zinc finger protein</A></td>

        </tr>
<tr>

       <td>ARI10</td>

       <td>F20M17.20<br><a href=/servlets/TairObject?type=locus&name=At2g31760 target="new">At2g31760</A></td>

       <td>AJ510213</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31760 target="new">putative ARI-like RING zinc finger protein</A></td>

        </tr>
<tr>

       <td>ARI11</td>

       <td>F20M17.18<br><a href=/servlets/TairObject?type=locus&name=At2g31780 target="new">At2g31780</A></td>

       <td>AJ510214</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31780 target="new">similar to Ariadne protein from Drosophila</A></td>

        </tr>
<tr>

       <td>ARI12</td>

       <td>T20M3.15<br><a href=/servlets/TairObject?type=locus&name=At1g05880 target="new">At1g05880</A></td>

       <td>AJ510215</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05880 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt"><td rowspan=4 valign=top><b>ARIADNE subfamily C</b></td>

       <td>ARI13</td>

       <td>MBK5.23<br><a href=/servlets/TairObject?type=locus&name=At5g63750 target="new">At5g63750</A></td>

       <td>AJ510216</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g63750 target="new">ARI-like RING zinc finger protein-like</A></td>

        </tr>
<tr class="alt">

       <td>ARI14</td>

       <td>MBK5.21<br><a href=/servlets/TairObject?type=locus&name=At5g63730 target="new">At5g63730</A></td>

       <td>AJ510217</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g63730 target="new">ARI-like RING zinc finger protein-like</A></td>

        </tr>
<tr class="alt">

       <td>ARI15</td>

       <td>MBK5.24<br><a href=/servlets/TairObject?type=locus&name=At5g63760 target="new">At5g63760</A></td>

       <td>AJ510218</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g63760 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>ARI16</td>

       <td>T2K12.80<br><a href=/servlets/TairObject?type=locus&name=At5g08730 target="new">At5g08730</A></td>

       <td>AJ510219</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g08730 target="new">similar to ARI-like RING zinc finger protein-like</A></td>

        </tr>
</table><P>
<center>Last modified on February 4, 2003</center> 


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
