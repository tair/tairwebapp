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
<h2><i>Arabidopsis</i> Cytoplasmic Ribosomal Protein Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Barakat A, Szick-Miranda K, Chang IF, Guyot R, Blanc G, Cooke R, Delseny
M, Bailey-Serres J. (2001) <A HREF=http://www.arabidopsis.org/servlets/TairObject?type=publication&id=1545953>The organization of cytoplasmic ribosomal
protein genes in the Arabidopsis genome.</A> Plant Physiology. 127:398-415.<BR>
<a href=http://138.23.191.134/r-protein%20table.htm>Arabidopsis Cytoplasmic Ribosomal Proteins</a></td></tr>

<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>1. Arabidopsis orthologues of the 79 rat 80S cytoplasmic ribosomal
proteins from the SWISS-PROT library
were identified with BLAST search against the NCBI protein or nucleotide
database.<BR>
2. The identification of the putative ribosomal protein are based on high
probability BLAST scores. With few exceptions,
the percentage amino acid sequence identity to rat ribosomal proteins is
greater than 50%.<BR>
</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=5152 target=new>Julia Bailey-Serres</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>


   <TH><B>Protein Name:</B><BR>
          Alternate Name:</TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=2 valign=top><b>Sa</b></td>

       <td>RPSaA<br>
           </td>

       <td>T10D10.16<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g72370 target="new">At1g72370</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52587&doptcmdl=GenPept>AAG52587</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72370 target="new">Sa in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPSaB<br>
           </td>

       <td>F7O18.26<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g04770 target="new">At3g04770</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF04903&doptcmdl=GenPept>AAF04903</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g04770 target="new">Sa in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=6 valign=top><b>S2</b></td>

       <td>RPS2A<br>
           </td>

       <td>F9K23.9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g58380 target="new">At1g58380</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG50639&doptcmdl=GenPept>AAG50639</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g58380 target="new">S2 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS2B<br>
           </td>

       <td>T4M14.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g59359 target="new">At1g59359</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564740&doptcmdl=GenPept>NP_564740</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g59359 target="new">S2 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS2C<br>
           </td>

       <td>T11A7.6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g41840 target="new">At2g41840</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC02764&doptcmdl=GenPept>AAC02764</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g41840 target="new">S2 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS2D<br>
           </td>

       <td>T8H10.90<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g57490 target="new">At3g57490</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB66016&doptcmdl=GenPept>CAB66016</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g57490 target="new">S2 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS2E<br>
           </td>

       <td>R18I.8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g58684 target="new">At1g58684</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_683443&doptcmdl=GenPept>NP_683443</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g58684 target="new">"S2 in small subunit, newly identified "
</A></td>

        </tr>
<tr class="alt">

       <td>RPS2F<br>
           </td>

       <td>T4M14.1<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g58983 target="new">At1g58983</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564737&doptcmdl=GenPept>NP_564737</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g58983 target="new">"S2 in small subunit, newly identified "
</A></td>

        </tr>
<tr class="alt"><td rowspan=3 valign=top><b>S3</b></td>

       <td>RPS3A<br>
           </td>

       <td>T9H9.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g31610 target="new">At2g31610</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD24852&doptcmdl=GenPept>AAD24852</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31610 target="new">S3 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS3B<br>
           </td>

       <td>F5K20.170<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g53870 target="new">At3g53870</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB88349&doptcmdl=GenPept>CAB88349</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g53870 target="new">S3 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS3C<br>
           </td>

       <td>MOK9.14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g35530 target="new">At5g35530</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB08712&doptcmdl=GenPept>BAB08712</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g35530 target="new">S3 in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>S3a</b></td>

       <td>RPS3aA<br>
           </td>

       <td>T9J14.21<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g04840 target="new">At3g04840</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51414&doptcmdl=GenPept>AAG51414</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g04840 target="new">S3a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS3aB<br>
           </td>

       <td>T4L20.250<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g34670 target="new">At4g34670</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAA18846&doptcmdl=GenPept>CAA18846</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34670 target="new">S3a in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=4 valign=top><b>S4</b></td>

       <td>RPS4A<br>
           </td>

       <td>F5J6.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g17360 target="new">At2g17360</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAB86513&doptcmdl=GenPept>AAB86513</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g17360 target="new">S4 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS4B<br>
           </td>

       <td>T28J14.30<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g07090 target="new">At5g07090</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB87265&doptcmdl=GenPept>CAB87265</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07090 target="new">S4 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS4C<br>
           </td>

       <td><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=3510344">MJG14.8</a><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name= target="new"></A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=&doptcmdl=GenPept></A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPS4D<br>
           </td>

       <td>MQJ2.2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g58420 target="new">At5g58420</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10257&doptcmdl=GenPept>BAB10257</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58420 target="new">S4 in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>S5</b></td>

       <td>RPS5A<br>
           </td>

       <td>F3G5.6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g37270 target="new">At2g37270</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC98068&doptcmdl=GenPept>AAC98068</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37270 target="new">S5 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS5B<br>
           </td>

       <td>F26K24.23<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g11940 target="new">At3g11940</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF23210&doptcmdl=GenPept>AAF23210</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g11940 target="new">S5 in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>S6</b></td>

       <td>RPS6A<br>
           </td>

       <td>F28M20.110<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g31700 target="new">At4g31700</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAA19753&doptcmdl=GenPept>CAA19753</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g31700 target="new">S6 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS6B<br>
           </td>

       <td>F12B17.290<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g10360 target="new">At5g10360</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB89407&doptcmdl=GenPept>CAB89407</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g10360 target="new">S6 in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=3 valign=top><b>S7</b></td>

       <td>RPS7A<br>
           </td>

       <td>F11I4.1<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g48830 target="new">At1g48830</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG60128&doptcmdl=GenPept>AAG60128</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48830 target="new">S7 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS7B<br>
           </td>

       <td>F16B3.19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g02560 target="new">At3g02560</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF32463&doptcmdl=GenPept>AAF32463</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02560 target="new">S7 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS7C<br>
           </td>

       <td>T21H19.50<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g16130 target="new">At5g16130</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC01854&doptcmdl=GenPept>CAC01854</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g16130 target="new">S7 in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>S8</b></td>

       <td>RPS8A<br>
           </td>

       <td>F5O24.180<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g20290 target="new">At5g20290</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_197529&doptcmdl=GenPept>NP_197529</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g20290 target="new">S8 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS8B<br>
           </td>

       <td>MNC17.15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g59240 target="new">At5g59240</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB09769&doptcmdl=GenPept>BAB09769</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59240 target="new">S8 in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=3 valign=top><b>S9</b></td>

       <td>RPS9A<br>
           </td>

       <td>F16J13.230<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g12160 target="new">At4g12160</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB40957&doptcmdl=GenPept>CAB40957</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPS9B<br>
           </td>

       <td>F8M21.90<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g15200 target="new">At5g15200</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB89330&doptcmdl=GenPept>CAB89330</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g15200 target="new">S9 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS9C<br>
           </td>

       <td>MYH19.1<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g39850 target="new">At5g39850</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10209&doptcmdl=GenPept>BAB10209</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g39850 target="new">S9 in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=3 valign=top><b>S10</b></td>

       <td>RPS10A<br>
           </td>

       <td>F14M19.20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g25740 target="new">At4g25740</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB39595&doptcmdl=GenPept>CAB39595</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g25740 target="new">S10 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS10B<br>
           </td>

       <td>MBK23.4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g41520 target="new">At5g41520</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB11458&doptcmdl=GenPept>BAB11458</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g41520 target="new">S10 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS10C<br>
           </td>

       <td>F6N7.14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g52650 target="new">At5g52650</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAA98083&doptcmdl=GenPept>BAA98083</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g52650 target="new">S10 in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=3 valign=top><b>S11</b></td>

       <td>RPS11A<br>
           </td>

       <td>T2J13.230<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g48930 target="new">At3g48930</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB62017&doptcmdl=GenPept>CAB62017</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g48930 target="new">S11 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS11B<br>
           </td>

       <td>F6I18.290<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g30800 target="new">At4g30800</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAA18213&doptcmdl=GenPept>CAA18213</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g30800 target="new">S11 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS11C<br>
           </td>

       <td>MRO11.22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g23740 target="new">At5g23740</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10047&doptcmdl=GenPept>BAB10047</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g23740 target="new">S11 in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=3 valign=top><b>S12</b></td>

       <td>RPS12A<br>
           </td>

       <td>T24D18.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g15930 target="new">At1g15930</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF18490&doptcmdl=GenPept>AAF18490</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15930 target="new">S12 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS12B<br>
           </td>

       <td>F23A5.15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g80800 target="new">At1g80800</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_178197&doptcmdl=GenPept>NP_178197</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPS12C<br>
           </td>

       <td>F22D22.19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g32060 target="new">At2g32060</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD15398&doptcmdl=GenPept>AAD15398</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32060 target="new">S12 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=2><b>S13</b></td>

       <td>RPS13A<br>
           </td>

       <td>T4C21.180<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g60770 target="new">At3g60770</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB82681&doptcmdl=GenPept>CAB82681</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g60770 target="new">S13 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS13B<br>
           </td>

       <td>F6N15.7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g00100 target="new">At4g00100</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC19305&doptcmdl=GenPept>AAC19305</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00100 target="new">S13 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>S14</b></td>

       <td>RPS14A<br>
           </td>

       <td>F9C22.9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g36160 target="new">At2g36160</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD26971&doptcmdl=GenPept>AAD26971</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36160 target="new">S14 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS14B<br>
           </td>

       <td>F24K9.19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g11510 target="new">At3g11510</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51428&doptcmdl=GenPept>AAG51428</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g11510 target="new">S14 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS14C<br>
           </td>

       <td>F22O6.40<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g52580 target="new">At3g52580</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB43407&doptcmdl=GenPept>CAB43407</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g52580 target="new">S14 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=6><b>S15</b></td>

       <td>RPS15A<br>
           </td>

       <td>F19P19.29<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g04270 target="new">At1g04270</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAB70449&doptcmdl=GenPept>AAB70449</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04270 target="new">S15 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS15B<br>
           </td>

       <td>T5E8.290<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g09490 target="new">At5g09490</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC05475&doptcmdl=GenPept>CAC05475</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g09490 target="new">S15 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS15C<br>
           </td>

       <td>T5E8.300<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g09500 target="new">At5g09500</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC05476&doptcmdl=GenPept>CAC05476</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g09500 target="new">S15 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS15D<br>
           </td>

       <td>T5E8.310<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g09510 target="new">At5g09510</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC05477&doptcmdl=GenPept>CAC05477</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g09510 target="new">S15 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS15E<br>
           </td>

       <td>K9D7.14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g43640 target="new">At5g43640</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB11627&doptcmdl=GenPept>BAB11627</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g43640 target="new">S15 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS15F<br>
           </td>

       <td>MCD12.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g63070 target="new">At5g63070</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10549&doptcmdl=GenPept>BAB10549</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g63070 target="new">S15 in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=6 valign=top><b>S15a</b></td>

       <td>RPS15aA<br>
           </td>

       <td>F24B9.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g07770 target="new">At1g07770</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_172256&doptcmdl=GenPept>NP_172256</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07770 target="new">S15a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS15aB<br>
           </td>

       <td>F6F22.25<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g19720 target="new">At2g19720</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_179562&doptcmdl=GenPept>NP_179562</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19720 target="new">S15a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS15aC<br>
           </td>

       <td>F12L6.25<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g39590 target="new">At2g39590</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC27850&doptcmdl=GenPept>AAC27850</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39590 target="new">S15a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS15aD<br>
           </td>

       <td>F12M12.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g46040 target="new">At3g46040</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB90931&doptcmdl=GenPept>CAB90931</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g46040 target="new">S15a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS15aE<br>
           </td>

       <td>F27B13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g29430 target="new">At4g29430</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB79701&doptcmdl=GenPept>CAB79701</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g29430 target="new">S15a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS15aF<br>
           </td>

       <td>MMN10.16<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g59850 target="new">At5g59850</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_200793&doptcmdl=GenPept>NP_200793</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59850 target="new">S15a in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>S16</b></td>

       <td>RPS16A<br>
           </td>

       <td>F7B19.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g09990 target="new">At2g09990</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD22696&doptcmdl=GenPept>AAD22696</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g09990 target="new">S16 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS16B<br>
           </td>

       <td>T6K12.15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g04230 target="new">At3g04230</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF26790&doptcmdl=GenPept>AAF26790</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g04230 target="new">S16 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS16C<br>
           </td>

       <td>F20L16.100<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g18380 target="new">At5g18380</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_197339&doptcmdl=GenPept>NP_197339</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g18380 target="new">S16 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=4><b>S17</b></td>

       <td>RPS17A<br>
           </td>

       <td>T1O3.20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g04390 target="new">At2g04390</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD25839&doptcmdl=GenPept>AAD25839</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g04390 target="new">S17 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS17B<br>
           </td>

       <td>F5G3.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g05220 target="new">At2g05220</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD29060&doptcmdl=GenPept>AAD29060</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g05220 target="new">S17 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS17C<br>
           </td>

       <td>F13M14.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g10610 target="new">At3g10610</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51372&doptcmdl=GenPept>AAG51372</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g10610 target="new">S17 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS17D<br>
           </td>

       <td>MUK11.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g04800 target="new">At5g04800</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB08984&doptcmdl=GenPept>BAB08984</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g04800 target="new">S17 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>S18</b></td>

       <td>RPS18A <br>
           </td>

       <td>T22J18.5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g22780 target="new">At1g22780</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC25506&doptcmdl=GenPept>AAC25506</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22780 target="new">S18 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS18B <br>
           </td>

       <td>F12G12.15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g34030 target="new">At1g34030</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG12534&doptcmdl=GenPept>AAG12534</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34030 target="new">S18 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS18C<br>
           </td>

       <td>F17A8.150<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g09800 target="new">At4g09800</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB39647&doptcmdl=GenPept>CAB39647</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g09800 target="new">S18 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>S19</b></td>

       <td>RPS19A<br>
           </td>

       <td> F1C9.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g02080 target="new">At3g02080</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF14828&doptcmdl=GenPept>AAF14828</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02080 target="new">S19 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS19B<br>
           </td>

       <td>T20K14.130<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g15520 target="new">At5g15520</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC01751&doptcmdl=GenPept>CAC01751</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g15520 target="new">S19 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS19C<br>
           </td>

       <td>MAF19.17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g61170 target="new">At5g61170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10379&doptcmdl=GenPept>BAB10379</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g61170 target="new">S19 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>S20</b></td>

       <td>RPS20A<br>
           </td>

       <td>F14D17.100<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g45030 target="new">At3g45030</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB89318&doptcmdl=GenPept>CAB89318</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g45030 target="new">S20 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS20B<br>
           </td>

       <td>T21L8.120<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g47370 target="new">At3g47370</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB51209&doptcmdl=GenPept>CAB51209</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47370 target="new">S20 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS20C<br>
           </td>

       <td>MMI9.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g62300 target="new">At5g62300</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAA97194&doptcmdl=GenPept>BAA97194</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g62300 target="new">S20 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>S21</b></td>

       <td>RPS21A<br>
           </td>

       <td>K1G2.28<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g27450 target="new">At3g27450</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_189381&doptcmdl=GenPept>NP_189381</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPS21B<br>
           </td>

       <td>F5K20.190 <br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g53890 target="new">At3g53890</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB88351&doptcmdl=GenPept>CAB88351</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g53890 target="new">S21 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS21C<br>
           </td>

       <td>T1G16.30<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g27700 target="new">At5g27700</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_198122&doptcmdl=GenPept>NP_198122</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27700 target="new">S21 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=2><b>S23</b></td>

       <td>RPS23A<br>
           </td>

       <td>F11F8.27<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g09680 target="new">At3g09680</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF23298&doptcmdl=GenPept>AAF23298</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g09680 target="new">S23 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS23B<br>
           </td>

       <td>F9G14.270<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g02960 target="new">At5g02960</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB86050&doptcmdl=GenPept>CAB86050</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g02960 target="new">S23 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=2><b>S24</b></td>

       <td>RPS24A<br>
           </td>

       <td>T9J14.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g04920 target="new">At3g04920</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51413&doptcmdl=GenPept>AAG51413</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g04920 target="new">S24 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS24B<br>
           </td>

       <td>F15F15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g28060 target="new">At5g28060</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_198158&doptcmdl=GenPept>NP_198158</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g28060 target="new">S24 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=5><b>S25</b></td>

       <td>RPS25A<br>
           </td>

       <td>F16F14.14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g16360 target="new">At2g16360</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD22303&doptcmdl=GenPept>AAD22303</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPS25B<br>
           </td>

       <td>F2G1.15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g21580 target="new">At2g21580</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD23647&doptcmdl=GenPept>AAD23647</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21580 target="new">S25 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS25C<br>
           </td>

       <td>T4A2.5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g30740 target="new">At3g30740</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AP002066&doptcmdl=GenBank>AP002066</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPS25D<br>
           </td>

       <td>T4L20.250<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g34555 target="new">At4g34555</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAA18846&doptcmdl=GenPept>CAA18846</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPS25E<br>
           </td>

       <td>T22F8.100<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g39200 target="new">At4g39200</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB43635&doptcmdl=GenPept>CAB43635</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g39200 target="new">S25 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>S26</b></td>

       <td>RPS26A<br>
           </td>

       <td>T2P4.14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g40510 target="new">At2g40510</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAB87594&doptcmdl=GenPept>AAB87594</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40510 target="new">S26 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS26B<br>
           </td>

       <td>T2P4.6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g40590 target="new">At2g40590</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAB87578&doptcmdl=GenPept>AAB87578</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40590 target="new">S26 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS26C<br>
           </td>

       <td>F18O21.300<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g56340 target="new">At3g56340</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB87433&doptcmdl=GenPept>CAB87433</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g56340 target="new">S26 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=4><b>S27</b></td>

       <td>RPS27A<br>
           </td>

       <td>F4I18.31<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g45710 target="new">At2g45710</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC28554&doptcmdl=GenPept>AAC28554</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g45710 target="new">S27 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS27B<br>
           </td>

       <td>T20K12.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g61110 target="new">At3g61110</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB71041&doptcmdl=GenPept>CAB71041</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g61110 target="new">S27 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS27C<br>
           </td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=6850877>T20K12</a><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name= target="new"></A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=&doptcmdl=GenPept></A><br></td>

       <td>>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPS27D <br>
           </td>

       <td>K16F13.1<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g47930 target="new">At5g47930</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB09045&doptcmdl=GenPept>BAB09045</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g47930 target="new">S27 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>S27a</b></td>

       <td>RPS27aA<br>
           </td>

       <td>F28C11.5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g23410 target="new">At1g23410</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF79581&doptcmdl=GenPept>AAF79581</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23410 target="new">S27a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS27aB<br>
           </td>

       <td>F14M4.6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g47100 target="new">At2g47100</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC34235&doptcmdl=GenPept>AAC34235</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47100 target="new">S27a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS27aC<br>
           </td>

       <td>T17J13.210<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g62250 target="new">At3g62250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB71885&doptcmdl=GenPept>CAB71885</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g62250 target="new">S27a in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>S28</b></td>

       <td>RPS28A<br>
           </td>

       <td>T22K18.8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g10090 target="new">At3g10090</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF04415&doptcmdl=GenPept>AAF04415</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g10090 target="new">S28 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS28B<br>
           </td>

       <td>MED24.15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g03850 target="new">At5g03850</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB08611&doptcmdl=GenPept>BAB08611</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g03850 target="new">S28 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS28C<br>
           </td>

       <td>MHJ24.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g64140 target="new">At5g64140</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10282&doptcmdl=GenPept>BAB10282</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g64140 target="new">S28 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=4><b>S29</b></td>

       <td>RPS29A<br>
           </td>

       <td>T15B3.120<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g43980 target="new">At3g43980</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB88126&doptcmdl=GenPept>CAB88126</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g43980 target="new">S29 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS29B<br>
           </td>

       <td>T15B3.150<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g44010 target="new">At3g44010</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB88129&doptcmdl=GenPept>CAB88129</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g44010 target="new">S29 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS29C<br>
           </td>

       <td>F17I5.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g33865 target="new">At4g33865</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_567938&doptcmdl=GenPept>NP_567938</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g33865 target="new">S29 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS29D<br>
           </td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=7270316>F17I5</a><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name= target="new"></A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=&doptcmdl=GenPept></A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>S30</b></td>

       <td>RPS30A<br>
           </td>

       <td>F6F22.22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g19750 target="new">At2g19750</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC62141&doptcmdl=GenPept>AAC62141</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19750 target="new">S30 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS30B<br>
           </td>

       <td>F19B15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g29390 target="new">At4g29390</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB79697&doptcmdl=GenPept>CAB79697</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g29390 target="new">S30 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPS30C<br>
           </td>

       <td>M1K19.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g56670 target="new">At5g56670</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB09885&doptcmdl=GenPept>BAB09885</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g56670 target="new">S30 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>P0</b></td>

       <td>RPP0A<br>
           </td>

       <td>T28M21.17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g40010 target="new">At2g40010</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAB95286&doptcmdl=GenPept>AAB95286</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40010 target="new">P0 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPP0B<br>
           </td>

       <td>F3L24.7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g09200 target="new">At3g09200</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF14020&doptcmdl=GenPept>AAF14020</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g09200 target="new">P0 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPP0C<br>
           </td>

       <td>F11B9.17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g11250 target="new">At3g11250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG50973&doptcmdl=GenPept>AAG50973</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g11250 target="new">P0 in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=5 valign=top><b>P1</b></td>

       <td>RPP1A<br>
           </td>

       <td>T25K16.9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g01100 target="new">At1g01100</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF26471&doptcmdl=GenPept>AAF26471</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01100 target="new">P1 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPP1B<br>
           </td>

       <td>T18A10.9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g00810 target="new">At4g00810</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB80890&doptcmdl=GenPept>CAB80890</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00810 target="new">P1 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPP1C<br>
           </td>

       <td>MCA23.2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g47700 target="new">At5g47700</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB11317&doptcmdl=GenPept>BAB11317</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g47700 target="new">P1 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPP1D<br>
           </td>

       <td>K18P6.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g24510 target="new">At5g24510</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_197839&doptcmdl=GenPept>NP_197839</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g24510 target="new">"P1 in small subunit, newly identified"
</A></td>

        </tr>
<tr class="alt">

       <td>RPP1E<br>
           </td>

       <td>T9C5.60<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g49460 target="new">At3g49460</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_190515&doptcmdl=GenPept>NP_190515</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g49460 target="new">"P1 in small subunit, newly identified, incomplete ORF"
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=5><b>P2</b></td>

       <td>RPP2A<br>
           </td>

       <td>F15K20.18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g27720 target="new">At2g27720</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC73028&doptcmdl=GenPept>AAC73028</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g27720 target="new">P2 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPP2B<br>
           </td>

       <td>F15K20.19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g27710 target="new">At2g27710</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC73029&doptcmdl=GenPept>AAC73029</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g27710 target="new">P2 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPP2C<br>
           </td>

       <td>T20D4.1<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g28500 target="new">At3g28500</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB01952&doptcmdl=GenPept>BAB01952</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g28500 target="new">P2 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPP2D<br>
           </td>

       <td>F14L2.140<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g44590 target="new">At3g44590</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB88541&doptcmdl=GenPept>CAB88541</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g44590 target="new">P2 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPP2E<br>
           </td>

       <td>MYH19.9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g40040 target="new">At5g40040</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAQ65143&doptcmdl=GenPept>AAQ65143</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40040 target="new">P2 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=2><b>P3</b></td>

       <td>RPP3A<br>
           </td>

       <td>F14M19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g25890 target="new">At4g25890</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB39610&doptcmdl=GenPept>CAB39610</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g25890 target="new">P3 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPP3B<br>
           </td>

       <td>MJB24.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g57290 target="new">At5g57290</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAA96952&doptcmdl=GenPept>BAA96952</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g57290 target="new">P3 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L3</b></td>

       <td>RPL3A <br>
           </td>

       <td>F1I21.L3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g43170 target="new">At1g43170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC36018&doptcmdl=GenPept>AAC36018</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g43170 target="new">L3 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL3B<br>
           </td>

       <td>T25B24.7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g61580 target="new">At1g61580</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD25547&doptcmdl=GenPept>AAD25547</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61580 target="new">L3 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL3C<br>
           </td>

       <td>MDH9.14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g42445 target="new">At5g42445</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AB016888&doptcmdl=GenBank>AB016888</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt"><td valign=top rowspan=4><b>L4</b></td>

       <td>RPL4A<br>
           </td>

       <td>F11F8.22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g09630 target="new">At3g09630</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF23293&doptcmdl=GenPept>AAF23293</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g09630 target="new">L4 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL4B<br>
           </td>

       <td>T32G9.26<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g35200 target="new">At1g35200</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG50600&doptcmdl=GenPept>AAG50600</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPL4C<br>
           </td>

       <td>F27A10.4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g24730 target="new">At2g24730</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AC007266&doptcmdl=GenBank>AC007266</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPL4D<br>
           </td>

       <td>F9G14.180<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g02870 target="new">At5g02870</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB86041&doptcmdl=GenPept>CAB86041</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g02870 target="new">L4 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L5</b></td>

       <td>RPL5A<br>
           </td>

       <td>MWL2.17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g25520 target="new">At3g25520</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AA000787&doptcmdl=GenPept>AA000787</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g25520 target="new">L5 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL5B<br>
           </td>

       <td>MKM21.5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g39740 target="new">At5g39740</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB11380&doptcmdl=GenPept>BAB11380</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g39740 target="new">L5 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL5C<br>
           </td>

       <td>MSN9.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g40130 target="new">At5g40130</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10894&doptcmdl=GenPept>BAB10894</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt"><td rowspan=3 valign=top><b>L6</b></td>

       <td>RPL6A<br>
           </td>

       <td>F25I16.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g18540 target="new">At1g18540</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF98420&doptcmdl=GenPept>AAF98420</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18540 target="new">L6 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL6B<br>
           </td>

       <td>F2P9.7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g74060 target="new">At1g74060</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52524&doptcmdl=GenPept>AAG52524</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74060 target="new">L6 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL6C<br>
           </td>

       <td>F2P9.8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g74050 target="new">At1g74050</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52527&doptcmdl=GenPept>AAG52527</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74050 target="new">L6 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=4><b>L7</b></td>

       <td>RPL7A<br>
           </td>

       <td>F23A5.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g80750 target="new">At1g80750</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF14663&doptcmdl=GenPept>AAF14663</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80750 target="new">L7 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL7B<br>
           </td>

       <td>F10A8.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g01250 target="new">At2g01250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD14525&doptcmdl=GenPept>AAD14525</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01250 target="new">L7 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL7C<br>
           </td>

       <td>F6E13.25<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g44120 target="new">At2g44120</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC23430&doptcmdl=GenPept>AAC23430</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44120 target="new">L7 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL7D<br>
           </td>

       <td>K20M4.2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g13580 target="new">At3g13580</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02600&doptcmdl=GenPept>BAB02600</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13580 target="new">L7 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=2><b>L7a</b></td>

       <td>RPL7aA<br>
           </td>

       <td>T30B22.8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g47610 target="new">At2g47610</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC62850&doptcmdl=GenPept>AAC62850</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47610 target="new">L7a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL7aB<br>
           </td>

       <td>F26K9.300<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g62870 target="new">At3g62870</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB83137&doptcmdl=GenPept>CAB83137</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g62870 target="new">L7a in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L8</b></td>

       <td>RPL8A<br>
           </td>

       <td>T27K22.11<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g18020 target="new">At2g18020</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD20124&doptcmdl=GenPept>AAD20124</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18020 target="new">L8 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL8B<br>
           </td>

       <td>F24M12.230<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g51190 target="new">At3g51190</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB62641&doptcmdl=GenPept>CAB62641</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g51190 target="new">L8 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL8C<br>
           </td>

       <td>F23E13.20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g36130 target="new">At4g36130</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAA18119&doptcmdl=GenPept>CAA18119</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g36130 target="new">L8 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=4><b>L9</b></td>

       <td>RPL9A<br>
           </td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=12322563>T16O9.23</a><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name= target="new"></A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51293&doptcmdl=GenPept>AAG51293</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf= target="new">L9 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL9B<br>
           </td>

       <td>T9L6.2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g33120 target="new">At1g33120</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF97345&doptcmdl=GenPept>AAF97345</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g33120 target="new">L9 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL9C<br>
           </td>

       <td>T9L6.5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g33140 target="new">At1g33140</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF97348&doptcmdl=GenPept>AAF97348</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g33140 target="new">L9 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL9D<br>
           </td>

       <td>F7L13.30<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g10450 target="new">At4g10450</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB40038&doptcmdl=GenPept>CAB40038</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g10450 target="new">L9 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L10</b></td>

       <td>RPL10A<br>
           </td>

       <td>F14L17.9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g14320 target="new">At1g14320</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF43932&doptcmdl=GenPept>AAF43932</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14320 target="new">L10 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL10B<br>
           </td>

       <td>T2P11.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g26910 target="new">At1g26910</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD14497&doptcmdl=GenPept>AAD14497</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26910 target="new">L10 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL10C<br>
           </td>

       <td>T12I7.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g66580 target="new">At1g66580</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51174&doptcmdl=GenPept>AAG51174</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66580 target="new">L10 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L10a</b></td>

       <td>RPL10aA<br>
           </td>

       <td>T27G7.6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g08360 target="new">At1g08360</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF22886&doptcmdl=GenPept>AAF22886</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08360 target="new">L10a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL10aB<br>
           </td>

       <td>F15K20.37<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g27530 target="new">At2g27530</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC73045&doptcmdl=GenPept>AAC73045</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g27530 target="new">L10a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL10aC<br>
           </td>

       <td>MWD9.24<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g22440 target="new">At5g22440</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB08343&doptcmdl=GenPept>BAB08343</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g22440 target="new">L10a in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=4 valign=top><b>L11</b></td>

       <td>RPL11A<br>
           </td>

       <td>F7D19.26<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g42740 target="new">At2g42740</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD21733&doptcmdl=GenPept>AAD21733</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42740 target="new">L11 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL11B<br>
           </td>

       <td>T20N10.50<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g58700 target="new">At3g58700</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB88287&doptcmdl=GenPept>CAB88287</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g58700 target="new">L11 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL11C<br>
           </td>

       <td>F28A21.140<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g18730 target="new">At4g18730</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB37458&doptcmdl=GenPept>CAB37458</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18730 target="new">L11 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL11D<br>
           </td>

       <td>MRA19.21<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g45775 target="new">At5g45775</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB09220&doptcmdl=GenPept>BAB09220</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g45775 target="new">L11 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L12</b></td>

       <td>RPL12A<br>
           </td>

       <td>T2N18.5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g37190 target="new">At2g37190</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD18140&doptcmdl=GenPept>AAD18140</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37190 target="new">L12 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL12B<br>
           </td>

       <td>F4P12.130<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g53430 target="new">At3g53430</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB67650&doptcmdl=GenPept>CAB67650</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g53430 target="new">L12 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL12C<br>
           </td>

       <td>MUP24.9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g60670 target="new">At5g60670</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB09840&doptcmdl=GenPept>BAB09840</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60670 target="new">L12 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=4><b>L13</b></td>

       <td>RPL13A<br>
           </td>

       <td>T24C20.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g48130 target="new">At3g48130</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB51060&doptcmdl=GenPept>CAB51060</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPL13B<br>
           </td>

       <td>T2J13.150<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g49010 target="new">At3g49010</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB62009&doptcmdl=GenPept>CAB62009</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g49010 target="new">L13 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL13C<br>
           </td>

       <td>T2J13.200<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g48960 target="new">At3g48960</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB62014&doptcmdl=GenPept>CAB62014</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g48960 target="new">L13 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL13D<br>
           </td>

       <td>MRO11.6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g23900 target="new">At5g23900</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10063&doptcmdl=GenPept>BAB10063</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g23900 target="new">L13 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=4><b>L13a</b></td>

       <td>RPL13aA<br>
           </td>

       <td>T1B9.24<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g07110 target="new">At3g07110</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF20235&doptcmdl=GenPept>AAF20235</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g07110 target="new">L13a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL13aB<br>
           </td>

       <td>K7P8.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g24830 target="new">At3g24830</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02893&doptcmdl=GenPept>BAB02893</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g24830 target="new">L13a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL13aC<br>
           </td>

       <td>F17N18.60<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g13170 target="new">At4g13170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB41927&doptcmdl=GenPept>CAB41927</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g13170 target="new">L13a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL13aD<br>
           </td>

       <td>K24G6.9 <br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g48760 target="new">At5g48760</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB09429&doptcmdl=GenPept>BAB09429</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g48760 target="new">L13a in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>L14</b></td>

       <td>RPL14A<br>
           </td>

       <td>T13C7.4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g20450 target="new">At2g20450</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD25645&doptcmdl=GenPept>AAD25645</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g20450 target="new">L14 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL14B<br>
           </td>

       <td>T24A18.40<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g27090 target="new">At4g27090</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB79564&doptcmdl=GenPept>CAB79564</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g27090 target="new">L14 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=2><b>L15</b></td>

       <td>RPL15A<br>
           </td>

       <td>FCA6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g16720 target="new">At4g16720</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB10447&doptcmdl=GenPept>CAB10447</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g16720 target="new">L15 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL15B<br>
           </td>

       <td>FCA8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g17390 target="new">At4g17390</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB10520&doptcmdl=GenPept>CAB10520</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g17390 target="new">L15 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=2><b>L17</b></td>

       <td>RPL17A<br>
           </td>

       <td>F17L21.19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g27400 target="new">At1g27400</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF99734&doptcmdl=GenPept>AAF99734</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27400 target="new">L17 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL17B<br>
           </td>

       <td>T1F15.11<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g67430 target="new">At1g67430</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC18792&doptcmdl=GenPept>AAC18792</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67430 target="new">L17 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L18</b></td>

       <td>RPL18A<br>
           </td>

       <td>T30B22.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g47570 target="new">At2g47570</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC62853&doptcmdl=GenPept>AAC62853</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47570 target="new">L18 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL18B<br>
           </td>

       <td>F18C1.14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g05590 target="new">At3g05590</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF26138&doptcmdl=GenPept>AAF26138</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05590 target="new">L18 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL18C<br>
           </td>

       <td>F14I23.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g27850 target="new">At5g27850</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_198137&doptcmdl=GenPept>NP_198137</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27850 target="new">L18 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L18a</b></td>

       <td>RPL18aA<br>
           </td>

       <td>T1P2.8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g29970 target="new">At1g29970</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52055&doptcmdl=GenPept>AAG52055</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29970 target="new">L18a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL18aB<br>
           </td>

       <td>T31E10.18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g34480 target="new">At2g34480</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC26708&doptcmdl=GenPept>AAC26708</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34480 target="new">L18a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL18aC<br>
           </td>

       <td>MIE1.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g14600 target="new">At3g14600</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02392&doptcmdl=GenPept>BAB02392</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g14600 target="new">L18a in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L19</b></td>

       <td>RPL19A<br>
           </td>

       <td>F22D16.23<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g02780 target="new">At1g02780</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF02889&doptcmdl=GenPept>AAF02889</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02780 target="new">L19 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL19B<br>
           </td>

       <td>MGL6.25<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g16780 target="new">At3g16780</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02770&doptcmdl=GenPept>BAB02770</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16780 target="new">L19 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL19C<br>
           </td>

       <td>T2H3.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g02230 target="new">At4g02230</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC28170&doptcmdl=GenPept>AAC28170</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g02230 target="new">L19 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=7><b>L21</b></td>

       <td>RPL21A<br>
           </td>

       <td>F14J9.25<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g09590 target="new">At1g09590</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC33220&doptcmdl=GenPept>AAC33220</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09590 target="new">L21 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL21B<br>
           </td>

       <td>F14J9.30<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g09486 target="new">At1g09486</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AC003970&doptcmdl=GenBank>AC003970</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPL21C<br>
           </td>

       <td>F21M12.8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g09690 target="new">At1g09690</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAB60725&doptcmdl=GenPept>AAB60725</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09690 target="new">L21 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL21D<br>
           </td>

       <td>T19E23.15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g31355 target="new">At1g31355</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF24589&doptcmdl=GenPept>AAF24589</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPL21E<br>
           </td>

       <td>T8L23.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g57660 target="new">At1g57660</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG50742&doptcmdl=GenPept>AAG50742</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g57660 target="new">L21 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL21F<br>
           </td>

       <td>T10K17.30<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g57820 target="new">At3g57820</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB67610&doptcmdl=GenPept>CAB67610</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPL21G<br>
           </td>

       <td>F12K22.19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g57860 target="new">At1g57860</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564726&doptcmdl=GenPept>NP_564726</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g57860 target="new">"L21 in small subunit, newly identified"
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L22</b></td>

       <td>RPL22A<br>
           </td>

       <td>F22D16.17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g02830 target="new">At1g02830</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF02883&doptcmdl=GenPept>AAF02883</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02830 target="new">L22 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL22B<br>
           </td>

       <td>F18C1.17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g05560 target="new">At3g05560</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF26141&doptcmdl=GenPept>AAF26141</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05560 target="new">L22 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL22C<br>
           </td>

       <td>T1G16.100<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g27770 target="new">At5g27770</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_198129&doptcmdl=GenPept>NP_198129</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27770 target="new">L22 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L23</b></td>

       <td>RPL23A<br>
           </td>

       <td>F19P19.5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g04480 target="new">At1g04480</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAB70426&doptcmdl=GenPept>AAB70426</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04480 target="new">L23 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL23B<br>
           </td>

       <td>F4P9.14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g33370 target="new">At2g33370</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAB80655&doptcmdl=GenPept>AAB80655</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33370 target="new">L23 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL23C<br>
           </td>

       <td>T27C4.4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g04400 target="new">At3g04400</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF63771&doptcmdl=GenPept>AAF63771</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g04400 target="new">L23 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=2><b>L23a</b></td>

       <td>RPL23aA<br>
           </td>

       <td>F12L6.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g39460 target="new">At2g39460</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC27837&doptcmdl=GenPept>AAC27837</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39460 target="new">L23a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL23aB<br>
           </td>

       <td>T26I12.160<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g55280 target="new">At3g55280</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB75762&doptcmdl=GenPept>CAB75762</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55280 target="new">L23a in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L24</b></td>

       <td>RPL24A<br>
           </td>

       <td>F13K3.2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g36620 target="new">At2g36620</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD20138&doptcmdl=GenPept>AAD20138</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36620 target="new">L24 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL24B<br>
           </td>

       <td>F8J2.190<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g53020 target="new">At3g53020</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB86906&doptcmdl=GenPept>CAB86906</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g53020 target="new">L24 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL24C<br>
           </td>

       <td>T13E15.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g44860 target="new">At2g44860</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_182013&doptcmdl=GenPept>NP_182013</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44860 target="new">"L24 in small subunit, newly identified"
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=2><b>L26</b></td>

       <td>RPL26A<br>
           </td>

       <td>T16K5.260<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g49910 target="new">At3g49910</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB66929&doptcmdl=GenPept>CAB66929</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g49910 target="new">L26 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL26B<br>
           </td>

       <td>K9I9.7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g67510 target="new">At5g67510</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB08459&doptcmdl=GenPept>BAB08459</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g67510 target="new">L26 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L27</b></td>

       <td>RPL27A<br>
           </td>

       <td>F22D22.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g32220 target="new">At2g32220</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD15383&doptcmdl=GenPept>AAD15383</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32220 target="new">L27 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL27B<br>
           </td>

       <td>MKA23.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g22230 target="new">At3g22230</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB03070&doptcmdl=GenPept>BAB03070</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g22230 target="new">L27 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL27C<br>
           </td>

       <td>FCA2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g15000 target="new">At4g15000</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78542&doptcmdl=GenPept>CAB78542</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g15000 target="new">L27 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L27a</b></td>

       <td>RPL27aA<br>
           </td>

       <td>F13K23.22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g12960 target="new">At1g12960</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF78501&doptcmdl=GenPept>AAF78501</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g12960 target="new">L27a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL27aB<br>
           </td>

       <td>F26F24.13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g23290 target="new">At1g23290</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF86998&doptcmdl=GenPept>AAF86998</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23290 target="new">L27a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL27aC<br>
           </td>

       <td>F24J13.17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g70600 target="new">At1g70600</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52464&doptcmdl=GenPept>AAG52464</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70600 target="new">L27a in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L28</b></td>

       <td>RPL28A<br>
           </td>

       <td>F6F22.24<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g19730 target="new">At2g19730</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC62149&doptcmdl=GenPept>AAC62149</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19730 target="new">L28 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL28B<br>
           </td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=6045155>MAG2</a><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name= target="new"></A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=&doptcmdl=GenPept></A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPL28C<br>
           </td>

       <td>F17A13.230<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g29410 target="new">At4g29410</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_194670&doptcmdl=GenPept>NP_194670</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g29410 target="new">L28 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=2><b>L29</b></td>

       <td>RPL29A<br>
           </td>

       <td>F3E22.16<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g06700 target="new">At3g06700</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF63828&doptcmdl=GenPept>AAF63828</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06700 target="new">L29 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL29B<br>
           </td>

       <td>F3E22.18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g06680 target="new">At3g06680</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF63830&doptcmdl=GenPept>AAF63830</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06680 target="new">L29 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L30</b></td>

       <td>RPL30A<br>
           </td>

       <td>F15C21.6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g36240 target="new">At1g36240</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51255&doptcmdl=GenPept>AAG51255</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g36240 target="new">L30 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL30B<br>
           </td>

       <td>F28K19.15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g77940 target="new">At1g77940</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF17698&doptcmdl=GenPept>AAF17698</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77940 target="new">L30 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL30C<br>
           </td>

       <td>MVE11.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g18740 target="new">At3g18740</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB01800&doptcmdl=GenPept>BAB01800</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g18740 target="new">L30 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><B>L31</b></td>

       <td>RPL31A<br>
           </td>

       <td> F6F22.23<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g19740 target="new">At2g19740</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC62142&doptcmdl=GenPept>AAC62142</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19740 target="new">L31 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL31B<br>
           </td>

       <td>T25K17.40<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g26230 target="new">At4g26230</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB38952&doptcmdl=GenPept>CAB38952</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g26230 target="new">L31 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL31C<br>
           </td>

       <td>MIK19.16<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g56710 target="new">At5g56710</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB09889&doptcmdl=GenPept>BAB09889</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g56710 target="new">L31 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=2><b>L32</b></td>

       <td>RPL32A<br>
           </td>

       <td>F15J5.70<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g18100 target="new">At4g18100</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB53651&doptcmdl=GenPept>CAB53651</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18100 target="new">L32 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL32B<br>
           </td>

       <td>K11I1.2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g46430 target="new">At5g46430</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10811&doptcmdl=GenPept>BAB10811</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g46430 target="new">L32 in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=3 valign=top><b>L34</b></td>

       <td>RPL34A<br>
           </td>

       <td>T2P11.7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g26880 target="new">At1g26880</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD14494&doptcmdl=GenPept>AAD14494</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26880 target="new">L34 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL34B<br>
           </td>

       <td>T6C23.18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g69620 target="new">At1g69620</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52537&doptcmdl=GenPept>AAG52537</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69620 target="new">L34 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL34C<br>
           </td>

       <td>MLD15.7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g28900 target="new">At3g28900</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02133&doptcmdl=GenPept>BAB02133</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g28900 target="new">L34 in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=4 valign=top><b>L35</b></td>

       <td>RPL35A<br>
           </td>

       <td>F11F8.7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g09500 target="new">At3g09500</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF23282&doptcmdl=GenPept>AAF23282</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g09500 target="new">L35 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL35B<br>
           </td>

       <td>F12L6.5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g39390 target="new">At2g39390</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC27830&doptcmdl=GenPept>AAC27830</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39390 target="new">L35 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL35C<br>
           </td>

       <td>T26I12.50<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g55170 target="new">At3g55170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB75751&doptcmdl=GenPept>CAB75751</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55170 target="new">L35 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL35D<br>
           </td>

       <td>T22P11.200<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g02610 target="new">At5g02610</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB85998&doptcmdl=GenPept>CAB85998</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g02610 target="new">L35 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=4><b>L35a</b></td>

       <td>RPL35aA<br>
           </td>

       <td>F10K1.22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g07070 target="new">At1g07070</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF82213&doptcmdl=GenPept>AAF82213</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07070 target="new">L35a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL35aB<br>
           </td>

       <td>F5A13.4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g41880 target="new">At1g41880</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF99832&doptcmdl=GenPept>AAF99832</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g41880 target="new">L35a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL35aC<br>
           </td>

       <td>F1O17.6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g74270 target="new">At1g74270</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52401&doptcmdl=GenPept>AAG52401</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74270 target="new">L35a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL35aD<br>
           </td>

       <td>F1I16.160<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g55750 target="new">At3g55750</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB81600&doptcmdl=GenPept>CAB81600</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55750 target="new">L35a in small subunit
</A></td>

        </tr>
<tr class="alt"><td><b>L36</b></td>

       <td>RPL36A<br>
           </td>

       <td>F13M22.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g37600 target="new">At2g37600</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC23630&doptcmdl=GenPept>AAC23630</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37600 target="new">L36 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L36</b></td>

       <td>RPL36B<br>
           </td>

       <td>F5K20.40<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g53740 target="new">At3g53740</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB88336&doptcmdl=GenPept>CAB88336</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g53740 target="new">L36 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL36C<br>
           </td>

       <td>T22P11.40<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g02450 target="new">At5g02450</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB85982&doptcmdl=GenPept>CAB85982</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g02450 target="new">L36 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL36aA<br>
           </td>

       <td>MLM24.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g23390 target="new">At3g23390</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02283&doptcmdl=GenPept>BAB02283</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g23390 target="new">L36a in small subunit
</A></td>

        </tr>
<tr class="alt"><td><b>L36a</b></td>

       <td>RPL36aB<br>
           </td>

       <td>FCA1<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g14320 target="new">At4g14320</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB10211&doptcmdl=GenPept>CAB10211</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g14320 target="new">L36a in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L37</b></td>

       <td>RPL37A<br>
           </td>

       <td>F9L1.46<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g15250 target="new">At1g15250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_172977&doptcmdl=GenPept>NP_172977</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15250 target="new">L37 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL37B<br>
           </td>

       <td>F19K6.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g52300 target="new">At1g52300</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51542&doptcmdl=GenPept>AAG51542</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g52300 target="new">L37 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL37C<br>
           </td>

       <td>MSL1.12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g16080 target="new">At3g16080</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_566535&doptcmdl=GenPept>NP_566535</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16080 target="new">L37 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L37a</b></td>

       <td>RPL37aA<br>
           </td>

       <td>T4C15.15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g35180 target="new">At2g35180</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AC004667&doptcmdl=GenBank>AC004667</A><br></td>

       <td>incomplete ORF</td>

        </tr>
<tr class="alt">

       <td>RPL37aB<br>
           </td>

       <td>F9F8.23<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g10950 target="new">At3g10950</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF01526&doptcmdl=GenPept>AAF01526</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g10950 target="new">L37a in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL37aC<br>
           </td>

       <td>F27H5.3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g60245 target="new">At3g60245</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_567096&doptcmdl=GenPept>NP_567096</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g60245 target="new">L37a in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=2><b>L38</b></td>

       <td>RPL38A<br>
           </td>

       <td>T1O24.20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g43460 target="new">At2g43460</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAB64338&doptcmdl=GenPept>AAB64338</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43460 target="new">L38 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL38B<br>
           </td>

       <td>T16L24.90<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g59540 target="new">At3g59540</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB75451&doptcmdl=GenPept>CAB75451</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g59540 target="new">L38 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>L39</b></td>

       <td>RPL39A<br>
           </td>

       <td>T22F11.20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g25210 target="new">At2g25210</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD23670&doptcmdl=GenPept>AAD23670</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25210 target="new">L39 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL39B<br>
           </td>

       <td>F14P3.16<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g02190 target="new">At3g02190</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF02118&doptcmdl=GenPept>AAF02118</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02190 target="new">L39 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL39C<br>
           </td>

       <td>F11C18.17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g31985 target="new">At4g31985</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_567886&doptcmdl=GenPept>NP_567886</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g31985 target="new">L39 in small subunit
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=2><b>L40</b></td>

       <td>RPL40A<br>
           </td>

       <td>F9C22.10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g36170 target="new">At2g36170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM15407&doptcmdl=GenPept>AAM15407</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36170 target="new">L40 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL40B<br>
           </td>

       <td>F22O6.30<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g52590 target="new">At3g52590</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB43405&doptcmdl=GenPept>CAB43405</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g52590 target="new">L40 in small subunit
</A></td>

        </tr>
<tr class="alt"><td rowspan=7 valign=top><b>L41</b></td>

       <td>RPL41A<br>
           </td>

       <td>T6H22.15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g56045 target="new">At1g56045</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF02845&doptcmdl=GenPept>AAF02845</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g56045 target="new">L41 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL41B<br>
           </td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=2494106>YUP8H12R</a><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name= target="new"></A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=&doptcmdl=GenPept></A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf= target="new">L41 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL41C<br>
           </td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=6598930>T7M7</a><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name= target="new"></A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=&doptcmdl=GenPept></A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf= target="new">L41 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL41D<br>
           </td>

       <td>T8G24.5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g08520 target="new">At3g08520</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_187465&doptcmdl=GenPept>NP_187465</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g08520 target="new">L41 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL41E<br>
           </td>

       <td>F9F8.7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g11120 target="new">At3g11120</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF01511&doptcmdl=GenPept>AAF01511</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g11120 target="new">L41 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL41F<br>
           </td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=7025846>MGH6</a><br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name= target="new"></A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=&doptcmdl=GenPept></A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf= target="new">L41 in small subunit
</A></td>

        </tr>
<tr class="alt">

       <td>RPL41G<br>
           </td>

       <td>F27K19.200<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g56020 target="new">At3g56020</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB87856&doptcmdl=GenPept>CAB87856</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g56020 target="new">L41 in small subunit
</A></td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified March 17, 2004</center>         


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
