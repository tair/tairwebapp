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

<p class="mainheader">Archives: All pathways added to the database (AraCyc 2.5)</p>
<p>This is a list of all the pathways that have been added to the AraCyc database <em><strong>since its inception</strong></em>.</p>
<p>AraCyc 2.5's release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<br>
<dl>
 <table width="100%" border="0" align="center">
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-695">abscisic acid biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3781">aerobic respiration </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3282">ammonia assimilation </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY1F-402">arabidopsis flavonoid biosynthesis</a></td>
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
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=aromatic-amino-acid-biosyn-plants">aromatic amino acid biosynthesis (plants)</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-882">ascorbate biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2261">ascorbate glutathione cycle</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4001">asparagine degradation I</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-581">auxin biosynthesis</a> </td>
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
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/new-image?type=PATHWAY&object=PWY-699&detail-level=3">brassinosteroid biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2582">brassinosteroid biosynthesis II</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2602">brassinosteroid biosynthesis III</a> </td>
  </tr>
   <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=camalexin-biosynthesis">camalexin biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=CAROTENOID-PWY">carotene biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1001">cellulose biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=CHLOROPHYLL-SYN">chlorophyll biosynthesis</a> </td>
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
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2781">cis-zeatin biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-321">cutin biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4188">cyclopropane and cyclopropene fatty acid biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY1F-2">cytokinin biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2881">cytokinins 7-N-glucoside biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2901">cytokinins 9-N-glucoside biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2902">cytokinins-O-glucoside biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2841">cytokinins degradation</a> </td>
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
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4381">fatty acid biosynthesis - initial steps</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2501">fatty acid oxidation pathway II</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2724">fatty acid oxidation pathway III</a> </td>
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
    <td width="100%">gibberellin biosynthesis <em>(has been deleted and replaced)</em> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1187">glucosinolate biosynthesis from homomethionine</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2821">glucosinolate biosynthesis from phenylalanine</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-601">glucosinolate biosynthesis from tryptophan</a> </td>
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
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4261">glycerol degradation</a>    </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1042">glycolysis IV </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-401">glycosylglycerate biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-782">glycosylglyceride desaturation pathway</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-561">glyoxylate cycle II</a> </td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%" height="21"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1061">homogalacturonan biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1081">homogalacturonan degradation</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1186">homomethionine biosynthesis</a> </td>
  </tr>
   <tr>
    <td width="100%">~ </td>
  </tr>
 <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1822">IAA biosynthesis II</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1782">IAA conjugate biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-735">jasmonic acid biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-361">lignin biosynthesis</a> </td>
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
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3041">monoterpene biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=NADSYN-PWY">NAD biosynthesis II (from tryptophan) </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-381">nitrate assimilation pathway</a> </td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3921">pantothenate biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
 <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3462">phenylalanine biosynthesis I </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2181">phenylpropanoid biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=sinapoyl+malate+biosynthesis">phenylpropanoid ester biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-762">phospholipid desaturation pathway</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-181">photorespiration</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-101">photosynthesis (plant)</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1581">plastoquinone biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-641">proanthocyanidin biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3341">proline biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4137">proline degradation</a> </td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-981">salicylic acid biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3301">sinapate ester biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-622">starch biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=NIL&object=PWY-842">starch degradation</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2541">sterol biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1121">suberin biosynthesis</a> </td>
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
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2681"><em>trans</em>-zeatin biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3461">tyrosine biosynthesis II </a></td>
  </tr> 
  <tr>
    <td width="100%">~ </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1422">vitamin E biosynthesis</a> </td>
  </tr>
  <tr>
    <td width="100%">~ </td>
  </tr>
 <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1141">xanthophyll cycle</a> </td>
  </tr>
   <tr>
    <td width="100%">~ </td>
  </tr>
 <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555//ARA/NEW-IMAGE?type=PATHWAY&object=PWY-282">wax biosynthesis</a> </td>
  </tr>
    <tr>
    <td width="100%"><div align="center">-----------</div></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4762">superpathway of choline biosynthesis </a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4221">superpathway of pantothenate/coenzymeA biosynthesis</a> </td>
  </tr>
</table>
</dl>
<p>List of <b><a href="releasenotes_newpathways.jsp">new pathways</a> </b>added <b>in AraCyc 2.5</b>.</p>
<br>
<p>AraCyc 2.5's release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<strong><em>Date of release</em>:</strong> <em>November 2005</em></div>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

