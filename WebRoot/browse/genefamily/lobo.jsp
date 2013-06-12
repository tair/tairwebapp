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
<h2><i>Arabidopsis</i> Rapid Response to Elicitors Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Primary publication not yet published.
<BR>
Serrano, M.,Guzman, P. (2004)<A HREF=http://arabidopsis.org/servlets/TairObject?type=publication&id=501712928> Isolation and Gene Expression Analysis of
Arabidopsis thaliana Mutants With Constitutive Expression of ATL2, an
Early Elicitor-Response RING-H2 Zinc-Finger Gene.</A> Genetics. 167: 919.</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Defined to be genes induced rapidly by elicitors with a ring zinc-finger
domain.</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=1501415808 target=new>Marta Berrocal-Lobo</A><br>
    <a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=5473 target=new>Plinio Guzman</a></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B><BR>
          Alternate Name:</TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR  MIPS MPSS</B></TH>

         </TR>

<tr class="alt"><td valign=top rowspan=4><b>RRE</b></td>

       <td>ATL9<br>
           AtRRE1</td>

       <td>f19i3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g35000 target="new">At2g35000</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC12839&doptcmdl=GenPept>AAC12839</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AAC12839&doptcmdl=GenBank>AAC12839</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g35000 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g35000 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g35000 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>ATL2<br>
           AtRRE2</td>

       <td>MGL6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g16720 target="new">At3g16720</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_188294&doptcmdl=GenPept>NP_188294</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_188294&doptcmdl=GenBank>NP_188294</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16720 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g16720 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g16720 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>ATL6<br>
           AtRRE3</td>

       <td>T12H1 <br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g05200 target="new">At3g05200</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_566249&doptcmdl=GenPept>NP_566249</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_566249&doptcmdl=GenBank>NP_566249</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05200 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g05200 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g05200 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>ATL17<br>
           AtRRE4</td>

       <td>FCAALL<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g15975 target="new">At4g15975</A></td>

<!-- use the following for NP_ or AAC_  -->
<!--
       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NM_117690&doptcmdl=GenPept>NM_117690</A><br></td>
-->

<!-- or use the following for NM_  -->

<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_117690&doptcmdl=GenBank>NM_117690</A><br></td>




<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g15975 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g15975 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g15975 target="new">MPSS</a>

	   </td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified September 21, 2004</center>           


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
