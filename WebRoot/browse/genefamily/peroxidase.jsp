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
<h2><i>Arabidopsis</i> Class III Peroxidase Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><li>Web site : <a href="http://www.unige.ch/LABPV/perox.html">Plant Peroxidase</a><li>M. Tognolli, C. Penel, H. Greppin, P. Simon, (2002) <a href="/servlets/TairObject?type=publication&id=501682083">Analysis and expression of the class III peroxidase large gene family in Arabidopsis thaliana.</a> Gene <b>288: 129</b></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Nomenclature of the class III peroxidase family members based on their location on the chromosomes; analyse of the gene structure in correlation with the phylogenetic relationships between the members; characterization of expression patterns using cDNA macroarray procedure.</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=/servlets/Community?action=view&type=person&communityID=1012653 target=new>Michael Tognolli</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Genbank Accession:</B></TH>

   <TH><B>Swiss-Prot Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=73 valign=top><b>Class III peroxidase</b></td>

       <td>PER1</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1G05240 target="new">AT1G05240</A></td>

       <td>AAB71454</A><br></td>

       <td>Q96506</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G05240 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER2</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1G05250 target="new">AT1G05250</A></td>

       <td>AAB71453</A><br></td>

       <td>Q96506</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G05250 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER3</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1G05260 target="new">AT1G05260</A></td>

       <td>AAB71452</A><br></td>

       <td>O23044</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G05260 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER4</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1G14540 target="new">AT1G14540</A></td>

       <td>AAF63178</A><br></td>

       <td>Q9LE15</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G14540 target="new">anionic peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER5</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1G14550 target="new">AT1G14550</A></td>

       <td>AAF43956</A><br></td>

       <td>Q9M9Q9</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G14550 target="new">anionic peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER6</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1G24110 target="new">AT1G24110</A></td>

       <td>AAC00571</A><br></td>

       <td>O48677</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G24110 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER7</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1G30870 target="new">AT1G30870</A></td>

       <td>AAD32944</A><br></td>

       <td>Q9SY33</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G30870 target="new">cationic peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER8</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1G34510 target="new">AT1G34510</A></td>

       <td>AAF79260</A><br></td>

       <td>Q9LNL0</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G34510 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER9</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1G44970 target="new">AT1G44970</A></td>

       <td>AAF69153</A><br></td>

       <td>Q96512</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G44970 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER10</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1G49570 target="new">AT1G49570</A></td>

       <td>AAG13043</A><br></td>

       <td>Q9FX85</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G49570 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER11</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1G68850 target="new">AT1G68850</A></td>

       <td>AAG51588</A><br></td>

       <td>Q96519</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G68850 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER12</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1G71695 target="new">AT1G71695</A></td>

       <td>AAG51834</A><br></td>

       <td>Q96520</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G71695 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER13</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1G77100 target="new">AT1G77100</A></td>

       <td>AAC00622</A><br></td>

       <td>O49293</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G77100 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER14</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2G18140 target="new">AT2G18140</A></td>

       <td>AAD31352</A><br></td>

       <td>Q9SI17</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G18140 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER15</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2G18150 target="new">AT2G18150</A></td>

       <td>AAD31351</A><br></td>

       <td>Q9SI16</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G18150 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER16</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2G18980 target="new">AT2G18980</A></td>

       <td>AAC09031</A><br></td>

       <td>Q96518</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G18980 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER17</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2G22420 target="new">AT2G22420</A></td>

       <td>AAD22357</A><br></td>

       <td>Q9SJZ2</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G22420 target="new">putative peroxidase</A></td>

        </tr>
<tr class="alt">

       <td>PER18</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2G24800 target="new">AT2G24800</A></td>

       <td>AAD23032</A><br></td>

       <td>Q9SK52</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G24800 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER19</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2G34060 target="new">AT2G34060</A></td>

       <td>AAB67624</A><br></td>

       <td>O22959</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G34060 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER20</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2G35380 target="new">AT2G35380</A></td>

       <td>AAC36183</A><br></td>

       <td>Q9SLH7</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G35380 target="new">peroxidase family</A></td>

        </tr>
<tr class="alt">

       <td>PER21</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2G37130 target="new">AT2G37130</A></td>

       <td>AAD18146</A><br></td>

       <td>Q42580</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G37130 target="new">peroxidase, putative(ATP2a)</A></td>

        </tr>
<tr class="alt">

       <td>PER22</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2G38380 target="new">AT2G38380</A></td>

       <td>AAC28766</A><br></td>

       <td>P24102</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G38380 target="new">peroxidase</A></td>

        </tr>
<tr class="alt">

       <td>PER23</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2G38390 target="new">AT2G38390</A></td>

       <td>AAC28765</A><br></td>

       <td>O80912</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G38390 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER24</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2G39040 target="new">AT2G39040</A></td>

       <td>AAC79614</A><br></td>

       <td>Q9ZV04</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G39040 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER25</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2G41480 target="new">AT2G41480</A></td>

       <td>AAM98136</A><br></td>

       <td>O80822</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G41480 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER26</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2G43480 target="new">AT2G43480</A></td>

       <td>AAB64327</A><br></td>

       <td>O22862</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G43480 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER27</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3G01190 target="new">AT3G01190</A></td>

       <td>AAF26155</A><br></td>

       <td>Q43735</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G01190 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER28</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3G03670 target="new">AT3G03670</A></td>

       <td>AAF03466</A><br></td>

       <td>Q9SS67</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G03670 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER29</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3G17070 target="new">AT3G17070</A></td>

       <td>AAM62734</A><br></td>

       <td>Q9LSP0</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G17070 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER30</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3G21770 target="new">AT3G21770</A></td>

       <td>BAB02839</A><br></td>

       <td>Q9LSY7</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G21770 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER31</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3G28200 target="new">AT3G28200</A></td>

       <td>BAB02637</A><br></td>

       <td>Q9LHA7</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G28200 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER32</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3G32980 target="new">AT3G32980</A></td>

       <td>BAB02631</A><br></td>

       <td>Q9LHB9</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G32980 target="new">pseudogene, neutral peroxidase c</A></td>

        </tr>
<tr class="alt">

       <td>PER33</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3G49110 target="new">AT3G49110</A></td>

       <td>CAB61999</A><br></td>

       <td>P24101</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G49110 target="new">peroxidase</A></td>

        </tr>
<tr class="alt">

       <td>PER34</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3G49120 target="new">AT3G49120</A></td>

       <td>CAB61998</A><br></td>

       <td>Q9SMU8</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G49120 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER35</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3G49960 target="new">AT3G49960</A></td>

       <td>CAB62104</A><br></td>

       <td>Q96510</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G49960 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER36</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3G50990 target="new">AT3G50990</A></td>

       <td>CAB62621</A><br></td>

       <td>Q9SD46</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G50990 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER37</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G08770 target="new">AT4G08770</A></td>

       <td>CAB82113</A><br></td>

       <td>Q9LDN9</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G08770 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER38</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G08780 target="new">AT4G08780</A></td>

       <td>CAB82114</A><br></td>

       <td>Q9LDA4</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G08780 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER39</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G11290 target="new">AT4G11290</A></td>

       <td>CAB51413</A><br></td>

       <td>Q9SUT2</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G11290 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER40</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G16270 target="new">AT4G16270</A></td>

       <td>CAB10406</A><br></td>

       <td>O23474</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G16270 target="new">peroxidase family</A></td>

        </tr>
<tr class="alt">

       <td>PER41</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G17690 target="new">AT4G17690</A></td>

       <td>CAB10549</A><br></td>

       <td>O23609</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G17690 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER42</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G21960 target="new">AT4G21960</A></td>

       <td>CAA66957</A><br></td>

       <td>Q9SB81</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G21960 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER43</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G25980 target="new">AT4G25980</A></td>

       <td>CAB39663</A><br></td>

       <td>Q9SZH2</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G25980 target="new">cationic peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER44</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G26010 target="new">AT4G26010</A></td>

       <td>AAL06519</A><br></td>

       <td>Q93V93</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G26010 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER45</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G30170 target="new">AT4G30170</A></td>

       <td>CAB52461</A><br></td>

       <td>Q96522</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G30170 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER46</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G31760 target="new">AT4G31760</A></td>

       <td>CAA19747</A><br></td>

       <td>O81772</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G31760 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER47</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G33420 target="new">AT4G33420</A></td>

       <td>CAB38800</A><br></td>

       <td>Q9SZB9</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G33420 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER48</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G33870 target="new">AT4G33870</A></td>

       <td>CAA19869</A><br></td>

       <td>O81755</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G33870 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER49</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G36430 target="new">AT4G36430</A></td>

       <td>CAB16848</A><br></td>

       <td>O23237</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G36430 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER50</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G37520 target="new">AT4G37520</A></td>

       <td>CAB38291</A><br></td>

       <td>Q43731</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G37520 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER51</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4G37530 target="new">AT4G37530</A></td>

       <td>CAB38292</A><br></td>

       <td>Q9SZE7</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G37530 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER52</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G05340 target="new">AT5G05340</A></td>

       <td>BAB09977</A><br></td>

       <td>Q9FLC0</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G05340 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER53</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G06720 target="new">AT5G06720</A></td>

       <td>BAB09806</A><br></td>

       <td>Q42578</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G06720 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER54</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G06730 target="new">AT5G06730</A></td>

       <td>BAB09807</A><br></td>

       <td>Q9FG34</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G06730 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER55</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G14130 target="new">AT5G14130</A></td>

       <td>BAB08292</A><br></td>

       <td>Q96509</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G14130 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER56</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G15180 target="new">AT5G15180</A></td>

       <td>CAB89328</A><br></td>

       <td>Q9LXG3</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G15180 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER57</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G17820 target="new">AT5G17820</A></td>

       <td>BAB09581</A><br></td>

       <td>Q43729</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G17820 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER58</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G19880 target="new">AT5G19880</A></td>

       <td>BAC42706</A><br></td>

       <td>P59120</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G19880 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER59</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G19890 target="new">AT5G19890</A></td>

       <td>AAM74498</A><br></td>

       <td>Q39034</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G19890 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER60</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G22410 target="new">AT5G22410</A></td>

       <td>BAB08340</A><br></td>

       <td>Q9FMR0</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G22410 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER61</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G24070 target="new">AT5G24070</A></td>

       <td>BAB08730</A><br></td>

       <td>Q9FLV5</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G24070 target="new">cationinc peroxidase family</A></td>

        </tr>
<tr class="alt">

       <td>PER62</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G39580 target="new">AT5G39580</A></td>

       <td>BAB08889</A><br></td>

       <td>Q9FKA4</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G39580 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER63</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G40150 target="new">AT5G40150</A></td>

       <td>BAB10896</A><br></td>

       <td>Q9FL16</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G40150 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER64</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G42180 target="new">AT5G42180</A></td>

       <td>BAB08451</A><br></td>

       <td>Q43872</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G42180 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER65</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G47000 target="new">AT5G47000</A></td>

       <td>AAM13130</A><br></td>

       <td>Q9FJR1</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G47000 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER66</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G51890 target="new">AT5G51890</A></td>

       <td>BAA97224</A><br></td>

       <td>Q9LT91</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G51890 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER67</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G58390 target="new">AT5G58390</A></td>

       <td>BAA96930</A><br></td>

       <td>Q9LVL2</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G58390 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER68</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G58400 target="new">AT5G58400</A></td>

       <td>BAA96931</A><br></td>

       <td>Q9LVL1</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G58400 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER69</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G64100 target="new">AT5G64100</A></td>

       <td>BAB10278</A><br></td>

       <td>Q96511</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G64100 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER70</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G64110 target="new">AT5G64110</A></td>

       <td>BAB10279</A><br></td>

       <td>Q9FMI7</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G64110 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER71</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G64120 target="new">AT5G64120</A></td>

       <td>BAB10280</A><br></td>

       <td>Q43387</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G64120 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER72</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G66390 target="new">AT5G66390</A></td>

       <td>BAB10915</A><br></td>

       <td>Q9FJZ9</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G66390 target="new">peroxidase, putative</A></td>

        </tr>
<tr class="alt">

       <td>PER73</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5G67400 target="new">AT5G67400</A></td>

       <td>BAB09025</A><br></td>

       <td>Q43873</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G67400 target="new">peroxidase, putative</A></td>

        </tr>
</table><P>
<center>Last modified on February 13, 2003</center>     

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
