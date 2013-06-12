<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Trehalose Biosynthesis Genes";
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
 
<A NAME="AtTPS"><h2>Trehalose Biosynthesis Genes (AtTPS)</h2></A><BR>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD>
<TD><b>Leyman, B., Van Dijck, P., Thevelein, J. M.</b> (2001) <a href="/servlets/TairObject?type=publication&id=1546048" target=new>An unexpected plethora of trehalose biosynthesis genes in Arabidopsis thaliana.</A> TRENDS IN PLANT SCIENCE <b>6: 510</b> </TD></TR>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD>please see the article above for more details </TD></TR>

<TR><TD><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=1325" target="display">Barbara Leyman</TD></TR>

</TABLE>

    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</B></TH></TR>	    


<tr class="alt"> <TD ROWSPAN=4 valign=top><B>Class I AtTPS</B></TD>   <TD>AtTPS1</TD>
	<TD>T30F21.9<BR>At1g78580</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=4581084&dopt=GenBank">AC007260</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78580">trehalose-6-phosphate synthase, putative</A></TD></TR>

<tr class="alt">    <TD>AtTPS2</TD>
	<TD>F6I1.1<BR>At1g16980</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=8576188&dopt=GenBank">AC051629.3</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16980">trehalose-6-phosphate synthase, putative</A></TD></TR>


<tr class="alt">    <TD>AtTPS3</TD>
	<TD>F20D23.30<BR>At1g17000</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=5103850&dopt=GenBank">AC007651</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17000">trehalose-6-phosphate synthase, putative</A></TD></TR>

<tr class="alt">    <TD>AtTPS4</TD>
	<TD>T29A15.40<BR>At4g27550</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=7269590&dopt=GenBank">AL161571</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g27550">trehalose-6-phosphate synthase - like protein</A></TD></TR>

<TR>    <TD ROWSPAN=7 valign=top><B>Class II AtTPS</B></TD><TD>AtTPS5</TD>
	<TD>dl4920w<BR>At4g17770</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=7488400&dopt=GenPept">H71447</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g17770">trehalose-6-phosphate synthase like protein</A></TD></TR>

<TR>    <TD>AtTPS6</TD>
	<TD>T23K23.13<BR>At1g68020</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=12324062&dopt=GenBank">AC012563</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68020">putative trehalose-6-phosphate synthase</A></TD></TR>

<TR>    <TD>AtTPS7</TD>
	<TD>T2D23.11<BR>At1g06410</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=12039259&dopt=GenBank">AC068143</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06410">trehalose-6-phosphate synthase, putative </A></TD></TR>

<TR>    <TD>AtTPS8</TD>
	<TD>F1707.18<BR>At1g70290</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=2833627&dopt=GenBank">AC003671</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70290">trehalose-6-phosphate synthase, putative</A></TD></TR>

<TR>    <TD>AtTPS9</TD>
	<TD>T23E23.3<BR>At1g23870</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=9369387&dopt=GenBank">AC002423</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23870">trehalose 6-phosphate synthase, putative</A></TD></TR>

<TR>    <TD>AtTPS10</TD>
	<TD>T13D8.4<BR>At1g60140</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=3108025&dopt=GenBank">AC004473.1</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60140">trehalose-6-phosphate synthase, putative </A></TD></TR>

<TR>    <TD>AtTPS11</TD>
	<TD>MSF3.8<BR>At2g18700</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=6598484&dopt=GenBank">AC005724</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18700">putative trehalose-6-phosphate synthase</A></TD></TR>	



<TR  bgcolor=
D5D9DD><TD ROWSPAN=1 valign=top><B>Trehalase</B></TD>    <TD>AtTRE1</TD>
<TD>T19F6.30<br>At4g24040</td>
<TD>T13444</TD>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g24040">trehalase - like protein</A></TD></TR>

	
	</TABLE>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
