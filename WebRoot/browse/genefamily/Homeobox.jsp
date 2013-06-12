<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Homeobox Transcription Factor Family";
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
<h2>Homeobox Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Schena, M.,Davis, R. W.</b> (1992) <a href="/servlets/TairObject?type=publication&amp;id=5412">HD-Zip proteins: members of an Arabidopsis homeodomain protein superfamily.</a> PROCEEDINGS OF THE NATIONAL ACADEMY OF SCIENCES OF THE UNITED STATES OF AMERICA <b>89</b>
</li> <li>
<b>Schindler, U.,Beckmann, H.,Cashmore, A. R.</b> (1993) <a href="/servlets/TairObject?type=publication&amp;id=5160">HAT3.1, a novel Arabidopsis homeodomain protein containing a conserved cysteine-rich region.</a> THE PLANT JOURNAL <b>4</b>
</li> <li>
<b>Sessa, G.,Steindler, C.,Morelli, G.,Ruberti, I.</b> (1998) <a href="/servlets/TairObject?type=publication&amp;id=2181">The Arabidopsis Athb-8, -9 and -14 genes are members of a small gene family coding for highly related HD-ZIP proteins.</a> PLANT MOLECULAR BIOLOGY <b>38</b>
</li> <li>


<b>Lu, P.,Porat, R.,Nadeau, J. A.,O'Neill, S. D.</b> (1996) <a href="/servlets/TairObject?type=publication&amp;id=3555">Identification of a meristem L1 layer-specific gene in Arabidopsis that is expressed during embryonic pattern formation and defines a new class of homeobox genes.</a> THE PLANT CELL <b>8</b>
</li> <li>
<b>Soppe,W.J.,Jacobsen,S.E.,Alonso-Blanco,C.,Jackson,J.P.,Kakutani,T.,Koornneef,M.,Peeters,A.J.</b> (2000) <a href="/servlets/TairObject?type=publication&amp;id=501715136">The late flowering phenotype of fwa mutants is caused by gain-of-function epigenetic alleles of a homeodomain gene.</a> MOLECULAR CELL <b>6</b>
</li> <li>
<b>Ruberti, I.,Sessa, G.,Lucchetti, S.,Morelli, G.</b> (1991) <a href="/servlets/TairObject?type=publication&amp;id=5522">A novel class of plant proteins containing a homeodomain with a closely linked leucine zipper motif.</a> THE EMBO JOURNAL <b>10</b>
</li> <li>
<b>Lee, Y. H.,Oh, H. S.,Cheon, C. I.,Hwang, I. T.,Kim, Y. J.,Chun, J. Y.</b> (2001) <a href="/servlets/TairObject?type=publication&amp;id=501680707">Structure and Expression of the Arabidopsis thaliana Homeobox Gene Athb-12.</a> BIOCHEMICAL AND BIOPHYSICAL RESEARCH COMMUNICATIONS <b>284</b>
</li> <li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li> <li>
<b>Haecker,Achim.,Gross-Hardt,Rita.,Geiges,Bernd.,Sarkar,Ananda.,Breuninger,Holger.,Herrmann,Marita.,Laux,Thomas.</b> (2004) <a href="/servlets/TairObject?type=publication&amp;id=501711727">Expression dynamics of WOX genes mark cell fate decisions during early embryonic patterning in Arabidopsis thaliana.</a> DEVELOPMENT <b>131</b>
</li></ul></td></tr>
	<tr><th valign="top">Gene Family Criteria:</th> <td>Families were found through a domain search and blast technique. Publications were found through PubMed and the conserved domain motif that characterizes each TF family was identified. Using the motif, a Blast was conducted in the TAIR website, the resultant sequences were then aligned and mismatches were discarded.</td></tr>
	<tr><th valign="top">Contact:</th> <td></td></tr>
</table>

<table align="center" border="1" cellspacing="0" cellpadding="2">
	<tr>
		<th><b>Gene Family</b></th>
		<th><b>Locus ID</b></th>
		<th><b>Gene/Protein Name</b></th>
		<th><b>Submitter Description</b></th>
	</tr>
<tr>		<td>Homeobox Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g00730">At4g00730</a></td>
		<td>ANL2</td>
		<td>homeodomain protein AHDP</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g32980">At4g32980</a></td>
		<td>ATH1</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g01470">At3g01470</a></td>
		<td>Athb-1</td>
		<td>homeobox-leucine zipper protein HAT5 (HD-ZIP prote</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g79840">At1g79840</a></td>
		<td>Athb-10</td>
		<td>homeodomain protein, GLABRA2 (GL2)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g61890">At3g61890</a></td>
		<td>Athb-12</td>
		<td>homeobox-leucine zipper protein ATHB-12</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g69780">At1g69780</a></td>
		<td>Athb-13</td>
		<td>HD-Zip transcription factor, Athb-13</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g34710">At2g34710</a></td>
		<td>Athb-14</td>
		<td>HD-Zip transcription factor, Athb-14</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g52150">At1g52150</a></td>
		<td>ATHB-15</td>
		<td>HD-Zip transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g40060">At4g40060</a></td>
		<td>Athb-16</td>
		<td>homeodomain - like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g01430">At2g01430</a></td>
		<td>Athb-17</td>
		<td>putative homeodomain transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g16780">At4g16780</a></td>
		<td>Athb-2</td>
		<td>homeobox-leucine zipper protein HAT4 (HD-Zip prote</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g15150">At5g15150</a></td>
		<td>Athb-3</td>
		<td>homeobox-leucine zipper protein, HAT7</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g44910">At2g44910</a></td>
		<td>Athb-4</td>
		<td>homeobox-leucine zipper protein, Athb-4</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g65310">At5g65310</a></td>
		<td>Athb-5</td>
		<td>homeobox-leucine zipper protein ATHB-5 (HD-zip pro</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g22430">At2g22430</a></td>
		<td>Athb-6</td>
		<td>homeodomain transcription factor (ATHB-6)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g46680">At2g46680</a></td>
		<td>Athb-7</td>
		<td>homeodomain transcription factor, (ATHB-7)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g32880">At4g32880</a></td>
		<td>Athb-8</td>
		<td>HD-Zip transcription factor, Athb-8</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g30490">At1g30490</a></td>
		<td>Athb-9</td>
		<td>HD-Zip transcription factor, Athb-9</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g21750">At4g21750</a></td>
		<td>ATML1</td>
		<td>homeodomain protein, ATML1</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g41410">At5g41410</a></td>
		<td>BEL1</td>
		<td>homeodomain protein, BELL1</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g36870">At4g36870</a></td>
		<td>BLH2</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g75410">At1g75410</a></td>
		<td>BLH3</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g23760">At2g23760</a></td>
		<td>BLH4</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g19700">At1g19700</a></td>
		<td>BLH5</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g02030">At5g02030</a></td>
		<td>BLR</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g25530">At4g25530</a></td>
		<td>FWA</td>
		<td>homeodomain protein, FWA</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g17460">At4g17460</a></td>
		<td>HAT1</td>
		<td>homeobox-leucine zipper protein HAT1 (HD-Zip prote</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g06710">At5g06710</a></td>
		<td>HAT14</td>
		<td>homeobox-leucine zipper protein HAT14 (HD-Zip prot</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g47370">At5g47370</a></td>
		<td>HAT2</td>
		<td>homeobox-leucine zipper protein-like</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g37790">At4g37790</a></td>
		<td>HAT22</td>
		<td>homeobox protein HAT22</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g60390">At3g60390</a></td>
		<td>HAT3</td>
		<td>homeobox-leucine zipper protein HAT3</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g19510">At3g19510</a></td>
		<td>HAT3.1</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g22800">At2g22800</a></td>
		<td>HAT9</td>
		<td>homeobox-leucine zipper protein HAT9 (HD-Zip prote</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g61150">At3g61150</a></td>
		<td>HD-GL2-1</td>
		<td>homeodomain protein, GLABRA2 like 1 (HD-GL2-1)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g08150">At4g08150</a></td>
		<td>KNAT1</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g70510">At1g70510</a></td>
		<td>KNAT2</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g25220">At5g25220</a></td>
		<td>KNAT3</td>
		<td>KNAT3 homeodomain protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g11060">At5g11060</a></td>
		<td>KNAT4</td>
		<td>HOMEOBOX PROTEIN KNOTTED-1 LIKE 4 (KNAT4)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g32040">At4g32040</a></td>
		<td>KNAT5</td>
		<td>homeodomain containing protein 1</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g23380">At1g23380</a></td>
		<td>KNAT6</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g62990">At1g62990</a></td>
		<td>KNAT7</td>
		<td>homeodomain-containing protein HD1, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g02560">At4g02560</a></td>
		<td>LD</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g17710">At4g17710</a></td>
		<td>&nbsp;</td>
		<td>GLABRA2 like protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g26960">At1g26960</a></td>
		<td>&nbsp;</td>
		<td>HD-Zip transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g01220">At3g01220</a></td>
		<td>&nbsp;</td>
		<td>HD-Zip transcription factor</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g17920">At1g17920</a></td>
		<td>&nbsp;</td>
		<td>homeobox protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g73360">At1g73360</a></td>
		<td>&nbsp;</td>
		<td>homeobox protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g27050">At1g27050</a></td>
		<td>&nbsp;</td>
		<td>homeobox RRM-containing protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g70920">At1g70920</a></td>
		<td>&nbsp;</td>
		<td>homeodomain leucine zipper protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g05230">At1g05230</a></td>
		<td>&nbsp;</td>
		<td>homeodomain protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g34650">At1g34650</a></td>
		<td>&nbsp;</td>
		<td>homeodomain protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g18550">At2g18550</a></td>
		<td>&nbsp;</td>
		<td>homeodomain protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g32370">At2g32370</a></td>
		<td>&nbsp;</td>
		<td>homeodomain protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g36610">At2g36610</a></td>
		<td>&nbsp;</td>
		<td>homeodomain protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g03260">At3g03260</a></td>
		<td>&nbsp;</td>
		<td>homeodomain protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g36740">At4g36740</a></td>
		<td>&nbsp;</td>
		<td>homeodomain protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g17320">At5g17320</a></td>
		<td>&nbsp;</td>
		<td>homeodomain protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g52170">At5g52170</a></td>
		<td>&nbsp;</td>
		<td>homeodomain protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g03790">At5g03790</a></td>
		<td>&nbsp;</td>
		<td>homeodomain protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g66700">At5g66700</a></td>
		<td>&nbsp;</td>
		<td>homeodomain transcription factor-like</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g46880">At5g46880</a></td>
		<td>&nbsp;</td>
		<td>homeodomain-leucine zipper protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g28420">At1g28420</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g75430">At1g75430</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g16400">At2g16400</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g27220">At2g27220</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g35940">At2g35940</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g34610">At4g34610</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g44180">At5g44180</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g46010">At5g46010</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g03250">At4g03250</a></td>
		<td>&nbsp;</td>
		<td>Similar to HOX7 (tomato)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g53980">At5g53980</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g04890">At4g04890</a></td>
		<td>PDF2</td>
		<td>homeodomain protein, Protodermal factor2 (PDF2)</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g27990">At2g27990</a></td>
		<td>POUND-FOOLISH</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g29940">At4g29940</a></td>
		<td>PRHA</td>
		<td>Homeodomain protein (PRHA). Expression of the gene</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g60690">At5g60690</a></td>
		<td>REV</td>
		<td>HD-Zip transcription factor, Revoluta</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g62360">At1g62360</a></td>
		<td>STM</td>
		<td>Required for shoot apical meristem (SAM) formation</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g18010">At3g18010</a></td>
		<td>WOX1</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g20710">At1g20710</a></td>
		<td>WOX10</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g03660">At3g03660</a></td>
		<td>WOX11</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g17810">At5g17810</a></td>
		<td>WOX12</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g35550">At4g35550</a></td>
		<td>WOX13</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g20700">At1g20700</a></td>
		<td>WOX14</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g59340">At5g59340</a></td>
		<td>WOX2</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g28610">At2g28610</a></td>
		<td>WOX3</td>
		<td>homeodomain transcription factor-related, WOX3</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g46480">At1g46480</a></td>
		<td>WOX4</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g11260">At3g11260</a></td>
		<td>WOX5</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g01500">At2g01500</a></td>
		<td>WOX6</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g05770">At5g05770</a></td>
		<td>WOX7</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g45980">At5g45980</a></td>
		<td>WOX8</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g33880">At2g33880</a></td>
		<td>WOX9</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g17950">At2g17950</a></td>
		<td>WUSCHEL</td>
		<td>&nbsp;</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
