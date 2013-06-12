<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Myosins and Kinesins Gene Families ";
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

<A NAME=""><h2>Arabidopsis Myosins Gene Family</h2></A>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD>
<TD><b>Anireddy SN. Reddy and Irene S Day</b> (2001) <a href=/servlets/TairObject?type=publication&id=501680395 target=new>Analysis of the myosins encoded in the recently completed Arabidopsis thaliana genome sequence.</A> <i>Genome Biol.</i> <b>2 (7): </b>research0024.1research0024.17</TD></TR>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD>please see the above article for more details. </TD></TR>

<TR><TD valign=top><B>Contact:</B></TD>
<TD><a href="/servlets/Community?action=view&type=person&communityID=5935" target="display">Anireddy SN. Reddy</a> <br>  <A href="/servlets/Community?action=view&type=person&communityID=912159" target="display">Irene S Day</a></TD></TR>

</TABLE>

    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="0">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th> 
	    </TR>
	    

<tr class="alt">    <TD ROWSPAN=17 valign="top"><B>Myosin-like proteins</B></TD>
<td>At ATM</td>
<td>AT3g19960<br>MZE19.3</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g19960" target="display">myosin </A></td>
    </tr>


<tr class="alt">
<TD>At ATM2</TD>
<td>MDK4.10<br>AT5g54280</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g54280" target="display">myosin heavy chain</A></td>
    </tr>

<tr class="alt">
<TD>At VIIIA </TD>
<td>F14I3.6<br>AT1g50360</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g50360" target="display">myosin, putative </A></td>
    </tr>    

<tr class="alt">
<TD>At VIIIB </TD>
<td>M4I22.180<br>AT4g27370</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g27370" target="display">myosin heavy chain - like protein </A></td>
    </tr>

<tr class="alt">
<TD>At MYA1 </TD>
<td>F1L3.28<br>AT1g17580</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=" target="display">myosin, putative </A></td>
    </tr>    


<tr class="alt">
<TD>At MYA2 </TD>
<td>F6B6.4<br>AT5g43900</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g43900" target="display">myosin heavy chain MYA2 (pir||S51824) </A></td>
    </tr>

<tr class="alt">
<TD> At XIA</TD>
<td>T1G11.15<br>AT1g04600</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g04600" target="display">putative myosin heavy chain </A></td>
    </tr>    


<tr class="alt">
<TD>At XIB </TD>
<td>F20D22.7<br>At1g04160</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04160" target="display">myosin heavy chain MYA2 </A></td>
    </tr>

<tr class="alt">
<TD>At XIC </TD>
<td>F22O13.200<br>At1g08730</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08730" target="display">putative myosin MYA1, class V (Z28389) </A></td>
    </tr>    


<tr class="alt">
<TD> At XID</TD>
<td>F25I18.2<br>AT2g33240</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g33240" target="display">putative myosin heavy chain </A></td>
    </tr>

<tr class="alt">
<TD>At XIE </TD>
<td>T22H22.1<br>AT1g54560</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g54560" target="display">myosin, putative </A></td>
    </tr>    


<tr class="alt">
<TD>At XIF </TD>
<td>F20M17.6<br>AT2g31900</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g31900" target="display">putative unconventional myosin </A></td>
    </tr>

<tr class="alt">
<TD>At XIG </TD>
<td>F11A3.16<br>AT2g20290</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g20290" target="display">putative myosin heavy chain </A></td>
    </tr>    


<tr class="alt">
<TD>At XIH </TD>
<td>F16A16.180<br>AT4g28710</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g28710" target="display">myosin heavy chain - like protein (fragment) </A></td>
    </tr>

<tr class="alt">
<TD>At XI-I </TD>
<td>F4I10.130<br>At4g33200</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g33200" target="display">myosin - like protein </A></td>
    </tr>    


<tr class="alt">
<TD>At XIJ </TD>
<td>F9D24.70<br>AT3g58160</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g58160" target="display">myosin heavy chain MYA3 </A></td>
    </tr>

<tr class="alt">
<TD>At XIK </TD>
<td>F7C8.80<br>AT5g20490</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g20490" target="display">myosin-like protein </A></td>
    </tr>    





</table>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>
  <BR>



<P><br><br><br>
<p>
<A NAME="kinesins"><h2>Arabidopsis Kinesins Gene Family</h2></A>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD>
<TD><b>Anireddy SN. Reddy and Irene S. Day</b> (2001) <A href="/servlets/TairObject?type=publication&id=501680393" target=new>Kinesins in the Arabidopsis genome: A comparative analysis among eukaryotes.</A> <i>BMC Genomics</i> <b>2 (1): </b>2   </TD></TR>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD>please see the above article for more details. </TD></TR>

<TR><TD valign=top><B>Contact:</B></TD>
<TD><a href="/servlets/Community?action=view&type=person&communityID=5935" target="display">Anireddy SN. Reddy</a><br>  <A href="/servlets/Community?action=view&type=person&communityID=912159" target="display">Irene S Day</A></TD></TR>

</TABLE>

    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="0">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th> 
	    </TR>

<tr class="alt">
<TD ROWSPAN=61 valign="top"><B>Kinesin-like proteins</b></td>
<TD>AtKatA</TD>
<td>F7J7.210<br>At4g21270</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g21270" target="display">kinesin-related protein katA</A></td>
    </tr>

<tr class="alt">
<TD>AtKatB </TD>
<td>T24A18.130<br>At4g27180</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g27180" target="display">kinesin-related protein katB</A></td>
    </tr>    
    

<tr class="alt">
<TD>AtKatC (K5F14) </TD>
<td>K5F14.1<br>At5g54670</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g54670" target="display">kinesin-like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtKatD (F2P16) </TD>
<td>F2P16.12<br>At5g27000</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27000" target="display">kinesin-like heavy chain </A></td>
    </tr>    
	    
<tr class="alt">
<TD>AtKCBP (K14B20) </TD>
<td>K14B20.10<br>At5g65930</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65930" target="display"> kinesin-like calmodulin-binding protein </A></td>
    </tr>

<tr class="alt">
<TD>AtKRP125a (F3G5) </TD>
<td>F3G5.21<br>At2g37420</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37420" target="display">putative kinesin heavy chain</A></td>
    </tr>    
    

<tr class="alt">
<TD>AtKRP125b (F9C22) </TD>
<td>F2H17.19<br>At2g36200</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36200" target="display">putative kinesin-related cytokinesis protein</A></td>
    </tr>

<tr class="alt">
<TD>AtKRP125c (T8O18) </TD>
<td>T8O18.9<br>At2g28620</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28620" target="display">putative kinesin-like spindle protein</A></td>
    </tr>

<tr class="alt">
<TD>Atd13205w (FCA1) </TD>
<td>dl3205w<br>At4g14330</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g14330" target="display">kinesin like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtT19F6.160 </TD>
<td>T19F6.160<br>At4g24170</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g24170" target="display">putative protein</A></td>
    </tr>    
    

<tr class="alt">
<TD>AtT32N15.10 </TD>
<td>T32N15.10<br>At3g44730</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g44730" target="display">putative kinesin-like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtT30B22.20 </TD>
<td>T30B22.16<br>At2g47500</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47500" target="display">putative kinesin heavy chain</A></td>
    </tr>

<tr class="alt">
<TD>AtT12M4.14 </TD>
<td>T12M4.14<br>At1g09170</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09170" target="display">putative kinesin</A></td>
    </tr>

<tr class="alt">
<TD>AtT5A14.3 </TD>
<td>T5A14.3<br>At1g55550</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55550" target="display">awaiting functional assignment</A></td>
    </tr>    
    

<tr class="alt">
<TD>AtT9I22.5 </TD>
<td>T9I22.5<br>At2g22610</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g22610" target="display">putative kinesin heavy chain</A></td>
    </tr>

<tr class="alt">
<TD>AtF19H22.50 </TD>
<td>F19H22.50<br>At4g38950</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g38950" target="display">kinesin like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtF19H22.150 </TD>
<td>F19H22.150<br>At4g39050</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g39050" target="display">kinesin like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtF3K23.6 </TD>
<td>F3K23.6<br>At2g21300</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21300" target="display">putative kinesin heavy chain</A></td>
    </tr>    
    

<tr class="alt">
<TD>AtF3K23.14 </TD>
<td>F3K23.14<br>At2g21380</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21380" target="display">putative kinesin heavy chain</A></td>
    </tr>

<tr class="alt">
<TD>AtF8K7.17 </TD>
<td>F8K7.17<br>At1g21730</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g21730" target="display">kinesin-like protein</A></td>
    </tr>

 <tr class="alt">
<TD>AtF28P10.150 </TD>
<td>F28P10.150<br>At3g54870</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g54870" target="display">kinesin-like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtF14P13.9 </TD>
<td>F14P13.9<br>At3g10310</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g10310" target="display">kinesin-like protein</A></td>
    </tr>    
    

<tr class="alt">
<TD>AtF14P13.22 </TD>
<td>F14P13.22<br>At3g10180</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g10180" target="display">putative kinesin-like centromere protein</A></td>
    </tr>

<tr class="alt">
<TD>AtF24D7.17a </TD>
<td>F2K11.1<br>At1g63640</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g63640" target="display">kinesin-like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtZCF125b </TD>
<td>T30E16.9<br>At1g59540</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g59540" target="display">kinesin motor protein (kin2), putative</A></td>
    </tr>

<tr class="alt">
<TD>AtT9C5.240 </TD>
<td>T9C5.240<br>At3g49650</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g49650" target="display">kinesin-like protein</A></td>
    </tr>    
    

<tr class="alt">
<TD>AtF25P22.28c </TD>
<td>F2P9.27<br>At1g73860</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73860" target="display">putative kinesin </A></td>
    </tr>

<tr class="alt">
<TD>AtF15H18.10 </TD>
<td>F15H18.10<br>At1g18410</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18410" target="display">kinesin-related protein, putative</A></td>
    </tr>

<tr class="alt">
<TD>AtF15H18.12 </TD>
<td>F15H18.12<br>At1g18370</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18370" target="display">kinesin heavy chain isolog, putative </A></td>
    </tr>

<tr class="alt">
<TD>AtF24M12.190 </TD>
<td>F24M12.190<br>At3g51150</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g51150" target="display">putative protein </A></td>
    </tr>    
    

<tr class="alt">
<TD>AtC17L7.110 </TD>
<td>C17L7.110<br>At4g05190</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g05190" target="display">kinesin - like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtF16L2.60 </TD>
<td>F16L2.60<br>At3g45850</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g45850" target="display">kinesin-related protein - like</A></td>
    </tr>

 <tr class="alt">
<TD>AtT1E22.130 </TD>
<td>T1E22.130<br>At5g02370</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g02370" target="display">kinesin -like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtMAA21.110 </TD>
<td>MAA21.110<br>At3g63480</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g63480" target="display">kinesin heavy chain - like protein</A></td>
    </tr>    
    

<tr class="alt">
<TD>AtT15B3.190 </TD>
<td>T15B3.190<br>At3g44050</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g44050" target="display">kinesin -like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtF11C1.80 </TD>
<td>F11C1.80<br>At3g50240</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g50240" target="display">kinesin -like protein </A></td>
    </tr>

 <tr class="alt">
<TD>AtF7K15.60 </TD>
<td>F7K15.60<br>At3g43210</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g43210" target="display">kinesin -like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtF12B17.180 </TD>
<td>F12B17.180<br>At5g10470</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g10470" target="display">putative protein</A></td>
    </tr>    
    

<tr class="alt">
<TD>AtF22M8.8 </TD>
<td>F22M8.8<br>At1g01950</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01950" target="display">unknown protein</A></td>
    </tr>

<tr class="alt">
<TD>AtPAKRPd (FCA0) </TD>
<td>dl3115c<br>At4g14150</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g14150" target="display">kinesin like protein </A></td>
    </tr>


<tr class="alt">
<TD>AtF5011.15 </TD>
<td>F5O11.15<br>At1g12430</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g12430" target="display">hypothetical protein </A></td>
    </tr>

<tr class="alt">
<TD>AtT20H2.17 </TD>
<td>T20H2.17<br>At1g20060</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20060" target="display">hypothetical protein </A></td>
    </tr>    
    

<tr class="alt">
<TD>AtMGL6.9 </TD>
<td>MGL6.9<br>At3g16630</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16630" target="display">kinesin-like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtMGD8.20 </TD>
<td>MGD8.23<br>At3g17360</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g17360" target="display">kinesin-like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtK13E13.17 </TD>
<td>K13E13.4<br>At3g19050</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g19050" target="display">hypothetical protein</A></td>
    </tr>

<tr class="alt">
<TD>At MAL21.18 </TD>
<td>MAL21.18<br>At3g20150</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g20150" target="display">kinesin-like protein </A></td>
    </tr>    
    

<tr class="alt">
<TD>AtMSL1.9 </TD>
<td>MSL1.9<br>At3g16060</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16060" target="display"> kinesin-like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtMDB19.16 </TD>
<td>MDB19.17<br>At3g23670</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g23670" target="display">hypothetical protein</A></td>
    </tr>

<tr class="alt">
<TD>AtMDH9.19 </TD>
<td>MDH9.19<br>At5g42490</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g42490" target="display">kinesin heavy chain-like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtMNA5.20 </TD>
<td>MNA5.20<br>At5g65460</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65460" target="display">putative protein</A></td>
    </tr>    
    

<tr class="alt">
<TD>AtF25I16.11 </TD>
<td>F25I16.11<br>At1g18550</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18550" target="display">hypothetical protein</A></td>
    </tr>

<tr class="alt">
<TD>AtT21B14.15e </TD>
<td>MEC18.17<br>At3g12020</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g12020" target="display">unknown protein</A></td>
    </tr>

<tr class="alt">
<TD>AtMSL3.5 </TD>
<td>MSL3.50<br>At5g60930</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60930" target="display">microtubule-associated motor - like </A></td>
    </tr>

<tr class="alt">
<TD>AtK1L20.9 </TD>
<td>K1L20.9<br>At5g66310</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g66310" target="display">kinesin heavy chain DNA binding protein-like</A></td>
    </tr>    
    

<tr class="alt">
<TD>AtK1013.11 </TD>
<td>K1O13.11<br>At5g41310</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g41310" target="display">kinesin-like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtF15M7.20 </TD>
<td>F15M7.20<br>At5g06670</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g06670" target="display">kinesin heavy chain-like protein </A></td>
    </tr>

<tr class="alt">
<TD>AtMCA23.16 </TD>
<td>MCA23.16<br>At5g47820</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g47820" target="display">kinesin-like protein </A></td>
    </tr>

<tr class="alt">
<TD>AtT9N14.6 </TD>
<td>T9N14.6<br>At1g72250</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72250" target="display">kinesin, putative </A></td>
    </tr>    
    

<tr class="alt">
<TD>AtMRO11.5 </TD>
<td>MRO11.5<br>At5g23910</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g23910" target="display">unknown protein</A></td>
    </tr>

<tr class="alt">
<TD>AtF15F15.20 </TD>
<td>F15F15.20<br>At5g27950</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27950" target="display">putative protein</A></td>
    </tr>

<tr class="alt">
<TD>AtF15A18.10</TD>
<td>F15A18.10<br>At5g27550</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27550" target="display">kinesin-like protein</A></td>
    </tr>    
    
</table>



<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
