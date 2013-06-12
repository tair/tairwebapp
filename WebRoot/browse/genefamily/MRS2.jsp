<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "MRS2 Gene Family";
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
<h2><i>Arabidopsis</i> MRS2 Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><li><b>I. Schock, J. Gregan, S. Steinhauser, R. Schweyen, A. Brennicke, V. Knoop</b> (2000) <a href="/servlets/TairObject?type=publication&id=501680838">A member of a novel Arabidopsis thaliana gene family of candidate Mg(2+) ion transporters complements a yeast mitochondrial group II intron-splicing mutant.</a> THE PLANT JOURNAL <b>24: 489</b><br>
    <li><b>L. Li, A. F. Tutone, R. S. Drummond, R. C. Gardner, S. Luan</b> (2001) <a href=/servlets/TairObject?type=publication&id=1546187 target=new>A novel family of magnesium transport genes in Arabidopsis.</a>THE PLANT CELL <b>13: 2761</b>
</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Initial member characterized by complementation of yeast mrs2 mutant and showing that mitochondrial magnesium homeostasis is reconstituted upon complementation. Family members 
1, 
3, 
4, 
5, 
6, 
10 and 
11 are predicted to have two carboxy-terminal transmembrane domains adjacent to a conserved GMN motif characteristic of bacterial corA type magnesium transporters. These domains are lacking in family members 
2, 
7,
8,
9 and 
2 does not complement the yeast mrs2 mutant. The extent of the gene family is clearly defined with a blast search with one of its members which identifies the other homologues with expectancy values below 1e-05.</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=/servlets/Community?action=view&type=person&communityID=2099 target=new>Volker Knoop</A>, <a href=/servlets/Community?action=view&type=person&communityID=5428 target=new>Richard Gardner</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation:</B></TH>

         </TR>

<tr class="alt"><td valign=top rowspan=11><b>Magnesium Transporters</b></td>

       <td>Atmrs2-1</td>

       <td>T24D18.11<br><a href=/servlets/TairObject?type=locus&name=AT1G16010 target="new">AT1G16010</A></td>

       <td><A href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=25360796&dopt=GenBank">AY150286</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G16010 target="new">expressed protein </A></td>

        </tr>


<tr class="alt">
<td>Atmrs2-2</td>

       <td>MUB3.8<br><a href=/servlets/TairObject?type=locus&name=AT5G64560 target="new">AT5G64560</A></td>

       <td><A href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=25360812&dopt=GenBank">AY150287</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G64560 target="new">putative protein</A></td>

        </tr>

<tr class="alt">
<td>Atmrs2-3</td>

       <td>MMB12.11<br><a href=/servlets/TairObject?type=locus&name=AT3G19640 target="new">AT3G19640</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=25360819&dopt=GenBank">AY150288</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G19640 target="new">unknown protein</A></td>

        </tr>

<tr class="alt">
<td>Atmrs2-4</td>

       <td>F17J16.20<br><a href=/servlets/TairObject?type=locus&name=AT3G58970 target="new">AT3G58970</A></td>

       <td><A href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=25360849&dopt=GenBank">AY150289</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G58970 target="new">putative protein</A></td>

        </tr>

<tr class="alt">
<td>Atmrs2-5</td>

       <td>F19B11.7<br><a href=/servlets/TairObject?type=locus&name=AT2G03620 target="new">AT2G03620</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=25360881&dopt=GenBank">AY150290</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G03620 target="new">hypothetical protein</A></td>

        </tr>

<tr class="alt">
<td>Atmrs2-6</td>

       <td>T5F17.30<br><a href=/servlets/TairObject?type=locus&name=AT4G28580 target="new">AT4G28580</A></td>

       <td><A href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=25360917&dopt=GenBank">AY150291</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G28580 target="new">putative protein</A></td>

        </tr>

<tr class="alt">
<td>Atmrs2-7</td>

       <td>F17I14.120<br><a href=/servlets/TairObject?type=locus&name=AT5G09690 target="new">AT5G09690</A></td>

       <td><A href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=25360940&dopt=GenBank">AY150292</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G09690 target="new">putative protein</A></td>

        </tr>

<tr class="alt">
<td>Atmrs2-8</td>

       <td>F17I14.90<br><a href=/servlets/TairObject?type=locus&name=AT5G09720 target="new">AT5G09720</A></td>

       <td><A href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=25360963&dopt=GenBank">AY150293</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G09720 target="new">putative protein</A></td>

        </tr>

<tr class="alt">
<td>Atmrs2-9</td>

       <td>F17I14.100<br><a href=/servlets/TairObject?type=locus&name=AT5G09710 target="new">AT5G09710</A></td>

       <td><A href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3985955&dopt=GenBank">AB020752</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G09710 target="new">putative protein</A></td>

        </tr>

<tr class="alt">
<td>Atmrs2-10</td>

       <td>F23A5.26<br><a href=/servlets/TairObject?type=locus&name=AT1G80900 target="new">AT1G80900</A></td>

       <td><A href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=25360982&dopt=GenBank">AY150294</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G80900 target="new">expressed protein</A></td>

        </tr>

<tr class="alt">
<td>Atmrs2-11</td>

       <td>MRN17.6<br><a href=/servlets/TairObject?type=locus&name=AT5G22830 target="new">AT5G22830</A></td>

       <td><A href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=12007446&dopt=GenBank">AF322255</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G22830 target="new">putative protein</A></td>

        </tr>

</table><P>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>
  <BR>

<center>Last modified on January 15, 2004</center>  

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
