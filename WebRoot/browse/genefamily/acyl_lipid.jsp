<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Acyl Lipid Metabolism Gene Family";
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

<h2><i>Arabidopsis</i> Acyl Lipid Metabolism Gene Families</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
 <td><b>F. Beisson, A. J. K. Koo, S. Ruuska, J. Schwender, M. Pollard, J. Thelen, T. Paddock, J. Salas, L. Savage, A. Milcamps, V. B. Mhaske, Y. Cho and J. B. Ohlrogge. </b> <a href="/servlets/TairObject?type=publication&id=501706969">Arabidopsis thaliana Genes Involved in Acyl Lipid Metabolism. A 2003 Census of the Candidates, a Study of the Distribution of Expressed Sequence Tags in Organs, and a Web-Based Database. </a>Plant Physiology <b>132:</b> 681-697 (2003)<br>
URL: <a href="http://www.plantbiology.msu.edu/lipids/genesurvey/index.htm">The Arabidopsis Lipid Gene Database</a></TD></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
    <td valign=top>Most of the genes have been found by sequence similarity and further processed by multiple alignment of protein sequences. Please refer to the paper and the URL above for more details.<br></td></tr>
<TR><TD valign=top><B>Contact:</b></td>
    <td><a href="/servlets/Community?action=view&type=person&communityID=612141" target=new><b>Fred Beisson</a></b><br>
        <a href="/servlets/Community?action=view&type=person&communityID=2760" target=new><b>John Ohlrogge</a></b</td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td><b>Plastidial Homomeric Acetyl-CoA Carboxylase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g36180 target="new">At1g36180</a></td>

       <td>NP_174850</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g36180 target="new">acetyl-CoA carboxylase -related
</a></td>

        </tr>
<tr class="alt"><td><b>Acyl-ACP Thioesterase FatA</b></td>

       <td>FatA1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g25110 target="new">At3g25110</a></td>

       <td>NP_189147</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g25110 target="new">acyl-(acyl carrier protein) thioesterase
</a></td>

        </tr>
<tr class="alt"><td><b></b></td>

       <td>FatA2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g13050 target="new">At4g13050</a></td>

       <td>NP_193041</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g13050 target="new">oleoyl-(acyl-carrier-protein) hydrolase-related protein
</a></td>

        </tr>
<tr class="alt"><td><b>Acyl-ACP Thioesterase FatB</b></td>

       <td>FatB</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g08510 target="new">At1g08510</a></td>

       <td>NP_172327</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08510 target="new">acyl-(acyl carrier protein) thioesterase -related
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Pyruvate Dehydrogenase E1 alpha subunit</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g01090 target="new">At1g01090</a></td>

       <td>NP_171617</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01090 target="new">pyruvate dehydrogenase E1 alpha subunit
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g24180 target="new">At1g24180</a></td>

       <td>NP_173828</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24180 target="new">pyruvate dehydrogenase E1 alpha subunit
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Pyruvate Dehydrogenase E1 beta subunit</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g30120 target="new">At1g30120</a></td>

       <td>NP_174304</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30120 target="new">pyruvate dehydrogenase E1 beta subunit -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g34590 target="new">At2g34590</a></td>

       <td>NP_181006</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34590 target="new">pyruvate dehydrogenase E1 beta subunit -related
</a></td>

        </tr>
<tr class="alt"><td><b>"Plastidial Dihydrolipoamide Acetyltransferase, pyruvate DH complex"</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g34430 target="new">At1g34430</a></td>

       <td>NP_174703</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34430 target="new">dihydrolipoamide S-acetyltransferase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g54220 target="new">At1g54220</a></td>

       <td>NP_564654</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54220 target="new">dihydrolipoamide S-acetyltransferase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g13930 target="new">At3g13930</a></td>

       <td>NP_566470</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13930 target="new">acetyltransferase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g25860 target="new">At3g25860</a></td>

       <td>NP_189215</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g25860 target="new">dihydrolipoamide S-acetyltransferase
</a></td>

        </tr>
<tr class="alt"><td><b>"Plastidial Dihydrolipoamide Dehydrogenase, pyruvate DH complex"</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g16950 target="new">At3g16950</a></td>

       <td>NP_566562</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16950 target="new">"dihydrolipoamide dehydrogenase 1, plastidic (lipoamide dehydrogenase 1) (ptlpd1)"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g16155 target="new">At4g16155</a></td>

       <td>NP_567487</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g16155 target="new">"dihydrolipoamide dehydrogenase 2, plastidic (lipoamide dehydrogenase 2) (ptlpd2)"
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Lipoate Synthase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g08410 target="new">At5g08410</a></td>

       <td>NP_568195</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g08410 target="new">lipoic acid synthase -related
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Lipoyltransferase</b></td>

       <td>Lip2p</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g31050 target="new">At4g31050</a></td>

       <td>NP_567866</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g31050 target="new">LIP2p lipoyltransferase
</a></td>

        </tr>
<tr class="alt"><td><b>"Acetyl-CoA carboxylase, alpha-carboxyltransferase "</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g38040 target="new">At2g38040</a></td>

       <td>NP_850291</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38040 target="new">alpha-carboxyltransferase -related
</a></td>

        </tr>
<tr class="alt"><td><b>"Acetyl-CoA carboxylase, beta-carboxyltransferase"</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=AtCg00500 target="new">AtCg00500</a></td>

       <td>NA</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AtCg00500 target="new">carboxytransferase beta subunit
</a></td>

        </tr>
<tr class="alt"><td><b>"Acetyl-CoA carboxylase, biotin carboxyl carrier protein"</b></td>

       <td>BCCP2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g15530 target="new">At5g15530</a></td>

       <td>NP_568316</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g15530 target="new">biotin carboxyl carrier protein 2 (BCCP2)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td>BCCP1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g16390 target="new">At5g16390</a></td>

       <td>NP_197143</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g16390 target="new">biotin carboxyl carrier protein 1 (BCCP1)
</a></td>

        </tr>
<tr class="alt"><td><b>"Acetyl-CoA carboxylase, biotin carboxylase"</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g35360 target="new">At5g35360</a></td>

       <td>NP_198386</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g35360 target="new">acetyl-CoA carboxylase
</a></td>

        </tr>
<tr class="alt"><td><b>Malonyl-CoA : ACP Malonyltransferase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g30200 target="new">At2g30200</a></td>

       <td>NP_565697</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30200 target="new">malonyl-CoA:Acyl carrier protein transacylase -related
</a></td>

        </tr>
<tr class="alt"><td><b>Ketoacyl-ACP Synthase I</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g46290 target="new">At5g46290</a></td>

       <td>NP_199441</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g46290 target="new">3-oxoacyl-(acyl-carrier-protein) synthase I precursor (beta-ketoacyl-acp synthase I) (KAS I) (sp|P52410)
</a></td>

        </tr>
<tr class="alt"><td><b>Ketoacyl-ACP Synthase II</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g74960 target="new">At1g74960</a></td>

       <td>NP_849888</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74960 target="new">3-ketoacyl-ACP synthase -related
</a></td>

        </tr>
<tr class="alt"><td><b>Ketoacyl-ACP Synthase III</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g62640 target="new">At1g62640</a></td>

       <td>NP_176452</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g62640 target="new">3-ketoacyl-acyl carrier protein synthase III (KAS III)
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Ketoacyl-ACP Reductase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g24360 target="new">At1g24360</a></td>

       <td>NP_564216</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24360 target="new">3-oxoacyl-(acyl-carrier protein) reductase
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g62610 target="new">At1g62610</a></td>

       <td>NP_176449</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g62610 target="new">short-chain dehydrogenase/reductase family protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g46170 target="new">At3g46170</a></td>

       <td>NP_190203</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g46170 target="new">short-chain dehydrogenase/reductase family protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g55290 target="new">At3g55290</a></td>

       <td>NP_567019</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55290 target="new">short-chain dehydrogenase/reductase family protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g55310 target="new">At3g55310</a></td>

       <td>NP_191091</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55310 target="new">short-chain dehydrogenase/reductase family protein
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Hydroxyacyl-ACP Dehydrase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g22230 target="new">At2g22230</a></td>

       <td>NP_565528</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g22230 target="new">beta-hydroxyacyl-ACP dehydratase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g10160 target="new">At5g10160</a></td>

       <td>NP_196578</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g10160 target="new">beta-hydroxyacyl-ACP dehydratase family
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Enoyl-ACP Reductase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g05990 target="new">At2g05990</a></td>

       <td>NP_849940</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g05990 target="new">"enoyl-(acyl-carrier protein) reductase (NADH) (enr-A), putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Stearoyl-ACP Desaturase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g43800 target="new">At1g43800</a></td>

       <td>NP_175048</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g43800 target="new">"acyl-(acyl-carrier-protein) desaturase (stearoyl-ACP desaturase), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g43710 target="new">At2g43710</a></td>

       <td>NP_850400</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43710 target="new">acyl-(acyl-carrier-protein) desaturase (stearoyl-ACP desaturase)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g02610 target="new">At3g02610</a></td>

       <td>NP_186910</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02610 target="new">"acyl-(acyl-carrier-protein) desaturase (stearoyl-ACP desaturase), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g02620 target="new">At3g02620</a></td>

       <td>NP_186911</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02620 target="new">"acyl-(acyl-carrier-protein) desaturase (stearoyl-ACP desaturase), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g02630 target="new">At3g02630</a></td>

       <td>NP_186912</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02630 target="new">"acyl-(acyl-carrier-protein) desaturase (stearoyl-ACP desaturase), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g16230  target="new">At5g16230 </a></td>

       <td>NP_197127</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g16230  target="new">"acyl-[acyl-carrier-protein] desaturase (stearoyl-ACP desaturase), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g16240 target="new">At5g16240</a></td>

       <td>NP_197128</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g16240 target="new">"acyl-(acyl-carrier-protein) desaturase (stearoyl-ACP desaturase), putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Acyl Carrier Protein</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g54580 target="new">At1g54580</a></td>

       <td>NP_175860</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54580 target="new">"acyl carrier protein (ACP), chloroplast, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td>ACP3</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g54630 target="new">At1g54630</a></td>

       <td>NP_564663</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54630 target="new">"acyl carrier protein 3 (ACP), chloroplast"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td>ACP1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g05020 target="new">At3g05020</a></td>

       <td>NP_187153</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05020 target="new">"acyl carrier protein 1 (ACP), chloroplast"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g25050 target="new">At4g25050</a></td>

       <td>NP_194235</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g25050 target="new">acyl carrier protein family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g27200 target="new">At5g27200</a></td>

       <td>NP_198072</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27200 target="new">"acyl carrier protein, chloroplast, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Holo-ACP Synthase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g11470 target="new">At3g11470</a></td>

       <td>NP_187754</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g11470 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Dihydroxyacetone-Phosphate Reductase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g40610 target="new">At5g40610</a></td>

       <td>NP_198877</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40610 target="new">dihydroxyacetone 3-phosphate reductase (dhaprd)
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Phosphatidic Acid Phosphatase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g01180  target="new">At2g01180 </a></td>

       <td>NP_565255</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01180  target="new">phosphatidic acid phosphatase (PAP2) family
</a></td>

        </tr>
<tr class="alt"><td><b>Monogalactosyldiacylglycerol Synthase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g11810  target="new">At2g11810 </a></td>

       <td>NP_565352</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g11810  target="new">"1,2-diacylglycerol 3-beta-galactosyltransferase (UDP-galactose:diacylglycerol galactosyltransferase) (MGDG synthase) (MGD3), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g31780 target="new">At4g31780</a></td>

       <td>NP_849482</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g31780 target="new">"1,2-diacylglycerol 3-beta-galactosyltransferase (UDP-galactose:diacylglycerol galactosyltransferase) (MGDG synthase) (MGD1), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g20410 target="new">At5g20410</a></td>

       <td>NP_568394</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g20410 target="new">"1,2-diacylglycerol 3-beta-galactosyltransferase (UDP-galactose:diacylglycerol galactosyltransferase) (MGDG synthase) (MGD2), putative"
</a></td>

        </tr>
<tr class="alt"><td><b>"Monogalactosyldiacylglycerol Desaturase (palmitate-specific, FAD5)"</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g15850 target="new">At3g15850</a></td>

       <td>NP_566529</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g15850 target="new">fatty acid desaturase family protein
</a></td>

        </tr>
<tr class="alt"><td><b>Digalactosyldiacylglycerol Synthase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g11670 target="new">At3g11670</a></td>

       <td>NP_850561</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g11670 target="new">digalactosyldiacylglycerol synthase 1 (MGDG:MGDG galactosyltransferase) (galactolipid galactosyltransferase) (DGD1)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g00550 target="new">At4g00550</a></td>

       <td>NP_191964</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00550 target="new">UDP-galactose:MGDG galactosyltransferase (digalactosyldiacylglycerol synthase 2) (DGD2)
</a></td>

        </tr>
<tr class="alt"><td><b>Sulfolipid Biosynthesis Protein</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g33030 target="new">At4g33030</a></td>

       <td>NP_195029</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g33030 target="new">UDP-sulfoquinovose synthase (sulfite:UDP-glucose sulfotransferase) (sulfolipid biosynthesis protein) (SQD1)
</a></td>

        </tr>
<tr class="alt"><td><b>Sulfolipid Synthase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g01220 target="new">At5g01220</a></td>

       <td>NP_568085</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g01220 target="new">UDP-sulfoquinovose:DAG sulfoquinovosyltransferase (sulfolipid synthase) (SQD2)
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Glycerol-Phosphate Acyltransferase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g32200 target="new">At1g32200</a></td>

       <td>NP_849738</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32200 target="new">"glycerol-3-phosphate acyltransferase, chloroplast"
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial 1-acylglycerol-Phosphate Acyltransferase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g30580 target="new">At4g30580</a></td>

       <td>NP_194787</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g30580 target="new">phospholipid/glycerol acyltransferase family
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial CDP-Diacylglycerol Synthetase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g45150 target="new">At2g45150</a></td>

       <td>NP_566035</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g45150 target="new">phosphatidate cytidylyltransferase domain-containing protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g60620 target="new">At3g60620</a></td>

       <td>NP_191621</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g60620 target="new">phosphatidate cytidylyltransferase domain-containing protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g26770 target="new">At4g26770</a></td>

       <td>NP_194407</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g26770 target="new">"phosphatidate cytidylyltransferase, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Phosphatidylglycerol-Phosphate Synthase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g39290 target="new">At2g39290</a></td>

       <td>NP_181461</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39290 target="new">phosphatidylglycerolphosphate synthase (PGS1)
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Oleate Desaturase (FAD6)</b></td>

       <td>Fad6</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g30950 target="new">At4g30950</a></td>

       <td>NP_194824</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g30950 target="new">"omega-6 fatty acid desaturase, chloroplast (FAD6) (fadC) (delta-12 desaturase)"
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Linoleate Desaturase (FAD7/FAD8)</b></td>

       <td>Fad7</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g11170 target="new">At3g11170</a></td>

       <td>NP_187727</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g11170 target="new">"omega-3 fatty acid desaturase, chloroplast precursor (FAD7)"
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Linoleate Desaturase (FAD7/FAD8)</b></td>

       <td>Fad8</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g05580 target="new">At5g05580</a></td>

       <td>NP_196177</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g05580 target="new">"omega-3 fatty acid desaturase, chloroplast precursor (FAD8)"
</a></td>

        </tr>
<tr class="alt"><td><b>ER Dihydroxyacetone-Phosphate Reductase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g40690 target="new">At2g40690</a></td>

       <td>NP_565939</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40690 target="new">glycerol-3-phosphate dehydrogenase
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g41540 target="new">At2g41540</a></td>

       <td>NP_850352</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g41540 target="new">glycerol-3-phosphate dehydrogenase
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g07690 target="new">At3g07690</a></td>

       <td>NP_187426</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g07690 target="new">glycerol-3-phosphate dehydrogenase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g10370 target="new">At3g10370</a></td>

       <td>NP_187648</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g10370 target="new">"glycerol-3-phosphate dehydrogenase, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Phosphatidylinositol Synthase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g68000 target="new">At1g68000</a></td>

       <td>NP_176967</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68000 target="new">CDP-diacylglycerol--inositol 3-phosphatidyltransferase (phosphatidylinositol synthase) (PIS1)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g38570 target="new">At4g38570</a></td>

       <td>NP_195569</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g38570 target="new">"CDP-diacylglycerol--inositol 3-phosphatidyltransferase (phosphatidylinositol synthase) (PIS1), putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Choline Kinase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g34100 target="new">At1g34100</a></td>

       <td>NP_174672</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34100 target="new">choline kinase (GmCK2p) -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g71697 target="new">At1g71697</a></td>

       <td>NP_177315</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71697 target="new">choline kinase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g74320 target="new">At1g74320</a></td>

       <td>NP_177572</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74320 target="new">choline kinase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g09760 target="new">At4g09760</a></td>

       <td>NP_849350</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g09760 target="new">choline kinase GmCK2p -related protein
</a></td>

        </tr>
<tr class="alt"><td><b>Ethanolamine Kinase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g26830 target="new">At2g26830</a></td>

       <td>NP_180251</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26830 target="new">choline kinase -related
</a></td>

        </tr>
<tr class="alt"><td><b>CTP : Cholinephosphate Cytidylyltransferase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g32260 target="new">At2g32260</a></td>

       <td>NP_180785</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32260 target="new">"cholinephosphate cytidylyltransferase (phosphorylcholine transferase/CTP:phosphocholine cytidylyltransferase), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g15130 target="new">At4g15130</a></td>

       <td>NP_193249</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g15130 target="new">"cholinephosphate cytidylyltransferase (phosphorylcholine transferase/CTP:phosphocholine cytidylyltransferase), putative"
</a></td>

        </tr>
<tr class="alt"><td><b>CTP : Ethanolaminephosphate Cytidylyltransferase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g38670 target="new">At2g38670</a></td>

       <td>NP_181401</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38670 target="new">"ethanolamine-phosphate cytidylyltransferase (phosphorylethanolamine transferase/CTP:phosphoethanolamine cytidylyltransferase), putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Phosphatidylserine Decarboxylase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g16700  target="new">At4g16700 </a></td>

       <td>NP_193403</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g16700  target="new">phosphatidylserine decarboxylase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g25970 target="new">At4g25970</a></td>

       <td>NP_567736</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g25970 target="new">"phosphatidylserine decarboxylase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g57190  target="new">At5g57190 </a></td>

       <td>NP_200529</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g57190  target="new">"phosphatidylserine decarboxylase, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Base-Exchange Enzyme</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g15110 target="new">At1g15110</a></td>

       <td>NP_172963</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15110 target="new">phosphatidylserine synthase -related
</a></td>

        </tr>
<tr class="alt"><td><b>Serine Palmitoyltransferase (LCB1 subunit)</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g36480 target="new">At4g36480</a></td>

       <td>NP_568005</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g36480 target="new">serine C-palmitoyltransferase family
</a></td>

        </tr>
<tr class="alt"><td><b>Serine Palmitoyltransferase (LCB2 subunit)</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g48780 target="new">At3g48780</a></td>

       <td>NP_190447</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g48780 target="new">"serine C-palmitoyltransferase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g23670 target="new">At5g23670</a></td>

       <td>NP_197756</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g23670 target="new">"serine C-palmitoyltransferase, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Ketosphinganine Reductase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g06060 target="new">At3g06060</a></td>

       <td>NP_187257</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06060 target="new">short-chain dehydrogenase/reductase family protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g19200 target="new">At5g19200</a></td>

       <td>NP_197421</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g19200 target="new">short-chain dehydrogenase/reductase family protein
</a></td>

        </tr>
<tr class="alt"><td><b>Sphingolipid Hydroxylase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g14290 target="new">At1g14290</a></td>

       <td>NP_563944</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14290 target="new">sterol desaturase domain-containing protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g69640 target="new">At1g69640</a></td>

       <td>NP_177122</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69640 target="new">"acid phosphatase, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Sphingolipid delta-8 Desaturase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g46210 target="new">At2g46210</a></td>

       <td>NP_182144</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46210 target="new">"delta-8 sphingolipid desaturase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g61580 target="new">At3g61580</a></td>

       <td>NP_191717</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g61580 target="new">delta-8 sphingolipid desaturase (SLD1)
</a></td>

        </tr>
<tr class="alt"><td><b>Sphingolipid Fatty Acid Hydroxylase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g34770 target="new">At2g34770</a></td>

       <td>NP_181023</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34770 target="new">fatty acid hydroxylase (FAH1)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g20870 target="new">At4g20870</a></td>

       <td>NP_193819</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g20870 target="new">"fatty acid hydroxylase, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Phosphoethanolamine N-Methyltransferase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g48600 target="new">At1g48600</a></td>

       <td>NP_175293</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48600 target="new">phosphoethanolamine N-methyltransferase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g73600 target="new">At1g73600</a></td>

       <td>NP_177501</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73600 target="new">phosphoethanolamine N-methyltransferase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g18000 target="new">At3g18000</a></td>

       <td>NP_188427</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g18000 target="new">"phosphoethanolamine N-methyltransferase, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Sphingolipid delta-4 Desaturase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g04930 target="new">At4g04930</a></td>

       <td>NP_192402</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g04930 target="new">fatty acid desaturase family protein
</a></td>

        </tr>
<tr class="alt"><td><b>ER 2-Lysophosphatidate Acyltransferase (LPAAT)</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g01610 target="new">At1g01610</a></td>

       <td>NP_171667</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01610 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g51260 target="new">At1g51260</a></td>

       <td>NP_175537</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51260 target="new">"acyl-CoA:1-acylglycerol-3-phosphate acyltransferase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g75020b target="new">At1g75020b</a></td>

       <td>NP_565098</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75020b target="new">phospholipid/glycerol acyltransferase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g78690 target="new">At1g78690</a></td>

       <td>NP_177990</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78690 target="new">phospholipid/glycerol acyltransferase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g80950 target="new">At1g80950</a></td>

       <td>NP_565249</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80950 target="new">phospholipid/glycerol acyltransferase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g27090 target="new">At2g27090</a></td>

       <td>NP_180277</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g27090 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g38110 target="new">At2g38110</a></td>

       <td>NP_181346</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38110 target="new">phospholipid/glycerol acyltransferase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g05510 target="new">At3g05510</a></td>

       <td>NP_566254</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05510 target="new">phospholipid/glycerol acyltransferase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g11430 target="new">At3g11430</a></td>

       <td>NP_187750</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g11430 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g18850  target="new">At3g18850 </a></td>

       <td>NP_188515</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g18850  target="new">phospholipid/glycerol acyltransferase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g57650 target="new">At3g57650</a></td>

       <td>NP_567052</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g57650 target="new">"acyl-CoA:1-acylglycerol-3-phosphate acyltransferase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g00400 target="new">At4g00400</a></td>

       <td>NP_191950</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00400 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g06090 target="new">At5g06090</a></td>

       <td>NP_196227</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g06090 target="new">phospholipid/glycerol acyltransferase family
</a></td>

        </tr>
<tr class="alt"><td><b>ER Phosphatidate Phosphatase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g15080 target="new">At1g15080</a></td>

       <td>NP_172961</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15080 target="new">phosphatidic acid phosphatase (PAP2) family
</a></td>

        </tr>
<tr class="alt"><td><b>Diacylglycerol Cholinephosphotransferase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g25585 target="new">At3g25585</a></td>

       <td>NP_850744</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g25585 target="new">"aminoalcoholphosphotransferase, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>ER Oleate Desaturase</b></td>

       <td>Fad2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g12120 target="new">At3g12120</a></td>

       <td>NP_187819</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g12120 target="new">"omega-6 fatty acid desaturase, endoplasmic reticulum (FAD2/delta-12 desaturase)"
</a></td>

        </tr>
<tr class="alt"><td><b>ER Linoleate Desaturase</b></td>

       <td>Fad3</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g29980 target="new">At2g29980</a></td>

       <td>NP_850139</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29980 target="new">"omega-3 fatty acid desaturase, endoplasmic reticulum (FAD3)"
</a></td>

        </tr>
<tr class="alt"><td><b>ER CDP-Diacylglycerol Synthetase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g62430 target="new">At1g62430</a></td>

       <td>NP_176433</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g62430 target="new">phosphatidate cytidylyltransferase (CDS)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g22340 target="new">At4g22340</a></td>

       <td>NP_193965</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g22340 target="new">"phosphatidate cytidylyltransferase, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>ER Phosphatidylglycerophosphate Synthase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g55030 target="new">At3g55030</a></td>

       <td>NP_191063</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55030 target="new">"phosphatidylglycerolphosphate synthase (PGS1), putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Acyl-Ceramide Synthase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g27480  target="new">At1g27480 </a></td>

       <td>NP_564286</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27480  target="new">lecithin:cholesterol acyltransferase (LACT) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g03310 target="new">At3g03310</a></td>

       <td>NP_566201</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g03310 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td><b>Mitochondrial Ketoacyl-ACP Synthase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g04540 target="new">At2g04540</a></td>

       <td>NP_178533</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g04540 target="new">3-oxoacyl carrier protein synthase
</a></td>

        </tr>
<tr class="alt"><td><b>"alpha-Ketoacid Decarboxylase E1 alpha subunit, branched chain alpha-ketoacid dehydrogenase complex"</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g21400 target="new">At1g21400</a></td>

       <td>NP_173562</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g21400 target="new">branched-chain alpha keto-acid dehydrogenase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g09300 target="new">At5g09300</a></td>

       <td>NP_568209</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g09300 target="new">branched-chain alpha keto-acid dehydrogenase E1 alpha subunit-related protein
</a></td>

        </tr>
<tr class="alt"><td><b>"alpha-Ketoacid Decarboxylase E1 beta subunit, branched chain alpha-ketoacid dehydrogenase complex"</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g55510 target="new">At1g55510</a></td>

       <td>NP_175947</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55510 target="new">branched-chain alpha-keto acid decarboxylase E1 beta subunit
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g13450 target="new">At3g13450</a></td>

       <td>NP_187954</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13450 target="new">branched chain alpha-keto acid dehydrogenase E1 beta subunit
</a></td>

        </tr>
<tr class="alt"><td><b>"Dihydrolipoamide Transacylase, branched chain alpha-ketoacid dehydrogenase complex"</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g06850 target="new">At3g06850</a></td>

       <td>NP_850527</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06850 target="new">branched chain alpha-keto acid dehydrogenase E2 subunit
</a></td>

        </tr>
<tr class="alt"><td><b>"Mitochondrial Dihydrolipoamide Dehydrogenase, branched chain alpha-ketoacid dehydrogenase complex"</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g48030 target="new">At1g48030</a></td>

       <td>NP_849782</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48030 target="new">"dihydrolipoamide dehydrogenase, mitochondrial (lipoamide dehydrogenase) (mtlpd1)"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g17240 target="new">At3g17240</a></td>

       <td>NP_851005</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g17240 target="new">"dihydrolipoamide dehydrogenase 2, mitochondrial (lipoamide dehydrogenase 2) (mtlpd2)"
</a></td>

        </tr>
<tr class="alt"><td><b>Isovaleryl-CoA Dehydrogenase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g45300 target="new">At3g45300</a></td>

       <td>NP_190116</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g45300 target="new">isovaleryl-CoA-dehydrogenase precursor (IVD)
</a></td>

        </tr>
<tr class="alt"><td><b>"Methylcrotonyl-CoA Carboxylase, biotinylated subunit"</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g03090 target="new">At1g03090</a></td>

       <td>NP_849583</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g03090 target="new">3-methylcrotonyl-CoA carboxylase -related
</a></td>

        </tr>
<tr class="alt"><td><b>"Methylcrotonyl-CoA Carboxylase, non-biotinylated subunit"</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g34030 target="new">At4g34030</a></td>

       <td>NP_567950</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34030 target="new">3-methylcrotonyl-CoA carboxylase non-biotinylated subunit (MCCB)
</a></td>

        </tr>
<tr class="alt"><td><b>Mitochondrial Enoyl-CoA Hydratase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g60510 target="new">At3g60510</a></td>

       <td>NP_191610</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g60510 target="new">enoyl-CoA hydratase/isomerase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g31810 target="new">At4g31810</a></td>

       <td>NP_194909</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g31810 target="new">3-hydroxyisobutyryl-coenzyme A hydrolase (CoA-thioester hydrolase) family
</a></td>

        </tr>
<tr class="alt"><td><b>Mitochondrial Glycerol-Phosphate Acyltransferase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g02390 target="new">At1g02390</a></td>

       <td>NP_563651</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02390 target="new">phospholipid/glycerol acyltransferase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g06520 target="new">At1g06520</a></td>

       <td>NP_563768</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06520 target="new">phospholipid/glycerol acyltransferase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g01950 target="new">At4g01950</a></td>

       <td>NP_192104</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g01950 target="new">phospholipid/glycerol acyltransferase family
</a></td>

        </tr>
<tr class="alt"><td><b>Mitochondrial Phosphatidate Phosphatase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g02600 target="new">At3g02600</a></td>

       <td>NP_566177</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02600 target="new">phosphatidic acid phosphatase (PAP2) family
</a></td>

        </tr>
<tr class="alt"><td><b>Mitochondrial Acyl Carrier Protein</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g65290 target="new">At1g65290</a></td>

       <td>NP_176708</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65290 target="new">acyl carrier protein family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g44620 target="new">At2g44620</a></td>

       <td>NP_181990</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44620 target="new">"acyl carrier protein (ACP), mitochondrial"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g47630 target="new">At5g47630</a></td>

       <td>NP_199574</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g47630 target="new">acyl carrier protein family
</a></td>

        </tr>
<tr class="alt"><td><b>Mitochondrial Ketoacyl-ACP Reductase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g63380 target="new">At1g63380</a></td>

       <td>NP_176527</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g63380 target="new">short-chain dehydrogenase/reductase family protein
</a></td>

        </tr>
<tr class="alt"><td><b>Mitochondrial Lipoate Synthase</b></td>

       <td>Lip1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g20860 target="new">At2g20860</a></td>

       <td>NP_179682</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g20860 target="new">lipoic acid synthase (LIP1)
</a></td>

        </tr>
<tr class="alt"><td><b>Mitochondrial Lipoyltransferase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g04640 target="new">At1g04640</a></td>

       <td>NP_171958</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04640 target="new">lipoyltransferase
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g47580 target="new">At1g47580</a></td>

       <td>NP_175189</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g47580 target="new">hypothetical protein
</a></td>

        </tr>
<tr class="alt"><td><b>Mitochondrial Phosphatidylglycerol-Phosphate Synthase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g04870 target="new">At4g04870</a></td>

       <td>NP_567273</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g04870 target="new">CDP-alcohol phosphatidyltransferase family
</a></td>

        </tr>
<tr class="alt"><td><b>Mitochondrial Diacylglycerol Cholinephosphotransferase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g13560 target="new">At1g13560</a></td>

       <td>NP_172813</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g13560 target="new">aminoalcoholphosphotransferase
</a></td>

        </tr>
<tr class="alt"><td><b>Acyl-CoA : Diacylglycerol Acyltransferase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g19450  target="new">At2g19450 </a></td>

       <td>NP_179535</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19450  target="new">diacylglycerol O-acyltransferase (acyl CoA:diacylglycerol acyltransferase) (DGAT)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g51520 target="new">At3g51520</a></td>

       <td>NP_566952</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g51520 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td><b>Oil-body Oleosin</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g48990  target="new">At1g48990 </a></td>

       <td>NP_175329</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48990  target="new">glycine-rich protein / oleosin
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g25890 target="new">At2g25890</a></td>

       <td>NP_180160</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25890 target="new">oleosin
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g01570  target="new">At3g01570 </a></td>

       <td>NP_186806</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g01570  target="new">glycine-rich protein / oleosin
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g18570  target="new">At3g18570 </a></td>

       <td>NP_188487</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g18570  target="new">glycine-rich protein / oleosin
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g27660 target="new">At3g27660</a></td>

       <td>NP_189403</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g27660 target="new">oleosin
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g25140  target="new">At4g25140 </a></td>

       <td>NP_194244</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g25140  target="new">oleosin
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g40420  target="new">At5g40420 </a></td>

       <td>NP_198858</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40420  target="new">glycine-rich protein / oleosin
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g51210  target="new">At5g51210 </a></td>

       <td>NP_199934</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g51210  target="new">glycine-rich protein / oleosin
</a></td>

        </tr>
<tr class="alt"><td><b>Caleosin</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g23240 target="new">At1g23240</a></td>

       <td>NP_173738</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23240 target="new">pollen coat EF-hand protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g23250 target="new">At1g23250</a></td>

       <td>NP_173739</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23250 target="new">"Ca2+-binding EF-hand common family protein, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g70670 target="new">At1g70670</a></td>

       <td>NP_564995</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70670 target="new">"Ca2+-binding EF-hand common family protein, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g70680 target="new">At1g70680</a></td>

       <td>NP_564996</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70680 target="new">"Ca2+-binding EF-hand common family protein, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g33380 target="new">At2g33380</a></td>

       <td>NP_180896</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33380 target="new">RD20 protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g26740 target="new">At4g26740</a></td>

       <td>NP_194404</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g26740 target="new">embryo-specific protein 1 (ATS1)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55240 target="new">At5g55240</a></td>

       <td>NP_200335</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55240 target="new">embryo-specific protein 1 (ATS1)
</a></td>

        </tr>
<tr class="alt"><td><b>Phosphatidylcholine : Diacylglycerol Acyltransferase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g04010 target="new">At1g04010</a></td>

       <td>NP_171897</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04010 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g44830 target="new">At3g44830</a></td>

       <td>NP_190069</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g44830 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g13640 target="new">At5g13640</a></td>

       <td>NP_196868</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g13640 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td><b>Triacylglycerol Lipase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g10740 target="new">At1g10740</a></td>

       <td>NP_172544</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10740 target="new">lipase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g15230 target="new">At2g15230</a></td>

       <td>NP_179126</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15230 target="new">lipase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g18630 target="new">At5g18630</a></td>

       <td>NP_850848</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g18630 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g18640 target="new">At5g18640</a></td>

       <td>NP_197365</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g18640 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td><b>Fatty Acid Alcohol Oxidase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g03990 target="new">At1g03990</a></td>

       <td>NP_171895</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g03990 target="new">alcohol oxidase-related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g23410 target="new">At3g23410</a></td>

       <td>NP_566729</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g23410 target="new">alcohol oxidase-related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g19380 target="new">At4g19380</a></td>

       <td>NP_193673</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g19380 target="new">alcohol oxidase-related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g28570 target="new">At4g28570</a></td>

       <td>NP_194586</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g28570 target="new">alcohol oxidase-related
</a></td>

        </tr>
<tr class="alt"><td><b>Peroxisomal Long-Chain Acyl-CoA Synthetase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g05970 target="new">At3g05970</a></td>

       <td>NP_566265</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05970 target="new">"AMP-binding protein, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g27600 target="new">At5g27600</a></td>

       <td>NP_198112</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27600 target="new">"AMP-binding protein, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Peroxisomal Fatty Acid Acyl-CoA Transporter</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g39850 target="new">At4g39850</a></td>

       <td>NP_568072</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g39850 target="new">peroxisomal ABC transporter PXA1
</a></td>

        </tr>
<tr class="alt"><td><b>Monoacylglycerol Lipase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g11090 target="new">At1g11090</a></td>

       <td>NP_172576</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11090 target="new">"hydrolase, alpha/beta fold family"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g18360 target="new">At1g18360</a></td>

       <td>NP_173272</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18360 target="new">"hydrolase, alpha/beta fold family"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g52760 target="new">At1g52760</a></td>

       <td>NP_175685</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g52760 target="new">esterase/lipase/thioesterase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g73480 target="new">At1g73480</a></td>

       <td>NP_565066</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73480 target="new">"hydrolase, alpha/beta fold family"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g77420 target="new">At1g77420</a></td>

       <td>NP_177867</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77420 target="new">"hydrolase, alpha/beta fold family"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g39400 target="new">At2g39400</a></td>

       <td>NP_565903</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39400 target="new">"hydrolase, alpha/beta fold family"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g39410 target="new">At2g39410</a></td>

       <td>NP_850316</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39410 target="new">"hydrolase, alpha/beta fold family"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g39420 target="new">At2g39420</a></td>

       <td>NP_181474</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39420 target="new">esterase/lipase/thioesterase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g47630 target="new">At2g47630</a></td>

       <td>NP_566106</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47630 target="new">esterase/lipase/thioesterase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g55180 target="new">At3g55180</a></td>

       <td>NP_191078</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55180 target="new">esterase/lipase/thioesterase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g55190 target="new">At3g55190</a></td>

       <td>NP_191079</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55190 target="new">esterase/lipase/thioesterase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g11650 target="new">At5g11650</a></td>

       <td>NP_196726</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g11650 target="new">"hydrolase, alpha/beta fold family"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g16120 target="new">At5g16120</a></td>

       <td>NP_568327</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g16120 target="new">"hydrolase, alpha/beta fold family"
</a></td>

        </tr>
<tr class="alt"><td><b>Acyl-CoA Oxidase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g06290 target="new">At1g06290</a></td>

       <td>NP_172119</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06290 target="new">acyl-CoA oxidase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g06310 target="new">At1g06310</a></td>

       <td>NP_172120</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06310 target="new">acyl-CoA oxidase ACX3 -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g35690 target="new">At2g35690</a></td>

       <td>NP_181112</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g35690 target="new">acyl-CoA oxidase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g51840 target="new">At3g51840</a></td>

       <td>NP_190752</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g51840 target="new">acyl-coA dehydrogenase
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g16760 target="new">At4g16760</a></td>

       <td>NP_567513</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g16760 target="new">acyl-CoA oxidase like protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g65110 target="new">At5g65110</a></td>

       <td>NP_201316</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65110 target="new">acyl-CoA oxidase (gb|AAC13497.1)
</a></td>

        </tr>
<tr class="alt"><td><b>Peroxisomal Enoyl-CoA Hydratase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g60550 target="new">At1g60550</a></td>

       <td>NP_176255</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60550 target="new">"naphthoate synthase (DHNA synthetase), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g43280 target="new">At5g43280</a></td>

       <td>NP_199142</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g43280 target="new">enoyl-CoA hydratase/isomerase family
</a></td>

        </tr>
<tr class="alt"><td><b>Hydroxyacyl-CoA Dehydrogenase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g15290 target="new">At3g15290</a></td>

       <td>NP_188147</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g15290 target="new">"3-hydroxybutyryl-CoA dehydrogenase, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Ketoacyl-CoA thiolase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g04710 target="new">At1g04710</a></td>

       <td>NP_171965</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04710 target="new">"acetyl-CoA C-acyltransferase (3-ketoacyl-CoA thiolase), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g33150 target="new">At2g33150</a></td>

       <td>NP_180873</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33150 target="new">"acetyl-CoA C-acyltransferase (3-ketoacyl-CoA thiolase), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g48880 target="new">At5g48880</a></td>

       <td>NP_568704</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g48880 target="new">acetyl-CoA C-acyltransferase 1 (3-ketoacyl-CoA thiolase 1)
</a></td>

        </tr>
<tr class="alt"><td><b>Fatty Acid Multifunctional Protein</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g06860 target="new">At3g06860</a></td>

       <td>NP_187342</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06860 target="new">fatty acid multifunctional protein (AtMFP2)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g29010 target="new">At4g29010</a></td>

       <td>NP_194630</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g29010 target="new">abnormal inflorescence meristem 1 (fatty acid multifunctional protein) (AIM1)
</a></td>

        </tr>
<tr class="alt"><td><b>Dienoyl-CoA Reductase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g12800 target="new">At3g12800</a></td>

       <td>NP_187886</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g12800 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td><b>Hydroxyisobutyryl-CoA Hydrolase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g30650 target="new">At2g30650</a></td>

       <td>NP_180623</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30650 target="new">"3-hydroxyisobutyryl-coenzyme A hydrolase (CoA-thioester hydrolase) (CHY1), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g30660 target="new">At2g30660</a></td>

       <td>NP_180624</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30660 target="new">"3-hydroxyisobutyryl-coenzyme A hydrolase (CoA-thioester hydrolase) (CHY1), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g65940 target="new">At5g65940</a></td>

       <td>NP_201395</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65940 target="new">3-hydroxyisobutyryl-coenzyme A hydrolase (CoA-thioester hydrolase) (CHY1)
</a></td>

        </tr>
<tr class="alt"><td><b>Acyl-CoA Dehydrogenase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g06810 target="new">At3g06810</a></td>

       <td>NP_187337</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06810 target="new">acetyl-coA dehydrogenase -related
</a></td>

        </tr>
<tr class="alt"><td><b>Diacylglycerol Kinase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g18730 target="new">At2g18730</a></td>

       <td>NP_849980</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18730 target="new">diacylglycerol kinase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g20900 target="new">At2g20900</a></td>

       <td>NP_850007</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g20900 target="new">diacylglycerol kinase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g46090 target="new">At2g46090</a></td>

       <td>NP_566064</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46090 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g28130 target="new">At4g28130</a></td>

       <td>NP_194542</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g28130 target="new">diacylglycerol kinase (fragment) -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g30340 target="new">At4g30340</a></td>

       <td>NP_567845</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g30340 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g07920 target="new">At5g07920</a></td>

       <td>NP_196409</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07920 target="new">diacylglycerol kinase (ATDGK1)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g57690 target="new">At5g57690</a></td>

       <td>NP_200577</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g57690 target="new">diacylglycerol kinase-related protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g63770 target="new">At5g63770</a></td>

       <td>NP_201182</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g63770 target="new">diacylglycerol kinase
</a></td>

        </tr>
<tr class="alt"><td><b>Secretory Phospholipase A2</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g19690 target="new">At2g19690</a></td>

       <td>NP_179559</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19690 target="new">phospholipase A2 family protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g29070 target="new">At4g29070</a></td>

       <td>NP_567821</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g29070 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g29460 target="new">At4g29460</a></td>

       <td>NP_194675</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g29460 target="new">phospholipase A2 family protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g29470 target="new">At4g29470</a></td>

       <td>NP_194676</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g29470 target="new">phospholipase A2 family protein
</a></td>

        </tr>
<tr class="alt"><td><b>Cytosolic Phospholipase A2 </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g61850 target="new">At1g61850</a></td>

       <td>NP_176378</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61850 target="new">patatin family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g45880 target="new">At3g45880</a></td>

       <td>NP_190174</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g45880 target="new">phospholipase - like protein
</a></td>

        </tr>
<tr class="alt"><td><b>Lysophospholipase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g52700 target="new">At1g52700</a></td>

       <td>NP_175679</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g52700 target="new">hypothetical protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g64670 target="new">At1g64670</a></td>

       <td>NP_564837</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64670 target="new">"hydrolase, alpha/beta fold family"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g10840 target="new">At3g10840</a></td>

       <td>NP_187695</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g10840 target="new">"hydrolase, alpha/beta fold family"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g15650 target="new">At3g15650</a></td>

       <td>NP_188186</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g15650 target="new">lysophospholipase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g22300 target="new">At4g22300</a></td>

       <td>NP_193961</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g22300 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g14980 target="new">At5g14980</a></td>

       <td>NP_197002</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g14980 target="new">esterase/lipase/thioesterase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g17780 target="new">At5g17780</a></td>

       <td>NP_197280</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g17780 target="new">"hydrolase, alpha/beta fold family"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g19290 target="new">At5g19290</a></td>

       <td>NP_197430</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g19290 target="new">esterase/lipase/thioesterase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g20060 target="new">At5g20060</a></td>

       <td>NP_197506</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g20060 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td><b>DAD1-like Acylhydrolase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g05800 target="new">At1g05800</a></td>

       <td>NP_563748</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05800 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g06250 target="new">At1g06250</a></td>

       <td>NP_172115</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06250 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g06800 target="new">At1g06800</a></td>

       <td>NP_849603</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06800 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g30370 target="new">At1g30370</a></td>

       <td>NP_174326</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30370 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g51440 target="new">At1g51440</a></td>

       <td>NP_564590</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51440 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g30550 target="new">At2g30550</a></td>

       <td>NP_850148</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30550 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g31100 target="new">At2g31100</a></td>

       <td>NP_180668</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31100 target="new">"lipase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g31690 target="new">At2g31690</a></td>

       <td>NP_180727</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31690 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g42690 target="new">At2g42690</a></td>

       <td>NP_181797</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42690 target="new">"lipase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g44810 target="new">At2g44810</a></td>

       <td>NP_182008</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44810 target="new">defective in anther dehiscence1
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g16820 target="new">At4g16820</a></td>

       <td>NP_567515</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g16820 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g18550 target="new">At4g18550</a></td>

       <td>NP_193590</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18550 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td><b>Cytosolic Lipoxygenase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g55020 target="new">At1g55020</a></td>

       <td>NP_175900</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55020 target="new">lipoxygenase (LOX1)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g22400 target="new">At3g22400</a></td>

       <td>NP_188879</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g22400 target="new">"lipoxygenase (LOX), putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Lipoxygenase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g17420 target="new">At1g17420</a></td>

       <td>NP_564021</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17420 target="new">"lipoxygenase (LOX), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g67560 target="new">At1g67560</a></td>

       <td>NP_176923</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67560 target="new">lipoxygenase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g72520 target="new">At1g72520</a></td>

       <td>NP_177396</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72520 target="new">"lipoxygenase (LOX), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g45140 target="new">At3g45140</a></td>

       <td>NP_566875</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g45140 target="new">lipoxygenase (LOX2)
</a></td>

        </tr>
<tr class="alt"><td><b>Allene Oxide Synthase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g42650 target="new">At5g42650</a></td>

       <td>NP_199079</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g42650 target="new">allene oxide synthase / cytochrome P450 74A
</a></td>

        </tr>
<tr class="alt"><td><b>Allene Oxide Cyclase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g13280 target="new">At1g13280</a></td>

       <td>NP_172786</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g13280 target="new">allene oxide cyclase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g25760 target="new">At3g25760</a></td>

       <td>NP_189204</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g25760 target="new">allene oxide cyclase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g25770 target="new">At3g25770</a></td>

       <td>NP_566776</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g25770 target="new">allene oxide cyclase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g25780 target="new">At3g25780</a></td>

       <td>NP_566777</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g25780 target="new">allene oxide cyclase family
</a></td>

        </tr>
<tr class="alt"><td><b>Oxo-Phytodienoic Acid Reductase (OPR) </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g09400 target="new">At1g09400</a></td>

       <td>NP_172411</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09400 target="new">"12-oxophytodienoate reductase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g17990 target="new">At1g17990</a></td>

       <td>NP_173241</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17990 target="new">"12-oxophytodienoate reductase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g76680 target="new">At1g76680</a></td>

       <td>NP_177794</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76680 target="new">12-oxophytodienoate reductase (OPR1)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g76690 target="new">At1g76690</a></td>

       <td>NP_177795</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76690 target="new">12-oxophytodienoate reductase (OPR2)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g06050 target="new">At2g06050</a></td>

       <td>NP_178662</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g06050 target="new">12-oxophytodienoate reductase (OPR3)(DDE1)
</a></td>

        </tr>
<tr class="alt"><td><b>Hydroperoxide Lyase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g15440 target="new">At4g15440</a></td>

       <td>NP_193279</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g15440 target="new">hydroperoxide lyase (HPOL) like protein
</a></td>

        </tr>
<tr class="alt"><td><b>Phosphatidylinositol-3-Kinase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g60490  target="new">At1g60490 </a></td>

       <td>NP_176251</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60490  target="new">phosphatidylinositol 3-kinase (PI3K)
</a></td>

        </tr>
<tr class="alt"><td><b>Fatty Acid Amide Hydrolase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g08980 target="new">At1g08980</a></td>

       <td>NP_563831</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08980 target="new">amidase
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g07360 target="new">At5g07360</a></td>

       <td>NP_196353</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07360 target="new">amidase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g64440 target="new">At5g64440</a></td>

       <td>NP_201249</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g64440 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td><b>a-Dioxygenase-Peroxidase (involved in FA alpha-oxidation)</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g73680 target="new">At1g73680</a></td>

       <td>NP_177509</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73680 target="new">feebly-related protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g01420 target="new">At3g01420</a></td>

       <td>NP_186791</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g01420 target="new">feebly-related protein
</a></td>

        </tr>
<tr class="alt"><td><b>NAD+ Oxidoreductase (involved in FA alpha-oxidation)</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g54100 target="new">At1g54100</a></td>

       <td>NP_849807</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54100 target="new">"aldehyde dehydrogenase, putative (ALDH)"
</a></td>

        </tr>
<tr class="alt"><td><b>PTEN-like Phosphoinositide 3-Phosphatase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g19240 target="new">At3g19240</a></td>

       <td>NP_188555</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g19240 target="new">dem-related protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g50110 target="new">At3g50110</a></td>

       <td>NP_566929</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g50110 target="new">tyrosine phosphatase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g39400 target="new">At5g39400</a></td>

       <td>NP_198756</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g39400 target="new">PTEN -related protein
</a></td>

        </tr>
<tr class="alt"><td><b>Myotubularin-like Phosphoinositide 3-Phosphatase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g10550 target="new">At3g10550</a></td>

       <td>NP_187666</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g10550 target="new">myotubularin -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g04540 target="new">At5g04540</a></td>

       <td>NP_196074</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g04540 target="new">myotubularin - like protein
</a></td>

        </tr>
<tr class="alt"><td><b>Type II Phosphoinositide 5-Phosphatase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g05630 target="new">At1g05630</a></td>

       <td>NP_172054</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05630 target="new">"inositol 1,4,5-trisphosphate 5-phosphatase -related"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g65580 target="new">At1g65580</a></td>

       <td>NP_176736</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65580 target="new">hypothetical protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g31830 target="new">At2g31830</a></td>

       <td>NP_180742</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31830 target="new">inositol polyphosphate 5'-phosphatase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g43900 target="new">At2g43900</a></td>

       <td>NP_181918</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43900 target="new">inositol polyphosphate 5'-phosphatase family
</a></td>

        </tr>
<tr class="alt"><td><b>Sac domain-containing Phosphoinositide 5-Phosphatase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g17340 target="new">At1g17340</a></td>

       <td>NP_173177</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17340 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g22620 target="new">At1g22620</a></td>

       <td>NP_173676</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22620 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g14205 target="new">At3g14205</a></td>

       <td>NP_566481</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g14205 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g43220 target="new">At3g43220</a></td>

       <td>NP_189908</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g43220 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g51460 target="new">At3g51460</a></td>

       <td>NP_190714</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g51460 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g51830 target="new">At3g51830</a></td>

       <td>NP_190751</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g51830 target="new">transmembrane protein G5p (AtG5) -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g59770 target="new">At3g59770</a></td>

       <td>NP_191536</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g59770 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g20840 target="new">At5g20840</a></td>

       <td>NP_197584</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g20840 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g66020 target="new">At5g66020</a></td>

       <td>NP_201403</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g66020 target="new">hypothetical protein
</a></td>

        </tr>
<tr class="alt"><td><b>Patatin-like Acyl-Hydrolase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g33270 target="new">At1g33270</a></td>

       <td>NP_174597</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g33270 target="new">patatin-related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g26560 target="new">At2g26560</a></td>

       <td>NP_180224</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26560 target="new">"patatin, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g39220 target="new">At2g39220</a></td>

       <td>NP_181455</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39220 target="new">patatin family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g54950 target="new">At3g54950</a></td>

       <td>NP_191055</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g54950 target="new">patatin-related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g57140 target="new">At3g57140</a></td>

       <td>NP_191273</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g57140 target="new">patatin-related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g63200 target="new">At3g63200</a></td>

       <td>NP_567142</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g63200 target="new">patatin-related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g29800 target="new">At4g29800</a></td>

       <td>NP_194709</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g29800 target="new">patatin-related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g37050 target="new">At4g37050</a></td>

       <td>NP_195422</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g37050 target="new">"patatin, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g37060 target="new">At4g37060</a></td>

       <td>NP_195423</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g37060 target="new">"patatin, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g37070 target="new">At4g37070</a></td>

       <td>NP_849511</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g37070 target="new">"patatin, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g04040 target="new">At5g04040</a></td>

       <td>NP_196024</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g04040 target="new">patatin-related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g43590 target="new">At5g43590</a></td>

       <td>NP_199172</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g43590 target="new">"patatin, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Diacylglycerol Pyrophosphate Phosphatase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g18220 target="new">At3g18220</a></td>

       <td>NP_566602</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g18220 target="new">phosphatidic acid phosphatase (PAP2) family
</a></td>

        </tr>
<tr class="alt"><td><b>Phosphatidylinositol-4-Kinase a</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g49340 target="new">At1g49340</a></td>

       <td>NP_850960</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g49340 target="new">phosphatidylinositol 3- and 4-kinase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g51040  target="new">At1g51040 </a></td>

       <td>NP_175516</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51040  target="new">"phosphatidylinositol 4-kinase, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Phosphatidylinositol-4-Kinase b</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g09350   target="new">At5g09350  </a></td>

       <td>NP_196497</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g09350   target="new">"phosphatidylinositol 4-kinase (PI4K), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g64070  target="new">At5g64070 </a></td>

       <td>NP_201212</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g64070  target="new">phosphatidylinositol 4-kinase (PI4K)
</a></td>

        </tr>
<tr class="alt"><td><b>Phosphatidylinositol-4-Kinase g</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g13640 target="new">At1g13640</a></td>

       <td>NP_563930</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g13640 target="new">phosphatidylinositol 3- and 4-kinase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g26270 target="new">At1g26270</a></td>

       <td>NP_564242</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26270 target="new">phosphatidylinositol 3- and 4-kinase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g64460+At1g64470 target="new">At1g64460+At1g64470</a></td>

       <td>NP_176627+ NP_176628</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64460+At1g64470 target="new">phosphatidylinositol 3- and 4-kinase family + ubiquitin family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g03890 target="new">At2g03890</a></td>

       <td>NP_565307</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g03890 target="new">phosphatidylinositol 3- and 4-kinase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g40850 target="new">At2g40850</a></td>

       <td>NP_181617</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40850 target="new">phosphatidylinositol 3- and 4-kinase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g46500 target="new">At2g46500</a></td>

       <td>NP_566076</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46500 target="new">ubiquitin family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g56600 target="new">At3g56600</a></td>

       <td>NP_191219</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g56600 target="new">phosphatidylinositol 3- and 4-kinase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g24240 target="new">At5g24240</a></td>

       <td>NP_197812</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g24240 target="new">ubiquitin family
</a></td>

        </tr>
<tr class="alt"><td><b>Phosphatidylinositol Phosphate Kinase type I/II A</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g01460 target="new">At1g01460</a></td>

       <td>NP_171653</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01460 target="new">"4,5 PIP kinase -related"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g01190 target="new">At4g01190</a></td>

       <td>NP_192028</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g01190 target="new">phosphatidylinositol kinase -related
</a></td>

        </tr>
<tr class="alt"><td><b>Phosphatidylinositol Phosphate Kinase type I/II B</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g10900 target="new">At1g10900</a></td>

       <td>NP_172559</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10900 target="new">phosphatidylinositol-4-phosphate 5-kinase isolog
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g21980 target="new">At1g21980</a></td>

       <td>NP_173617</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g21980 target="new">phosphatidylinositol-4-phosphate 5-kinase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g60890 target="new">At1g60890</a></td>

       <td>NP_176286</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60890 target="new">phosphatidylinositol-4-phosphate 5-kinase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g77740 target="new">At1g77740</a></td>

       <td>NP_177897</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77740 target="new">phosphatidylinositol-4-phosphate-5-kinase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g26420 target="new">At2g26420</a></td>

       <td>NP_180210</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26420 target="new">phosphatidylinositol-4-phosphate 5-kinase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g41210 target="new">At2g41210</a></td>

       <td>NP_181654</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g41210 target="new">phosphatidylinositol-4-phosphate 5-kinase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g07960 target="new">At3g07960</a></td>

       <td>NP_187453</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g07960 target="new">phosphatidylinositol-4-phosphate 5-kinase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g09920 target="new">At3g09920</a></td>

       <td>NP_187603</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g09920 target="new">phosphatidylinositol-4-phosphate 5-kinase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g56960 target="new">At3g56960</a></td>

       <td>NP_191255</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g56960 target="new">phosphatidylinositol-4-phosphate 5-kinase-related protein
</a></td>

        </tr>
<tr class="alt"><td><b>Phosphatidylinositol Phosphate Kinase type III</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g34260 target="new">At1g34260</a></td>

       <td>NP_174686</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34260 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g71010 target="new">At1g71010</a></td>

       <td>NP_177257</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71010 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g14270 target="new">At3g14270</a></td>

       <td>NP_188044</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g14270 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g33240 target="new">At4g33240</a></td>

       <td>NP_195050</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g33240 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td><b>PI-specific Phospholipase C</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g40116 target="new">At2g40116</a></td>

       <td>NP_850327</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40116 target="new">phosphoinositide specific phospholipase C(AtPLC2) -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g08510 target="new">At3g08510</a></td>

       <td>NP_187464</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g08510 target="new">phosphoinositide specific phospholipase C(AtPLC2)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g47220 target="new">At3g47220</a></td>

       <td>NP_190306</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47220 target="new">"1-phosphatidylinositol-4,5-bisphosphate phosphodiesterase-related protein"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g47290 target="new">At3g47290</a></td>

       <td>NP_190313</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47290 target="new">"1-phosphatidylinositol-4,5-bisphosphate phosphodiesterase"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g55940 target="new">At3g55940</a></td>

       <td>NP_191153</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55940 target="new">"phosphoinositide specific phospholipase C, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g38530 target="new">At4g38530</a></td>

       <td>NP_195565</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g38530 target="new">phosphoinositide-specific phospholipase C
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g58670 target="new">At5g58670</a></td>

       <td>NP_568881</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58670 target="new">phosphoinositide specific phospholipase C
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g58690 target="new">At5g58690</a></td>

       <td>NP_200677</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58690 target="new">"phosphoinositide-specific phospholipase C, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g58700 target="new">At5g58700</a></td>

       <td>NP_200678</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58700 target="new">phosphoinositide-specific phospholipase - like protein
</a></td>

        </tr>
<tr class="alt"><td><b>Non specific Phospholipase C</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g07230 target="new">At1g07230</a></td>

       <td>NP_172203</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07230 target="new">phosphoesterase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g26870 target="new">At2g26870</a></td>

       <td>NP_180255</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26870 target="new">phosphoesterase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g03520 target="new">At3g03520</a></td>

       <td>NP_187002</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g03520 target="new">phosphoesterase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g03530 target="new">At3g03530</a></td>

       <td>NP_566206</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g03530 target="new">phosphoesterase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g03540 target="new">At3g03540</a></td>

       <td>NP_566207</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g03540 target="new">phosphoesterase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g48610 target="new">At3g48610</a></td>

       <td>NP_190430</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g48610 target="new">phosphoesterase family
</a></td>

        </tr>
<tr class="alt"><td><b>GPI-specific Phospholipase C</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g34920 target="new">At4g34920</a></td>

       <td>NP_195218</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34920 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g34930 target="new">At4g34930</a></td>

       <td>NP_195219</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34930 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g38690 target="new">At4g38690</a></td>

       <td>NP_195581</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g38690 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td><b>Phospholipase D alpha</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g52570 target="new">At1g52570</a></td>

       <td>NP_175666</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g52570 target="new">"phospholipase D, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g55180 target="new">At1g55180</a></td>

       <td>NP_175914</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55180 target="new">"phospholipase D, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g15730 target="new">At3g15730</a></td>

       <td>NP_188194</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g15730 target="new">"Phospholipase D, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g25370 target="new">At5g25370</a></td>

       <td>NP_197919</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g25370 target="new">"phospholipase D, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Phospholipase D beta</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g42010 target="new">At2g42010</a></td>

       <td>NP_565963</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42010 target="new">phospholipase D (PLDbeta)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g00240 target="new">At4g00240</a></td>

       <td>NP_567160</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00240 target="new">phospholipase D -related
</a></td>

        </tr>
<tr class="alt"><td><b>Other Phospholipase D gamma</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g11830 target="new">At4g11830</a></td>

       <td>NP_849539</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11830 target="new">"phospholipase D-gamma, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g11840 target="new">At4g11840</a></td>

       <td>NP_192921</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11840 target="new">"phospholipase D-gamma, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g11850 target="new">At4g11850</a></td>

       <td>NP_192922</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11850 target="new">"phospholipase D-gamma, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Other Phospholipase D sigma</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g35790 target="new">At4g35790</a></td>

       <td>NP_849501</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g35790 target="new">phospholipase D -related
</a></td>

        </tr>
<tr class="alt"><td><b>Other Phospholipase D zeta</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g05630 target="new">At3g05630</a></td>

       <td>NP_187214</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05630 target="new">phospholipase D family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g16785 target="new">At3g16785</a></td>

       <td>NP_188302</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16785 target="new">phospholipase D zeta1 (5' fragment)
</a></td>

        </tr>
<tr class="alt"><td><b>Phospholipase A1 </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g31480 target="new">At1g31480</a></td>

       <td>NP_174433</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31480 target="new">shoot gravitropism 2
</a></td>

        </tr>
<tr class="alt"><td><b>Phospholipase A2-activating Protein</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g18860 target="new">At3g18860</a></td>

       <td>NP_850612</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g18860 target="new">transducin / WD-40 repeat protein family
</a></td>

        </tr>
<tr class="alt"><td><b>Ketoacyl-CoA Synthase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g01120 target="new">At1g01120</a></td>

       <td>NP_171620</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01120 target="new">fatty acid elongase 3-ketoacyl-CoA synthase 1 (KCS1)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g04220 target="new">At1g04220</a></td>

       <td>NP_171918</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04220 target="new">"beta-ketoacyl-CoA synthase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g07720 target="new">At1g07720</a></td>

       <td>NP_172251</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07720 target="new">beta-ketoacyl-CoA synthase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g49070 target="new">At5g49070</a></td>

       <td>NP_199718</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49070 target="new">beta-ketoacyl-CoA synthase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g19440 target="new">At1g19440</a></td>

       <td>NP_173376</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19440 target="new">"very-long-chain fatty acid condensing enzyme (CUT1), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g25450 target="new">At1g25450</a></td>

       <td>NP_173916</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g25450 target="new">"very-long-chain fatty acid condensing enzyme (CUT1), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td>Cut1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g68530 target="new">At1g68530</a></td>

       <td>NP_849861</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68530 target="new">very-long-chain fatty acid condensing enzyme (CUT1)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g71160 target="new">At1g71160</a></td>

       <td>NP_177272</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71160 target="new">beta-ketoacyl-CoA synthase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g15090 target="new">At2g15090</a></td>

       <td>NP_179113</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15090 target="new">"fatty acid elongase 1 (FAE1), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g16280 target="new">At2g16280</a></td>

       <td>NP_179223</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16280 target="new">"very-long-chain fatty acid condensing enzyme (CUT1), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td>Fdh</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g26250 target="new">At2g26250</a></td>

       <td>NP_180193</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26250 target="new">beta-ketoacyl-CoA synthase family (FIDDLEHEAD) (FDH)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g26640 target="new">At2g26640</a></td>

       <td>NP_180232</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26640 target="new">"beta-ketoacyl-CoA synthase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g28630 target="new">At2g28630</a></td>

       <td>NP_180431</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28630 target="new">beta-ketoacyl-CoA synthase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td>Kcs1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g46720 target="new">At2g46720</a></td>

       <td>NP_182195</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46720 target="new">"fatty acid elongase 3-ketoacyl-CoA synthase 1 (KCS1), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g52160 target="new">At3g52160</a></td>

       <td>NP_190784</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g52160 target="new">beta-ketoacyl-CoA synthase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g34250 target="new">At4g34250</a></td>

       <td>NP_195151</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34250 target="new">"fatty acid elongase 1 (FAE1), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g34510 target="new">At4g34510</a></td>

       <td>NP_195177</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34510 target="new">"fatty acid elongase 1 (FAE1), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td>Fae</td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g34520 target="new">At4g34520</a></td>

       <td>NP_195178</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34520 target="new">fatty acid elongase 1 (FAE1)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g04530 target="new">At5g04530</a></td>

       <td>NP_196073</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g04530 target="new">beta-ketoacyl-CoA synthase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g43760 target="new">At5g43760</a></td>

       <td>NP_199189</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g43760 target="new">"beta-ketoacyl-CoA synthase, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Fatty Acid omega Hydroxylase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g01280 target="new">At1g01280</a></td>

       <td>NP_171635</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01280 target="new">cytochrome P450 family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g01600 target="new">At1g01600</a></td>

       <td>NP_171666</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01600 target="new">"cytochrome P450, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g63710 target="new">At1g63710</a></td>

       <td>NP_176558</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g63710 target="new">"cytochrome P450, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g45970 target="new">At2g45970</a></td>

       <td>NP_182121</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g45970 target="new">"cytochrome P450, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g00360  target="new">At4g00360 </a></td>

       <td>NP_191946</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00360  target="new">"cytochrome p450, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g09970  target="new">At5g09970 </a></td>

       <td>NP_196559</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g09970  target="new">cytochrome p450 family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g58860 target="new">At5g58860</a></td>

       <td>NP_200694</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58860 target="new">cytochrome P450 86A1
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g63450 target="new">At5g63450</a></td>

       <td>NP_201150</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g63450 target="new">"cytochrome P450, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Ketoacyl-CoA Reductase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g24470 target="new">At1g24470</a></td>

       <td>NP_173856</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24470 target="new">short-chain dehydrogenase/reductase family protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g67730 target="new">At1g67730</a></td>

       <td>NP_564905</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67730 target="new">"short chain dehydrogenase/reductase family protein (b-keto acyl reductase, putative)"
</a></td>

        </tr>
<tr class="alt"><td><b>Enoyl-CoA Reductase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g55360 target="new">At3g55360</a></td>

       <td>NP_191096</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55360 target="new">3-oxo-5-alpha-steroid 4-dehydrogenase (steroid 5-alpha-reductase) family
</a></td>

        </tr>
<tr class="alt"><td><b>Alcohol-forming Fatty Acyl-Coenzyme A Reductase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g11980 target="new">At3g11980</a></td>

       <td>NP_187805</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g11980 target="new">male sterility protein 2 (MS2)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g44540 target="new">At3g44540</a></td>

       <td>NP_190040</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g44540 target="new">acyl CoA reductase - protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g44550 target="new">At3g44550</a></td>

       <td>NP_190041</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g44550 target="new">acyl CoA reductase -related protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g44560 target="new">At3g44560</a></td>

       <td>NP_190042</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g44560 target="new">acyl CoA reductase -related protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g56700 target="new">At3g56700</a></td>

       <td>NP_191229</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g56700 target="new">hypothetical protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g33790 target="new">At4g33790</a></td>

       <td>NP_567936</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g33790 target="new">male sterility 2-related protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g22420 target="new">At5g22420</a></td>

       <td>NP_197634</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g22420 target="new">acyl CoA reductase-related protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g22500 target="new">At5g22500</a></td>

       <td>NP_197642</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g22500 target="new">male sterility 2-related protein (emb|CAA68191.1)
</a></td>

        </tr>
<tr class="alt"><td><b>Wax Synthase </b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g34490 target="new">At1g34490</a></td>

       <td>NP_174708</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34490 target="new">long-chain-alcohol O-fatty-acyltransferase (wax synthase) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g34500 target="new">At1g34500</a></td>

       <td>NP_174709</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34500 target="new">long-chain-alcohol O-fatty-acyltransferase (wax synthase) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g34520 target="new">At1g34520</a></td>

       <td>NP_174711</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34520 target="new">long-chain-alcohol O-fatty-acyltransferase (wax synthase) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g51970 target="new">At3g51970</a></td>

       <td>NP_190765</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g51970 target="new">long-chain-alcohol O-fatty-acyltransferase (wax synthase) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g51420 target="new">At5g51420</a></td>

       <td>NP_199955</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g51420 target="new">long-chain-alcohol O-fatty-acyltransferase (wax synthase) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55320 target="new">At5g55320</a></td>

       <td>NP_200343</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55320 target="new">long-chain-alcohol O-fatty-acyltransferase (wax synthase) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55330 target="new">At5g55330</a></td>

       <td>NP_200344</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55330 target="new">long-chain-alcohol O-fatty-acyltransferase (wax synthase) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55340 target="new">At5g55340</a></td>

       <td>NP_200345</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55340 target="new">long-chain-alcohol O-fatty-acyltransferase (wax synthase) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55350 target="new">At5g55350</a></td>

       <td>NP_200346</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55350 target="new">long-chain-alcohol O-fatty-acyltransferase (wax synthase) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55360 target="new">At5g55360</a></td>

       <td>NP_200347</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55360 target="new">long-chain-alcohol O-fatty-acyltransferase (wax synthase) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55370 target="new">At5g55370</a></td>

       <td>NP_200348</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55370 target="new">long-chain-alcohol O-fatty-acyltransferase (wax synthase) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55380 target="new">At5g55380</a></td>

       <td>NP_200349</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55380 target="new">long-chain-alcohol O-fatty-acyltransferase (wax synthase) family
</a></td>

        </tr>
<tr class="alt"><td><b>CER1 Protein involved in wax synthesis</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g02190 target="new">At1g02190</a></td>

       <td>NP_171721</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02190 target="new">"CER1 protein, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g02205 target="new">At1g02205</a></td>

       <td>NP_171723</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02205 target="new">CER1 protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g37700 target="new">At2g37700</a></td>

       <td>NP_181306</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37700 target="new">"CER1 protein, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g28280 target="new">At5g28280</a></td>

       <td>NP_198180</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g28280 target="new">sterol desaturase domain-containing protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g57800  target="new">At5g57800 </a></td>

       <td>NP_200588</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g57800  target="new">"CER1 protein, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Putative Transcription Factor CER2 involved in wax biosynthesis</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g23840 target="new">At3g23840</a></td>

       <td>NP_566741</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g23840 target="new">transferase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g13840 target="new">At4g13840</a></td>

       <td>NP_193120</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g13840 target="new">transferase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g24510 target="new">At4g24510</a></td>

       <td>NP_194182</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g24510 target="new">CER2
</a></td>

        </tr>
<tr class="alt"><td><b>CER3 Protein involved in wax biosynthesis</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g02310 target="new">At5g02310</a></td>

       <td>NP_195851</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g02310 target="new">eceriferum3 (CER3)
</a></td>

        </tr>
<tr class="alt"><td><b>ELO-like Elongase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g06460 target="new">At3g06460</a></td>

       <td>NP_187297</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06460 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g06470 target="new">At3g06470</a></td>

       <td>NP_187298</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06470 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g36830 target="new">At4g36830</a></td>

       <td>NP_195401</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g36830 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g75000 target="new">At1g75000</a></td>

       <td>NP_177637</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75000 target="new">hypothetical protein
</a></td>

        </tr>
<tr class="alt"><td><b>Bifunctional Wax Ester Synthase / DAGAT</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g53380 target="new">At5g53380</a></td>

       <td>NP_200150</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g53380 target="new">hypothetical protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g16350 target="new">At5g16350</a></td>

       <td>NP_197139</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g16350 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g12420 target="new">At5g12420</a></td>

       <td>NP_568275</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g12420 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g22490 target="new">At5g22490</a></td>

       <td>NP_197641</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g22490 target="new">hypothetical protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g72110 target="new">At1g72110</a></td>

       <td>NP_177356</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72110 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g37300 target="new">At5g37300</a></td>

       <td>NP_568547</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g37300 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g49210 target="new">At3g49210</a></td>

       <td>NP_190490</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g49210 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g49190 target="new">At3g49190</a></td>

       <td>NP_190488</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g49190 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g53390 target="new">At5g53390</a></td>

       <td>NP_200151</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g53390 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g49200 target="new">At3g49200</a></td>

       <td>NP_190489</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g49200 target="new">hypothetical protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g38995 target="new">At2g38995</a></td>

       <td>NA</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38995 target="new">hypothetical protein
</a></td>

        </tr>
<tr class="alt"><td><b>Plastid Lipid-associated Protein</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g35490 target="new">At2g35490</a></td>

       <td>NP_181092</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g35490 target="new">"plastid-lipid associated protein (PAP), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g04020 target="new">At4g04020</a></td>

       <td>NP_192311</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g04020 target="new">"plastid-lipid associated protein PAP/fibrillin, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g22240 target="new">At4g22240</a></td>

       <td>NP_193955</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g22240 target="new">"plastid-lipid associated protein (PAP), putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial Long-Chain Acyl-CoA Synthetase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g77590 target="new">At1g77590</a></td>

       <td>NP_177882</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77590 target="new">long-chain-fatty-acid--CoA ligase (acyl-CoA synthetase) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g23790 target="new">At3g23790</a></td>

       <td>NP_189021</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g23790 target="new">"AMP-binding protein, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g14070 target="new">At4g14070</a></td>

       <td>NP_193143</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g14070 target="new">"AMP-binding protein, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Long-Chain Acyl-CoA Synthetase (other than plastidial or peroxisomal)</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g49430 target="new">At1g49430</a></td>

       <td>NP_175368</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g49430 target="new">long-chain-fatty-acid--CoA ligase (acyl CoA synthetase)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g64400 target="new">At1g64400</a></td>

       <td>NP_176622</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64400 target="new">"long-chain-fatty-acid--CoA ligase (acyl-CoA synthetase), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g04350 target="new">At2g04350</a></td>

       <td>NP_849934</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g04350 target="new">long-chain-fatty-acid--CoA ligase (acyl-CoA synthetase) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g47240 target="new">At2g47240</a></td>

       <td>NP_182246</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47240 target="new">long-chain-fatty-acid--CoA ligase (acyl-CoA synthetase) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g11030 target="new">At4g11030</a></td>

       <td>NP_192841</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11030 target="new">"long-chain-fatty-acid--CoA ligase (acyl CoA synthetase), putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g23850 target="new">At4g23850</a></td>

       <td>NP_194116</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g23850 target="new">long-chain-fatty-acid--CoA ligase (acyl-CoA synthetase)
</a></td>

        </tr>
<tr class="alt"><td><b>Plastidial ABC Acyl Transporter</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g54350 target="new">At1g54350</a></td>

       <td>NP_175837</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54350 target="new">ABC transporter family protein
</a></td>

        </tr>
<tr class="alt"><td><b>Epoxide Hydrolase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g26740 target="new">At2g26740</a></td>

       <td>NP_180242</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26740 target="new">epoxide hydrolase (ATsEH)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g26750 target="new">At2g26750</a></td>

       <td>NP_180243</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26750 target="new">"epoxide hydrolase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g05600 target="new">At3g05600</a></td>

       <td>NP_187211</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05600 target="new">"epoxide hydrolase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g51000 target="new">At3g51000</a></td>

       <td>NP_190669</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g51000 target="new">"epoxide hydrolase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g02340 target="new">At4g02340</a></td>

       <td>NP_567228</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g02340 target="new">"epoxide hydrolase, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g15960 target="new">At4g15960</a></td>

       <td>NP_193331</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g15960 target="new">"epoxide hydrolase, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Acetyl-CoA Synthetase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g55320  target="new">At1g55320 </a></td>

       <td>NP_175929</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55320  target="new">AMP-dependent synthetase and ligase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g23050 target="new">At5g23050</a></td>

       <td>NP_197696</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g23050 target="new">AMP-dependent synthetase and ligase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g36880  target="new">At5g36880 </a></td>

       <td>NP_198504</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g36880  target="new">"acetyl-CoA synthetase (acetate-CoA ligase), putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Cytosolic Holo-ACP Synthase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g02770 target="new">At2g02770</a></td>

       <td>NP_178380</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02770 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td><b>Cytosolic Homomeric Acetyl-CoA Carboxylase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g36160 target="new">At1g36160</a></td>

       <td>NP_174849</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g36160 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td><b>Sphingosine Transfer Protein</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g34690 target="new">At2g34690</a></td>

       <td>NP_181016</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34690 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g39670 target="new">At4g39670</a></td>

       <td>NP_195677</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g39670 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td><b>Protein N-Myristoyltransferase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g44170 target="new">At2g44170</a></td>

       <td>NP_566012</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44170 target="new">N-myristoyltransferase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g57020 target="new">At5g57020</a></td>

       <td>NP_568846</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g57020 target="new">N-myristoyl transferase
</a></td>

        </tr>
<tr class="alt"><td><b>Lipid Acylhydrolase-like</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g02660 target="new">At1g02660</a></td>

       <td>NP_563660</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02660 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g56630 target="new">At1g56630</a></td>

       <td>NP_176056</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g56630 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g05260 target="new">At2g05260</a></td>

       <td>NP_565323</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g05260 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g42450 target="new">At2g42450</a></td>

       <td>NP_181773</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42450 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g07400 target="new">At3g07400</a></td>

       <td>NP_187396</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g07400 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g14075 target="new">At3g14075</a></td>

       <td>NP_566475</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g14075 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g14360 target="new">At3g14360</a></td>

       <td>NP_566484</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g14360 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g49050 target="new">At3g49050</a></td>

       <td>NP_190474</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g49050 target="new">calmodulin-binding heat-shock protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g61680 target="new">At3g61680</a></td>

       <td>NP_191727</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g61680 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g62590 target="new">At3g62590</a></td>

       <td>NP_567131</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g62590 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g00500 target="new">At4g00500</a></td>

       <td>NP_191959</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00500 target="new">calmodulin-binding heat-shock protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g10950 target="new">At4g10950</a></td>

       <td>NP_567372</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g10950 target="new">GDSL-motif lipase/hydrolase protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g13550 target="new">At4g13550</a></td>

       <td>NP_193091</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g13550 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g16070 target="new">At4g16070</a></td>

       <td>NP_567482</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g16070 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td>Sag101</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g14930 target="new">At5g14930</a></td>

       <td>NP_568307</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g14930 target="new">leaf senescence-associated protein (SAG101)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g24180 target="new">At5g24180</a></td>

       <td>NP_197806</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g24180 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g24210 target="new">At5g24210</a></td>

       <td>NP_197809</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g24210 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g24220 target="new">At5g24220</a></td>

       <td>NP_197810</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g24220 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g37710 target="new">At5g37710</a></td>

       <td>NP_198587</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g37710 target="new">calmodulin-binding heat-shock protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g42930 target="new">At5g42930</a></td>

       <td>NP_199107</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g42930 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g67050 target="new">At5g67050</a></td>

       <td>NP_201506</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g67050 target="new">lipase (class 3) family
</a></td>

        </tr>
<tr class="alt"><td><b>Lipid Transfer Protein type 1</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g15050 target="new">At2g15050</a></td>

       <td>NP_179109</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15050 target="new">"lipid transfer protein, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g15325 target="new">At2g15325</a></td>

       <td>NP_179135</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15325 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g18370 target="new">At2g18370</a></td>

       <td>NP_179428</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18370 target="new">lipid transfer protein family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g38530 target="new">At2g38530</a></td>

       <td>NP_181387</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38530 target="new">nonspecific lipid transfer protein 2 (LTP 2)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g38540 target="new">At2g38540</a></td>

       <td>NP_181388</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38540 target="new">nonspecific lipid transfer protein 1 (LTP 1)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g08770 target="new">At3g08770</a></td>

       <td>NP_187489</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g08770 target="new">lipid transfer protein 6 (ltp6)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g51590 target="new">At3g51590</a></td>

       <td>NP_190727</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g51590 target="new">"lipid transfer protein, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g51600 target="new">At3g51600</a></td>

       <td>NP_190728</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g51600 target="new">nonspecific lipid transfer protein 5 (LTP 5)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g08530 target="new">At4g08530</a></td>

       <td>NP_192593</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g08530 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g33355 target="new">At4g33355</a></td>

       <td>NP_680758</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g33355 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g01870 target="new">At5g01870</a></td>

       <td>NP_195807</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g01870 target="new">"lipid transfer protein, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g59310 target="new">At5g59310</a></td>

       <td>NP_568904</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59310 target="new">lipid transfer protein 4 (LTP 4)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g59320 target="new">At5g59320</a></td>

       <td>NP_568905</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59320 target="new">lipid transfer protein 3 (LTP 3)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=NA target="new">NA</a></td>

       <td>BAB10168</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=NA target="new">NA
</a></td>

        </tr>
<tr class="alt"><td><b>Lipid Transfer Protein type 2</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g48750 target="new">At1g48750</a></td>

       <td>NP_564532</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48750 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g66850 target="new">At1g66850</a></td>

       <td>NP_176857</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66850 target="new">lipid transfer protein family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g73780 target="new">At1g73780</a></td>

       <td>NP_177519</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73780 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g18280 target="new">At3g18280</a></td>

       <td>NP_188456</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g18280 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g57310 target="new">At3g57310</a></td>

       <td>NP_191290</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g57310 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g38160 target="new">At5g38160</a></td>

       <td>NP_198632</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g38160 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g38170 target="new">At5g38170</a></td>

       <td>NP_198633</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g38170 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g38180 target="new">At5g38180</a></td>

       <td>NP_198634</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g38180 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td><b>Lipid Transfer Protein type 3</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g32280 target="new">At1g32280</a></td>

       <td>NP_174507</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32280 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g07450 target="new">At3g07450</a></td>

       <td>NP_187401</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g07450 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g52130 target="new">At3g52130</a></td>

       <td>NP_190781</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g52130 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g30880 target="new">At4g30880</a></td>

       <td>NP_194817</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g30880 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g33550 target="new">At4g33550</a></td>

       <td>NP_195081</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g33550 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g07230 target="new">At5g07230</a></td>

       <td>NP_196340</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07230 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g48485 target="new">At5g48485</a></td>

       <td>NP_568699</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g48485 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g48490 target="new">At5g48490</a></td>

       <td>NP_199660</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g48490 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g52160 target="new">At5g52160</a></td>

       <td>NP_200029</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g52160 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55410 target="new">At5g55410</a></td>

       <td>NP_200352</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55410 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55450 target="new">At5g55450</a></td>

       <td>NP_568824</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55450 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g55460 target="new">At5g55460</a></td>

       <td>NP_200357</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55460 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g56480 target="new">At5g56480</a></td>

       <td>NP_200459</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g56480 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g62080 target="new">At5g62080</a></td>

       <td>NP_568949</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g62080 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td><b>Lipid Transfer Protein type 4</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g53980 target="new">At3g53980</a></td>

       <td>NP_850700</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g53980 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g05960 target="new">At5g05960</a></td>

       <td>NP_568160</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g05960 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td><b>Lipid Transfer Protein type 5</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g18280 target="new">At1g18280</a></td>

       <td>NP_173264</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18280 target="new">lipid transfer protein family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g27950 target="new">At1g27950</a></td>

       <td>NP_174116</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27950 target="new">lipid transfer protein - related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g36150 target="new">At1g36150</a></td>

       <td>NP_174848</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g36150 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g55260 target="new">At1g55260</a></td>

       <td>NP_564682</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55260 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g62790 target="new">At1g62790</a></td>

       <td>NP_849837</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g62790 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g70240 target="new">At1g70240</a></td>

       <td>NP_177181</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70240 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g73550 target="new">At1g73550</a></td>

       <td>NP_177496</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73550 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g73560 target="new">At1g73560</a></td>

       <td>NP_565067</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73560 target="new">lipid transfer protein family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g73890 target="new">At1g73890</a></td>

       <td>NP_177530</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73890 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g13820 target="new">At2g13820</a></td>

       <td>NP_179002</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g13820 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g27130 target="new">At2g27130</a></td>

       <td>NP_565637</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g27130 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g37870 target="new">At2g37870</a></td>

       <td>NP_565872</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37870 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g44290 target="new">At2g44290</a></td>

       <td>NP_181958</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44290 target="new">lipid transfer protein family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g44300 target="new">At2g44300</a></td>

       <td>NP_181959</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44300 target="new">lipid transfer protein - related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g48130 target="new">At2g48130</a></td>

       <td>NP_566126</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g48130 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g48140 target="new">At2g48140</a></td>

       <td>NP_566127</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g48140 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g22570 target="new">At3g22570</a></td>

       <td>NP_566711</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g22570 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g22580 target="new">At3g22580</a></td>

       <td>NP_188897</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g22580 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g22600 target="new">At3g22600</a></td>

       <td>NP_566712</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g22600 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g22620 target="new">At3g22620</a></td>

       <td>NP_566713</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g22620 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g43720 target="new">At3g43720</a></td>

       <td>NP_189958</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g43720 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g08670 target="new">At4g08670</a></td>

       <td>NP_192607</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g08670 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g12360 target="new">At4g12360</a></td>

       <td>NP_192973</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g12360 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g14815 target="new">At4g14815</a></td>

       <td>NP_567445</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g14815 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g22630 target="new">At4g22630</a></td>

       <td>NP_193994</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g22630 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g22640 target="new">At4g22640</a></td>

       <td>NP_193995</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g22640 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g09370 target="new">At5g09370</a></td>

       <td>NP_850800</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g09370 target="new">lipid transfer protein family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g13900 target="new">At5g13900</a></td>

       <td>NP_196894</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g13900 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g64080 target="new">At5g64080</a></td>

       <td>NP_568984</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g64080 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td><b>Lipid Transfer Protein type 6</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g22490 target="new">At4g22490</a></td>

       <td>NP_193980</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g22490 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g22520 target="new">At4g22520</a></td>

       <td>NP_193983</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g22520 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td><b>Lipid Transfer Protein type 7</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g58550 target="new">At3g58550</a></td>

       <td>NP_191414</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g58550 target="new">protease inhibitor/seed storage/lipid transfer protein (LTP) family
</a></td>

        </tr>
<tr class="alt"><td><b>Lipid Transfer Protein type 8</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g28395 target="new">At4g28395</a></td>

       <td>NP_567807</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g28395 target="new">"lipid transfer protein, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Acyl-CoA Desaturase-like</b></td>

       <td>Ads1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g06080 target="new">At1g06080</a></td>

       <td>NP_172098</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06080 target="new">delta 9 desaturase (ADS1)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g06090 target="new">At1g06090</a></td>

       <td>NP_172099</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06090 target="new">fatty acid desaturase family protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g06100 target="new">At1g06100</a></td>

       <td>NP_172100</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06100 target="new">fatty acid desaturase family protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g06120 target="new">At1g06120</a></td>

       <td>NP_172102</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06120 target="new">fatty acid desaturase family protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g06350 target="new">At1g06350</a></td>

       <td>NP_172124</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06350 target="new">fatty acid desaturase family protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g06360 target="new">At1g06360</a></td>

       <td>NP_172125</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06360 target="new">fatty acid desaturase family protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td>Ads2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g31360 target="new">At2g31360</a></td>

       <td>NP_565721</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31360 target="new">delta 9 desaturase (ADS2)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g15870 target="new">At3g15870</a></td>

       <td>NP_188208</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g15870 target="new">fatty acid desaturase family protein
</a></td>

        </tr>
<tr class="alt"><td><b>ATP Citrate Lyase subunit A</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g09430 target="new">At1g09430</a></td>

       <td>NP_172414</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09430 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g10670 target="new">At1g10670</a></td>

       <td>NP_849634</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10670 target="new">ATP citrate-lyase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g60810 target="new">At1g60810</a></td>

       <td>NP_176280</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60810 target="new">ATP citrate-lyase -related
</a></td>

        </tr>
<tr class="alt"><td><b>ATP Citrate Lyase subunit B</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g06650 target="new">At3g06650</a></td>

       <td>NP_187317</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06650 target="new">ATP citrate lyase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g49460 target="new">At5g49460</a></td>

       <td>NP_199757</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49460 target="new">ATP citrate lyase
</a></td>

        </tr>
<tr class="alt"><td><b>Pollen-surface Oleosin</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g07510  target="new">At5g07510 </a></td>

       <td>NP_196368</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07510  target="new">glycine-rich protein GRP14
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g07520  target="new">At5g07520 </a></td>

       <td>NP_196369</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07520  target="new">glycine-rich protein GRP18
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g07530  target="new">At5g07530 </a></td>

       <td>NP_196370</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07530  target="new">glycine-rich protein GRP17
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g07540  target="new">At5g07540 </a></td>

       <td>NP_850788</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07540  target="new">glycine-rich protein GRP16
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g07550  target="new">At5g07550 </a></td>

       <td>NP_196372</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07550  target="new">glycine-rich protein GRP19
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g07560  target="new">At5g07560 </a></td>

       <td>NP_196373</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07560  target="new">glycine-rich protein GRP20
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g07600  target="new">At5g07600 </a></td>

       <td>NP_196377</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07600  target="new">oleosin / glycine-rich protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g61610 target="new">At5g61610</a></td>

       <td>NP_200969</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g61610 target="new">oleosin
</a></td>

        </tr>
<tr class="alt"><td><b>Acyl-CoA Thioesterase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g01710 target="new">At1g01710</a></td>

       <td>NP_563632</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01710 target="new">acyl CoA thioesterase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g30720 target="new">At2g30720</a></td>

       <td>NP_180630</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30720 target="new">thioesterase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g00520 target="new">At4g00520</a></td>

       <td>NP_191961</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00520 target="new">acetyl CoA thioesterase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g48370 target="new">At5g48370</a></td>

       <td>NP_199648</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g48370 target="new">thioesterase family
</a></td>

        </tr>
<tr class="alt"><td><b>Malonyl-CoA Decarboxylase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g04320 target="new">At4g04320</a></td>

       <td>NP_192341</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g04320 target="new">malonyl-CoA decarboxylase -related
</a></td>

        </tr>
<tr class="alt"><td><b>Translocase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g13210 target="new">At1g13210</a></td>

       <td>NP_172780</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g13210 target="new">haloacid dehalogenase-like hydrolase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g17500 target="new">At1g17500</a></td>

       <td>NP_173193</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17500 target="new">haloacid dehalogenase-like hydrolase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g26130 target="new">At1g26130</a></td>

       <td>NP_173938</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26130 target="new">haloacid dehalogenase-like hydrolase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g54280 target="new">At1g54280</a></td>

       <td>NP_175830</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54280 target="new">haloacid dehalogenase-like hydrolase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g59820 target="new">At1g59820</a></td>

       <td>NP_176191</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g59820 target="new">haloacid dehalogenase-like hydrolase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g68710 target="new">At1g68710</a></td>

       <td>NP_177038</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68710 target="new">haloacid dehalogenase-like hydrolase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g72700 target="new">At1g72700</a></td>

       <td>NP_177414</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72700 target="new">haloacid dehalogenase-like hydrolase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g13900 target="new">At3g13900</a></td>

       <td>NP_188006</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13900 target="new">haloacid dehalogenase-like hydrolase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g25610 target="new">At3g25610</a></td>

       <td>NP_189189</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g25610 target="new">haloacid dehalogenase-like hydrolase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g27870 target="new">At3g27870</a></td>

       <td>NP_189425</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g27870 target="new">haloacid dehalogenase-like hydrolase family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g04930 target="new">At5g04930</a></td>

       <td>NP_568146</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g04930 target="new">phospholipid-transporting ATPase 1 (aminophospholipid flippase 1) (magnesium-ATPase)
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g44240  target="new">At5g44240 </a></td>

       <td>NP_568633</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g44240  target="new">haloacid dehalogenase-like hydrolase family
</a></td>

        </tr>
<tr class="alt"><td><b>Acyl-CoA Binding Protein</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g31812 target="new">At1g31812</a></td>

       <td>NP_174462</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31812 target="new">Acyl CoA binding protein -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g05420     target="new">At3g05420    </a></td>

       <td>NP_187193</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05420     target="new">acyl CoA binding protein (ACBP) family
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g24230 target="new">At4g24230</a></td>

       <td>NP_849432</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g24230 target="new">expressed protein
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g27780 target="new">At4g27780</a></td>

       <td>NP_194507</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g27780 target="new">acyl-CoA binding protein -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g53470 target="new">At5g53470</a></td>

       <td>NP_200159</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g53470 target="new">acyl-CoA binding protein (ACBP)
</a></td>

        </tr>
<tr class="alt"><td><b>Sec14-like Protein</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g55840 target="new">At1g55840</a></td>

       <td>NP_175980</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55840 target="new">"sec14 cytosolic factor, putative (phosphoglyceride transfer protein, putative)"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g47730 target="new">At5g47730</a></td>

       <td>NP_199584</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g47730 target="new">"sec14 cytosolic factor, putative (phosphoglyceride transfer protein, putative)"
</a></td>

        </tr>
<tr class="alt"><td><b>Cyclopropane Fatty Acid Synthase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g23470 target="new">At3g23470</a></td>

       <td>NP_188989</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g23470 target="new">cyclopropane-fatty-acyl-phospholipid synthase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g23510 target="new">At3g23510</a></td>

       <td>NP_188993</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g23510 target="new">cyclopropane-fatty-acyl-phospholipid synthase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g23530 target="new">At3g23530</a></td>

       <td>NP_188995</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g23530 target="new">"cyclopropane synthase, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>PPT1-like Thioesterase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At3g60340 target="new">At3g60340</a></td>

       <td>NP_850728</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g60340 target="new">"palmitoyl protein thioesterase precursor, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g17470 target="new">At4g17470</a></td>

       <td>NP_193477</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g17470 target="new">"palmitoyl protein thioesterase precursor, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g17480 target="new">At4g17480</a></td>

       <td>NP_193478</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g17480 target="new">"palmitoyl protein thioesterase precursor, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At4g17483 target="new">At4g17483</a></td>

       <td>NP_193479</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g17483 target="new">"palmitoyl protein thioesterase precursor, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g47330 target="new">At5g47330</a></td>

       <td>NP_199544</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g47330 target="new">"palmitoyl protein thioesterase precursor, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g47340 target="new">At5g47340</a></td>

       <td>NP_199545</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g47340 target="new">"palmitoyl protein thioesterase precursor, putative"
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g47350 target="new">At5g47350</a></td>

       <td>NP_199546</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g47350 target="new">"palmitoyl protein thioesterase precursor, putative"
</a></td>

        </tr>
<tr class="alt"><td><b>Glycerophosphoryl Diester Phosphodiesterase</b></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g74210 target="new">At1g74210</a></td>

       <td>NP_177561</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74210 target="new">glycerophosphodiester phosphodiesterase -related
</a></td>

        </tr>
<tr class="alt"><td></td>

       <td></td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g08030 target="new">At5g08030</a></td>

       <td>NP_196420</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g08030 target="new">glycerophosphodiester phosphodiesterase - like protein
</a></td>

        </tr>

</table><P>
<center>Last modified on January 13, 2004</center>   

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
