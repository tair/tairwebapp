<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "C2C2-Dof";
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
<h2>C2C2-Dof</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS</a>
</li> <li>
<b>Yanagisawa, S.</b> (2002) <a href="/servlets/TairObject?type=publication&amp;id=501682896">The Dof family of plant transcription factors.</a> TRENDS IN PLANT SCIENCE <b>7</b>
</li></ul></td></tr>
	<tr><th valign="top">Gene Family Criteria:</th> <td>Families were found through a domain search and blast technique. Publications were found through PubMed and the conserved domain motif that characterizes each TF family was identified. Using the motif, a Blast was conducted in the TAIR website, the resultant sequences were then aligned and mismatches were discarded.</td></tr>
	<tr><th valign="top">Contact:</th> <td><ul style="margin-top:0"><li>
<a target="display" href="/servlets/Community?action=view&amp;type=person&amp;communityID=1313754">Rebecca	Lamb</a>
</li> <li>
<a target="display" href="/servlets/Community?action=view&amp;type=person&amp;communityID=1207">Erich	Grotewold</a>
</li></ul></td></tr>
</table>

<table align="center" border="1" cellspacing="0" cellpadding="2">
	<tr>
		<th><b>Gene Family</b></th>
		<th><b>Locus ID</b></th>
		<th><b>Gene/Protein Name</b></th>
		<th><b>Submitter Description</b></th>
	</tr>
	<tr class="alt">
		<td>C2C2-Dof</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g51700">At1g51700</a></td>
		<td>ADOF1</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g21270">At3g21270</a></td>
		<td>ADOF2</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g29160">At1g29160</a></td>
		<td>COG1</td>
		<td>Dof domain transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g61850">At3g61850</a></td>
		<td>DAG1</td>
		<td>Dof zinc finger transcription factor, DAG1</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g46590">At2g46590</a></td>
		<td>DAG2</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g21340">At1g21340</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g26790">At1g26790</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g28310">At1g28310</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g47655">At1g47655</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g64620">At1g64620</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g28510">At2g28510</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g28810">At2g28810</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g34140">At2g34140</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g37590">At2g37590</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g45610">At3g45610</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g47500">At3g47500</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g52440">At3g52440</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g00940">At4g00940</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g21030">At4g21030</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g21040">At4g21040</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g21050">At4g21050</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g21080">At4g21080</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g24060">At4g24060</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g38000">At4g38000</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g39660">At5g39660</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g60200">At5g60200</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g62430">At5g62430</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g62940">At5g62940</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g65590">At5g65590</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g69570">At1g69570</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g66940">At5g66940</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g02460">At5g02460</a></td>
		<td>&nbsp;</td>
		<td>Dof zinc finger protein, zinc finger protein OBP3</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g50410">At3g50410</a></td>
		<td>OBP1</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g07640">At1g07640</a></td>
		<td>OBP2</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g55370">At3g55370</a></td>
		<td>OBP3</td>
		<td>Dof zinc finger protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g60850">At5g60850</a></td>
		<td>OBP4</td>
		<td>Dof zinc finger protein</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
