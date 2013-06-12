<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR- Histidine Phosphotransfer Proteins";
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
<table width="602" align=center border=0 cellspacing=0 cellpadding=2>
        <tr>
                <td width="602"><TR><TD><h2><i>Arabidopsis</i> Histidine Phosphotransfer Proteins</h2>
<table border=0 cellspacing=0 cellpadding=2>

<TR><TD valign=top><B>Source:</B></TD>
<TD><li><b>Sheen, J.</b> (2002) <a href="/servlets/TairObject?type=publication&id=501681603" target=new>Phosphorelay and transcription control in cytokinin signal transduction.</a> Science <b>296: </b>1650-1652
<br><li><b>Hwang, I. and Sheen, J.</b> (2001) <a href="/servlets/TairObject?type=publication&id=501680564" target=new>Two-component circuitry in Arabidopsis cytokinin signal transduction.</a> Nature <b>413: </b>383-389
<br><li><b>Hwang, I, Chen, H.-C. and Sheen. J.</b> (2002) <a href="/servlets/TairObject?type=publication&id=501681565" target=new>Two-Component Signal Transduction Pathways in Arabidopsis. </a>Plant Physiology<b>129: </b>500-515
<BR><LI><A href=http://genetics.mgh.harvard.edu/sheenweb/ target=new>The Sheen Lab Web Page</A></TD></TR>


<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Please refer to the papers above for more details.</td></tr>


<TR><TD valign=top><B>Contact:</b></td>
<td><A HREF=/servlets/Community?action=view&type=person&communityID=6184 target="new">Jen Sheen</A>
<br><a href="/servlets/Community?type=person&action=view&communityID=10719" target=new>Ildoo Hwang </A>

<br><a href="/servlets/Community?type=person&action=view&communityID=5286" target=new>Shu-Hua Cheng</A>
 
<BR><A href=/servlets/Community?type=person&action=view&communityID=1113137 target=new>Huei-Chi Chen</A>

<BR><A href="/servlets/Community?action=view&type=person&communityID=218" target=new>Yanxia Liu</A>



</td></tr></table><p>



  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation:</B></TH>

         </TR>

<tr class="alt"><td rowspan=6 valign=top><b>Histidine Phosphotransfer Proteins</b></td>

       <td>AHP1(AtHP3 )</td>

       <td>MIL23.7<br><a href=/servlets/TairObject?type=locus&name=At3g21510 target="new">At3g21510</A></td>

       <td>AAK44080</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g21510 target="new">two-component phosphorelay mediator, putative</A></td>

        </tr>
<tr class="alt">

       <td>AHP2(AtHP1)</td>

       <td>MUO10.16<br><a href=/servlets/TairObject?type=locus&name=At3g29350 target="new">At3g29350</A></td>

       <td>BAB02580</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g29350 target="new">ATHP2, putative</A></td>

        </tr>
<tr class="alt">

       <td>AHP3(AtHP2)</td>

       <td>MUL8.2<br><a href=/servlets/TairObject?type=locus&name=At5g39340 target="new">At5g39340</A></td>

       <td>BAB11008</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g39340 target="new">His-Asp Phosphotransfer Signal Transducer AHP3</A></td>

        </tr>
<tr class="alt">

       <td>AHP4</td>

       <td>MYA6.17<br><a href=/servlets/TairObject?type=locus&name=At3g16360 target="new">At3g16360</A></td>

       <td>BAB01275</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16360 target="new">putative two-component phosphorelay mediator</A></td>

        </tr>
<tr class="alt">

       <td>AHP5</td>

       <td>F21B7.40<br><a href=/servlets/TairObject?type=locus&name=At1g03430 target="new">At1g03430</A></td>

       <td>AAF86510</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g03430 target="new">putative AHP2</A></td>

        </tr>
<tr class="alt">

       <td>AHP6(AtPHP1)</td>

       <td>F18B13.18<br><a href=/servlets/TairObject?type=locus&name=At1g80100 target="new">At1g80100</A></td>

       <td>AAD55469</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80100 target="new">HPt phosphotransmitter, putative</A></td>

        </tr>
</table><P>
<center>Last modified on January 14, 2004</center>                </td>
        </tr>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
