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
<h2><i>Arabidopsis</i> RAD5/RAD16-like Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><A HREF="http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/puchta.htm">Molecular Characterization of the RAD5/RAD16-like Gene Family of Arabidopsis</A></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Defined by the presence of the helicase/ATPase motives 1-6 and the ringfinger domain.</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=1665 target=new>Holger Puchta</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td valign=top rowspan=10><b>Rad5/16 gene family</b></td>

       <td>At1g02670</td>

       <td>T14P4_33<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g02670 target="new">At1g02670</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_171767&doptcmdl=GenPept>NP_171767</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02670 target="new">unknown protein/MIPS
</A></td>

        </tr>
<tr class="alt">

       <td>At1g05120</td>

       <td>yUP8H12_27<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g05120 target="new">At1g05120</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_172004&doptcmdl=GenPept>NP_172004</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05120 target="new">unknown protein/MIPS
</A></td>

        </tr>
<tr class="alt">

       <td>At1g11100</td>

       <td>T19D16_2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g11100 target="new">At1g11100</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_172577&doptcmdl=GenPept>NP_172577</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11100 target="new">transcription factor RUSH-1alpha isolog/MIPS
</A></td>

        </tr>
<tr class="alt">

       <td>At1g50410</td>

       <td>F11F12_24<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g50410 target="new">At1g50410</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564568&doptcmdl=GenPept>NP_564568</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g50410 target="new">unknown protein/MIPS
</A></td>

        </tr>
<tr class="alt">

       <td>At1g61140</td>

       <td>F11P17_13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g61140 target="new">At1g61140</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_176309&doptcmdl=GenPept>NP_176309</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61140 target="new">unknown protein/MIPS
</A></td>

        </tr>
<tr class="alt">

       <td>At3g16600</td>

       <td>MGL6_5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g16600 target="new">At3g16600</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_188282&doptcmdl=GenPept>NP_188282</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16600 target="new">putative DNA-binding protein/MIPS
</A></td>

        </tr>
<tr class="alt">

       <td>At3g20010</td>

       <td>MZE19_6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g20010 target="new">At3g20010</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_188635&doptcmdl=GenPept>NP_188635</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g20010 target="new">"uteroglobin promoter-binding protein, RUSH-1alpha-like, putative/MIPS"
</A></td>

        </tr>
<tr class="alt">

       <td>At5g05130</td>

       <td>MUG13_1<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g05130 target="new">At5g05130</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_196132&doptcmdl=GenPept>NP_196132</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g05130 target="new">helicase-like transcription factor-like protein/MIPS
</A></td>

        </tr>
<tr class="alt">

       <td>At5g22750</td>

       <td>MDJ22_17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g22750 target="new">At5g22750</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB11681&doptcmdl=GenPept>BAB11681</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g22750 target="new">Rad5/TAIR
</A></td>

        </tr>
<tr class="alt">

       <td>At5g43530</td>

       <td>K9D7_2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g43530 target="new">At5g43530</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_199166&doptcmdl=GenPept>NP_199166</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g43530 target="new">DNA repair protein-like/MIPS
</A></td>

        </tr>
</table><P>

<A href=index.jsp>Return to Gene Family Index</A><P>

<center>Last modified on January 14, 2004</center>            


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
