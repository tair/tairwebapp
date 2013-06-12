<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR- Carboydrate Esterase Gene Family";
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
<A NAME="CarbohydrateEsterase.html"><h2>Carbohydrate Esterase Gene Families</a></h2>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD>
<TD><a href="http://www.cazy.org/" target="display"><b>Carbohydrate-Active enZymes server</b></a><b> (CAZy)</b>
<br><br> 
<a href="http://www.cazy.org/fam/acc_CE.html" target="display">Carbohydrate Esterases Family Server</a><br>
<a href="http://www.cazy.org/fam/acc_GH.html" target="display">Glycoside Hydrolases Family Server</a><br>
<a href="http://www.cazy.org/fam/acc_GT.html" target="dispay">Glycosyltransferase Family Server</a><br>
<a href="http://www.cazy.org/fam/acc_PL.html" target="display">Polysaccharide Lyases Family Server</a>
</TD></TR>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD> </TD></TR>

<TR><TD valign=top><B>Contact:</B></TD>
<TD><a href="/servlets/Community?action=view&type=person&communityID=912146" target="display">Bernard Henrissat</a><br><a href="/servlets/Community?action=view&type=person&communityID=912144" target="display">Pedro M.Coutinho</a><br><a href="mailto:emeline@afmb.cnrs-mrs.fr">Emeline Deleury</a></TD></TR>

</TABLE>
<p>  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th>    
	    </TR>

<tr class="alt">    <TD ROWSPAN=1 valign=top><B><a href="http://www.cazy.org/fam/CE1.html">Carbohydrate Esterase Family 1</a></b></td>
	      <TD>&nbsp;</TD>
	      <TD>T32G6.5<br><a href="/servlets/TairObject?type=locus&name=At2g41530">At2g41530</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK55678.1">AAK55678.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g41530">putative esterase D</a></TD></TR>


<tr><TD ROWSPAN=59 valign=top><B><a href="http://www.cazy.org/fam/CE8.html">Carbohydrate Esterase Family 8</a></b></td>          <TD>&nbsp;</TD>
	      <TD>F4I10_150<br><a href="/servlets/TairObject?type=locus&name=AT4g33220">AT4g33220</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK55695.1">AAK55695.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33220">pectinesterase - like protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T18A20_6<br><a href="/servlets/TairObject?type=locus&name=At1g53830">At1g53830</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF02856.1">AAF02856.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53830">pectin methylesterase (PMEU1), putative</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F4L23.27<br><a href="/servlets/TairObject?type=locus&name=At2g45220">At2g45220</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK32841.1 ">AAK32841.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g45220">putative pectinesterase</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T18A20.7<br><a href="/servlets/TairObject?type=locus&name=At1g53840">At1g53840</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC50024.1">AAC50024.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53840">pectinesterase, putative</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>A_IG002P16.5</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB61046.1">AAB61046.1</a></TD>
	      <TD>&nbsp;</TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>dl4030c<br><a href="/servlets/TairObject?type=locus&name=AT4g15980">AT4g15980</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10377.1">CAB10377.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15980">pectinesterase like protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F14I3.7<br><a href="/servlets/TairObject?type=locus&name=AT1G50330">AT1G50330</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD50038.1">AAD50038.1</a></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G50330">pseudogene, putative pectinoesterase</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F14M4.14<br><a href="/servlets/TairObject?type=locus&name=At2g47030">At2g47030</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC34241.1">AAC34241.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47030">putative pectinesterase</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>F17I14_50 MTH16.23<br><a href="/servlets/TairObject?type=locus&name=AT5g09760">AT5g09760</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09534.1">BAB09534.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g09760">pectin methylesterase - like protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F17J16_60<br><a href="/servlets/TairObject?type=locus&name=AT3g59010">AT3g59010</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB86929.1">CAB86929.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g59010">pectinesterase precursor-like protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F18C1.11<br><a href="/servlets/TairObject?type=locus&name=AT3g05620">AT3g05620</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF26135.1">AAF26135.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g05620">putative pectinesterase</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F18C1.12<br><a href="/servlets/TairObject?type=locus&name=AT3g05610">AT3g05610</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF26136.1">AAF26136.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g05610">putative pectinesterase</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>F22D16.20<br><a href="/servlets/TairObject?type=locus&name=At1g02810">At1g02810</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF02886.1">AAF02886.1</a></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02810">pectinesterase family</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F27F5.7<br><a href="/servlets/TairObject?type=locus&name=At1g44980">At1g44980</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF69174.1">AAF69174.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g44980">pectin methylesterase, putative</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F2K15.80<br><a href="/servlets/TairObject?type=locus&name=AT3g49220">AT3g49220</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG40402.1">AAG40402.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g49220">pectinesterase - like protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F3E22.3<br><a href="/servlets/TairObject?type=locus&name=AT3g06830">AT3g06830</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF63815.1">AAF63815.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g06830">pectin methylesterase, putative</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>F4I10.160<br><a href="/servlets/TairObject?type=locus&name=AT4g33230">AT4g33230</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB36797.1">CAB36797.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33230">pectinesterase - like protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F6N15.23<br><a href="/servlets/TairObject?type=locus&name=AT4g00190">AT4g00190</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC19295.1">AAC19295.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g00190">putative pectinesterase</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F7K15_120<br><a href="/servlets/TairObject?type=locus&name=AT3g43270">AT3g43270</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB89048.1">CAB89048.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g43270">pectinesterase -like protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>K11J9.21<br><a href="/servlets/TairObject?type=locus&name=At5g61570">At5g61570</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09012.1">BAB09012.1</a></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g61570">putative protein</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>K14A17.13<br><a href="/servlets/TairObject?type=locus&name=At3g16970">At3g16970</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA94984.1">BAA94984.1</a></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16970">S1 self-incompatibility protein, putative </a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>K17N15.4<br><a href="/servlets/TairObject?type=locus&name=AT5g51490">AT5g51490</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB08665.1">BAB08665.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g51490">pectinesterase</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>K17N15.5<br><a href="/servlets/TairObject?type=locus&name=AT5g51500">AT5g51500</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB08666.1">BAB08666.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g51500">pectinesterase</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>K19E1.17<br><a href="/servlets/TairObject?type=locus&name=AT5g53370">AT5g53370</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK28637.1">AAK28637.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g53370">pectinesterase</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>K21P3.5<br><a href="/servlets/TairObject?type=locus&name=AT5g49180">AT5g49180</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10336.1">BAB10336.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g49180">pectin methylesterase</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>MDF20.3<br><a href="/servlets/TairObject?type=locus&name=AT5g55590">AT5g55590</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09226.1">BAB09226.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55590">putative protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>MLN21.10<br><a href="/servlets/TairObject?type=locus&name=AT3g14320">AT3g14320</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC72288.1">AAC72288.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g14320">putative zinc finger protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>MLN21.9<br><a href="/servlets/TairObject?type=locus&name=AT3g14310">AT3g14310</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01036.1">BAB01036.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g14310">putative pectin methylesterase</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>MNJ7.9<br><a href="/servlets/TairObject?type=locus&name=AT5g47500">AT5g47500</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09076.1">BAB09076.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g47500">pectin methylesterase-like</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>MUB3.16<br><a href="/servlets/TairObject?type=locus&name=AT5g64640">AT5g64640</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11431.1">BAB11431.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64640">pectin methylesterase-like protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>MUG13.18<br><a href="/servlets/TairObject?type=locus&name=AT5g04960">AT5g04960</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11518.1">BAB11518.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g04960">pectinesterase</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>MUJ8.3<br><a href="/servlets/TairObject?type=locus&name=AT3g24120">AT3g24120</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01354.1">BAB01354.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g24120">transfactor, putative</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>MXE2.4<br><a href="/servlets/TairObject?type=locus&name=AT3g29080">AT3g29080</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01985.1">BAB01985.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g29080">hypothetical protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC27719.1">AAC27719.1</a></TD>
	      <TD>&nbsp;</TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T08I13.12</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB63828.1">AAB63828.1</a></TD>
	      <TD>&nbsp;</TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T14P8.1<br><a href="/servlets/TairObject?type=locus&name=AT4g02320">AT4g02320</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC19272.1">AAC19272.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g02320">pectinesterase - like protein</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>T14P8.14<br><a href="/servlets/TairObject?type=locus&name=AT4g02330">AT4g02330</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC19280.1">AAC19280.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g02330">not found</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T17F3.3<br><a href="/servlets/TairObject?type=locus&name=At1g69940">At1g69940</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF07380.1">AAF07380.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69940">putative pectin methylesterase</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T17J13.130<br><a href="/servlets/TairObject?type=locus&name=AT3g62170">AT3g62170</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB71877.1">CAB71877.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g62170">PECTINESTERASE-like protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T20K24.17<br><a href="/servlets/TairObject?type=locus&name=At2g19150">At2g19150</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD12032.1">AAD12032.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19150">putative pectinesterase</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>T21L8.150<br><a href="/servlets/TairObject?type=locus&name=AT3g47400">AT3g47400</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB51212.1">CAB51212.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47400">pectinesterase-like protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T23J18.23<br><a href="/servlets/TairObject?type=locus&name=At1g11580">At1g11580</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF16636.1">AAF16636.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11580">pectin methylesterase, putative</a></TD></TR>	      
	      
<tr>          <TD>&nbsp;</TD>
	      <TD>T23J18.24<br><a href="/servlets/TairObject?type=locus&name=At1g11580">At1g11580</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF16637.1">AAF16637.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11580">pectin methylesterase, putative</TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T23J18.25<br><a href="/servlets/TairObject?type=locus&name=At1g11590">At1g11590</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF16638.1">AAF16638.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11590">pectin methylesterase, putative</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>T23J18.3<br><a href="/servlets/TairObject?type=locus&name=At1g11370">At1g11370</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF16649.1">AAF16649.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11370">pectin methylesterase, putative</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T24M8.6<br><a href="/servlets/TairObject?type=locus&name=AT4g03930">AT4g03930</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC28220.1">AAC28220.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g03930">putative pectinesterase</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>T26J12.4 F26F24.2<br><a href="/servlets/TairObject?type=locus&name=At1g23200">At1g23200</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC00600.1">AAC00600.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23200">putative pectinesterase</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T2H3.6<br><a href="/servlets/TairObject?type=locus&name=AT4g02300">AT4g02300</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC28174.1">AAC28174.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g02300">putative pectinesterase</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>T2I1_120<br><a href="/servlets/TairObject?type=locus&name=AT5g07410">AT5g07410</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB87930.1">CAB87930.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07410">pectin methyl-esterase-like protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T2I1_130<br><a href="/servlets/TairObject?type=locus&name=AT5g07420">AT5g07420</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB87931.1">CAB87931.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07420">pectin methyl-esterase-like protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T2I1_140<br><a href="/servlets/TairObject?type=locus&name=AT5g07430">AT5g07430</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB87932.1">CAB87932.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07430">pectin methyl-esterase-like protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T30B22.15<br><a href="/servlets/TairObject?type=locus&name=At2g47550">At2g47550</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC62855.1">AAC62855.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47550">putative pectinesterase</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>T4C21_140<br><a href="/servlets/TairObject?type=locus&name=AT3g60730">AT3g60730</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB82677.1">CAB82677.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g60730">pectinesterase - like protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T7M13.20<br><a href="/servlets/TairObject?type=locus&name=AT3g10720">AT3g10720</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF19577.1">AAF19577.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g10720">putative pectinesterase</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T7M13.21<br><a href="/servlets/TairObject?type=locus&name=AT3g10710">AT3g10710</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF19578.1">AAF19578.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g10710">putative pectinesterase</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>T9J22.11<br><a href="/servlets/TairObject?type=locus&name=At2g26440">At2g26440</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC14493.1">AAC14493.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26440">putative pectinesterase</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>T9J22.12 (fragment)<br><a href="/servlets/TairObject?type=locus&name=At2g26450">At2g26450</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC14494.1">AAC14494.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26450">putative pectinesterase</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>YUP8H12.7<br><a href="/servlets/TairObject?type=locus&name=At1g05310">At1g05310</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB71446.1">AAB71446.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05310">putative pectin methylesterase</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F14M4.13<br><a href="/servlets/TairObject?type=locus&name=At2g47040">At2g47040</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC34240.1">AAC34240.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47040">putative pectinesterase</a></TD></TR>

<tr class="alt"><TD ROWSPAN=18 valign=top><B><a href="http://www.cazy.org/fam/CE10.html">Carbohydrate Esterase Family 10</a></b></td>          <TD>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA97248.1">BAA97248.1</a></TD>
	      <TD>&nbsp;</TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA97182.1">BAA97182.1</a></TD>
	      <TD>&nbsp;</TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG13051.1">AAG13051.1</a></TD>
	      <TD>&nbsp;</TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F14F8_240<br><a href="/servlets/TairObject?type=locus&name=AT5g15860">AT5g15860</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01785.1">CAC01785.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g15860">Carboxylesterase-like protein</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F14J22.11<br><a href="/servlets/TairObject?type=locus&name=At1g49660">At1g49660</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG13052.1">AAG13052.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g49660">unknown protein</a></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F14J22.12<br><a href="/servlets/TairObject?type=locus&name=At1g49640">At1g49640</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG13050.1">AAG13050.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g49640">hypothetical protein</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F16B3.4<br><a href="/servlets/TairObject?type=locus&name=AT3g02410">AT3g02410</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF32448.1">AAF32448.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g02410">hypothetical protein</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F18O22_100<br><a href="/servlets/TairObject?type=locus&name=AT5g14310">AT5g14310</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB87770.1">CAB87770.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g14310">putative protein</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F1N13_220<br><a href="/servlets/TairObject?type=locus&name=AT5g16080">AT5g16080</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK44142.1">AAK44142.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g16080">putative protein</a></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F24J5.14<br><a href="/servlets/TairObject?type=locus&name=At1g68620">At1g68620</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD49980.1">AAD49980.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68620">unknown protein</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F28B23.20 or F14G11.9<br><a href="/servlets/TairObject?type=locus&name=At1g26120">At1g26120</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG29204.1">AAG29204.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26120">hypothetical protein</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>K17E12.14<br><a href="/servlets/TairObject?type=locus&name=AT3g27320">AT3g27320</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02127.1">BAB02127.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g27320">esterase, putative</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T12H1.8<br><a href="/servlets/TairObject?type=locus&name=AT3g05120">AT3g05120</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF27018.1">AAF27018.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g05120">unknown protein</a></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T20O10_110<br><a href="/servlets/TairObject?type=locus&name=AT3g63010">AT3g63010</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB87746.1">CAB87746.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g63010">putative protein</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T29M8.6<br><a href="/servlets/TairObject?type=locus&name=At1g19190">At1g19190</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF82230.1">AAF82230.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19190">hypothetical protein</a></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T30G6.2<br><a href="/servlets/TairObject?type=locus&name=AT5g36210">AT5g36210</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09360.1">BAB09360.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g36210">acyl-peptide hydrolase-like</a></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T8P19.200<br><a href="/servlets/TairObject?type=locus&name=AT3g48690">AT3g48690</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB62358.1">CAB62358.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g48690">putative protein</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T8P19.210<br><a href="/servlets/TairObject?type=locus&name=AT3g48700">AT3g48700</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB62359.1">CAB62359.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g48700">putative protein</a></TD></TR>

<tr> <TD ROWSPAN=7 valign=top><B><a href="http://www.cazy.org/fam/CE11.html">Carbohydrate Esterase Family 11</a></b></td>        <TD>&nbsp;</TD>
	      <TD>F4F7.1<br><a href="/servlets/TairObject?type=locus&name=At1g25160">At1g25160</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG28819.1">AAG28819.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g25160">unknown protein</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F4F7.4</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG28806.1">AAG28806.1</a></TD>
	      <TD>&nbsp;</TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>F4F7.6</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG28811.1">AAG28811.1</a></TD>
	      <TD>&nbsp;</TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F5A9.14<br><a href="/servlets/TairObject?type=locus&name=AT1G24880">AT1G24880</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG03126.1">AAG03126.1</a></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G24880">F5A9.14</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F5A9.18 or F4F7.43<br><a href="/servlets/TairObject?type=locus&name=At1g24793">At1g24793</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG03124.1">AAG03124.1</a></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24793">F5A9.18</a></TD></TR>

<tr>          <TD>&nbsp;</TD>
	      <TD>F5A9.4<br><a href="/servlets/TairObject?type=locus&name=AT1G25141">AT1G25141</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG03130.1">AAG03130.1</a></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g25141">unknown protein</a></TD></TR>


<tr>          <TD>&nbsp;</TD>
	      <TD>F5A9.8<br><a href="/servlets/TairObject?type=locus&name=At1g25054">At1g25054</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG03128.1">AAG03128.1</a></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g25054">F5A9.8</a></TD></TR>

<tr class="alt"><TD ROWSPAN=13 valign=top><B><a href="http://www.cazy.org/fam/CE13.html">Carbohydrate Esterase Family 13</a></b></td>          <TD>&nbsp;</TD>
	      <TD>F14M4.24<br><a href="/servlets/TairObject?type=locus&name=At2g46930">At2g46930</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC34238.1">AAC34238.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46930">putative pectinesterase</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T5K18_190<br><a href="/servlets/TairObject?type=locus&name=AT4g19410">AT4g19410</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA18628.1">CAA18628.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19410">putative pectinacetylesterase protein</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T5K18_200<br><a href="/servlets/TairObject?type=locus&name=AT4g19420">AT4g19420</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA18629.1">CAA18629.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19420">putative pectinacetylesterase</a></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F10A16.21<br><a href="/servlets/TairObject?type=locus&name=AT3g05910">AT3g05910</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF26093.1">AAF26093.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g05910">putative pectinacetylesterase</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F14J9.21<br><a href="/servlets/TairObject?type=locus&name=At1g09550">At1g09550</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC33215.1">AAC33215.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09550">putative pectinacetylesterase precursor</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F21E10.11<br><a href="/servlets/TairObject?type=locus&name=AT5g26670">AT5g26670</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC13595.1">AAC13595.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g26670">pectin acetylesterase precursor - like protein</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F2O10.13<br><a href="/servlets/TairObject?type=locus&name=At3g05910">At3g05910</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF23225.1">AAF23225.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05910">pectinacetylesterase, putative</a></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F3L24.30<br><a href="/servlets/TairObject?type=locus&name=AT3g09410">AT3g09410</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF14046.1">AAF14046.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g09410">putative pectinacetylesterase</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F3L24.31<br><a href="/servlets/TairObject?type=locus&name=AT3g09420">AT3g09420</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF14036.1">AAF14036.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g09420">putative pectinacetylesterase</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>K9E15.6<br><a href="/servlets/TairObject?type=locus&name=AT5g45280">AT5g45280</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10249.1">BAB10249.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g45280">pectin acetylesterase</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MRO11.9<br><a href="/servlets/TairObject?type=locus&name=AT5g23870">AT5g23870</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10060.1">BAB10060.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g23870">pectinacetylesterase</a></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T17J13.20<br><a href="/servlets/TairObject?type=locus&name=AT3g62060">AT3g62060</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB71866.1">CAB71866.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g62060">pectinacetylesterase precursor-like protein</a></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T8L23.6<br><a href="/servlets/TairObject?type=locus&name=At1g57590">At1g57590</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG12120.1">AAG12120.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g57590">pectinacetylesterase precursor, putative</a></TD></TR>



	      

</table>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
