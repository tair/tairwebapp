<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Sulfurtransferasese/Rhodanes Gene Family";
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

<h2>Sulfurtransferasese/Rhodanese Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
    <TD>Bauer, M. & Papenbrock, J. (2002) 
<a href="http://arabidopsis.org/servlets/TairObject?type=publication&id=501682863">Identification and characterization
of single-domain thiosulfate sulfurtransferases from Arabidopsis thaliana. </a>
FEBS Lett. 532, 427-431<br>
<a href="http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/papen.htm">AFGN - sulfurtransferase/rhodanese multi protein family</a></TD></TR>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
    <TD> A thorough molecular characterisation of several members of the protein family by anlysing their expression, subcellular localisation, biochemical properties and function in the organism. All members contain at least one rhodanese signature.</TD></tr>
<TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=2402 target=new>Dr. Jutta Papenbrock</A></td></tr>
</table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=2 valign=top><b>AtStrI</b></td>

       <td>AtStr1</td>

       <td>YUP8H12R_39<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g79230 target="new">At1g79230</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB55306&doptcmdl=GenPept>CAB55306</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79230 target="new">thiosulfate sulfurtransferase 
</A></td>

        </tr>
<tr class="alt">

       <td>AtStr2</td>

       <td>F3O9_26<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g16460 target="new">At1g16460</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB53639&doptcmdl=GenPept>CAB53639</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16460 target="new">thiosulfate sulfurtransferase 
</A></td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>AtStrII</b></td>

       <td>AtStr3</td>

       <td>MYJ24_5<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g23060 target="new">At5g23060</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB09823&doptcmdl=GenPept>BAB09823</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g23060 target="new">similar to unknown protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtStr4</td>

       <td>F2N1_31<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g01050 target="new">At4g01050</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB80914&doptcmdl=GenPept>CAB80914</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g01050 target="new">hypothetical protein
</A></td>

        </tr>
<tr class="alt"><td rowspan=4 valign=top><b>AtStrIII</b></td>

       <td>AtStr5</td>

       <td>F12E4_220<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g03455 target="new">At5g03455</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB83305&doptcmdl=GenPept>CAB83305</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g03455 target="new">putative protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtStr6</td>

       <td>T12M4_1<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g09280 target="new">At1g09280</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK82550&doptcmdl=GenPept>AAK82550</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09280 target="new">At1g09280/T12M4_1
</A></td>

        </tr>
<tr class="alt">

       <td>AtStr7</td>

       <td>T7D17_6<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g40760 target="new">At2g40760</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD32803&doptcmdl=GenPept>AAD32803</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40760 target="new">unknown protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtStr8</td>

       <td>F2H15_7<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g17850 target="new">At1g17850</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF97265&doptcmdl=GenPept>AAF97265</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17850 target="new">Contains a Rhodanese-like PF|00581 domain
</A></td>

        </tr>
<tr class="alt"><td rowspan=3 valign=top><b>AtStrIV</b></td>

       <td>AtStr9</td>

       <td>T24P15_13<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g42220 target="new">At2g42220</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAB88647&doptcmdl=GenPept>AAB88647</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42220 target="new">hypothetical protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtStr10</td>

       <td>T16O11_14<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g08920 target="new">At3g08920</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF07833&doptcmdl=GenPept>AAF07833</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g08920 target="new">unknown protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtStr11</td>

       <td>F22K18_50<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g24750 target="new">At4g24750</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAA22988&doptcmdl=GenPept>CAA22988</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g24750 target="new">putative protein
</A></td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>AtStrV</b></td>

       <td>AtStr12</td>

       <td>F7K24_120<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g19370 target="new">At5g19370</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK43980&doptcmdl=GenPept>AAK43980</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g19370 target="new">putative peptidyl-prolyl cis-trans isomerase
</A></td>

        </tr>
<tr class="alt">

       <td>AtStr13</td>

       <td>MCO15_8<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g55130 target="new">At5g55130</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD18050&doptcmdl=GenPept>AAD18050</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55130 target="new">molybdopterin synthase sulphurylase
</A></td>

        </tr>
<tr class="alt"><td rowspan=5 valign=top><b>AtStrVI</b></td>

       <td>AtStr14</td>

       <td>T29A15<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g27700 target="new">At4g27700</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB38282&doptcmdl=GenPept>CAB38282</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g27700 target="new">hypothetical protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtStr15</td>

       <td>F8D20_280<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g35770 target="new">At4g35770</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAA80303&doptcmdl=GenPept>AAA80303</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g35770 target="new">senescence-associated protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtStr16</td>

       <td>K2A18_11<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g66040 target="new">At5g66040</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10409&doptcmdl=GenPept>BAB10409</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g66040 target="new">senescence-associated protein sen1-like protein; ketoconazole resistance protein-like
</A></td>

        </tr>
<tr class="alt">

       <td>AtStr17</td>

       <td>T13L16_13<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g17850 target="new">At2g17850</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD03573&doptcmdl=GenPept>AAD03573</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g17850 target="new">putative senescence-associated rhodanese protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtStr18</td>

       <td>K2A18_25<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g66170 target="new">At5g66170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10422&doptcmdl=GenPept>BAB10422</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g66170 target="new">senescence-associated protein sen1-like protein
</A></td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified on October 14, 2003</center>       

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
