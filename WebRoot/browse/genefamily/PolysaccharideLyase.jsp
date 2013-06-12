<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Polysaccharide Lyase Gene Family";
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
 


<A NAME="PolysaccharideLyase.html"><h2>Polysaccharide Lyase Gene Family</h2></A>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD>
<TD><a href="http://www.cazy.org/" target="display"><B>Carbohydrate-Active enZymes server</B></a><B> (CAZy)</B><BR><BR>  
<A href="http://www.cazy.org/fam/acc_CE.html" target="display">Carbohydrate Esterases Family Server</a><BR>
<a href="http://www.cazy.org/fam/acc_GH.html" target="display">Glycoside Hydrolases Family Server</a><BR>
<a href="http://www.cazy.org/fam/acc_GT.html" target="display">Glycosyltransferase Family Server</a><BR>
<a href="http://www.cazy.org/fam/acc_PL.html" target="display">Polysaccharide Lyases Family Server</a>
</TD></TR>
<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD> </TD></TR>

<TR><TD valign=top><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=912146" target="display">Bernard Henrissat</A><BR><A href="/servlets/Community?action=view&type=person&communityID=912144" target="display">Pedro M.Coutinho</A><BR><A href="mailto:emeline@afmb.cnrs-mrs.fr">Emeline Deleury</A></TD></TR>

</TABLE>







    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th>    
	    </TR>
	    


<tr class="alt">    <TD ROWSPAN=28 valign=top><B><a href="http://www.cazy.org/fam/PL1.html">Polysaccharide Lyase Family 1</a></b></td>
	      <TD>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB69761.1">AAB69761.1</A></TD>
	      <TD>&nbsp;</TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB69762.1">AAB69762.1</A></TD>
	      <TD>&nbsp;</TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F22K18.20<BR><a href="/servlets/TairObject?type=locus&name=At4g24780 "/>At4g24780</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK25850.1">AAK25850.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g24780">putative pectate lyase</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F11F8.12<BR><a href="/servlets/TairObject?type=locus&name=At3g09540 "/>At3g09540</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF23285.1">AAF23285.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g09540">putative pectate lyase</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F12A21.12</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG28907.1">AAG28907.1</A></TD>
	      <TD>&nbsp;</TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F12F1.22<BR><a href="/servlets/TairObject?type=locus&name=At1g11920 "/>At1g11920</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC17625.1">AAC17625.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11920">pectate lyase-like protein</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F14L17.19<BR><a href="/servlets/TairObject?type=locus&name=At1g14420 "/>At1g14420</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB69759.1">AAB69759.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14420">pectate lyase, putative</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F17A9.16<BR><a href="/servlets/TairObject?type=locus&name=At3g07010 "/>At3g07010</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF27005.1">AAF27005.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07010">putative pectate lyase</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F17N18.100<BR><a href="/servlets/TairObject?type=locus&name=At4g13210 "/>At4g13210</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB41931.1">CAB41931.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g13210">pectate lyase like protein</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F18A5.100<BR><a href="/servlets/TairObject?type=locus&name=At4g13710 "/>At4g13710</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB36835.1">CAB36835.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g13710"> putative pectate lyase A11 (fragment)</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F1N20.180<BR><a href="/servlets/TairObject?type=locus&name=At4g22080 "/>At4g22080</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA18111.1">CAA18111.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g22080">pectate lyase like protein</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F1N20.190<BR><a href="/servlets/TairObject?type=locus&name=At4g22090 "/>At4g22090</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA18112.1">CAA18112.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g22090">pectate lyase like protein</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F28P10.100<BR><a href="/servlets/TairObject?type=locus&name=At3g54920 "/>At3g54920</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB41092.1">CAB41092.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g54920">pectate lyase - like protein</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F2G14_230<BR><a href="/servlets/TairObject?type=locus&name=At5g15110 "/>At5g15110</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01830.1">CAC01830.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g15110">pectate lyase -like protein</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>K19E20.1<BR><a href="/servlets/TairObject?type=locus&name=At5g48900 "/>At5g48900</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10313.1">BAB10313.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g48900">pectate lyase</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>K1G2.11</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA95715.1">BAA95715.1</A></TD>
	      <TD>&nbsp;</TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MDC12.15<BR><a href="/servlets/TairObject?type=locus&name=At5g63180 "/>At5g63180</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10560.1">BAB10560.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g63180">pectate lyase</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MDF20.16<BR><a href="/servlets/TairObject?type=locus&name=At5g55720 "/>At5g55720</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09239.1">BAB09239.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55720">pectate lyase</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MSD24.4<BR><a href="/servlets/TairObject?type=locus&name=At3g24640 "/>At3g24640</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01216.1">BAB01216.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g24640">hypothetical protein</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MUJ8.14<BR><a href="/servlets/TairObject?type=locus&name=At3g24230 "/>At3g24230</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01365.1">BAB01365.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g24230">pectate lyase, putative</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T1G11.7<BR><a href="/servlets/TairObject?type=locus&name=At1g04680 "/>At1g04680</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB80622.1">AAB80622.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04680">putative pectate lyase A11</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T20F6.14<BR><a href="/servlets/TairObject?type=locus&name=At2g02720 "/>At2g02720</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC05350.1">AAC05350.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02720">putative pectate lyase</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T22N4.10 T4P13.4<BR><a href="/servlets/TairObject?type=locus&name=At3g01270 "/>At3g01270</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF03499.1">AAF03499.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01270">putative pectate lyase</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T26I12.20<BR><a href="/servlets/TairObject?type=locus&name=At3g55140 "/>At3g55140</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB75748.1">CAB75748.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55140">pectate lyase -like protein</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T4D2.120<BR><a href="/servlets/TairObject?type=locus&name=At3g53190 "/>At3g53190</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB64222.1">CAB64222.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g53190">pectate lyase -like protein</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T4K22.5<BR><a href="/servlets/TairObject?type=locus&name=At1g30350 "/>At1g30350</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG28291.1">AAG28291.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30350">pectate lyase, putative</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T5E8_80<BR><a href="/servlets/TairObject?type=locus&name=At5g09280 "/>At5g09280</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC05454.1">CAC05454.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g09280">major pollen allergen-like protein</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB69760.1">AAB69760.1</A></TD>
	      <TD>&nbsp;</TD></TR>


<tr><TD ROWSPAN=7 valign=top><B><a href="http://www.cazy.org/fam/PL4.html">Polysaccharide Lyase Family 4</a></b></td>          <TD>&nbsp;</TD>
	      <TD>F20D10.150<BR><a href="/servlets/TairObject?type=locus&name=At4g38030 "/>At4g38030</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB37543.1">CAB37543.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38030">LG127/30 like gene</A></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F21M12.27<BR><a href="/servlets/TairObject?type=locus&name=At1g09880 "/>At1g09880</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB60741.1">AAB60741.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09880">hypothetical protein</A></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F21M12.28<BR><a href="/servlets/TairObject?type=locus&name=At1g09890 "/>At1g09890</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB60742.1">AAB60742.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09890">hypothetical protein</A></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F21M12.30<BR><a href="/servlets/TairObject?type=locus&name=At1g09910 "/>At1g09910</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB60743.1">AAB60743.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09910">hypothetical protein</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD><a href="/servlets/TairObject?type=locus&name=AT4g37950 "/>AT4g37950</a><a href="/servlets/TairObject?type=locus&name=AT4g37960 "/> AT4g37960</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA76417.1">CAA76417.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g37950">hypothetical protein</A></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T22A6.260<BR><a href="/servlets/TairObject?type=locus&name=At4g24430 "/>At4g24430</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB45078.1">CAB45078.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g24430">LG27/30-like gene</A></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T9I22.6<BR><a href="/servlets/TairObject?type=locus&name=At2g22620 "/>At2g22620</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD15570.1">AAD15570.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g22620">unknown protein</a></TD></TR>

</table>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
