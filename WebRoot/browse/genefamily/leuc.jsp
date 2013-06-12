<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Leucine-rich repeat extensin";
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
<span class="mainheader">Leucine-rich repeat extensin</span>
<table>
	<tr><th>Source:</th> <td>&nbsp;</td></tr>
	<tr><th>Gene Family Criteria:</th> <td>defined by signal peptide for protein export, leucine-rich repeat domain, and extensin (hydroxyproline-rich glycoprotein) domain</td></tr>
	<tr><th>Contact:</th> <td><a target="display" href="/servlets/Community?action=view&amp;type=person&amp;communityID=912379">Christoph	Ringli</a></td></tr>
</table>

<table align="center" border="1" cellspacing="0" cellpadding="2">
	<tr>
		<th><b>Gene Family</b></th>
		<th><b>Locus ID</b></th>
		<th><b>Gene/Protein Name:</b></th>
		<th><b>GenBank Accession:</b></th>
		<th><b>Description:</b></th>
	</tr>
	<tr class="alt">
		<td>Leucine-rich repeat extensin</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g12040">At1g12040</a></td>
		<td>AtLRX1</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AAK07681.1">AAK07681.1</a></td>
		<td>extracellular localization experimentally shown</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g62440">At1g62440</a></td>
		<td>AtLRX2</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AAD43602">AAD43602</a></td>
		<td>cell wall protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g13340">At4g13340</a></td>
		<td>AtLRX3</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NM_117407">NM_117407</a></td>
		<td>cell wall protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g24480">At3g24480</a></td>
		<td>AtLRX4</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NM_113355">NM_113355</a></td>
		<td>cell wall protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g18670">At4g18670</a></td>
		<td>AtLRX5</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_193602.1">NP_193602.1</a></td>
		<td>cell wall protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g22800">At3g22800</a></td>
		<td>AtLRX6</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_188919.1">NP_188919.1</a></td>
		<td>cell wall protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g25550">At5g25550</a></td>
		<td>AtLRX7</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_197937.1">NP_197937.1</a></td>
		<td>cell wall protein</td>
	</tr>
<tr>		<td>pollen-expressed leucine-rich repeat extensin</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g19020">At3g19020</a></td>
		<td>AtPEX1</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_188532.2">NP_188532.2</a></td>
		<td>cell wall protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g49490">At1g49490</a></td>
		<td>AtPEX2</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_175372.1">NP_175372.1</a></td>
		<td>cell wall protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g15880">At2g15880</a></td>
		<td>AtPEX3</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_179188.1">NP_179188.1</a></td>
		<td>cell wall protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g33970">At4g33970</a></td>
		<td>AtPEX4</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_195123.1">NP_195123.1</a></td>
		<td>cell wall protein</td>
	</tr>
</table>

<p><a href="index.jsp"><img src="/images/arrow.small.up.gif"
border="0">Return to Gene Family Index</a><br>
<br>
<br></p>
<center>Last modified on May 1, 2006</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
