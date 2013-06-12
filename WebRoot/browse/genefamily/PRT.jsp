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
<h2><i>Arabidopsis</i> PRT Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Van der Graaff E, Hooykaas P, Lein W, Lerchl J, Kunze G, Sonnewald U,
Boldt R. (2004) <a href="/servlets/TairObject?type=publication&id=501711882">Molecular analysis of "de novo" purine biosynthesis in
solanaceous species and in Arabidopsis thaliana.</a> Front Biosci. 9:1803-16.<BR>
Boldt R, Zrenner R. (2003) <a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=12654029&dopt=Abstract">Purine and pyrimidine biosynthesis in higher
plants. Physiol Plant.</a> 117:297-304.<BR>
<a href="http://www.sanger.ac.uk/cgi-bin/Pfam/getacc?PF00156">Phosphoribosyl transferase domain (Pfam: PF00156)</a></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>PRT's are defined by the protein fold and by a short sequence motive which
was identified as the PRPP binding site. This PRT motive is only found in
PRTases from the nucleotide synthesis and salvage pathway which catalyze
the displacement of PPi from PRPP by  a nitrogen-containing nucleophile,
such as ammonia, adenine, guanine, hypoxanthine, xanthine, orotate or
uracil, producing a b-substituted ribose-5-phosphate and PPi.</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=1501417380 target=new>Ralf Boldt</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B><BR>
          Alternate Name:</TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td valign=top rowspan=3><b>PRPP-Amidotransferases</b></td>

       <td>AtpurF1<br>
           </td>

       <td>f1p15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g16570 target="new">At2g16570</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD26498&doptcmdl=GenPept>AAD26498</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAD26498&doptcmdl=GenBank>AAD26498</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16570 target="new">catalyzes the first step of the purine biosynthesis localized in chloroplast EC 2.4.2.14
</A></td>

        </tr>
<tr class="alt">

       <td>AtpurF2<br>
           </td>

       <td>T4L20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g34740 target="new">At4g34740</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAA18853&doptcmdl=GenPept>CAA18853</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=CAA18853&doptcmdl=GenBank>CAA18853</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34740 target="new">catalyzes the first step of the purine biosynthesis localized in chloroplast EC 2.4.2.14
</A></td>

        </tr>
<tr class="alt">

       <td>AtpurF3<br>
           </td>

       <td>T9A14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g38880 target="new">At4g38880</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB38622&doptcmdl=GenPept>CAB38622</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=CAB38622&doptcmdl=GenBank>CAB38622</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g38880 target="new">catalyzes the first step of the purine biosynthesis localized in chloroplast EC 2.4.2.14
</A></td>

        </tr>
<tr class="alt"><td rowspan=5 valign=top><b>Adenine Phosphoribosyltransferases</b></td>

       <td>AtAPT1<br>
           </td>

       <td>F17L21<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g27450 target="new">At1g27450</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAA20677&doptcmdl=GenPept>AAA20677</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAA20677&doptcmdl=GenBank>AAA20677</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27450 target="new">involved in purine salvage by catalyzing the conversion of adenine and PRPP to AMP and PPi EC 2.4.2.7
</A></td>

        </tr>
<tr class="alt">

       <td>AtAPT2<br>
           </td>

       <td>F18B13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g80050 target="new">At1g80050</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAA65609&doptcmdl=GenPept>CAA65609</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=CAA65609&doptcmdl=GenBank>CAA65609</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80050 target="new">involved in purine salvage by catalyzing the conversion of adenine and PRPP to AMP and PPi EC 2.4.2.7
</A></td>

        </tr>
<tr class="alt">

       <td>AtAPT3<br>
           </td>

       <td>F7K2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g22570 target="new">At4g22570</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB79212&doptcmdl=GenPept>CAB79212</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=CAB79212&doptcmdl=GenBank>CAB79212</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g22570 target="new">involved in purine salvage by catalyzing the conversion of adenine and PRPP to AMP and PPi EC 2.4.2.7
</A></td>

        </tr>
<tr class="alt">

       <td>AtAPT4<br>
           </td>

       <td>T1P17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g12440 target="new">At4g12440</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78287&doptcmdl=GenPept>CAB78287</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=CAB78287&doptcmdl=GenBank>CAB78287</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g12440 target="new">involved in purine salvage by catalyzing the conversion of adenine and PRPP to AMP and PPi EC 2.4.2.7
</A></td>

        </tr>
<tr class="alt">

       <td>AtAPT5<br>
           </td>

       <td>F2I11<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g11160 target="new">At5g11160</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB96651&doptcmdl=GenPept>CAB96651</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=CAB96651&doptcmdl=GenBank>CAB96651</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g11160 target="new">involved in purine salvage by catalyzing the conversion of adenine and PRPP to AMP and PPi EC 2.4.2.7
</A></td>

        </tr>
<tr class="alt"><td><b>Hypoxanthine-Guanine-Phosphoribosyltransferases</b></td>

       <td>AtHPRT<br>
           </td>

       <td>F14O23<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g71750 target="new">At1g71750</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG41499&doptcmdl=GenPept>AAG41499</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAG41499&doptcmdl=GenBank>AAG41499</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71750 target="new">involved in purine salvage by catalyzing the conversion of xanthine and PRPP to IMP an PPi EC 2.4.2.8
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=6><b>Uracil Phosphoribosyltransferases</b></td>

       <td>AtUPT1<br>
           </td>

       <td>F14J16<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g55810 target="new">At1g55810</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL60039&doptcmdl=GenPept>AAL60039</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAL60039&doptcmdl=GenBank>AAL60039</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55810 target="new">involved in pyrimidine salvage by catalyzing the conversion of Uracil and PRPP to UMP and PPi EC 2.4.2.9
</A></td>

        </tr>
<tr class="alt">

       <td>AtUPT2<br>
           </td>

       <td>K1G2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g27440 target="new">At3g27440</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAA95720&doptcmdl=GenPept>BAA95720</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=BAA95720&doptcmdl=GenBank>BAA95720</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g27440 target="new">involved in pyrimidine salvage by catalyzing the conversion of Uracil and PRPP to UMP and PPi EC 2.4.2.9
</A></td>

        </tr>
<tr class="alt">

       <td>AtUPT3<br>
           </td>

       <td>K17E12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g27190 target="new">At3g27190</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02114&doptcmdl=GenPept>BAB02114</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=BAB02114&doptcmdl=GenBank>BAB02114</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g27190 target="new">involved in pyrimidine salvage by catalyzing the conversion of Uracil and PRPP to UMP and PPi EC 2.4.2.9
</A></td>

        </tr>
<tr class="alt">

       <td>AtUPT4<br>
           </td>

       <td>F5K20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g53900 target="new">At3g53900</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB88352&doptcmdl=GenPept>CAB88352</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=CAB88352&doptcmdl=GenBank>CAB88352</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g53900 target="new">involved in pyrimidine salvage by catalyzing the conversion of Uracil and PRPP to UMP and PPi EC 2.4.2.9
</A></td>

        </tr>
<tr class="alt">

       <td>AtUPT5<br>
           </td>

       <td>M3E9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g26510 target="new">At4g26510</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL60039&doptcmdl=GenPept>AAL60039</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAL60039&doptcmdl=GenBank>AAL60039</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g26510 target="new">involved in pyrimidine salvage by catalyzing the conversion of Uracil and PRPP to UMP and PPi EC 2.4.2.9
</A></td>

        </tr>
<tr class="alt">

       <td>AtUPT6<br>
           </td>

       <td>MHK7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g40870 target="new">At5g40870</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB11349&doptcmdl=GenPept>BAB11349</A><br></td>


<!-- or use the following for NM_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=BAB11349&doptcmdl=GenBank>BAB11349</A><br></td>

-->

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40870 target="new">involved in pyrimidine salvage by catalyzing the conversion of Uracil and PRPP to UMP and PPi EC 2.4.2.9
</A></td>

        </tr>
</table><P>

<A href=index.jsp>Return to Gene Family Index</A><P>

<center>Last modified May 4, 2004</center>          


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
