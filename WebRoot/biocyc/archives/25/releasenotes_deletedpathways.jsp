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

<p class="mainheader">Archives: Pathways deleted from the database in AraCyc 2.5</p>
<p>This list summarizes the pathways that have been deleted from AraCyc in this release. The pathway name in the 'Deleted' column are hyperlinked to the <strong>corresponding MetaCyc pathway detail page</strong>.</p>
<p>AraCyc 2.5's release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<br>
<dl>
    <table width="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50%"><strong>Pathways deleted in this release </strong></td>
    <td width="50%"><strong>Replaced by: </strong></td>
  </tr>
      <tr>
        <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P142-PWY">acetate fermentation </a></td>
        <td width="50%" align="left">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=acetateutil-PWY">acetate utilization </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" valign="middle"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P22-PWY">acetyl-CoA assimilation </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=AERESPDON-PWY">aerobic respiration electron donor list </a></td>
         <td width="50%" align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3781">aerobic respiration </a></td>
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
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARABCAT-PWY">L-arabinose degradation </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARGDEG-II-PWY">arginine degradation II </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
	  
	        <tr>
        <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARGDEG-V-PWY">arginine degradation V </a></td>
        <td width="50%" align="left">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARG-GLU-PWY">arginine degradation IX </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" valign="middle"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ASPARAGINE-DEG1-PWY">asparagine degradation I</a></td>
         <td width="50%" align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4001">asparagine degradation I</a></td>
       </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ASPARTATE-DEG1-PWY">aspartate degradation I </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
      <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
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
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ACETOACETATE-DEG-PWY">degradation of short-chain fatty acids </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=DISSULFRED-PWY">dissimilatory sulfate reduction </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=DTDPRHAMSYN-PWY">dTDP-rhamnose biosynthesis </a></td>
         <td width="50%" align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3221">dTDP-L-rhamnose biosynthesis </a></td>
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
        <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=UNSAT-FA-ELONG-PWY">fatty acid elongation-unsaturated </a></td>
        <td width="50%" align="left">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY-1622">formaldehyde assimilation I (serine pwy) </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" valign="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=MANGDPMET-PWY">GDP-mannose metabolism </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=glucose1pmetab-PWY">glucose and glucose-1P degradation </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUTSYN-PWY">glutamate biosynthesis I </a></td>
         <td width="50%" class="xl24">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUDEG-I-PWY">glutamate degradation I </a></td>
         <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3322">glutamate degradation I </a><br>
		 - <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4321">glutamate degradation II </a></td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUTAMINEFUM-PWY">glutamine degradation III </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=AERO-GLYCEROL-CAT-PWY">glycerol degradation II </a></td>
         <td width="50%" align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4261">glycerol degradation</a> </td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLYCEROLMETAB-PWY">glycerol metabolism </a></td>
        <td width="50%" class="xl24">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4261">glycerol degradation</a> </td>
      </tr>
      <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
      </tr>
      <tr>
        <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ILEUDEG-PWY">isoleucine degradation I </a></td>
        <td width="50%" align="left">&nbsp;</td>
      </tr>
      <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
      <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=lctacacat-PWY">lactate oxidation </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" valign="middle"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=LEUDEG-PWY">leucine degradation I </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
      <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
      <tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=methanogenesis-PWY">methanogenesis from CO2 </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=METHGLYUT-PWY">methylglyoxylate biosynthesis </a></td>
         <td width="50%" class="xl24">&nbsp;</a></td>
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
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=NAD+BIOSYNTHESIS+III">NAD biosynthesis III </a></td>
         <td width="50%" align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PYRIDNUCSYN-PWY">NAD biosynthesis I (from aspartate) </a><br>
		 - <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=NADSYN-PWY">NAD biosynthesis II (from tryptophan) </a></td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=NPGLUCAT-PWY">non-phosphorylated glucose degradation </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
      <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
      <tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P221-PWY">octane oxidation </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
      <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
      <tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PANTO-PWY">pantothenate biosynthesis I </a></td>
         <td width="50%" align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3921">pantothenate biosynthesis</a></td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PEPTIDOGLYCANSYN-PWY">peptidoglycan biosynthesis </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
	  
	        <tr>
        <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PROSYN-PWY">proline biosynthesis I </a></td>
        <td width="50%" align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-3341">proline biosynthesis </a></td>
      </tr>
       <tr>
         <td width="50%" valign="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PROUT-PWY">proline degradation I </a></td>
         <td width="50%" align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4137">proline degradation</a></td>
       </tr>
      <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY-921">proline degradation II </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>


 
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PYRIDOXSYN-PWY">pyridoxal 5'-phosphate biosynthesis </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" class="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PYRUVOX-PWY">pyruvate oxidation pathway </a></td>
         <td width="50%" class="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" class="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=RIBUTOLUTIL-PWY">ribitol degradation </a></td>
         <td width="50%" class="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P106-PWY">serine-isocitrate lyase pathway </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
      <tr>
        <td width="50%" class="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P461-PWY">sorbitol fermentation </a></td>
        <td width="50%" class="left">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P104-PWY">TCA cycle variation VII </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" valign="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P105-PWY">TCA cycle variation VIII </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
       <tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=P82-PWY">TCA cycle variation IV </a></td>
         <td width="50%" align="left">&nbsp;</td>
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
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=VALDEG-PWY">valine degradation I </a></td>
        <td width="50%" class="xl24">&nbsp;</td>
      </tr>
       <tr>
         <td width="50%" align="left">~ </td>
         <td width="50%" align="left">~ </td>
       </tr>
      <tr>
        <td width="50%" class="xl24"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PANTOSYN-PWY">pantothenate/coenzymeA biosynthesis superpathway </a></td>
<td>- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-4221">superpathway of pantothenate/coenzymeA biosynthesis</a></td><tr>
         <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=ARGDEG-PWY">superpathway of arginine, putrescine, and 4-aminobutyrate degradation </a></td>
         <td width="50%" align="left">&nbsp;</td>
       </tr>
      <tr>
        <td width="50%" class="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLYCOLYSIS/E-D">superpathway glycolysis+Entner Doudoroff </a></td>
        <td width="50%" class="left">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY1G-2">superpathway glycolysis+TCA variation VIII </a></td>
        <td width="50%" align="left">&nbsp;</td>
      </tr>
     </table>
</dl>
<p>A complete list of <b><a href="releasenotes_alldeletedpathways.jsp">all the pathways</a> </b>removed from AraCyc <b>since its initial build</b>.</p>
<br>
<p>AraCyc 2.5's release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<strong><em>Date of release</em>:</strong> <em>November 2005</em></div>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

