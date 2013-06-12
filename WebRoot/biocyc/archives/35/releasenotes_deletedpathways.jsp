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
.style2 {font-size: small}
.style7 {font-size: xx-small; font-style: italic; }
-->
</style>


<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Release Notes" />
</jsp:include>

<div id="rightcolumn">
<!-- CONTENT IN HERE -->
<p class="mainheader"><a name="Top"></a>Archives: Pathways deleted from the database in AraCyc 3.5</p>
<p>This list summarizes the pathways that have been deleted from AraCyc in this release. The pathway name in the 'Deleted' column are hyperlinked to the <strong>corresponding MetaCyc pathway detail page</strong>.</p>
<table width="100%"  border="0">
  <tr>
    <td width="42%">&nbsp;</td>
    <td width="12%"><span class="style7"><a href="#Bottom">Bottom of page </a></span></td>
    <td width="46%">&nbsp;</td>
  </tr>
</table>
<dl>
      <table width="100%" height="458" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50%" height="19"><strong>Pathways deleted in this release </strong></td>
    <td width="50%"><strong>Replaced by: </strong></td>
  </tr>
      <tr>
        <td height="19" align="left"><strong>A.</strong></td>
        <td align="left">&nbsp;</td>
      </tr>
      <tr>
        <td width="50%" height="57" align="left">anthocyanin biosynthesis<span class="xl24"><span class="xl24 style2"> <em>(pathway ID 'PWY1F-823', now corresponds to leucopelargonidin and leucocyanidin biosynthesis)</em></span></span></td>
        <td width="50%" align="left"><span class="xl24">i) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-641">proanthocyanidin biosynthesis from flavonols</a><br>
         ii) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5125">anthocyanin biosynthesis<em> (pelargonidin-3-</em>O<em>-glucoside, cyanidin-3-</em>O<em>-glucoside)</em></a><br>
         iii) <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY1F-823">leucopelargonidin and leucocyanidin biosynthesis</a></span></p></td>
       </tr>
       <tr>
         <td height="19" align="left"><strong>C.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left">camalexin biosynthesis <span class="xl24 style2"><em>(pathway ID 'camalexin-biosynthesis', no longer exists in either MetaCyc or AraCyc)</em></span></td>
         <td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=CAMALEXIN-SYN">camalexin biosynthesis</a> </td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=CARNMET-PWY">carnitine degradation</a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><strong>F.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=FAO-PWY">fatty acid &beta;-oxidation I</a></td>
         <td align="left"> - <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5136">fatty acid &beta;-oxidation I<em> (saturated)</em></a> </td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=1CMET2-PWY">formylTHF biosynthesis</a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><strong>G.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=GLUCUROCAT-PWY">&beta;-D-glucuronide degradation</a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><strong>L.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PWY-541">lipoxygenase pathway</a></td>
         <td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5410">13-LOX and 13-HPL pathway</a></td>
       </tr>
       <tr>
         <td height="19" align="left"><strong>M.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=METHIONINE-DEG1-PWY">methionine degradation I</a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><strong>N.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=NADSYN-PWY">NAD biosynthesis II<em> (from tryptophan) </em></a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><strong>P.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=PHENYLALANINE-DEG1-PWY">phenylalanine degradation</a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left">pyridine nucleotide cycling<span class="xl24 style2"> <em>(pathway ID 'PYRNUCYC-PWY', no longer exists in either MetaCyc or AraCyc) </em></span></td>
         <td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-5381">pyridine nucleotide cycling<em> (plants)</em></a></td>
       </tr>
       <tr>
         <td height="19" align="left"><strong>T.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=PATHWAY&object=FOLSYN-PWY">tetrahydrofolate biosynthesis II</a></td>
         <td align="left">&nbsp;</td>
       </tr>
    </table>
</dl>
<p><a name="Bottom"></a>A complete list of <b><a href="releasenotes_alldeletedpathways.jsp">all the pathways</a> </b>removed from AraCyc <b>since its initial build</b>.</p>
<p><strong>AraCyc 3.5</strong>'s release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<table width="100%"  border="0">
  <tr>
    <td width="42%">&nbsp;</td>
    <td width="12%"><span class="style7"><a href="#Top">Top of page </a></span></td>
    <td width="46%">&nbsp;</td>
  </tr>
</table><br>
<strong><em>Date of release:</em></strong> <em>February 2007</em></div>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

