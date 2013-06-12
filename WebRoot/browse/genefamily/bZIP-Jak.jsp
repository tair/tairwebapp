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
<h2>Basic region leucine zipper (bZIP)
Transcription Factor Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Jakoby, M.,Weisshaar, B.,Droge-Laser, W.,Vicente-Carbajosa, J.,Tiedemann,
J.,Kroj, T.,Parcy, F. (2002) <a href="http://arabidopsis.org/servlets/TairObject?type=publication&id=1547369">bZIP Transcription Factors in Arabidopsis</a>.
Trends In Plant Science. <B>7:</B> 106-111<BR>
<a href=http://www.mpiz-koeln.mpg.de/~weisshaa/ATBZIPs.html>Max-Planck-Institut fuer Zuechtungsforschung</a></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Sequences encoding functionally charcterised basic-region leucine-zipper
(bZIP) transcription factors were used to define a common motive in the
bZIP DNA binding domain. With this motive, several databases have been
searched manually. The 75 genes that were identified were subdivided into
11 groups according to the similarity of the aminoacid sequence within the
bZIP domain and by taking into account additional conserved,
group-specific amino acid motives. For more information please refer to
the following article.</td></tr>
<TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=10799 target=new>Marc Jakoby</A><BR>
    <a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=6272 target=new>Bernd Weisshaar</A>
</td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>Other<br>Names:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=75 valign=top><b>basic region leucine zipper (bZIP) Transcription Factor</b></td>

       <td>BZIP01</td>

       <td>K7J8.13<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G49450 target="new">AT5G49450</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF400618&doptcmdl=GenBank>AF400618</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G49450 target="new">bZIP family transcription factor; similar to bZIP transcription factor GI:1769891 from (Arabidopsis thaliana)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP02</td>

       <td>F8D23.6<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G18160 target="new">AT2G18160</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF053939&doptcmdl=GenBank>AF053939</A><br></td>

       <td>GBF5</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G18160 target="new">bZIP family transcription factor; contains a bZIP transcription factor basic domain signature (PDOC00036)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP03</td>

       <td>F14F8.210<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G15830 target="new">AT5G15830</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AK117828&doptcmdl=GenBank>AK117828</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G15830 target="new">bZIP family transcription factor; similar to common plant regulatory factor 7 GI:9650828 from (Petroselinum crispum); contains Pfam profile: PF00170 bZIP transcription factor
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP04</td>

       <td>T4M14.10<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G59530 target="new">AT1G59530</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF400619&doptcmdl=GenBank>AF400619</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G59530 target="new">bZIP protein; similar to G-box binding factor 1 GI:16286 from (Arabidopsis thaliana)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP05</td>

       <td>T16K5.110<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G49760 target="new">AT3G49760</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AV799841&doptcmdl=GenBank>AV799841</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G49760 target="new">bZIP family transcription factor; similar to bZIP transcription factor GI:1769891 from (Arabidopsis thaliana)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP06</td>

       <td>T20K9.6<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G22850 target="new">AT2G22850</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AU235294&doptcmdl=GenBank>AU235294</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G22850 target="new">bZIP family transcription factor; contains a bZIP transcription factor basic domain signature (PDOC00036)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP07</td>

       <td>T28I19.10<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4G37730 target="new">AT4G37730</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AI992458&doptcmdl=GenBank>AI992458</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G37730 target="new">bZIP family transcription factor; contains Pfam profile: PF00170 bZIP transcription factor
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP08</td>

       <td>T6L1.5<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G68880 target="new">AT1G68880</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF400621&doptcmdl=GenBank>AF400621</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G68880 target="new">bZIP family transcription factor; similar to common plant regulatory factor 6 GI:9650826 from (Petroselinum crispum); contains Pfam profile: PF00170 bZIP transcription factor
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP09</td>

       <td>F6A4.10<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G24800 target="new">AT5G24800</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF310223&doptcmdl=GenBank>AF310223</A><br></td>

       <td>BZO2H2</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G24800 target="new">"""bZIP protein, G/HBF-1-related; light-induced protein CPRF-2 - Petroselinum crispum, PIR:S16321"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP10</td>

       <td>T10P11.9<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4G02640 target="new">AT4G02640</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF310222&doptcmdl=GenBank>AF310222</A><br></td>

       <td>BZO2H1</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G02640 target="new">bZIP protein; similar to plant nucleic acid-binding proteins
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP11</td>

       <td>T4L20.170<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4G34590 target="new">AT4G34590</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=X99747&doptcmdl=GenBank>X99747</A><br></td>

       <td>ATB2</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G34590 target="new">bZIP family transcription factor; similar to common plant regulatory factor 7 GI:9650828 from (Petroselinum crispum)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP12</td>

       <td>T3K9.16<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G41070 target="new">AT2G41070</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF334209&doptcmdl=GenBank>AF334209</A><br></td>

       <td>DPBF4</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G41070 target="new">bZIP family transcription factor; contains a bZIP transcription factor basic domain signature (PDOC00036)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP13</td>

       <td>MRH10.19<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G44080 target="new">AT5G44080</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY072075&doptcmdl=GenBank>AY072075</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G44080 target="new">"""bZIP transcription factor, G-box binding factor 4-related; contains similarity to G-box binding factor"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP14</td>

       <td>T19K4.30<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4G35900 target="new">AT4G35900</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AB105818&doptcmdl=GenBank>AB105818</A><br></td>

       <td>FD</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G35900 target="new">"""bZIP protein; Dc3 promoter-binding factor-2, Helianthus annuus, gb:AF001454"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP15</td>

       <td>MBD2.11<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G42910 target="new">AT5G42910</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AJ419599&doptcmdl=GenBank>AJ419599</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G42910 target="new">"""ABA-responsive element binding protein, putative"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP16</td>

       <td>T32F12.9<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G35530 target="new">AT2G35530</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_179917&doptcmdl=GenBank>NM_179917</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G35530 target="new">G-box binding bZIP transcription factor -related
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP17</td>

       <td>T20B5.15<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G40950 target="new">AT2G40950</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY136295&doptcmdl=GenBank>AY136295</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G40950 target="new">bZIP family transcription factor; similar to AtbZIP transcription factor GI:17065880 from (Arabidopsis thaliana); contains Pfam profile: bZIP transcription factor PF00170
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP18</td>

       <td>T2P4.3<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G40620 target="new">AT2G40620</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY074269&doptcmdl=GenBank>AY074269</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G40620 target="new">bZip DNA binding protein; identical to b-Zip DNA binding protein GI:2246376 from (Arabidopsis thaliana); contains a bZIP transcription factor basic domain signature (PDOC00036)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP19</td>

       <td>T12J5.11<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4G35040 target="new">AT4G35040</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY072386&doptcmdl=GenBank>AY072386</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G35040 target="new">bZIP protein
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP20</td>

       <td>MOJ9.12<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G06950 target="new">AT5G06950</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=D10042&doptcmdl=GenBank>D10042</A><br></td>

       <td>AHBP-1b/TGA2</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G06950 target="new">"""bZIP transcription factor, HBP-1b homolog; sp|P43273"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP21</td>

       <td>T27G7.24<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G08320 target="new">AT1G08320</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AJ314757&doptcmdl=GenBank>AJ314757</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G08320 target="new">bZIP protein; similar to basic leucine zipper protein GI:2865394 from (Zea mays)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP22</td>

       <td>F2E2.14<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G22070 target="new">AT1G22070</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=L10209&doptcmdl=GenBank>L10209</A><br></td>

       <td>TGA3</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G22070 target="new">"""bZIP transcription factor, TGA3; identical to transcription factor GI:304113 from (Arabidopsis thaliana)"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP23</td>

       <td>T24I21.18<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G16770 target="new">AT2G16770</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AK117479&doptcmdl=GenBank>AK117479</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G16770 target="new">bZIP protein 
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP24</td>

       <td>F4F15.70<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G51960 target="new">AT3G51960</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AK117629&doptcmdl=GenBank>AK117629</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G51960 target="new">bZIP family transcription factor; contains Pfam profile: PF00170 bZIP transcription factor
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP25</td>

       <td>T14E10.190<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G54620 target="new">AT3G54620</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AJ010860&doptcmdl=GenBank>AJ010860</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G54620 target="new">bZIP transcription factor-related protein; annotation temporarily based on supporting cDNA gi|15982804|gb|AY057509.1|
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP26</td>

       <td>MOJ9.13<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G06960 target="new">AT5G06960</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=X69900&doptcmdl=GenBank>X69900</A><br></td>

       <td>OBF5/TGA5</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G06960 target="new">"""bZIP transcription factor, OBF5"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP27</td>

       <td>T17A5.15<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G17770 target="new">AT2G17770</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=BN000022&doptcmdl=GenBank>BN000022</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G17770 target="new">bZIP transcription factor -related
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP28</td>

       <td>T7M13.12<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G10800 target="new">AT3G10800</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AJ419850&doptcmdl=GenBank>AJ419850</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G10800 target="new">bZIP family transcription factor; contains Pfam profile: PF00170 bZIP transcription factor; contains similarity to TGACG-sequence specific DNA-binding protein TGA-1B (HSBF) GB:P14233 (Nicotiana tabacum)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP29</td>

       <td>T9A14.180<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4G38900 target="new">AT4G38900</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF401297&doptcmdl=GenBank>AF401297</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G38900 target="new">"""bZIP protein; vsf-1 protein, Lycopersicon esculentum, PIR2:S52203"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP30</td>

       <td>F7O24.5<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G21230 target="new">AT2G21230</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF401298&doptcmdl=GenBank>AF401298</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G21230 target="new">bZIP family transcription factor; contains a bZIP transcription factor basic domain signature (PDOC00036)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP31</td>

       <td>T17A11.14<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G13150 target="new">AT2G13150</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF401301&doptcmdl=GenBank>AF401301</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G13150 target="new">bZIP family transcription factor; contains a bZIP transcription factor basic domain signature (PDOC00036)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP32</td>

       <td>T19K21.5<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G12980 target="new">AT2G12980</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_126904&doptcmdl=GenBank>NM_126904</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G12980 target="new">plant transposase (Ptta/En/Spm) family; no ATG identified; very low similarity to PttA2 protein (Petunia x hybrida) GI:2827183; contains Pfam profile PF03004: Plant transposase (Ptta/En/Spm family)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP33</td>

       <td>T19K21.13<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G12900 target="new">AT2G12900</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_126901&doptcmdl=GenBank>NM_126901</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G12900 target="new">bZIP transcription factor family protein; similar to transcription factor(bZIP family) VSF-1 GI:3425907 from (Lycopersicon esculentum)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP34</td>

       <td>MHK10.10<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G42380 target="new">AT2G42380</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF401299&doptcmdl=GenBank>AF401299</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G42380 target="new">bZIP protein
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP35</td>

       <td>F14J22.7<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G49720 target="new">AT1G49720</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF093544&doptcmdl=GenBank>AF093544</A><br></td>

       <td>ABF1</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G49720 target="new">abscisic acid responsive elements-binding factor; identical to abscisic acid responsive elements-binding factor GB:AAF27179 GI:6739274 from (Arabidopsis thaliana)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP36</td>

       <td>T2P3<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G45249 target="new">AT1G45249</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF093545&doptcmdl=GenBank>AF093545</A><br></td>

       <td>ABF2/AREB1</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G45249 target="new">"ABA-responsive element binding protein 1, identical to ABA-responsive element binding protein 1 GI:9967417 from (Arabidopsis thaliana) "
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP37</td>

       <td>F28A23.230<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4G34000 target="new">AT4G34000</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF093546&doptcmdl=GenBank>AF093546</A><br></td>

       <td>ABF3</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G34000 target="new">abscisic acid responsive elements-binding factor(ABF3); identical to abscisic acid responsive elements-binding factor (ABF3) GI:6739280 from (Arabidopsis thaliana)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP38</td>

       <td>MVI11.7<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G19290 target="new">AT3G19290</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF093547&doptcmdl=GenBank>AF093547</A><br></td>

       <td>ABF4/AREB2</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G19290 target="new">abscisic acid responsive elements-binding factor; almost identical (one amino acid) to GB:AAF27182 from (Arabidopsis thaliana)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP39</td>

       <td>F2H17.12<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G36270 target="new">AT2G36270</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF334206&doptcmdl=GenBank>AF334206</A><br></td>

       <td>ABI5</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G36270 target="new">"""ABA-responsive element binding protein, putative; similar to ABA-responsive element binding protein 1 (AREB1) GI:9967417 from (Arabidopsis thaliana);contains a bZIP transcription factor basic domain signature (PDOC00036)"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP40</td>

       <td>F21M11.10<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G03970 target="new">AT1G03970</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=U01823&doptcmdl=GenBank>U01823</A><br></td>

       <td>GBF4</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G03970 target="new">"G-box binding factor 4, GBF4, Identical to Arabidopsis thaliana G-box-binding factor 4, gb|U01823 "
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP41</td>

       <td>AP22.21<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4G36730 target="new">AT4G36730</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=X63894&doptcmdl=GenBank>X63894</A><br></td>

       <td>GBF1</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G36730 target="new">G-box-binding factor 1
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP42</td>

       <td>MQP15.3<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G30530 target="new">AT3G30530</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_113954&doptcmdl=GenBank>NM_113954</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G30530 target="new">bZIP family transcription factor; similar to bZIP protein(G/HBF-1) GI:1905785 from (Glycine max); contains PFAM profile: bZIP transcription factor PF00170
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP43</td>

       <td>K15E6.1<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G38800 target="new">AT5G38800</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_123241&doptcmdl=GenBank>NM_123241</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G38800 target="new">bZIP family transcription factor; similar to bZIP transcription factor GI:1769891 from (Arabidopsis thaliana); contains PFAM profile: bZIP transcription factor PF00170
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP44</td>

       <td>F1B16.8<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G75390 target="new">AT1G75390</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=BT004768&doptcmdl=GenBank>BT004768</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G75390 target="new">"""bZIP transcription factor ATB2, putative; similar to common plant regulatory factor 7 GI:9650828 from (Petroselinum crispum); contains Pfam profile: PF00170 bZIP transcription factor"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP45</td>

       <td>F28J15.6<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G12250 target="new">AT3G12250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AJ320540 &doptcmdl=GenBank>AJ320540 </A><br></td>

       <td>TGA6</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G12250 target="new">"""bZIP transcription factor, TGA6"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP46</td>

       <td>F24J5.12<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G68640 target="new">AT1G68640</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF111711&doptcmdl=GenBank>AF111711</A><br></td>

       <td>PAN</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G68640 target="new">"""bZIP transcription factor, PERIANTHIA; identical to transcription factor PERIANTHIA GB:AAD19660 GI:4378757 from (Arabidopsis thaliana)"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP47</td>

       <td>MQN23.15<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G65210 target="new">AT5G65210</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=X68053&doptcmdl=GenBank>X68053</A><br></td>

       <td>TGA1</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G65210 target="new">"""bZIP transcription factor, TGA1"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP48</td>

       <td>F3L12.14<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G04038 target="new">AT2G04038</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_126441&doptcmdl=GenBank>NM_126441</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G04038 target="new">bZIP protein; contains Pfam profile: PF00170 bZIP transcription factor
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP49</td>

       <td>T8M16.3<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G56660 target="new">AT3G56660</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AJ419851&doptcmdl=GenBank>AJ419851</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G56660 target="new">bZIP family transcription factor; similar to AtbZIP transcription factor GI:17065880 from (Arabidopsis thaliana); contains Pfam profile: PF00170 bZIP transcription factor
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP50</td>

       <td>F28K19.13<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G77920 target="new">AT1G77920</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AJ315736&doptcmdl=GenBank>AJ315736</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G77920 target="new">"""bZIP transcription factor, bZIP50; similar to transcription factor GI:304113 from (Arabidopsis thaliana)"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP51</td>

       <td>F2J6.6<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G43700 target="new">AT1G43700</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF225983&doptcmdl=GenBank>AF225983</A><br></td>

       <td>VIP1</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G43700 target="new">VirE2-interacting protein VIP1; identical to GB:AAF37279 GI:7258340 from (Arabidopsis thaliana)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP52</td>

       <td>F4H5.7<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G06850 target="new">AT1G06850</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AJ419852/53&doptcmdl=GenBank>AJ419852/53</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G06850 target="new">bZIP protein; similar to b-Zip DNA binding protein GB:CAB06697 GI:2246376 from (Arabidopsis thaliana)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP53</td>

       <td>T12C14.120<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G62420 target="new">AT3G62420</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF400620&doptcmdl=GenBank>AF400620</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G62420 target="new">bZIP family transcription factor; similar to common plant regulatory factor 6 GI:9650826 from (Petroselinum crispum)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP54</td>

       <td>F2N1.12<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4G01120 target="new">AT4G01120</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF053228&doptcmdl=GenBank>AF053228</A><br></td>

       <td>GBF2</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G01120 target="new">"""G-box binding factor(bZIP protein), putative"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP55</td>

       <td>T3F17.8<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G46270 target="new">AT2G46270</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=U51850&doptcmdl=GenBank>U51850</A><br></td>

       <td>GBF3</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G46270 target="new">G-box binding bZIP transcription factor; identical to PIR:S20885
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP56</td>

       <td>F2I11.150<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G11260 target="new">AT5G11260</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AB005295&doptcmdl=GenBank>AB005295</A><br></td>

       <td>HY5</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G11260 target="new">bZIP protein HY5; identical to HY5 protein GI:2251085 from (Arabidopsis thaliana)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP57</td>

       <td>T31P16.20<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G10030 target="new">AT5G10030</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=X69899&doptcmdl=GenBank>X69899</A><br></td>

       <td>OBF4/TGA4</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G10030 target="new">"""bZIP transcription factor, OBF4; ocs-element binding factor 4"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP58</td>

       <td>F21F23.3<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G13600 target="new">AT1G13600</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF332430&doptcmdl=GenBank>AF332430</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G13600 target="new">bZIP family transcription factor; contains Pfam profile: PF00170 bZIP transcription factor
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP59</td>

       <td>T28P16.14<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G31370 target="new">AT2G31370</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=X61031&doptcmdl=GenBank>X61031</A><br></td>

       <td>PosF21</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G31370 target="new">bZIP transcription factor (POSF21); identical to GB:Q04088
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP60</td>

       <td>F13A11.5<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G42990 target="new">AT1G42990</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY045964&doptcmdl=GenBank>AY045964</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G42990 target="new">bZIP family transcription factor; contains Pfam profile: PF00170: bZIP transcription factor
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP61</td>

       <td>F9D24.30<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G58120 target="new">AT3G58120</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF401300&doptcmdl=GenBank>AF401300</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G58120 target="new">"""transcription factor bZIP61 (BZIP61), pelota-related protein; annotation temporarily based on supporting cDNA gi|15100054|gb|AF401300.1|AF401300"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP62</td>

       <td>F18O14.41<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G19490 target="new">AT1G19490</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY099875&doptcmdl=GenBank>AY099875</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G19490 target="new">bZIP protein 
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP63</td>

       <td>T32B20.4<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G28770 target="new">AT5G28770</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF310224&doptcmdl=GenBank>AF310224</A><br></td>

       <td>BZO2H3</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G28770 target="new">bZIP family transcription factor; similar to seed storage protein opaque-2(bZIP family)GI:168428 from Zea mays
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP64</td>

       <td>MKP6.27<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G17609 target="new">AT3G17609</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF453477&doptcmdl=GenBank>AF453477</A><br></td>

       <td>HYH</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G17609 target="new">bZIP family transcription factor; similar to TGACG-motif binding factor GI:2934884 from (Glycine max); contains Pfam profile: PF00170 bZIP transcription factor
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP65</td>

       <td>MPH15.3<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G06839 target="new">AT5G06839</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AJ314787&doptcmdl=GenBank>AJ314787</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G06839 target="new">bZIP transcription factor family protein
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP66</td>

       <td>T8M16.180<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G56850 target="new">AT3G56850</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AB017162&doptcmdl=GenBank>AB017162</A><br></td>

       <td>AREB3</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G56850 target="new">"""ABA-responsive element binding protein 3; Dc3 promoter-binding factor-3 - Helianthus annuus, EMBL:AF061870"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP67</td>

       <td>F14L2.10<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G44460 target="new">AT3G44460</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AJ419600&doptcmdl=GenBank>AJ419600</A><br></td>

       <td>DPBF2</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G44460 target="new">"""bZIP protein; Dc3 promoter-binding factor-1, common sunflower, PIR:T12621"""
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP68</td>

       <td>F3C3.7<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G32150 target="new">AT1G32150</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=BT004147&doptcmdl=GenBank>BT004147</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G32150 target="new">G-Box binding protein -related; similar to G-Box binding protein 2 GB:AAD42938 GI:5381313 from (Catharanthus roseus)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP69</td>

       <td>T21E18.12<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G06070 target="new">AT1G06070</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AJ419854 &doptcmdl=GenBank>AJ419854 </A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G06070 target="new">bZIP protein; similar to transcriptional activator RF2a GB:AF005492 GI:2253277 from (Oryza sativa)
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP70</td>

       <td>MAE1.7<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G60830 target="new">AT5G60830</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_125476&doptcmdl=GenBank>NM_125476</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G60830 target="new">"bZIP protein, G-box binding factor 2B, Glycine max, PIR:T07151 "
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP71</td>

       <td>T28I24.7<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G24340 target="new">AT2G24340</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_127996&doptcmdl=GenBank>NM_127996</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G24340 target="new">hypothetical protein
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP72</td>

       <td>T28J14.100<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G07160 target="new">AT5G07160</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_120798&doptcmdl=GenBank>NM_120798</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G07160 target="new">bZIP family transcription factor; contains Pfam profile: PF00170 bZIP transcription factor
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP73</td>

       <td>T17A11<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G13115 target="new">AT2G13115</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_147309&doptcmdl=GenBank>NM_147309</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G13115 target="new">"bZIP protein -related, temporary automated functional assignment "
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP74</td>

       <td>F7O24<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G21235 target="new">AT2G21235</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_179679&doptcmdl=GenBank>NM_179679</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G21235 target="new">"bZIP protein -related, temporary automated functional assignment "
</A></td>

        </tr>
<tr class="alt">

       <td>BZIP75</td>

       <td>T22D6<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G08141 target="new">AT5G08141</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_180460&doptcmdl=GenBank>NM_180460</A><br></td>

      <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G08141 target="new">"bZIP family transcription factor, contains Pfam profile: PF00170 bZIP transcription factor "
</A></td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified on July 20, 2004</center>     

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
