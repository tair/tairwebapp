<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Mechanosensitive Ion Channel Family";
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

<h2><b><i>Arabidopsis thaliana</i> Mechanosensitive Ion Channel Family</B></h2>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD>
<td>
<li><b>Haswell, E.S.</b> (2007) <a href="/servlets/TairObject?type=publication&id=501722639
">MscS-like proteins in plants, Mechanosensitive Ion Channels, Part A</A> <i>CURRENT TOPICS IN MEMBRANES</i> <b>58</b><br />

<li><b>Haswell, Elizabeth S, Meyerowitz, Elliot M</b> (2006) <a href="/servlets/TairObject?type=publication&id=501718436
">MscS-like proteins control plastid size and shape in Arabidopsis thaliana.</A> <i>CURRENT BIOLOGY</i> <b>16: 1-11</b><br />

</TD></TR>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD>Expression, subcelluar localization, BLAST search and alignment with ClustalX; conserved motif recognized by Interpro</TD></TR>

<TR><TD><B>Contact:</B></TD>
<TD>&nbsp;</TD></TR>

</TABLE> 

<TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
    <TR>    
        <th><b>Subfamily:</b></th>
        <th><b>Gene Name:</b></th>
        <th><b>Chromosomal Locus:</b></th>
        <th><b>Protein Function/Description:</b></th>
        <th><b>Comments:</b></th>    
    </TR>
        
    <tr class="alt">    
        <td>MscS-Like family</td>
        <td>MSL1</td>
        <td>At4g00290</td>
        <td>Mechanosensitive channel</td>
        <td>contains InterPro domain MscS Mechanosensitive ion channel; (InterPro:IPR006685)</td>
    </tr>
    
    <tr class="alt">    
        <td>MscS-Like family</td>
        <td>MSL2</td>
        <td>At5g10490</td>
        <td>Mechanosensitive channel</td>
        <td>contains InterPro domain MscS Mechanosensitive ion channel; (InterPro:IPR006685)</td>
    </tr>
    
    <tr class="alt">    
        <td>MscS-Like family</td>
        <td>MSL3</td>
        <td>At1g58200</td>
        <td>Mechanosensitive channel</td>
        <td>contains InterPro domain MscS Mechanosensitive ion channel; (InterPro:IPR006685)</td>
    </tr>
    
    <tr class="alt">    
        <td>MscS-Like family</td>
        <td>MSL4</td>
        <td>At1g53470</td>
        <td>Mechanosensitive channel</td>
        <td>contains InterPro domain MscS Mechanosensitive ion channel; (InterPro:IPR006685)</td>
    </tr>
    
    <tr class="alt">    
        <td>MscS-Like family</td>
        <td>MSL5</td>
        <td>At3g14810</td>
        <td>Mechanosensitive channel</td>
        <td>contains InterPro domain MscS Mechanosensitive ion channel; (InterPro:IPR006685)</td>
    </tr>
    
    <tr class="alt">    
        <td>MscS-Like family</td>
        <td>MSL6</td>
        <td>At1g78610</td>
        <td>Mechanosensitive channel</td>
        <td>contains InterPro domain MscS Mechanosensitive ion channel; (InterPro:IPR006685)</td>
    </tr>
    
    <tr class="alt">    
        <td>MscS-Like family</td>
        <td>MSL7</td>
        <td>At2g17000</td>
        <td>Mechanosensitive channel</td>
        <td>contains InterPro domain MscS Mechanosensitive ion channel; (InterPro:IPR006685)</td>
    </tr>
    
    <tr class="alt">    
        <td>MscS-Like family</td>
        <td>MSL8</td>
        <td>At2g17010</td>
        <td>Mechanosensitive channel</td>
        <td>contains InterPro domain MscS Mechanosensitive ion channel; (InterPro:IPR006685)</td>
    </tr>
    
    <tr class="alt">    
        <td>MscS-Like family</td>
        <td>MSL9</td>
        <td>At5g19520</td>
        <td>Mechanosensitive channel</td>
        <td>contains InterPro domain MscS Mechanosensitive ion channel; (InterPro:IPR006685)</td>
    </tr>
    
    <tr class="alt">    
        <td>MscS-Like family</td>
        <td>MSL10</td>
        <td>At5g12080</td>
        <td>Mechanosensitive channel</td>
        <td>contains InterPro domain MscS Mechanosensitive ion channel; (InterPro:IPR006685)</td>
    </tr>
    
</TABLE>


<p>
<a href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</a>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

