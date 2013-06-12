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
<h2><i>Arabidopsis</i> Glutathione S-transferase Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Sappl, P. G., Onate-Sanchez, L., Singh, K. B., Millar, A. H. (2004)<A HREF=http://arabidopsis.org/servlets/TairObject?type=publication&id=501712407>
Proteomic analysis of glutathione S-transferases of Arabidopsis thaliana
reveals differential salicylic acid-induced expression of the
plant-specific phi and tau classes</A>. Plant Molecular Biology 54: 205-219.<BR>
Sappl, P. G., Heazlewood, J. L., Millar, A. H. (2004) <A href="http://arabidopsis.org/servlets/TairObject?type=publication&id=501712967">Untangling
multi-gene
families in plants by integrating proteomics into functional genomics</a>.
Phytochemistry 65(11): 1517-1530.<BR>
Wagner, U., Edwards, R., Dixon, D. P., Mauch, F. (2002) <a href=http://arabidopsis.org/servlets/TairObject?type=publication&id=501681713> Probing the
diversity of the Arabidopsis glutathione S-transferase gene family.</a> Plant
Molecular Biology 49:515-32.<BR>
Dixon, D. P., Davis, B. G., Edwards, R. (2002) <a href=http://arabidopsis.org/servlets/TairObject?type=publication&id=501681522>Functional divergence in
the
glutathione transferase super-family in plants: Identification of two
classes with putative functions in redox homeostasis in Arabidopsis
thaliana.</a> Journal of Biological Chemistry 277(34): 30859-69.
</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Members of the GST gene family were identified on the basis of sequence
homology to known GSTs.  Protein sequences of approximately ten known GSTs
were used as queries to identify Arabidopsis GSTs using BLAST.  These new
putative GSTs were then used as queries until no new sequences were
identified.  The 53 GSTs were subdivided into 7 groups based on
phylogenetic analysis and intro:exon structure.</td></tr>
<TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=1501414806 target=new>Pia G. Sappl</A><BR>
<a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=1501414127 target=new>Harvey Millar</A><BR>
<a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=6670 target=new>Karam B. Singh</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B><BR>
          Alternate Name:</TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR  MIPS MPSS</B></TH>

         </TR>

<tr class="alt"><td rowspan=13 valign=top><b>Phi family</b></td>

       <td>AtGSTF2<br>
           GST4</td>

       <td>T10P11.18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4g02520 target="new">AT4g02520</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_116486&doptcmdl=GenPept>NM_116486</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_116486&doptcmdl=GenBank>NM_116486</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g02520 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT4g02520 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT4g02520 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTF3<br>
           </td>

       <td>T17M13.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g02930 target="new">At2g02930</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_126346&doptcmdl=GenPept>NM_126346</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_126346&doptcmdl=GenBank>NM_126346</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02930 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g02930 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g02930 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTF4<br>
           </td>

       <td>F22D16.5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g02950 target="new">AT1g02950</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_179250&doptcmdl=GenPept>NM_179250</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_179250&doptcmdl=GenBank>NM_179250</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g02950 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g02950 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g02950 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTF5<br>
           </td>

       <td>F22D16.6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g02940 target="new">AT1g02940</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_100175&doptcmdl=GenPept>NM_100175</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_100175&doptcmdl=GenBank>NM_100175</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g02940 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g02940 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g02940 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTF6<br>
           GST1</td>

       <td>F22D16.7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g02930 target="new">AT1g02930</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY097392&doptcmdl=GenPept>AY097392</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY097392&doptcmdl=GenBank>AY097392</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g02930 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g02930 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g02930 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTF7<br>
           </td>

       <td>F22D16.8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g02920 target="new">AT1g02920</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY093281&doptcmdl=GenPept>AY093281</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY093281&doptcmdl=GenBank>AY093281</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g02920 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g02920 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g02920 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTF8<br>
           GST6</td>

       <td>F17A22.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g47730 target="new">AT2g47730</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_180148&doptcmdl=GenPept>NM_180148</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_180148&doptcmdl=GenBank>NM_180148</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g47730 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT2g47730 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT2g47730 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTF9<br>
           </td>

       <td>F7F1.7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g30860 target="new">AT2g30860</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF372905&doptcmdl=GenPept>AF372905</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF372905&doptcmdl=GenBank>AF372905</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g30860 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT2g30860 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT2g30860 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTF10<br>
           </td>

       <td>F7F1.8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g30870 target="new">AT2g30870</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY128398&doptcmdl=GenPept>AY128398</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY128398&doptcmdl=GenBank>AY128398</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g30870 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT2g30870 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT2g30870 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTF11<br>
           </td>

       <td>T17B22.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g03190 target="new">AT3g03190</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY099776&doptcmdl=GenPept>AY099776</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY099776&doptcmdl=GenBank>AY099776</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g03190 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT3g03190 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT3g03190 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTF12<br>
           </td>

       <td>MKP11.7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g17220 target="new">AT5g17220</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF288189&doptcmdl=GenPept>AF288189</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF288189&doptcmdl=GenBank>AF288189</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g17220 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT5g17220 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT5g17220 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTF13<br>
           </td>

       <td>F26K9.190<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g62760 target="new">AT3g62760</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_116141&doptcmdl=GenPept>NM_116141</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_116141&doptcmdl=GenBank>NM_116141</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g62760 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT3g62760 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT3g62760 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTF14<br>
           </td>

       <td>F10F5.9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g49860 target="new">AT1g49860</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_103873&doptcmdl=GenPept>NM_103873</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_103873&doptcmdl=GenBank>NM_103873</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g49860 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g49860 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g49860 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt"><td rowspan=28 valign=top><b>Tau family</b></td>

       <td>AtGSTU1<br>
           </td>

       <td>F16P2.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g29490 target="new">AT2g29490</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF428387&doptcmdl=GenPept>AF428387</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF428387&doptcmdl=GenBank>AF428387</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g29490 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT2g29490 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT2g29490 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU2<br>
           </td>

       <td>F16P2.14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g29480 target="new">AT2g29480</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY094455&doptcmdl=GenPept>AY094455</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY094455&doptcmdl=GenBank>AY094455</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g29480 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT2g29480 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT2g29480 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU3<br>
           </td>

       <td>F16P2.15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g29470 target="new">AT2g29470</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AK117612&doptcmdl=GenPept>AK117612</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AK117612&doptcmdl=GenBank>AK117612</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g29470 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT2g29470 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT2g29470 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU4<br>
           </td>

       <td>F16P2.16<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g29460 target="new">AT2g29460</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF387004&doptcmdl=GenPept>AF387004</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF387004&doptcmdl=GenBank>AF387004</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g29460 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT2g29460 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT2g29460 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU5<br>
           </td>

       <td>F16P2.17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g29450 target="new">AT2g29450</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY088413&doptcmdl=GenPept>AY088413</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY088413&doptcmdl=GenBank>AY088413</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g29450 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT2g29450 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT2g29450 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU6<br>
           </td>

       <td>F16P2.18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g29440 target="new">AT2g29440</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF288187&doptcmdl=GenPept>AF288187</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF288187&doptcmdl=GenBank>AF288187</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g29440 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT2g29440 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT2g29440 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU7<br>
           </td>

       <td>F16P2.20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g29420 target="new">AT2g29420</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY086358&doptcmdl=GenPept>AY086358</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY086358&doptcmdl=GenBank>AY086358</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g29420 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT2g29420 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT2g29420 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU8<br>
           </td>

       <td>F3L24.14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g09270 target="new">AT3g09270</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY086116&doptcmdl=GenPept>AY086116</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY086116&doptcmdl=GenBank>AY086116</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g09270 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT3g09270 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT3g09270 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU9<br>
           </td>

       <td>K19B1.9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g62480 target="new">AT5g62480</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF288179&doptcmdl=GenPept>AF288179</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF288179&doptcmdl=GenBank>AF288179</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g62480 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT5g62480 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT5g62480 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU10<br>
           </td>

       <td>F1M20.27<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g74590 target="new">AT1g74590</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY088052&doptcmdl=GenPept>AY088052</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY088052&doptcmdl=GenBank>AY088052</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g74590 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g74590 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g74590 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU11<br>
           </td>

       <td>T17F3.4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g69930 target="new">AT1g69930</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AK119143&doptcmdl=GenPept>AK119143</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AK119143&doptcmdl=GenBank>AK119143</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g69930 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g69930 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g69930 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU12<br>
           </td>

       <td>T17F3.5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g69920 target="new">AT1g69920</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BT010687&doptcmdl=GenPept>BT010687</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=BT010687&doptcmdl=GenBank>BT010687</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g69920 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g69920 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g69920 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU13<br>
           </td>

       <td>T7N9.190<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g27130 target="new">AT1g27130</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY050343&doptcmdl=GenPept>AY050343</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY050343&doptcmdl=GenBank>AY050343</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g27130 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g27130 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g27130 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU14<br>
           </td>

       <td>T7N9.20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g27140 target="new">AT1g27140</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF288178&doptcmdl=GenPept>AF288178</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF288178&doptcmdl=GenBank>AF288178</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g27140 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g27140 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g27140 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU15<br>
           </td>

       <td>T30E16.25<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g59670 target="new">AT1g59670</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY084992&doptcmdl=GenPept>AY084992</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY084992&doptcmdl=GenBank>AY084992</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g59670 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g59670 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g59670 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU16<br>
           </td>

       <td>T30E16.30<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g59700 target="new">AT1g59700</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF370480&doptcmdl=GenPept>AF370480</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF370480&doptcmdl=GenBank>AF370480</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g59700 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g59700 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g59700 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU17<br>
           </td>

       <td>F14N23.25<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g10370 target="new">AT1g10370</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_100911&doptcmdl=GenPept>NM_100911</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_100911&doptcmdl=GenBank>NM_100911</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g10370 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g10370 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g10370 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU18<br>
           </td>

       <td>F14N23.24<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g10360 target="new">AT1g10360</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_100910&doptcmdl=GenPept>NM_100910</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_100910&doptcmdl=GenBank>NM_100910</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g10360 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g10360 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g10360 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU19<br>
           </td>

       <td>F3F9.11<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g78380 target="new">AT1g78380</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY087032&doptcmdl=GenPept>AY087032</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY087032&doptcmdl=GenBank>AY087032</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g78380 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g78380 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g78380 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU20<br>
           </td>

       <td>F3F9.23<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g78370 target="new">AT1g78370</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY087026&doptcmdl=GenPept>AY087026</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY087026&doptcmdl=GenBank>AY087026</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g78370 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g78370 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g78370 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU21<br>
           </td>

       <td>F3F9.24<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g78360 target="new">AT1g78360</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_106483&doptcmdl=GenPept>NM_106483</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_106483&doptcmdl=GenBank>NM_106483</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g78360 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g78360 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g78360 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU22<br>
           </td>

       <td>F3F9.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g78340 target="new">AT1g78340</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY086469&doptcmdl=GenPept>AY086469</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY086469&doptcmdl=GenBank>AY086469</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g78340 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g78340 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g78340 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU23<br>
           </td>

       <td>F3F9.14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g78320 target="new">AT1g78320</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY085813&doptcmdl=GenPept>AY085813</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY085813&doptcmdl=GenBank>AY085813</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g78320 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g78320 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g78320 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU24<br>
           </td>

       <td>F20D23.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g17170 target="new">AT1g17170</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BT012184&doptcmdl=GenPept>BT012184</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=BT012184&doptcmdl=GenBank>BT012184</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g17170 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g17170 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g17170 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU25<br>
           </td>

       <td>F20D23.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g17180 target="new">AT1g17180</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AK118907&doptcmdl=GenPept>AK118907</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AK118907&doptcmdl=GenBank>AK118907</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g17180 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g17180 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g17180 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU26<br>
           </td>

       <td>F20D23.11<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g17190 target="new">AT1g17190</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AJ306688&doptcmdl=GenPept>AJ306688</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AJ306688&doptcmdl=GenBank>AJ306688</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g17190 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g17190 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g17190 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU27<br>
           </td>

       <td>T28A8.90<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g43800 target="new">AT3g43800</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF370274&doptcmdl=GenPept>AF370274</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF370274&doptcmdl=GenBank>AF370274</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g43800 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT3g43800 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT3g43800 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTU28<br>
           </td>

       <td>F22G10.22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g53680 target="new">AT1g53680</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_104246&doptcmdl=GenPept>NM_104246</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_104246&doptcmdl=GenBank>NM_104246</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g53680 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g53680 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g53680 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>Zeta family</b></td>

       <td>AtGSTZ1<br>
           </td>

       <td>T16F16.18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g02390 target="new">AT2g02390</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY052332&doptcmdl=GenPept>AY052332</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY052332&doptcmdl=GenBank>AY052332</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g02390 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT2g02390 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT2g02390 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTZ2<br>
           </td>

       <td>T16F16.17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2g02380 target="new">AT2g02380</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_126295&doptcmdl=GenPept>NM_126295</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_126295&doptcmdl=GenBank>NM_126295</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g02380 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT2g02380 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT2g02380 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>Theta family</b></td>

       <td>AtGSTT1<br>
           </td>

       <td>MEE6.28<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g41210 target="new">AT5g41210</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY054659&doptcmdl=GenPept>AY054659</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY054659&doptcmdl=GenBank>AY054659</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g41210 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT5g41210 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT5g41210 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTT2<br>
           </td>

       <td>K1O13.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g41240 target="new">AT5g41240</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AJ132398&doptcmdl=GenPept>AJ132398</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AJ132398&doptcmdl=GenBank>AJ132398</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g41240 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT5g41240 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT5g41240 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt"><td rowspan=3 valign=top><b>Lambda family</b></td>

       <td>AtGSTL1<br>
           </td>

       <td>F9G14.90<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g02780 target="new">AT5g02780</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_120356&doptcmdl=GenPept>NM_120356</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_120356&doptcmdl=GenBank>NM_120356</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g02780 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT5g02780 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT5g02780 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTL2<br>
           </td>

       <td>T15C9.60<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g55040 target="new">AT3g55040</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_115362&doptcmdl=GenPept>NM_115362</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_115362&doptcmdl=GenBank>NM_115362</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55040 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT3g55040 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT3g55040 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtGSTL3<br>
           </td>

       <td>F9G14.100<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g02790 target="new">AT5g02790</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY085126&doptcmdl=GenPept>AY085126</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY085126&doptcmdl=GenBank>AY085126</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g02790 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT5g02790 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT5g02790 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt"><td rowspan=4 valign=top><b>Dehydroascorbate reductase family</b></td>

       <td>AtDHAR1<br>
           </td>

       <td>F14P1.9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g19570 target="new">AT1g19570</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY039590&doptcmdl=GenPept>AY039590</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY039590&doptcmdl=GenBank>AY039590</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g19570 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g19570 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g19570 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDHAR2<br>
           </td>

       <td>F22H5.1<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g75270 target="new">AT1g75270</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY087460&doptcmdl=GenPept>AY087460</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY087460&doptcmdl=GenBank>AY087460</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g75270 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g75270 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g75270 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDHAR3<br>
           </td>

       <td>F5E19.50<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g16710 target="new">AT5g16710</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY065124&doptcmdl=GenPept>AY065124</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY065124&doptcmdl=GenBank>AY065124</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g16710 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT5g16710 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT5g16710 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDHAR4<br>
           </td>

       <td>T30G6.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g36270 target="new">AT5g36270</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_123018&doptcmdl=GenPept>NM_123018</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_123018&doptcmdl=GenBank>NM_123018</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g36270 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT5g36270 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT5g36270 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt"><td><b>Tetrachlorohydroquinone dehalogenase-like family</b></td>

       <td>AtTCHQD1<br>
           </td>

       <td>T14N5.14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1g77290 target="new">AT1g77290</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY064034&doptcmdl=GenPept>AY064034</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY064034&doptcmdl=GenBank>AY064034</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g77290 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=AT1g77290 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=AT1g77290 target="new">MPSS</a>

	   </td>

        </tr>
</table><P>

<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified August 10, 2004</center>      


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
