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
<h2>Subtilisin-like Serine Proteases Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><A HREF="http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/altmann.htm">Subtilisin-like Serine Proteases</A></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>A functional characterisation of the subtilase protein family by analysing their expression, subcellular localisation, knockout lines and overexpression.</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=5124 target=new>Thomas Altman</A><br>
    <a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=611942 target=new>Carsten Rautengarten</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH>
<!--<B>BAC Locus:</B><BR>
-->
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=55 valign=top><b>Subtilisin-like Serine Proteases</b></td>

       <td>AtSubt1.1</td>

       <td>F22M8_15<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g01900 target="new">At1g01900</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAO22659&doptcmdl=GenPept>AAO22659</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01900 target="new">"subtilisin-like serine protease, putative, contains similarity to cucumisin-like serine protease"
</A></td>

        </tr>
<tr class="alt">

       <td>SDD1:STOMATAL DENSITY AND DISTRIBUTION</td>

       <td>F20D22_12<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g04110  target="new">At1g04110 </A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_563701&doptcmdl=GenPept>NP_563701</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04110  target="new">"serine-type endopeptidase activity, regulation of cell proliferation, guard mother cell, external side of plasma membrane, ovule stage 1-II, stomatal complex morphogenesis"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt5.2</td>

       <td>T20H2_7<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g20150 target="new">At1g20150</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564106&doptcmdl=GenPept>NP_564106</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20150 target="new">"subtilisin-like serine protease, similar to subtilisin-type protease precursor GI:14150446 from (Glycine max)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt5.3</td>

       <td>T20H2_26<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g20160 target="new">At1g20160</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564107&doptcmdl=GenPept>NP_564107</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20160 target="new">"subtilisin-like serine protease, similar to subtilisin-type protease precursor GI:14150446 from (Glycine max)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt2.2</td>

       <td>T5I8_5<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g30600 target="new">At1g30600</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM20050&doptcmdl=GenPept>AAM20050</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30600 target="new">"serine proteinase -related, Strong similarity to gb|U80583 proteinase TMP from Lycopersicon esculentum and is a member of the PF|00082 subtilase family"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.5</td>

       <td>F9L11_11<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g32940 target="new">At1g32940</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564412&doptcmdl=GenPept>NP_564412</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32940 target="new">"subtilisin-like serine protease, contains similarity to subtilase; SP1 GI:9957714 from (Oryza sativa"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.4</td>

       <td>F9L11_12<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g32950 target="new">At1g32950</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564413&doptcmdl=GenPept>NP_564413</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32950 target="new">"subtilisin-like serine protease, contains similarity to SBT1 GI:1771160 from (Lycopersicon esculentum)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.3</td>

       <td>F9L11_13<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g32960 target="new">At1g32960</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM20591&doptcmdl=GenPept>AAM20591</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32960 target="new">"subtilisin-like serine protease, contains similarity to subtilase; SP1 GI:9957714 (Oryza sativa)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.2</td>

       <td>F9L11_14<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g32970 target="new">At1g32970</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_174573&doptcmdl=GenPept>NP_174573</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32970 target="new">"subtilase -related, similar to subtilase GI:9957714 from (Oryza sativa)"
</A></td>

        </tr>
<tr class="alt">

       <td>ALE1:ABNORMAL LEAF SHAPE </td>

       <td>F24O1_36<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g62340 target="new">At1g62340</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564793&doptcmdl=GenPept>NP_564793</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g62340 target="new">Subtilisin-like serine protease required for epidermal surface formation in embryos and juvenile...
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.17</td>

       <td>T6J19_4<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g66220 target="new">At1g66220</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564869&doptcmdl=GenPept>NP_564869</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66220 target="new">"subtilisin-like serine protease, contains similarity to subtilase; SP1 GI:9957714 from (Oryza sativa); contains Pfam profiles: PF00082 Subtilase family (3 copies)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.16</td>

       <td>T6J19_3<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g66210 target="new">At1g66210</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAO64891&doptcmdl=GenPept>AAO64891</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66210 target="new">"subtilisin-like serine protease, contains similarity to subtilase; SP1 GI:9957714 from (Oryza sativa)"
</A></td>

        </tr>
<tr class="alt">

       <td>AIR3</td>

       <td>T16B23.1<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g04160 target="new">At2g04160</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK74005&doptcmdl=GenPept>AAK74005</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g04160 target="new">"subtilisin activity, response to auxin stimulus"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt1.8</td>

       <td>T6P5.12<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g05920 target="new">At2g05920</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK59595&doptcmdl=GenPept>AAK59595</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g05920 target="new">"subtilisin-like serine protease, putative, contains similarity to cucumisin-like serine protease GI:3176874 from (Arabidopsis thaliana)"
</A></td>

        </tr>
<tr class="alt">

       <td>At-SLP3</td>

       <td>T20K24.19<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g19170 target="new">At2g19170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK93686&doptcmdl=GenPept>AAK93686</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19170 target="new">"serine-type peptidase activity, biological_process unknown, extracellular matrix (sensu Magnoliophyta)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt4.1</td>

       <td>T5I7.15<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g39850 target="new">At2g39850</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM14853&doptcmdl=GenPept>AAM14853</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39850 target="new">"subtilisin-like serine protease, contains similarity to subtilisin-like protease C1 GI:13325079 from (Glycine max)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt1.4</td>

       <td>MAG2_1<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g14067 target="new">At3g14067</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_566473&doptcmdl=GenPept>NP_566473</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g14067 target="new">"subtilisin-like serine protease, putative, contains similarity to cucumisin-like serine protease GI:3176874 from (Arabidopsis thaliana)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt1.5</td>

       <td>MLN21_2<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g14240 target="new">At3g14240</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK25839&doptcmdl=GenPept>AAK25839</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g14240 target="new">"subtilisin-like serine protease, contains similarity to SBT1 GI:1771160 from (Lycopersicon esculentum)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt4.5</td>

       <td>T6H20_130<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g46840 target="new">At3g46840</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_566887&doptcmdl=GenPept>NP_566887</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g46840 target="new">"subtilisin-like serine protease, contains similarity to prepro-cucumisin GI:807698 from (Cucumis melo);"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt4.6</td>

       <td>T6H20_120<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g46850 target="new">At3g46850</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_566888&doptcmdl=GenPept>NP_566888</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g46850 target="new">"subtilisin-like serine protease, contains similarity to prepro-cucumisin GI:807698 from (Cucumis melo);"
</A></td>

        </tr>
<tr class="alt">

       <td>XSP1:XYLEM SERINE PEPTIDASE 1</td>

       <td>F6N15_3<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g00230 target="new">At4g00230</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_567155&doptcmdl=GenPept>NP_567155</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00230 target="new">"subtilisin-like serine protease XSP1, identical to subtilisin-type serine endopeptidase XSP1 GI:6708179 from (Arabidopsis thaliana)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.7</td>

       <td>F7L13_90<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g10510 target="new">At4g10510</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78174&doptcmdl=GenPept>CAB78174</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g10510 target="new">"subtilisin-like serine protease, contains similarity to subtilase; SP1 GI:9957714 from (Oryza sativa)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.9</td>

       <td>F7L13_100<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g10520 target="new">At4g10520</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78175&doptcmdl=GenPept>CAB78175</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g10520 target="new">"subtilisin-like serine protease, contains similarity to subtilase; SP1 GI:9957714 from (Oryza sativa)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.10</td>

       <td>F7L13_110<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g10530 target="new">At4g10530</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78176&doptcmdl=GenPept>CAB78176</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g10530 target="new">"subtilisin-like serine protease, contains similarity to subtilase; SP1 GI:9957714 from (Oryza sativa)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.8</td>

       <td>F7L13_120<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g10540 target="new">At4g10540</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78177&doptcmdl=GenPept>CAB78177</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g10540 target="new">"subtilisin-like serine protease, contains similarity to subtilase; SP1 GI:9957714 from (Oryza sativa)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.6</td>

       <td>T4F9_10<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g10550 target="new">At4g10550</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM91616&doptcmdl=GenPept>AAM91616</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g10550 target="new">"subtilisin-like serine protease, contains similarity to subtilisin-like protease AIR3 GI:4218991 from (Arabidopsis thaliana)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt4.2</td>

       <td>dl3561c<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g15040 target="new">At4g15040</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78546&doptcmdl=GenPept>CAB78546</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g15040 target="new">"subtilisin-like serine protease, contains similarity to prepro-cucumisin GI:807698 from (Cucumis melo)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt2.3</td>

       <td>F9F13_80<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g20430 target="new">At4g20430</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB79043&doptcmdl=GenPept>CAB79043</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g20430 target="new">"subtilisin-like serine protease, contains similarity to meiotic serine proteinase TMP GI:6468325 from (Lycopersicon esculentum)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.1</td>

       <td>T6K22_50<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g21320 target="new">At4g21320</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_567623&doptcmdl=GenPept>NP_567623</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g21320 target="new">expressed protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.12</td>

       <td>T6K22.2<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g21326 target="new">At4g21326</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_567625&doptcmdl=GenPept>NP_567625</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g21326 target="new">"subtilisin-like serine protease, contains similarity to subtilase; SP1 GI:9957714 from (Oryza sativa)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.14</td>

       <td>F17L22_90<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g21630 target="new">At4g21630</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB81270&doptcmdl=GenPept>CAB81270</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g21630 target="new">"subtilisin-like serine protease, contains similarity to subtilase; SP1 GI:9957714 from (Oryza sativa)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.15</td>

       <td>F17L22_100<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g21640 target="new">At4g21640</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB81271&doptcmdl=GenPept>CAB81271</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g21640 target="new">"subtilisin-related protease, subtilisin-like protease - Lycopersicon esculentum,AJ006378"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.13</td>

       <td>F17L22_110<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g21650 target="new">At4g21650</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM91203&doptcmdl=GenPept>AAM91203</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g21650 target="new">"subtilisin proteinase - like, subtilisin-like proteinase ag12, Alnus glutinosa, PIR2:S52769"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt5.1</td>

       <td>T25K17_140<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g26330 target="new">At4g26330</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB79488&doptcmdl=GenPept>CAB79488</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g26330 target="new">"subtilisin-like serine protease, contains similarity to SBT1, a subtilase from tomato plants GI:1771160 from (Lycopersicon esculentum)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt2.7</td>

       <td>F6G3_50<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g30020 target="new">At4g30020</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM98098&doptcmdl=GenPept>AAM98098</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g30020 target="new">"subtilisin-like serine protease, contains similarity to meiotic serine proteinase TMP GI:6468325 from (Lycopersicon esculentum)"
</A></td>

        </tr>
<tr class="alt">

       <td>At-SLP2</td>

       <td>M4E13_40<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g34980 target="new">At4g34980</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL67071&doptcmdl=GenPept>AAL67071</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34980 target="new">"subtilisin-like serine protease, similar to SBT1, a subtilase from tomato plants GI:1771160 from (Lycopersicon esculentum)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt4.15</td>

       <td>F17C15_40<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g03620 target="new">At5g03620</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_568124&doptcmdl=GenPept>NP_568124</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g03620 target="new">"subtilisin-like serine protease, contains similarity to subtilisin-type serine endopeptidase XSP1 GI:6708179 from (Arabidopsis thaliana)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt3.11</td>

       <td>F14F18_110<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g11940 target="new">At5g11940</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_568255&doptcmdl=GenPept>NP_568255</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g11940 target="new">"subtilisin-like serine protease, contains similarity to subtilase; SP1 GI:9957714 from (Oryza sativa)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt2.1</td>

       <td>T29J13_80<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g19660 target="new">At5g19660</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM97020&doptcmdl=GenPept>AAM97020</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g19660 target="new">"subtilisin-related protein, subtilisin/kexin isozyme SKI-1 precursor - Rattus norvegicus, EMBL:AF094821"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt2.4</td>

       <td>MFC16_21<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g44530 target="new">At5g44530</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_568634&doptcmdl=GenPept>NP_568634</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g44530 target="new">"subtilisin-like serine protease, contains similarity to meiotic serine proteinase TMP GI:6468325 from (Lycopersicon esculentum)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt5.6</td>

       <td>MRA19_4<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g45640 target="new">At5g45640</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_199377&doptcmdl=GenPept>NP_199377</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g45640 target="new">"subtilisin-related protease,"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt5.7</td>

       <td>MRA19_5<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g45650 target="new">At5g45650</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAO64099&doptcmdl=GenPept>AAO64099</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g45650 target="new">"subtilisin-related protease,"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt1.3</td>

       <td>MIO24_12<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g51750 target="new">At5g51750</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL87307&doptcmdl=GenPept>AAL87307</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g51750 target="new">"subtilisin-like serine protease, similar to subtilisin-like protease GI:3687307 from (Lycopersicon esculentum)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt4.10</td>

       <td>k19m22_10<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g58810 target="new">At5g58810</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NC_003076&doptcmdl=GenPept>NC_003076</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58810 target="new">"subtilisin-like serine protease, pseudogene, contains similarity to prepro-cucumisin GI:807698 from (Cucumis melo); non-consensus acceptor site AA at exon 6"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt4.7</td>

       <td>k19m22_20<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g58820 target="new">At5g58820</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_568888&doptcmdl=GenPept>NP_568888</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58820 target="new">"subtilisin-like serine protease, contains similarity to prepro-cucumisin GI:807698 from (Cucumis melo)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt4.8</td>

       <td>k19m22_30<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g58830 target="new">At5g58830</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_568889&doptcmdl=GenPept>NP_568889</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58830 target="new">"subtilisin-like serine protease, contains similarity to prepro-cucumisin GI:807698 from (Cucumis melo)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt4.9</td>

       <td>k19m22_40<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g58840 target="new">At5g58840</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAP40370&doptcmdl=GenPept>AAP40370</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58840 target="new">"subtilisin-like serine protease, contains similarity to prepro-cucumisin GI:807698 from (Cucumis melo); non-consensus acceptor site TT at exon 6"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt4.12</td>

       <td>k18b18_70<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g59090 target="new">At5g59090</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM97000&doptcmdl=GenPept>AAM97000</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59090 target="new">"subtilisin-like serine protease, contains similarity to prepro-cucumisin GI:807698 from (Cucumis melo)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt4.4</td>

       <td>k18b18_80<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g59100 target="new">At5g59100</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM20556&doptcmdl=GenPept>AAM20556</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59100 target="new">"subtilisin-like serine protease, contains similarity to prepro-cucumisin GI:807698 from (Cucumis melo)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt4.13</td>

       <td>mnc17_10<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g59120 target="new">At5g59120</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM13058&doptcmdl=GenPept>AAM13058</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59120 target="new">"subtilisin-like serine protease, contains similarity to prepro-cucumisin GI:807698 from (Cucumis melo); non-consensus AA acceptor site at exon 6"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt4.11</td>

       <td>mnc17_20<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g59130 target="new">At5g59130</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAO41911&doptcmdl=GenPept>AAO41911</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59130 target="new">"subtilisin-like serine protease, contains similarity to prepro-cucumisin GI:807698 from (Cucumis melo)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt4.3</td>

       <td>mnc17_80<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g59190 target="new">At5g59190</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_568901&doptcmdl=GenPept>NP_568901</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59190 target="new">"subtilisin-related serine protease, contains similarity to prepro-cucumisin GI:807698 from (Cucumis melo)"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt5.5</td>

       <td>mmn10_30<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g59810 target="new">At5g59810</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_200789&doptcmdl=GenPept>NP_200789</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59810 target="new">"subtilisin-like serine protease, subtilisin-like protease AIR3, Arabidopsis thaliana, EMBL:AF098632"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSubt1.9</td>

       <td>K21H1_5<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g67090 target="new">At5g67090</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_569044&doptcmdl=GenPept>NP_569044</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g67090 target="new">"subtilisin-like serine protease, contains similarity to subtilisin-like protease ag12 GI:757522 from (Alnus glutinosa)"
</A></td>

        </tr>
<tr class="alt">

       <td>ARA12</td>

       <td>K8K14_8<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g67360 target="new">At5g67360</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK25995&doptcmdl=GenPept>AAK25995</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g67360 target="new">subtilisin-like protease that has been located in stem and siliques but not roots
</A></td>

        </tr>
</table><P>

<A href=index.jsp>Return to Gene Family Index</A><P>

<center>Last modified on November 10, 2003</center>     

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
