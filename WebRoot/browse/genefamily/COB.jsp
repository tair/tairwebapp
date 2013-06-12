<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Gene Family: Arabidopsis COBRA family";
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
<h2><i>Arabidopsis</i> COBRA Gene Family</h2>

<table border=0 cellspacing=0 cellpadding=2>

<TR><TD valign=top><B>Source:</B></TD>
<TD><b>Roudier F., Schindelman G., DeSalle R., Benfey P.N</b> (October 2002)<a href="/servlets/TairObject?type=publication&id=501682655"> The COBRA family of GPI-anchored proteins in Arabidopsis. A new fellowship in expansion.</a> Plant Physiology 130:538-48
</td></tr>

<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>

<td><table><tr><td rowspan=3 valign=top>- sequence homology:</td><td>subfamily1 members share 36 to 71% identity</td></tr> <tr><td>subfamily2 members share 41 to 73% identity</td></tr>  <tr><td>intersubfamily1/2 identity ranges from 13 to 25%</td></tr></table>
- phylogenetic analysis<br>
- intron-exon gene structure 
<br><i>(please see the above paper for more details)</i></td></tr>

<tr><TD valign=top><B>Other Information:</B></TD>
<td>- <u>TIGR annotation</u>: The phytochelatin synthetase annotation of COBRA, COBL2 and COBL4-6 is incorrect. Originally, a truncated cDNA (corresponding to a non-functional COBRA)
was shown to complement a yeast mutant deficient in phytochelatin
synthesis (Leuchter R, wolf K, Zimmermann M (1998) PGR 98-147 Plant
Physiol 117: 1526).
The members of the COBRA family do not have any significant homology with
phytochelatin synthetase. They might however be able to bind heavy
metals. <br>
- <u>Gene product prediction</u>: At5g15630 (cobl4) lacks a first exon (36aa). The genomic sequences of At3g02210 (cobl2) and F21N10.4 (cobl3) are
identical but their respective coding regions have been annotated
differently. At1g09790 is mis-annotated (wrong intron-exon junctions). </td></tr>


<TR><TD valign=top><B>Contact:</b></td>

<td><a href=/servlets/Community?action=view&type=person&communityID=4729 target=new>Philip Benfey</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation:</B></TH>

         </TR>

<tr class="alt"><td rowspan=7 valign=top><b>Arabidopsis COBRA family: Subfamily1</b></td>

       <td>COB:COBRA</td>

       <td>MSL3.4<br><a href=/servlets/TairObject?type=locus&name=At5g60920 target="new">At5g60920</A></td>

       <td><A href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=search&db=protein&term=AAK56072&doptcmdl=GenPept">AAK56072</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60920 target="new">phytochelatin synthetase - like protein</A></td>

        </tr>
<tr class="alt">

       <td>COBL1:COBRA-LIKE1</td>

       <td>F14P3.14<br><a href=/servlets/TairObject?type=locus&name=At3g02210 target="new">At3g02210</A></td>

   <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=search&db=protein&term=AAF02128&doptcmdl=GenPept">AAF02128</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02210 target="new">unknown protein </A></td>

        </tr>
<tr class="alt">

       <td>COBL2:COBRA-LIKE2</td>

       <td>K17E7.12<br><a href=/servlets/TairObject?type=locus&name=At3g29810 target="new">At3g29810</A></td>

   <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=search&db=protein&term=BAB02996&doptcmdl=GenPept">BAB02996</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g29810 target="new">phytochelatin synthetase-like protein</A></td>

        </tr>
<tr class="alt">

       <td>COBL3:COBRA-LIKE3</td>

       <td>F21N10.4<br>At1g-----</td>

   <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=search&db=protein&term=AAG12670&doptcmdl=GenPept">AAG12670</A></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>COBL4:COBRA-LIKE4</td>

       <td>F14F8.10<br><a href=/servlets/TairObject?type=locus&name=At5g15630 target="new">At5g15630</A></td>

   <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=search&db=protein&term=CAC01762&doptcmdl=GenPept">CAC01762</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g15630 target="new">putative phytochelatin synthetase</A></td>

        </tr>
<tr class="alt">

       <td>COBL5:COBRA-LIKE5</td>

       <td>MSL3.7<br><a href=/servlets/TairObject?type=locus&name=At5g60950 target="new">At5g60950</A></td>

   <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=search&db=protein&term=BAB10644&doptcmdl=GenPept">BAB10644</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60950 target="new">putative phytochelatin synthetase - like</A></td>

        </tr>
<tr class="alt">

       <td>COBL6:COBRA-LIKE6</td>

       <td>F21M12.17<br><a href=/servlets/TairObject?type=locus&name=At1g09790 target="new">At1g09790</A></td>

   <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=search&db=protein&term=AAB60732&doptcmdl=GenPept">AAB60732</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09790 target="new">putative phytochelatin synthetase </A></td>

        </tr>
<tr><td rowspan=5 valign=top><b>Arabidopsis COBRA family: Subfamily2</b></td>

       <td>COBL7:COBRA-LIKE7</td>

       <td>dl4100c<br><a href=/servlets/TairObject?type=locus&name=At4g16120 target="new">At4g16120</A></td>

   <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=search&db=protein&term=CAA74765&doptcmdl=GenPept">CAA74765</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g16120 target="new">expressed protein</A></td>

        </tr>
<tr>

       <td>COBL8:COBRA-LIKE8</td>

       <td>MUH15.2<br><a href=/servlets/TairObject?type=locus&name=At3g16860 target="new">At3g16860</A></td>

   <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=search&db=protein&term=BAB00585&doptcmdl=GenPept">BAB00585</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16860 target="new">unknown protein</A></td>

        </tr>
<tr>

       <td>COBL9:COBRA-LIKE9</td>

       <td>K21P3.15<br><a href=/servlets/TairObject?type=locus&name=At5g49270 target="new">At5g49270</A></td>

   <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=search&db=protein&term=BAB10345&doptcmdl=GenPept">BAB10345</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49270 target="new">putative protein</A></td>

        </tr>
<tr>

       <td>COBL10:COBRA-LIKE10</td>

       <td>K10D20.12<br><a href=/servlets/TairObject?type=locus&name=At3g20580 target="new">At3g20580</A></td>

   <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=search&db=protein&term=BAB01166&doptcmdl=GenPept">BAB01166</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g20580 target="new">hypothetical protein</A></td>

        </tr>
<tr>

       <td>COBL11:COBRA-LIKE11</td>

       <td>T24A18.6<br><a href=/servlets/TairObject?type=locus&name=At4g27110 target="new">At4g27110</A></td>

   <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=search&db=protein&term=CAB38841&doptcmdl=GenPept">CAB38841</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g27110 target="new">putative protein</A></td>

        </tr>
</table><P>
<center>Last modified on January 14, 2004</center>     

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
