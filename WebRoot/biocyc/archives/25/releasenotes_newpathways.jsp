<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 2.5 -->
<%String pageName = "Archive AraCyc 2.5";
String highlight = "4";
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
<!-- SIDEBAR -->

<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Release Notes" />
</jsp:include>

<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<p class="mainheader">Archives: Newly added pathways in AraCyc 2.5</p>
<p>This list summarizes the pathways that have been added to AraCyc in this release. <strong>Click on the pathway name</strong> to directly access the corresponding pathway detail page.</p>
<p>AraCyc 2.5's release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<br>
<dl>
<table width="100%" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3781">aerobic respiration </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3282">ammonia assimilation </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=ARGSYN-PWY">arginine biosynthesis </a></td>
  </tr>
   <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=ARGSYNBSUB-PWY">arginine biosynthesis II </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=ARGININE-SYN4-PWY">arginine biosynthesis III </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4001">asparagine degradation I</a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3981">beta-alanine biosynthesis I </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3941">beta-alanine biosynthesis II </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3982">beta-alanine biosynthesis III </a></td>
  </tr>
   <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3701">biotin biosynthesis II </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3385">choline biosynthesis I </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3542">choline biosynthesis II </a></td>
  </tr>
    <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3561">choline biosynthesis III </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4188">cyclopropane and cyclopropene fatty acid biosynthesis</a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3221">dTDP-L-rhamnose biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4381">fatty acid biosynthesis - initial steps</a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3841">formylTHF biosynthesis I </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3821">galactose degradation I </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=GLUGLNSYN-PWY">glutamate biosynthesis I </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4341">glutamate biosynthesis II </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3322">glutamate degradation I </a></td>
  </tr>
   <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4321">glutamate degradation II </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4261">glycerol degradation</a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=LYSINE-DEG1-PWY">lysine degradation II </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3881">mannitol biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3861">mannitol degradation I </a></td>
  </tr>
   <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4361">methionine salvage pathway </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=NADSYN-PWY">NAD biosynthesis II (from tryptophan) </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3921">pantothenate biosynthesis</a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3462">phenylalanine biosynthesis I </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3341">proline biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4137">proline degradation</a></td>
  </tr>
    <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3301">sinapate ester biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3801">sucrose degradation to ethanol and lactate (anaerobic) </a></td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=P103-PWY">TCA cycle variation I </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3742">tetrahydrofolate biosynthesis I </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3461">tyrosine biosynthesis II </a></td>
  </tr>
<!--<P> <B>Validated pathways:</B>
<UL>
<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=P344-PWY">acrylonitrile degradation </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-802">adenosylmethionine biosynthesis </a><img src="graphics/note.gif" title="This pathway was previously known as 'methionine and S-adenosylmethionine biosynthesis'" width="20" height="10">

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=ALANINE-SYN2-PWY">alanine biosynthesis </a><img src="graphics/note.gif" title="This pathway was previously known as 'alanine biosynthesis II'" width="20" height="10">
	
<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=ALANINE-DEG3-PWY">alanine degradation </a><img src="graphics/note.gif" title="This pathway was previously known as 'alanine degradation III'" width="20" height="10">

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=P345-PWY">aldoxime degradation </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=ARGSYN-PWY">arginine biosynthesis I </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=ARGDEG-III-PWY">arginine degradation I </a><img src="graphics/note.gif" title="This pathway was previously known as 'arginine degradation III'" width="20" height="10">

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=ARG-PRO-PWY">arginine degradation II </a><img src="graphics/note.gif" title="This pathway was previously known as 'arginine degradation VIII'" width="20" height="10">

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=ARGDEGRAD-PWY">arginine degradation III </a><img src="graphics/note.gif" title="This pathway was previously known as 'arginine degradation X'" width="20" height="10">

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=ARO-PWY">chorismate biosynthesis </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=CITRULLINE-DEG-PWY">citrulline degradation </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=COA-PWY">coenzyme A biosynthesis </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=COLANSYN-PWY">colanic acid building blocks biosynthesis </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=CYANCAT-PWY">cyanate degradation </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=DENOVOPURINE2-PWY">de novo biosynthesis of purine nucleotides </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-841">de novo biosynthesis of purine nucleotides II </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY0-166">de novo biosynthesis of pyrimidine deoxyribonucleotides </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYO-162">de novo biosynthesis of pyrimidine ribonucleotide </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=DRIBOPMET-PWY">(deoxy)ribose phosphate degradation </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3101">flavonol biosynthesis </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=GALACTMETAB-PWY">galactose degradation II </a><img src="graphics/note.gif" title="This pathway was previously known as 'galactose degradation I'" width="20" height="10">

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY1F-141">gibberellin biosynthesis </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=GLUTATHIONESYN-PWY">glutathione biosynthesis </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=GLYSYN-PWY">glycine biosynthesis </a><img src="graphics/note.gif" title="This pathway was previously known as 'glycine biosynthesis I'" width="20" height="10">

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=GLYCCAT-PWY">glycine degradation </a><img src="graphics/note.gif" title="This pathway was previously known as 'glycine degradation I'" width="20" height="10">

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1042">glycolysis I </a><img src="graphics/note.gif" title="This pathway was previously known as 'glycolysis IV'" width="20" height="10">

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=GLYCOLYSIS">glycolysis II </a><img src="graphics/note.gif" title="This pathway was previously known as 'glycolysis I'" width="20" height="10">

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=HISTSYN-PWY">histidine biosynthesis </a><img src="graphics/note.gif" title="This pathway was previously known as 'histidine biosynthesis I'" width="20" height="10">

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=NONMEVIPP-PWY">isopentenyl diphosphate biosynthesis - mevalonate independent </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=MANNIDEG-PWY">mannitol degradation II </a><img src="graphics/note.gif" title="This pathway was previously known as 'mannitol degradation'" width="20" height="10">

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=MENAQUINONESYN-PWY">menaquinone biosynthesis </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-922">mevalonate pathway </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PYRIDNUCSYN-PWY">NAD biosynthesis I (from aspartate) </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=NADSYN-PWY">NAD biosynthesis II (from tryptophan) </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=NADPHOS-DEPHOS-PWY">NAD phosphorylation and dephosphorylation </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=POLYISOPRESYN-PWY">polyisoprenoid biosynthesis </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PPGPPMET-PWY">ppGpp biosynthesis </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYO-662">PRPP biosynthesis I </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PYRNUCYC-PWY">pyridine nucleotide cycling </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PLPSAL-PWY">pyridoxal-5'-phosphate salvage pathway </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=DETOX1-PWY">removal of superoxide radicals </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=RIBOSYN2-PWY">riboflavin and FMN and FAD biosynthesis </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=SERSYN-PWY">serine biosynthesis </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-621">sucrose degradation </a><img src="graphics/note.gif" title="This pathway was previously known as 'sucrose degradation III'" width="20" height="10">

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=THISYN-PWY">thiamine biosynthesis </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=THRESYN-PWY">threonine biosynthesis </a>

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=TRESYN-PWY">trehalose biosynthesis </a><img src="graphics/note.gif" title="This pathway was previously known as 'trehalose biosynthesis I'" width="20" height="10">

<LI><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=TRNA-CHARGING-PWY">tRNA charging pathway </a>
</UL>
<P>A number of pathways have been renamed since our previous AraCyc release.  The old name of those pathways can be seen by hovering your mouse over the <span class="xl24"><img src="graphics/note.gif" width="20" height="10"></span> symbol next to the pathway name. -->
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
   <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4221">superpathway of pantothenate/coenzymeA biosynthesis</a></td>
  </tr>
</table>
</dl>
<p>A complete list of <b><a href="releasenotes_allnewpathways.jsp">all new pathways</a> </b>added <b>since AraCyc's initial build</b>.</p>
<br>
<p>AraCyc 2.5's release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<strong><em>Date of release</em>:</strong> <em>November 2005</em></div>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

