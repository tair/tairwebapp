<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Trihelix Transcription Factor Family";
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
<h2>Trihelix Transcription Factor Family</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>
<a target="new" href="http://arabidopsis.med.ohio-state.edu/">AGRIS
</a>
</li> <li>
<b>Smalle, J.,Kurepa, J.,Haegman, M.,Gielen, J.,Van Montagu, M.,Straeten, D. V.</b> (1998) <a href="/servlets/TairObject?type=publication&amp;id=2674">The trihelix DNA-binding motif in higher plants is not restricted to the transcription factors GT-1 and GT-2.</a> PROCEEDINGS OF THE NATIONAL ACADEMY OF SCIENCES OF THE UNITED STATES OF AMERICA <b>95</b>
</li></ul></td></tr>
	<tr><th valign="top">Gene Family Criteria:</th> <td>A few representative proteins were used to perform a Blast on the TAIR website. The resultant sequences with an E-value smaller than 10-5 were considered a good match, then the last sequence was used in a subsequent Blast, and so forth until all similar sequences were identified, then they were aligned, and any mismatched sequences were discarded</td></tr>
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
		<td>Trihelix Transcription Factor Family</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g13450">At1g13450</a></td>
		<td>GT-1</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g01380">At5g01380</a></td>
		<td>GT-3a</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g33240">At1g33240</a></td>
		<td>&nbsp;</td>
		<td>DNA-binding factor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g54060">At1g54060</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g11850">At1g11850</a></td>
		<td>&nbsp;</td>
		<td>expressed protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g18670">At4g18670</a></td>
		<td>&nbsp;</td>
		<td>extensin-like protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g33970">At4g33970</a></td>
		<td>&nbsp;</td>
		<td>extensin-like protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g29030">At4g29030</a></td>
		<td>&nbsp;</td>
		<td>glycine-rich protein like</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g28300">At5g28300</a></td>
		<td>&nbsp;</td>
		<td>GTL1 - like protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g76880">At1g76880</a></td>
		<td>&nbsp;</td>
		<td>GT-like trihelix DNA-binding protein, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g10000">At3g10000</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g19020">At3g19020</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g49490">At1g49490</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g14180">At3g14180</a></td>
		<td>&nbsp;</td>
		<td>hypothetical protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g68690">At1g68690</a></td>
		<td>&nbsp;</td>
		<td>protein kinase, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g26150">At1g26150</a></td>
		<td>&nbsp;</td>
		<td>Pto kinase interactor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g23540">At1g23540</a></td>
		<td>&nbsp;</td>
		<td>Pto kinase interactor, putative</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g25990">At3g25990</a></td>
		<td>&nbsp;</td>
		<td>putative DNA-binding protein, GT-1</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g12040">At1g12040</a></td>
		<td>&nbsp;</td>
		<td>putative extensin</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g38250">At2g38250</a></td>
		<td>&nbsp;</td>
		<td>putative GT-1-like transcription factor</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g47660">At5g47660</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g14540">At5g14540</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g38560">At5g38560</a></td>
		<td>&nbsp;</td>
		<td>putative protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At4g32710">At4g32710</a></td>
		<td>&nbsp;</td>
		<td>putative protein kinase</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g70460">At1g70460</a></td>
		<td>&nbsp;</td>
		<td>putative protein kinase</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At1g76890">At1g76890</a></td>
		<td>&nbsp;</td>
		<td>trihelix DNA-binding protein (GT2)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At3g01560">At3g01560</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At2g15880">At2g15880</a></td>
		<td>&nbsp;</td>
		<td>unknown protein</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=At5g03680">At5g03680</a></td>
		<td>PETAL</td>
		<td>GT2 -like protein, PETAL LOSS</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
