<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR- Phospholipase D gene family";
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
 
<h2><i> Arabidopsis</i> Phospholipase D gene family</h2>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD>
<TD><b>Elias M, Potocky M, Cvrckova F, Zarsky V V.</b> (2002) <A href="/servlets/TairObject?type=publication&id=501681754" target=new>Molecular diversity of phospholipase D in angiosperms. </a> BMC Genomics <b>3(1): 2</b></TD></TR>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD>please see the article above for more details </TD></TR>

<TR><TD valign=top><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=11352" target="display">Marek Elias</A><br>
M. Potocky <br><A href="/servlets/Community?type=person&action=view&communityID=3301" target=display>F Cvrckova</A><br> <A href="/servlets/Community?type=person&action=view&communityID=639" target=display>V. Zarsky</A></TD></TR>

</TABLE>

    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<TH><B>TIGR Annotation:</B></TH></TR>
	    

<tr class="alt">    <TD ROWSPAN=10 valign=top><B>C2-PLD subfamily</B></TD>
        <TD>PLD ALPHA 1</TD>
	<TD>MSJ11.13<br>At3g15730</TD>
	<TD>NP_188194</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g15730">putative phospholipase D</a></TD></TR>


<tr class="alt"><TD>PLD ALPHA 2</TD>
<TD>F6D8.21<BR>At1g52570</TD>
<TD>NP_175666</td>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g52570">phospholipase D1, putative</a></TD></TR>

<tr class="alt"><TD>PLD BETA 1</TD>
<TD>T6D20.10<BR>At2g42010</TD>
<TD>NP_565963*</TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42010">phospholipase D</a></TD></TR>

<tr class="alt"><TD>PLD BETA 2</TD>
<TD>F5I10.13<BR>At4g00240</TD>
<TD>NP_567160</TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g00240">phospholipase D, putative</a></TD></TR>

<tr class="alt"><TD>PLD GAMMA 1</TD>
<TD>T26M18.60<BR>At4g11850</TD>
<TD>NP_192922</TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11850">putative phospholipase D-gamma</a></TD></TR>

<tr class="alt"><TD>PLD GAMMA 2</TD>
<TD>T26M18.40<BR>At4g11830</TD>
<TD>NP_192920</TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11830">putative phospholipase D-gamma </a></TD></TR>

<tr class="alt"><TD>PLD GAMMA 3</TD>
<TD>T26M18.50<BR>At4g11840</TD>
<TD>NP_192921</TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g11840">putative phospholipase D-gamma</a></TD></TR>

<tr class="alt"><TD>PLD DELTA</TD>
<TD>F4B14.60<BR>At4g35790</TD>
<TD>NP_567989</TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g35790">putative protein</a></TD></TR>

<tr class="alt"><TD>PLD EPSILON</TD>
<TD>F7A10.25<BR>At1g55180</TD>
<TD>NP_175914</TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55180">phospholipase D alpha, putative</a></TD></TR>

<tr class="alt"><TD>PLD ZETA</TD>
<TD>F18G18.110<BR>At5g25370</TD>
<TD>NP_197919</TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g25370">phospholipase D1-like protein</a></TD></TR>

<TR><td rowspan="2" valign="top"><b>PXPH-PLD subfamily</b></td>
<TD>PLDp1</TD>
<TD>MGL6.24+<br>MGL6.27<BR>At3g16790+<br>At3g16785</TD>
<TD>BAA95772</TD>
<TD>&nbsp;</TD></TR>

<TR><TD>PLDp2</TD>
<TD>F18C1.10<BR>At3g05630</TD>
<TD>NP_187214*</TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05630">putative phospholipase D</a></TD></TR>


      
	</TABLE><br>
*= predicted protein sequences are to be corrected
<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
