<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "C2C2-Dof Transcription Factor Family";
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
<h2>C2C2-CO-like Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"> <li>
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
	<tr class="alt">
		<td>C2C2-CO-like Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g15840">At5g15840</a></td>
		<td>CO</td>
		<td>Zinc finger protein CONSTANS</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g15850">At5g15850</a></td>
		<td>COL1</td>
		<td>Zinc finger protein CONSTANS-LIKE 1 (COL1)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g02380">At3g02380</a></td>
		<td>COL2</td>
		<td>Zinc finger protein CONSTANS-LIKE 2 (COL2)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g24790">At2g24790</a></td>
		<td>COL3</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g24930">At5g24930</a></td>
		<td>COL4</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g57660">At5g57660</a></td>
		<td>COL5</td>
		<td>CONSTANS-like B-box zinc finger protein-like</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68520">At1g68520</a></td>
		<td>COL6</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g73870">At1g73870</a></td>
		<td>COL7</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g49130">At1g49130</a></td>
		<td>COL8</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g07650">At3g07650</a></td>
		<td>COL9</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g48250">At5g48250</a></td>
		<td>COL10</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g48250">At5g48250</a></td>
		<td>COL10</td>
		<td>unknown protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g34140">At4g15250</a></td>
		<td>COL11</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g21880">At3g21880</a></td>
		<td>COL12</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g47890">At2g47890</a></td>
		<td>COL13</td>
		<td>unknown protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g33500">At2g33500</a></td>
		<td>COL14</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g28050">At1g28050</a></td>
		<td>COL15</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g25440">At1g25440</a></td>
		<td>COL16</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g60250">At1g60250</a></td>
		<td>&nbsp;</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68190">At1g68190</a></td>
		<td>&nbsp;</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g75540">At1g75540</a></td>
		<td>&nbsp;</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g78600">At1g78600</a></td>
		<td>&nbsp;</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g21320">At2g21320</a></td>
		<td>&nbsp;</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g21150">At3g21150</a></td>
		<td>&nbsp;</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g21890">At3g21890</a></td>
		<td>&nbsp;</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g27310">At4g27310</a></td>
		<td>&nbsp;</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g38960">At4g38960</a></td>
		<td>&nbsp;</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g39070">At4g39070</a></td>
		<td>&nbsp;</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g54470">At5g54470</a></td>
		<td>&nbsp;</td>
		<td>CONSTANS B-box zinc finger family protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g25990">At2g25990</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
	
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
