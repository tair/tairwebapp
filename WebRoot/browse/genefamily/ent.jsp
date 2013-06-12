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
<h2>The <i>Arabidopsis</i> Equilibrative Nucleoside Transporter Gene Family (ENT)</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>


<TD>

Alexandra Wormit, Michaela Traub, Martin Florchinger, H. Ekkehard Neuhaus
und Torsten Mohlmann (2004) <a href=http://arabidopsis.org/servlets/TairObject?type=publication&id=501712559>Characterisation of three novel members of the Arabidopsis thaliana
equilibrative nucleoside transporter (ENT) family.</a>
Biochemical Journal. <BR>
Li G, Liu K, Baldwin SA, Wang D. (2003) <a href=http://arabidopsis.org/servlets/TairObject?type=publication&id=501706927>Equilibrative nucleoside transporters of Arabidopsis thaliana. cDNA cloning, expression pattern, and analysis of transport activities.</a> J Biol Chem. 278:35732.
<br>
Mohlmann T, Mezher Z, Schwerdtfeger G, Neuhaus HE. (2001)<A HREF=http://arabidopsis.org/servlets/TairObject?type=publication&id=1546203> 
Characterisation
of a concentrative type of adenosine transporter from Arabidopsis thaliana
(ENT1).</A> FEBS Lett. 509:370-4<BR>
<a href=http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/moehl.htm>Plant Nucleoside Transporters</a></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Gene family members share homology to human ENTs. Confirmed by
experimental data.</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=2062 target=new>Torsten Moehlmann</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B><BR>
          Alternate Name:</TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=8 valign=top><b>Equilibrative Nucleoside Transporter Family (ENT)</b></td>

       <td>AtENT1<br>
           </td>

       <td>F1707.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g70330 target="new">At1g70330</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC18807&doptcmdl=GenPept>AAC18807</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAC18807&doptcmdl=GenBank>AAC18807</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70330 target="new">equilibrative nucleoside transporter family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtENT2<br>
           </td>

       <td>T22K18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g09990 target="new">At3g09990</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF04424&doptcmdl=GenPept>AAF04424</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAF04424&doptcmdl=GenBank>AAF04424</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g09990 target="new">"equilibrative nucleoside transporter, putative (ENT2)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtENT3<br>
           </td>

       <td>C17L7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g05120 target="new">At4g05120</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB81054&doptcmdl=GenPept>CAB81054</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=CAB81054&doptcmdl=GenBank>CAB81054</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g05120 target="new">"equilibrative nucleoside transporter, putative (ENT3)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtENT4<br>
           </td>

       <td>C17L7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g05130 target="new">At4g05130</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB81055&doptcmdl=GenPept>CAB81055</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=CAB81055&doptcmdl=GenBank>CAB81055</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g05130 target="new">"equilibrative nucleoside transporter, putative (ENT4)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtENT5<br>
           </td>

       <td>C17L7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g05140 target="new">At4g05140</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB81056&doptcmdl=GenPept>CAB81056</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=CAB81056&doptcmdl=GenBank>CAB81056</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g05140 target="new">"equilibrative nucleoside transporter, putative (ENT5)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtENT6<br>
           </td>

       <td>C17L7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g05110 target="new">At4g05110</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB81053&doptcmdl=GenPept>CAB81053</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=CAB81053&doptcmdl=GenBank>CAB81053</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g05110 target="new">"equilibrative nucleoside transporter, putative (ENT6)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtENT7<br>
           </td>

       <td>T25B24<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g61630 target="new">At1g61630</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD25545&doptcmdl=GenPept>AAD25545</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAD25545&doptcmdl=GenBank>AAD25545</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61630 target="new">"equilibrative nucleoside transporter, putative (ENT7)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtENT8<br>
           </td>

       <td>T14P4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g02630 target="new">At1g02630</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG10625&doptcmdl=GenPept>AAG10625</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAG10625&doptcmdl=GenBank>AAG10625</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02630 target="new">"equilibrative nucleoside transporter, putative (ENT8)"
</A></td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified July 29, 2004</center>         



<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
