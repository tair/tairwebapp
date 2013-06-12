<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "14-3-3 family";
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
 

<A NAME="14-3-3"><h2><b><i>Arabidopsis thaliana</i> 14-3-3 protein gene family</B></A></h2>


<TABLE><TR>

<TD valign=top><B>Source:</B></TD> 
<TD><li> Website: <A HREF="http://www.hos.ufl.edu/ferllab/14-3-3's/index.htm">14-3-3 Proteins</A><br>
<li><b>Sehnke, P.C., Chung, H.J., Wu, K., Ferl, R. J.</b> (2001) <a href="/servlets/TairObject?type=publication&id=501680314">Regulation of starch accumulation by granule-associated plant 14-3-3 proteins.</A> <i>PNAS</i> <b>98: 765-770</b><br>
<li><b>DeLille, J. M., Sehnke, P. C., Ferl, R. J. </b> (2001) <a href="/servlets/TairObject?type=publication&id=501680478">The arabidopsis 14-3-3 family of signaling regulators.</A> <i>PLANT PHYSIOLOGY</i> <b>126: 35-38</b> <br>
<li><b>Rosenquist, M., Sehnke, P., Ferl, R. J., Sommarin, M., Larsson, C. </b> (2000) <a href="/servlets/TairObject?type=publication&id=5878">Evolution of the 14-3-3 Protein Family: Does the Large Number of Isoforms in Multicellular Organisms Reflect Functional Specificity?.</A> <i>JOURNAL OF MOLECULAR EVOLUTION</i> <b>51: 446-458</b> <br>
<li><b>Wu, K., Rooney, M. F., Ferl, R. J. </b> (1997) <a href="/servlets/TairObject?type=publication&id=3126">The Arabidopsis 14-3-3 multigene family.</A> <i>PLANT PHYSIOLOGY</i> <b>114: 1421-1431</b> <br>

</TD></TR>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD>&nbsp;</TD></TR>

<TR><TD><B>Contact:</B></TD>
<TD><a href="/servlets/Community?action=view&type=organization&communityID=8075">R Ferl Laboratory</A></TD></TR>

</TABLE> 

  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Gene Name:</b></th>
        <TH>Protein Name:</th>
	<th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th>    
	    </TR>
	    

<tr class="alt">    <TD ROWSPAN=13 valign=top><B>14-3-3 proteins</B></TD>
	<TD>GRF1</td><td>Chi</TD>
	<TD>F23J3.30<BR><A href="/servlets/TairObject?type=locus&name=At4g09000">At4g09000</A></TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=1256533&dopt=GenBank">L09112</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g09000">14-3-3 protein GF14chi (grf1)</A></TD></TR>

<tr class="alt">	<TD>GRF2</td><td>Omega</TD>
	<TD>F3F9.16<BR><A href="/servlets/TairObject?type=locus&name=At1g78300">At1g78300</A></TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=553039&dopt=GenBank">M96855</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78300">14-3-3 protein GF14omega (grf2)</A></TD></TR>

<tr class="alt">	<TD>GRF3</td><td>Psi</TD>
	<TD>MXI10.21<BR><A href="/servlets/TairObject?type=locus&name=At5g38480">At5g38480</A></TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=166716&dopt=GenBank">L09110</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g38480">14-3-3 protein GF14psi (grf3/RCI1)</A></TD></TR>



<tr class="alt">	<TD>GRF4</td><td>Phi</TD>
	<TD>T32G9.30<BR><A href="/servlets/TairObject?type=locus&name=At1g35160">At1g35160</A></TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=1493804&dopt=GenBank">L09111</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g35160">14-3-3 protein GF14phi (grf4)</A></TD></TR>

<tr class="alt">	<TD>GRF5</td>
        <td>Upsilon</TD>
	<TD>F1N13.190<BR><A href="/servlets/TairObject?type=locus&name=At5g16050">At5g16050</A></TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=1508784&dopt=GenBank">L09109</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g16050">14-3-3 protein GF14upsilon (grf5)</A></TD></TR>


<tr class="alt">	<Td>GRF6</td>
        <td>Lambda</TD>
	<TD>F12B17.200<BR><A href="/servlets/TairObject?type=locus&name=At5g10450">At5g10450</A></TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=1549403&dopt=GenBank">U68545</A></td>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g10450">14-3-3 protein GF14lambda (grf6/AFT1) </A></TD></TR>


<tr class="alt">	
        <TD>GRF7</td>
	<td>Nu</TD>
	<TD>F16B3.15<BR><A href="/servlets/TairObject?type=locus&name=At3g02520">At3g02520</A></TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=1872468&dopt=GenBank">U60445</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02520">14-3-3 protein GF14nu (grf7)</A></TD></TR>





<tr class="alt">	<TD>GRF8</td>
        <td>Kappa</TD>
	<TD>MNA5.16<BR><A href="/servlets/TairObject?type=locus&name=At5g65430">At5g65430</A></TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=5705907&dopt=GenBank">U36447</A></td>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65430">14-3-3 protein GF14kappa (grf8)</A></TD></TR>



<tr class="alt">	<TD>GRF9</td>
        <td>Mu</TD>
	<TD>F14N22.14<BR><A href="/servlets/TairObject?type=locus&name=At2g42590">At2g42590</A></TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=5705923&dopt=GenBank">U60444</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42590">14-3-3 protein GF14mu (grf9)</A></TD></TR>


<tr class="alt">	<TD>GRF10</td>
	<td>Epsilon</TD>
	<TD>T16E15.8<BR><A href="/servlets/TairObject?type=locus&name=At1g22300">At1g22300</A></TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=1022777&dopt=GenBank">U36446</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22300">14-3-3 protein GF14epsilon (grf10) </A></TD></TR>


<tr class="alt">	<TD>GRF11</td><td>Omicron</TD>
	<TD>F21H2.3<BR><A href="/servlets/TairObject?type=locus&name=At1g34760">At1g34760</A></TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12044388&dopt=GenBank">AF323920</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34760">14-3-3 protein GF14omicron (grf11)</A></TD></TR>

<tr class="alt">	<TD>GRF12</td><td>Iota</TD>
	<TD>T1K7.15<BR><A href="/servlets/TairObject?type=locus&name=At1g26480">At1g26480</A></TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=12963452&dopt=GenBank">AF335544</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26480">14-3-3 protein GF14iota (grf12)</A></TD></TR>

<tr class="alt"> <TD>GRF13</TD>	<TD>Pi</TD>
	<TD>T11I11.16<br><a href="/servlets/TairObject?type=locus&name=At1g78220">At1g78220</A></TD>    
	<TD>&nbsp;</TD>
      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78220">14-3-3 protein (grf13), putative</A></TD></TR>

</TABLE>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
