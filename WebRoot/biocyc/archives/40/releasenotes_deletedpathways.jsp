<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<!-- AraCyc 4.0-->
<%String pageName = "Archives AraCyc 4.0 - Deleted pathways";
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
<span class="mainheader"><a name="Top"></a>Archives: Pathways deleted from the database in AraCyc 4.0 </span>
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
        <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=PWY0-781">aspartate superpathway</a></td>
        <td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWY-724">superpathway of lysine, methionine and threonine biosynthesis</a></td>
      </tr>
       <tr>
         <td height="19" align="left"><strong>C.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=CODH-PWY"><span class="xl22">carbon monoxide dehydrogenase pathway </span></a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=COLANSYN-PWY"><span class="xl22">colanic acid building blocks biosynthesis </span></a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><strong>G.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=GDP-RHAMSYN-PWY"><span class="xl22">GDP-D-rhamnose biosynthesis </span></a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=GLUCONEO-PWY"><span class="xl22">gluconeogenesis </span></a></td>
         <td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4428">gluconeogenesis</a></td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=P81-PWY"><span class="xl22">glyceraldehyde 3-phosphate degradation </span></a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><strong>M.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=PWY-3881"><span class="xl22">mannitol biosynthesis </span></a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=MENAQUINONESYN-PWY"><span class="xl22">menaquinone biosynthesis </span></a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><strong>P.</strong></td>
         <td align="left">&nbsp;</td>
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
         <td height="19" align="left"><strong>T.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=TCA"><span class="xl22">TCA cycle - aerobic respiration</span></a></td>
         <td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4452">TCA cycle <em></em></a></td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=THRDLCTCAT-PWY"><span class="xl22">threonine degradation </span></a></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><strong>U.</strong></td>
         <td align="left">&nbsp;</td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=UBISYN-PWY"><span class="xl22">ubiquinone biosynthesis</span></a></td>
         <td align="left">- <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4448">ubiquinone biosynthesis <em></em></a></td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=P61-PWY"><span class="xl22">UDP-glucose conversion</span></a></td>
         <td align="left"><span class="xl24">i) 


             <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4436">UDP-glucose biosynthesis (from glucose 6-P)</a><br>
ii)  <a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4437">UDP-galactose biosynthesis</a></span></td>
       </tr>
       <tr>
         <td height="19" align="left"><a href="http://biocyc.org/META/NEW-IMAGE?type=NIL&object=UDPNAGSYN-PWY"><span class="xl22">UDP-<em>N</em>-acetyl-D-glucosamine biosynthesis</span></a></td>
         <td align="left"><span class="xl22">- </span><a href="http://www.plantcyc.org:1555/ARA/NEW-IMAGE?type=PATHWAY&object=PWYQT-4431"><span class="xl22">UDP-<em>N</em>-acetyl-D-glucosamine biosynthesis</span></a></td>
       </tr>
    </table>
</dl>
<p><a name="Bottom"></a>A complete list of <b><a href="releasenotes_alldeletedpathways.jsp">all the pathways</a> </b>removed from AraCyc <b>since its initial build</b>.</p>
<p><strong>AraCyc 4.0 </strong>'s release notes: <a href="releasenotes.jsp"><strong>Main Page</strong></a>.</p>
<p>Return to the <a href="../archives.jsp"><strong>main Archives' page</strong></a>.</p>
<table width="100%"  border="0">
  <tr>
    <td width="42%">&nbsp;</td>
    <td width="12%"><span class="style7"><a href="#Top">Top of page </a></span></td>
    <td width="46%">&nbsp;</td>
  </tr>
</table><br>
<strong><em>Last modified</em>:</strong> <em>July 3, 2007 </em></div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

