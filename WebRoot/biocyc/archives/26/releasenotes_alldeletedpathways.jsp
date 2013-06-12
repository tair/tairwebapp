<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 2.6 -->
<%String pageName = "Archive AraCyc 2.6";
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

<p class="mainheader">Archives: All pathways deleted from the database (AraCyc 2.6)</p>
<p>A number of pathways have been deleted from the AraCyc database <em><strong>since its inception</strong></em>. These pathways had previously been computationally predicted. After an extensive literature search, many of those pathways have been found to be invalid in <em>Arabidopsis thaliana</em> and have been deleted, or have been replaced by a variant better representing <em>Arabidopsis</em> metabolism.</p>
<div align="center"><br>
    <em><strong>Note:</strong></em> on this page, all pathways deleted from AraCyc listed below are <strong>hyperlinked</strong> to their corresponding MetaCyc pathways.</div>
<p>AraCyc 2.6's release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<br>
<dl>
      <table width="100%" align="center" cellpadding="0" cellspacing="0">
	  <tr>
    <td width="50%"><strong>Pathways deleted </strong><em>(MetaCyc hyperlink) </em></td>
    <td width="50%"><strong>Replaced by </strong><em>(in AraCyc) </em><strong>: </strong></td>
  </tr>
  <tr><td>&nbsp;</td></tr>
	  <tr>
	    <td class="xl24" width="50%"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P142-PWY">acetate fermentation </a></td>
        <td class="xl24" width="50%">&nbsp;</td>
	  </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=acetateutil-PWY">acetate utilization </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P22-PWY">acetyl-CoA assimilation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=AERESPDON-PWY">aerobic respiration electron donor list </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3781">aerobic respiration </a></td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ALACAT2-PWY">alanine degradation II</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY0-41">allantoin degradation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=AMMASSIM-PWY">ammonia assimilation cycle </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3282">ammonia assimilation </a></td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=DARABCAT-PWY">D-arabinose degradation II </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARABCAT-PWY">L-arabinose degradation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARGDEG-II-PWY">arginine degradation II </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARGDEG-V-PWY">arginine degradation V </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARG-GLU-PWY">arginine degradation IX </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" valign="top" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ASPARAGINE-DEG1-PWY">asparagine degradation I</a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4001">asparagine degradation I</a></td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ASPARTATE-DEG1-PWY">aspartate degradation I </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=MALATE-ASPARTATE-SHUTTLE-PWY">aspartate degradation II </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P124-PWY">bifidum pathway</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=BIOTIN-BIOSYNTHESIS-PWY">biotin biosynthesis I</a></td>
         <td width="50%" align="left"><span class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3701">biotin biosynthesis</a></span></td>
       </tr>
	         <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P125-PWY">butanediol fermentation</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY-241">C4 photosynthetic carbon assimilation cycle</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P381-PWY">cobalamin biosynthesis II (aerobic pathway)</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY0-541">cyclopropane fatty acid biosynthesis</a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4188">cyclopropane and cyclopropene fatty acid biosynthesis</a></td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=CYSTEINE-SYN2-PWY">cysteine biosynthesis II </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ACETOACETATE-DEG-PWY">degradation of short-chain fatty acids </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=DHGLUCONATE-PYR-CAT-PWY">2-dehydro-D-gluconate degradation</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=DENITRIFICATION-PWY">denitrification pathway</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P126-PW">diacetyl fermentation</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=DISSULFRED-PWY">dissimilatory sulfate reduction </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=DTDPRHAMSYN-PWY">dTDP-rhamnose biosynthesis </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3221">dTDP-L-rhamnose biosynthesis </a></td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ECASYN-PWY">enterobacterial common antigen biosynthesis</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ENTNER-DOUDOROFF-PWY">Entner-Doudoroff pathway</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=FASYN-INITIAL-PWY">fatty acid biosynthesis - initial steps</a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4381">fatty acid biosynthesis - initial steps</a></td>
      </tr>
	<tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=UNSAT-FA-ELONG-PWY">fatty acid elongation-unsaturated </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY-1622">formaldehyde assimilation I (serine pwy) </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=RUMP-PWY">formaldehyde oxidation I</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=MANGDPMET-PWY">GDP-mannose metabolism </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" valign="middle" class="xl24">gibberellin biosynthesis <em>(no longer in MetaCyc or AraCyc)</em> </td>
        <td width="50%" class="xl24"><p>i) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5034">GA12 biosynthesis </a><br>
  ii) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5070">gibberellin biosynthesis I </a><br>
  iii) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5036">gibberellin biosynthesis II </a><br>
      iv) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5035">gibberellin biosynthesis III </a><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4321"></a></p></td>
      </tr>
  <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUAMCAT-PWY">glucosamine degradation</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=glucose1pmetab-PWY">glucose and glucose-1P degradation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUTSYN-PWY">glutamate biosynthesis I </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUDEG-I-PWY">glutamate degradation I </a></td>
        <td width="50%" class="xl24">i) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3322">glutamate degradation I </a> <br> 
          ii)
<a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4321">glutamate degradation II </a></td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUTOXA-PWY">glutamate degradation VII</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUTORN-PWY">glutamate degradation VIII</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUTAMINEFUM-PWY">glutamine degradation III </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=AERO-GLYCEROL-CAT-PWY">glycerol degradation II </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4261">glycerol degradation</a> </td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=TEICHOICACID-PWY">glycerol teichoic acid biosynthesis</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLYCEROLMETAB-PWY">glycerol metabolism </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4261">glycerol degradation</a> </td>
      </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLYCOGENSYNTH-PWY">glycogen biosynthesis</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLYCOLATEMET-PWY">glycolate degradation I</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P341-PWY">glycolysis II</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ANAGLYCOLYSIS-PWY">glycolysis III</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P122-PWY">heterofermentative lactate fermentation</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=HOMOCYSDEGR-PWY">homocysteine degradation I</a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=IDNCAT-PWY">L-idonate degradation</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARGORNPROST-PWY">interconversion of arginine, ornithine and proline</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ILEUDEG-PWY">isoleucine degradation I </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=lctacacat-PWY">lactate oxidation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=LEUDEG-PWY">leucine degradation I </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=MANNIDEG-PWY">mannitol degradation</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
	       <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=MANNICAT-PWY">mannose degradation</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
	       <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=methanogenesis-PWY">methanogenesis from CO2 </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=HOMOSER-METSYN-PWY">methionine biosynthesis I</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=HSERMETANA-PWY">methionine biosynthesis III</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ADENOSYLHOMOCYSCAT-PWY">methionine biosynthesis IV</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=METHGLYUT-PWY">methylglyoxylate biosynthesis </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=fermentation-PWY">mixed acid fermentation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" valign="top" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLCMANNANAUT-PWY">N-acetylglucosamine , N-acetylmannosamine and N-acetylneuraminic acid dissimilation</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" valign="top" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=NAD+BIOSYNTHESIS+II">NAD biosynthesis II</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=NAD+BIOSYNTHESIS+III">NAD biosynthesis III </a></td>
        <td width="50%" class="xl24">i) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PYRIDNUCSYN-PWY">NAD biosynthesis I (from aspartate) </a><br>
         ii) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=NADSYN-PWY">NAD biosynthesis II (from tryptophan) </a></td>
      </tr>
<td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=NADPHOS-DEPHOS-PWY">NAD phosphorylation and dephosphorylation</a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5083">NAD/NADH phosphorylation and dephosphorylation </a></td>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=NPGLUCAT-PWY">non-phosphorylated glucose degradation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=OANTIGEN-PWY">O-antigen biosynthesis</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P221-PWY">octane oxidation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PANTO-PWY">pantothenate biosynthesis I </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3921">pantothenate biosynthesis</a></td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PEPTIDOGLYCANSYN-PWY">peptidoglycan biosynthesis </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" valign="top" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PHOSLIPSYN-PWY">phospholipid biosynthesis I</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" valign="top" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PROSYN-PWY">proline biosynthesis I </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3341">proline biosynthesis </a></td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY-921">proline degradation II </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PROUT-PWY">proline degradation I </a></td>
	 <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4137">proline degradation</a></td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P164-PWY">purine fermentation</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PYRIDOXSYN-PWY">pyridoxal 5'-phosphate biosynthesis </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PYRUVOX-PWY">pyruvate oxidation pathway </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ANARESP1-PWY">respiration (anaerobic)</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=RIBUTOLUTIL-PWY">ribitol degradation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=SALVADEHYPOX-PWY">salvage pathways of adenine, hypoxanthine, and their nucleosides</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P1-PWY">salvage pathways of purine and pyrimidine nucleotides</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P121-PWY">salvage pathways of purine nucleosides</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY0-181">salvage pathways of pyrimidine deoxyribonucleotides</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P106-PWY">serine-isocitrate lyase pathway </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P461-PWY">sorbitol fermentation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P108-PWY">succinate-propionate fermentation pathway</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=SUCUTIL-PWY">sucrose degradation I</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=SO4ASSIM-PWY">sulfate assimilation</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY-781">sulfate assimilation II</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P104-PWY">TCA cycle variation VII </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P105-PWY">TCA cycle variation VIII </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P82-PWY">TCA cycle variation IV </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=TREDEGLOW-PWY">trehalose biosynthesis and degradation -- low osmolarity</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY-881">trehalose biosynthesis II </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=TRESYN-PWY">trehalose biosynthesis </a></td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=trehalosesyn-PWY">trehalose biosynthesis III </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=TRESYN-PWY">trehalose biosynthesis </a></td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=UDPNACETYLGALSYN-PWY">UDP-N-acetylgalactosamine biosynthesis</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=VALDEG-PWY">valine degradation I </a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P185-PWY">xylulose-monophosphate cycle</a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PANTOSYN-PWY">pantothenate/coenzymeA biosynthesis superpathway </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4221">superpathway of pantothenate/coenzymeA biosynthesis</a></td>
      </tr>
      <tr>
        <td width="50%" valign="top" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PEP-LIPA-SYN-PWY">peptidoglycan and lipid A precursor biosynthesis</a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" height="28" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARGDEG-PWY">superpathway of arginine, putrescine, and 4-aminobutyrate degradation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLYCOLYSIS/E-D">superpathway glycolysis+Entner Doudoroff </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY1G-2">superpathway glycolysis+TCA variation VIII </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
    </table>
</dl>
<p>List of <b><a href="releasenotes_deletedpathways.jsp">deleted pathways</a> </b>in this release.</p>
<br>
<p>AraCyc 2.6's release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<br>
<strong><em>Date of release</em>:</strong> <em>February 2006</em></div>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

