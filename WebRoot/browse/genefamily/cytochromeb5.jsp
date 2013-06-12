<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Cytochrome b5 & NADPH P450 Reductases Gene Families";
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

<A NAME="cytochromeb5"><h2><i>Arabidopsis</i> cytochrome b5</h2></A>

<P>

	<TABLE  border="0" cellspacing="0" cellpadding="2">
<tr><td valign=top><b>Source:</B></td>  <TD><A HREF="http://www.biobase.dk/p450">The Arabidopsis P450, cytochrome b5, P450 reductase, and Glycosyltransferase Family 1 Site at PlaCe </A></td></tr>
<tr><td><b>Contact:</b></TD><td><A HREF="/servlets/Community?action=view&type=person&communityID=958" target="display">Dr. Soren Bak</A></TD></TR></table>
   

    <p>

    
    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="0">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th> 
	    </TR>
	    

<tr class="alt">    <TD ROWSPAN=6 valign="top"><B>Cytochrome b5</B></TD>
<td>b5 
1</td>
<td>T3A4.3<br>At2g46650</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3831439">AAC69922 </td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46650">putative cytochrome b5</A></td>
    </tr>

<tr class="alt">
<td>b5 
2</td>
<td>MNC6.10<BR>At5g53560</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4240120">BAA74839</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g53560">cytochrome b5 (dbj|BAA74839.1) </A></td>
    </tr>
<tr class="alt">
<td>b5 
3</td>
<td>K24G6.14<BR>At5g48810</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4240122">BAA74840</A> </td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g48810">cytochrome b5 (dbj|BAA74840.1) </td>
    </tr>

<tr class="alt">
<td>b5 
4</td>
<td>F24L7.14<BR>At2g32720</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2914701">AAC04491</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32720">putative cytochrome b5</A></td>
    </tr>

<tr class="alt">
<td>b5 
5</td>
<td>F8A5.18<BR>At1g60660</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2462759">AAB71978 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60660">cytochrome b5, putative</A></td>
    </tr>

<tr class="alt">
<td>b5 
6</td>
<td>T1K7.28<BR>At1g26340</td>
<td><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A86390">A86390</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26340">cytochrome b5</A></td>
    </tr>     
	    
<TR>    <TD ROWSPAN=1 valign="top"><B>NADPH cytochrome b5 reductase</B></TD>
<td>&nbsp;</TD>
<td>MVA3.120<br>At5g17770</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759054">BAB09576 </A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g17770">NADH-cytochrome b5 reductase</A></td></tr>
    
</table>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>
 <BR>
 <BR>
 <BR>

<p><P><p><P>
<A NAME="NADPH_P450_reductases"><h2><i>Arabidopsis</i> NADPH P450 reductases<//h2></A>

<P><p>

	<TABLE  border="0" cellspacing="0" cellpadding="2">
<tr><td valign=top><b>Source:</B></td>  <TD><A HREF="http://www.biobase.dk/p450">The Arabidopsis P450, cytochrome b5, P450 reductase, and Glycosyltransferase Family 1 Site at PlaCe </A></td></tr>
<tr><td><b>Contact:</b></TD><td><A HREF="/servlets/Community?action=view&type=person&communityID=958" target="display">Dr. Soren Bak</A></TD></TR></table>
   

    <p>

    
    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="0">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th> 
	    </TR>
	    

<tr class="alt">    <TD ROWSPAN=3 valign="top"><B>NADPH P450 reductases</B></TD>
<TD>ATR1</TD>
<TD>F22K18.280<br>At4g24520</TD>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6088150">CAB58575</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g24520">NADPH-ferrihemoprotein reductase ATR1</A></td>
    </tr>

<tr class="alt">
<td>ATR2</td>
<TD>F9N11.60<br>At4g30210</TD>
<td><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T14081">T14081</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g30210">NADPH-ferrihemoprotein reductase (ATR2)</A></td>
    </tr>   

<tr class="alt">
<TD>(putative) ATR3</TD>
<TD>F14P3.7<br>At3g02280</TD>
<td><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6041790">AAF02110 </A></TD>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02280">putative NADPH-ferrihemoprotein reductase </A></td>
    </tr>   
    

</table>  

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
