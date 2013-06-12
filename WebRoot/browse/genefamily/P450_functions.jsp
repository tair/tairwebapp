<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - P450 Functions";
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
 
<b>Function of the <i>Arabidopsis thaliana</i> P450 genes</B><BR>


    
    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Name:</b></th>
        <th><b>Activity:</b></th>
        <th><b>Pathway:</b></th>
        <th><b>Comments:</b></th>
	<th><b>Source:</b></th>    
	<TH><B>Reference:</B></TH></TR>
	    

<tr class="alt">    <TD><a name="51A2">51A2</A></TD>
        <TD>obtusifoliol 14alpha-demethylase</TD>
	<TD>sterols/steroids</TD>
	<TD>complements yeast erg11 mutant</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><A HREF="/servlets/TairObject?type=publication&id=1346199">Kushiro et al., BBRC 285,98 (2001)</A></td></tr>

<TR>    <TD><a name="71B15">71B15</a></TD>
        <TD>synthesizes 2,4 dihydroxy 1-4 benzoxazin-3-one</TD>
	<TD>camalexin</TD>
	<TD>complements pad3 mutant</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><A HREF="/servlets/TairObject?type=publication&id=931" target="display">Zhou et al., Plant Cell 11, 2419 (1999)</a></td></tr>	


<tr class="alt">    <TD><a name="72B1">72B1</a></TD>
        <TD>26-hydroxylase for brassinolide</TD>
	<TD>degradation of brassinolides</TD>
	<TD>&nbsp;</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=882" target="display">Neff et al., PNAS 96, 15316 (1999)</A></td></tr>	



<TR>    <TD><a name="73A5">73A5</a></TD>
        <TD>cinnamic acid 4-hydroxylase (t-cinnamic acid hydroxylase)</TD>
	<TD>phenylpropanoid</TD>
	<TD>expressed in baculovirus</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=3403" target="display">Mizutani et al., Plant Physiol. 113, 755 (1997)</A></td></tr>

<tr class="alt">    <TD><a name="74A1">74A1</a></TD>
        <TD>allene oxide synthase</TD>
	<TD>oxylipins (jasmonic acid) </TD>
	<TD>expressed in E. coli</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=3898" target="display">Laudert et al., Plant Mol. Biol. 31, 323 (1996)</A></td></tr>

<TR>    <TD><a name="74B2 ">74B2 </a></TD>
        <TD>hydroperoxide lyase</TD>
	<TD>oxylipins (degradation of hydroperoxides)</TD>
	<TD>expressed in E. coli</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=2264" target="display">Bate et al., Plant Physiol. 117, 1393 (1998)</A></td></tr>

	<tr class="alt">    <TD><a name="75B1">75B1</a></TD>
        <TD>3'-hydroxylase for narigenin, dihydrokaempferol (flavonoid 3'-hydroxylase)</TD>
	<TD>phenylpropanoid</TD>
	<TD>complements tt7 mutant; expressed in yeast</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD>Schoenbohm et al., Biol. Chem. 381, 749 (2000)</td></tr>

<TR>    <TD><a name="79A2">79A2</a></TD>
        <TD>N-hydroxylase for phenylalanine</TD>
	<TD>benzylglucosinolate</TD>
	<TD>expressed in E. coli</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD>Whittstock + Halkier, J. Biol. Chem. 275, 14659 (2000)</td></tr>

<tr class="alt">    <TD><a name="79B2">79B2</a></TD>
        <TD>N-hydroxylase for tryptophan, tryptophan analogs</TD>
	<TD>indole glucosinolate</TD>
	<TD>substrates similar to 79B3; expressed in E. coli</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=727" target="display">Hull et al., PNAS 97, 2379 (2000)</A><br><a href="/servlets/TairObject?type=publication&id=195" target="display">Mikkelsen et al., J. Biol. Chem.  275, 33712 (2000)</A></td></tr>

<TR>    <TD><a name="79B3">79B3</a></TD>
        <TD>N-hydroxylase for tryptophan</TD>
	<TD>indole glucosinolate</TD>
	<TD>substrates similar to 79B2; expressed in E. coli</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=727" target="display">Hull et al., PNAS 97, 2379 (2000)</A></td></tr>

<tr class="alt">    <TD><a name="79F1">79F1</a></TD>
        <TD>N-hydroxylase for short chain methionine derivatives (dihomo-methionine, trihomomethionine)</TD>
	<TD>aliphatic glucosinolate</TD>
	<TD>substrates different from 79F2; expressed in E. coli</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=1045820" target="display">Hansen et al., J. Biol. Chem. 276, 11078 (2001)</A><br> <a href="/servlets/TairObject?type=publication&id=1346753" target="display">Reintanz et al., Plant Cell 13, 351 (2001)</A></td></tr>

<TR>    <TD><a name="79F2">79F2</a></TD>
        <TD>N-hydroxylase for long chain methionine derivatives</TD>
	<TD>aliphatic glucosinolate</TD>
	<TD>substrates different from 79F1</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=1346753" target="display">Reintanz et al., Plant Cell 13, 351 (2001)</A></td></tr>

<tr class="alt">    <TD><a name="83A1">83A1</a></TD>
        <TD>N-hydroxylase for p-hydroxyphenylacetal-doxime, indole-3-acetyl-doxime</TD>
	<TD>indole glucosinolate</TD>
	<TD>complements 83B1 knockouts; expressed in yeast; 20-fold less efficient on indole-3-acetydoxime than 83B1</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=1346339" target="display">Bak + Feyereisen, Plant Physiol. 127, 108 (2001)</A></td></tr>

<TR>    <TD><a name="83B1">83B1</a></TD>
        <TD>N-hydroxylase for indole-3-acetyldoxime</TD>
	<TD>indole glucosinolate</TD>
	<TD>83B1 knockout rescued by 83A1; expressed in yeast</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=1346681" target="display">Bak et al., Plant Cell 13, 101 (2001)<br><a href="/servlets/TairObject?type=publication&id=1346339" target="display">Bak + Feyereisen, Plant Physiol. 127, 108 (2001)</A></A></td></tr>

<tr class="alt">    <TD><a name="84A1">84A1</a></TD>
        <TD>5-hydroxylase for coniferaldehyde, coniferyl alcohol and ferulic acid (ferulate 5-hydroxylase)</TD>
	<TD>phenylpropanoid</TD>
	<TD>complements fah1 mutant; expressed in yeast; much less efficient on ferulic acid</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=3813" target="display">Meyer et al., PNAS 93, 6869 (1996)</A><br><a href="/servlets/TairObject?type=publication&id=1882" target="display">Ruegger et al., Plant Physiol. 119, 101 (1999)</a><br><a href="/servlets/TairObject?type=publication&id=1237"target="display">Humphreys et al., PNAS 96, 10045 (1999)</A></td></tr>

<TR>    <TD><a name="85A1">85A1</a></TD>
        <TD>C6-oxidase for 6-deoxycastasterone, other steroids</TD>
	<TD>brassinolide</TD>
	<TD>expressed in yeast</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=1346088" target="display">Shimada et al., Plant Physiol. 126, 770 (2001)</A></td></tr>

<tr class="alt">    <TD><a name="86A1">86A1</a></TD>
        <TD>omega-hydroxylase for saturated and unsaturated C12 to C18 fatty acids</TD>
	<TD>fatty acids</TD>
	<TD>substrates similar to 86A8; expressed in yeast</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=2761" target="display">Benveniste et al., BBRC 243, 688 (1998)</A></td></tr>

<tr class="alt">    <TD><a name="86A8">86A8</a></TD>
        <TD>omega-hydroxylase for saturated and unsaturated C12 to C18 fatty acids </TD>
	<TD>fatty acids</TD>
	<TD>substrates similar to 86A1; expressed in yeast</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=1346255" target="display">Wellesen et al., PNAS 98, 9694 (2001)</A></td></tr>

<TR>    <TD><a name="88A3">88A3</a></TD>
        <TD>multifunctional ent-kaurenoic acid oxidase</TD>
	<TD>gibberellin</TD>
	<TD>substrates similar to 88A4; expressed in yeast</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=1346767" target="display">Helliwell et al., PNAS 98, 2065 (2001)</A></td></tr>

<TR>    <TD><a name="88A4">88A4</a></TD>
        <TD>multifunctional ent-kaurenoic acid oxidase</TD>
	<TD>gibberellin</TD>
	<TD>substrates similar to 88A3; expressed in yeast</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=1346767" target="display">Helliwell et al., PNAS 98, 2065 (2001)</A></td></tr>

<tr class="alt">    <TD><a name="90A1">90A1</a></TD>
        <TD>23alpha-hydroxylase for 6-oxo-cathasterone</TD>
	<TD>brassinolide</TD>
	<TD>complements cpd mutant</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=3931" target="display">Szekeres et al., Cell 85,171 (1996)</A></td></tr>		


<TR>    <TD><a name="90B1">90B1</a></TD>
        <TD>22alpha-hydroxylase for 6-oxo-campestanol</TD>
	<TD>brassinolide</TD>
	<TD>complements dwf4 mutant</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=2664" target="display">Choe et al., Plant Cell 10, 231 (1998)</A></td></tr>

<tr class="alt">    <TD><a name="98A3">98A3</a></TD>
        <TD>3'-hydroxylase for p-coumaryl shikimic acid, p-coumaryl quinic acid</TD>
	<TD>phenylpropanoid</TD>
	<TD>expressed in yeast</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=1347773" target="display">Schoch et al., J. Biol. Chem. 276, 36566 (2001) </A></td></tr>

<TR>    <TD><a name="701A3">701A3</a></TD>
        <TD>multifunctional ent-kaurene oxidase</TD>
	<TD>gibberellin</TD>
	<TD>complements ga3 mutant; expressed in yeast</TD>
	<td><a href="http://arabidopsis-p450.biotec.uiuc.edu/" target="display">NSF2010</a></td>
        <TD><a href="/servlets/TairObject?type=publication&id=2363" target="display">Helliwell et al., PNAS 95, 9019 (1998)</A><br><a href="/servlets/TairObject?type=publication&id=1802" target="display">Helliwell et al., Plant	Physiol. 119, 507 (1999)</A></td></tr>



  </TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
