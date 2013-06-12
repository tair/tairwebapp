<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 4.0-->
<%String pageName = "Archives AraCyc 4.0 - Deleted Pathways";
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
.style5 {font-size: x-small}
.style7 {font-size: xx-small; font-style: italic; }
.style8 {font-size: small}
-->
</style>



<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Release Notes" />
</jsp:include>

<div id="rightcolumn">
<!-- CONTENT IN HERE -->
<span class="mainheader"><a name="Top"></a>Archives: All pathways deleted from the database (AraCyc 4.0) </span>
<p>A number of pathways have been deleted from the AraCyc database <em><strong>since its inception</strong></em>. These pathways had previously been computationally predicted. After an extensive literature search, many of those pathways have been found to be invalid in <em>Arabidopsis thaliana</em> and have been deleted, or have been replaced by a variant better representing <em>Arabidopsis</em> metabolism.</p>
<div align="center"><br>
    <em><strong>Note:</strong></em> on this page, all pathways deleted from AraCyc listed below are <strong>hyperlinked</strong> to their corresponding MetaCyc pathways</div>
<table width="100%"  border="0">
  <tr>
    <td width="42%">&nbsp;</td>
    <td width="12%"><span class="style7"><a href="#Bottom">Bottom of page </a></span></td>
    <td width="46%">&nbsp;</td>
  </tr>
</table>
<dl>
      <table width="100%" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td colspan="2"><table width="100%"  border="0">
            <tr>
              <td width="3%"><div align="center" name="A" class="style6"><a href="#A">A</a></div></td>
              <td width="3%"><div align="center"><a href="#B">B</a></div></td>
              <td width="3%"><div align="center"><a href="#C">C</a></div></td>
              <td width="3%"><div align="center"><a href="#D">D</a></div></td>
              <td width="3%"><div align="center"><a href="#E">E</a></div></td>
              <td width="3%"><div align="center"><a href="#F">F</a></div></td>
              <td width="3%"><div align="center"><a href="#G">G</a></div></td>
              <td width="3%"><div align="center"><a href="#H">H</a></div></td>
              <td width="3%"><div align="center"><a href="#I">I</a></div></td>
              <td width="3%"><div align="center">J</div></td>
              <td width="3%"><div align="center">K</div></td>
              <td width="3%"><div align="center"><a href="#L">L</a></div></td>
              <td width="3%"><div align="center"><a href="#M">M</a></div></td>
              <td width="3%"><div align="center"><a href="#N">N</a></div></td>
              <td width="3%"><div align="center"><a href="#O">O</a></div></td>
              <td width="3%"><div align="center"><a href="#P">P</a></div></td>
              <td width="3%"><div align="center">Q</div></td>
              <td width="3%"><div align="center"><a href="#R">R</a></div></td>
              <td width="3%"><div align="center"><a href="#S">S</a></div></td>
              <td width="3%"><div align="center"><a href="#T">T</a></div></td>
              <td width="3%"><div align="center"><a href="#U">U</a></div></td>
              <td width="3%"><div align="center"><a href="#V">V</a></div></td>
              <td width="3%"><div align="center">W</div></td>
              <td width="3%"><div align="center"><a href="#X">X</a></div></td>
              <td width="3%"><div align="center">Y</div></td>
              <td width="3%"><div align="center">Z</div></td>
              <td width="3%"><div align="center" class="style5"><a href="#Super" class="style5">Super-pathways</a></div></td>
            </tr>
        </table></td>
	    </tr>
	  <tr>
    <td width="50%"><strong>Pathways deleted </strong><em>(MetaCyc hyperlink) </em></td>
    <td width="50%"><strong>Replaced by </strong><em>(in AraCyc) </em><strong>: </strong></td>
  </tr>
      <tr><td><a name="A" id="A"></a><strong>A. </strong><span class="style7"><a href="#Top">Top</a></span></td><td></td>
 </tr>
	  <tr>
	    <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P142-PWY">acetate fermentation </a></td>
        <td class="xl24" width="50%">&nbsp;</td>
	  </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=acetateutil-PWY">acetate utilization </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P22-PWY">acetyl-CoA assimilation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=AERESPDON-PWY">aerobic respiration electron donor list </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3781">aerobic respiration </a></td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ALACAT2-PWY">alanine degradation II</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY0-41">allantoin degradation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=AMMASSIM-PWY">ammonia assimilation cycle </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3282">ammonia assimilation </a></td>
      </tr>
      <tr>
        <td align="left">anthocyanin biosynthesis<span class="xl24"><span class="xl24 style2 style8"> <em>(pathway ID 'PWY1F-823', now corresponds to leucopelargonidin and leucocyanidin biosynthesis)</em></span></span></td>
        <td width="50%" align="left"><p class="xl24">i) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-641">proanthocyanidin biosynthesis from flavonols</a><br>
        ii) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5125">anthocyanin biosynthesis<em> (pelargonidin-3-</em>O<em>-glucoside, cyanidin-3-</em>O<em>-glucoside)</em></a><br>
        iii) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY1F-823">leucopelargonidin and leucocyanidin biosynthesis</a></p></td>
       </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=DARABCAT-PWY">D-arabinose degradation II </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARABCAT-PWY">L-arabinose degradation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARGDEG-II-PWY">arginine degradation II </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARGDEG-V-PWY">arginine degradation V </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARG-GLU-PWY">arginine degradation IX </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ASPARAGINE-DEG1-PWY">asparagine degradation I</a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4001">asparagine degradation I</a></td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ASPARTATE-DEG1-PWY">aspartate degradation I </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=MALATE-ASPARTATE-SHUTTLE-PWY">aspartate degradation II </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td align="left"><a name="B" id="B"></a><strong>B. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P124-PWY">bifidum pathway</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=BIOTIN-BIOSYNTHESIS-PWY">biotin biosynthesis I</a></td>
         <td width="50%" align="left"><span class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3701">biotin biosynthesis</a></span></td>
       </tr>
	         <tr>
         <td align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P125-PWY">butanediol fermentation</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td align="left"><a name="C"></a><strong>C. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY-241">C4 photosynthetic carbon assimilation cycle</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td class="x124">camalexin biosynthesis <span class="xl24 style2 style8"><em>(pathway ID 'camalexin-biosynthesis', no longer exists in either MetaCyc or AraCyc)</em></span></td>
         <td class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=CAMALEXIN-SYN">camalexin biosynthesis</a> </td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=CODH-PWY"><span class="xl22">carbon monoxide dehydrogenase pathway </span></a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td class="x124"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=CARNMET-PWY">carnitine degradation</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P381-PWY">cobalamin biosynthesis II<em> (aerobic pathway)</em></a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=COLANSYN-PWY"><span class="xl22">colanic acid building blocks biosynthesis </span></a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY0-541">cyclopropane fatty acid biosynthesis</a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4188">cyclopropane and cyclopropene fatty acid biosynthesis</a></td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=CYSTEINE-SYN2-PWY">cysteine biosynthesis II </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td align="left"><a name="D" id="D"></a><strong>D. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ACETOACETATE-DEG-PWY">degradation of short-chain fatty acids </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=DHGLUCONATE-PYR-CAT-PWY">2-dehydro-D-gluconate degradation</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=DENITRIFICATION-PWY">denitrification pathway</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P126-PW">diacetyl fermentation</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=DISSULFRED-PWY">dissimilatory sulfate reduction </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=DTDPRHAMSYN-PWY">dTDP-rhamnose biosynthesis </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3221">dTDP-L-rhamnose biosynthesis </a></td>
      </tr>
       <tr>
         <td align="left"><a name="E" id="E"></a><strong>E. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ECASYN-PWY">enterobacterial common antigen biosynthesis</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ENTNER-DOUDOROFF-PWY">Entner-Doudoroff pathway</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td align="left"><a name="F" id="F"></a><strong>F. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=FAO-PWY">fatty acid &beta;-oxidation I</a></td>
         <td align="left"> - <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5136">fatty acid &beta;-oxidation I<em> (saturated)</em></a> </td>
       </tr>
       <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=FASYN-INITIAL-PWY">fatty acid biosynthesis - initial steps</a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4381">fatty acid biosynthesis - initial steps</a></td>
      </tr>
	<tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=UNSAT-FA-ELONG-PWY">fatty acid elongation-unsaturated </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY-1622">formaldehyde assimilation I<em> (serine pathway)</em> </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=RUMP-PWY">formaldehyde oxidation I</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=1CMET2-PWY">formylTHF biosynthesis</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td align="left"><a name="G" id="G"></a><strong>G. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=MANGDPMET-PWY">GDP-mannose metabolism </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=GDP-RHAMSYN-PWY"><span class="xl22">GDP-D-rhamnose biosynthesis </span></a></td>
        <td align="left">&nbsp;</td>
      </tr>
      <tr>
        <td valign="middle" class="xl24">gibberellin biosynthesis<span class="xl24 style2 style8"> <em>(pathway ID 'PWY1F-141', no longer exists in either MetaCyc or AraCyc)</em></span></td>
        <td width="50%" class="xl24"><p>i) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5034">GA12 biosynthesis </a><br>
  ii) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5070">gibberellin biosynthesis I </a><br>
  iii) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5036">gibberellin biosynthesis II </a><br>
      iv) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5035">gibberellin biosynthesis III </a><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4321"></a></p></td>
      </tr>
      <tr>
        <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=GLUCONEO-PWY"><span class="xl22">gluconeogenesis </span></a></td>
        <td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4428">gluconeogenesis</a></td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUAMCAT-PWY">glucosamine degradation</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=glucose1pmetab-PWY">glucose and glucose-1P degradation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
        <td align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUCUROCAT-PWY">&beta;-D-glucuronide degradation</a></td>
        <td width="50%" align="left">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUTSYN-PWY">glutamate biosynthesis I </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUDEG-I-PWY">glutamate degradation I </a></td>
        <td width="50%" class="xl24">i) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3322">glutamate degradation I </a> <br> 
          ii)
<a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4321">glutamate degradation II </a></td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUTOXA-PWY">glutamate degradation VII</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUTORN-PWY">glutamate degradation VIII</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUTAMINEFUM-PWY">glutamine degradation III </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=P81-PWY"><span class="xl22">glyceraldehyde 3-phosphate degradation </span></a></td>
        <td align="left">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=AERO-GLYCEROL-CAT-PWY">glycerol degradation II </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4261">glycerol degradation</a> </td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=TEICHOICACID-PWY">glycerol teichoic acid biosynthesis</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLYCEROLMETAB-PWY">glycerol metabolism </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4261">glycerol degradation</a> </td>
      </tr>
       <tr>
         <td align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLYCOGENSYNTH-PWY">glycogen biosynthesis</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLYCOLATEMET-PWY">glycolate degradation I</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P341-PWY">glycolysis II</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ANAGLYCOLYSIS-PWY">glycolysis III</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td align="left"><a name="H" id="H"></a><strong>H. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P122-PWY">heterofermentative lactate fermentation</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=HOMOCYSDEGR-PWY">homocysteine degradation I</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td align="left"><a name="I" id="I"></a><strong>I. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=IDNCAT-PWY">L-idonate degradation</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARGORNPROST-PWY">interconversion of arginine, ornithine and proline</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ILEUDEG-PWY">isoleucine degradation I </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td align="left"><a name="L" id="L"></a><strong>L. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=lctacacat-PWY">lactate oxidation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=LEUDEG-PWY">leucine degradation I </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY-541">lipoxygenase pathway</a></td>
         <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5410">13-LOX and 13-HPL pathway</a></td>
       </tr>
       <tr>
         <td align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=DAPLYSINESYN-PWY">lysine biosynthesis</a> </td>
         <td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5097">lysine biosynthesis</a> </td>
       </tr>
       <tr>
         <td align="left"><a name="M" id="M"></a><strong>M. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=PWY-3881"><span class="xl22">mannitol biosynthesis </span></a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=MANNIDEG-PWY">mannitol degradation</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
	       <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=MANNICAT-PWY">mannose degradation</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
	       <tr>
             <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=MENAQUINONESYN-PWY"><span class="xl22">menaquinone biosynthesis </span></a></td>
             <td align="left">&nbsp;</td>
        </tr>
	       <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=methanogenesis-PWY">methanogenesis from CO2 </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=HOMOSER-METSYN-PWY">methionine biosynthesis I</a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-702">methionine biosynthesis</a></td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=HSERMETANA-PWY">methionine biosynthesis III</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ADENOSYLHOMOCYSCAT-PWY">methionine biosynthesis IV</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=METHIONINE-DEG1-PWY">methionine degradation I</a></td>
        <td class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=METHGLYUT-PWY">methylglyoxylate biosynthesis </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=fermentation-PWY">mixed acid fermentation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td align="left"><a name="N" id="N"></a><strong>N. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td valign="top" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLCMANNANAUT-PWY"><em>N</em>-acetylglucosamine , <em>N</em>-acetylmannosamine and <em>N</em>-acetylneuraminic acid dissimilation</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td valign="top" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=NADSYN-PWY">NAD biosynthesis II<em> (from tryptophan)</em></a></td>
         <td class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td valign="top" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=NAD+BIOSYNTHESIS+II">NAD biosynthesis II</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=NAD+BIOSYNTHESIS+III">NAD biosynthesis III </a></td>
        <td width="50%" class="xl24">i) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PYRIDNUCSYN-PWY">NAD biosynthesis I (from aspartate) </a><br>
         ii) NAD biosynthesis II<em> (from tryptophan)</em><span class="style8"><em> (now also deleted from AraCyc) </em></span></td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=NPGLUCAT-PWY">non-phosphorylated glucose degradation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td align="left"><a name="O" id="O"></a><strong>O. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=OANTIGEN-PWY"><em>O</em>-antigen biosynthesis</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P221-PWY">octane oxidation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td align="left"><a name="P" id="P"></a><strong>P. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PANTO-PWY">pantothenate biosynthesis I </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3921">pantothenate biosynthesis</a></td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PEPTIDOGLYCANSYN-PWY">peptidoglycan biosynthesis </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PEP-LIPA-SYN-PWY">peptidoglycan and lipid A precursor biosynthesis</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PHENYLALANINE-DEG1-PWY">phenylalanine degradation</a></td>
        <td class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PHOSLIPSYN-PWY">phospholipid biosynthesis I</a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PHOSLIPSYN2-PWY">phospholipid biosynthesis II</a></td>
      </tr>
      <tr>
        <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=POLYAMINSYN3-PWY"><span class="xl22">polyamine biosynthesis </span></a></td>
        <td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-94">polyamine biosynthesis</a> </td>
      </tr>
      <tr>
        <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=POLYISOPRENSYN-PWY"><span class="xl22">polyisoprenoid biosynthesis </span></a></td>
        <td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4449">polyisoprenoid biosynthesis <em></em></a></td>
      </tr>
      <tr>
        <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=POLYISOPRENSYN-PWY"><span class="xl22">ppGpp biosynthesis </span></a></td>
        <td align="left">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PROSYN-PWY">proline biosynthesis I </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3341">proline biosynthesis </a></td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY-921">proline degradation II </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PROUT-PWY">proline degradation I </a></td>
	 <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4137">proline degradation</a></td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P164-PWY">purine fermentation</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PYRIDOXSYN-PWY">pyridoxal 5'-phosphate biosynthesis </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24">pyridine nucleotide cycling<span class="xl24 style2 style8"> <em>(pathway ID 'PYRNUCYC-PWY', no longer exists in either MetaCyc or AraCyc)</em></span></td>
        <td class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5381">pyridine nucleotide cycling<em> (plants)</em></a></td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PYRUVOX-PWY">pyruvate oxidation pathway </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td align="left"><a name="R" id="R"></a><strong>R. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ANARESP1-PWY">respiration<em> (anaerobic)</em></a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=RIBUTOLUTIL-PWY">ribitol degradation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td align="left"><a name="S" id="S"></a><strong>S. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=SALVADEHYPOX-PWY">salvage pathways of adenine, hypoxanthine, and their nucleosides</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P1-PWY">salvage pathways of purine and pyrimidine nucleotides</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P121-PWY">salvage pathways of purine nucleosides</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY0-181">salvage pathways of pyrimidine deoxyribonucleotides</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P106-PWY">serine-isocitrate lyase pathway </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P461-PWY">sorbitol fermentation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P108-PWY">succinate-propionate fermentation pathway</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=SUCUTIL-PWY">sucrose degradation I</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=SO4ASSIM-PWY">sulfate assimilation</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY-781">sulfate assimilation II</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td align="left"><a name="T" id="T"></a><strong>T. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=TCA"><span class="xl22">TCA cycle - aerobic respiration</span></a></td>
         <td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4452">TCA cycle <em></em></a></td>
       </tr>
       <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P104-PWY">TCA cycle variation VII </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P105-PWY">TCA cycle variation VIII </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P82-PWY">TCA cycle variation IV </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=FOLSYN-PWY">tetrahydrofolate biosynthesis II</a></td>
        <td class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=THRDLCTCAT-PWY"><span class="xl22">threonine degradation </span></a></td>
        <td align="left">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=TREDEGLOW-PWY">trehalose biosynthesis and degradation -- low osmolarity</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY-881">trehalose biosynthesis II </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=TRESYN-PWY">trehalose biosynthesis </a></td>
      </tr>
      <tr>
        <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=trehalosesyn-PWY">trehalose biosynthesis III </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=TRESYN-PWY">trehalose biosynthesis </a></td>
      </tr>
       <tr>
         <td align="left"><a name="U" id="U"></a><strong>U. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=UBISYN-PWY"><span class="xl22">ubiquinone biosynthesis</span></a></td>
         <td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4448">ubiquinone biosynthesis <em></em></a></td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=P61-PWY"><span class="xl22">UDP-glucose conversion</span></a></td>
         <td align="left"><span class="xl24">i) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4436">UDP-glucose biosynthesis (from glucose 6-P)</a><br>
    ii) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4437">UDP-galactose biosynthesis</a></span></td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=UDPNACETYLGALSYN-PWY">UDP-<em>N</em>-acetylgalactosamine biosynthesis</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=UDPNAGSYN-PWY"><span class="xl22">UDP-<em>N</em>-acetyl-D-glucosamine biosynthesis</span></a></td>
         <td align="left"><span class="xl22">- </span><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4431"><span class="xl22">UDP-<em>N</em>-acetyl-D-glucosamine biosynthesis</span></a></td>
       </tr>
       <tr>
         <td align="left"><a name="V" id="V"></a><strong>V. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=VALDEG-PWY">valine degradation I </a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td align="left"><a name="X" id="X"></a><strong>X</strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P185-PWY">xylulose-monophosphate cycle</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a name="Super" id="Super"></a><strong>Superpathways. </strong><span class="style7"><a href="#Top">Top</a></span></td>
         <td class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=PWY0-781">aspartate superpathway</a></td>
         <td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-724">superpathway of lysine, methionine and threonine biosynthesis</a></td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PANTOSYN-PWY">pantothenate/coenzymeA biosynthesis superpathway </a></td>
         <td class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4221">superpathway of pantothenate/coenzymeA biosynthesis</a></td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARGDEG-PWY">superpathway of arginine, putrescine, and 4-aminobutyrate degradation </a></td>
         <td class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLYCOLYSIS/E-D">superpathway glycolysis+Entner Doudoroff </a></td>
         <td class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY1G-2">superpathway glycolysis+TCA variation VIII </a></td>
         <td class="xl24">&nbsp;</td>
       </tr>
    </table>
</dl>
<p><a name="Bottom"></a>List of <b><a href="releasenotes_deletedpathways.jsp">deleted pathways</a> </b>in this release.</p>
<p><strong>AraCyc 4.0 </strong>'s release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<table width="100%"  border="0">
  <tr>
    <td width="42%">&nbsp;</td>
    <td width="12%"><span class="style7"><a href="#Top">Top of page </a></span></td>
    <td width="46%">&nbsp;</td>
  </tr>
</table>
<p>  <strong><em>Last modified</em>: </strong><em>July 3, 2007</em></p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

