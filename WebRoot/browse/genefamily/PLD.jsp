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
<h2><i>Arabidopsis</i> Phospholipase D Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><li>Web Site: <a href="http://www.ksu.edu/lipid/lipidomics"><b>Kansas Lipidomics Research Center</b></a>
     <li><b>Qin, C. and Wang, X.</b> (2002) <A HREF="/servlets/TairObject?type=publication&id=1547385">The Arabidopsis Phospholipase D Family. Characterization of a Calcium-Independent and Phosphatidylcholine-Selective PLDzeta1 with Distinct Regulatory Domains.</A> <i>Plant Physiology</i> <b>128:1057</b></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Domain strcuture (duplicated HKD motifs), biochemical properties, and sequence similarity</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=/servlets/Community?action=view&type=person&communityID=4761 target=new>Xuemin Wang</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>Expert Annotation<br>Comment:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=12 valign=top><b>PLD (Phospholipase D)</b></td>

       <td>PLDalpha1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g15730 target="new">At3g15730</A></td>

       <td>BAB02304</A><br></td>

       <td>The classical plant PLD that reguires high millimolar calcium for activity in vitro.</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g15730 target="new">Phospholipase D, putative</A></td>

        </tr>
<tr class="alt">

       <td>PLDalpha2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g52570 target="new">At1g52570</A></td>

       <td>AAD55607</A><br></td>

       <td>Sequence most closely related to PLDalpha one; biochemical properties unknown.</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g52570 target="new">Phospholipase D, putative</A></td>

        </tr>
<tr class="alt">

       <td>PLDalpha3</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g25370 target="new">At5g25370</A></td>

       <td>NP_197919</A><br></td>

       <td>Its gene structure similar to PLDalphas; biochemical properties are unknown.</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g25370 target="new">Phospholipase D, putative</A></td>

        </tr>
<tr class="alt">

       <td>PLDalpha4</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g55180 target="new">At1g55180</A></td>

       <td>AAG51567</A><br></td>

       <td>A unique PLD that may not have a calcium-binding C2-domain; biochemical properties are unknown.</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55180 target="new">Phospholipase D, putative</A></td>

        </tr>
<tr class="alt">

       <td>PLDbeta1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g42010 target="new">At2g42010</A></td>

       <td>AAB63542</A><br></td>

       <td>PIP2-requiring PLD that is activated by micromolar calcium.</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42010 target="new">phospholipase D (PLDbeta)</A></td>

        </tr>
<tr class="alt">

       <td>PLDbeta2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g00240 target="new">At4g00240</A></td>

       <td>AAF02803</A><br></td>

       <td>Sequence more closely related to PLDbeta1 than to the other PLDs; biochemical properties are unknown.</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00240 target="new">phospholipase D -related</A></td>

        </tr>
<tr class="alt">

       <td>PLDgamma1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g11850 target="new">At4g11850</A></td>

       <td>CAB78228</A><br></td>

       <td>PIP2-requiring PLD that is activated by micromolar calcium and prefers PE to PC.</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11850 target="new">phospholipase D-gamma, putative</A></td>

        </tr>
<tr class="alt">

       <td>PLDgamma2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g11830 target="new">At4g11830</A></td>

       <td>CAB78226</A><br></td>

       <td>PIP2-requiring PLD that is activated by micromolar calcium and prefers PE to PC.</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11830 target="new">phospholipase D-gamma, putative</A></td>

        </tr>
<tr class="alt">

       <td>PLDgamma3</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g11840 target="new">At4g11840</A></td>

       <td>CAB78227</A><br></td>

       <td>structurally highly identical to PLDgamma1 and 2.</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11840 target="new">phospholipase D-gamma, putative</A></td>

        </tr>
<tr class="alt">

       <td>PLDdelta</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g35790 target="new">At4g35790</A></td>

       <td>CAB81488</A><br></td>

       <td>Oleate-stimulated PLD that is associated with the plasma membrane and microtubules.</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g35790 target="new">phospholipase D -related</A></td>

        </tr>
<tr class="alt">

       <td>PLDzeta1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g16785 target="new">At3g16785</A></td>

       <td>BAA95772</A><br></td>

       <td>Calcium-independent, PC-selective PLD with PH/PX domains similar to mammalian PLDs.</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16785 target="new">phospholipase D zeta1 (5' fragment)</A></td>

        </tr>
<tr class="alt">

       <td>PLDzeta2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g05630 target="new">At3g05630</A></td>

       <td>AAF26134</A><br></td>

       <td>PLD with PH/PX domains similar to mammalian PLDs.</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05630 target="new">phospholipase D family</A></td>

        </tr>
</table><P>
<center>Last modified on May 20, 2003</center>        

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
