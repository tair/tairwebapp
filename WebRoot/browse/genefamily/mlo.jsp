<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "MLO Proteins";
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
<h2><i>Arabidopsis</i>  MLO Proteins</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><li><b>Alessandra Devoto, H. Andreas Hartmann, Pietro Piffanelli, Candace Elliott, Carl Simmons, Graziana Taramino, Chern-Sing Goh, Fred E. Cohen, Brent C. Emerson, Paul Schulze-Lefert, and Ralph Panstruga</b> <a href="/servlets/TairObject?type=publication&id=501683432">Molecular phylogeny and evolution of the plant-specific seven transmembrane MLO family</a> (2003) Journal of Molecular Evolution 56:77<br>
<li>Website: <a href="http://www.mpiz-koeln.mpg.de/~panstrug/">MLO proteins - seven-transmembrane proteins unique to plants</A>
</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td><li>MLO proteins possess seven transmembrane domains and a framework of conserved (invariant) amino acid residues.</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=/servlets/Community?action=view&type=person&communityID=1702 target=new>Ralph Panstruga</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation:</B></TH>

         </TR>

<tr class="alt"><td rowspan=15 valign=top><b>MLO proteins</b></td>

       <td>AtMlo1</td>

       <td>T10P11.12<br><a href=/servlets/TairObject?type=locus&name=AT4G02600 target="new">AT4G02600</A></td>

       <td>AAM45040</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G02600 target="new">AtMlo-h1-like protein</A></td>

        </tr>
<tr class="alt">

       <td>AtMlo2</td>

       <td>T28P6.4<br><a href=/servlets/TairObject?type=locus&name=AT1G11310 target="new">AT1G11310</A></td>

       <td>AAL06900</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G11310 target="new">Mlo protein, putative</A></td>

        </tr>
<tr class="alt">

       <td>AtMlo3</td>

       <td>F18N11.50<br><a href=/servlets/TairObject?type=locus&name=AT3G45290 target="new">AT3G45290</A></td>

       <td>NP_566879</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G45290 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>AtMlo4</td>

       <td>T19D16.26<br><a href=/servlets/TairObject?type=locus&name=AT1G11000 target="new">AT1G11000</A></td>

       <td>NP_563882</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G11000 target="new">Barley Mlo protein isolog</A></td>

        </tr>
<tr class="alt">

       <td>AtMlo5</td>

       <td>T1B8.33<br><a href=/servlets/TairObject?type=locus&name=AT2G33670 target="new">AT2G33670</A></td>

       <td>NP_563882</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G33670 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">

       <td>AtMlo6</td>

       <td>T25B24.9<br><a href=/servlets/TairObject?type=locus&name=AT1G61560 target="new">AT1G61560</A></td>

       <td>NP_176350</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G61560 target="new">Mlo protein, putative </A></td>

        </tr>
<tr class="alt">

       <td>AtMlo7</td>

       <td>F5J6.19<br><a href=/servlets/TairObject?type=locus&name=AT2G17430 target="new">AT2G17430</A></td>

       <td>AAB86520</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G17430 target="new">putative Mlo protein</A></td>

        </tr>
<tr class="alt">

       <td>AtMlo8</td>

       <td>F5J6.21<br><a href=/servlets/TairObject?type=locus&name=AT2G17480 target="new">AT2G17480</A></td>

       <td>AAD32905</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G17480 target="new">similar to Mlo proteins from H. vulgare </A></td>

        </tr>
<tr class="alt">

       <td>AtMlo9</td>

       <td>T8D8.5<br><a href=/servlets/TairObject?type=locus&name=AT1G42560 target="new">AT1G42560</A></td>

       <td>NP_174980</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G42560 target="new">Mlo-like protein</A></td>

        </tr>
<tr class="alt">

       <td>AtMlo10</td>

       <td>K14B20.14<br><a href=/servlets/TairObject?type=locus&name=AT5G65970 target="new">AT5G65970</A></td>

       <td>NP_201398</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G65970 target="new">Mlo protein-like</A></td>

        </tr>
<tr class="alt">

       <td>AtMlo11</td>

       <td>MGN6.12<br><a href=/servlets/TairObject?type=locus&name=AT5G53760 target="new">AT5G53760</A></td>

       <td>AAL09743</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G53760 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>AtMlo12</td>

       <td>T16B24.16<br><a href=/servlets/TairObject?type=locus&name=AT2G39200 target="new">AT2G39200</A></td>

       <td>AAC28997</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G39200 target="new">similar to Mlo proteins from H. vulgare</A></td>

        </tr>
<tr class="alt">

       <td>AtMlo13</td>

       <td>T22A6.80<br><a href=/servlets/TairObject?type=locus&name=AT4G24250 target="new">AT4G24250</A></td>

       <td>CAB79335</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G24250 target="new">Mlo-like protein</A></td>

        </tr>
<tr class="alt">

       <td>AtMlo14</td>

       <td>T24P13.8<br><a href=/servlets/TairObject?type=locus&name=AT1G26700 target="new">AT1G26700</A></td>

       <td>NP_564257</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G26700 target="new">Mlo protein, putative</A></td>

        </tr>
<tr class="alt">

       <td>AtMlo15</td>

       <td>F6E13.24<br><a href=/servlets/TairObject?type=locus&name=AT2G44110 target="new">AT2G44110</A></td>

       <td>AAC23431</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G44110 target="new">similar to Mlo proteins from H. vulgare</A></td>

        </tr>
</table><P>
<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>
  <BR>




<center>Last modified on January 15, 2004</center>     

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
