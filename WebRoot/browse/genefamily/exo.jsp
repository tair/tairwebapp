<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "EXO70 exocyst subunit family";
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
<span class="mainheader">EXO70 exocyst subunit family</span>
<table>
	<tr><th>Source:</th> <td>Synek, L., Schlager, N., Eli&aacute;&#353;, M., Quentin, M., Hauser, M., &#x017D;&aacute;rsk&yacute;, V. <a href="http://www.blackwell-synergy.com/doi/abs/10.1111/j.1365-313X.2006.02854.x">AtEXO70A1, a member of a family of putative exocyst subunits specifically expanded in land plants, is important for polar growth and plant development</a> <i>The Plant Journal</i> <b>8</b>:54</td></tr>
	<tr><th>Gene Family Criteria:</th> <td>Members of the family identified by BLAST searches, all share the Interpro IPR000003 domain. For details see the paper.</td></tr>
	<tr><th>Contact:</th> <td><a target="display" href="/servlets/Community?action=view&amp;type=person&amp;communityID=639">Viktor	Zarsky</a></td></tr>
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
		<td>EXO70 exocyst subunit family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g03540">At5g03540</a></td>
		<td>AtEXO70A1</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_195974.2">NP_195974.2</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g03540 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g52340">At5g52340</a></td>
		<td>AtEXO70A2</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_200047.2">NP_200047.2</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g52340 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g52350">At5g52350</a></td>
		<td>AtEXO70A3</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_200048.1">NP_200048.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g52350 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g58430">At5g58430</a></td>
		<td>AtEXO70B1</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_200651.1">NP_200651.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58430 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g07000">At1g07000</a></td>
		<td>AtEXO70B2</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_172181.1">NP_172181.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07000 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g13150">At5g13150</a></td>
		<td>AtEXO70C1</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_196819.1">NP_196819.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g13150 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g13990">At5g13990</a></td>
		<td>AtEXO70C2</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_196903.1">NP_196903.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g13990 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g72470">At1g72470</a></td>
		<td>AtEXO70D1</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_177391.1">NP_177391.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72470 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g54090">At1g54090</a></td>
		<td>AtEXO70D2</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_175811.1">NP_175811.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54090 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g14090">At3g14090</a></td>
		<td>AtEXO70D3</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_566477.2">NP_566477.2</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g14090 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g29400">At3g29400</a></td>
		<td>AtEXO70E1</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_189586.1">NP_189586.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g29400 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g61010">At5g61010</a></td>
		<td>AtEXO70E2</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_200909.1">NP_200909.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g61010 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g50380">At5g50380</a></td>
		<td>AtEXO70F1</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_199849.2">NP_199849.2</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g50380 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g31540">At4g31540</a></td>
		<td>AtEXO70G1</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_194882.2">NP_194882.2</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g31540 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g51640">At1g51640</a></td>
		<td>AtEXO70G2</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_175575.1">NP_175575.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51640 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g55150">At3g55150</a></td>
		<td>AtEXO70H1</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_191075.2">NP_191075.2</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g55150 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g39380">At2g39380</a></td>
		<td>AtEXO70H2</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_181470.1">NP_181470.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39380 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g09530">At3g09530</a></td>
		<td>AtEXO70H3</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_187564.1">NP_187564.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g09530 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g09520">At3g09520</a></td>
		<td>AtEXO70H4</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_187563.1">NP_187563.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g09520 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g28640">At2g28640</a></td>
		<td>AtEXO70H5</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_180432.1">NP_180432.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28640 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g07725">At1g07725</a></td>
		<td>AtEXO70H6</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AAF75081.1">AAF75081.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07725 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g59730">At5g59730</a></td>
		<td>AtEXO70H7</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_200781.1">NP_200781.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59730 target="new">TIGR</a></td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g28650">At2g28650</a></td>
		<td>AtEXO70H8</td>
		<td><a target="display" href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NP_180433.1">NP_180433.1</a></td>
		<td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28650 target="new">TIGR</a></td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
