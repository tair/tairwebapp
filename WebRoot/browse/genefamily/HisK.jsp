<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Gene Family: Histidine Kinase";
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
<h2><i>Arabidopsis</i> Histidine Kinase Gene Family</span></h2>

<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><li><b>Sheen, J.</b> (2002) <a href="/servlets/TairObject?type=publication&id=501681603" target=new>Phosphorelay and transcription control in cytokinin signal transduction.</a> Science <b>296: </b>1650-1652
<br><li><b>Hwang, I. and Sheen, J.</b> (2001) <a href="/servlets/TairObject?type=publication&id=501680564" target=new>Two-component circuitry in Arabidopsis cytokinin signal transduction.</a> Nature <b>413: </b>383-389
<br><li><b>Hwang, I, Chen, H.-C. and Sheen. J.</b> (2002) <a href="/servlets/TairObject?type=publication&id=501681565" target=new>Two-Component Signal Transduction Pathways in Arabidopsis. </a>Plant Physiology<b>129: </b>500-515</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Please refer to the papers above for more details.</td></tr>
<TR><TD valign=top><B>Contact:</b></td>
<TD><A HREF=/servlets/Community?action=view&type=person&communityID=6184 target="new">Jen Sheen</A>

<br><a href=/servlets/Community?type=person&action=view&communityID=1113137 target=new>Huei-Chi Chen</A>

<br><a href="/servlets/Community?action=view&type=person&communityID=10719" target=new>Ildoo Hwang</a>

<BR><A href="/servlets/Community?action=view&type=person&communityID=218" target=new>Yanxia Liu</A>


</tr></table><p>



  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation:</B></TH>

         </TR>

<tr class="alt"><td rowspan=16 valign=top><b>Histidine Kinase</b></td>

       <td>CKI1</td>

       <td>T30B22.27<br><a href=/servlets/TairObject?type=locus&name=At2g47430 target="new">At2g47430</A></td>

       <td>AAC62867</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47430 target="new">putative histidine kinase</A></td>

        </tr>
<tr class="alt">

       <td>AHK1 (AtHK1)</td>

       <td>T13L16.16<br><a href=/servlets/TairObject?type=locus&name=At2g17820 target="new">At2g17820</A></td>

       <td>AAD03576</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g17820 target="new">putative histidine kinase</A></td>

        </tr>
<tr class="alt">

       <td>AHK2</td>

       <td>MXH1.16<br><a href=/servlets/TairObject?type=locus&name=At5g35750 target="new">At5g35750</A></td>

       <td>BAB09274</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g35750 target="new">histidine kinase-like protein</A></td>

        </tr>
<tr class="alt">

       <td>AHK3</td>

       <td>F17L21.11<br><a href=/servlets/TairObject?type=locus&name=At1g27320 target="new">At1g27320</A></td>

       <td>AAF99730</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27320 target="new">putative sensory transduction histidine kinase</A></td>

        </tr>
<tr class="alt">

       <td>CRE1 (AHK4,WOL1)</td>

       <td>T23K3.2<br><a href=/servlets/TairObject?type=locus&name=At2g01830 target="new">At2g01830</A></td>

       <td>AAD21777</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01830 target="new">putative histidine kinase</A></td>

        </tr>
<tr class="alt">

       <td>CKI2 (AHK5)</td>

       <td>MAJ23.80<br><a href=/servlets/TairObject?type=locus&name=At5g10720 target="new">At5g10720</A></td>

       <td>CAC08246</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g10720 target="new">histidine kinase - like protein </A></td>

        </tr>
<tr class="alt">

       <td>ETR1</td>

       <td>T27F4.9<br><a href=/servlets/TairObject?type=locus&name=At1g66340 target="new">At1g66340</A></td>

       <td>AAG52169</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66340 target="new">ethylene-response protein, ETR1</A></td>

        </tr>
<tr class="alt">

       <td>ERS1 </td>

       <td>T20B5.14<br><a href=/servlets/TairObject?type=locus&name=At2g40940 target="new">At2g40940</A></td>

       <td>AAB86454</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40940 target="new">ethylene response sensor (ERS) </A></td>

        </tr>
<tr class="alt">

       <td>ETR2</td>

       <td>K14B15.9<br><a href=/servlets/TairObject?type=locus&name=At3g23150 target="new">At3g23150</A></td>

       <td>AAC62208</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g23150 target="new">ethylene receptor, putative (ETR2)</A></td>

        </tr>
<tr class="alt">

       <td>EIN4     </td>

       <td>F7O18.5<br><a href=/servlets/TairObject?type=locus&name=At3g04580 target="new">At3g04580</A></td>

       <td>AAF04908</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g04580 target="new">putative ethylene receptor (EIN4)</A></td>

        </tr>
<tr class="alt">

       <td>ERS2</td>

       <td>F19P19.25<br><a href=/servlets/TairObject?type=locus&name=At1g04310 target="new">At1g04310</A></td>

       <td>AAC62209</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04310 target="new">putative ethylene receptor (ERS2)</A></td>

        </tr>
<tr class="alt">

       <td>PHYA</td>

       <td>F14J9.23<br><a href=/servlets/TairObject?type=locus&name=At1g09570  target="new">At1g09570 </A></td>

       <td>AAK62577</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09570  target="new">putative phytochrome A</A></td>

        </tr>
<tr class="alt">

       <td>PHYB</td>

       <td>MSF3.17<br><a href=/servlets/TairObject?type=locus&name=At2g18790   target="new">At2g18790  </A></td>

       <td>AAD08948</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18790   target="new">phytochrome B</A></td>

        </tr>
<tr class="alt">

       <td>PHYC</td>

       <td>MIK22.15<br><a href=/servlets/TairObject?type=locus&name=At5g35840   target="new">At5g35840  </A></td>

       <td>BAB09925</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g35840   target="new">phytochrome C (sp|P14714)</A></td>

        </tr>
<tr class="alt">

       <td>PHYD</td>

       <td>dl4165c<br><a href=/servlets/TairObject?type=locus&name=At4g16250   target="new">At4g16250  </A></td>

       <td>CAB10404</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g16250   target="new">phytochrome D</A></td>

        </tr>
<tr class="alt">

       <td>PHYE</td>

       <td>F15J5.100<br><a href=/servlets/TairObject?type=locus&name=At4g18130  target="new">At4g18130 </A></td>

       <td>CAB78815</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18130  target="new">phytochrome E</A></td>

        </tr>
</table><P>
<center>Last modified on January 14, 2004</center>     

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
