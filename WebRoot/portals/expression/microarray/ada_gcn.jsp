<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%!
String pageName = "TAIR - Gene Expression - Microarray - Public Datasets";
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

<jsp:include page="/jsp/includes/expressionSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Datasets"/>  
</jsp:include>

		<div id="rightcolumn">
		<span class="mainheader">Gene Expression in transcriptional coactivator mutants ada2b-1 and gcn5-1</span>
<P>

<font size="+1"><b>Experimental design</b></font>
<br><br>
<b>Experiment Goal</b>: To identify genes whose expression is affected by
null mutations in the Arabidopsis ADA2b and GCN5 genes.
<br><br>
<b>Experiment Description</b>:  

We previously identified Arabidopsis genes homologous to the yeast ADA2
and GCN5 genes that encode components of the ADA and SAGA histone
acetyltransferase complexes. In this report, we explore the biological
roles of the Arabidopsis ADA2b and GCN5 genes.&#239;&#191;&#189; T-DNA insertion mutations
in ADA2b and GCN5 were found to have pleiotropic effects on plant growth
and development, including dwarf size, aberrant root development, and
short petals and stamens in flowers.&#239;&#191;&#189; Approximately 5% of the 8200 genes
assayed by DNA microarrays showed changes in expression in the mutants,
three-fourths of which were up-regulated and only half of which were
altered similarly in the two mutant strains.&#239;&#191;&#189; In cold acclimation
experiments, the CBF transcription factors were induced as in wildtype
plants, but subsequent transcription of cold-regulated (COR) genes was
reduced in both mutants. Remarkably, non-acclimated ada2b-1 (but not
gcn5-1) mutant plants were more freezing tolerant than non-acclimated
wildtype plants, suggesting that ADA2b may directly or indirectly repress
a freezing tolerance mechanism that does not require the expression of
CBF or COR genes.&#239;&#191;&#189; We conclude that the Arabidopsis ADA2b and GCN5
proteins have both similar and distinct functions in plant growth,
development and gene expression and may be components of both a common
coactivator complex and of separate complexes with distinct biological
activities.

<br><br>
<b>Ecotype</b>: Arabidopsis (L.) Heynh. ecotype Wassilewskija (Ws)-2
<br><br>
<b>Growth conditions</b>: Surface-sterilized seeds were germinated on Gamborg's B-5 medium solidified with 0.8% phytoagar.  After six days, seedlings were transplanted to soil and grown under constant illumination from cool-white fluorescent lights at 100-150 &#239;&#191;&#189;mol m-2 s-1.  
<br><br>
<b>Treatments</b>: Wildtype plants were compared with homozygous mutants bearing T-DNA disruptions of the ADA2b or GCN5 genes, designated ada2b-1 and gcn5-1 respectively.
<br><br>
<b>Samples</b>: Approximately 21 to 25 days after germination (i.e., before bolting), aerial tissues were collected and frozen in liquid nitrogen.  Duplicate samples were collected, comprising 9 wildtype plants, 18 gcn5-1 homozygous mutant plants, or 27 ada2b-1 homozygous mutant plants.
<br><br>
<b>RNA isolation</b>: Total RNA was isolated from tissue samples using the Qiagen Rneasy Plant Mini Kit.  cDNA was synthesized using the Superscript Choice system (Gibco BRL Life Technologies) with 24 ug total RNA and 100 pmol of a primer comprising oligoT(24) linked to a 5' T7 RNA polymerase promoter sequence.  Biotinylated target RNA was synthesized using T7 RNA polymerase labeling kit (ENZO) and purified as outlined by the manufacturer of the Arabidopsis GeneChip. 
<P>
<font size="+1"><b>Contact</b></font>: 
<a href="/servlets/Community?action=view&type=person&communityID=3127">Triezenberg, Steven</a>; <a href="/servlets/Community?action=view&type=person&communityID=4699">Thomashow, Michael</a> 
<P>
<font size="+1"><b>Publication</b></font>: K. E. Vlachonasios, M. F. Thomashow, and S. J. Triezenberg.&#239;&#191;&#189; Disruption
mutations of Arabidopsis ADA2b and GCN5 transcriptional adaptor genes
dramatically affect plant growth, development and gene expression.&#239;&#191;&#189; Plant
Cell Volume 15, Number 3, March 2003 (in press).

<br><br><br>
<font size="+1"><b>Sample Descriptions</b></font>:
<br><br>
<font size="+1"><i>Single datasets</i></font>:
<br><br>

<table cellspacing="8">

<tr>
<td><b>Condition</b></td><td><b>Data file name</b></td>
</tr><tr>
<td>Wildtype:</td><td><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/wt1.txt">wt1</a>, <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/wt2.txt">wt2</a></td>
</tr><tr>
<td><i>ada2b-1</i>:</td><td>    <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/ada2b-3.txt">ada2b-3</a>, <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/ada2b-4.txt">ada2b-4</a></td>
</tr><tr>
<td><i>gcn5-1</i></td><td>     <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/gcn5-5.txt">gcn5-5</a>, <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/gcn5-6.txt">gcn5-6</a></td>
</tr>

</table>


<br>
<p>
<font size="+1"><i>Comparison datasets</i>:</font></p>

<table cellspacing="8">

<tr><td><b>Condition compared</b></td><td><b>Data file name</b></td>
</tr>
<tr><td>
wt vs wt: </td><td>   <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/wt2_v_wt1.txt">wt2_v_wt1</a></td>
</tr><tr><td> 
ada2b-1 vs ada2b-1: </td><td>  <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/ada2-4_v_ada2b-3.txt">ada2b-4_v_ada2b-3</a></td>
</tr><tr><td> 
gcn5-1 vs gcn5-1: </td><td>   <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/gcn5-6_v_gcn5-5.txt">gcn5-6_v_gcn5-5</a></td>
</tr><tr><td> 
wt vs ada2b-1: </td><td>   <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/ada2b-3_v_wt1.txt">ada2b-3_v_wt1</a>, <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/ada2b-3_v_wt2.txt">ada2b-3_v_wt2.</a>, <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/ada2b-4_v_wt1.txt">ada2b-4_v_wt1</a>, <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/ada2b-4_v_wt2.txt">ada2b-4_v_wt2</a>
</td></td>
</tr><tr><td> 
wt vs. gcn5-1:</td><td><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/gcn5-5_v_wt1.txt">gcn5-5_v_wt1</a>, <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/g5s1-5_v_wt2.txt">gcn5-5_v_wt2</a>, <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/gcn5-6_v_wt1.txt">gcn5-6_v_wt1</a>, <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/Triezenberg/gcn5-6_v_wt2.txt">gcn5-6_v_wt2</a></td>
</tr>

</table>
		</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
