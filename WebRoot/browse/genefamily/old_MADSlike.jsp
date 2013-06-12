<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Gene Family";
	String highlight = "3";
	String helpfile="";
	String cssfile="/css/page/pagelevels.css";
%>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
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
<TR><TD><h2><i>Arabidopsis</i> MADS-box Transcription Factor Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Parenicova, L.,de Folter, S.,Kieffer, M.,Horner, D. S.,Favalli,
C.,Busscher, J.,Cook, H. E.,Ingram, R. M.,Kater, M. M.,Davies,
B.,Angenent, G. C.,Colombo, L. (2003)<A HREF=http://arabidopsis.org/servlets/TairObject?type=publication&id=501707748> Molecular and phylogenetic analyses
of the complete MADS-box transcription factor family in Arabidopsis: new
openings to the MADS world.</A> The Plant Cell. 15: 1538.</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>We exploited a hidden Markov model that produces a profile out of a
multiple sequence alignment. A profile for MADS-box proteins was built to
screen the Arabidopis genome to identify new members of this family. Only
hits with a E value of &lt;1 were considered to be members of the family.
This analysis resulted in 107 MADS-box proteins, which could be
sub-divided in type-I (Malpha, Mbeta, Mgamma) and type-II (MIKC, Mdelta)
family members.</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=1501418015 target=new>Stefan de Folter</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B><BR>
          Alternate Name:</TH>


   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR  MIPS MPSS</B></TH>

   <TH><B>Phylogenetic Group:</B><BR>
         </TR>

<tr class="alt"><td rowspan=108 valign=top><b>MADS-box Transcription Factor Family</b></td>

       <td>PISTILLATA<br>
           PI</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=D30807&doptcmdl=GenPept>D30807</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=D30807&doptcmdl=GenBank>D30807</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g20240 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g20240 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g20240 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>APETALA3<br>
           AP3</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=M86357&doptcmdl=GenPept>M86357</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=M86357&doptcmdl=GenBank>M86357</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g54340 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g54340 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g54340 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGAMOUS<br>
           AG</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=X53579&doptcmdl=GenPept>X53579</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=X53579&doptcmdl=GenBank>X53579</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18960 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g18960 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g18960 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL1<br>
           SHP1</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=M55550&doptcmdl=GenPept>M55550</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=M55550&doptcmdl=GenBank>M55550</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g58780 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g58780 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g58780 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL2<br>
           SEP1</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=M55551&doptcmdl=GenPept>M55551</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=M55551&doptcmdl=GenBank>M55551</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g15800 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g15800 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g15800 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL3<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=U81369&doptcmdl=GenPept>U81369</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=U81369&doptcmdl=GenBank>U81369</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g03710 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g03710 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g03710 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL4<br>
           SEP2</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=M55552&doptcmdl=GenPept>M55552</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=M55552&doptcmdl=GenBank>M55552</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02310 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g02310 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g02310 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL5<br>
           SHP2</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=M55553&doptcmdl=GenPept>M55553</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=M55553&doptcmdl=GenBank>M55553</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42830 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g42830 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g42830 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL6<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=M55554&doptcmdl=GenPept>M55554</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=M55554&doptcmdl=GenBank>M55554</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g45650 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g45650 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g45650 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL7<br>
           AP1</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=Z16421&doptcmdl=GenPept>Z16421</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=Z16421&doptcmdl=GenBank>Z16421</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69120 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g69120 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g69120 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL8<br>
           FUL</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=U33473&doptcmdl=GenPept>U33473</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=U33473&doptcmdl=GenBank>U33473</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60910 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g60910 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g60910 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL9<br>
           SEP3</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF015552&doptcmdl=GenPept>AF015552</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF015552&doptcmdl=GenBank>AF015552</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24260 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g24260 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g24260 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL10<br>
           CAL</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=L36925&doptcmdl=GenPept>L36925</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=L36925&doptcmdl=GenBank>L36925</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26310 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g26310 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g26310 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL11<br>
           STK</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=U20182&doptcmdl=GenPept>U20182</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=U20182&doptcmdl=GenBank>U20182</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g09960 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g09960 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g09960 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL12<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=U20193&doptcmdl=GenPept>U20193</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=U20193&doptcmdl=GenBank>U20193</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71692 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g71692 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g71692 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL13<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=U20183&doptcmdl=GenPept>U20183</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=U20183&doptcmdl=GenBank>U20183</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g61120 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g61120 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g61120 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL14<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=U20184&doptcmdl=GenPept>U20184</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=U20184&doptcmdl=GenBank>U20184</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11880 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g11880 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g11880 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL15<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=U20185&doptcmdl=GenPept>U20185</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=U20185&doptcmdl=GenBank>U20185</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g13790 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g13790 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g13790 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL16<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_115583&doptcmdl=GenPept>NM_115583</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_115583&doptcmdl=GenBank>NM_115583</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g57230 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g57230 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g57230 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL17<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_127828&doptcmdl=GenPept>NM_127828</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_127828&doptcmdl=GenBank>NM_127828</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g22630 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g22630 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g22630 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL18<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF312663&doptcmdl=GenPept>AF312663</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF312663&doptcmdl=GenBank>AF312663</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g57390 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g57390 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g57390 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL19<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF312664&doptcmdl=GenPept>AF312664</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF312664&doptcmdl=GenBank>AF312664</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g22950 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g22950 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g22950 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL20<br>
           SOC1</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY007726&doptcmdl=GenPept>AY007726</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY007726&doptcmdl=GenBank>AY007726</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g45660 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g45660 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g45660 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL21<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF336979&doptcmdl=GenPept>AF336979</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF336979&doptcmdl=GenBank>AF336979</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g37940 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g37940 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g37940 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL22<br>
           SVP</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF211171&doptcmdl=GenPept>AF211171</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF211171&doptcmdl=GenBank>AF211171</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g22540 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g22540 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g22540 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL23<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141230&doptcmdl=GenPept>AY141230</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141230&doptcmdl=GenBank>AY141230</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65360 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g65360 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g65360 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL24<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF005158&doptcmdl=GenPept>AF005158</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF005158&doptcmdl=GenBank>AF005158</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g24540 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g24540 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g24540 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL25<br>
           FLC;FLF</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF537203&doptcmdl=GenPept>AF537203</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF537203&doptcmdl=GenBank>AF537203</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g10140 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g10140 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g10140 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL26<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_122569&doptcmdl=GenPept>NM_122569</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_122569&doptcmdl=GenBank>NM_122569</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g26870 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g26870 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g26870 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL27<br>
           MAF1;FLM</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF342808&doptcmdl=GenPept>AF342808</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF342808&doptcmdl=GenBank>AF342808</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77080 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g77080 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g77080 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL28<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141231&doptcmdl=GenPept>AY141231</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141231&doptcmdl=GenBank>AY141231</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01530 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g01530 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g01530 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL29<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_128996&doptcmdl=GenPept>NM_128996</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_128996&doptcmdl=GenBank>NM_128996</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34440 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g34440 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g34440 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL30<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141232&doptcmdl=GenPept>AY141232</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141232&doptcmdl=GenBank>AY141232</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g03060 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g03060 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g03060 target="new">MPSS</a>

	   </td>

<td>M delta
</td>

        </tr>
<tr class="alt">

       <td>AGL31<br>
           MAF2</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF312667&doptcmdl=GenPept>AF312667</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF312667&doptcmdl=GenBank>AF312667</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65050 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g65050 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g65050 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL32<br>
           ABS;TT16</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AJ318098&doptcmdl=GenPept>AJ318098</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AJ318098&doptcmdl=GenBank>AJ318098</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g23260 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g23260 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g23260 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL33<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141233&doptcmdl=GenPept>AY141233</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141233&doptcmdl=GenBank>AY141233</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26320 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g26320 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g26320 target="new">MPSS</a>

	   </td>

<td>none
</td>

        </tr>
<tr class="alt">

       <td>AGL34<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141248&doptcmdl=GenPept>AY141248</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141248&doptcmdl=GenBank>AY141248</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g26575 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g26575 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g26575 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL35<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141246&doptcmdl=GenPept>AY141246</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141246&doptcmdl=GenBank>AY141246</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g26625 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g26625 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g26625 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL36<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141247&doptcmdl=GenPept>AY141247</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141247&doptcmdl=GenBank>AY141247</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g26645 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g26645 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g26645 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL37<br>
           PHE1</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_105207&doptcmdl=GenPept>NM_105207</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_105207&doptcmdl=GenBank>NM_105207</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65330 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g65330 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g65330 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL38<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141245&doptcmdl=GenPept>AY141245</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141245&doptcmdl=GenBank>AY141245</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65300 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g65300 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g65300 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL39<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_122595&doptcmdl=GenPept>NM_122595</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_122595&doptcmdl=GenBank>NM_122595</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27130 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g27130 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g27130 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL40<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141234&doptcmdl=GenPept>AY141234</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141234&doptcmdl=GenBank>AY141234</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g36590 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g36590 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g36590 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL41<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141253&doptcmdl=GenPept>AY141253</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141253&doptcmdl=GenBank>AY141253</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26880 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g26880 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g26880 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL42<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141213&doptcmdl=GenPept>AY141213</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141213&doptcmdl=GenBank>AY141213</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g62165 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g62165 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g62165 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL43<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141223&doptcmdl=GenPept>AY141223</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141223&doptcmdl=GenBank>AY141223</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40220 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g40220 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g40220 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL44<br>
           ANR1</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=Z97057&doptcmdl=GenPept>Z97057</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=Z97057&doptcmdl=GenBank>Z97057</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g14210 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g14210 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g14210 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL45<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141251&doptcmdl=GenPept>AY141251</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141251&doptcmdl=GenBank>AY141251</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05860 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g05860 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g05860 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL46<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_128431&doptcmdl=GenPept>NM_128431</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_128431&doptcmdl=GenBank>NM_128431</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28700 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g28700 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g28700 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL47<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141214&doptcmdl=GenPept>AY141214</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141214&doptcmdl=GenBank>AY141214</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55690 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g55690 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g55690 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL48<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_129579&doptcmdl=GenPept>NM_129579</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_129579&doptcmdl=GenBank>NM_129579</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40210 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g40210 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g40210 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL49<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_104696&doptcmdl=GenPept>NM_104696</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_104696&doptcmdl=GenBank>NM_104696</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60040 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g60040 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g60040 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL50<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_104674&doptcmdl=GenPept>NM_104674</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_104674&doptcmdl=GenBank>NM_104674</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g59810 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g59810 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g59810 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL51<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141215&doptcmdl=GenPept>AY141215</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141215&doptcmdl=GenBank>AY141215</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g02240 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g02240 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g02240 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL52<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141216&doptcmdl=GenPept>AY141216</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141216&doptcmdl=GenBank>AY141216</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11250 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g11250 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g11250 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL53<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141217&doptcmdl=GenPept>AY141217</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141217&doptcmdl=GenBank>AY141217</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27070 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g27070 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g27070 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL54<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141218&doptcmdl=GenPept>AY141218</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141218&doptcmdl=GenBank>AY141218</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27090 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g27090 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g27090 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL55<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_104772&doptcmdl=GenPept>NM_104772</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_104772&doptcmdl=GenBank>NM_104772</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60920 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g60920 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g60920 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL56<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_104769&doptcmdl=GenPept>NM_104769</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_104769&doptcmdl=GenBank>NM_104769</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60880 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g60880 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g60880 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL57<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_111281&doptcmdl=GenPept>NM_111281</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_111281&doptcmdl=GenBank>NM_111281</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g04100 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g04100 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g04100 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL58<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_102613&doptcmdl=GenPept>NM_102613</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_102613&doptcmdl=GenBank>NM_102613</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g28450 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g28450 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g28450 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL59<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_102614&doptcmdl=GenPept>NM_102614</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_102614&doptcmdl=GenBank>NM_102614</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g28460 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g28460 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g28460 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL60<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141235&doptcmdl=GenPept>AY141235</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141235&doptcmdl=GenBank>AY141235</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72350 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g72350 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g72350 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL61<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_128043&doptcmdl=GenPept>NM_128043</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_128043&doptcmdl=GenBank>NM_128043</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24840 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g24840 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g24840 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL62<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141236&doptcmdl=GenPept>AY141236</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141236&doptcmdl=GenBank>AY141236</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60440 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g60440 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g60440 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL63<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141243&doptcmdl=GenPept>AY141243</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141243&doptcmdl=GenBank>AY141243</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31140 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g31140 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g31140 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL64<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141244&doptcmdl=GenPept>AY141244</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141244&doptcmdl=GenBank>AY141244</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29960 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g29960 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g29960 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL65<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY143172&doptcmdl=GenPept>AY143172</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY143172&doptcmdl=GenBank>AY143172</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18750 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g18750 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g18750 target="new">MPSS</a>

	   </td>

<td>M delta
</td>

        </tr>
<tr class="alt">

       <td>AGL66<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141242&doptcmdl=GenPept>AY141242</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141242&doptcmdl=GenBank>AY141242</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77980 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g77980 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g77980 target="new">MPSS</a>

	   </td>

<td>M delta
</td>

        </tr>
<tr class="alt">

       <td>AGL67<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_106444&doptcmdl=GenPept>NM_106444</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_106444&doptcmdl=GenBank>NM_106444</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77950 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g77950 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g77950 target="new">MPSS</a>

	   </td>

<td>M delta
</td>

        </tr>
<tr class="alt">

       <td>AGL68<br>
           MAF5</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY231455&doptcmdl=GenPept>AY231455</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY231455&doptcmdl=GenBank>AY231455</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65080 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g65080 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g65080 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL69<br>
           MAF4</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY231450&doptcmdl=GenPept>AY231450</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY231450&doptcmdl=GenBank>AY231450</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65070 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g65070 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g65070 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL70<br>
           MAF3</td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY231445&doptcmdl=GenPept>AY231445</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY231445&doptcmdl=GenBank>AY231445</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65060 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g65060 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g65060 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL71<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141220&doptcmdl=GenPept>AY141220</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141220&doptcmdl=GenBank>AY141220</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g51870 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g51870 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g51870 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL72<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141221&doptcmdl=GenPept>AY141221</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141221&doptcmdl=GenBank>AY141221</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g51860 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g51860 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g51860 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL73<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141237&doptcmdl=GenPept>AY141237</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141237&doptcmdl=GenBank>AY141237</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g38620 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g38620 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g38620 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL74<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141254&doptcmdl=GenPept>AY141254</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141254&doptcmdl=GenBank>AY141254</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48150 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g48150 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g48150 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL75<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_123485&doptcmdl=GenPept>NM_123485</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_123485&doptcmdl=GenBank>NM_123485</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g41200 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g41200 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g41200 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL76<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141222&doptcmdl=GenPept>AY141222</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141222&doptcmdl=GenBank>AY141222</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40120 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g40120 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g40120 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL77<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_123235&doptcmdl=GenPept>NM_123235</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_123235&doptcmdl=GenBank>NM_123235</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g38740 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g38740 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g38740 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL78<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141224&doptcmdl=GenPept>AY141224</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141224&doptcmdl=GenBank>AY141224</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65330 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g65330 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g65330 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL79<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141238&doptcmdl=GenPept>AY141238</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141238&doptcmdl=GenBank>AY141238</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g30260 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g30260 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g30260 target="new">MPSS</a>

	   </td>

<td>MIKC
</td>

        </tr>
<tr class="alt">

       <td>AGL80<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_124244&doptcmdl=GenPept>NM_124244</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_124244&doptcmdl=GenBank>NM_124244</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g48670 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g48670 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g48670 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL81<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141225&doptcmdl=GenPept>AY141225</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141225&doptcmdl=GenBank>AY141225</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g39750 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g39750 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g39750 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL82<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_125279&doptcmdl=GenPept>NM_125279</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_125279&doptcmdl=GenBank>NM_125279</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58890 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g58890 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g58890 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL83<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_124326&doptcmdl=GenPept>NM_124326</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_124326&doptcmdl=GenBank>NM_124326</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49490 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g49490 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g49490 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL84<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141239&doptcmdl=GenPept>AY141239</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141239&doptcmdl=GenBank>AY141239</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49420 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g49420 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g49420 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL85<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_104351&doptcmdl=GenPept>NM_104351</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_104351&doptcmdl=GenBank>NM_104351</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54760 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g54760 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g54760 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL86<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_102898&doptcmdl=GenPept>NM_102898</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_102898&doptcmdl=GenBank>NM_102898</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31630 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g31630 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g31630 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL87<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141250&doptcmdl=GenPept>AY141250</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141250&doptcmdl=GenBank>AY141250</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22590 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g22590 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g22590 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL88<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY233210&doptcmdl=GenPept>AY233210</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY233210&doptcmdl=GenBank>AY233210</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g11990 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g11990 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g11990 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL89<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141226&doptcmdl=GenPept>AY141226</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141226&doptcmdl=GenBank>AY141226</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27580 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g27580 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g27580 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL90<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141249&doptcmdl=GenPept>AY141249</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141249&doptcmdl=GenBank>AY141249</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27960 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g27960 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g27960 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL91<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_111544&doptcmdl=GenPept>NM_111544</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_111544&doptcmdl=GenBank>NM_111544</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g66656 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g66656 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g66656 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL92<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_102899&doptcmdl=GenPept>NM_102899</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_102899&doptcmdl=GenBank>NM_102899</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31640 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g31640 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g31640 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL93<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141228&doptcmdl=GenPept>AY141228</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141228&doptcmdl=GenBank>AY141228</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g26950 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g26950 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g26950 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL94<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_105623&doptcmdl=GenPept>NM_105623</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_105623&doptcmdl=GenBank>NM_105623</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69540 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g69540 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g69540 target="new">MPSS</a>

	   </td>

<td>M delta
</td>

        </tr>
<tr class="alt">

       <td>AGL95<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_127127&doptcmdl=GenPept>NM_127127</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_127127&doptcmdl=GenBank>NM_127127</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15660 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g15660 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g15660 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL96<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_120733&doptcmdl=GenPept>NM_120733</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_120733&doptcmdl=GenBank>NM_120733</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g06500 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g06500 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g06500 target="new">MPSS</a>

	   </td>

<td>M gamma
</td>

        </tr>
<tr class="alt">

       <td>AGL97<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_103604&doptcmdl=GenPept>NM_103604</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_103604&doptcmdl=GenBank>NM_103604</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g46408 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g46408 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g46408 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL98<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_123344&doptcmdl=GenPept>NM_123344</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_123344&doptcmdl=GenBank>NM_123344</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g39810 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g39810 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g39810 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL99<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_120546&doptcmdl=GenPept>NM_120546</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_120546&doptcmdl=GenBank>NM_120546</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g04640 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g04640 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g04640 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL100<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141240&doptcmdl=GenPept>AY141240</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141240&doptcmdl=GenBank>AY141240</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17310 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g17310 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g17310 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL101<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_122587&doptcmdl=GenPept>NM_122587</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_122587&doptcmdl=GenBank>NM_122587</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27050 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g27050 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g27050 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL102<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141241&doptcmdl=GenPept>AY141241</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141241&doptcmdl=GenBank>AY141241</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g47760 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g47760 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g47760 target="new">MPSS</a>

	   </td>

<td>M alpha
</td>

        </tr>
<tr class="alt">

       <td>AGL103<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_112751&doptcmdl=GenPept>NM_112751</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_112751&doptcmdl=GenBank>NM_112751</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g18650 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g18650 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g18650 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
<tr class="alt">

       <td>AGL104<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_102063&doptcmdl=GenPept>NM_102063</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_102063&doptcmdl=GenBank>NM_102063</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22130 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g22130 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g22130 target="new">MPSS</a>

	   </td>

<td>M delta
</td>

        </tr>
<tr class="alt">

       <td>AGL105<br>
           </td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AY141227&doptcmdl=GenPept>AY141227</A><br></td>

-->
<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY141227&doptcmdl=GenBank>AY141227</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g37420 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g37420 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g37420 target="new">MPSS</a>

	   </td>

<td>M beta
</td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>

<center>Last modified August 31, 2004</center>              


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
