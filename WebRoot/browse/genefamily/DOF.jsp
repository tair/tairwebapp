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
                <td width="602">        <tr>
                <td width=602>
<TR><TD><h2>DOF <i>Arabidopsis</i> Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<td>Yanagisawa S. (2002)  <A HREF="http://arabidopsis.org/servlets/TairObject?type=publication&id=501682896">
The Dof family of plant transcription factors.</a> Trends
Plant Sci. 7(12):555-60.
</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Defined by the presence of the highly-conserved Dof-type zinc finger
(C2-X21-C2) motif.
</TD>
</tr>
<TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=1501417250 target=new>Shuichi Yanagisawa</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B><BR>
          Alternate Name:</TH>

   <TH><B>BAC Locus:</B>
       </TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR  MIPS MPSS</B></TH>

         </TR>

<tr class="alt"><td rowspan=37 valign=top><b>Dof family</b></td>

       <td>AtDof1.1<br>
           OBP2</td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g07640 target="new">At1g07640</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_850938&doptcmdl=GenPept>NP_850938</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_850938&doptcmdl=GenBank>NP_850938</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07640 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g07640 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g07640 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof1.2<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g21340 target="new">At1g21340</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_173556&doptcmdl=GenPept>NP_173556</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_173556&doptcmdl=GenBank>NP_173556</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g21340 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g21340 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g21340 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof1.3<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g26790 target="new">At1g26790</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_174001&doptcmdl=GenPept>NP_174001</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_174001&doptcmdl=GenBank>NP_174001</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26790 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g26790 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g26790 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof1.4<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g28310 target="new">At1g28310</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_174152&doptcmdl=GenPept>NP_174152</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_174152&doptcmdl=GenBank>NP_174152</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g28310 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g28310 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g28310 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof1.5<br>
           COG1</td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g29160 target="new">At1g29160</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_174211&doptcmdl=GenPept>NP_174211</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_174211&doptcmdl=GenBank>NP_174211</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29160 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g29160 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g29160 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof1.6<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g47655 target="new">At1g47655</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564510&doptcmdl=GenPept>NP_564510</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_564510&doptcmdl=GenBank>NP_564510</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g47655 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g47655 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g47655 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof1.7<br>
           ADOF1</td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g51700 target="new">At1g51700</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_175581&doptcmdl=GenPept>NP_175581</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_175581&doptcmdl=GenBank>NP_175581</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51700 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g51700 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g51700 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof1.8<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g64620 target="new">At1g64620</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564836&doptcmdl=GenPept>NP_564836</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_564836&doptcmdl=GenBank>NP_564836</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64620 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g64620 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g64620 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof1.9<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g65940 target="new">At1g65940</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=&doptcmdl=GenPept></A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=&doptcmdl=GenBank></A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65940 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g65940 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g65940 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof1.10<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g69570 target="new">At1g69570</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_177116&doptcmdl=GenPept>NP_177116</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_177116&doptcmdl=GenBank>NP_177116</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69570 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At1g69570 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At1g69570 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof2.1<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g28510 target="new">At2g28510</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_565673&doptcmdl=GenPept>NP_565673</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_565673&doptcmdl=GenBank>NP_565673</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28510 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g28510 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g28510 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof2.2<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g28810 target="new">At2g28810</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_850126&doptcmdl=GenPept>NP_850126</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_850126&doptcmdl=GenBank>NP_850126</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28810 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g28810 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g28810 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof2.3<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g34140 target="new">At2g34140</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_180961&doptcmdl=GenPept>NP_180961</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_180961&doptcmdl=GenBank>NP_180961</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34140 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g34140 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g34140 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof2.4<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g37590 target="new">At2g37590</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_181295&doptcmdl=GenPept>NP_181295</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_181295&doptcmdl=GenBank>NP_181295</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37590 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g37590 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g37590 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof2.5<br>
           DAG2</td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g46590 target="new">At2g46590</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_182182&doptcmdl=GenPept>NP_182182</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_182182&doptcmdl=GenBank>NP_182182</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46590 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At2g46590 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At2g46590 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof3.1<br>
           ADOF2</td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g21270 target="new">At3g21270</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_188764&doptcmdl=GenPept>NP_188764</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_188764&doptcmdl=GenBank>NP_188764</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g21270 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g21270 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g21270 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof3.2<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g45610 target="new">At3g45610</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_190147&doptcmdl=GenPept>NP_190147</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_190147&doptcmdl=GenBank>NP_190147</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g45610 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g45610 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g45610 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof3.3<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g47500 target="new">At3g47500</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_190334&doptcmdl=GenPept>NP_190334</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_190334&doptcmdl=GenBank>NP_190334</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47500 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g47500 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g47500 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof3.4<br>
           OBP1</td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g50410 target="new">At3g50410</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_190610&doptcmdl=GenPept>NP_190610</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_190610&doptcmdl=GenBank>NP_190610</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g50410 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g50410 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g50410 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof3.5<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g52440 target="new">At3g52440</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_190812&doptcmdl=GenPept>NP_190812</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_190812&doptcmdl=GenBank>NP_190812</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g52440 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g52440 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g52440 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof3.6<br>
           OBP3</td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g55370 target="new">At3g55370</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_191097&doptcmdl=GenPept>NP_191097</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_191097&doptcmdl=GenBank>NP_191097</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55370 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g55370 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g55370 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof3.7<br>
           DAG1;BBFa</td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g61850 target="new">At3g61850</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_191744&doptcmdl=GenPept>NP_191744</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_191744&doptcmdl=GenBank>NP_191744</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g61850 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At3g61850 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At3g61850 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof4.1<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g00940 target="new">At4g00940</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_192003&doptcmdl=GenPept>NP_192003</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_192003&doptcmdl=GenBank>NP_192003</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00940 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g00940 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g00940 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof4.2<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g21030 target="new">At4g21030</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_193835&doptcmdl=GenPept>NP_193835</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_193835&doptcmdl=GenBank>NP_193835</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g21030 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g21030 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g21030 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof4.3<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g21040 target="new">At4g21040</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_193836&doptcmdl=GenPept>NP_193836</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_193836&doptcmdl=GenBank>NP_193836</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g21040 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g21040 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g21040 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof4.4<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g21050 target="new">At4g21050</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_193837&doptcmdl=GenPept>NP_193837</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_193837&doptcmdl=GenBank>NP_193837</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g21050 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g21050 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g21050 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof4.5<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g21080 target="new">At4g21080</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_193840&doptcmdl=GenPept>NP_193840</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_193840&doptcmdl=GenBank>NP_193840</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g21080 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g21080 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g21080 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof4.6<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g24060 target="new">At4g24060</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_567693&doptcmdl=GenPept>NP_567693</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_567693&doptcmdl=GenBank>NP_567693</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g24060 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g24060 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g24060 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof4.7<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g38000 target="new">At4g38000</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_195513&doptcmdl=GenPept>NP_195513</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_195513&doptcmdl=GenBank>NP_195513</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g38000 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At4g38000 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At4g38000 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof5.1<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g02460 target="new">At5g02460</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_195866&doptcmdl=GenPept>NP_195866</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_195866&doptcmdl=GenBank>NP_195866</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g02460 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g02460 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g02460 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof5.2<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g39660 target="new">At5g39660</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_851106&doptcmdl=GenPept>NP_851106</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_851106&doptcmdl=GenBank>NP_851106</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g39660 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g39660 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g39660 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof5.3<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g60200 target="new">At5g60200</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_568920&doptcmdl=GenPept>NP_568920</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_568920&doptcmdl=GenBank>NP_568920</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60200 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g60200 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g60200 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof5.4<br>
           OBP4</td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g60850 target="new">At5g60850</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_200893&doptcmdl=GenPept>NP_200893</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_200893&doptcmdl=GenBank>NP_200893</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60850 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g60850 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g60850 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof5.5<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g62430 target="new">At5g62430</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_201049&doptcmdl=GenPept>NP_201049</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_201049&doptcmdl=GenBank>NP_201049</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g62430 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g62430 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g62430 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof5.6<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g62940 target="new">At5g62940</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_201099&doptcmdl=GenPept>NP_201099</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_201099&doptcmdl=GenBank>NP_201099</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g62940 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g62940 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g62940 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof5.7<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g65590 target="new">At5g65590</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_201362&doptcmdl=GenPept>NP_201362</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_201362&doptcmdl=GenBank>NP_201362</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65590 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g65590 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g65590 target="new">MPSS</a>

	   </td>

        </tr>
<tr class="alt">

       <td>AtDof5.8<br>
           </td>

       <td><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g66940 target="new">At5g66940</A></td>

<!-- use the following for NP_ or AAC_  -->

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_201495&doptcmdl=GenPept>NP_201495</A><br></td>


<!-- or use the following for NM_  -->
<!--
<td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NP_201495&doptcmdl=GenBank>NP_201495</A><br></td>

-->


<!-- added for special expansin group -->

    <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g66940 target="new">TIGR</A>
	   <a href=http://mips.gsf.de/cgi-bin/proj/thal/search_gene?code=At5g66940 target="new">MIPS</a>
	   <a href=http://mpss.udel.edu/at/GeneAnalysis.php?featureName=At5g66940 target="new">MPSS</a>

	   </td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified December 3, 2004</center>                </td>
        </tr>
</TABLE>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
