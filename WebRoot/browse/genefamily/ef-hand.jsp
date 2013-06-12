<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "EF-hand containing proteins";
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
<h2><i>Arabidopsis</i> EF-hand containing proteins</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><b>Irene S Day, Vaka S Reddy, Gul Shad Ali, ASN Reddy.</b> (2002) <A HREF="/servlets/TairObject?type=publication&id=501682666" target=new>Analysis of EF-hand-containing proteins in <i>Arabidopsis</i></A> <i>GENOME BIOLOGY</i> <b>3</b> (10): research0056.1-0056.24


</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>EF-hand motifs were present in Group I - GroupVI, CPKs and CRKs.<br>  Caleosins, 14-3-3s and SUBs were not identified as containing EF-hand motifs using InterProScan but they are known to bind Ca2+.  Please refer to the above article for more details.</td></tr>

<TR><TD valign=top><B>Contact:</b></td>
<td>
<li><a href=/servlets/Community?action=view&type=person&communityID=912159 target=new>Irene S Day</A><br>
<li><a href=/servlets/Community?action=view&type=person&communityID=711946 target=new>Vaka S Reddy</A><br>
<li><a href=/servlets/Community?action=view&type=person&communityID=1313553 target=new>Gul Shad Ali</A><br>
<li><a href=/servlets/Community?action=view&type=person&communityID=5935 target=new>ASN Reddy</A><br>
</td></tr></table><p>

  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>
   
   <TH><b>Number EF-hands:</b></th>

   <TH><B>Domains (InterproScan)/<br>Remarks (from MAtDB/Ref.):</B></TH>

         </TR>

<tr class="alt"><td rowspan=23 valign=top><b>EF-hand containing proteins:<br>Group I</b></td>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g02150 target="new">At1g02150</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18378926&dopt=GenBank>NM_100095</A><br>(GI:18378926)</td>

<td><center>1</center></td>
       <td>PPR repeats, NLS</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g06220 target="new">At1g06220</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18390627&dopt=GenBank>NM_100503</A><br>(GI:18390627)</td>
<td><center>2</center></td>

<td>Elongation factor aEF-2</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g25230 target="new">At5g25230</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18420896&dopt=GenBank>NM_122432</A><br>(GI:18420896)</td>
<td><center>1</center></td>

<td>ATP_GTP_A, EFG_C, GTP_EFTU(_D2)</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g17090 target="new">At1g17090</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18394437&dopt=GenBank>NM_101569</A><br>(GI:18394437)</td>
<td><center>1</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g55040 target="new">At1g55040</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18405189&dopt=GenBank>NM_104378</A><br>(GI:18405189)</td>
<td><center>1</center></td>

<td>Zn-finger in ranbp and others</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g74430 target="new">At1g74430</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18410612&dopt=GenBank>NM_106103</A><br>(GI:18410612)</td>
<td><center>1</center></td>

<td>Myb DNA binding domain</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g03150 target="new">At2g03150</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18395492&dopt=GenBank>NM_126366</A><br>(GI:18395492)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g40690 target="new">At5g40690</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18422014&dopt=GenBank>NM_123434</A><br>(GI:18422014)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g13500 target="new">At3g13500</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18400041&dopt=GenBank>NM_112196</A><br>(GI:18400041)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g69030 target="new">At1g69030</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18409180&dopt=GenBank>NM_105574</A><br>(GI:18409180)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g59820 target="new">At3g59820</A></td>

       <td>&nbsp;</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g73440 target="new">At1g73440</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18410356&dopt=GenBank>NM_106003</A><br>(GI:18410356)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g07740 target="new">At3g07740</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18398043&dopt=GenBank>NM_111653</A><br>(GI:18398043)</td>
<td><center>1</center></td>

       <td>Zinc finger, Myb DNA binding, GatC</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g06260 target="new">At5g06260</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18415146&dopt=GenBank>NM_120708</A><br>(GI:18415146)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g00140 target="new">At4g00140</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411233&dopt=GenBank>NM_116231</A><br>(GI:18411233)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g20760 target="new">At1g20760</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18394907&dopt=GenBank>NM_101928</A><br>(GI:18394907)</td>
<td><center>2</center></td>

       <td>EPS15 repeat, pfkB</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g21630 target="new">At1g21630</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18395011&dopt=GenBank>NM_102012</A><br>(GI:18395011)</td>
<td><center>4</center></td>

       <td>EPS15 repeat</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g20290 target="new">At3g20290</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18402560&dopt=GenBank>NM_112920</A><br>(GI:18402560)</td>
<td><center>2</center></td>

       <td>ATP_GTP_A, EPS15, NLS_BP</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g05520 target="new">At4g05520</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412956&dopt=GenBank>NM_116790</A><br>(GI:18412956)</td>
<td><center>1</center></td>

       <td>EPS15 repeat, Dynamin family</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g47550 target="new">At1g47550</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18401783&dopt=GenBank>NM_103648</A><br>(GI:18401783)</td>
<td><center>1</center></td>

       <td>NLS_BP</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g47560 target="new">At1g47560</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18401788&dopt=GenBank>NM_103649</A><br>(GI:18401788)</td>
<td><center>1</center></td>

       <td>NLS_BP</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g59270 target="new">At3g59270</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411131&dopt=GenBank>NM_115789</A><br>(GI:18411131)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g41840 target="new">At5g41840</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18422144&dopt=GenBank>NM_123549</A><br>(GI:18422144)</td>
<td><center>1</center></td>

       <td>F-box domain</td>

        </tr>
<tr><td rowspan=47 valign=top><b>EF-hand containing proteins:<br>Group II</b></td>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g02270 target="new">At1g02270</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18378940&dopt=GenBank>NM_100107</A><br>(GI:18378940)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g54130 target="new">At5g54130</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423594&dopt=GenBank>NM_124793</A><br>(GI:18423594)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g46830 target="new">At5g46830</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18422721&dopt=GenBank>NM_124054</A><br>(GI:18422721)</td>
<td><center>1</center></td>

       <td>bHLH</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g05150 target="new">At1g05150</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18390485&dopt=GenBank>NM_100393</A><br>(GI:18390485)</td>
<td><center>1</center></td>

       <td>Zinc finger, TPR/put O-GlcNAc transferase</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g32450 target="new">At2g32450</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18402973&dopt=GenBank>NM_128804</A><br>(GI:18402973)</td>
<td><center>1</center></td>

       <td>Zinc finger, TPR/put O-GlcNAc transferase</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g35380 target="new">At2g35380</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18403818&dopt=GenBank>NM_129090</A><br>(GI:18403818)</td>
<td><center>1</center></td>

       <td>Plant peroxidase</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g20490 target="new">At1g20490</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18394868&dopt=GenBank>NM_101899</A><br>(GI:18394868)</td>
<td><center>1</center></td>

       <td>AMP-dependent synthetase and ligase</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g20510 target="new">At1g20510</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18394870&dopt=GenBank>NM_101901</A><br>(GI:18394870)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g21540 target="new">At1g21540</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18395000&dopt=GenBank>NM_102003</A><br>(GI:18395000)</td>
<td><center>1</center></td>

       <td>AMP-dependent synthetase and ligase</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g23160 target="new">At1g23160</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18395209&dopt=GenBank>NM_102164</A><br>(GI:18395209)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g04860 target="new">At3g04860</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18397033&dopt=GenBank>NM_111358</A><br>(GI:18397033)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g28150 target="new">At5g28150</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18421199&dopt=GenBank>NM_122698</A><br>(GI:18421199)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g44780 target="new">At1g44780</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18401332&dopt=GenBank>NM_103559</A><br>(GI:18401332)</td>
<td><center>1</center></td>

       <td>NLS_BP</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g01780 target="new">At3g01780</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18395939&dopt=GenBank>NM_111044</A><br>(GI:18395939)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g02270 target="new">At3g02270</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18396127&dopt=GenBank>NM_111094</A><br>(GI:18396127)</td>
<td><center>1</center></td>

       <td>eIF4-gamma/eIF</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g64060 target="new">At5g64060</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18424782&dopt=GenBank>NM_125802</A><br>(GI:18424782)</td>
<td><center>1</center></td>

       <td>No apical meristem protein</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g05110 target="new">At4g05110</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412809&dopt=GenBank>NM_116750</A><br>(GI:18412809)</td>
<td><center>1</center></td>

       <td>Nucleoside_tran</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g05120 target="new">At4g05120</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412813&dopt=GenBank>NM_116751</A><br>(GI:18412813)</td>
<td><center>1</center></td>

       <td>Nucleoside_tran</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g05140 target="new">At4g05140</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412819&dopt=GenBank>NM_116753</A><br>(GI:18412819)</td>
<td><center>1</center></td>

       <td>Nucleoside_tran</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g22840 target="new">At5g22840</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18420609&dopt=GenBank>NM_122189</A><br>(GI:18420609)</td>
<td><center>1</center></td>

       <td>euk protein kinase</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g12120 target="new">At5g12120</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416776&dopt=GenBank>NM_121250</A><br>(GI:18416776)</td>
<td><center>1</center></td>

       <td>ubiquitin-associated domain</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g64850 target="new">At1g64850</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18408143&dopt=GenBank>NM_105159</A><br>(GI:18408143)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g46220 target="new">At3g46220</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18408164&dopt=GenBank>NM_114491</A><br>(GI:18408164)</td>
<td><center>1</center></td>

       <td>Biotin operon repressor</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g44330 target="new">At3g44330</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18407760&dopt=GenBank>NM_114301</A><br>(GI:18407760)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g21130 target="new">At5g21130</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18420411&dopt=GenBank>NM_122121</A><br>(GI:18420411)</td>
<td><center>1</center></td>

       <td>ATP synthase alpha and beta subunit</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g14270 target="new">At3g14270</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18400333&dopt=GenBank>NM_112285</A><br>(GI:18400333)</td>
<td><center>1</center></td>

       <td>FYVE, PIP5K</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g32010 target="new">At3g32010</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18406800&dopt=GenBank>NM_114024</A><br>(GI:18406800)</td>
<td><center>1</center></td>

       <td>ATHILA</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g32880 target="new">At3g32880</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18406945&dopt=GenBank>NM_114056</A><br>(GI:18406945)</td>
<td><center>1</center></td>

       <td>ATHILA</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g32970 target="new">At3g32970</A></td>

       <td>&nbsp;</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g08080 target="new">At4g08080</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18413077&dopt=GenBank>NM_116877</A><br>(GI:18413077)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g08050 target="new">At4g08050</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18413072&dopt=GenBank>NM_116874</A><br>(GI:18413072)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g03790 target="new">At4g03790</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412371&dopt=GenBank>NM_116617</A><br>(GI:18412371)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g80680 target="new">At1g80680</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412884&dopt=GenBank>NM_106716</A><br>(GI:18412884)</td>
<td><center>1</center></td>

       <td>Aminoacyl-transfer RNA syn class II</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g30110 target="new">At2g30110</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18402263&dopt=GenBank>NM_128566</A><br>(GI:18402263)</td>
<td><center>1</center></td>

       <td>UBACT, ThiF_family</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g46360 target="new">At5g46360</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18422665&dopt=GenBank>NM_124006</A><br>(GI:18422665)</td>
<td><center>1</center></td>

       <td>Potassium channel/KCO1-like</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g46370 target="new">At5g46370</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18422666&dopt=GenBank>NM_124007</A><br>(GI:18422666)</td>
<td><center>1</center></td>

       <td>Potassium channel/KCO1-like</td>

        </tr>
<tr>

       <td>KCO1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55630 target="new">At5g55630</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423769&dopt=GenBank>NM_124945</A><br>(GI:18423769)</td>
<td><center>1</center></td>

       <td>Potassium channel</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g35800 target="new">At2g35800</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18403960&dopt=GenBank>NM_129139</A><br>(GI:18403960)</td>
<td><center>1</center></td>

       <td>Mitoch_carrier</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g07320 target="new">At5g07320</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18415461&dopt=GenBank>NM_120814</A><br>(GI:18415461)</td>
<td><center>4</center></td>

       <td>Mitoch_carrier, Graves disease</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g51050 target="new">At5g51050</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423230&dopt=GenBank>NM_124484</A><br>(GI:18423230)</td>
<td><center>2</center></td>

       <td>Mitoch_carrier, Adptrnslcase</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g61810 target="new">At5g61810</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18424511&dopt=GenBank>NM_125575</A><br>(GI:18424511)</td>
<td><center>4</center></td>

       <td>Mitoch_carrier</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g33790 target="new">At1g33790</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18398982&dopt=GenBank>NM_103098</A><br>(GI:18398982)</td>
<td><center>1</center></td>

       <td>Jacalin-related lectin domain</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g28340 target="new">At5g28340</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18421219&dopt=GenBank>NM_122717</A><br>(GI:18421219)</td>
<td><center>2</center></td>

       <td>PPR repeats</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g28380 target="new">At5g28380</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18421224&dopt=GenBank>NM_122721</A><br>(GI:18421224)</td>
<td><center>2</center></td>

       <td>PPR repeats</td>

        </tr>
<tr>

       <td>AtPLC1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g58670 target="new">At5g58670</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18424131&dopt=GenBank>NM_125254</A><br>(GI:18424131)</td>
<td><center>1</center></td>

       <td>PIPLC</td>

        </tr>
<tr>

       <td>ATFIM1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g26700 target="new">At4g26700</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416807&dopt=GenBank>NM_118804</A><br>(GI:18416807)</td>
<td><center>1</center></td>

       <td>Calponin homology</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55400 target="new">At5g55400</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423742&dopt=GenBank>NM_124922</A><br>(GI:18423742)</td>
<td><center>1</center></td>

       <td>Calponin homology</td>

        </tr>
<tr class="alt"><td rowspan=40 valign=top><b>EF-hand containing proteins:<br>Group III</b></td>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g03960 target="new">At1g03960</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18379191&dopt=GenBank>NM_100277</A><br>(GI:18379191)</td>
<td><center>1</center></td>

       <td>/protein phosphatase 2A group</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g44090 target="new">At5g44090</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18422405&dopt=GenBank>NM_123776</A><br>(GI:18422405)</td>
<td><center>2</center></td>

       <td>/protein phosphatase 2A group</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g54450 target="new">At1g54450</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18404942&dopt=GenBank>NM_104323</A><br>(GI:18404942)</td>
<td><center>2</center></td>

       <td>/protein phosphatase 2A group</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g28850 target="new">At5g28850</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18421274&dopt=GenBank>NM_122769</A><br>(GI:18421274)</td>
<td><center>3</center></td>

       <td>/protein phosphatase 2A group</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g28900 target="new">At5g28900</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18421280&dopt=GenBank>NM_122774</A><br>(GI:18421280)</td>
<td><center>3</center></td>

       <td>/protein phosphatase 2A group</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g18580 target="new">At5g18580</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18418837&dopt=GenBank>NM_121863</A><br>(GI:18418837)</td>
<td><center>3</center></td>

       <td>NLS_BP</td>

        </tr>
<tr class="alt">

       <td>AtCP1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g49480 target="new">At5g49480</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423031&dopt=GenBank>NM_124325</A><br>(GI:18423031)</td>
<td><center>3</center></td>

       <td>/NaCl-inducible Ca2+ binding protein-like</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g32410 target="new">At1g32410</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18398419&dopt=GenBank>NM_102975</A><br>(GI:18398419)</td>
<td><center>1</center></td>

       <td>PPR repeats</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g18430 target="new">At3g18430</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18401886&dopt=GenBank>NM_112728</A><br>(GI:18401886)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CBL8</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g64480 target="new">At1g64480</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18408059&dopt=GenBank>NM_105123</A><br>(GI:18408059)</td>
<td><center>3</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CBL4</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g24270 target="new">At5g24270</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18420769&dopt=GenBank>NM_122333</A><br>(GI:18420769)</td>
<td><center>3</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g33000 target="new">At4g33000</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18418132&dopt=GenBank>NM_119454</A><br>(GI:18418132)</td>
<td><center>3</center></td>

       <td>Recoverin/CBL-like</td>

        </tr>
<tr class="alt">

       <td>CBL6</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g16350 target="new">At4g16350</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18414639&dopt=GenBank>NM_117730</A><br>(GI:18414639)</td>
<td><center>3</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CBL3</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55990 target="new">At5g55990</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423812&dopt=GenBank>NM_124981</A><br>(GI:18423812)</td>
<td><center>3</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CBL7</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g26560 target="new">At4g26560</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416775&dopt=GenBank>NM_118790</A><br>(GI:18416775)</td>
<td><center>3</center></td>

       <td>Recoverin</td>

        </tr>
<tr class="alt">

       <td>CBL2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g26570 target="new">At4g26570</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416779&dopt=GenBank>NM_118791</A><br>(GI:18416779)</td>
<td><center>3</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CBL1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g17615 target="new">At4g17615</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18414930&dopt=GenBank>NM_117870</A><br>(GI:18414930)</td>
<td><center>3</center></td>

       <td>Recoverin</td>

        </tr>
<tr class="alt">

       <td>CBL9</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g47100 target="new">At5g47100</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18422754&dopt=GenBank>NM_124081</A><br>(GI:18422754)</td>
<td><center>2</center></td>

       <td>Recoverin</td>

        </tr>
<tr class="alt">

       <td>CBL5</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g01420 target="new">At4g01420</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411633&dopt=GenBank>NM_116372</A><br>(GI:18411633)</td>
<td><center>3</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g54530 target="new">At1g54530</A></td>

       <td>&nbsp;</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g44310 target="new">At2g44310</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18406506&dopt=GenBank>NM_129995</A><br>(GI:18406506)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g28830 target="new">At5g28830</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18421270&dopt=GenBank>NM_122766</A><br>(GI:18421270)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g22760 target="new">At5g22760</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18420600&dopt=GenBank>NM_122182</A><br>(GI:18420600)</td>
<td><center>1</center></td>

       <td>PHD-finger, DDT domain</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g38810 target="new">At4g38810</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18420314&dopt=GenBank>NM_120041</A><br>(GI:18420314)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g13440 target="new">At4g13440</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18414008&dopt=GenBank>NM_117418</A><br>(GI:18414008)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g32060 target="new">At4g32060</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417935&dopt=GenBank>NM_119358</A><br>(GI:18417935)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g39420 target="new">At4g39420</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18420445&dopt=GenBank>NM_120102</A><br>(GI:18420445)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g29020 target="new">At1g29020</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18396915&dopt=GenBank>NM_102643</A><br>(GI:18396915)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g34020 target="new">At2g34020</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18403422&dopt=GenBank>NM_128953</A><br>(GI:18403422)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g34030 target="new">At2g34030</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18403426&dopt=GenBank>NM_128954</A><br>(GI:18403426)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g53210 target="new">At1g53210</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18404376&dopt=GenBank>NM_104200</A><br>(GI:18404376)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g25970 target="new">At4g25970</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416655&dopt=GenBank>NM_118730</A><br>(GI:18416655)</td>
<td><center>2</center></td>

       <td>PS_Dcrbxylase, Porpobil_deam</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g57190 target="new">At5g57190</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423950&dopt=GenBank>NM_125101</A><br>(GI:18423950)</td>
<td><center>4</center></td>

       <td>PS_Dcarbxylas, Porpobil_deam</td>

        </tr>
<tr class="alt">

       <td>KIC</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g46600 target="new">At2g46600</A></td>

       <td>&nbsp;</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g27280 target="new">At4g27280</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416959&dopt=GenBank>NM_118862</A><br>(GI:18416959)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g54490 target="new">At5g54490</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423634&dopt=GenBank>NM_124829</A><br>(GI:18423634)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g17470 target="new">At3g17470</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18401527&dopt=GenBank>NM_112627</A><br>(GI:18401527)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g62250 target="new">At5g62250</A></td>

       <td>NM_125619<br>(GI:18424568)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g27790 target="new">At4g27790</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417064&dopt=GenBank>NM_118917</A><br>(GI:18417064)</td>
<td><center>6</center></td>

       <td>ER_TARGET</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g08580 target="new">At5g08580</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18415882&dopt=GenBank>NM_120945</A><br>(GI:18415882)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr><td rowspan=54 valign=top><b>EF-hand containing proteins:<br>Group IV</b></td>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g05990 target="new">At1g05990</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18390597&dopt=GenBank>NM_100479</A><br>(GI:18390597)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g03290 target="new">At4g03290</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412213&dopt=GenBank>NM_116567</A><br>(GI:18412213)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g43290 target="new">At2g43290</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18406201&dopt=GenBank>NM_129891</A><br>(GI:18406201)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g59440 target="new">At3g59440</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411173&dopt=GenBank>NM_115806</A><br>(GI:18411173)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g59450 target="new">At3g59450</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411175&dopt=GenBank>NM_115807</A><br>(GI:18411175)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g07490 target="new">At3g07490</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18397964&dopt=GenBank>NM_111627</A><br>(GI:18397964)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g12860 target="new">At4g12860</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18413883&dopt=GenBank>NM_117355</A><br>(GI:18413883)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g18210 target="new">At1g18210</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18394584&dopt=GenBank>NM_101681</A><br>(GI:18394584)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g73630 target="new">At1g73630</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18410405&dopt=GenBank>NM_106021</A><br>(GI:18410405)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g66400 target="new">At1g66400</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18408501&dopt=GenBank>NM_105311</A><br>(GI:18408501)</td>
<td><center>4</center></td>

       <td>Calflagin </td>

        </tr>
<tr>

       <td>TCH2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g37770 target="new">At5g37770</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18421685&dopt=GenBank>NM_123136</A><br>(GI:18421685)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g36180 target="new">At2g36180</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18404063&dopt=GenBank>NM_129176</A><br>(GI:18404063)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g17470 target="new">At5g17470</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18418308&dopt=GenBank>NM_121753</A><br>(GI:18418308)</td>
<td><center>4</center></td>

       <td>Calflagin</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g03400 target="new">At3g03400</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18396535&dopt=GenBank>NM_111211</A><br>(GI:18396535)</td>
<td><center>3</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g03410 target="new">At3g03410</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18396539&dopt=GenBank>NM_111212</A><br>(GI:18396539)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g15680 target="new">At2g15680</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18397893&dopt=GenBank>NM_127129</A><br>(GI:18397893)</td>
<td><center>4</center></td>

       <td>Recoverin</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g21550 target="new">At1g21550</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18395001&dopt=GenBank>NM_102004</A><br>(GI:18395001)</td>
<td><center>3</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g20780 target="new">At4g20780</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18415564&dopt=GenBank>NM_118196</A><br>(GI:18415564)</td>
<td><center>3</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g44460 target="new">At5g44460</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18422443&dopt=GenBank>NM_123813</A><br>(GI:18422443)</td>
<td><center>3</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g12310 target="new">At1g12310</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18391376&dopt=GenBank>NM_101103</A><br>(GI:18391376)</td>
<td><center>3</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g62820 target="new">At1g62820</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18407668&dopt=GenBank>NM_104960</A><br>(GI:18407668)</td>
<td><center>3</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>CaM4</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g66410 target="new">At1g66410</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18408504&dopt=GenBank>NM_105312</A><br>(GI:18408504)</td>
<td><center>4</center></td>

       <td>EPS15 repeat</td>

        </tr>
<tr>

       <td>CaM1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g37780 target="new">At5g37780</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18421686&dopt=GenBank>NM_123137</A><br>(GI:18421686)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>CaM5</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g27030 target="new">At2g27030</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18401303&dopt=GenBank>NM_128261</A><br>(GI:18401303)</td>
<td><center>4</center></td>

       <td>EPS15 repeat</td>

        </tr>
<tr>

       <td>CaM2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g41110 target="new">At2g41110</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18405604&dopt=GenBank>NM_129676</A><br>(GI:18405604)</td>
<td><center>4</center></td>

       <td>EPS15 repeat</td>

        </tr>
<tr>

       <td>CaM3</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g56800 target="new">At3g56800</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18410576&dopt=GenBank>NM_115539</A><br>(GI:18410576)</td>
<td><center>4</center></td>

       <td>EPS15 repeat</td>

        </tr>
<tr>

       <td>CaM7</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g43810 target="new">At3g43810</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18407644&dopt=GenBank>NM_114249</A><br>(GI:18407644)</td>
<td><center>4</center></td>

       <td>EPS15 repeat</td>

        </tr>
<tr>

       <td>CaM6</td>

       <td><a href=/servlets/TairObject?type=locus&name=N/A target="new">N/A</A></td>

       <td>&nbsp;</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>CaBP-22</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g41090 target="new">At2g41090</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18405595&dopt=GenBank>NM_129674</A><br>(GI:18405595)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g22930 target="new">At3g22930</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18403581&dopt=GenBank>NM_113193</A><br>(GI:18403581)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>CaM8</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g14640 target="new">At4g14640</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18414273&dopt=GenBank>NM_117546</A><br>(GI:18414273)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>TCH-3</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g41100 target="new">At2g41100</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18405601&dopt=GenBank>NM_129675</A><br>(GI:18405601)</td>
<td><center>6</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>CaM9</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g51920 target="new">At3g51920</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18409451&dopt=GenBank>NM_115051</A><br>(GI:18409451)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>Centrin</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g50360 target="new">At3g50360</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18409078&dopt=GenBank>NM_114896</A><br>(GI:18409078)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g37010 target="new">At4g37010</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18419951&dopt=GenBank>NM_119864</A><br>(GI:18419951)</td>
<td><center>4</center></td>

       <td>/caltractin(centrin)-like</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g18530 target="new">At1g18530</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18394622&dopt=GenBank>NM_101711</A><br>(GI:18394622)</td>
<td><center>4</center></td>

       <td>Calflagin</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g25600 target="new">At3g25600</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18404586&dopt=GenBank>NM_113458</A><br>(GI:18404586)</td>
<td><center>4</center></td>

       <td>Calflagin</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g32250 target="new">At1g32250</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18398340&dopt=GenBank>NM_102958</A><br>(GI:18398340)</td>
<td><center>4</center></td>

       <td>Calflagin,  Recoverin</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g03000 target="new">At3g03000</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18396407&dopt=GenBank>NM_111170</A><br>(GI:18396407)</td>
<td><center>4</center></td>

       <td>Calflagin</td>

        </tr>
<tr>

       <td>PM129</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g41410 target="new">At2g41410</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18405692&dopt=GenBank>NM_129704</A><br>(GI:18405692)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g10190 target="new">At3g10190</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18398790&dopt=GenBank>NM_111854</A><br>(GI:18398790)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g03430 target="new">At3g03430</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18396544&dopt=GenBank>NM_111214</A><br>(GI:18396544)</td>
<td><center>2</center></td>

       <td>Recoverin/pollen allergenBra r II</td>

        </tr>
<tr>

       <td>APC1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g17480 target="new">At5g17480</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18418312&dopt=GenBank>NM_121754</A><br>(GI:18418312)</td>
<td><center>2</center></td>

       <td>/Calcium-binding protein in pollen</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g76640 target="new">At1g76640</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411165&dopt=GenBank>NM_106314</A><br>(GI:18411165)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g76650 target="new">At1g76650</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411167&dopt=GenBank>NM_106315</A><br>(GI:18411167)</td>
<td><center>3</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g01830 target="new">At3g01830</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18395956&dopt=GenBank>NM_111049</A><br>(GI:18395956)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g50770 target="new">At3g50770</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18409177&dopt=GenBank>NM_114937</A><br>(GI:18409177)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g42380 target="new">At5g42380</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18422204&dopt=GenBank>NM_123603</A><br>(GI:18422204)</td>
<td><center>3</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g29000 target="new">At3g29000</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18406008&dopt=GenBank>NM_113821</A><br>(GI:18406008)</td>
<td><center>2</center></td>

       <td>S-100/ICaBP type CBP</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g39670 target="new">At5g39670</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18421892&dopt=GenBank>NM_123329</A><br>(GI:18421892)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g47480 target="new">At3g47480</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18408434&dopt=GenBank>NM_114616</A><br>(GI:18408434)</td>
<td><center>2</center></td>

       <td>Recoverin</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g24620 target="new">At1g24620</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18395526&dopt=GenBank>NM_102304</A><br>(GI:18395526)</td>
<td><center>4</center></td>

       <td>Calflagin</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g24110 target="new">At3g24110</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18404042&dopt=GenBank>NM_113316</A><br>(GI:18404042)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g26470 target="new">At4g26470</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416756&dopt=GenBank>NM_118780</A><br>(GI:18416756)</td>
<td><center>4</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt"><td rowspan=3 valign=top><b>EF-hand containing proteins:<br>Group V</b></td>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g27480 target="new">At2g27480</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18401439&dopt=GenBank>NM_128308</A><br>(GI:18401439)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g10300 target="new">At3g10300</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18398828&dopt=GenBank>NM_111865</A><br>(GI:18398828)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g04170 target="new">At5g04170</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18414481&dopt=GenBank>NM_120499</A><br>(GI:18414481)</td>
<td><center>2</center></td>

       <td>&nbsp;</td>

        </tr>
<tr><td rowspan=30 valign=top><b>EF-hand containing proteins:<br>Group VI</b></td>

       <td>RbohB</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g09090 target="new">At1g09090</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18390979&dopt=GenBank>NM_100780</A><br>(GI:18390979)</td>
<td><center>2</center></td>

       <td>Cytb-245 hc, Ferric_reduct/rboh-like</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g25090 target="new">At4g25090</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416482&dopt=GenBank>NM_118641</A><br>(GI:18416482)</td>
<td><center>2</center></td>

       <td>Cytb-245 hc, Ferric_reduct/rboh-like</td>

        </tr>
<tr>

       <td>RbohC</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g51060 target="new">At5g51060</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423231&dopt=GenBank>NM_124485</A><br>(GI:18423231)</td>
<td><center>1</center></td>

       <td>Cytb-245 hc, Ferric_reduct/rboh-like</td>

        </tr>
<tr>

       <td>RbohA</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g07390 target="new">At5g07390</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18415480&dopt=GenBank>NM_120821</A><br>(GI:18415480)</td>
<td><center>1</center></td>

       <td>Cytb-245 hc, Ferric_reduct/rboh-like</td>

        </tr>
<tr>

       <td>RbohD</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g47910 target="new">At5g47910</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18422850&dopt=GenBank>NM_124165</A><br>(GI:18422850)</td>
<td><center>2</center></td>

       <td>Cytb-245 hc, Ferric_reduct/rboh-like</td>

        </tr>
<tr>

       <td>RbohF</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g64060 target="new">At1g64060</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18407958&dopt=GenBank>NM_105079</A><br>(GI:18407958)</td>
<td><center>1</center></td>

       <td>Cytb-245 hc, Ferric_reduct/rboh-like</td>

        </tr>
<tr>

       <td>RbohE</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g19230 target="new">At1g19230</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18394711&dopt=GenBank>NM_101781</A><br>(GI:18394711)</td>
<td><center>1</center></td>

       <td>Cytb-245 hc, Ferric_reduct/rboh-like</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g45810 target="new">At3g45810</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18408076&dopt=GenBank>NM_114450</A><br>(GI:18408076)</td>
<td><center>1</center></td>

       <td>Cytb-245 hc, Ferric_reduct/rboh-like</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g60010 target="new">At5g60010</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18424309&dopt=GenBank>NM_125394</A><br>(GI:18424309)</td>
<td><center>2</center></td>

       <td>Cytb-245 hc, Ferric_reduct/rboh-like</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g47860 target="new">At2g47860</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18407468&dopt=GenBank>NM_130353</A><br>(GI:18407468)</td>
<td><center>1</center></td>

       <td>PTM,NPH3</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g44820 target="new">At3g44820</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18407856&dopt=GenBank>NM_114351</A><br>(GI:18407856)</td>
<td><center>1</center></td>

       <td>BTB/POZ domain</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g05180 target="new">At5g05180</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18414817&dopt=GenBank>NM_120600</A><br>(GI:18414817)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g13260 target="new">At5g13260</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417007&dopt=GenBank>NM_121329</A><br>(GI:18417007)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g13960 target="new">At5g13960</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417245&dopt=GenBank>NM_121399</A><br>(GI:18417245)</td>
<td><center>1</center></td>

       <td>SET-domin of transcriptional regulators</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g05310 target="new">At3g05310</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18397186&dopt=GenBank>NM_111404</A><br>(GI:18397186)</td>
<td><center>2</center></td>

       <td>Small GTPase</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g27540 target="new">At5g27540</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18421128&dopt=GenBank>NM_122636</A><br>(GI:18421128)</td>
<td><center>2</center></td>

       <td>Small GTPase</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g63150 target="new">At3g63150</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412633&dopt=GenBank>NM_116180</A><br>(GI:18412633)</td>
<td><center>1</center></td>

       <td>Small GTPase</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g20800 target="new">At2g20800</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18399479&dopt=GenBank>NM_127645</A><br>(GI:18399479)</td>
<td><center>1</center></td>

       <td>Pyr_redox</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g05020 target="new">At4g05020</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412774&dopt=GenBank>NM_116741</A><br>(GI:18412774)</td>
<td><center>1</center></td>

       <td>FAD_pyr_redox</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g28220 target="new">At4g28220</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417150&dopt=GenBank>NM_118962</A><br>(GI:18417150)</td>
<td><center>1</center></td>

       <td>Pyr_redox</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g08000 target="new">At4g08000</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18413066&dopt=GenBank>NM_116869</A><br>(GI:18413066)</td>
<td><center>1</center></td>

       <td>En/Spm-like transposon proteins</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g03560 target="new">At4g03560</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412294&dopt=GenBank>NM_116594</A><br>(GI:18412294)</td>
<td><center>2</center></td>

       <td>Cation (ca,na) pore region, HLH_Myc</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g02960 target="new">At1g02960</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18379035&dopt=GenBank>NM_100177</A><br>(GI:18379035)</td>
<td><center>1</center></td>

       <td>PTS_HPR_SER, NLS</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g59230 target="new">At5g59230</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18424211&dopt=GenBank>NM_125313</A><br>(GI:18424211)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g39560 target="new">At4g39560</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18420478&dopt=GenBank>NM_120116</A><br>(GI:18420478)</td>
<td><center>1</center></td>

       <td>F-box, Kelch repeat</td>

        </tr>
<tr>

       <td>ABI1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g26080 target="new">At4g26080</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416677&dopt=GenBank>NM_118741</A><br>(GI:18416677)</td>
<td><center>1</center></td>

       <td>Protein phosphatase 2C subfamily</td>

        </tr>
<tr>

       <td>GDH2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g07440 target="new">At5g07440</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18415497&dopt=GenBank>NM_120826</A><br>(GI:18415497)</td>
<td><center>1</center></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07440 target="new">TIGR</A><br>NAD binding site, GLFV_dehydrog</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g76250 target="new">At1g76250</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411060&dopt=GenBank>NM_106275</A><br>(GI:18411060)</td>
<td><center>1</center></td>

       <td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g44620 target="new">At5g44620</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18422462&dopt=GenBank>NM_123829</A><br>(GI:18422462)</td>
<td><center>1</center></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g44620 target="new">TIGR</A><br>Cytochrome P450 enzyme, HLH_Myc</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g01280 target="new">At1g01280</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18378820&dopt=GenBank>NM_100010</A><br>(GI:18378820)</td>
<td><center>1</center></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01280 target="new">TIGR</A><br>Cytochrome P450 enzyme</td>

        </tr>
<tr class="alt"><td rowspan=34 valign=top><b>CDPKs</b></td>

       <td>CPK10, AtCDPK1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g18890 target="new">At1g18890</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18394666&dopt=GenBank>NM_101746</A><br>(GI:18394666)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK11, AtCDPK2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g35670 target="new">At1g35670</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18399838&dopt=GenBank>NM_103271</A><br>(GI:18399838)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK33</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g50700 target="new">At1g50700</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18403187&dopt=GenBank>NM_103952</A><br>(GI:18403187)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK19</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g61950 target="new">At1g61950</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18407389&dopt=GenBank>NM_104875</A><br>(GI:18407389)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK30, AtCDPK1a</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g74740 target="new">At1g74740</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18410682&dopt=GenBank>NM_106132</A><br>(GI:18410682)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK29</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g76040 target="new">At1g76040</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411005&dopt=GenBank>NM_106253</A><br>(GI:18411005)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK6, CDPK3</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g17290 target="new">At2g17290</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18398376&dopt=GenBank>NM_127284</A><br>(GI:18398376)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK16</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g17890 target="new">At2g17890</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18398551&dopt=GenBank>NM_127343</A><br>(GI:18398551)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK24</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g31500 target="new">At2g31500</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18402684&dopt=GenBank>NM_128707</A><br>(GI:18402684)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK25</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g35890 target="new">At2g35890</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18403983&dopt=GenBank>NM_129148</A><br>(GI:18403983)</td>
<td><center>1</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK20</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g38910 target="new">At2g38910</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18404894&dopt=GenBank>NM_129449</A><br>(GI:18404894)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK14</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g41860 target="new">At2g41860</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18405824&dopt=GenBank>NM_129750</A><br>(GI:18405824)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK2, CDPK2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g10660 target="new">At3g10660</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18398950&dopt=GenBank>NM_111902</A><br>(GI:18398950)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK9</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g20410 target="new">At3g20410</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18402607&dopt=GenBank>NM_112932</A><br>(GI:18402607)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK13</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g51850 target="new">At3g51850</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18409435&dopt=GenBank>NM_115044</A><br>(GI:18409435)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK32</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g57530 target="new">At3g57530</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18410742&dopt=GenBank>NM_115613</A><br>(GI:18410742)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK27</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g04700 target="new">At4g04700</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412650&dopt=GenBank>NM_116708</A><br>(GI:18412650)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK22</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g04710 target="new">At4g04710</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412662&dopt=GenBank>NM_116709</A><br>(GI:18412662)</td>
<td><center>5</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK21</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g04720 target="new">At4g04720</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412664&dopt=GenBank>NM_116710</A><br>(GI:18412664)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK23</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g04740 target="new">At4g04740</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18412672&dopt=GenBank>NM_116712</A><br>(GI:18412672)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK4</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g09570 target="new">At4g09570</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18413240&dopt=GenBank>NM_117025</A><br>(GI:18413240)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK15</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g21940 target="new">At4g21940</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18415802&dopt=GenBank>NM_118315</A><br>(GI:18415802)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK3, CDPK6</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g23650 target="new">At4g23650</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416188&dopt=GenBank>NM_118496</A><br>(GI:18416188)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK5</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g35310 target="new">At4g35310</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18418656&dopt=GenBank>NM_119697</A><br>(GI:18418656)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK18</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g36070 target="new">At4g36070</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18419776&dopt=GenBank>NM_119774</A><br>(GI:18419776)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK26</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g38230 target="new">At4g38230</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18420199&dopt=GenBank>NM_119985</A><br>(GI:18420199)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK31, g5732059</td>

       <td>T19J18 7-m</td>

       <td>&nbsp;</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK1, AK1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g04870 target="new">At5g04870</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18414719&dopt=GenBank>NM_120569</A><br>(GI:18414719)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK17</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g12180 target="new">At5g12180</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416796&dopt=GenBank>NM_121256</A><br>(GI:18416796)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK7</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g12480 target="new">At5g12480</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416871&dopt=GenBank>NM_121286</A><br>(GI:18416871)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK34</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g19360 target="new">At5g19360</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18419895&dopt=GenBank>NM_121941</A><br>(GI:18419895)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK8, CDPK19</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g19450 target="new">At5g19450</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18419918&dopt=GenBank>NM_121950</A><br>(GI:18419918)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK12, CDPK9</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g23580 target="new">At5g23580</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18420694&dopt=GenBank>NM_122264</A><br>(GI:18420694)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>CPK28</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g66210 target="new">At5g66210</A></td>

       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18425046&dopt=GenBank>NM_126019</A><br>(GI:18425046)</td>
<td><center>4</center></td>

<td>&nbsp;</td>

        </tr>
<tr><td rowspan=3 valign=top><b>CRKs</b></td>

       <td>CRK8</td>
       <td><a href=/servlets/TairObject?type=locus&name=At1g49580 target="new">At1g49580</A></td>
       <td><A href=http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18402703&dopt=GenBank>NM_103846</A><br>(GI:18402703)</td>
<td><center>1</center></td>

<td>&nbsp;</td>
        </tr>
<tr>
       <td>CRK3</td>
       <td><a href=/servlets/TairObject?type=locus&name=At2g46700 target="new">At2g46700</A></td>
       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18407143&dopt=GenBank">NM_130235</A><br>(GI:18407143)</td>
<td><center>1</center></td>

<td>&nbsp;</td>

        </tr>
<tr>

       <td>CRK5</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g50530 target="new">At3g50530</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18409120&dopt=GenBank">NM_114913</A><br>(GI:18409120)</td>
<td><center>1</center></td>

<td>&nbsp;</td>

        </tr></table>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>
 <BR>
 <BR>
 <BR>

<TR><TD><h2>Plant Proteins not identified as EF-hand-containing proteins using InterProScan but known to bind Ca2+.</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><b>Irene S Day, Vaka S Reddy, Gul Shad Ali, ASN Reddy.</b> (2002) <A HREF="/servlets/TairObject?type=publication&id=501682666" target=new>Analysis of EF-hand-containing proteins in <i>Arabidopsis</i></A> <i>GENOME BIOLOGY</i> <b>3</b> (10): research0056.1-0056.24</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>EF-hand motifs were present in Group I - GroupVI, CPKs and CRKs.<br>  Caleosins, 14-3-3s and SUBs were not identified as containing EF-hand motifs using InterProScan but they are known to bind Ca2+.  Please refer to the above article for more details.</td></tr>

<TR><TD valign=top><B>Contact:</b></td>
<td>
<li><a href=/servlets/Community?action=view&type=person&communityID=912159 target=new>Irene S Day</A><br>
<li><a href=/servlets/Community?action=view&type=person&communityID=711946 target=new>Vaka S Reddy</A><br>
<li><a href=/servlets/Community?action=view&type=person&communityID=1313553 target=new>Gul Shad Ali</A><br>
<li><a href=/servlets/Community?action=view&type=person&communityID=5935 target=new>ASN Reddy</A><br>
</td></tr></table><p>


<TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>Domains (InterproScan)/<br>Remarks (from MAtDB/Ref.):</B></TH>

         </TR>

<tr class="alt"><td rowspan=6 valign=top><b>Caleosins</b></td>

       <td>Clo4</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g70670 target="new">At1g70670</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18409648&dopt=GenBank">NM_105735</A><br>(GI:18409648)</td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g70680 target="new">At1g70680</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18409650&dopt=GenBank">NM_105736</A><br>(GI:18409650)</td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>Clo5</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g23240 target="new">At1g23240</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18395218&dopt=GenBank">NM_102173</A><br>(GI:18395218)</td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>Clo3</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g33380 target="new">At2g33380</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18403259&dopt=GenBank">NM_128898</A><br>(GI:18403259)</td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>Clo1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g26740 target="new">At4g26740</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18416814&dopt=GenBank">NM_118808</A><br>(GI:18416814)</td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>Clo2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55240 target="new">At5g55240</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18423725&dopt=GenBank">NM_124906</A><br>(GI:18423725)</td>

<td>&nbsp;</td>

        </tr>
<tr><td rowspan=8 valign=top><b>14-3-3s</b></td>

       <td>GF14</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g78300 target="new">At1g78300</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18411900&dopt=GenBank">NM_106479</A><br>(GI:18411900)</td>

<td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g35160 target="new">At1g35160</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18399523&dopt=GenBank">NM_103213</A><br>(GI:18399523)</td>

<td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=at4g09000 target="new">At4g09000</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18413180&dopt=GenBank">NM_116969</A><br>(GI:18413180)</td>

<td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g02520 target="new">At3g02520</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18396216&dopt=GenBank">NM_111119</A><br>(GI:18396216)</td>

<td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g38480 target="new">At5g38480</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18421761&dopt=GenBank">NM_123209</A><br>(GI:18421761)</td>

<td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g16050 target="new">At5g16050</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417862&dopt=GenBank">NM_121610</A><br>(GI:18417862)</td>

<td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g16040>At5g16040</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18417861&dopt=GenBank">NM_121609</A><br>(GI:18417861)</td>

<td>&nbsp;</td>

        </tr>
<tr>

       <td>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g65430 target="new">At5g65430</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18424949&dopt=GenBank">NM_125941</A><br>(GI:18424949)</td>

<td>&nbsp;</td>

        </tr>
<tr class="alt"><td rowspan=3 valign=top><b>SUBs (Short Under Blue Light)</b></td>

       <td>SUB1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g08810 target="new">At4g08810</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18413159&dopt=GenBank">NM_116951</A><br>(GI:18413159)</td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>SUL2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g04280 target="new">At2g04280</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18395697&dopt=GenBank">NM_126461</A><br>(GI:18395697)</td>

<td>&nbsp;</td>

        </tr>
<tr class="alt">

       <td>SUL1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g12700 target="new">At4g12700</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=18413851&dopt=GenBank">NM_117339</A><br>(GI:18413851)</td>

<td>&nbsp;</td>

        </tr>
</table>


<center>Last modified on Januray 14, 2004</center>    

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
