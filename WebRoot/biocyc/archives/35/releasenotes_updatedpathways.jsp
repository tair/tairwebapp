<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 3.5-->
<%String pageName = "Archive AraCyc 3.5";
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
<style type="text/css">
<!--
.style1 {color: #000000}
.style5 {font-size: x-small}
.style7 {font-size: xx-small; font-style: italic; }
.style8 {
	font-size: small;
	font-style: italic;
}
-->
</style>



<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Release Notes" />
</jsp:include>

<div id="rightcolumn">
<!-- CONTENT IN HERE -->
<p class="mainheader"><a name="Top"></a>Archives: Pathways updated in AraCyc 3.5</p>
<p>These pathways already existed in the AraCyc but have had their information updated in this release. <strong>Click on the pathway name</strong> to directly access the corresponding pathway detail page.</p>
<table width="100%"  border="0">
  <tr>
    <td width="42%">&nbsp;</td>
    <td width="12%"><span class="style7"><a href="#Bottom">Bottom of page </a></span></td>
    <td width="46%">&nbsp;</td>
  </tr>
</table>
<dl>
<table width="100%" border="0" align="center">
  <tr>
    <td><table width="100%"  border="0">
        <tr>
          <td width="3%"><div align="center" name="A" class="style1"><a href="#A">A</a></div></td>
          <td width="3%"><div align="center"><a href="#B">B</a></div></td>
          <td width="3%"><div align="center"><a href="#C">C</a></div></td>
          <td width="3%"><div align="center">D</div></td>
          <td width="3%"><div align="center">E</div></td>
          <td width="3%"><div align="center"><a href="#F">F</a></div></td>
          <td width="3%"><div align="center"><a href="#G">G</a></div></td>
          <td width="3%"><div align="center"><a href="#H">H</a></div></td>
          <td width="3%"><div align="center">I</div></td>
          <td width="3%"><div align="center"><a href="#J">J</a></div></td>
          <td width="3%"><div align="center">K</div></td>
          <td width="3%"><div align="center">L</div></td>
          <td width="3%"><div align="center"><a href="#M">M</a></div></td>
          <td width="3%"><div align="center"><a href="#N">N</a></div></td>
          <td width="3%"><div align="center">O</div></td>
          <td width="3%"><div align="center"><a href="#P">P</a></div></td>
          <td width="3%"><div align="center">Q</div></td>
          <td width="3%"><div align="center"><a href="#R">R</a></div></td>
          <td width="3%"><div align="center"><a href="#S">S</a></div></td>
          <td width="3%"><div align="center"><a href="#T">T</a></div></td>
          <td width="3%"><div align="center"><a href="#U">U</a></div></td>
          <td width="3%"><div align="center">V</div></td>
          <td width="3%"><div align="center">W</div></td>
          <td width="3%"><div align="center">X</div></td>
          <td width="3%"><div align="center">Y</div></td>
          <td width="3%"><div align="center">Z</div></td>
          <td width="3%"><div align="center" class="style5">Super-pathways</div></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td><a name="A"></a><strong>A. </strong><span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-882">ascorbate biosynthesis </a></td>
  </tr>
  <tr>
    <td><a name="B" id="B"></a><strong>B.</strong> <span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=HEMESYN2-PWY">biosynthesis of proto- and siroheme</a></td>
  </tr>
  <tr>
    <td width="100%"><a name="C"></a><strong>C. </strong><span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=CITRULLINE-DEG-PWY">citrulline degradation</a></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=COA-PWY">coenzyme A biosynthesis </a></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-116">coniferin metabolism</a></td>
  </tr>
  <tr>
    <td width="100%"><a name="F"></a><strong>F. </strong><span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5136">fatty acid &beta;-oxidation I<em> (saturated) </em></a></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3101">flavonol biosynthesis</a></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2181">free phenylpropanoid acid biosynthesis</a><span class="style8"> (previously named 'phenylpropanoid biosynthesis') </span></td>
  </tr>
  <tr>
    <td width="100%"><a name="G"></a><strong>G. </strong><span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1187">glucosinolate biosynthesis from homomethionine</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2821">glucosinolate biosynthesis from phenylalanine</a> </td>
  </tr>
  <tr>
    <td width="100%"><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-601">glucosinolate biosynthesis from tryptophan</a> </td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=GLUTATHIONESYN-PWY">glutathione biosynthesis</a></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-782">glycolipid desaturation</a></td>
  </tr>
  <tr>
    <td><a name="H" id="H"></a><strong>H. </strong><span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=HISTSYN-PWY">histidine biosynthesis</a></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1186">homomethionine biosynthesis</a></td>
  </tr>
  <tr>
    <td><a name="J" id="J"></a><strong>J. </strong><span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-735">jasmonic acid biosynthesis</a></td>
  </tr>
  <tr>
    <td width="100%"><a name="M"></a><strong>M. </strong><span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=NONMEVIPP-PWY">MEP pathway</a> </td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=METHIONINE-DEG1-PWY">methionine degradation I</a> </td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-922">mevalonate pathway </a></td>
  </tr>
  <tr>
    <td><a name="N" id="N"></a><strong>N. </strong><span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PYRIDNUCSYN-PWY">NAD biosynthesis<em> (from aspartate)</em></a></td>
  </tr>
  <tr>
    <td><a name="P"></a><strong>P. </strong><span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-361">phenylpropanoid biosynthesis</a> <span class="style8">(previously named 'lignin biosynthesis') </span></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PHOSLIPSYN2-PWY">phospholipid biosynthesis</a> </td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-762">phospholipid desaturation</a></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=LIPASYN-PWY">phospholipases pathway</a> </td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=POLYAMSYN-PWY">polyamine biosynthesis I</a></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=BSUBPOLYAMSYN-PWY">polyamine biosynthesis II</a></td>
  </tr>
  <tr>
    <td><a name="R" id="R"></a><strong>R. </strong><span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=DETOX1-PWY">removal of superoxide radicals</a></td>
  </tr>
  <tr>
    <td width="100%"><a name="S"></a><strong>S. </strong><span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=SERSYN-PWY">serine biosynthesis</a></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3301">sinapate ester biosynthesis</a> </td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=ARGSPECAT-PWY">spermine biosynthesis I</a></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=ORNSPNANA-PWY">spermine biosynthesis II</a></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-2541">sterol biosynthesis</a></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=SULFMETII-PWY">sulfate assimilation</a> </td>
  </tr>
  <tr>
    <td width="100%"><a name="T"></a><strong>T. </strong><span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=TRIGLSYN-PWY">triacylglycerol biosynthesis</a> </td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=LIPAS-PWY">triacylglycerol degradation</a> </td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=TRPSYN-PWY">tryptophan biosynthesis</a></td>
  </tr>
  <tr>
    <td width="100%"><a name="U"></a><strong>U. </strong><span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3261">UDP-rhamnose biosynthesis</a></td>
  </tr>
</table>
</dl>

<p><strong>AraCyc 3.5</strong>'s release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p><a name="Bottom"></a>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<table width="100%"  border="0">
  <tr>
    <td width="42%">&nbsp;</td>
    <td width="10%"><span class="style7"><a href="#Top">Top of page </a></span></td>
    <td width="48%">&nbsp;</td>
  </tr>
</table>
<strong><em>Date of release:</em></strong> <em>February 2007</em></div>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

