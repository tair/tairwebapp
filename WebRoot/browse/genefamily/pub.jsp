<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "U-box Gene Family";
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
<h2><i>Arabidopsis</i> U-box Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Azevedo, C., Santos-Rosa M.J., and Shirasu, K. <a href="/servlets/TairObject?type=publication&id=501680604" target="new">The U-box protein family in plants</a> (2001) TIPS 6(8): 354-358</td></tr>
<TR><TD valign=top>&nbsp;</TD>
<TD>Heise, A. Lippok, B., Kirsch, C., and Hahlbrock, K. <a href="/servlets/TairObject?type=publication&id=501681503" target="new">Two immediate-early pathogen-responsive members of the AtCMPG gene family in Arabidopsis thaliana and the W-box-containing elicitor response element at AtCMPG1</a> (2002) PNAS 99(13): 9049-9054</td></tr>
<TR><TD valign=top>&nbsp;</TD>
<TD>Mireia Panicot, unpublished data</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Proteins containing a U-box domain (SMART ID: SM00504, INTERPRO ID: IPR003613). By structural characteristics and phylogenetic comparison, the 61 representatives are assigned to 7 sub-classes.</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=/servlets/Community?action=view&type=person&communityID=5951 target=new>Ken Shirasu</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Sub-Class:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=61 valign=top><b>Plant U-box protein (PUB)</b></td>
       <td>Class I</td>
       <td>AtUFD2</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g15400  target="new">AT5g15400 </A></td>

       <td>NP_568313</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g15400  target="new">ubiquitin-fusion degradation protein-like</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB2</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g67340 target="new">AT5g67340</A></td>

       <td>NP_201535</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g67340 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB3</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3g54790 target="new">AT3g54790</A></td>

       <td>NP_191039</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g54790 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB4</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2g23140 target="new">AT2g23140</A></td>

       <td>AAB87116  </A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g23140 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB5</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4g36550 target="new">AT4g36550</A></td>

       <td>CAB80321</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g36550 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB6</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g24330 target="new">AT1g24330</A></td>

       <td>NP_173843</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g24330 target="new">hypothetical protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB7</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g67530 target="new">AT1g67530</A></td>

       <td>NP_176920</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g67530 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB8, AtCMPG3</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4g21350 target="new">AT4g21350</A></td>

       <td>CAB79134 </A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g21350 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB9</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3g07360 target="new">AT3g07360</A></td>

       <td>AAL91644</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07360 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB10</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g71020 target="new">AT1g71020</A></td>

       <td>AAL91637</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g71020 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB11, AtCMPG6</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g23030 target="new">AT1g23030</A></td>

       <td>AAO00878</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g23030 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB12</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2g28830 target="new">AT2g28830</A></td>

       <td>AAC79587</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g28830 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB13</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3g46510 target="new">AT3g46510</A></td>

       <td>AAM91213</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g46510 target="new">arm repeat containing protein homolog</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB14</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3g54850 target="new">AT3g54850</A></td>

       <td>AAM20180</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g54850 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB15</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g42340 target="new">AT5g42340</A></td>

       <td>NP_199049</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g42340 target="new">arm repeat containing protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB16</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g01830 target="new">AT5g01830</A></td>

       <td>NP_195803</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g01830 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB17</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g29340 target="new">AT1g29340</A></td>

       <td>AAL36401</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g29340 target="new">arm repeat containing protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB18</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g10560 target="new">AT1g10560</A></td>

       <td>AAL77690</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g10560 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB19</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g60190 target="new">AT1g60190</A></td>

       <td>NP_176225</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g60190 target="new">unclassified protein</A></td>

        </tr>
<tr class="alt">
       <td>Class III</td>
       <td>AtPUB20, AtCMPG1</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g66160 target="new">AT1g66160</A></td>

       <td>AAL34278</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g66160 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class III</td>
       <td>AtPUB21, AtCMPG5</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g37490 target="new">AT5g37490</A></td>

       <td>NP_198565</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g37490 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class III</td>
       <td>AtPUB22</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3g52450 target="new">AT3g52450</A></td>

       <td>NP_190813</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g52450 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class III</td>
       <td>AtPUB23</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2g35930 target="new">AT2g35930</A></td>

       <td>AAD21464</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g35930 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class III</td>
       <td>AtPUB24</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3g11840 target="new">AT3g11840</A></td>

       <td>NP_566402</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g11840 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class III</td>
       <td>AtPUB25</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3g19380 target="new">AT3g19380</A></td>

       <td>NP_566632</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g19380 target="new">peptidylprolyl isomerase (cyclophilin)-like</A></td>

        </tr>
<tr class="alt">
       <td>Class III</td>
       <td>AtPUB26</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g49780 target="new">AT1g49780</A></td>

       <td>NP_175400</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g49780 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class III</td>
       <td>AtPUB27, AtCMPG2</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g64660 target="new">AT5g64660</A></td>

       <td>NP_201271</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64660 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class III</td>
       <td>AtPUB28</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g09800 target="new">AT5g09800</A></td>

       <td>NP_196542</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g09800 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class III</td>
       <td>AtPUB29</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3g18710 target="new">AT3g18710</A></td>

       <td>AAO63423</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g18710 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class III</td>
       <td>AtPUB30</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3g49810 target="new">AT3g49810</A></td>

       <td>NP_566927</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g49810 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class III</td>
       <td>AtPUB31, AtCMPG4</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g65920 target="new">AT5g65920</A></td>

       <td>AAM13258</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g65920 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class IV</td>
       <td>AtPUB32</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3g49060 target="new">AT3g49060</A></td>

       <td>AAK91387</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g49060 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class IV</td>
       <td>AtPUB33</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2g45910 target="new">AT2g45910</A></td>

       <td>AAC28534</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g45910 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">
       <td>Class IV</td>
       <td>AtPUB34</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2g19410 target="new">AT2g19410</A></td>

       <td>AAM14871</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g19410 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">
       <td>Class IV</td>
       <td>AtPUB35</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT4g25160 target="new">AT4g25160</A></td>

       <td>CAB79425</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25160 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">
       <td>Class V</td>
       <td>AtPUB36</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3g61390 target="new">AT3g61390</A></td>

       <td>AAO63431</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g61390 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class V</td>
       <td>AtPUB37</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2g45920 target="new">AT2g45920</A></td>

       <td>AAC28533</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g45920 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB38</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g65200 target="new">AT5g65200</A></td>

       <td>NP_201323</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g65200 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB39</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3g47820 target="new">AT3g47820</A></td>

       <td>AAM14040</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47820 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB40</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g40140 target="new">AT5g40140</A></td>

       <td>NP_198830</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g40140 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB41</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g62560 target="new">AT5g62560</A></td>

       <td>AAM91572</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g62560 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB42</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g68940 target="new">AT1g68940</A></td>

       <td>NP_177060</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g68940 target="new">hypothetical  protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB43</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g76390 target="new">AT1g76390</A></td>

       <td>NP_177765</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g76390 target="new">hypothetical  protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB44</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g20780 target="new">AT1g20780</A></td>

       <td>AAM20387</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g20780 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB45</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g27910 target="new">AT1g27910</A></td>

       <td>AAM19837</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g27910 target="new">hypothetical  protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB46</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g18320 target="new">AT5g18320</A></td>

       <td>NP_197333</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g18320 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB47 </td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g18330 target="new">AT5g18330</A></td>

       <td>NP_197334</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g18330 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB48</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g18340 target="new">AT5g18340</A></td>

       <td>NP_197335</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g18340 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class II</td>
       <td>AtPUB49</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g67530 target="new">AT5g67530</A></td>

       <td>AAN46760</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g67530 target="new">peptidylprolyl isomerase (cyclophilin)-like</A></td>

        </tr>
<tr class="alt">
       <td>Class IV</td>
       <td>AtPUB50</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g65500 target="new">AT5g65500</A></td>

       <td>NP_201353</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g65500 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class IV</td>
       <td>AtPUB51</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g61560 target="new">AT5g61560</A></td>

       <td>NP_200964</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g61560 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class IV</td>
       <td>AtPUB52</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g61550 target="new">AT5g61550</A></td>

       <td>NP_200963</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g61550 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class IV</td>
       <td>AtPUB53</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT5g51270 target="new">AT5g51270</A></td>

       <td>NP_199940</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g51270 target="new">putative protein</A></td>

        </tr>
<tr class="alt">
       <td>Class V</td>
       <td>AtPUB54 </td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g01680 target="new">AT1g01680</A></td>

       <td>NP_171674</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g01680 target="new">hypothetical  protein</A></td>

        </tr>
<tr class="alt">
       <td>Class V</td>
       <td>AtPUB55</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g01660 target="new">AT1g01660</A></td>

       <td>NP_171672</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g01660 target="new">hypothetical  protein</A></td>

        </tr>
<tr class="alt">
       <td>Class V</td>
       <td>AtPUB56 </td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g01670 target="new">AT1g01670</A></td>

       <td>NP_171673</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g01670 target="new">unknown protein</A></td>

        </tr>
<tr class="alt">
       <td>Class V</td>
       <td>AtPUB57</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g56030 target="new">AT1g56030</A></td>

       <td>NP_175999</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g56030 target="new">hypothetical  protein</A></td>

        </tr>
<tr class="alt">
       <td>Class V</td>
       <td>AtPUB58</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g56040 target="new">AT1g56040</A></td>

       <td>NP_176000</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g56040 target="new">hypothetical  protein</A></td>

        </tr>
<tr class="alt">
       <td>Class VI</td>
       <td>AtPUB59</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT1g04510 target="new">AT1g04510</A></td>

       <td>AAN13133</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g04510 target="new">putative pre-mRNA splicing factor PRP19</A></td>

        </tr>
<tr class="alt">
       <td>Class VI</td>
       <td>AtPUB60</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT2g33340 target="new">AT2g33340</A></td>

       <td>AAB80652</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g33340 target="new">putative PRP19-like spliceosomal protein</A></td>

        </tr>
<tr class="alt">
       <td>Class VII</td>
       <td>AtCHIP</td>

       <td><a href=/servlets/TairObject?type=locus&name=AT3g07370 target="new">AT3g07370</A></td>

       <td>NP_566305</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07370 target="new">CHIP-like protein</A></td>

        </tr>
</table><P>
<center>Last modified on Januray 16, 2004</center>     

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
