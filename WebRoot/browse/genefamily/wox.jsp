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
<h2><i>Arabidopsis</i> Wox Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Haecker A, Gross-Hardt R, Geiges B, Sarkar A, Breuninger H, Herrmann M,
Laux T. (2004) <a href="/servlets/TairObject?type=publication&id=501711727">Expression dynamics of WOX genes mark cell fate decisions
during early embryonic patterning in Arabidopsis thaliana.</a> Development.
131: 657-68.<br>
<a href="http://www.biologie.uni-freiburg.de/LauxLab/">Thomas Laux Lab</a></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Gene family member contain the WUS homeodomain subtype and a WUS-box
motif.</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=5630 target=new>Thomas Laux</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B><BR>
          (Alternate Name:)</TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td valign=top rowspan=15><b>WOX gene family</b></td>

       <td>WUS</td>

       <td>T13L16.18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g17950 target="new">At2g17950</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_127349&doptcmdl=GenBank>NM_127349</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g17950 target="new">99.4% identical to WUSCHELL (GI:4090200) [Arabidopsis thaliana]
</A></td>

        </tr>
<tr class="alt">

       <td>WOX1</td>

       <td>MEB5.23<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g18010 target="new">At3g18010</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY251394&doptcmdl=GenBank>AY251394</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g18010 target="new">similar to wuschel protein (GI:22087128) [Arabidopsis thaliana]; similar to HB2 homeodomain protein GB:CAA09367 from [Populus tremula x Populus tremuloides]
</A></td>

        </tr>
<tr class="alt">

       <td>WOX2</td>

       <td>MNC17.25<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g59340 target="new">At5g59340</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY251392&doptcmdl=GenBank>AY251392</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59340 target="new">similar to wuschel protein (GI:22087128) [Arabidopsis thaliana]
</A></td>

        </tr>
<tr class="alt">

       <td>WOX3<BR>
           (PRS)</td>

       <td>T8O18.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g28610 target="new">At2g28610</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY251397&doptcmdl=GenBank>AY251397</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28610 target="new">identical to PRESSED FLOWER (GP:17907768) {Arabidopsis thaliana}
</A></td>

        </tr>
<tr class="alt">

       <td>WOX4</td>

       <td>F2G19.11<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g46480 target="new">At1g46480</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY251396&doptcmdl=GenBank>AY251396</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g46480 target="new">similar to wuschel protein (GI:22087128) [Arabidopsis thaliana]
</A></td>

        </tr>
<tr class="alt">

       <td>WOX5</td>

       <td>F11B9.18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g11260 target="new">At3g11260</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY251398&doptcmdl=GenBank>AY251398</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g11260 target="new">similar to wuschel protein (GI:22087128) [Arabidopsis thaliana]; supporting cDNA gi|24953994|gb|AY150812.1|
</A></td>

        </tr>
<tr class="alt">

       <td>WOX6</td>

       <td>F2I9.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g01500 target="new">At2g01500</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY251399&doptcmdl=GenBank>AY251399</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01500 target="new">similar to wuschel protein (GI:22087128) [Arabidopsis thaliana]
</A></td>

        </tr>
<tr class="alt">

       <td>WOX7</td>

       <td>MJJ3.18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g05770 target="new">At5g05770</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_120659&doptcmdl=GenBank>NM_120659</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g05770 target="new">similar to PRESSED FLOWER (GP:17907768) {Arabidopsis thaliana}
</A></td>

        </tr>
<tr class="alt">

       <td>WOX8</td>

       <td>MCL19.2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g45980 target="new">At5g45980</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY251400&doptcmdl=GenBank>AY251400</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g45980 target="new">contains similarity to homeodomain transcription factor; contains weak hit to Pfam profile PF00046: Homeobox domain
</A></td>

        </tr>
<tr class="alt">

       <td>WOX9</td>

       <td>T1B8.31<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g33880 target="new">At2g33880</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY251401&doptcmdl=GenBank>AY251401</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33880 target="new">homeodomain transcription factor -related
</A></td>

        </tr>
<tr class="alt">

       <td>WOX10</td>

       <td>F2D10.20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g20710 target="new">At1g20710</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_101923&doptcmdl=GenBank>NM_101923</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20710 target="new">similar to homeodomain protein PALE-2 (GI:20152544) [Arabidopsis thaliana]; contains Pfam profile: PF00046 homeobox domain
</A></td>

        </tr>
<tr class="alt">

       <td>WOX11</td>

       <td>T12J13.6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g03660 target="new">At3g03660</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY251402&doptcmdl=GenBank>AY251402</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g03660 target="new">similar to to PRESSED FLOWER (GP:17907768) {Arabidopsis thaliana}
</A></td>

        </tr>
<tr class="alt">

       <td>WOX12</td>

       <td>MVA3.17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g17810 target="new">At5g17810</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY251403&doptcmdl=GenBank>AY251403</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g17810 target="new">similar to to PRESSED FLOWER (GP:17907768) {Arabidopsis thaliana};
</A></td>

        </tr>
<tr class="alt">

       <td>WOX13</td>

       <td>F8D20.60<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g35550 target="new">At4g35550</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY251404&doptcmdl=GenBank>AY251404</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g35550 target="new">HB2 homeodomain protein [Populus tremula x Populus tremuloides] GI:3955021; contains Pfam PF00046: Homeobox domain
</A></td>

        </tr>
<tr class="alt">

       <td>WOX14</td>

       <td>F2D10.19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g20700 target="new">At1g20700</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_101922&doptcmdl=GenBank>NM_101922</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20700 target="new">strong similarity to homeodomain protein PALE-2 (GI:20152544) [Arabidopsis thaliana]; contains Pfam profile: PF00046 homeobox domain
</A></td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified on February 12, 2004</center>         


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
