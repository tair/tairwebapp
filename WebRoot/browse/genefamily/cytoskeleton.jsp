<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Cytoskeleton Gene Family";
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
 
<A NAME="Cytoskeleton"><h2><i>Arabidopsis</i> Cytoskeleton Gene Family</h2></A>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD>
<TD><A HREF="http://www.genetics.uga.edu/RBMSite/Abstracts.html">Meagher Lab website</A></TD></TR>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD> </TD></TR>

<TR><TD><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=4626" target="display">Prof. Richard Meagher</a></TD></TR>

</TABLE>
    <p>



 
<table border="1" cellpadding="0" cellspacing="0" width="660">

    
        
<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
        <th><b>TIGR Annotation:</B></th></TR>

<tr class="alt">
        <TD ROWSPAN= 10 valign=top><B>Actin</B></TD>
        <TD>ACT1</TD>
	<TD>F13M22.12<BR>At2g37620</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1145693">AAA98561</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37620">actin 3</A></TD></TR>

<tr class="alt">    <TD>ACT3</TD>
	<TD>F5K20_50<BR>AT3g53750</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1145695">AAA98562</A></TD>
         <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g53750">actin (ACT3)</A></TD></TR>

<tr class="alt">    <TD>ACT4</TD>
	<TD>F2O15.3<br>At5g59370</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=nucleotide&cmd=search&term=U27980&doptcmdl=genbank">U27980</A></TD>
        <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59370">actin 4 </A></TD></TR>
	
<tr class="alt">    <TD>ACT12</TD>
	<TD>F12A12.40<BR>AT3g46520</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=nucleotide&cmd=search&term=U27982&doptcmdl=genbank">U27982</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g46520">actin 12</A></TD></TR>

<tr class="alt">    <TD>ACT11</TD>
	<TD>T21B14.7<br>At3g12110</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=nucleotide&cmd=search&term=U27981&doptcmdl=genbank">U27981</A></TD>
        <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g12110">actin 11 (ACT11)</a></TD></TR>

<tr class="alt">    <TD>ACT2</TD>
	<TD>MVE11.21<BR>AT3g18780</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=nucleotide&cmd=search&term=U41998&doptcmdl=genbank">U41998</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g18780">actin 2/actin 8 (ACT2/ACT8)</A></TD></TR>

<tr class="alt">    <TD>ACT8</TD>
	<TD>F27J15.1<BR>At1g49240</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=nucleotide&cmd=search&term=U42007&doptcmdl=genbank">U42007</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g49240">actin 8</A></TD></TR>

<tr class="alt">    <TD>ACT7</TD>
	<TD>MYH9_2<BR>AT5g09810</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=nucleotide&cmd=search&term=U27811&doptcmdl=genbank">U27811</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g09810">ACTIN 2/7 (sp|P53492) </A></TD></TR>

<tr class="alt">    <TD>ACT5</TD>
	<TD>&nbsp;</TD>
	<TD>&nbsp;</TD>
        <TD>&nbsp;</TD></TR>

<tr class="alt">    <TD>ACT9</TD>
	<TD>&nbsp;</TD>
	<TD>&nbsp;</TD>
        <TD>&nbsp;</TD></TR>	

<TR>	<TD ROWSPAN=5 valign=top><B>Profilin</B></TD>
        <TD>PRF1</TD>
        <TD>F6F22.21<br>AT2G19760</TD>
	<TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?save=0&cmd=search&val=U43590">U43590</A></TD>
        <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G19760">profilin 1 </A></TD></TR>

<TR>	<TD>PRF2</TD>
        <TD>F17A13.170<br>AT4G29350</TD>
	<TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?save=0&cmd=search&val=U43591">U43591</A></TD>
        <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G29350">profilin 2 </A></TD></TR>

<TR>	<TD>PRF3</TD>
        <TD>MKN22.11<br>AT5G56600</TD>
	<TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?save=0&cmd=search&val=U43592">U43592</A></TD>
        <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G56600">profilin-like protein</A></TD></TR>

<TR>	<TD>PRF4</TD>
        <TD>F17A13.160<br>At4g29340</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Nucleotide&list_uids=9965576&dopt=GenBank">U43594</A></TD>
        <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g29340">profilin 3</A></TD></TR>

<TR>	<TD>PRF5</TD>
        <TD>&nbsp;</TD>
	<TD>&nbsp;</TD>
        <TD>&nbsp;</TD></TR>

</TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
