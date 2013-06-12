<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Protein tyrosine phosphatase (PTP) family";
	String cssfile="/css/page/pagelevels.css";
%>
<%@ page
	errorPage="/jsp/common/gen_error.jsp"
	import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<!-- Content goes here //-->
 

<A NAME="phosphatase"><h2><b><i>Arabidopsis thaliana</i> Protein tyrosine phosphatase (PTP) family</b></h2></a>


<TABLE><TR>
<TD valign=top><B>Source:</B></TD>
<TD><ul>
<li>Website: <A HREF="http://nature.berkeley.edu/luanlab/PTP2010/PTP2010index.html">Genomics and Proteomics Approaches to the Function of Tyrosine Phosphatases in Arabidopsis</A></li>

</ul>
</A>
</TD>
</tr>

<tr>
<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD><ul><li>Active domain sequence and structure analysis; biochemical and enzyme activity assays</li></ul></TD>
</tr>

<tr>
<TD valign=top><B>Similar sequence<BR>and/or common domain:</B></TD>
<TD><ul><li>All proteins in the extended PTP family contain HCxxxxxR signature motif/Dual specificity PTPs contain HCxxGxxRxG signature motif/C is invariant and essential for the catalytic function - phosphoenzyme formation</li></ul></TD>
</tr>

<TR>
<TD valign=top><B>Comments:</B></TD>
<TD><ul>
<li>The mRNA capping enzymes of plant and worm contain the PTPs signature motif and are included for completeness although they were not demostrated to have PTP catalytic function</li>

</ul>
</A>
</TD>
</tr>

<TR><TD><B>Contact:</B></TD>
<TD><a href="/servlets/TairObject?type=person&id=5679">Sheng Luan</A><br />
<a href="/servlets/Community?type=organization&action=view&communityID=8310">S Luan Laboratory</a><br />
</tr>
</table>

<TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
    <TR> 
        <th><b>Gene Subfamily:</b></th>
        <th><b>Gene Name:</b></th>
        <th><b>Locus ID:</b></th>
        <th><b>Genbank Protein Accession</b></th>
        <th><b>Protein Function/Description:</b></th>
        
    </TR>
        
    <tr class="alt">
        <td>AtPTP</td>
        <td>AtPTP1</td>
        <td>At1g71860</td>
        <td>AAL49899</td>
        <td>Protein Tyrosine phosphatase</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP1</td>
        <td>At3g23610</td>
        <td>CAA77232</td>
        <td>Protein phosphatase Dual specificity phosphatase - may dephosphorylate MAPKs</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP1-like</td>
        <td>At5g23720</td>
        <td>BAB10045</td>
        <td>Protein phosphatases dual specificity function - putative</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP2</td>
        <td>At3g06110</td>
        <td>AAF30304</td>
        <td>Protein phosphatases dual specificity function</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP3, IBR5</td>
        <td>At2g04550</td>
        <td>AAD25825</td>
        <td>Mediating auxin-response</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP4, AtPTPKIS1,AtSEX4</td>
        <td>At3g52180</td>
        <td>CAC18328</td>
        <td>protein phosphatase function, dephosporylation of starch; involved in starch metabolism regulation/kinase interaction sequence protein (PTPKIS1)</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP5</td>
        <td>At3g10940</td>
        <td>AAF01527</td>
        <td>Protein phosphatases dual specificity function - putative</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP6</td>
        <td>At3g01510</td>
        <td>AAF01536</td>
        <td>Protein phosphatases dual specificity function - putative/5'-AMP-activated protein kinase beta-1 subunit-related</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP7</td>
        <td>At2g32960</td>
        <td>AAB91974</td>
        <td>Protein phosphatases dual specificity function - putative</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP8</td>
        <td>At2g35680</td>
        <td>AAD15447</td>
        <td>Protein phosphatases dual specificity function</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP9</td>
        <td>At1g05000</td>
        <td>AAC97999</td>
        <td>Protein phosphatases dual specificity function - putative</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP10</td>
        <td>At5g56610</td>
        <td>BAB09879</td>
        <td>Protein phosphatases dual specificity function - putative</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP11</td>
        <td>At4g03960</td>
        <td>AAL51114</td>
        <td>Protein phosphatases dual specificity function - putative</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP12</td>
        <td>At5g16480</td>
        <td>BAB09615</td>
        <td>Protein phosphatases dual specificity function - putative</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP13</td>
        <td>At3g02800</td>
        <td>BAB09615</td>
        <td>Protein phosphatases dual specificity function - putative</td>
    </tr>
    
    <tr class="alt">
        <td>AtDSPs</td>
        <td>AtDSP14, AtMKP1</td>
        <td>At3g55270</td>
        <td>AAK29382</td>
        <td>Protein phosphatases dual specificity function -  may dephosphorylate MAPK</td>
    </tr>
    
     <tr class="alt">
        <td>CDC25-like</td>
        <td>CDC25-like</td>
        <td>At5g03455</td>
        <td>Q8GY31</td>
        <td>Rhodanese-like domain-containing protein</td>
    </tr>
    
    <tr class="alt">
        <td>PTENs</td>
        <td>AtPTEN1</td>
        <td>At5g39400</td>
        <td>BAB11013</td>
        <td>Protein phosphatases dual specificity function,function in polen development/phosphatase and tensin (putative)</td>
    </tr>
    
    <tr class="alt">
        <td>PTENs</td>
        <td>AtPTEN2</td>
        <td>At3g19420</td>
        <td>BAB02466</td>
        <td>Protein phosphatases dual specificity function - putative</td>
    </tr>
    
    <tr class="alt">
        <td>PTENs</td>
        <td>AtPTEN3</td>
        <td>At3g50110</td>
        <td>AAN41331</td>
        <td>Protein phosphatases dual specificity function - putative</td>
    </tr>
    
    <tr class="alt">
        <td>PTENs</td>
        <td>AtPTEN4</td>
        <td>At5g58160</td>
        <td>BAA96907</td>
        <td>Protein phosphatases dual specificity function - putative/FH2-domain containing</td>
    </tr>
    
    <tr class="alt">
        <td>MTMs</td>
        <td>AtMTM1</td>
        <td>At3g10550</td>
        <td>AAF76357</td>
        <td>Protein phosphatases dual specificity function - putative</td>
    </tr>
    
    <tr class="alt">
        <td>MTMs</td>
        <td>AtMTM2</td>
        <td>At5g04540</td>
        <td>T48451</td>
        <td>Protein phosphatases dual specificity function - putative</td>
    </tr>
    
    <tr class="alt">
        <td>LMW</td>
        <td>AtLMW</td>
        <td>At3g44620</td>
        <td>CAB72464</td>
        <td>Protein phosphatases dual specificity function - putative/phosphotyrosine protein</td>
    </tr>
    
    <tr class="alt">
        <td>EYE-like</td>
        <td>AtEYA</td>
        <td>At2g35320</td>
        <td>AAK95318</td>
        <td>Transcription factor with PTP function (putative)</td>
       
    </tr>
    
    <tr class="alt">
        <td>mRNA-capping enzymes</td>
        <td>MRC1</td>
        <td>At3g09100</td>
        <td>AAD56326</td>
        <td>mRNA capping enzyme family protein</td>
    </tr>
    
    <tr class="alt">
        <td>mRNA-capping enzymes</td>
        <td>MRC2</td>
        <td>At5g01290</td>
        <td>T45969</td>
        <td>mRNA capping enzyme family protein</td>
    </tr>
    
    <tr class="alt">
        <td>mRNA-capping enzymes</td>
        <td>MRC3</td>
        <td>At5g28210</td>
        <td>AAD49100</td>
        <td>mRNA capping enzyme family protein</td>
    </tr>
    
    
</TABLE>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A></P>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

  

