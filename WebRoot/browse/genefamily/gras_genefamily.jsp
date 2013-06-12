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
<table width="602" align=center border=0 cellspacing=0 cellpadding=2>
        <tr>
                <td width="602">                <td width=602>
<TR><TD><h2><i>Arabidopsis</i> GRAS Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Bolle C. (2004)<A HREF=http://www.arabidopsis.org/servlets/TairObject?type=publication&id=501711989> The role of GRAS proteins in plant signal transduction and
development.</A> Planta. 218:683-92.<BR>
Pysh LD, Wysocka-Diller JW, Camilleri C, Bouchez D, Benfey PN. (1999)<BR>
<a href=http://www.arabidopsis.org/servlets/TairObject?type=publication&id=1486> The
GRAS gene family in Arabidopsis: sequence characterization and basic
expression analysis of the SCARECROW-LIKE genes. </a>Plant J. 18:111-9.<BR>
<a href=http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/bolle.htm>Functional and Biochemical Analysis of the GRAS Multiprotein Family</a></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Defined by the presence of highly conserved domains in the C-terminus
(GRAS:IPR005202) Numbering of the GRAS proteins followed the designations
assigned by Pysh et al. (1999) and Lim and Benfey (unpublished data)</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=1329 target=new>Cordelia Bolle</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B><BR>
          Alternate Name:</TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=33 valign=top><b>GRAS Proteins</b></td>

       <td>AtSCL1<br>
           </td>

       <td>F24J8.8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g21450 target="new">At1g21450</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_101996&doptcmdl=GenPept>NM_101996</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_101996&doptcmdl=GenBank>NM_101996</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g21450 target="new">scarecrow-like transcription factor 1 (SCL1)
</A></td>

        </tr>
<tr class="alt">

       <td>AtGAI<br>
           RGA2</td>

       <td>F10B6.34<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g14920 target="new">At1g14920</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_101361&doptcmdl=GenPept>NM_101361</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_101361&doptcmdl=GenBank>NM_101361</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14920 target="new">gibberellin-responsive modulator</A>, DELLA subfamily member (Peng J, Carol P, Richards DE, King KE, Cowling RJ, Murphy GP, Harberd NP (1997) The Arabidopsis GAI gene defines a signaling pathway that negatively regulates gibberellin responses. Genes Dev 11: 3194-205)
</td>

        </tr>
<tr class="alt">

       <td>AtSCL3<br>
           </td>

       <td>F11F12_22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g50420 target="new">At1g50420</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_103925&doptcmdl=GenPept>NM_103925</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_103925&doptcmdl=GenBank>NM_103925</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g50420 target="new">scarecrow-like transcription factor 3 (SCL3)
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL4<br>
           </td>

       <td>MUD21_1<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g66770 target="new">At5g66770</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_126075&doptcmdl=GenPept>NM_126075</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_126075&doptcmdl=GenBank>NM_126075</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g66770 target="new">scarecrow transcription factor family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL5<br>
           </td>

       <td>F11F12.8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g50600 target="new">At1g50600</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_103942&doptcmdl=GenPept>NM_103942</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_103942&doptcmdl=GenBank>NM_103942</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g50600 target="new">scarecrow-like transcription factor 5 (SCL5)
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL6<br>
           </td>

       <td>F6N15.20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g00150 target="new">At4g00150</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_116232&doptcmdl=GenPept>NM_116232</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_116232&doptcmdl=GenBank>NM_116232</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00150 target="new">"scarecrow-like transcription factor 6 (SCL6), target of  miR171/miRNA39"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL7<br>
           </td>

       <td>T3A5.30<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g50650 target="new">At3g50650</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_114925&doptcmdl=GenPept>NM_114925</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_114925&doptcmdl=GenBank>NM_114925</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g50650 target="new">"scarecrow-like transcription factor 7 (SCL7),"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL8<br>
           </td>

       <td>T4M5.2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g52510 target="new">At5g52510</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_124630&doptcmdl=GenPept>NM_124630</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_124630&doptcmdl=GenBank>NM_124630</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g52510 target="new">scarecrow-like transcription factor 8 (SCL8)
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL9<br>
           </td>

       <td>F13M22.15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g37650 target="new">At2g37650</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_129321&doptcmdl=GenPept>NM_129321</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_129321&doptcmdl=GenBank>NM_129321</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37650 target="new">scarecrow-like transcription factor 9 (SCL9)
</A></td>

        </tr>
<tr class="alt">

       <td>AtRGA<br>
           REPRESSOR OF GA1-3 1</td>

       <td>F2I9.19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g01570 target="new">At2g01570</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_126218&doptcmdl=GenPept>NM_126218</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_126218&doptcmdl=GenBank>NM_126218</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01570 target="new">gibberellin response modulator</A>, DELLA subfamily member  (Silverstone AL, Ciampaglio CN, Sun T (1998) The Arabidopsis RGA gene encodes a transcriptional regulator repressing the gibberellin signal transduction pathway. Plant Cell 10: 155-69)</td>

        </tr>
<tr class="alt">

       <td>AtSCL11<br>
           </td>

       <td>F2O15.5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g59450 target="new">At5g59450</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_125336&doptcmdl=GenPept>NM_125336</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_125336&doptcmdl=GenBank>NM_125336</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59450 target="new">scarecrow-like transcription factor 11 (SCL11)
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL13 <br>
           VHS4</td>

       <td>ATFCA8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g17230 target="new">At4g17230</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BT001076&doptcmdl=GenPept>BT001076</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=BT001076&doptcmdl=GenBank>BT001076</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g17230 target="new">scarecrow-like transcription factor 13 (SCL13)
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL14<br>
           </td>

       <td>F22G5.9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g07530 target="new">At1g07530</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_100627&doptcmdl=GenPept>NM_100627</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_100627&doptcmdl=GenBank>NM_100627</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07530 target="new">scarecrow-like transcription factor 14 (SCL14)
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL15<br>
           VHS5</td>

       <td>ATAP22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g36710 target="new">At4g36710</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_119835&doptcmdl=GenPept>NM_119835</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_119835&doptcmdl=GenBank>NM_119835</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g36710 target="new">scarecrow transcription factor family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL16<br>
           </td>

       <td>MJB21<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name= target="new"></A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AB007647&doptcmdl=GenPept>AB007647</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AB007647&doptcmdl=GenBank>AB007647</A><br></td>

       <td>pseudogene</td>

        </tr>
<tr class="alt">

       <td>AtRGL1<br>
           "RGA-LIKE 1, RGL, RGL1"</td>

       <td>T27F4.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g66350 target="new">At1g66350</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_105306&doptcmdl=GenPept>NM_105306</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_105306&doptcmdl=GenBank>NM_105306</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66350 target="new">gibberellin regulatory protein (RGL1); Negative regulator of GA responses</A>, DELLA subfamily member (Wen CK, Chang C (2002) Arabidopsis RGL1 encodes a negative regulator of gibberellin responses. Plant Cell 14: 87-100)</td>

        </tr>
<tr class="alt">

       <td>AtSCL18<br>
           AtLAS</td>

       <td>F20N2.1<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g55580 target="new">At1g55580</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_104434&doptcmdl=GenPept>NM_104434</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_104434&doptcmdl=GenBank>NM_104434</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55580 target="new">similar to lateral suppressor protein of tomato</A>, involved in axial meristem development (Greb T, Clarenz O, Schafer E, Muller D, Herrero R, Schmitz G, Theres K (2003) Molecular analysis of the LATERAL SUPPRESSOR gene in Arabidopsis reveals a conserved control mechanism for axillary meristem formation. Genes Dev 17: 1175-87)</td>

        </tr>
<tr class="alt">

       <td>AtRGL2<br>
           </td>

       <td>T21P5.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g03450 target="new">At3g03450</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_111216&doptcmdl=GenPept>NM_111216</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_111216&doptcmdl=GenBank>NM_111216</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g03450 target="new">gibberellin response modulator</A>; DELLA subfamily member, possible involvement in nitrogen metabolism(Lee S, Cheng H, King KE, Wang W, He Y, Hussain A, Lo J, Harberd NP, Peng J (2002) Gibberellin regulates Arabidopsis seed germination via RGL2, a GAI/RGA-like gene whose expression is up-regulated following imbibition. Genes Dev 16: 646-58)</td>

        </tr>
<tr class="alt">

       <td>AtSCR<br>
           </td>

       <td>F24B22.180<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g54220 target="new">At3g54220</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_115282&doptcmdl=GenPept>NM_115282</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_115282&doptcmdl=GenBank>NM_115282</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g54220 target="new">scarecrow transcription factor, putative</A>, Regulates the radial organization of the root, (Di Laurenzio L, Wysocka-Diller J, Malamy JE, Pysh L, Helariutta Y, Freshour G, Hahn MG, Feldmann KA, Benfey PN (1996) The SCARECROW gene regulates an asymmetric cell division that is essential for generating the radial organization of the Arabidopsis root. Cell 86: 423-33)</td>

        </tr>
<tr class="alt">

       <td>AtSHR<br>
           SGR7</td>

       <td>F19F18.140<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g37650 target="new">At4g37650</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_119928.2&doptcmdl=GenPept>NM_119928.2</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_119928.2&doptcmdl=GenBank>NM_119928.2</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g37650 target="new">short-root transcription factor (SHR)</A>, Involved in radial organization of the root and shoot axial organs. Essential for normal shoot gravitropism. (Helariutta Y, Fukaki H, Wysocka-Diller J, Nakajima K, Jung J, Sena G, Hauser MT, Benfey PN (2000) The SHORT-ROOT gene controls radial patterning of the Arabidopsis root through radial signaling. Cell 101: 555-67)</td>

        </tr>
<tr class="alt">

       <td>AtSCL21<br>
           </td>

       <td>F1O13.2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g04890 target="new">At2g04890</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF210732&doptcmdl=GenPept>AF210732</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF210732&doptcmdl=GenBank>AF210732</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g04890 target="new">scarecrow-like transcription factor 21 (SCL21)
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL22<br>
           </td>

       <td>T4C21.40<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g60630 target="new">At3g60630</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_115927&doptcmdl=GenPept>NM_115927</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_115927&doptcmdl=GenBank>NM_115927</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g60630 target="new">"scarecrow transcription factor family protein, target of  miR171/miRNA39"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL23<br>
           </td>

       <td>MJC20.2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g41920 target="new">At5g41920</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_123557&doptcmdl=GenPept>NM_123557</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_123557&doptcmdl=GenBank>NM_123557</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g41920 target="new">scarecrow transcription factor family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtPAT1<br>
           </td>

       <td>MIF21.4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g48150 target="new">At5g48150</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_203174&doptcmdl=GenPept>NM_203174</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_203174&doptcmdl=GenBank>NM_203174</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g48150 target="new">phytochrome A signal transduction 1 (PAT1)</A>, Semi-dominant mutant has a reduced response to far-red light and appears to act early in the phytochrome A signaling pathway (Bolle C, Koncz C, Chua NH (2000) PAT1, a new member of the GRAS family, is involved in phytochrome A signal transduction. Genes Dev 14: 1269-78) </td>

        </tr>
<tr class="alt">

       <td>AtRGL3<br>
           </td>

       <td>K3M16.60<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g17490 target="new">At5g17490</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_121755&doptcmdl=GenPept>NM_121755</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_121755&doptcmdl=GenBank>NM_121755</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g17490 target="new">"gibberellin response modulator, DELLA subfamily member"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL26<br>
           </td>

       <td>T12G13_90<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g08250 target="new">At4g08250</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_116894&doptcmdl=GenPept>NM_116894</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_116894&doptcmdl=GenBank>NM_116894</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g08250 target="new">"scarecrow transcription factor family protein, "
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL27<br>
           </td>

       <td>T14P1.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g45160 target="new">At2g45160</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_130079&doptcmdl=GenPept>NM_130079</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_130079&doptcmdl=GenBank>NM_130079</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g45160 target="new">"scarecrow transcription factor family protein,target of  miR171/miRNA39"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL28<br>
           </td>

       <td>F16M19.21<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g63100 target="new">At1g63100</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_104988&doptcmdl=GenPept>NM_104988</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_104988&doptcmdl=GenBank>NM_104988</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g63100 target="new">scarecrow transcription factor family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL29<br>
           </td>

       <td>MCP4.6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g13840 target="new">At3g13840</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_112237&doptcmdl=GenPept>NM_112237</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_112237&doptcmdl=GenBank>NM_112237</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13840 target="new">scarecrow transcription factor family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL30<br>
           </td>

       <td>F12A12.120<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g46600 target="new">At3g46600</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_114527&doptcmdl=GenPept>NM_114527</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_114527&doptcmdl=GenBank>NM_114527</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g46600 target="new">scarecrow transcription factor family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL31<br>
           </td>

       <td>F22G5.41<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g07520 target="new">At1g07520</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_100626&doptcmdl=GenPept>NM_100626</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_100626&doptcmdl=GenBank>NM_100626</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07520 target="new">scarecrow transcription factor family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL32<br>
           </td>

       <td>F3A4.30<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g49950 target="new">At3g49950</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_114855&doptcmdl=GenPept>NM_114855</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_114855&doptcmdl=GenBank>NM_114855</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g49950 target="new">scarecrow transcription factor family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtSCL33<br>
           </td>

       <td>T9I4_14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g29060 target="new">At2g29060</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_128463&doptcmdl=GenPept>NM_128463</A><br></td>

-->
<!-- or use the following for NM_  -->
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_128463&doptcmdl=GenBank>NM_128463</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29060 target="new">"scarecrow transcription factor family protein</A>,Caution: annotation perhaps wrong, containing two SCL genes</td>

        </tr>
</table><P>

<A href=index.jsp>Return to Gene Family Index</A><P>

<center>Last modified April 22, 2004</center>        


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
