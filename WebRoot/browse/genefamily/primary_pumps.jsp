<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Primary Pumps";
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
 

<h2><b><i>Arabidopsis thaliana</i> Primary Pumps (ATPases) Gene Family </b></h2>


<TABLE><TR>
<TD valign=top><B>Source:</B></TD>
<TD><ul>
<li>Website: <A HREF="http://www.life.umd.edu/CBMG/faculty/sze/lab/index.html">Heven Sze Lab
</A></li>
<li><b>Sze, H.,Schumacher, K.,Muller, M. L.,Padmanaban, S.,Taiz, L. </b>(2002) <a href="/servlets/TairObject?type=publication&id=501681364
">A simple nomenclature for a complex proton pump: VHA genes encode the vacuolar H(+)-ATPase.</a><i>TRENDS IN PLANT SCIENCE </i><b>7: 157</b></li><br />
<li><b>Baxter, I.,Tchieu, J.,Sussman, M. R.,Boutry, M.,Palmgren, M. G.,Gribskov, M.,Harper, J. F.,Axelsen, K. B. </b>(2003) <a href="/servlets/TairObject?type=publication&id=501706974">Genomic comparison of p-type ATPase ion pumps in Arabidopsis and rice. </a><i>PLANT PHYSIOLOGY </i><b>132: 618</b></li><br />
<li><b>Wu, Z.,Liang, F.,Hong, B.,Young, J. C.,Sussman, M. R.,Harper, J. F.,Sze, H. </b>(2002) <a href="/servlets/TairObject?type=publication&id=501682299">An endoplasmic reticulum-bound Ca(2+)/Mn(2+) pump, ECA1, supports plant growth and confers tolerance to Mn(2+) stress. </a><i>PLANT PHYSIOLOGY </i><b>130: 128</b></li><br />
<li><b>Liang, F.,Sze, H. </b>(1998) <a href="/servlets/TairObject?type=publication&id=2038">A high-affinity Ca2+ pump, ECA1, from the endoplasmic reticulum is inhibited by cyclopiazonic acid but not by thapsigargin. </a><i>PLANT PHYSIOLOGY </i><b>118: 817</b></li><br />
<li><b>Liang, F.,Cunningham, K. W.,Harper, J. F.,Sze, H. </b>(1997) <a href="/servlets/TairObject?type=publication&id=3109">ECA1 complements yeast mutants defective in Ca2+ pumps and encodes an endoplasmic reticulum-type Ca2+-ATPase in Arabidopsis thaliana.</a><i>PROCEEDINGS OF THE NATIONAL ACADEMY OF SCIENCES OF THE UNITED STATES OF AMERICA </i><b>94: 8579</b></li><br />
</ul>
</TD>
</tr>

<tr>
<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD>
<ul>
<li>Homology to Yeast VMA genes</li>
<li>Phylogenetically similar to P-type ATPase genes in other organisms</li>
</ul>
</TD>
</tr>

<TR><TD><B>Contact:</B></TD>
<TD><a href="/servlets/TairObject?type=person&id=6270">Heven Sze</A><br />
<a href="/servlets/TairObject?type=person&id=210828">Xiyan Li</A><br />
<a href="/servlets/Community?type=organization&action=view&communityID=8372">H Sze Laboratory</a>
</TD>
</tr>
</table>

<TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
    <TR> 
        <th><b>Subfamily:</b></th>
        <th><b>Gene Name:</b></th>
        <th><b>Chromosomal Locus:</b></th>
        <th><b>Protein Function/Description:</b></th>
            
    </TR>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-A</td>
        <td>At1g78900</td>
        <td>catalytic ATP-binding V1-ATPase subunit A</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-B1</td>
        <td>At1g76030</td>
        <td>non-catalytic ATP-binding V1-ATPase subunit B1</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-B2</td>
        <td>At4g38510</td>
        <td>non-catalytic ATP-binding V1-ATPase subunit B2</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-B3</td>
        <td>At1g20260</td>
        <td>non-catalytic ATP-binding V1-ATPase subunit B3</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-C</td>
        <td>At1g12840</td>
        <td>V1-ATPase subunit C; involved in stability</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-D</td>
        <td>At3g58730</td>
        <td>V1-ATPase subunit D; central stalk, coupling subunit</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-E1</td>
        <td>At4g11150</td>
        <td>V1-ATPase subunit E1; peripheral or central stalk</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-E2</td>
        <td>At3g08560</td>
        <td>V1-ATPase subunit E2; peripheral or central stalk</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-E3</td>
        <td>At1g64200</td>
        <td>V1-ATPase subunit E3; peripheral or central stalk</td>
    </tr>
    
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-F</td>
        <td>At4g02620</td>
        <td>V1-ATPase subunit F; bridge V1-V0 contacts</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-G1</td>
        <td>At3g01390</td>
        <td>V1-ATPase subunit G1; V1-V0 coupling subunit</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-G2</td>
        <td>At4g23710</td>
        <td>V1-ATPase subunit G2; V1-V0 coupling subunit</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-G3</td>
        <td>At4g25950</td>
        <td>V1-ATPase subunit G3; V1-V0 coupling subunit</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-H</td>
        <td>At3g42050</td>
        <td>V1-ATPase subunit H; regulatory subunit</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-a1</td>
        <td>At2g28520</td>
        <td>integral V0-ATPase subunit a1; coupling and assembly subunit</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-a2</td>
        <td>At2g21410</td>
        <td>integral V0-ATPase subunit a2; coupling and assembly subunit</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-a3</td>
        <td>At4g39080</td>
        <td>integral V0-ATPase subunit a3; coupling and assembly subunit</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-c1</td>
        <td>At4g34720</td>
        <td>integral proton translocating V0-ATPase subunit c1</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-c2</td>
        <td>At1g19910</td>
        <td>integral proton translocating V0-ATPase subunit c2</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-c3</td>
        <td>At4g38920</td>
        <td>integral proton translocating V0-ATPase subunit c3</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-c4</td>
        <td>At1g75630</td>
        <td>integral proton translocating V0-ATPase subunit c4</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-c5</td>
        <td>At2g16510</td>
        <td>integral proton translocating V0-ATPase subunit c5</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-c"1</td>
        <td>At4g32530</td>
        <td>integral proton translocating V0-ATPase subunit c"1</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-c"2</td>
        <td>At2g25610</td>
        <td>integral proton translocating V0-ATPase subunit c"2</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-d1</td>
        <td>At3g28710</td>
        <td>integral V0-ATPase subunit d1 involved in V0 assembly, stability</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-d2</td>
        <td>At3g28715</td>
        <td>integral V0-ATPase subunit d2 involved in V0 assembly, stability</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-e1</td>
        <td>At5g55290</td>
        <td>integral V0-ATPase subunit e1</td>
    </tr>
    
    <tr class="alt">
        <td>V-Type ATPase</td>
        <td>AtVHA-e2</td>
        <td>At4g26710</td>
        <td>integral V0-ATPase subunit e2</td>
    </tr>
    
    <tr class="alt">
        <td>Endoplasmic reticulum-type Ca2+-ATPase (ECA) family</td>
        <td>AtECA1</td>
        <td>At1g07810</td>
        <td>Ca2+/Mn2+-transporting P2A-type ATPase</td>
    </tr>
    
    <tr class="alt">
        <td>Endoplasmic reticulum-type Ca2+-ATPase (ECA) family</td>
        <td>AtECA2</td>
        <td>At4g00900</td>
        <td>putative Ca2+-transporting P2A-type ATPase</td>
    </tr>
    
    <tr class="alt">
        <td>Endoplasmic reticulum-type Ca2+-ATPase (ECA) family</td>
        <td>AtECA3</td>
        <td>At1g10130</td>
        <td>putative Ca2+-transporting P2A-type ATPase</td>
    </tr>
    
    <tr class="alt">
        <td>Endoplasmic reticulum-type Ca2+-ATPase (ECA) family</td>
        <td>AtECA4</td>
        <td>At1g07670</td>
        <td>putative Ca2+-transporting P2A-type ATPase</td>
    </tr>
  </TABLE>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A></P>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

