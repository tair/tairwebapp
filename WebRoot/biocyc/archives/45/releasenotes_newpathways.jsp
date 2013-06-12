<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 4.0-->
<%String pageName = "Archives: AraCyc 4.5 - New pathways";
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
-->
</style>



<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Release Notes" />
</jsp:include>

<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<p align="center"><a name="Top"></a><img src="aracyc_files/aracyc_logo.gif" width="100" height="58"></p>
<p class="mainheader"> Archives: Newly added pathways in AraCyc 4.5 </p>
<p>This list summarizes the pathways that have been added to AraCyc in this release. <strong>Click on the pathway name</strong> to access directly the corresponding pathway detail page.</p>
<table width="100%"  border="0">
  <tr>
    <td width="42%">&nbsp;</td>
    <!--<td width="12%"><span class="style7"><a href="#Bottom">Bottom of page </a></span></td>-->
    <td width="46%">&nbsp;</td>
  </tr>
</table>
<dl>
<table width="100%" border="0" align="center">
  <tr>
    <td><table width="100%"  border="0">
      <tr>
        <td width="3%"><div align="center" name="A" class="style1">A</div></td>
        <td width="3%"><div align="center"><span class="style1">B</span></div></td>
        <td width="3%"><div align="center"><a href="#C">C</a></div></td>
        <td width="3%"><div align="center">D</div></td>
        <td width="3%"><div align="center">E</div></td>
        <td width="3%"><div align="center"><a href="#F">F</a></div></td>
        <td width="3%"><div align="center">G</div></td>
        <td width="3%"><div align="center"><a href="#H">H</a></div></td>
        <td width="3%"><div align="center">I</div></td>
        <td width="3%"><div align="center">J</div></td>
        <td width="3%"><div align="center">K</div></td>
        <td width="3%"><div align="center"><a href="#L">L</a></div></td>
        <td width="3%"><div align="center"><a href="#M">M</a></div></td>
        <td width="3%"><div align="center">N</div></td>
        <td width="3%"><div align="center"><a href="#O">O</a></div></td>
        <td width="3%"><div align="center"><a href="#P">P</a></div></td>
        <td width="3%"><div align="center"><a href="#Q">Q</a></div></td>
        <td width="3%"><div align="center"><a href="#R">R</a></div></td>
        <td width="3%"><div align="center">S</div></td>
        <td width="3%"><div align="center"><a href="#T">T</a></div></td>
        <td width="3%"><div align="center">U</div></td>
        <td width="3%"><div align="center">V</div></td>
        <td width="3%"><div align="center">W</div></td>
        <td width="3%"><div align="center">X</div></td>
        <td width="3%"><div align="center">Y</div></td>
        <td width="3%"><div align="center">Z</div></td>
        <!--<td width="3%"><div align="center" class="style5"><a href="#Super">Super-pathways</a></div></td>-->
      </tr>
    </table></td>
  </tr>
  
   <tr>
     <td>&nbsp;</td>
   </tr>
   
   <tr>
    <td width="100%"><a name="C"></a><strong>C. <!--</strong><span class="style7"><a href="#Top">Top</a></span>--></td>
  </tr>
   <tr>
     <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5372">carbon tetrachloride degradation </a></td>
   </tr>
  <tr>
    <td width="100%"><a name="F"></a><strong>F. <!--</strong><span class="style7"><a href="#Top">Top</a></span>--></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-1801">formaldehyde oxidation (glutathione-dependent)</a></td>
  </tr>
    <tr>
    <tr>
    <td width="100%"><a name="H"></a><strong>H. <!--</strong><span class="style7"><a href="#Top">Top</a></span>--></td>
  </tr>
    <tr>
     <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5474">hydroxycinnamic acid tyramine amides biosynthesis </a></td>
   </tr>
    <tr>
    <td width="100%"><a name="L"></a><strong>L. <!--</strong><span class="style7"><a href="#Top">Top</a></span>--></span></td>
  </tr>
   <tr>
     <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY0-501">lipoate biosynthesis and incorporation </a></td>
   </tr>
   <tr>
    <td width="100%"><a name="M"></a><strong>M. <!--</strong><span class="style7"><a href="#Top">Top</a></span>--></td>
  </tr>
   <tr>
     <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY0-1300">2-<em>O</em>-&alpha;-mannosyl-D-glycerate degradation </a></td>
   </tr>
   <tr>
     <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY0-1301">melibiose degradation </a></td>
   </tr>
   <tr>
     <td><a name="O"></a><strong>O. <!--</strong><span class="style7"><a href="#Top">Top</a></span>--></td>
   </tr>
   <tr>
     <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY66-162">oxidative ethanol degradation </a></td>
   </tr>
   <tr
   <tr>
     <td><a name="P"></a><strong>P. <!--</strong><span class="style7"><a href="#Top">Top</a></span>--></td>
   </tr>
   <tr>
     <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5486">pyruvate fermentation to ethanol </a></td>
   </tr>
   <tr>
     <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5481">pyruvate fermentation to lactate </a></td>
   </tr>
   <tr>
    <td width="100%"><a name="R"></a><strong>R. <!--</strong><span class="style7"><a href="#Top">Top</a></span>--></td>
  </tr>
   <tr>
     <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5723">RUBISCO shunt</a></td>
   </tr>
   <tr>
    <td width="100%"><a name="T"></a><strong>T. <!--</strong><span class="style7"><a href="#Top">Top</a></span>--></td>
  </tr>
   <tr>
     <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5350">thiosulfate disproportionation (rhodanese) </a></td>
   </tr>
   <tr>
     <td>&nbsp;</td>
   </tr>
  <!--<tr>
    <td><a name="Super" id="Super"></a><strong>Superpathways. </strong><span class="style7"><a href="#Top">Top</a></span></td>
  </tr>
  <tr>
    <td><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PHOTOALL-PWY">photosynthesis</a></td>
  </tr>-->
 

</table>
</dl>
<p><a name="Bottom"></a>A complete list of <b><a href="releasenotes_allnewpathways.jsp">all new pathways</a> </b>added <b>since AraCyc's initial build</b>.</p>
<p><strong>AraCyc 4.5 </strong>'s release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives page</strong></a>.</p>
<table width="100%"  border="0">
  <tr>
    <td width="42%">&nbsp;</td>
    <!--<td width="10%"><span class="style7"><a href="#Top">Top of page </a></span></td>-->
    <td width="48%">&nbsp;</td>
  </tr>
</table>
<strong><em>Last modified</em>:</strong> <em>June 11, 2008</em></div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

