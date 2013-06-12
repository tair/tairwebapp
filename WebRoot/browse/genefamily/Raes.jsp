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
<h2><i>Arabidopsis</i> Monolignol Biosynthesis Gene Families</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Raes, J., Rohde, A., Christensen, J., Van de Peer, Y., Boerjan, W. <a href="/servlets/TairObject?type=publication&id=501711362">Genome-wide characterization of the lignification toolbox in Arabidopsis thaliana.</a> Plant Phys 133: 1051-71
 <BR>Note: alternative gene models for PAL3, CCoAOMT2, CCoAOMT7, F5H2, CAD7
and CAD8 were proposed in this study. Please refer to the <a href="http://www.psb.rug.ac.be/bioinformatics/lignin/">Aradidopsis
Monolignol Genes</a> for more information.</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td><li>Genes were annotated using Genemark.hmm (Lukashin and Borodovsky, 1998) prediction.<Li>Annotation was further refined using Eugene (Schiex et al., 2001) and manually, taking into account EST data and family similarities.<Li>Expression of genes was confirmed using RT-PCR.</td></tr>
<TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/TairObject?type=person&id=1501414522 target=new>Jeroen Raes</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>Other Names:</B></TH>
   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=4 valign=top><b>PAL<br>(Phenylalanine ammonia lyase)</b></td>

       <td>Arath;PAL1</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g37040 target="new">At2g37040</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK76593&doptcmdl=GenPept>AAK76593</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37040 target="new">Phenylalanine ammonia lyase1</A></td>

        </tr>
<tr class="alt">

       <td>Arath;PAL2</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g53260 target="new">AT3g53260</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM91425&doptcmdl=GenPept>AAM91425</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g53260 target="new">Phenylalanine ammonia lyase2</A></td>

        </tr>
<tr class="alt">

       <td>Arath;PAL3</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5g04230 target="new">AT5g04230</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_196043&doptcmdl=GenPept>NP_196043</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g04230 target="new">Phenylalanine ammonia-lyase</A></td>

        </tr>
<tr class="alt">

       <td>Arath;PAL4</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3g10340 target="new">AT3g10340</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF02809&doptcmdl=GenPept>AAF02809</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g10340 target="new">putative phenylalanine ammonia-lyase</A></td>

        </tr>
<tr><td><b>C4H (trans-cinnamate 4-hydroxylase); Cytochrome P450</b></td>

       <td>Arath;C4H</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g30490 target="new">At2g30490</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_180607&doptcmdl=GenPept>NP_180607</A><br></td>

       <td>CYP73A5, ref3</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30490 target="new">cytochrome P450 73 / trans-cinnamate 4-monooxygenase / cinnamate-4-hydroxylase </A></td>

        </tr>
<tr class="alt"><td rowspan=4 valign=top><b>4CL<br>(4-coumarate:CoA ligase)</b></td>

       <td>Arath;4CL1</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g51680 target="new">At1g51680</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM20598&doptcmdl=GenPept>AAM20598</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51680 target="new">putative 4-coumarate:CoA ligase 1 (4-coumaroyl-CoA synthase 1)</A></td>

        </tr>
<tr class="alt">

       <td>Arath;4CL2</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g21240 target="new">At3g21240</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD47192&doptcmdl=GenPept>AAD47192</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g21240 target="new">4-coumarate:CoA ligase 2 (4-coumaroyl-CoA synthase 2)</A></td>

        </tr>
<tr class="alt">

       <td>Arath;4CL3</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g65060 target="new">At1g65060</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD47195&doptcmdl=GenPept>AAD47195</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65060 target="new">putative 4-coumarate:CoA ligase 3 (4-coumaroyl-CoA synthase 3)</A></td>

        </tr>
<tr class="alt">

       <td>Arath;4CL4</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g21230 target="new">At3g21230</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB01715&doptcmdl=GenPept>BAB01715</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g21230 target="new">putative 4-coumarate:CoA ligase (4-coumaroyl-CoA synthase)</A></td>

        </tr>
<tr><td><b>HCT (Hydroxycinnamoyl CoA:shikimate/quinate hydroxycinnamoyltransferase)</b></td>

       <td>Arath;HCT</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g48930 target="new">At5g48930</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_199704&doptcmdl=GenPept>NP_199704</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g48930 target="new">transferase family</A></td>

        </tr>
<tr class="alt"><td><b>C3H <br>(p-Coumarate 3-hydroxylase); Cytochrome P450</b></td>


       <td>Arath;C3H1</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g40890 target="new">At2g40890</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_565943&doptcmdl=GenPept>NP_565943</A><br></td>

       <td>CYP98A3, C3'H, ref8</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40890 target="new">cytochrome P450 98A3</A></td>

        </tr>
<tr><td><b>C3H (p-Coumarate 3-hydroxylase); Cytochrome P451</b></td>

       <td>Arath;C3H2</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g74540 target="new">At1g74540</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52369&doptcmdl=GenPept>AAG52369</A><br></td>

       <td>CYP98A8</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74540 target="new">putative cytochrome P450</A></td>

        </tr>
<tr class="alt"><td><b>C3H (p-Coumarate 3-hydroxylase); Cytochrome P452</b></td>

       <td>Arath;C3H3</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g74550 target="new">At1g74550</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM67314&doptcmdl=GenPept>AAM67314</A><br></td>

       <td>CYP98A9</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74550 target="new">putative cytochrome P450</A></td>

        </tr>
<tr><td rowspan=7 valign=top><b>CCoAOMT (Caffeoyl-CoA 3-O-methyltransferase)</b></td>

       <td>Arath;CCoAOMT1</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g34050 target="new">At4g34050</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL32708&doptcmdl=GenPept>AAL32708</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34050 target="new">caffeoyl-CoA 3-O-methyltransferase</A></td>

        </tr>
<tr>

       <td>Arath;CCoAOMT2</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g24735 target="new">At1g24735</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG03123&doptcmdl=GenPept>AAG03123</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24735 target="new">putative caffeoyl-CoA 3-O-methyltransferase</A></td>

        </tr>
<tr>

       <td>Arath;CCoAOMT3</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g61990 target="new">At3g61990</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM91222&doptcmdl=GenPept>AAM91222</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g61990 target="new">O-methyltransferase family 3</A></td>

        </tr>
<tr>

       <td>Arath;CCoAOMT4</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g62000 target="new">At3g62000</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM16164&doptcmdl=GenPept>AAM16164</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g62000 target="new">O-methyltransferase family 3</A></td>

        </tr>
<tr>

       <td>Arath;CCoAOMT5</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g67990 target="new">At1g67990</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52012&doptcmdl=GenPept>AAG52012</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67990 target="new">putative caffeoyl-CoA 3-O-methyltransferase</A></td>

        </tr>
<tr>

       <td>Arath;CCoAOMT6</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g67980 target="new">At1g67980</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG52015&doptcmdl=GenPept>AAG52015</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67980 target="new">putative caffeoyl-CoA 3-O-methyltransferase</A></td>

        </tr>
<tr>

       <td>Arath;CCoAOMT7</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g26220 target="new">At4g26220</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK26027&doptcmdl=GenPept>AAK26027</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g26220 target="new">putative caffeoyl-CoA 3-O-methyltransferase</A></td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>CCR (Cinnamoyl CoA reductase)</b></td>

       <td>Arath;CCR1</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g15950 target="new">At1g15950</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF18492&doptcmdl=GenPept>AAF18492</A><br></td>

       <td>irx4</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15950 target="new">putative cinnamoyl-CoA reductase</A></td>

        </tr>
<tr class="alt">

       <td>Arath;CCR2</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g80820 target="new">At1g80820</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF14669&doptcmdl=GenPept>AAF14669</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80820 target="new">putative cinnamoyl-CoA reductase</A></td>

        </tr>
<tr><td><b>F5H (Ferulate 5-hydroxylase); Cytochrome P450</b></td>

       <td>Arath;F5H1</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g36220 target="new">At4g36220</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_195345&doptcmdl=GenPept>NP_195345</A><br></td>

       <td>CYP84A1, fah</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g36220 target="new">cytochrome P450 84A1 / ferulate-5-hydroxylase (F5H) (FAH1) (CYP84A1)</A></td>

        </tr>
<tr class="alt"><td><b>F5H (Ferulate 5-hydroxylase); Cytochrome P451</b></td>

       <td>Arath;F5H2</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g04330 target="new">At5g04330</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_196053&doptcmdl=GenPept>NP_196053</A><br></td>

       <td>CYP84A4</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g04330 target="new">putative cytochrome P450</A></td>

        </tr>
<tr><td><b>COMT (Caffeic acid O-methyltransferase)</b></td>

       <td>Arath;COMT</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g54160 target="new">At5g54160</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM10127&doptcmdl=GenPept>AAM10127</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g54160 target="new">O-methyltransferase 1</A></td>

        </tr>
<tr bgcolor=D5D9DD><td rowspan=9 valign=top><b>CAD <br>(Cinnamyl alcohol dehydrogenase)</b></td>

       <td>Arath; CAD1</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g39330 target="new">At4g39330</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK43875&doptcmdl=GenPept>AAK43875</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g39330 target="new">putative mannitol dehydrogenase</A></td>

        </tr>
<tr class="alt">

       <td>Arath; CAD2</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g19450 target="new">At3g19450</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL34250&doptcmdl=GenPept>AAL34250</A><br></td>

       <td>LCAD-C</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g19450 target="new">cinnamyl-alcohol dehydrogenase </A></td>

        </tr>
<tr class="alt">

       <td>Arath; CAD3</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g37970 target="new">At4g37970</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB37537&doptcmdl=GenPept>CAB37537</A><br></td>

       <td>LCAD-A</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g37970 target="new">putative mannitol dehydrogenase</A></td>

        </tr>
<tr class="alt">

       <td>Arath; CAD4</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g37980 target="new">At4g37980</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK25935&doptcmdl=GenPept>AAK25935</A><br></td>

       <td>LCAD-B, ELI3-1</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g37980 target="new">putative mannitol dehydrogenase</A></td>

        </tr>
<tr class="alt">

       <td>Arath; CAD5</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g37990 target="new">At4g37990</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK32871&doptcmdl=GenPept>AAK32871</A><br></td>

       <td>ELI3-2, BAD</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g37990 target="new">putative mannitol dehydrogenase</A></td>

        </tr>
<tr class="alt">

       <td>Arath; CAD6</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g34230 target="new">At4g34230</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK59426&doptcmdl=GenPept>AAK59426</A><br></td>

       <td>LCAD-D</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34230 target="new">putative cinnamyl-alcohol dehydrogenase</A></td>

        </tr>
<tr class="alt">

       <td>Arath; CAD7</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g21730 target="new">At2g21730</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD20393&doptcmdl=GenPept>AAD20393</A><br></td>

       <td>LCAD-E</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21730 target="new">putative mannitol dehydrogenase</A></td>

        </tr>
<tr class="alt">

       <td>Arath; CAD8</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g21890 target="new">At2g21890</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD20406&doptcmdl=GenPept>AAD20406</A><br></td>

       <td>LCAD-F</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21890 target="new">putative mannitol dehydrogenase</A></td>

        </tr>
<tr class="alt">

       <td>Arath; CAD9</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g72680 target="new">At1g72680</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51850&doptcmdl=GenPept>AAG51850</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72680 target="new">putative cinnamyl-alcohol dehydrogenase</A></td>

        </tr>
<tr><td rowspan=9 valign=top><b>4CL-like</b></td>

       <td>Arath;4CL-like1</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g20510 target="new">At1g20510</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK64105&doptcmdl=GenPept>AAK64105</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20510 target="new">4-coumarate:CoA ligase 1 (4-coumaroyl-CoA synthase 1) family</A></td>

        </tr>
<tr>

       <td>Arath;4CL-like2</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g20500 target="new">At1g20500</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_173474&doptcmdl=GenPept>NP_173474</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20500 target="new">4-coumarate:CoA ligase 1 (4-coumaroyl-CoA synthase 1) family</A></td>

        </tr>
<tr>

       <td>Arath;4CL-like3</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g20490 target="new">At1g20490</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_173473&doptcmdl=GenPept>NP_173473</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20490 target="new">4-coumarate:CoA ligase 1 (4-coumaroyl-CoA synthase 1) family</A></td>

        </tr>
<tr>

       <td>Arath;4CL-like4</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g20480 target="new">At1g20480</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_173472&doptcmdl=GenPept>NP_173472</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20480 target="new">4-coumarate:CoA ligase 1 (4-coumaroyl-CoA synthase 1) family</A></td>

        </tr>
<tr>

       <td>Arath;4CL-like5</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g62940 target="new">At1g62940</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF75805&doptcmdl=GenPept>AAF75805</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g62940 target="new">4-coumarate:CoA ligase (4-coumaroyl-CoA synthase) family</A></td>

        </tr>
<tr>

       <td>Arath;4CL-like6</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g19010 target="new">At4g19010</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78903&doptcmdl=GenPept>CAB78903</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g19010 target="new">4-coumarate:CoA ligase (4-coumaroyl-CoA synthase) family</A></td>

        </tr>
<tr>

       <td>Arath;4CL-like7</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g05160 target="new">At4g05160</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM13899&doptcmdl=GenPept>AAM13899</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g05160 target="new">putative 4-coumarate:CoA ligase-like protein (4-coumaroyl-CoA synthase)</A></td>

        </tr>
<tr>

       <td>Arath;4CL-like8</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g63380 target="new">At5g63380</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM97124&doptcmdl=GenPept>AAM97124</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g63380 target="new">4-coumarate:CoA ligase (4-coumaroyl-CoA synthase) family</A></td>

        </tr>
<tr>

       <td>Arath;4CL-like9</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g38120 target="new">At5g38120</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAC42672&doptcmdl=GenPept>BAC42672</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g38120 target="new">4-coumarate:CoA ligase (4-coumaroyl-CoA synthase) family</A></td>

        </tr>
<tr bgcolor=D5D9DD><td rowspan=5 valign=top><b>CCR-like</b></td>

       <td>Arath;CCR-like1</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g76470 target="new">At1g76470</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF16654&doptcmdl=GenPept>AAF16654</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76470 target="new">cinnamoyl-CoA reductase family</A></td>

        </tr>
<tr class="alt">

       <td>Arath;CCR-like2</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g02400 target="new">At2g02400</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC78522&doptcmdl=GenPept>AAC78522</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02400 target="new">cinnamoyl-CoA reductase family</A></td>

        </tr>
<tr class="alt">

       <td>Arath;CCR-like3</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g33590 target="new">At2g33590</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAN15374&doptcmdl=GenPept>AAN15374</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33590 target="new">cinnamoyl-CoA reductase family</A></td>

        </tr>
<tr class="alt">

       <td>Arath;CCR-like4</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g33600 target="new">At2g33600</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM13142&doptcmdl=GenPept>AAM13142</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33600 target="new">cinnamoyl-CoA reductase family</A></td>

        </tr>
<tr class="alt">

       <td>Arath;CCR-like5</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g58490 target="new">At5g58490</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAO22571&doptcmdl=GenPept>AAO22571</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58490 target="new">cinnamoyl-CoA reductase family</A></td>

        </tr>
<tr><td rowspan=13 valign=top><b>COMT-like</b></td>

       <td>Arath;COMT-like1</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g21100 target="new">At1g21100</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AF344316&doptcmdl=GenPept>AF344316</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g21100 target="new">putative O-methyltransferase 1</A></td>

        </tr>
<tr>

       <td>Arath;COMT-like2</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g21110 target="new">At1g21110</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF80650&doptcmdl=GenPept>AAF80650</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g21110 target="new">putative O-methyltransferase 1</A></td>

        </tr>
<tr>

       <td>Arath;COMT-like3</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g21120 target="new">At1g21120</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF80649&doptcmdl=GenPept>AAF80649</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g21120 target="new">putative O-methyltransferase 1</A></td>

        </tr>
<tr>

       <td>Arath;COMT-like4</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g21130 target="new">At1g21130</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF80648&doptcmdl=GenPept>AAF80648</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g21130 target="new">putative O-methyltransferase 1</A></td>

        </tr>
<tr>

       <td>Arath;COMT-like5</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g33030 target="new">At1g33030</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF31281&doptcmdl=GenPept>AAF31281</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g33030 target="new">O-methyltransferase family 2</A></td>

        </tr>
<tr>

       <td>Arath;COMT-like6</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g51990 target="new">At1g51990</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD12674&doptcmdl=GenPept>AAD12674</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51990 target="new">O-methyltransferase family 2</A></td>

        </tr>
<tr>

       <td>Arath;COMT-like7</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g63140 target="new">At1g63140</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51616&doptcmdl=GenPept>AAG51616</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g63140 target="new">putative O-methyltransferase 1</A></td>

        </tr>
<tr>

       <td>Arath;COMT-like8</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g76790 target="new">At1g76790</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF04440&doptcmdl=GenPept>AAF04440</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76790 target="new">O-methyltransferase family 2</A></td>

        </tr>
<tr>

       <td>Arath;COMT-like9</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g77520 target="new">At1g77520</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51676&doptcmdl=GenPept>AAG51676</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77520 target="new">O-methyltransferase family 2</A></td>

        </tr>
<tr>

       <td>Arath;COMT-like10</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g77530 target="new">At1g77530</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG51679&doptcmdl=GenPept>AAG51679</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77530 target="new">O-methyltransferase family 2</A></td>

        </tr>
<tr>

       <td>Arath;COMT-like11</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g53140 target="new">At3g53140</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB64217&doptcmdl=GenPept>CAB64217</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g53140 target="new">putative O-diphenol-O-methyl transferase</A></td>

        </tr>
<tr>

       <td>Arath;COMT-like12</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g37170 target="new">At5g37170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB11374&doptcmdl=GenPept>BAB11374</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g37170 target="new">O-methyltransferase family 2</A></td>

        </tr>
<tr>

       <td>Arath;COMT-like13</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g53810 target="new">At5g53810</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB09553&doptcmdl=GenPept>BAB09553</A><br></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g53810 target="new">putative O-methyltransferase 1</A></td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>

<center>Last modified on January 15, 2004</center>           

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
