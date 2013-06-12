<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Gene Families from Pollen Coat Proteome";
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
 
<h2><b>Gene Families from the <i>Arabidopsis thaliana</i> Pollen Coat Proteome</B></h2>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD> <TD> Mayfield, J. A., Fiebig, A., Johnstone, S. E., Preuss, D. (2001) <A HREF="/servlets/TairObject?type=publication&id=501680645" target="display"> Gene families from the <i>Arabidopsis thaliana</i> pollen coat proteome.</A> <i>Science</i>, <b>292</b>, 2482 . </td></tr>

<tr><td valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>experimental</td></tr>

<TR><TD><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=7632" target="display">Jacob A. Mayfield</A>, <a href="/servlets/Community?action=view&type=person&communityID=7372" target="display">Aretha Fiebig</a>, Sarah E. Johnstone, <A href="/servlets/Community?action=view&type=person&communityID=4587" target="display">Daphne Preuss</A>.
</table>

  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<TH><B>TIGR Annotation:</B></TH></TR>
	    

<tr class="alt">    <TD ROWSPAN=6 valign=top><B>Pollen Coat Proteome;<br> Lipid-binding oleosins</B></TD>
        <TD>AtGRP20</TD>
	<TD>&nbsp;</TD>
	<TD>&nbsp;</TD>
      <TD>&nbsp;</td></tr>


<tr class="alt"><TD>AtGRP19</TD>
<TD>T2I1.260<BR>At5g07550</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB87944&doptcmdl=GenPept">CAB87944.1</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07550">glycine-rich protein PUTG1 </a></TD></TR>

<tr class="alt"><TD>AtGRP16</TD>
<TD>T2I1.250<BR>At5g07540</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB87943&doptcmdl=GenPept">CAB87943.1</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07540">glycine-rich protein atGRP-6 </a></TD></TR>

<tr class="alt"><TD>AtGRP17</TD>
<TD>T2I1.240<BR>At5g07530</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB87942&doptcmdl=GenPept">CAB87942.1</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07530">glycine-rich protein atGRP-7 </a></TD></TR>

<tr class="alt"><TD>AtGRP18</TD>
<TD>T2I1.230<BR>At5g07520</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB87941&doptcmdl=GenPept">CAB87941.1</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07520">glycine-rich protein atGRP </a></TD></TR>

<tr class="alt"><TD>AtGRP14</TD>
<TD>T2I1.220<BR>At5g07510</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB87940&doptcmdl=GenPept">CAB87940.1</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07510"> glycine-rich protein </a></TD></TR>

<TR> <td ROWSPAN=2 valign=top><B>Pollen Coat Proteome;<br>Lipase proteins</B></td>
<td>EXL4</td> 
<TD>T4O12.250<BR>At1g75910</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=15054387&dopt=GenBank">AY028612</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75910">anter-specific proline-rich -like protein (APG-like)</a></TD></TR>

<TR>
<td>EXL6</td> 
<TD>T4O12.260<BR>At1g75930</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=nucleotide&list_uids=15054389&dopt=GenBank">AY028614</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75930">anter-specific proline-rich -like protein (APG-like) </a></TD></TR>

<tr class="alt"><td ROWSPAN=2 valign=top><B>Pollen Coat Proteome</b></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<TD>BAB01369</TD>
<TD>&nbsp;</TD></TR>

<tr class="alt">
<td>&nbsp;</td>
<td>F21C20.20<br>At4g20670</td>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=5262207&dopt=GenPept">CAB45833.1</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g20670">putative protein</a></TD></TR>

<TR>
<td ROWSPAN=1 valign=top><b>Pollen Coat Proteome;<br>EF-hand Ca2+ binding protein</B></td>  
<td>EF-hand</td>
<td>F26F24.33<br>At1g23240</td>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=9295714&dopt=GenPept">AAF87020.1</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23240">conserved hypothetical protein protein</a></TD></TR>

</TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
