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
<h2>FH2 protein (formin) <i>Arabidopsis</i> Gene Family</h2>
		<table border=0 cellspacing=0 cellpadding=2>
		<TR><TD valign=top><B>Source:</B></td>
		<td>
Website: <a href="http://kfrserver.natur.cuni.cz/kfrserver/genes/formins/">The plant formin-like (FH2) proteins</a><br>
 	


Deeks, M. J.,Hussey, P. J.,Davies, B. (2002) <a href="http://arabidopsis.org/servlets/TairObject?type=publication&id=501682561">Formins: intermediates in signal-transduction cascades that affect cytoskeletal reorganization</a>. Trends In Plant Science 7: 492.<br>



Cvrckova, F.,Novotny, M.,Pickova, D.,Zarsky, V. (2004) <a href="http://arabidopsis.org/servlets/TairObject?type=publication&id=501712856">Formin homology 2 domains occur in multiple contexts in angiosperms</a>. BMC Genomics 5.

                </td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B>
    <td>Members of the FH2 gene family are defined by the presence of a Class I or II FH2 domain. 
    </TD>
</tr>
<TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=3301 target=new>Fatima Cvrckova</A></td></tr>
</table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B><BR>
          Alternate Name:</TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR  MIPS MPSS</B></TH>

         </TR>

<tr class="alt"><td rowspan=11 align="top"><b>Class I formin family</b></td>

       <td>AtFH1<br>
           AFH1;AtFORMIN8</td>

       <td>MWL2.16<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g25500 target="new">At3g25500</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF14548&doptcmdl=GenPept>AAF14548</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAF14548&doptcmdl=GenBank>AAF14548</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g25500 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g25500 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g25500 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH2<br>
           AtFORMIN2</td>

       <td>F18O19.9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g43800 target="new">At2g43800</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_181908&doptcmdl=GenPept>NP_181908</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_181908&doptcmdl=GenBank>NP_181908</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43800 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g43800 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g43800 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH3<br>
           AtFORMIN3</td>

       <td>FCAALL.218<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g15200 target="new">At4g15200</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=DAA04450&doptcmdl=GenPept>DAA04450</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=DAA04450&doptcmdl=GenBank>DAA04450</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g15200 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g15200 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g15200 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH4<br>
           AtFORMIN4</td>

       <td>F3I6.8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g24150 target="new">At1g24150</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=DAA04459&doptcmdl=GenPept>DAA04459</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=DAA04459&doptcmdl=GenBank>DAA04459</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24150 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g24150 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g24150 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH5<br>
           AtFORMIN5</td>

       <td>MRB17.15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g54650 target="new">At5g54650</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK68741&doptcmdl=GenPept>AAK68741</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAK68741&doptcmdl=GenBank>AAK68741</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g54650 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g54650 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g54650 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH6<br>
           AtFORMIN6</td>

       <td>K9I9.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g67470 target="new">At5g67470</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAQ99143&doptcmdl=GenPept>AAQ99143</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAQ99143&doptcmdl=GenBank>AAQ99143</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g67470 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g67470 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g67470 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH7<br>
           AtFORMIN7</td>

       <td>F23H11.22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g59910 target="new">At1g59910</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAQ62880&doptcmdl=GenPept>AAQ62880</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAQ62880&doptcmdl=GenBank>AAQ62880</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g59910 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g59910 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g59910 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH8<br>
           AtFORMIN1</td>

       <td>F20P5.14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g70140 target="new">At1g70140</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_177171&doptcmdl=GenPept>NP_177171</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_177171&doptcmdl=GenBank>NP_177171</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70140 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g70140 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g70140 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH9<br>
           </td>

       <td>K23F3.8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g48360 target="new">At5g48360</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAC43066&doptcmdl=GenPept>BAC43066</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=BAC43066&doptcmdl=GenBank>BAC43066</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g48360 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g48360 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g48360 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH10<br>
           </td>

       <td>F21O3.25<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g07540 target="new">At3g07540</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK91412&doptcmdl=GenPept>AAK91412</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAK91412&doptcmdl=GenBank>AAK91412</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g07540 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g07540 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g07540 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH11<br>
           </td>

       <td>F22F7.8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g05470 target="new">At3g05470</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_187198&doptcmdl=GenPept>NP_187198</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_187198&doptcmdl=GenBank>NP_187198</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05470 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g05470 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g05470 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt"><td rowspan=10><b>Class II formin family</b></td>

       <td>AtFH12<br>
           </td>

       <td>F13A11.4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g42980 target="new">At1g42980</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_174997&doptcmdl=GenPept>NP_174997</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_174997&doptcmdl=GenBank>NP_174997</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g42980 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g42980 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g42980 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH13<br>
           </td>

       <td>MCK7.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g58160 target="new">At5g58160</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=DAA04457&doptcmdl=GenPept>DAA04457</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=DAA04457&doptcmdl=GenBank>DAA04457</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58160 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g58160 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g58160 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH14<br>
           </td>

       <td>F5M6.18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g31810 target="new">At1g31810</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=DAA04456&doptcmdl=GenPept>DAA04456</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=DAA04456&doptcmdl=GenBank>DAA04456</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31810 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g31810 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g31810 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH15<br>
           </td>

       <td>MBK20.9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g07650 target="new">At5g07650</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_196382&doptcmdl=GenPept>NP_196382</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_196382&doptcmdl=GenBank>NP_196382</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07650 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g07650 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g07650 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH16<br>
           </td>

       <td>MBK20.23<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g07770 target="new">At5g07770</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_196394&doptcmdl=GenPept>NP_196394</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_196394&doptcmdl=GenBank>NP_196394</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07770 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g07770 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g07770 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH17<br>
           </td>

       <td>F1D9.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g32400 target="new">At3g32400</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=DAA04452&doptcmdl=GenPept>DAA04452</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=DAA04452&doptcmdl=GenBank>DAA04452</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g32400 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g32400 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g32400 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH18<br>
           </td>

       <td>F27C12.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g25050 target="new">At2g25050</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_180077&doptcmdl=GenPept>NP_180077</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_180077&doptcmdl=GenBank>NP_180077</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25050 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g25050 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g25050 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH19<br>
           </td>

       <td>MXM12.2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g07780 target="new">At5g07780</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAD94830&doptcmdl=GenPept>BAD94830</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=BAD94830&doptcmdl=GenBank>BAD94830</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07780 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g07780 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g07780 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH20<br>
           </td>

       <td>MBK20.20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g07740 target="new">At5g07740</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=DAA04460&doptcmdl=GenPept>DAA04460</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=DAA04460&doptcmdl=GenBank>DAA04460</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07740 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g07740 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g07740 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtFH21<br>
           </td>

       <td>MBK20.22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g07760 target="new">At5g07760</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_196393&doptcmdl=GenPept>NP_196393</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_196393&doptcmdl=GenBank>NP_196393</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07760 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g07760 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g07760 target="new">MPSS</a>

	   </td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified April 27, 2004</center>      


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
