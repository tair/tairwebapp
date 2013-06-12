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
<h2><i>Arabidopsis</i> PP2C-type Phosphatase Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Schweighofer, A., Hirt , H., and Meskiene, I. (2004) <a href="http://arabidopsis.org/servlets/TairObject?type=publication&id=501712502">Plant PP2C
phosphatases: emerging functions in stress signaling.</a> Trends in Plant
Science 9(5): 236-243.<br>
<a href="http://www.univie.ac.at/genetik/research/Meskiene/meskiene.html">Arabidopsis PP2Cs</a></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Defined by the presence of the PP2C catalytic domain</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=3269 target=new>Irute Meskiene</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=9 valign=top><b>Group A</b></td>

       <td>&nbsp;</td>

       <td>MIO24_11<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g51760 target="new">AT5g51760</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_199989&doptcmdl=GenPept>NP_199989</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g51760 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>AtPP2CA</td>

       <td>F24K9_8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g11410 target="new">AT3g11410</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_187748&doptcmdl=GenPept>NP_187748</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g11410 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>MNC17_13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g59220 target="new">AT5g59220</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_200730&doptcmdl=GenPept>NP_200730</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g59220 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F22G5_22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g07430 target="new">AT1g07430</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_172223&doptcmdl=GenPept>NP_172223</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g07430 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F16P2_2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g29380 target="new">AT2g29380</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_180499&doptcmdl=GenPept>NP_180499</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g29380 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>HAB2</td>

       <td>F1L3_38<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g17550 target="new">At1g17550</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_173199&doptcmdl=GenPept>NP_173199</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g17550 target="new">protein phosphatase 2C-related
</A></td>

        </tr>
<tr class="alt">

       <td>HAB1</td>

       <td>F28P22_4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g72770 target="new">AT1g72770</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_177421&doptcmdl=GenPept>NP_177421</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g72770 target="new">protein phosphatase 2C P2C-HA
</A></td>

        </tr>
<tr class="alt">

       <td>ABI1</td>

       <td>F20B18_190<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4g26080 target="new">AT4g26080</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_194338&doptcmdl=GenPept>NP_194338</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g26080 target="new">protein phosphatase 2C ABI1
</A></td>

        </tr>
<tr class="alt">

       <td>ABI2</td>

       <td>MHM17_19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g57050 target="new">AT5g57050</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_200515&doptcmdl=GenPept>NP_200515</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g57050 target="new">protein phosphatase 2C ABI2
</A></td>

        </tr>
<tr class="alt"><td rowspan=6 valign=top><b>Group B</b></td>

       <td>AP2C4</td>

       <td>F12A21_5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g67820 target="new">AT1g67820</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_176948&doptcmdl=GenPept>NP_176948</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g67820 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>AthPP2C5</td>

       <td>T7M7_17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g40180 target="new">AT2g40180</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_181547&doptcmdl=GenPept>NP_181547</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g40180 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>AP2C2</td>

       <td>F10K1_13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g07160 target="new">AT1g07160</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_172196&doptcmdl=GenPept>NP_172196</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g07160 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>AP2C1</td>

       <td>F23F1_6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g30020 target="new">AT2g30020</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_180563&doptcmdl=GenPept>NP_180563</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g30020 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>AP2C6</td>

       <td>MYF5_1<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g27140 target="new">AT3g27140</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_189350&doptcmdl=GenPept>NP_189350</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g27140 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>AP2C5</td>

       <td>T12G13_100<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4g08260 target="new">AT4g08260</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_192566&doptcmdl=GenPept>NP_192566</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g08260 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt"><td rowspan=7 valign=top><b>Group C</b></td>

       <td>&nbsp;</td>

       <td>MGL6_2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g16560 target="new">AT3g16560</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_566554&doptcmdl=GenPept>NP_566554</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g16560 target="new">protein phosphatase 2C-related
</A></td>

        </tr>
<tr class="alt">

       <td>AtPOL</td>

       <td>F14M4_25<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g46920 target="new">AT2g46920</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_850463&doptcmdl=GenPept>NP_850463</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g46920 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtPLL1</td>

       <td>T32F12_27<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g35350 target="new">AT2g35350</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_181078&doptcmdl=GenPept>NP_181078</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g35350 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtPLL5</td>

       <td>F24B9_31<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g07630 target="new">AT1g07630</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_563791&doptcmdl=GenPept>NP_563791</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g07630 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtPLL4</td>

       <td>F8N16_18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g28890 target="new">AT2g28890</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_180455&doptcmdl=GenPept>NP_180455</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g28890 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtPLL3</td>

       <td>F3L24_29<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g09400 target="new">AT3g09400</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_187551&doptcmdl=GenPept>NP_187551</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g09400 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtPLL2</td>

       <td>T1E22_160<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g02400 target="new">AT5g02400</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_195860&doptcmdl=GenPept>NP_195860</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g02400 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt"><td rowspan=9 valign=top><b>Group D</b></td>

       <td>&nbsp;</td>

       <td>F9G14_70<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g02760 target="new">AT5g02760</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_195896&doptcmdl=GenPept>NP_195896</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g02760 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>K14A17_4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g17090 target="new">AT3g17090</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_566566&doptcmdl=GenPept>NP_566566</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g17090 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T2E22_7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g12620 target="new">AT3g12620</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_187868&doptcmdl=GenPept>NP_187868</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g12620 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T15C9_50<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g55050 target="new">AT3g55050</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_191065&doptcmdl=GenPept>NP_191065</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55050 target="new">serine/threonine protein phosphatase 2C (PP2C6)
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F22I13_4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4g38520 target="new">AT4g38520</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_195564&doptcmdl=GenPept>NP_195564</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38520 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F26O13_10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g51370 target="new">AT3g51370</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_566949&doptcmdl=GenPept>NP_566949</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g51370 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>K2A18_16<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g66080 target="new">AT5g66080</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_201409&doptcmdl=GenPept>NP_201409</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g66080 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F17I5_110<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4g33920 target="new">AT4g33920</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_195118&doptcmdl=GenPept>NP_195118</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33920 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>MPH15_11<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g06750 target="new">AT5g06750</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_568174&doptcmdl=GenPept>NP_568174</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g06750 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt"><td rowspan=13 valign=top><b>Group E</b></td>

       <td>AtPP2C6-6</td>

       <td>F21B7_20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g03590 target="new">AT1g03590</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_171856&doptcmdl=GenPept>NP_171856</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g03590 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F3O9_3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g16220 target="new">AT1g16220</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_173072&doptcmdl=GenPept>NP_173072</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g16220 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F20B17_6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g79630 target="new">AT1g79630</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_178081&doptcmdl=GenPept>NP_178081</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g79630 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F7A7_220<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g01700 target="new">AT5g01700</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_195790&doptcmdl=GenPept>NP_195790</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g01700 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F13E7_31<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g02750 target="new">AT3g02750</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_186924&doptcmdl=GenPept>NP_186924</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g02750 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T30G6_11<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g36250 target="new">AT5g36250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_198474&doptcmdl=GenPept>NP_198474</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g36250 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T1N24_8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g26010 target="new">AT5g26010</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_197973&doptcmdl=GenPept>NP_197973</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g26010 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F26P21_70<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4g32950 target="new">AT4g32950</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_195021&doptcmdl=GenPept>NP_195021</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g32950 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>K20I9_2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g16800 target="new">AT3g16800</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_188303&doptcmdl=GenPept>NP_188303</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g16800 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F18C1_9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g05640 target="new">AT3g05640</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_187215&doptcmdl=GenPept>NP_187215</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g05640 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>AtPP2C6-7</td>

       <td>F14I23_90<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g27930 target="new">AT5g27930</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_851086&doptcmdl=GenPept>NP_851086</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g27930 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T2G17_15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g20050 target="new">AT2g20050</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_179595&doptcmdl=GenPept>NP_179595</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g20050 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F28L1_21<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g06270 target="new">AT3g06270</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_187278&doptcmdl=GenPept>NP_187278</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g06270 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt"><td rowspan=13 valign=top><b>Group F</b></td>

       <td>&nbsp;</td>

       <td>MLM24_7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g23360 target="new">AT3g23360</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_188978&doptcmdl=GenPept>NP_188978</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g23360 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T29F13_5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g34740 target="new">AT2g34740</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_181021&doptcmdl=GenPept>NP_181021</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g34740 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T11I11_14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g78200 target="new">AT1g78200</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_565172&doptcmdl=GenPept>NP_565172</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g78200 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T16E15_10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g22280 target="new">AT1g22280</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564165&doptcmdl=GenPept>NP_564165</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g22280 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F21H2_4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g34750 target="new">AT1g34750</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_174731&doptcmdl=GenPept>NP_174731</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g34750 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>K7L4_6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g15260 target="new">AT3g15260</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_188144&doptcmdl=GenPept>NP_188144</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g15260 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F23N11_5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g20630 target="new">AT2g20630</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_565480&doptcmdl=GenPept>NP_565480</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g20630 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F20O9_80<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4g28400 target="new">AT4g28400</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_567808&doptcmdl=GenPept>NP_567808</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g28400 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F9C16_6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g43900 target="new">AT1g43900</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_175057&doptcmdl=GenPept>NP_175057</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g43900 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>MFH8_8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g53140 target="new">AT5g53140</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_568786&doptcmdl=GenPept>NP_568786</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g53140 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F28M20_60<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4g31750 target="new">AT4g31750</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_194903&doptcmdl=GenPept>NP_194903</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g31750 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F6A4_150<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g24940 target="new">AT5g24940</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_197876&doptcmdl=GenPept>NP_197876</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g24940 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>MAJ23_3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g10740 target="new">AT5g10740</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_568237&doptcmdl=GenPept>NP_568237</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g10740 target="new">protein phosphatase 2C-related
</A></td>

        </tr>
<tr class="alt"><td rowspan=6 valign=top><b>Group G</b></td>

       <td>&nbsp;</td>

       <td>T17J13_220<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g62260 target="new">AT3g62260</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_191785&doptcmdl=GenPept>NP_191785</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g62260 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T2J15_5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g48040 target="new">AT1g48040</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_175238&doptcmdl=GenPept>NP_175238</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g48040 target="new">protein phosphatase 2C-related
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>MGD8_13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g17250 target="new">AT3g17250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_188351&doptcmdl=GenPept>NP_188351</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g17250 target="new">protein phosphatase 2C-related
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F3N11_7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g25620 target="new">AT2g25620</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_180133&doptcmdl=GenPept>NP_180133</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g25620 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T1B8_2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g33700 target="new">AT2g33700</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_180926&doptcmdl=GenPept>NP_180926</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g33700 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F26O13_110<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g51470 target="new">AT3g51470</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_190715&doptcmdl=GenPept>NP_190715</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g51470 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt"><td rowspan=3 valign=top><b>Group H</b></td>

       <td>&nbsp;</td>

       <td>T12M4_15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g09160 target="new">AT1g09160</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_172388&doptcmdl=GenPept>NP_172388</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g09160 target="new">protein phosphatase 2C-related
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T3F24_2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g47380 target="new">AT1g47380</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564504&doptcmdl=GenPept>NP_564504</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g47380 target="new">protein phosphatase 2C-related
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T2E12_9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g68410 target="new">AT1g68410</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_177008&doptcmdl=GenPept>NP_177008</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g68410 target="new">protein phosphatase 2C-related
</A></td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>Group I</b></td>

       <td>&nbsp;</td>

       <td>F27C12_1<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g25070 target="new">AT2g25070</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_180079&doptcmdl=GenPept>NP_180079</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g25070 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F11C18_60<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4g31860 target="new">AT4g31860</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_194914&doptcmdl=GenPept>NP_194914</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g31860 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>Group J</b></td>

       <td>&nbsp;</td>

       <td>F16M2_170<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g63320 target="new">AT3g63320</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_191891&doptcmdl=GenPept>NP_191891</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g63320 target="new">protein phosphatase 2C-related
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F16M2_190<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g63340 target="new">AT3g63340</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_567145&doptcmdl=GenPept>NP_567145</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g63340 target="new">protein phosphatase 2C-related
</A></td>

        </tr>
<tr class="alt"><td>&nbsp;</td>

       <td>&nbsp;</td>

       <td>T22B4_20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4g11040 target="new">AT4g11040</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_192842&doptcmdl=GenPept>NP_192842</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g11040 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt"><td>&nbsp;</td>

       <td>&nbsp;</td>

       <td>F9E10_14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g75010 target="new">AT1g75010</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_177638&doptcmdl=GenPept>NP_177638</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g75010 target="new">MORN (Membrane Occupation and Recognition Nexus) repeat-containing protein
</A></td>

        </tr>
<tr class="alt"><td>&nbsp;</td>

       <td>&nbsp;</td>

       <td>T10F20_4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g18030 target="new">AT1g18030</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564045&doptcmdl=GenPept>NP_564045</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g18030 target="new">"protein phosphatase 2C, putative"
</A></td>

        </tr>
<tr class="alt"><td>&nbsp;</td>

       <td>PPH1</td>

       <td>T27E11_40<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4g27800 target="new">AT4g27800</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_849459&doptcmdl=GenPept>NP_849459</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g27800 target="new">protein phosphatase 2C PPH1
</A></td>

        </tr>
<tr class="alt"><td>&nbsp;</td>

       <td>&nbsp;</td>

       <td>T20B5_7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g40860 target="new">AT2g40860</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_850336&doptcmdl=GenPept>NP_850336</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g40860 target="new">protein phosphatase 2C family protein
</A></td>

        </tr>
<tr class="alt"><td>&nbsp;</td>

       <td>KAPP</td>

       <td>F7K24_30<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g19280 target="new">AT5g19280</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_197429&doptcmdl=GenPept>NP_197429</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g19280 target="new">kinase associated protein phosphatase (KAPP)
</A></td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified on August 19, 2004</center>    

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
