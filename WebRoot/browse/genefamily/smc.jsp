<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<%
	String pageName = "Structural Maintenance of Chromosomes family";
	String highlight = "3";
	String helpfile="";
	String cssfile="/css/page/pagelevels.css";
%>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="highlight" value="<%= highlight %>" />
	<jsp:param name="helpfile" value="<%= helpfile %>" />
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<!-- Content goes here //-->

<h2><b><i>Arabidopsis thaliana</i> Structural Maintenance of Chromosomes family</B></h2>

<table>
<tr>

<td valign=top><b>Source:</b></td>

<td valign=top>

<p><b>Watanabe K, Pacher M, Dukowic S, Schubert V, Puchta H, Schubert I. </b> (2009)
">The structural maintenance of chromosomes 5/6 Complex Promotes Sister Chromatid Alignment and Homologous Recombination after DNA Damage in Arabidopsis thaliana,<i> Plant Cell </i></p>

</td>
<tr>
<td valign=top><b>Gene Family<br />Criteria:</b></td>
<td>a.a. seq similarity to fission yeast and human SMCs using BLAST</td></tr>
</tr>
<tr><td><B>Contact:</B></td>
<td><a href="/entity/person_detail/1501430322">	Koichi Watanabe</a>
</tr>
</table> 

<table  align="center" border="1" cellspacing="0" cellpadding="2">
    <tr> 
        <th><b>Gene Sub Family name</b></th>
        <th><b>Gene Name:</b></th>
        <th><b>Chromosomal Locus:</b></th>
        <th><b>Protein Function/Description:</b></th>
        <th><b>Genbank Nuc. Accession</b></th>
    </tr>
    
    <tr class="alt">
        <td>Structural Maintenance of Chromosomes 5/6 family</td>    
        <td>SMC5</td>
        <td>AT5G15920</td>
        <td>a chromosomal ATPase</td>
        <td>NM_121597</td>
    </tr>
    
    <tr class="alt">
        <td>Structural Maintenance of Chromosomes 5/6 family</td>     
        <td>SMC6A</td>
        <td>AT5G07660</td>
        <td>a chromosomal ATPase</td>
        <td>NM_120848</td>
    </tr>
    
     <tr class="alt">
        <td>Structural Maintenance of Chromosomes 5/6 family</td>     
        <td>SMC6B</td>
        <td>AT5G61460</td>
        <td>a chromosomal ATPase</td>
        <td>NM_125539</td>
    </tr>
    
  
    </table>


<p>
<a href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</a>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

