<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "SBP Transcription Factor Family";
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
<h2>SBP Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<b>Cardon, G.,Hohmann, S.,Klein, J.,Nettesheim, K.,Saedler, H.,Huijser, P.</b> (1999) <a href="/servlets/TairObject?type=publication&amp;id=1087">Molecular characterisation of the Arabidopsis SBP-box genes.</a> GENE <b>237</b>
</li> <li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li></ul></td></tr>
	<tr><th valign="top">Gene Family Criteria:</th> <td>Families were found through a domain search and blast technique. Publications were found through PubMed and the conserved domain motif that characterizes each TF family was identified. Using the motif, a Blast was conducted in the TAIR website, the resultant sequences were then aligned and mismatches were discarded.</td></tr>
	<tr><th valign="top">Contact:</th> <td></td></tr>
</table>

<table align="center" border="1" cellspacing="0" cellpadding="2">
	<tr>
		<th><b>Gene Family</b></th>
		<th><b>Locus ID</b></th>
		<th><b>Gene/Protein Name</b></th>
		<th><b>Submitter Description</b></th>
	</tr>
<tr>		<td>SBP Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g47070">At2g47070</a></td>
		<td>SPL1</td>
		<td>putative squamosa-promoter binding protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g27370">At1g27370</a></td>
		<td>SPL10</td>
		<td>putative squamosa-promoter binding protein 2</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g27360">At1g27360</a></td>
		<td>SPL11</td>
		<td>putative squamosa-promoter binding protein 2</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g60030">At3g60030</a></td>
		<td>SPL12</td>
		<td>squamosa promoter binding protein-like 12</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g50570">At5g50570</a></td>
		<td>SPL13</td>
		<td>putative protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g20980">At1g20980</a></td>
		<td>SPL14</td>
		<td>&nbsp;</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g57920">At3g57920</a></td>
		<td>SPL15</td>
		<td>squamosa promoter-binding protein homolog</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g76580">At1g76580</a></td>
		<td>SPL16</td>
		<td>unknown protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g43270">At5g43270</a></td>
		<td>SPL2</td>
		<td>squamosa promoter binding protein-like 2 (emb|CAB5</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g33810">At2g33810</a></td>
		<td>SPL3</td>
		<td>putative squamosa-promoter binding protein</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g53160">At1g53160</a></td>
		<td>SPL4</td>
		<td>transcription factor, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g15270">At3g15270</a></td>
		<td>SPL5</td>
		<td>squamosa promoter binding protein-like 5</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g69170">At1g69170</a></td>
		<td>SPL6</td>
		<td>squamosa-promoter binding protein, putative</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g18830">At5g18830</a></td>
		<td>SPL7</td>
		<td>squamosa promoter binding protein-like 7</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g02065">At1g02065</a></td>
		<td>SPL8</td>
		<td>similar to squamosa promoter-binding protein homol</td>
	</tr>
<tr>		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g42200">At2g42200</a></td>
		<td>SPL9</td>
		<td>putative squamosa-promoter binding protein</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
