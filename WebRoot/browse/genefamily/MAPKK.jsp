<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Gene Family: MAP Kinase Kinase family";
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
<h2><i>Arabidopsis</i> MAP Kinase Kinase family</span></h2>

<table border=0 cellspacing=0 cellpadding=2>

<TR><TD valign=top><B>Source:</b></td>
<td><li><b>Asai, T., Tena, G., Plotnikova, J., Willmann, M. R., Chiu, W. L., Gomez-Gomez, L., Boller, T., Ausubel, F. M., Sheen, J.</b> (2002) <a href="/servlets/TairObject?type=publication&id=1547411" target="new">MAP kinase signalling cascade in Arabidopsis innate immunity.</a> Nature <b>415: </b>977-983
<br><li><b>Tena G, Asai T, Chiu WL, Sheen J.</b> (2001) <a href="/servlets/TairObject?type=publication&id=501710452">Plant mitogen-activated protein kinase signaling cascades.</a> Curr Opin Plant Biol.<b>4: </b>392-400
<br><li> <b>Kovtun, Y., Chiu, W. L., Tena, G., Sheen, J.</b> (2000) <a href="/servlets/TairObject?type=publication&id=658" target=new>Functional analysis of oxidative stress-activated mitogen-activated protein kinase cascade in plants.</a> PNAS  <b>97: </b>2940-2945
<br><li><A href="http://genetics.mgh.harvard.edu/sheenweb/">The Sheen Lab Web Page</A></TD></tr>


<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></td><td>The necessary and sufficient criterion used is the presence of the signature GTxxYMSPER in the activation domain (also called T-loop) between kinase subdomains VII and VIII. Only MKK1/4/5 were experimentally determined to act biochemically and/or physiologically as MAPKKs.</td></tr>

<tr><td></td></tr><TR><TD valign=top><B>Contact:</b></td>
<TD><A HREF=/servlets/Community?action=view&type=person&communityID=6184 target="new">Jen Sheen</A>
<br>
<a href="/servlets/Community?action=view&type=person&communityID=1012626" target=new>Guillaume Tena</a>
<br>
<a href="/servlets/Community?action=view&type=person&communityID=218" target=new>Yanxia Liu</A>
<br>
<a href="/servlets/Community?action=view&type=person&communityID=1113137" target=new>Cheri Chen</A></td></tr>
</table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation:</B></TH>

         </TR>

<tr class="alt"><td rowspan=10 valign=top><b>MAP Kinase Kinase</b></td>

       <td>MKK1</td>

       <td>F20B18.180<br><a href=/servlets/TairObject?type=locus&name=At4g26070 target="new">At4g26070</A></td>

       <td>CAB79462</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g26070 target="new">mitogen activated protein kinase kinase (nMAPKK)</A></td>

        </tr>
<tr class="alt">

       <td>MKK2</td>

       <td>F27B13.50<br><a href=/servlets/TairObject?type=locus&name=At4g29810 target="new">At4g29810</A></td>

       <td>AAK60281</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g29810 target="new">MAP kinase kinase 2</A></td>

        </tr>
<tr class="alt">

       <td>MKK3</td>

       <td>MPO12.150<br><a href=/servlets/TairObject?type=locus&name=At5g40440 target="new">At5g40440</A></td>

       <td>BAB11601</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40440 target="new">MAP kinase kinase 3 (ATMKK3)</A></td>

        </tr>
<tr class="alt">

       <td>MKK4</td>

       <td>F19C24.26<br><a href=/servlets/TairObject?type=locus&name=At1g51660 target="new">At1g51660</A></td>

       <td>AAG50863</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51660 target="new">MAP kinase kinase 4 (ATMKK4)</A></td>

        </tr>
<tr class="alt">

       <td>MKK5</td>

       <td>MXL8.8<br><a href=/servlets/TairObject?type=locus&name=At3g21220 target="new">At3g21220</A></td>

       <td>BAB01714</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g21220 target="new">MAP kinase kinase 5 </A></td>

        </tr>
<tr class="alt">

       <td>MKK6</td>

       <td>MIK19.2<br><a href=/servlets/TairObject?type=locus&name=At5g56580 target="new">At5g56580</A></td>

       <td>BAB09875</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g56580 target="new">protein kinase MEK1 homolog</A></td>

        </tr>
<tr class="alt">

       <td>MKK7</td>

       <td>F15H18.5<br><a href=/servlets/TairObject?type=locus&name=At1g18350 target="new">At1g18350</A></td>

       <td>AAF25995</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18350 target="new">MAP kinase kinase 5, putative</A></td>

        </tr>
<tr class="alt">

       <td>MKK8</td>

       <td>F28L1.17<br><a href=/servlets/TairObject?type=locus&name=At3g06230 target="new">At3g06230</A></td>

       <td>AAF30316</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06230 target="new">putative MAP kinase</A></td>

        </tr>
<tr class="alt">

       <td>MKK9</td>

       <td>T9L24.8<br><a href=/servlets/TairObject?type=locus&name=At1g73500 target="new">At1g73500</A></td>

       <td>AAG30984</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73500 target="new">MAP kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>MKK10</td>

       <td>F27G20.9<br><a href=/servlets/TairObject?type=locus&name=At1g32320 target="new">At1g32320</A></td>

       <td>AAG60170</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32320 target="new">MAP kinase, putative</A></td>

        </tr>
</table><P>
<center>Last modified on January 15, 2004</center>   


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
