<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR- calcineurin B-like calcium sensor proteins Gene Family";
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
<h2><A NAME=""><B><i>Arabidopsis</i> calcineurin B-like calcium sensor proteins (AtCBLs)</B></A><h2>

<TABLE>
<TR><TD valign=top><B>Source:</B></TD> 
<TD>Luan S, Kudla J, Rodriguez-Concepcion M, Yalovsky S, Gruissem W. (2002) <A HREF="/servlets/TairObject?type=publication&id=501711220" target="display">Calmodulins and calcineurin B-like proteins: calcium sensors for specific signal response coupling in plants.</A> Plant Cell. 14: 389-400.
<br>The Arabidopsis Functional Genomics Network <A HREF="http://www.bio.uni-frankfurt.de/botanik/mcb/AFGN/kudla.html" target="display">Functional analysis of a calcium sensor protein/serine-threonine kinase signalling network</A></td></tr>
<TR><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD><li>all CBLs contain 3 EF-hand-motives mediating calcium binding<br>
<li>calcium binding has been experimentally (in vitro) confirmed for several CBLs<br><li>their overall sequence homology is always higher to calcineurin and
frequenin from mammals than to any other calcium binding protein, like for
example calmodulin</td></tr>

<tr><td><b>Contact:</b></TD><td><A HREF="/servlets/Community?action=view&type=person&communityID=6945" target="display">Dr. J&ouml;rg Kudla</A></TD></TR></table>
   

    <p>

    
    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="0">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th> 
	    </TR>
	    

<tr class="alt">    <TD ROWSPAN=10 valign="top"><B>AtCBLs</B></TD>
<td>AtCBL1</td>
<td>FCAALL.122<br>At4g17615</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=3309082&dopt=GenPept" target="display">AAC26008</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g17615" target="display">calcineurin B-like protein 1 </A></td>
    </tr>


<tr class="alt">
<TD>AtCBL2 </TD>
<td>MDA7.3<br>At5g55990 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=3309084&dopt=GenPept" target="display">AAC26009</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g55990" target="display">calcineurin B-like protein 2 (gb AAC26009.1) </A></td>
    </tr>

<tr class="alt">
<TD>AtCBL3 </TD>
<td>T15N24.20<br>At4g26570 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=3309086&dopt=GenPept" target="display">AAC26010 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g26570" target="display">calcineurin B-like protein 3 </A></td>
    </tr>

<tr class="alt">
<TD>AtCBL4</TD>
<td>MOP9.19<br>At5g24270</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=11065947&dopt=GenPept" target="display">AAG28402</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g24270" target="display">calcium sensor homolog (gb|AAC26110.1) </A></td>
    </tr>

<tr class="alt">
<TD>AtCBL5 </TD>
<td>F3D13.2<br>At4g01420 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=7267639&dopt=GenPept" target="display">CAB80951 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g01420" target="display">putative calcium-regulated protein phosphatase </A></td>
    </tr>        

<tr class="alt">
<TD>AtCBL6</TD>
<td>dl4205c<br>At4g16350</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=11065943&dopt=GenPept" target="display">AAG28400</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g16350" target="display">hypothetical protein </A></td>
    </tr>

<tr class="alt">
<TD>AtCBL7 </TD>
<td>M3E9.10<br>At4g26560 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=9965364&dopt=GenPept" target="display">AAG10059 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g26560" target="display">putative calcineurin B-like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtCBL8 </TD>
<td>F1N19.5<br>At1g64480</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=15866276&dopt=GenPept" target="display">AAL10300 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64480" target="display">calcineurin B-like protein </A></td>
    </tr>

<tr class="alt">
<TD>AtCBL9 </TD>
<td>K14A3.5<br>At5g47100 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=15866279&dopt=GenPept" target="display">AAL10301</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g47100" target="display">calcium sensor protein, calcineurin-like </A></td>
    </tr>

<tr class="alt">
<TD>AtCBL10 </TD>
<td>in progress</td>
<td>in progress</td>
<td>&nbsp;</td>
    </tr>

</table>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>
  <BR>



<P><br><br><br>
<p>
<h2><A NAME="CIPK"><B><i>Arabidopsis</i> CBL-interacting serine-threonine 
protein kinases (AtCIPKs)</B></A><BR></h2>


<TABLE><TR>

<TD valign=top><B>Source:</B></TD> <TD>Luan S, Kudla J, Rodriguez-Concepcion M, Yalovsky S, Gruissem W. (2002) <A HREF="/servlets/TairObject?type=publication&id=501711220" target="display">Calmodulins and calcineurin B-like proteins: calcium sensors for specific signal response coupling in plants.</A> Plant Cell. 14: 389-400.
<br>The Arabidopsis Functional Genomics Network <A HREF="http://www.bio.uni-frankfurt.de/botanik/mcb/AFGN/kudla.html" target="display">Functional analysis of a calcium sensor protein/serine-threonine kinase signalling network</A></td></tr>
<TR><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD><li>all harbor the NAF domain. This 24 amino acid domain is
specific for these kinases and defines this group (and mediates the
interaction with the CBLs)<br>
<li>all CIPKs have been experimentally tested for interaction with CBLs (in
J. Kudla lab)<br>
<li>the serine-threonine kinase activity has (in vitro) been verified for
several representative CIPKs<br>
<li>all CIPKs share the same domain structure: N-terminal kinase domain,
central NAF domain, C-terminal domain (with potentially auto-inhibitory
function)</td></tr>

<tr><td><b>Contact:</b></TD><td><A HREF="/servlets/Community?action=view&type=person&communityID=6945" target="display">Dr. J&ouml;rg Kudla</A></TD></TR></table>
   

    <p>

    
    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="0">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th> 
	    </TR>


<tr class="alt"><TD ROWSPAN=25 valign="top"><B>AtCIPKs</B></TD>
<TD>AtCIPK1</TD>
<td>MKP6.20<br>At3g17510 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=11066952&dopt=GenPept" target="display">AAG28776</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g17510" target="display" >unknown protein</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK2 </TD>
<td>T28J14.10<br>At5g07070 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=9280636&dopt=GenPept" target="display">AAF86506 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07070" target="display">serine threonine protein kinase-like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK3</TD>
<td>T20P8.3<br>At2g26980 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=9280638&dopt=GenPept" target="display">AAF86507 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26980" target="display">putative protein kinase</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK4</TD>
<td>dl3330c<br>At4g14580 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=13249503&dopt=GenPept" target="display">AAG01367 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g14580" target="display">SNF1 like protein kinase </A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK5</TD>
<td>T30N20.200<br>At5g10930 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=9280632&dopt=GenPept" target="display">AAF86504 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g10930" target="display">serine/threonine protein kinase -like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK6</TD>
<td>F6I18.130<br>At4g30960 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=9280634&dopt=GenPept" target="display">AAF86505 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g30960" target="display">putative protein kinase</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK7</TD>
<td>MXC7.3<br>At3g23000 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=13249113&dopt=GenPept" target="display">AAK16682 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g23000" target="display">SNF1 related protein kinase (ATSRPK1)</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK8</TD>
<td>T22A6.230<br>At4g24400 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=13249115&dopt=GenPept" target="display">AAK16683 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g24400" target="display">serine/threonine kinase-like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK9</TD>
<td>T25K16.13<br>At1g01140</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=13249117&dopt=GenPept"target="display" >AAK16684 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01140" target="display">serine/threonine kinase, putative</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK10</TD>
<td>MCK7.25<br>At5g58380 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=13249119&dopt=GenPept" target="display">AAK16685 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58380" target="display">serine/threonine protein kinase</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK11</TD>
<td>T9D9.17<br>At2g30360 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=13249121&dopt=GenPept" target="display">AAK16686 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30360" target="display">putative protein kinase</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK12</TD>
<td>F28A21.110<br>At4g18700</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=13249123&dopt=GenPept" target="display">AAK16687 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18700" target="display">putative protein kinase</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK13</TD>
<td>F13P17.2<br>At2g34180 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=13249125&dopt=GenPept" target="display">AAK16688 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34180" target="display">putative protein kinase</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK14</TD>
<td>T20L15.90<br>At5g01820 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=13249127&dopt=GenPept" target="display" >AAK16689</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g01820" target="display">putative protein </A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK15</TD>
<td>T20L15.80<br>At5g01810 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=13249134&dopt=GenPept" target="display" >AAK16692 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g01810" target="display" >serine/threonine protein kinase ATPK10 </A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK16</TD>
<td>F13D4.161<br>At2g25090</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=14009298&dopt=GenPept" target="display">AAK50348</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25090" target="display">putative protein kinase </A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK17</TD>
<td>F11A17.18<br>At1g48260 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=14571553&dopt=GenPept" target="display">AAK64513 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48260" target="display">serine threonine kinase, putative</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK18</TD>
<td>F28N24.9<br>At1g29230 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=14334388&dopt=GenPept" target="display" >AAK59695</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29230" target="display">protein kinase PK4, putative </A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK19</TD>
<td> K15I22.1<br>At5g45810 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=14009296&dopt=GenPept" target="display">AAK50347 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g45810" target="display">serine threonine protein kinase</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK20</TD>
<td>K15I22.2<br>At5g45820 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=14486384&dopt=GenPept" target="display">AAK61493 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g45820" target="display">serine threonine protein kinase </A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK21</TD>
<td>MUA2.22<br>At5g57630 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=14334390&dopt=GenPept" target="display">AAK59696</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g57630" target="display" >SNF1 related protein kinase-like protein</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK22</TD>
<td>T6A23.31<br>At2g38490 </td>
<td>AF450478</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38490" target="display"> putative protein kinase </A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK23</TD>
<td>F12P21.6<br>At1g30270</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=14486386&dopt=GenPept" target="display">AAK61494 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30270" target="display">serine/threonine kinase, putative</A></td>
    </tr>

 <tr class="alt">
<TD>AtCIPK24</TD>
<td>K21B8.3<br>At5g35410 </td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=14701910&dopt=GenPept" target="display">AAK72257 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g35410" target="display">serine/threonine protein kinase SOS2 (gb|AAF62923.1)</A></td>
    </tr>

<tr class="alt">
<TD>AtCIPK25</TD>
<td>T11H3.120<br>At5g25110</td>
<td>AF44226</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g25110" target="display"> serine/threonine protein kinase-like protein </A></td>
    </tr>


</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
