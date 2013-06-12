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
<h2><i>Arabidopsis</i> AGC Kinase Gene Families</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>
B&ouml;gre, L., &Ouml;kr&eacute;sz, L., Henriques, R., and  Anthony, R. G. (2003) <a href="http://arabidopsis.org/servlets/TairObject?type=publication&id=501710530">Growth signalling pathways in Arabidopsis and the AGC protein kinases</a><I> Trends Plant Sci.</I> <b>8</b>. 424-431.<br>

<a href="http://personal.rhul.ac.uk/ujba/110/agc/agc_genes1.htm">http://personal.rhul.ac.uk/ujba/110/agc/agc_genes1.htm</a><br>

<A HREF="http://personal.rhul.ac.uk/ujba/110/bogrelab.htm">URL: The B&ouml;gre Lab</A></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td><ul><LI>phylogenetic tree,
        <LI>presence of motifs in catalytic, N- and C-terminal to the catalytic domain, 
        <li>signature motifs in the activation domain (also called T loop) between kinase subdomains VII and VIII, 
        <LI>hydrophobic PIF domain
    </UL></td></tr>
<TR><TD valign=top><B>Contact:</b></td>
<td><a href="http://arabidopsis.org/servlets/TairObject?type=person&id=1213417" target=new>Laszlo B&ouml;gre</A><BR>
    <a href="http://arabidopsis.org/servlets/TairObject?type=person&id=7034" target=new>Laszlo Okresz</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=2 valign=top><b>PDK-1 subfamily</b></td>

       <td>PDK1.1</td>

       <td>T32M21.110<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g04510 target="new">At5g04510</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_120533&doptcmdl=GenBank>NM_120533</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g04510 target="new">3-phosphoinositide-dependent protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>PDK1.2</td>

       <td>F13M14.18<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g10540 target="new">At3g10540</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_111890&doptcmdl=GenBank>NM_111890</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g10540 target="new">3-phosphoinositide-dependent protein kinase
</A></td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>S6K subfamily</b></td>

       <td>S6K1</td>

       <td>F17O14.20<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g08730 target="new">At3g08730</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_111707&doptcmdl=GenBank>NM_111707</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g08730 target="new">Ribosomal-protein S6 kinase ATPK6
</A></td>

        </tr>
<tr class="alt">

       <td>S6K2</td>

       <td>F17O14.19<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g08720 target="new">At3g08720</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_111706&doptcmdl=GenBank>NM_111706</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g08720 target="new">Ribosomal-protein S6 kinase AtPK19
</A></td>

        </tr>
<tr class="alt"><td rowspan=4 valign=top><b>IRE subfamily</b></td>

       <td>IRE</td>

       <td>MMI9.15<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g62310 target="new">At5g62310</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_125625&doptcmdl=GenBank>NM_125625</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g62310 target="new">"protein kinase, IRE (incomplete root hair elongation)"
</A></td>

        </tr>
<tr class="alt">

       <td>IRE-H1</td>

       <td>MEB5.7<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g17850 target="new">At3g17850</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_112666&doptcmdl=GenBank>NM_112666</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g17850 target="new">"protein kinase, similar to IRE "
</A></td>

        </tr>
<tr class="alt">

       <td>IRE3</td>

       <td>T1N15.10<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g48490 target="new">At1g48490</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_103745&doptcmdl=GenBank>NM_103745</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48490 target="new">"protein kinase, similar to IRE"
</A></td>

        </tr>
<tr class="alt">

       <td>IRE4</td>

       <td>T10O22.13<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g45160 target="new">At1g45160</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_103590&doptcmdl=GenBank>NM_103590</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g45160 target="new">protein kinase 
</A></td>

        </tr>
<tr class="alt"><td rowspan=8 valign=top><b>NDR subfamily</b></td>

       <td>NDR1</td>

       <td>FCAALL.182<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g14350 target="new">At4g14350</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_117512&doptcmdl=GenBank>NM_117512</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g14350 target="new">protein kinase 
</A></td>

        </tr>
<tr class="alt">

       <td>NDR2</td>

       <td>F21M11.15<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g03920 target="new">At1g03920</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_100273&doptcmdl=GenBank>NM_100273</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g03920 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>NDR3</td>

       <td>MLM24.2<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g23310 target="new">At3g23310</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_113233&doptcmdl=GenBank>NM_113233</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g23310 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>NDR4</td>

       <td>F27F23.20<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g19400 target="new">At2g19400</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_127498&doptcmdl=GenBank>NM_127498</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19400 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>NDR5</td>

       <td>T13C7.6<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g20470 target="new">At2g20470</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_127606&doptcmdl=GenBank>NM_127606</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g20470 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>NDR6</td>

       <td>F4I10.10<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g33080 target="new">At4g33080</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_119462&doptcmdl=GenBank>NM_119462</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g33080 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>NDR7</td>

       <td>T5I8.9<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g30640 target="new">At1g30640</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_102801&doptcmdl=GenBank>NM_102801</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30640 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>NDR8</td>

       <td>MYH9.10<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g09890 target="new">At5g09890</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_121026&doptcmdl=GenBank>NM_121026</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g09890 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt"><td rowspan=17 valign=top><b>AGC1 subfamily</b></td>

       <td>AGC1.1</td>

       <td>MYN21.2<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g55910 target="new">At5g55910</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_124973&doptcmdl=GenBank>NM_124973</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55910 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>AGC1.2</td>

       <td>T15N24.60<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g26610 target="new">At4g26610</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_118795&doptcmdl=GenBank>NM_118795</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g26610 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>AGC1.3</td>

       <td>T13E15.16<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g44830 target="new">At2g44830</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_180095&doptcmdl=GenBank>NM_180095</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44830 target="new">protein kinase 
</A></td>

        </tr>
<tr class="alt">

       <td>AGC1.4</td>

       <td>MUD12.10<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g40030 target="new">At5g40030</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_123366&doptcmdl=GenBank>NM_123366</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40030 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>AGC1.5</td>

       <td>MBK21.5<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g12690 target="new">At3g12690</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_112105&doptcmdl=GenBank>NM_112105</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g12690 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>AGC1.6</td>

       <td>F3O9.24<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g16440 target="new">At1g16440</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_101510&doptcmdl=GenBank>NM_101510</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16440 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>AGC1.7</td>

       <td>YUP8H12R.15<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g79250 target="new">At1g79250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_106575&doptcmdl=GenBank>NM_106575</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79250 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>AGC1.8</td>

       <td>F17C15.60<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g03640 target="new">At5g03640</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_120445&doptcmdl=GenBank>NM_120445</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g03640 target="new">protein kinase 
</A></td>

        </tr>
<tr class="alt">

       <td>AGC1.9</td>

       <td>F2H17.4<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g36350 target="new">At2g36350</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_129192&doptcmdl=GenBank>NM_129192</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36350 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>AGC1.10</td>

       <td>F18A8.7<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g26700 target="new">At2g26700</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_128227&doptcmdl=GenBank>NM_128227</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26700 target="new">protein kinase 
</A></td>

        </tr>
<tr class="alt">

       <td>AGC1.11</td>

       <td>MLN21.22<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g14370 target="new">At3g14370</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_112295&doptcmdl=GenBank>NM_112295</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g14370 target="new">protein kinase 
</A></td>

        </tr>
<tr class="alt">

       <td>AGC1.12</td>

       <td>T18B22.10<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g44610 target="new">At3g44610</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_114329&doptcmdl=GenBank>NM_114329</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g44610 target="new">protein kinase 
</A></td>

        </tr>
<tr class="alt">

       <td>AtPK3</td>

       <td>F22G10.21<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g53700 target="new">At1g53700</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_104248&doptcmdl=GenBank>NM_104248</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53700 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>AtPK5</td>

       <td>MCA23.7<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g47750 target="new">At5g47750</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_124149&doptcmdl=GenBank>NM_124149</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g47750 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>AtPK7</td>

       <td>MMJ24.13<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g27580 target="new">At3g27580</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_113674&doptcmdl=GenBank>NM_113674</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g27580 target="new">protein kinase
</A></td>

        </tr>
<tr class="alt">

       <td>"PINOID, PID"</td>

       <td>T31E10.1<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g34650 target="new">At2g34650</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_129019&doptcmdl=GenBank>NM_129019</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34650 target="new">protein kinase (PINOID/PID)
</A></td>

        </tr>
<tr class="alt">

       <td>KIPK</td>

       <td>F8J2.60<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g52890 target="new">At3g52890</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_180356&doptcmdl=GenBank>NM_180356</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g52890 target="new">protein kinase (KIPK)
</A></td>

        </tr>
<tr class="alt"><td rowspan=4 valign=top><b>AGC2 subfamily</b></td>

       <td>AGC2.1</td>

       <td>MJL12.22<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g25250 target="new">At3g25250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_113431&doptcmdl=GenBank>NM_113431</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g25250 target="new">protein kinase 
</A></td>

        </tr>
<tr class="alt">

       <td>AGC2.2</td>

       <td>F25G13.90<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g13000 target="new">At4g13000</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_117369&doptcmdl=GenBank>NM_117369</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g13000 target="new">protein kinase 
</A></td>

        </tr>
<tr class="alt">

       <td>AGC2.3</td>

       <td>F11M15.3<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g51170 target="new">At1g51170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_103996&doptcmdl=GenBank>NM_103996</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51170 target="new">protein kinase 
</A></td>

        </tr>
<tr class="alt">

       <td>AGC2.4</td>

       <td>MOE17.13<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g20830 target="new">At3g20830</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_112974&doptcmdl=GenBank>NM_112974</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g20830 target="new">protein kinase 
</A></td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>AGC2 related subfamily</b></td>

       <td>PHOT1</td>

       <td>T6D9.110<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g45780 target="new">At3g45780</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_114447&doptcmdl=GenBank>NM_114447</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g45780 target="new">protein kinase (nonphototropic hypocotyl 1)
</A></td>

        </tr>
<tr class="alt">

       <td>PHOT2</td>

       <td>K21L19.6<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g58140 target="new">At5g58140</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_125199&doptcmdl=GenBank>NM_125199</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58140 target="new">protein kinase (non phototropic hypocotyl 1-related)
</A></td>

        </tr>
</table><P>
<center>Last modified on January 16, 2004</center> 

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
