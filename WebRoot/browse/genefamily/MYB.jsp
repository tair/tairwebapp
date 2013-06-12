<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - MYB Gene Family";
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
 
<h2><i> Arabidopsis</i> MYB gene family</h2>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD>
<TD><A HREF="http://www.mpiz-koeln.mpg.de/myb/" target="display">The R2R3-MYB gene family in plants</A><br>
<b>Ralf Stracke, Martin Werber, Bernd Weisshaar</b> (2001) <A href="/servlets/TairObject?type=publication&id=1545956">The R2R3-MYB gene family in Arabidopsis thaliana.</A> <i>CURRENT OPINION IN PLANT BIOLOGY</i> <b>4: </b> 447-456</A> </TD></TR>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD>please see the article above for more details </TD></TR>

<TR><TD valign=top><B>Contact:</B></TD>
<TD><a href="/servlets/Community?action=view&type=person&communityID=2290" target="display">Ralf Stracke</A><br>Martin Werber<br><a href="/servlets/Community?action=view&type=person&communityID=6272" target="display">Bernd Weisshaar</A></TD></TR>

</TABLE>

    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<TH><B>TIGR Annotation:</B></TH></TR>
	    

<tr class="alt">    <TD ROWSPAN=132 valign=top><B>MYB3R- and R2R3- type MYB- encoding genes</B></TD>
        <TD>AtMYB0</TD>
	<TD>K16N12<BR>At3g27920</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=166779&dopt=GenBank&query_type=retrieve" target="display">M79448</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g27920" target="display">MYB family transcription factor (GL1)</a></TD></TR>


<tr class="alt"><TD>AtMYB1</TD>
<TD>F3L24<BR>At3g09230</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=217858&dopt=GenBank&query_type=retrieve" target="display">D10936</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g09230" target="display">unknown protein</a></TD></TR>

<tr class="alt"><TD>AtMYB2</TD>
<TD>T8I3<BR>At2g47190</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=455462&dopt=GenBank&query_type=retrieve" target="display">D14712</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47190" target="display">MYB transcription factor (Atmyb2) </a></TD></TR>

<tr class="alt"><TD>AtMYB3</TD>
<TD>T22J18<BR>At1g22640</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941409&dopt=GenBank&query_type=retrieve" target="display">AF062859</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22640" target="display">putative myb-related transcription factor </a></TD></TR>

<tr class="alt"><TD>AtMYB4</TD>
<TD>F20M13<BR>At4g38620</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941411&dopt=GenBank&query_type=retrieve" target="display">AF062860</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g38620" target="display">putative transcription factor (MYB4) </a></TD></TR>

<tr class="alt"><TD>AtMYB5</TD>
<TD>MRP15<BR>At3g13540</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=1254994&dopt=GenBank&query_type=retrieve" target="display">U26935 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13540" target="display">myb-related protein 5</a></TD></TR>

<tr class="alt"><TD>AtMYB6</TD>
<TD>T15G18<BR>At4g09460</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=1020154&dopt=GenBank&query_type=retrieve" target="display">U26936</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g09460" target="display">myb DNA-binding protein</a></TD></TR>

<tr class="alt"><TD>AtMYB7</TD>
<TD>T24I21<BR>At2g16720</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=1020156&dopt=GenBank&query_type=retrieve" target="display">U26937</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16720" target="display">putative MYB family transcription factor </a></TD></TR>

<tr class="alt"><TD>AtMYB8</TD>
<TD>F15O4<BR>At1g35515</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=2832535&dopt=GenBank&query_type=retrieve" target="display">Z95803 (Ler)</A></TD>
<TD>&nbsp;</TD></TR>

<tr class="alt"><TD>AtMYB9</TD>
<TD>F5E19<BR>At5g16770</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941413&dopt=GenBank&query_type=retrieve" target="display">AF062861</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g16770" target="display">putative transcription factor (MYB9)</a></TD></TR>

<tr class="alt"><TD>AtMYB10</TD>
<TD>MKB21<BR>At3g12820</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941415&dopt=GenBank&query_type=retrieve" target="display">AF062862</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g12820" target="display">myb-related protein, putative</a></TD></TR>

<tr class="alt"><TD>AtMYB11</TD>
<TD>F26K9<BR>At3g62610</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941417&dopt=GenBank&query_type=retrieve" target="display">AF062863</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g62610" target="display">myb DNA-binding protein(MYB11)</a></TD></TR>

<tr class="alt"><TD>AtMYB12</TD>
<TD>T30B22<BR>At2g47460</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941419&dopt=GenBank&query_type=retrieve" target="display">AF062864</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47460" target="display">putative MYB family transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB13</TD>
<TD>F9P14<BR>At1g06180</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=1263092&dopt=GenBank&query_type=retrieve" target="display">Z50869 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06180" target="display">myb DNA binding protein </a></TD></TR>

<tr class="alt"><TD>AtMYB14</TD>
<TD>F16D14<BR>At2g31180</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941421&dopt=GenBank&query_type=retrieve" target="display">AF062865</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31180" target="display">myb DNA-binding protein</a></TD></TR>

<tr class="alt"><TD>AtMYB15</TD>
<TD>K14B15<BR>At3g23250</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=928966&dopt=GenBank&query_type=retrieve" target="display">X90384</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g23250" target="display">myb DNA-binding protein(MYB15)</a></TD></TR>

<tr class="alt"><TD>AtMYB16</TD>
<TD>F8M21<BR>At5g15310</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=1514441&dopt=GenBank&query_type=retrieve" target="display">X99809</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g15310" target="display">myb DNA-binding protein </a></TD></TR>

<tr class="alt"><TD>AtMYB17</TD>
<TD>T20K12<BR>At3g61250</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941423&dopt=GenBank&query_type=retrieve" target="display">AF062866</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g61250" target="display">myb DNA-binding protein (MYB17)</a></TD></TR>

<tr class="alt"><TD>AtMYB18</TD>
<TD>M7J2<BR>At4g25560</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941425&dopt=GenBank&query_type=retrieve" target="display">AF062867</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g25560" target="display">myb DNA-binding protein</a></TD></TR>

<tr class="alt"><TD>AtMYB19</TD>
<TD>F17P19<BR>At5g52260</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941427&dopt=GenBank&query_type=retrieve" target="display">AF062868</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g52260" target="display">myb DNA-binding protein(MYB19)</a></TD></TR>

<tr class="alt"><TD>AtMYB20</TD>
<TD>T6J19<BR>At1g66230</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941429&dopt=GenBank&query_type=retrieve" target="display">AF062869</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66230" target="display">myb DNA-binding protein(MYB20)</a></TD></TR>

<tr class="alt"><TD>AtMYB21</TD>
<TD>K16N12<BR>At3g27810</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941431&dopt=GenBank&query_type=retrieve" target="display">AF062870</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g27810" target="display">myb protein</a></TD></TR>

<tr class="alt"><TD>AtMYB22</TD>
<TD>MPO12<BR>At5g40430</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=5823304&dopt=GenBank&query_type=retrieve" target="display">AF175986</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40430" target="display">putative transcription factor MYB22</a></TD></TR>

<tr class="alt"><TD>AtMYB23</TD>
<TD>MPO12<BR>At5g40330</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=1495252&dopt=GenBank&query_type=retrieve" target="display">Z68158 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40330" target="display">myb-related protein</a></TD></TR>

<tr class="alt"><TD>AtMYB24</TD>
<TD>MPO12<BR>At5g40350</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=5823306&dopt=GenBank&query_type=retrieve" target="display">AF175987</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40350" target="display">putative transcription factor MYB24</a></TD></TR>

<tr class="alt"><TD>AtMYB25</TD>
<TD>T28M21<BR>At2g39880</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=6598791&dopt=GenBank&query_type=retrieve" target="display">AF175988
</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39880" target="display">putative MYB family transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB26</TD>
<TD>MCD16<BR>At3g13890</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=2832370&dopt=GenBank&query_type=retrieve" target="display">Z95749 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13890" target="display">myb protein(myb26)</a></TD></TR>

<tr class="alt"><TD>AtMYB27</TD>
<TD>T4D2<BR>At3g53200</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941433&dopt=GenBank&query_type=retrieve" target="display">AF062871</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g53200" target="display">myb protein(MYB27)</a></TD></TR>

<tr class="alt"><TD>AtMYB28</TD>
<TD>MFB13<BR>At5g61420</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=2832457&dopt=GenBank&query_type=retrieve" target="display">Z95751 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g61420" target="display">putative transcription factor MYB28</a></TD></TR>

<tr class="alt"><TD>AtMYB29</TD>
<TD>MBK20<BR>At5g07690</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941435&dopt=GenBank&query_type=retrieve" target="display">AF062872</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07690" target="display">transcription factor-like protein</a></TD></TR>

<tr class="alt"><TD>AtMYB30</TD>
<TD>MDL15<BR>At3g28910</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941437&dopt=GenBank&query_type=retrieve" target="display">AF062873</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g28910" target="display">MYB family transcription factor (hsr1), putative</a></TD></TR>

<tr class="alt"><TD>AtMYB31</TD>
<TD>F1M20<BR>At1g74650</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=928964&dopt=GenBank&query_type=retrieve" target="display">X90383</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74650" target="display">putative MYB family transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB32</TD>
<TD>M4E13<BR>At4g34990</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941439&dopt=GenBank&query_type=retrieve" target="display">AF062874</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34990" target="display">MYB-like protein</a></TD></TR>

<tr class="alt"><TD>AtMYB33</TD>
<TD>K16F4<BR>At5g06100</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941441&dopt=GenBank&query_type=retrieve" target="display">AF062875</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g06100" target="display">MYB family transcription factor-like</a></TD></TR>

<tr class="alt"><TD>AtMYB34</TD>
<TD>&nbsp;<BR>At5g60890</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3150036&dopt=GenBank&query_type=retrieve" target="display">U66462</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60890" target="display">Myb transcription factor homolog (ATR1) </a></TD></TR>

<tr class="alt"><TD>AtMYB35</TD>
<TD>MFJ20<BR>At3g28470</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941445&dopt=GenBank&query_type=retrieve" target="display">AF062877</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g28470" target="display">myb transcription factor, putative</a></TD></TR>

<tr class="alt"><TD>AtMYB36</TD>
<TD>MUA2<BR>At5g57620</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941447&dopt=GenBank&query_type=retrieve" target="display">AF062878</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g57620" target="display">Myb-related transcription factor-like protein</a></TD></TR>

<tr class="alt"><TD>AtMYB37</TD>
<TD>T20O7<BR>At5g23000</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941449&dopt=GenBank&query_type=retrieve" target="display">AF062879</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g23000" target="display">myb-related transcription factor-like</a></TD></TR>

<tr class="alt"><TD>AtMYB38</TD>
<TD>T1J8<BR>At2g36890</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941451&dopt=GenBank&query_type=retrieve" target="display">AF062880</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36890" target="display">putative MYB family transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB39</TD>
<TD>AtFCAcontig<BR>At4g17780</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=5281025&dopt=GenBank&query_type=retrieve" target="display">Z97344 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g17780" target="display">predicted protein</a></TD></TR>

<tr class="alt"><TD>AtMYB40</TD>
<TD>F18O12<BR>At5g14340</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941453&dopt=GenBank&query_type=retrieve" target="display">AF062881</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g14340" target="display">MYB40 - putative transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB41</TD>
<TD>T13J8<BR>At4g28110</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941455&dopt=GenBank&query_type=retrieve" target="display">AF062882</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g28110" target="display">transcription factor MYB41, myb </a></TD></TR>

<tr class="alt"><TD>AtMYB42</TD>
<TD>T4C9<BR>At4g12350</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=5823330&dopt=GenBank&query_type=retrieve" target="display">AF175999</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g12350" target="display">putative transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB43</TD>
<TD>MTG13<BR>At5g16600</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=5823312&dopt=GenBank&query_type=retrieve" target="display">AF175990</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g16600" target="display">transcription factor (gb|AAD53095.1)</a></TD></TR>

<tr class="alt"><TD>AtMYB44</TD>
<TD>K8K14<BR>At5g67300</TD>
<TD>&nbsp;</TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g67300" target="display">myb-related protein, 33.3K (pir |S71284)</a></TD></TR>

<tr class="alt"><TD>AtMYB45</TD>
<TD>T2J13<BR>At3g48920</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941457&dopt=GenBank&query_type=retrieve" target="display">AF062883</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g48920" target="display">myb-like protein</a></TD></TR>

<tr class="alt"><TD>AtMYB46</TD>
<TD>T24H18<BR>At5g12870</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941459&dopt=GenBank&query_type=retrieve" target="display">AF062884</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g12870" target="display">putative transcription factor (MYB46)</a></TD></TR>

<tr class="alt"><TD>AtMYB47</TD>
<TD>F6A14<BR>At1g18710</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941461&dopt=GenBank&query_type=retrieve" target="display">AF062885</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18710" target="display">Myb-related transcription factor mixta, putative</a></TD></TR>

<tr class="alt"><TD>AtMYB48</TD>
<TD>F12M12<BR>At3g46130</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=2832499&dopt=GenBank&query_type=retrieve" target="display">Z95772 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g46130" target="display">Myb DNA binding protein -like</a></TD></TR>

<tr class="alt"><TD>AtMYB49</TD>
<TD>MDK4.4<BR>At5g54230</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=2828180&dopt=GenBank&query_type=retrieve" target="display">AB010695</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g54230" target="display">Myb-related transcription factor-like protein</a></TD></TR>

<tr class="alt"><TD>AtMYB50</TD>
<TD>F25P12<BR>At1g57560</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941463&dopt=GenBank&query_type=retrieve" target="display">AF062886</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g57560" target="display">DNA-binding protein, putative</a></TD></TR>

<tr class="alt"><TD>AtMYB51</TD>
<TD>F25I16<BR>At1g18570</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941465&dopt=GenBank&query_type=retrieve" target="display">AF062887</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18570" target="display">myb factor, putative </a></TD></TR>

<tr class="alt"><TD>AtMYB52</TD>
<TD>F2H15<BR>At1g17950</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941467&dopt=GenBank&query_type=retrieve" target="display">AF062888</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17950" target="display">myb-like protein, putative</a></TD></TR>

<tr class="alt"><TD>AtMYB53</TD>
<TD>MQN23<BR>At5g65230</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941469&dopt=GenBank&query_type=retrieve" target="display">AF062889</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65230" target="display">transcription factor-like protein</a></TD></TR>

<tr class="alt"><TD>AtMYB54</TD>
<TD>T9L24<BR>At1g73410</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941471&dopt=GenBank&query_type=retrieve" target="display">AF062890</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73410" target="display">myb-like transcription factor, putative</a></TD></TR>

<tr class="alt"><TD>AtMYB55</TD>
<TD>T15B16.4<BR>At4g01680</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3859590&dopt=GenBank&query_type=retrieve" target="display">AF104919</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g01680" target="display">putative transcription factor</a></TD></TR>

 <tr class="alt"><TD>AtMYB56</TD>
<TD>MVA3.16<BR>At5g17800</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941473&dopt=GenBank&query_type=retrieve" target="display">AF062891</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g17800" target="display">MYB56 R2R3-MYB factor family member</a></TD></TR>

<tr class="alt"><TD>AtMYB57</TD>
<TD>F4P13<BR>At3g01530</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941475&dopt=GenBank&query_type=retrieve" target="display">AF062892</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g01530" target="display">putative transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB58</TD>
<TD>F3O9<BR>At1g16490</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941477&dopt=GenBank&query_type=retrieve" target="display">AF062893</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16490" target="display">putative myb-related transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB59</TD>
<TD>MTH12<BR>At5g59780</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941479&dopt=GenBank&query_type=retrieve" target="display">AF062894</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59780" target="display">MYB27 protein - like </a></TD></TR>

 <tr class="alt"><TD>AtMYB60</TD>
<TD>F22O13<BR>At1g08810</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941481&dopt=GenBank&query_type=retrieve" target="display">AF062895</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08810" target="display">putative transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB61</TD>
<TD>F14J9<BR>At1g09540</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941483&dopt=GenBank&query_type=retrieve" target="display">AF062896</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09540" target="display">putative transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB62</TD>
<TD>T22E19<BR>At1g68320</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941485&dopt=GenBank&query_type=retrieve" target="display">AF062897</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68320" target="display">putative transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB63</TD>
<TD>YUP8H12R<BR>At1g79180</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941487&dopt=GenBank&query_type=retrieve" target="display">AF062898</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=" target="display">myb-related protein, putative</a></TD></TR>

 <tr class="alt"><TD>AtMYB64</TD>
<TD>T5K6<BR>At5g11050</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=14031056&dopt=GenBank&query_type=retrieve" target="display">AY032854</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g11050" target="display">MYB DNA-binding - like protein</a></TD></TR>

<tr class="alt"><TD>AtMYB65</TD>
<TD>F24K9<BR>At3g11440</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941489&dopt=GenBank&query_type=retrieve" target="display">AF062899</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g11440" target="display">Myb DNA-binding protein, putative</a></TD></TR>

<tr class="alt"><TD>AtMYB66</TD>
<TD>T9L3<BR>At5g14750</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941491&dopt=GenBank&query_type=retrieve" target="display">AF062900</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g14750" target="display">myb transcription factor werewolf (WER)/ MYB66</a></TD></TR>

<tr class="alt"><TD>AtMYB67</TD>
<TD>MBK21<BR>At3g12720</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=928970&dopt=GenBank&query_type=retrieve" target="display">X90386</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g12720" target="display">myb-related transcription factor, putative</a></TD></TR>

 <tr class="alt"><TD>AtMYB68</TD>
<TD>MPA24<BR>At5g65790</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941493&dopt=GenBank&query_type=retrieve" target="display">AF062901</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65790" target="display">transcription factor-like protein</a></TD></TR>

<tr class="alt"><TD>AtMYB69</TD>
<TD>F17M5<BR>At4g33450</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941495&dopt=GenBank&query_type=retrieve" target="display">AF062902</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g33450" target="display">putative transcription factor </a></TD></TR>

<tr class="alt"><TD>AtMYB70</TD>
<TD>T20D16<BR>At2g23290</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941497&dopt=GenBank&query_type=retrieve" target="display">AF062903</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g23290" target="display">putative MYB family transcription factor </a></TD></TR>

<tr class="alt"><TD>AtMYB71</TD>
<TD>K7M2<BR>At3g24310</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=1732512&dopt=GenBank&query_type=retrieve" target="display">U62743</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g24310" target="display">DNA-binding protein, putative</a></TD></TR>

 <tr class="alt"><TD>AtMYB72</TD>
<TD>F14G9<BR>At1g56160</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941501&dopt=GenBank&query_type=retrieve" target="display">AF062905</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g56160" target="display">Myb-family transcription factor, putative</a></TD></TR>

<tr class="alt"><TD>AtMYB73</TD>
<TD>C7A10<BR>At4g37260</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941503&dopt=GenBank&query_type=retrieve" target="display">AF062906</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g37260" target="display">myb-related protein</a></TD></TR>

<tr class="alt"><TD>AtMYB74</TD>
<TD>C17L7<BR>At4g05100</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941505&dopt=GenBank&query_type=retrieve" target="display">AF062907</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g05100" target="display">MYB - like protein</a></TD></TR>

<tr class="alt"><TD>AtMYB75</TD>
<TD>F25P12<BR>At1g56650</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941507&dopt=GenBank&query_type=retrieve" target="display">AF062908</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g56650" target="display">anthocyanin2, putative</a></TD></TR>

 <tr class="alt"><TD>AtMYB76</TD>
<TD>MBK20<BR>At5g07700</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=2832573&dopt=GenBank&query_type=retrieve" target="display">Z95799 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07700" target="display">transcription factor (gb|AAD53097.1)</a></TD></TR>

<tr class="alt"><TD>AtMYB77</TD>
<TD>F3A4<BR>At3g50060</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=1263096&dopt=GenBank&query_type=retrieve" target="display">Z54137 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g50060" target="display">R2R3-MYB transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB78</TD>
<TD>K6M13<BR>At5g49620</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941509&dopt=GenBank&query_type=retrieve" target="display">AF062909</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49620" target="display">myb-related transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB79</TD>
<TD>T6G15<BR>At4g13480</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941511&dopt=GenBank&query_type=retrieve" target="display">AF062910</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g13480" target="display">myb-like protein</a></TD></TR>

 <tr class="alt"><TD>AtMYB80</TD>
<TD>MDA7<BR>At5g56110</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=2832537&dopt=GenBank&query_type=retrieve" target="display">Z95804 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g56110" target="display">myb DNA-binding protein(Atmyb103)</a></TD></TR>

<tr class="alt"><TD>AtMYB81</TD>
<TD>T20P8<BR>At2g26960</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941513&dopt=GenBank&query_type=retrieve" target="display">AF062911</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26960" target="display">putative MYB family transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB82</TD>
<TD>F6N7<BR>At5g52600</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941515&dopt=GenBank&query_type=retrieve" target="display">AF062912</A></TD>
<TD>&nbsp;</TD></TR>

 <tr class="alt"><TD>AtMYB83</TD>
<TD>T8G24<BR>At3g08500</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=2832541&dopt=GenBank&query_type=retrieve" target="display" target="display">Z95806 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g08500">MYB-family transcription factor, putative</a></TD></TR>

<tr class="alt"><TD>AtMYB84</TD>
<TD>T16K5<BR>At3g49690</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=accurl&dopt=GenBank&query_type=retrieve" target="display">Y14209 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g49690" target="display"> AtMYB84</a></TD></TR>

<tr class="alt"><TD>AtMYB85</TD>
<TD>T12H17<BR>At4g22680</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=5823318&dopt=GenBank&query_type=retrieve" target="display">AF175993</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g22680" target="display">myb-like protein</a></TD></TR>

<tr class="alt"><TD>AtMYB86</TD>
<TD>F21E10<BR>At5g26660</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=2280529&dopt=GenBank&query_type=retrieve" target="display">AB005889</A></TD>
<TD>&nbsp;</TD></TR>

 <tr class="alt"><TD>AtMYB87</TD>
<TD>T28I19<BR>At4g37780</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941519&dopt=GenBank&query_type=retrieve" target="display">AF062914</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g37780" target="display">myb transcription factor - like protein </a></TD></TR>

<tr class="alt"><TD>AtMYB88</TD>
<TD>T20F6<BR>At2g02820</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=5823320&dopt=GenBank&query_type=retrieve" target="display">AF175994</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02820" target="display">putative MYB family transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB89</TD>
<TD>MIJ24<BR>At5g39700</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=5823322&dopt=GenBank&query_type=retrieve" target="display">AF175995</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g39700" target="display">putative transcription factor MYB89</a></TD></TR>

<tr class="alt"><TD>AtMYB90</TD>
<TD>T27F4<BR>At1g66390</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941521&dopt=GenBank&query_type=retrieve" target="display">AF062915</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66390" target="display">Myb-related transcription factor, putative</a></TD></TR>

 <tr class="alt"><TD>AtMYB91</TD>
<TD>F13M22<BR>At2g37630</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=6598437&dopt=GenBank&query_type=retrieve" target="display">AC004684</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37630" target="display">putative MYB family transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB92</TD>
<TD>F18D22<BR>At5g10280</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941523&dopt=GenBank&query_type=retrieve" target="display">AF062916</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g10280" target="display">putative transcription factor MYB92</a></TD></TR>



<tr class="alt"><TD>AtMYB93</TD>
<TD>F21H2<BR>At1g34670</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941525&dopt=GenBank&query_type=retrieve" target="display">AF062917</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34670" target="display">myb-related protein, putative</a></TD></TR>

 <tr class="alt"><TD>AtMYB94</TD>
<TD>F1P2<BR>At3g47600</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3941527&dopt=GenBank&query_type=retrieve" target="display">AF062918</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47600" target="display">putative transcription factor MYB94</a></TD></TR>

<tr class="alt"><TD>AtMYB95</TD>
<TD>F1M20<BR>At1g74430</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=6006711&dopt=GenBank&query_type=retrieve" target="display">AF101048 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74430" target="display">putative MYB family transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB96</TD>
<TD>K19B1<BR>At5g62470</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=4127457&dopt=GenBank&query_type=retrieve" target="display">AJ011669</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g62470" target="display">MYB96 transcription factor-like protein</a></TD></TR>

<tr class="alt"><TD>AtMYB97</TD>
<TD>F10M23<BR>At4g26930</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=5823336&dopt=GenBank&query_type=retrieve" target="display">AF176002</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g26930" target="display">putative myb-related protein</a></TD></TR>


<tr class="alt"><TD>AtMYB98</TD>
<TD>F28A21<BR>At4g18770</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=5823338&dopt=GenBank&query_type=retrieve" target="display">AF176003</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18770" target="display">myb - like protein</a></TD></TR>

<tr class="alt"><TD>AtMYB99</TD>
<TD>MMI9<BR>At5g62320</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=6006715&dopt=GenBank&query_type=retrieve" target="display">AF101050 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g62320" target="display">MYB99</a></TD></TR>

<tr class="alt"><TD>AtMYB100</TD>
<TD>T22F11<BR>At2g25230</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=5823340&dopt=GenBank&query_type=retrieve" target="display">AF176004</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25230" target="display">putative MYB family transcription factor</a></TD></TR>


<tr class="alt"><TD>AtMYB101</TD>
<TD>T26B15<BR>At2g32460</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=928939&dopt=GenBank&query_type=retrieve" target="display">X90379</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32460" target="display">putative MYB family transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB102</TD>
<TD>F18E5<BR>At4g21440</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=7263578&dopt=GenBank&query_type=retrieve" target="display">X90382</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g21440" target="display">myb-related protein M4</a></TD></TR>

<tr class="alt"><TD>AtMYB103</TD>
<TD>T12P18<BR>At1g63910</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=6708469&dopt=GenBank&query_type=retrieve" target="display">AF214116</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g63910" target="display">putative MYB family transcription factor</a></TD></TR>


<tr class="alt"><TD>AtMYB104</TD>
<TD>T20P8<BR>At2g26950</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=6467224&dopt=GenBank&query_type=retrieve" target="display">U26934 (Ler)</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26950" target="display">putative MYB family transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB105</TD>
<TD>F24J1<BR>At1g69560</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=7644365&dopt=GenBank&query_type=retrieve" target="display">AF249308</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69560" target="display">MYB-family transcription factor, putative</a></TD></TR>

<tr class="alt"><TD>AtMYB106</TD>
<TD>T4P13<BR>At3g01140</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=7644367&dopt=GenBank&query_type=retrieve" target="display">AF249309</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g01140" target="display">putative Myb-related transcription factor</a></TD></TR>


<tr class="alt"><TD>AtMYB107</TD>
<TD>F13E7<BR>At3g02940</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=7644369&dopt=GenBank&query_type=retrieve" target="display">AF249310</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02940" target="display">putative MYB family transcription factor </a></TD></TR>

<tr class="alt"><TD>AtMYB108</TD>
<TD>F5E6<BR>At3g06490</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=8101955&dopt=GenBank&query_type=retrieve" target="display">AF262733</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06490" target="display">myb-related protein, putative</a></TD></TR>

<tr class="alt"><TD>AtMYB109</TD>
<TD>F1I16<BR>At3g55730</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=8101957&dopt=GenBank&query_type=retrieve" target="display">AF262734</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55730" target="display">MYB transcription factor - like protein</a></TD></TR>


<tr class="alt"><TD>AtMYB110</TD>
<TD>K5K13<BR>At3g29020</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=9864076&dopt=GenBank&query_type=retrieve" target="display">AF272732</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g29020" target="display">unknown protein</a></TD></TR>

<tr class="alt"><TD>AtMYB111</TD>
<TD>K21P3<BR>At5g49330</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=&dopt=GenBank&query_type=retrieve" target="display">AF371977</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49330" target="display">putative protein</a></TD></TR>

<tr class="alt"><TD>AtMYB112</TD>
<TD>T2J15<BR>At1g48000</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=11641119&dopt=GenBank&query_type=retrieve" target="display">AY008377</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48000" target="display">myb-related transcription factor (cpm10), putative</a></TD></TR>


<tr class="alt"><TD>AtMYB113</TD>
<TD>T27F4<BR>At1g66370</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=11641121&dopt=GenBank&query_type=retrieve" target="display">AY008378</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66370" target="display">Myb-related transcription factor, putative</a></TD></TR>

<tr class="alt"><TD>AtMYB114</TD>
<TD>T24F4<BR>At1g66380</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=11641123&dopt=GenBank&query_type=retrieve" target="display">AY008379</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66380" target="display">Myb-related transcription factor, putative</a></TD></TR>

<tr class="alt"><TD>AtMYB115</TD>
<TD>MPO12<BR>At5g40360</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=13430153&dopt=GenBank&query_type=retrieve" target="display">AF334814</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40360" target="display">MYB -like protein</a></TD></TR>


<tr class="alt"><TD>AtMYB116</TD>
<TD>F4F7<BR>At1g25340</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=13430155&dopt=GenBank&query_type=retrieve" target="display">AF334815</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g25340" target="display"> myb-related transcription factor (cpm7), putative</a></TD></TR>

<tr class="alt"><TD>AtMYB117</TD>
<TD>T24P13<BR>At1g26780</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=13430157&dopt=GenBank&query_type=retrieve" target="display">AF334816</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26780" target="display">myb-related protein, putative</a></TD></TR>

<tr class="alt"><TD>AtMYB118</TD>
<TD>MGF10<BR>At3g27780</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=13430159&dopt=GenBank&query_type=retrieve" target="display">AF334817</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g27780" target="display">hypothetical protein</a></TD></TR>


<tr class="alt"><TD>AtMYB119</TD>
<TD>K19M22<BR>At5g58850</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=14161416&dopt=GenBank&query_type=retrieve" target="display">AF371978</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58850" target="display">myb-related protein - like</a></TD></TR>

<tr class="alt"><TD>AtMYB120</TD>
<TD>K13P22<BR>At5g55020</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=14161418&dopt=GenBank&query_type=retrieve" target="display">AF371979</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55020" target="display">putative protein </a></TD></TR>

<tr class="alt"><TD>AtMYB121</TD>
<TD>MIL15<BR>At3g30210</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=14161420&dopt=GenBank&query_type=retrieve" target="display">AF371980</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g30210" target="display">myb-like transcription factor, putative</a></TD></TR>


<tr class="alt"><TD>AtMYB122</TD>
<TD>F2P9<BR>At1g74080</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=14161426&dopt=GenBank&query_type=retrieve" target="display">AF371983</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74080" target="display">putative transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB123</TD>
<TD>MOK9<BR>At5g35550</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB08716.1&dopt=GenBank&query_type=retrieve" target="display">AF371981</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g35550" target="display">Myb-related transcription factor LBM2-like protein</a></TD></TR>

<tr class="alt"><TD>AtMYB124</TD>
<TD>F14L17<BR>At1g14350</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=14161424&dopt=GenBank&query_type=retrieve" target="display">AF371982</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14350" target="display">hypothetical protein </a></TD></TR>


<tr class="alt"><TD>AtCDC5</TD>
<TD>F21M12<BR>At1g09770</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=1747309&dopt=GenBank&query_type=retrieve" target="display">D58424</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09770" target="display">putative DNA-binding protein, Myb</a></TD></TR>

<tr class="alt"><TD>AtMYB4R1</TD>
<TD>MRCA8<BR>At3g18100</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=14268523&dopt=GenBank&query_type=retrieve" target="display">AY033827</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g18100" target="display">putative MYB family transcription factor</a></TD></TR>

<tr class="alt"><TD>AtMYB3R1</TD>
<TD>F4D11<BR>AT4g32730</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=5678826&dopt=GenBank&query_type=retrieve</TD>
<TD" target="display">AF151646</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=" target="display">putative myb-protein</a></TD></TR>

<tr class="alt"><TD>AtMYB3R2</TD>
<TD>F6N23<BR>At4g00540</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=5678828&dopt=GenBank&query_type=retrieve" target="display">AF151647</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00540" target="display">putative myb-like DNA-binding protein</a></TD></TR>

<tr class="alt"><TD>AtMYB3R3</TD>
<TD>F3L24<BR>AT3g09370</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=6708471&dopt=GenBank&query_type=retrieve" target="display">AF214117</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g09370" target="display">putative MYB family transcription factor </a></TD></TR>

<tr class="alt"><TD>AtMYB3R-4</TD>
<TD>dt_e_23<BR>AT5g11510</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=14161412&dopt=GenBank&query_type=retrieve" target="display">AF371975</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g11510" target="display">MYB like protein</a></TD></TR>

<tr class="alt"><TD>AtMYB3R-5</TD>
<TD>T1E22<BR>At5g02320</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=14161414&dopt=GenBank&query_type=retrieve" target="display">AF371976</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g02320" target="display">myb -like protein</a></TD></TR>
</TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
