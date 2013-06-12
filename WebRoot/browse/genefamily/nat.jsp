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
<h2>The <i>Arabidopsis</i> Nucleobase Ascorbate Transporter Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Li, Q.,Schultes, N. P. (2002)  <A HREF=http://www.arabidopsis.org/servlets/TairObject?type=publication&id=501706567>Arabidopsis thaliana locus At5g62890, a 
nucleobase-ascorbate transporter family member, is preferentially expressed in carpel transmitting tract and tapetal cells.</A>
Plant Science. 163: 233.<br>
<A href="http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/fluegge.htm">Functional analysis of plant nucleobase and vitamin C transporters</a></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Identified by phylogenetic comparison using the Lpe1 protein from maize 
(AAB17501) and ascorbate transporters in humans and rat (CAB58120,
CAB58119, NP_059011, NP_059012)</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=1277 target=new>Ulf-Ingo Flugge</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B><BR>
          Alternate Name:</TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=12 valign=top><b>"Nucleobase ascorbate transporters, NAT family"</b></td>

       <td>AtNAT1<br>
           </td>

       <td>T25M19_4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g05760 target="new">At2g05760</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD26910&doptcmdl=GenPept>AAD26910</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAD26910&doptcmdl=GenBank>AAD26910</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g05760 target="new">xanthine/uracil permease family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtNAT2<br>
           </td>

       <td>F13P17_3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g34190 target="new">At2g34190</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK59632&doptcmdl=GenPept>AAK59632</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAK59632&doptcmdl=GenBank>AAK59632</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34190 target="new">xanthine/uracil permease family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtNAT3<br>
           </td>

       <td>T9J22_18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g26510 target="new">At2g26510</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC14499&doptcmdl=GenPept>AAC14499</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAC14499&doptcmdl=GenBank>AAC14499</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26510 target="new">xanthine/uracil permease family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtNAT4<br>
           </td>

       <td>F2J10_15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g49960 target="new">At1g49960</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM20693&doptcmdl=GenPept>AAM20693</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAM20693&doptcmdl=GenBank>AAM20693</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g49960 target="new">xanthine/uracil permease family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtNAT5<br>
           </td>

       <td>K9P8_13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g49990 target="new">At5g49990</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAP68326&doptcmdl=GenPept>AAP68326</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAP68326&doptcmdl=GenBank>AAP68326</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49990 target="new">xanthine/uracil permease family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtNAT6<br>
           </td>

       <td>MQB2_190<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g62890 target="new">At5g62890</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM47573&doptcmdl=GenPept>AAM47573</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAM47573&doptcmdl=GenBank>AAM47573</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g62890 target="new">"permease, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>AtNAT7<br>
           </td>

       <td>T2K10_8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g60030 target="new">At1g60030</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_176211&doptcmdl=GenPept>NP_176211</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_176211&doptcmdl=GenBank>NP_176211</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60030 target="new">xanthine/uracil permease family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtNAT8<br>
           </td>

       <td>T10O24_16<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g10540 target="new">At1g10540</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL36291&doptcmdl=GenPept>AAL36291</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAL36291&doptcmdl=GenBank>AAL36291</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10540 target="new">xanthine/uracil permease family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtNAT9<br>
           </td>

       <td>F18G18_160<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g25420 target="new">At5g25420</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_197924&doptcmdl=GenPept>NP_197924</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_197924&doptcmdl=GenBank>NP_197924</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g25420 target="new">xanthine/uracil permease family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtNAT10<br>
           </td>

       <td>F5I14_8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g65550 target="new">At1g65550</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_176733&doptcmdl=GenPept>NP_176733</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_176733&doptcmdl=GenBank>NP_176733</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65550 target="new">xanthine/uracil permease family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtNAT11<br>
           </td>

       <td>F20D10_170<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g38050 target="new">At4g38050</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAR18373&doptcmdl=GenPept>AAR18373</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAR18373&doptcmdl=GenBank>AAR18373</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g38050 target="new">xanthine/uracil permease family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtNAT12<br>
           </td>

       <td>F15K20_9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g27810 target="new">At2g27810</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAR18374&doptcmdl=GenPept>AAR18374</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAR18374&doptcmdl=GenBank>AAR18374</A><br></td>

-->
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g27810 target="new">xanthine/uracil permease family protein
</A></td>

        </tr>
</table><P>

<A href=index.jsp>Return to Gene Family Index</A><P>

<center>Last modified April 21, 2004</center>   

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
