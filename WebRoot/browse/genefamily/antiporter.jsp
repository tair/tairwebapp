<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Antiporter Superfamily";
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
 

<A NAME="antiporter"><h2><b><i>Arabidopsis thaliana</i> Antiporter Superfamily</b></h2></a>


<TABLE><TR>
<TD valign=top><B>Source:</B></TD>
<TD><ul>
<li>Website: <A HREF="http://www.bcm.edu/labs/2010/">Hirschi Lab 2010 Project</A></li>
<li>Website: <A HREF="http://www.life.umd.edu/CBMG/faculty/sze/lab/index.html">Heven Sze Lab</A></li>
<li><b>Sze, H.,Padmanaban, S.,Cellier, F.,Honys, D.,Cheng, N. H.,Bock, K. W.,Conejero, G.,Li, X.,Twell, D.,Ward, J. M.,Hirschi, K. D. </b>(2004) <a href="/servlets/TairObject?type=publication&id=501713267">Expression Patterns of a Novel AtCHX Gene Family Highlight Potential Roles in Osmotic Adjustment and K+ Homeostasis in Pollen Development. </a><i>PLANT PHYSIOLOGY </i><b>136: 2532-2547</b></li><br />
<li><b>Maser, P.,Thomine, S.,Schroeder, J. I.,Ward, J. M.,Hirschi, K.,Sze, H.,Talke, I. N.,Amtmann, A.,Maathuis, F. J.,Sanders, D.,Harper, J. F.,Tchieu, J.,Gribskov, M.,Persans, M. W.,Salt, D. E.,Kim, S. A.,Guerinot, M. L. </b>(2001) <a href="/servlets/TairObject?type=publication&id=501680620">Phylogenetic Relationships within Cation Transporter Families of Arabidopsis. </a><i>  	PLANT PHYSIOLOGY </i><b>126: 1646-1667</b></li><br />
<li><b>Padmanaban, Senthilkumar, Chanroj, Salil, Kwak, June M, Li, Xiyan, Ward, John M, Sze, Heven </b>(2007) <a href="/servlets/TairObject?type=publication&id=501721152">Participation of an Endomembrane Cation/H+ Exchanger AtCHX20 in Osmoregulation of Guard Cells. </a><i>PLANT PHYSIOLOGY </i><b>144: 82-93</b></li><br />
</ul>
</A>
</TD>
</tr>

<tr>
<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD>Phylogenetically similar to CPA2 Family genes in other organisms</TD>
</tr>

<TR><TD><B>Contact:</B></TD>
<TD><a href="/servlets/TairObject?type=person&id=6270">Heven Sze</A><br />
<a href="/servlets/TairObject?type=person&id=5515">Kendal Hirschi</A><br />
<a href="/servlets/Community?type=organization&action=view&communityID=8372">H Sze Laboratory</a><br />
<a href="/servlets/Community?type=organization&action=view&communityID=9616">K Hirschi Laboratory</a></td>
</tr>
</table>

<TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
    <TR> 
        <th><b>Subfamily:</b></th>
        <th><b>Gene Name:</b></th>
        <th><b>Chromosomal Locus:</b></th>
        <th><b>Protein Function/Description:</b></th>
        <th><b>Comments:</b></th>    
    </TR>
        
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX01</td>
        <td>At1g16380</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX02</td>
        <td>At1g79400</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX03</td>
        <td>At5g22900</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX04</td>
        <td>At3g44900</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX05</td>
        <td>At1g08150</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX06a</td>
        <td>At1g08140</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX06b</td>
        <td>At1g08135</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>Based on sequence alignments, we have revised the coding sequence for this gene. Please refer to website for revised sequences.
</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX07</td>
        <td>At2g28170</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>Based on sequence alignments, we have revised the coding sequence for this gene. Please refer to website for revised sequences.
</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX08</td>
        <td>At2g28180</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>Based on isolated pollen cDNA, we have revised the coding sequence for this gene. Please refer to website for revised sequences.
</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX09</td>
        <td>At5g22910</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX10</td>
        <td>At3g44930</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>Based on isolated pollen cDNA, we have revised the coding sequence for this gene. Please refer to website for revised sequences.</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX11</td>
        <td>At3g44920</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>Based on sequence alignments, we have revised the coding sequence for this gene. Please refer to website for revised sequences.</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX12</td>
        <td>At3g44910</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>Based on sequence alignments, we have revised the coding sequence for this gene. Please refer to website for revised sequences.</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX13</td>
        <td>At2g30240</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX14</td>
        <td>At1g06970</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX15</td>
        <td>At2g13620</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX16</td>
        <td>At1g64170</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>Based on isolated pollen cDNA, we have revised the coding sequence for this gene. Please refer to website for revised sequences.</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX17</td>
        <td>At4g23700</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX18</td>
        <td>At5g41610</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX19</td>
        <td>At3g17630</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>Based on isolated pollen cDNA, we have revised the coding sequence for this gene. Please refer to website for revised sequences.</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX20</td>
        <td>At3g53720</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX21</td>
        <td>At2g31910</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>Based on sequence alignments, we have revised the coding sequence for this gene. Please refer to website for revised sequences.</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX23</td>
        <td>At1g05580</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX24</td>
        <td>At5g37060</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX25</td>
        <td>At5g58460</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX26</td>
        <td>At5g01680</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX27</td>
        <td>At5g01690</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>Based on sequence alignments, we have revised the coding sequence for this gene. Please refer to website for revised sequences.</td>
    </tr>
    
    <tr class="alt">
        <td>Cation/H+ Exchanger (CPA2 Subfamily)</td>
        <td>AtCHX28</td>
        <td>At3g52080</td>
        <td>Cation/H+ Exchanger (CHX) Protein</td>
        <td>&nbsp;</td>
    </tr>
</TABLE>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A></P>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

  

