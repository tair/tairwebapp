<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Tify family";
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
 

<A NAME="tify"><h2><b><i>Arabidopsis thaliana</i> Tify Family</B></A></h2>


<TABLE><TR>
<TD valign=top><B>Source:</B></TD>
<TD>Website: <A HREF="http://www.molecularbiotechnology.ugent.be/">Molecular Biotechnology at Ghent University</A><br />
</tr>
<tr>
<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD>Defined by the presence of the 36 amino acid tify domain (previously ZIM)</TD></TR>

<TR><TD><B>Contact:</B></TD>
<TD><a href="/servlets/TairObject?type=person&id=1516">Lieve Gheysen</A></TD></TR>


</TABLE> 

<TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
    <TR>    
        <th><b>Gene Name:</b></th>
        <th><b>Chromosomal Locus:</b></th>
        <th><b>Protein Function/Description:</b></th>
        <th><b>Comments:</b></th>    
    </TR>
        
    <tr class="alt">    
        <td>tify1</td>
        <td>AT4g24470</td>
        <td>putative transcription factor</td>
        <td>nuclear localization <br />DNA binding capacity</td>
    </tr>
    
    <tr class="alt">
        <td>tify2a</td>
        <td>AT1g51600</td>
        <td>putative transcription factor</td>
        <td></td>
    </tr>
    
    <tr class="alt">
        <td>tify2b</td>
        <td>AT3g21175</td>
        <td>putative transcription factor</td>
        <td></td>
    </tr>
    
    <tr class="alt">
        <td>tify3a</td>
        <td>AT3g43440</td>
        <td>unknown</td>
        <td></td>
    </tr>
    
    <tr class="alt">
        <td>tify3b</td>
        <td>AT5g20900</td>
        <td>unknown</td>
        <td></td>
    </tr>
    
    <tr class="alt">
        <td>tify4a</td>
        <td>AT4g14713</td>
        <td>putative transcription factor</td>
        <td>regulation of cell proliferation</td>
    </tr>
    
    <tr class="alt">
        <td>tify4b</td>
        <td>AT4g14720</td>
        <td>putative transcription factor</td>
        <td>regulation of cell proliferation</td>
    </tr>
    
    <tr class="alt">
        <td>tify5a</td>
        <td>AT1g30135</td>
        <td>unknown</td>
        <td>induced by MeJA</td>
    </tr>
    
    <tr class="alt">
        <td>tify5b</td>
        <td>AT2g34600</td>
        <td>unknown</td>
        <td>induced by MeJA</td>
    </tr>
    
    <tr class="alt">
        <td>tify6a</td>
        <td>AT1g48500</td>
        <td>unknown</td>
        <td></td>
    </tr>
    
    <tr class="alt">
        <td>tify6b</td>
        <td>AT3g17860</td>
        <td>unknown</td>
        <td>induced by MeJA</td>
    </tr>
    
    <tr class="alt">
        <td>tify7</td>
        <td>AT1g70700</td>
        <td>unknown</td>
        <td>induced by MeJA</td>
    </tr>
    
    <tr class="alt">
        <td>tify8</td>
        <td>AT4g32570</td>
        <td>unknown</td>
        <td></td>
    </tr>
    
    <tr class="alt">
        <td>tify9</td>
        <td>AT5g13220</td>
        <td>unknown</td>
        <td>induced by MeJA</td>
    </tr>
    
    <tr class="alt">
        <td>tify10a</td>
        <td>AT1g19180</td>
        <td>unknown</td>
        <td>nuclear localization<br />induced by MeJA, auxin and plant-parasitic nematodes</td>
    </tr>
    
    <tr class="alt">
        <td>tify10b</td>
        <td>AT1g74950</td>
        <td>unknown</td>
        <td>induced by MeJA</td>
    </tr>
    
    <tr class="alt">
        <td>tify11a</td>
        <td>AT1g17380</td>
        <td>unknown</td>
        <td>induced by MeJA</td>
    </tr>
    
    <tr class="alt">
        <td>tify11b</td>
        <td>AT1g72450</td>
        <td>unknown</td>
        <td>induced by MeJA</td>
    </tr>
       
</TABLE>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

