<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "BBR/BPC Transcription factor familiy";
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

<!-- Content goes here //-->
<span class="mainheader">BBR/BPC Transcription Factor Family</span>
<table>
	<tr><th align="left" valign="top">Source:</th> <td align="left" valign="top">
<ul>
<li>
	<a target="display" href="http://www.uni-tuebingen.de/plantphys/harter/wanke/Projects_GAGA-factors.html">BBR/BPC-Proteins</a></li>
<li>
Kooiker M, Airoldi CA, Losa A, Manzotti PS, Finzi L, Kater MM, Colombo L (2005) 
<a href="/servlets/TairObject?type=publication&id=501714708">BASIC PENTACYSTEINE1, a GA Binding Protein That Induces Conformational Changes in the Regulatory Region of the Homeotic Arabidopsis Gene SEEDSTICK.</a><i>Plant Cell</i> <b>17</b>, 722-9</li>
<li>
Santi, Luca,Wang, Yamei,Stile, Maria Rosaria,Berendzen, Kenneth,Wanke, Dierk,Roig, Cristina,Pozzi, Carlo,Mueller, Kai,Mueller, Judith,Rohde, Wolfgang,Salamini, Francesco (2003) 
<a href="/servlets/TairObject?type=publication&id=501707003">The GA octodinucleotide repeat binding factor BBR participates in the transcriptional regulation of the homeobox gene Bkn3.</a><i>THE PLANT JOURNAL</i> <b>34</b>, 813-26</li>
<li>
Dierk Wanke, Kenneth Berendzen, Dora Szakonyi, Ingo Ciolkowski, Luca Santi, Guido Jach, Kurt St&uuml;ber, Kai M&uuml;ller, Francesco Salamini1 -Universit&auml;t zu K&ouml;ln; Lehrstuhl II; AG Harter; Gyrhofstr. 15; D-50931 K&ouml;ln  Germany (2004)
Meister, R. J.,Williams, L. A.,Monfared, M. M.,Gallagher, T. L.,Kraft, E. A.,Nelson, C. G.,Gasser, C. S, (2004).
<a href="/servlets/TairObject?type=publication&id=501711763">Definition and interactions of a positive regulatory element of the Arabidopsis INNER NO OUTER promoter.</a> <i>THE PLANT JOURNAL</i> <b>34</b> 426-38</li>
<li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS</a>
</li>
</ul>
</td></tr>
	<tr><th align="left" valign="top">Gene Family Criteria:</th> <td align="left" valign="top">Presence of the GAGA-factor specific IPR010409/DUF1004 DNA-binding domain</td></tr>
	<tr><th align="left" valign="top">Contact:</th> <td align="left" valign="top"><a target="display" href="/servlets/Community?action=view&amp;type=person&amp;communityID=10631">Dierk	Wanke</a></td></tr>
</table>

<table align="center" border="1" cellspacing="0" cellpadding="2">
	<tr>
		<th><b>Gene Family</b></th>
		<th><b>Locus ID</b></th>
		<th><b>Gene/Protein Name<br />
		       Alias</b></th>
		<th><b>GenBank Accession</b></th>
		<th><b>Description</b></th>
	</tr>
	<tr class="alt">
		<td rowspan="7" valign="top">BBR/BPC Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=AT2G01930">AT2G01930</a></td>
		<td>AtBPC1<br />
		    BBR/BPC1</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AAM15473.1">AAM15473.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G01930 target="new">TIGR</a></td>
	</tr>
	<tr>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=AT2G35550">AT2G35550</a></td>
		<td>AtBPC2<br />
		    BBR/BPC2</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AAR25822.1">AAR25822.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G14685 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=AT1G68120">AT1G68120</a></td>
		<td>AtBPC3<br />
		    BBR/BPC3</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_176979.2">NP_176979.2</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G68120 target="new">TIGR</a></td>
	</tr>
	<tr>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=AT2G21240">AT2G21240</a></td>
		<td>AtBPC4<br />
		    BBR/BPC4</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AAM15408.1">AAM15408.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G21240 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=AT4G38910">AT4G38910</a></td>
		<td>AtBPC5<br />
		    BBR/BPC5</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_195602.1">NP_195602.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G38910 target="new">TIGR</a></td>
	</tr>
	<tr>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=AT5G42520">AT5G42520</a></td>
		<td>AtBPC6<br />
		    BBR/BPC6</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AAF18661.1">AAF18661.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G42520 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=AT2G35550">AT2G35550</a></td>
		<td>AtBPC7<br />
		    BBR/BPC7</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AAC36166.1">AAC36166.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G35550 target="new">TIGR</a></td>
	</tr>
</table>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
