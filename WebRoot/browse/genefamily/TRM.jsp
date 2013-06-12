<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TRM";
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
<h2>TRM</h2>
<table>
	<tr><th valign="top">Source:</th> <td><ul style="margin-top:0"><li>Drevensek, S., Goussot, M., Duroc, Y., Christodoulidou, A., Steyaert, S., Schaefer, E., Duvernois, E., Grandjean, O., Vantard, M., Bouchez, D., Pastuglia, M.  
<a target="new" href="http://www.arabidopsis.org/servlets/TairObject?type=publication&id=501747011">The Arabidopsis TRM1-TON1 Interaction Reveals a Recruitment Network Common to Plant Cortical Microtubule Arrays and Eukaryotic Centrosomes.</a>Plant Cell (2012) 24:178-191
</li></ul></td></tr>
	<tr><th valign="top">Gene Family Criteria:</th> <td>Combination of molecular (two-hybrid screen) and bioinformatics (MEME, MAST and BLAST analysis) approaches to 
	identify TON1-interacting proteins. Author summary: The TRM (for TON1 Recruiting Motif proteins) superfamily comprises 34 proteins which share six short 
	conserved motifs, including a TON1-interacting motif present in all TRMs. An archetypal member of this family, TRM1, is a microtubule-associated protein that 
	localizes to cortical microtubules and binds microtubules in vitro. Not all TRM proteins can bind microtubules, suggesting a diversity of functions for this 
	family. TRM1 interacts in vivo with TON1 and is able to target TON1 to cortical microtubules via its C-terminal TON1 interaction motif. Three motifs of TRMs 
	are found in CAP350, a human centrosomal protein interacting with FOP, the C-terminal M2 motif of CAP350 being responsible for FOP recruitment at the 
	centrosome.</td></tr>
	<tr><th valign="top">Contact:</th> <td><ul style="margin-top:0"><li>
<a target="display" href="http://www.arabidopsis.org/servlets/Community?action=view&type=person&communityID=5056">David Bouchez</a>
</li></ul></td></tr>
</table>

<table align="center" border="1" cellspacing="0" cellpadding="2">
	<tr>
		<th><b>Gene Family</b></th>
		<th><b>Gene Sub Family name</b></th>
		<th><b>Locus ID</b></th>
		<th><b>Gene/Protein Name</b></th>
		<th><b>Submitter Description</b></th>
	</tr>
	<tr class="alt">
		<td>TRM (TON1 Recruiting Motif) superfamily</td>
		<td>TRM Group 1</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At3g02170">At3g02170</a></td>
		<td>TRM1, LNG2</td>
		<td>Microtubule-associated protein, Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M3, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 1</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At5g15580">At5g15580</a></td>
		<td>TRM2, LNG1</td>
		<td>Microtubule-associated protein, Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M3, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 1</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At1g18620">At1g18620</a></td>
		<td>TRM3</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M3, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 1</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At1g74160">At1g74160</a></td>
		<td>TRM4</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M3, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 1</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At3g63430">At3g63430</a></td>
		<td>TRM5</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M3, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 2</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At3g05750">At3g05750</a></td>
		<td>TRM6</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 2</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At3g58650">At3g58650</a></td>
		<td>TRM7</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 2</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At5g26910">At5g26910</a></td>
		<td>TRM8</td>
		<td>Microtubule-associated protein, Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 3</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At4g00770">At4g00770</a></td>
		<td>TRM9</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M2, M3)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 3</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At4g11780">At4g11780</a></td>
		<td>TRM10</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M2, M3)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 3</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At4g23020">At4g23020</a></td>
		<td>TRM11</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M2, M3, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 3</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At2g36420">At2g36420</a></td>
		<td>TRM27</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M2, M3)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 3</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At5g03670">At5g03670</a></td>
		<td>TRM28</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M2, M3)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 4</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At2g45900">At2g45900</a></td>
		<td>TRM13</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs ( M2, M3, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 4</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At3g61380">At3g61380</a></td>
		<td>TRM14</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs ( M2, M3, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 4</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At4g00440">At4g00440</a></td>
		<td>TRM15</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs ( M2, M3, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 4</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At1g01695">At1g01695</a></td>
		<td>TRM33</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M2, M4, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 5</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At2g20240">At2g20240</a></td>
		<td>TRM17</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M3, M4, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 5</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At3g53540">At3g53540</a></td>
		<td>TRM19</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M3, M4)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 5</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At4g28760">At4g28760</a></td>
		<td>TRM20</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M3, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 5</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At5g43880">At5g43880</a></td>
		<td>TRM21</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M3, M4, M5)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 5</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At2g17550">At2g17550</a></td>
		<td>TRM26</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M3, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 6</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At4g25430">At4g25430</a></td>
		<td>TRM23</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M5)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 6</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At5g51850">At5g51850</a></td>
		<td>TRM24</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 6</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At5g62170">At5g62170</a></td>
		<td>TRM25</td>
		<td>Microtubule-associated protein, Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 7</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At5g01370">At5g01370</a></td>
		<td>TRM29, ACI1</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M3)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 7</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At5g58630">At5g58630</a></td>
		<td>TRM31</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M3)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 8</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=AAt5g02390">At5g02390</a></td>
		<td>TRM16, DAU1</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs ( M2, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>TRM Group 8</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At1g07620">At1g07620</a></td>
		<td>TRM32, ATOBGM</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs ( M2, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>ungrouped TRM</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At1g63670">At1g63670</a></td>
		<td>TRM12</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs ( M2, M3, M4, M5, M6)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>ungrouped TRM</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At2g39435">At2g39435</a></td>
		<td>TRM18</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs ( M2, M3, M4)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>ungrouped TRM</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At1g67040">At1g67040</a></td>
		<td>TRM22</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2, M3, M5)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>ungrouped TRM</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=At5g42710">At5g42710</a></td>
		<td>TRM30</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2)</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td>ungrouped TRM</td>
		<td><a target="display" href="http://www.arabidopsis.org/servlets/TairObject?type=locus&amp;name=AAt3g24630">At3g24630</a></td>
		<td>TRM34</td>
		<td>Contains a TON1-recruiting motif, Contains TRM motifs (M1, M2)</td>
	</tr>
</table><jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
