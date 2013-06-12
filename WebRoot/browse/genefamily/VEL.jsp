<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "VEL Gene Family";
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
<h2>VEL <i>Arabidopsis</i> Gene Family</h2>
<table width="550">
	<tr><th valign="top">Source:</th> 
	    <td>
		<ul>
		<li>Greb T, Mylne JS, Crevillen P, Geraldo N, An H, Gendall AR, Dean C.
		Curr Biol. 2007 Jan 9;17(1):73-8. Epub 2006 Dec 14.
		The PHD Finger Protein VRN5 Functions in the Epigenetic Silencing of
		Arabidopsis FLC.
		</li>
		<li>
		Sung S, Schmitz RJ, Amasino RM.
		Genes Dev. 2006 Dec 1;20(23):3244-8. Epub 2006 Nov 17.
		A PHD finger protein involved in both the vernalization and photoperiod
		pathways in Arabidopsis.
		</li>
		<li><b>Mylne J, Greb T, Lister C, Dean C </b>

		<a href="/servlets/TairObject?type=publication&id=501719837">
		  Epigenetic regulation in the control of flowering </a>
		  COLD SPRING HARBOR SYMPOSIA ON QUANTITATIVE BIOLOGY 2004
		  <font color="red">Family first described here.</font>
		</li>
		<li><b>Thomas Greb, Nuno Geraldo, Josh Mylne, Caroline Dean </b>
		<a href="/servlets/TairObject?type=publication&id=501713373">
		  VRN5, a PHD/FNIII protein, is involved in vernalization by repressing FLC </a>

		  15TH INTERNATIONAL CONFERENCE ON ARABIDOPSIS RESEARCH 2004
		</li>
		<li><font color="red">For VIN3 only</font><b> Sung, S.,Amasino, R. M.</b>
		<a href="/servlets/TairObject?type=publication&id=501711822">
		  Vernalization in Arabidopsis thaliana is mediated by the PHD finger protein VIN3 </a>
		  NATURE 427:159-64
		</li>
		</ul>

	    </td>
	</tr>
	<tr><th valign="top">Contact:</th> 
            <td><a href="/servlets/Community?type=organization&action=view&communityID=8639" target=new>C Dean Laboratory</a>
</table>

<table align="center" border="1" cellspacing="0" cellpadding="2">
	<tr>
		<th><b>Gene Family</b></th>

		<th><b>Locus ID</b></th>
		<th><b>Gene Name /</b><br />
		    <b>Alternate Name</b></th>
		<th><b>Criteria used to include genes in the gene family:</b></th>
                <th><b>Description:</b></th>
		<th><b>Similar sequence or common domain:</b></th>

	</tr>
	<tr class="alt">
		<td>VEL</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=AT4g30200">AT4g30200</a></td>
		<td>VEL1<br />
		    VIL2</td>
		<td>defined by similarity to VRN5/VIN3, includes PHD, FNIII and new C-terminal VEL domain</td>

		<td>VERNALIZATION5/VIN3-Like</td>
		<td>PHD, FNIII, VEL</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=AT2g18880">AT2g18880</a></td>
		<td>VEL2<br />

		    VIL3</td>
		<td>defined by similarity to VRN5/VIN3, includes PHD, FNIII and new C-terminal VEL domain</td>
	        <td>VERNALIZATION5/VIN3-Like</td>
		<td>PHD, FNIII, VEL</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>

		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=AT2g18870">AT2g18870</a></td>
		<td>VEL3<br />
		    VIL4</td>
		<td>defined by similarity to VRN5/VIN3, possible pseudogene, only has C-terminal VEL domain</td>
	        <td>VERNALIZATION5/VIN3-Like</td>
		<td>VEL</td>

	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=AT3g24440">AT3g24440</a></td>
		<td>VRN5<br />
		    VIL1</td>
		<td>defined by similarity to VRN5/VIN3, includes PHD, FNIII and new C-terminal VEL domain</td>

		<td>VERNALIZATION 5</td>
		<td>PHD, FNIII, VEL</td>
	</tr>
	<tr class="alt">
		<td>&nbsp;</td>
		<td><a target="display" href="/servlets/TairObject?type=locus&amp;name=AT5g57380">AT5g57380</a></td>
		<td>VIN3<br />

		    VRN7</td>
		<td>defined by similarity to VRN5/VIN3, includes PHD, FNIII and new C-terminal VEL domain</td>
		<td>VERNALIZATION INSENSITIVE 3</td>
		<td>PHD, FNIII, VEL</td>
	</tr>
</table>

        

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
