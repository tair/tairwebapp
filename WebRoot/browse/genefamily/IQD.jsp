<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "IQD";
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

<h2><b><i>Arabidopsis thaliana</i> IQD Protein Family </b></h2>


<TABLE><TR>
<TD valign=top><B>Source:</B></TD>
<TD><ul>
<li><b>Abel, Steffen, Savchenko, Tatyana, Levy, Maggie </b>(2005) <a href="/servlets/TairObject?type=publication&id=501718178
"> Genome-wide comparative analysis of the IQD gene families in Arabidopsis thaliana and Oryza sativa. </a><i>BMC EVOLUTIONARY BIOLOGY </i><b>5: 72</b></li>
</ul>
</A>
</TD>
</tr>

<tr>
<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Contains plant-specific, conserved "IQ Domain" (67 amino acids)</td>
</tr>

<tr>
<td valign="top"><b>Similar Sequence or Common Domain:</b></td>
<td>Multiple IQ motifs (Pfam 00612)</td>
</tr>

<TR><TD><B>Contact:</B></TD>
<TD><a href="/servlets/TairObject?type=person&id=5114">Steffen Abel</A><br />
</tr>
</table>

<TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
    <TR>
    <th><b>Gene Name:</b></th>
    <th><b>Chromosomal Locus:</b></th>
    <th><b>Comments:</b></th> 
    </TR>
    
    <tr class="alt">
        <td>IQD1</td>
        <td>At3g09710</td>
        <td>calmodulin-binding</td>
    </tr>

    <tr class="alt">
        <td>IQD2</td>
        <td>At5g03040</td>
        <td>calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD3</td>
        <td>At3g52290</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD4</td>
        <td>At2g26410</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD5</td>
        <td>At3g22190</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD6</td>
        <td>At2g26180</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD7</td>
        <td>At1g17480</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD8</td>
        <td>At1g72670</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD9</td>
        <td>At2g33990</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD10</td>
        <td>At3g15050</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD11</td>
        <td>At5g13460</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD12</td>
        <td>At5g03960</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD13</td>
        <td>At3g59690</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD14</td>
        <td>At2g43680</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD15</td>
        <td>At3g49380</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD16</td>
        <td>At4g10640</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD17</td>
        <td>At4g00820</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD18</td>
        <td>At1g01110</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD19</td>
        <td>At4g14750</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD20</td>
        <td>At3g51380</td>
        <td>calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD21</td>
        <td>At3g49260</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD22</td>
        <td>At4g23060</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD23</td>
        <td>At5g62070</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD24</td>
        <td>At5g07240</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD25</td>
        <td>At4g29150</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD26</td>
        <td>At3g16490</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD27</td>
        <td>At1g51960</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD28</td>
        <td>At1g14380</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD29</td>
        <td>At2g02790</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD30</td>
        <td>At1g18840</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD31</td>
        <td>At1g74690</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD32</td>
        <td>At1g19870</td>
        <td>putative calmodulin-binding</td>
    </tr>
    
    <tr class="alt">
        <td>IQD33</td>
        <td>At5g35670</td>
        <td>putative calmodulin-binding</td>
    </tr>
        </tr>
</TABLE>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A></P>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
