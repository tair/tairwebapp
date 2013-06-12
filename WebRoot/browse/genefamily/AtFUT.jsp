<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Xyloglucan Fucosyltransferase1";
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
 
<A NAME="AtFUT.html"><h2>Family of Arabidopsis genes related to Xyloglucan Fucosyltransferase1</h2></A>
<table>
	<tr>
		<td valign=top><b>Source:</b></td> 
		<td>AtFUT1 - AtFUT10<br> 
		       <A HREF="/servlets/TairObject?type=publication&id=1546224" target=display> Plant Physiol, December 2001, Vol. 127, pp. 1595-1606</A></td> 
		<td>Rodrigo Sarria, <a href="/servlets/Community?action=view&type=person&communityID=511936" target=display>Tanya A. Wagner</A>, <br />
		    <a href="/servlets/Community?action=view&type=person&communityID=4257"target=display> Malcolm A.O'Neill</a>,<br /> 
		    <a href="/servlets/Community?action=view&type=person&communityID=10689" target=display>Ahmed Faik</A>, <a href="/servlets/Community?action=view&type=person&communityID=10747" target=display>Curtis G. Wilkerson</A>,<br />
	  	    <a href="/servlets/Community?type=person&action=view&communityID=807" target=display>Kenneth Keegstra</A><br />
		    <a href="/servlets/Community?type=person&action=view&communityID=5864" target=display>Natasha V. Raikhel</A></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>AtFUT11 - AtFUT13</td>
    		<td><a href="/servlets/Community?action=view&type=person&communityID=211716" target=display>Iain Wilson</A></td>
	</tr>	
    </table>
    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Alternative name:</B></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>Annotation:</b></th>
	    </TR>
	    

<tr class="alt">    <TD ROWSPAN=13 valign=top><B>Family of <i>Arabidopsis</i> genes related to Xyloglucan Fucosyltransferase1</B></TD>
	<TD>AtFUT1</TD>
        <td>FT1</td> 
	<TD>T18E12.11<BR>AT2G03220</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?save=0&cmd=search&val=AF154111">AF154111</A></TD>
        <TD><table><tr><td><a href="/servlets/Community?type=person&action=view&communityID=5864" target=display>N. Raikhel</A>: xyloglucan fucosyltransferase</TD></tr></table></td></TR>
	
<tr class="alt">	<TD>AtFUT2</TD><td>&nbsp;</td>
	<TD>&nbsp;<BR>AT2G03210</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/viewer.fcgi?query_key=5&db=nucleotide&page=0&dispmax=20&WebEnv=Yu%3Ctffe%3F%3EJgAgGj%3Cp%3E%5C%3C%5CggD%3FK%3Dhffg%60K%3F%3FKblHDJ%3CHg%3COE%3E%3EK&WebEnvRq=1">AC005313</A></TD>
        <TD><table><tr><td>TIGR: <A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G03210">unknown protein</A></TD></tr></table></td></TR>

<tr class="alt">	<TD>AtFUT3</TD><td>&nbsp;</td>
	<TD>F1M20.10<BR>At1g74420</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/viewer.fcgi?query_key=2&db=nucleotide&page=0&dispmax=20&WebEnv=h%5ELw%40_Jf%3FJ%3C_%3CCfDVK%3F%5CICKh%5C%3EgV%3D%60%3F_%3DJ%3CFb%60ACJlcKZ%5E%40HH%5D&WebEnvRq=1">AF417473</A></TD>
        <TD><table><tr><td><td><a href="/servlets/Community?type=person&action=view&communityID=5864" target=display>N. Raikhel</A>: unknown protein</A></TD></TR></table></td></tr>

<tr class="alt">	<TD>AtFUT4</TD><td>&nbsp;</td>
	<TD>F26H6.9<BR>At2g15390</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/viewer.fcgi?query_key=9&db=nucleotide&page=0&dispmax=20&WebEnv=lzWB%5E%3Cf%5EAj%3C%3C%3FkFgp%3FD%3CC_S%60CfIeEe%5E%5Eb%3EI%3EaPhF%40J%3CFgJ%3DeKc%3E%3C&WebEnvRq=1">AF417474</A></TD>
        <TD><table><tr><td>TIGR: <A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15390">unknown protein</A></TD></TR></table></td></tr>

<tr class="alt">	<TD>AtFUT5</TD><td>&nbsp;</td>
	<TD>F26H6.11<BR>At2g15370</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/viewer.fcgi?query_key=11&db=nucleotide&page=0&dispmax=20&WebEnv=%5DQKC%3EKAe%3DX%3CG_Ec%3C%7BaB%40fJePdhQ%3CG%3Dtc%3E%3C%60%40diKbU%40%60JFKaGC%60&WebEnvRq=1">AF417475</A></TD>
        <TD><table><tr><td>TIGR: <A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15370">unknown protein</A></TD></TR></table></td></tr>

<tr class="alt">	<TD>AtFUT6</TD><td>&nbsp;</td>
	<TD>F7A19.16<BR>At1g14080</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/viewer.fcgi?query_key=13&db=nucleotide&page=0&dispmax=20&WebEnv=IEINH%3DFJ%3FPIBMKf%3DC%3CCEcEg%5CiAfgfigICA%3CB%5D%3EA%5DHJAkWcC%60I%3Ed%3C&WebEnvRq=1">AC007576</A></TD>
<TD><table><tr><td><td><a href="/servlets/Community?type=person&action=view&communityID=5864" target=display>N. Raikhel</A>: unknown protein</TD></TR></table></td></tr>

	    
<tr class="alt">	<TD>AtFUT7</TD><td>&nbsp;</td>
	<TD>F7A19.15<BR>At1g14070</TD>    
	<TD>&nbsp;</TD>
<TD><table><tr><td><td><a href="/servlets/Community?type=person&action=view&communityID=5864" target=display>N. Raikhel</A>: unknown protein</TD></TR></table></td></tr>

<tr class="alt">	<TD>AtFUT8</TD><td>&nbsp;</td>
	<TD>F7A19.18<BR>At1g14100</TD>    
	<TD>&nbsp;</TD>
        <TD><table><tr><td>TIGR: <A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14100">hypothetical protein</A></TD></TR></table></td></tr>

<tr class="alt">	<TD>AtFUT9</TD><td>&nbsp;</td>
	<TD>F7A19.19<BR>At1g14110</TD>    
	<TD>&nbsp;</TD>
        <TD><table><tr><td>TIGR: <A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14110">hypothetical protein</A></TD></TR></table></td></tr>

<tr class="alt">	<TD>AtFUT10</TD><td>&nbsp;</td>
	<TD>F26H6.13<BR>At2g15350</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/viewer.fcgi?query_key=15&db=nucleotide&page=0&dispmax=20&WebEnv=SKh%5DfGAACIeJ%5C%3D%3E%40W%3D%40l%5DgKQdEAEB_DfKIA%40%40YH%5E%3FGEit%3EgF_%3F&WebEnvRq=1">AC006920</A></TD>
        <TD><table><tr><td>TIGR: <A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15350">unknown protein</A></TD></TR></table></td></tr>

<tr class="alt">	<TD>AtFUT11</td><td>FucTA<br>FucT1</TD>
	<TD>MVI11.20<BR>At3g19280</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/viewer.fcgi?query_key=17&db=nucleotide&page=0&dispmax=20&WebEnv=MaXgBJ%3CAbCGfKdeA_GfGbh%3CiH%40%3Cd%3D__%3C%3CH%3C%5DCa%3Dg%3FIfFfVgAb%3Da%3C&WebEnvRq=1">AJ404860</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/viewer.fcgi?query_key=2&db=nucleotide&page=0&dispmax=20&WebEnv=%40FOUHc%3CJcc%40H%3Fsi%3Ee%5CG%3FI%5CebbKAA%3CG%7BcafJb%3CNA%3Che%3FJoJaiJ%3D%3C%3C&WebEnvRq=1">AJ345084</A></TD>
        <TD><table><tr><td>TIGR: <A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g19280">fucosyltransferase, putative</A></TD></TR><tr><td><a href="/servlets/Community?action=view&type=person&communityID=211716" target=display>I. Wilson et al</a>: Core alpha1,3-fucosyltransferase</td></tr></table></td></tr>

<tr class="alt">	<TD>AtFUT12</td><td>FucTB<br>FucT2</TD>
	<TD>F14J22.8<BR>At1g49710</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/viewer.fcgi?query_key=19&db=nucleotide&page=0&dispmax=20&WebEnv=%60ffZc%3C%3C%3Fci%5E%3D%3D%3E%5CJ%3Cf%3F%3C_AAZCbFf%5DaM%60i%5C%3EimbAIFeJJ_%3FaG%3F%3Dm%3C&WebEnvRq=1">AJ404861</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/viewer.fcgi?query_key=4&db=nucleotide&page=0&dispmax=20&WebEnv=v%40d%5CedN%3C%3CF%3CNBhHAd%3FEIcB%5C%40f%3D%3FA%3F%60n%5Cg%5CB%3C%3Dd%60iKDE%3CpdKaHB&WebEnvRq=1">AJ345085</A></TD>
        <TD><table><tr><td>TIGR: <A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g49710">fucosyltransferase c3 protein, putative</A></TD></TR><tr><td><a href="/servlets/Community?action=view&type=person&communityID=211716" target=display>I. Wilson</a>: According to an indirect assay (described by Bakker et al), this gene also appears to have core alpha1,3-fucosyltransferase activity</td></tr></table></td></tr>

<tr class="alt">	<TD>AtFUT13</td><td>FucTC<br>FT4-M</TD>
	<TD>F17M19.14<BR>At1g71990</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/viewer.fcgi?query_key=21&db=nucleotide&page=0&dispmax=20&WebEnv=UYZH%3F%3F%40GfBGbBga%40re%3D%3CGcc%7Bb%3FHkA%3ESfaf%40OdTKdJf%3CfYIgAbRA%3C&WebEnvRq=1">AJ404862</A><br><A href="http://www.ncbi.nlm.nih.gov:80/entrez/viewer.fcgi?query_key=6&db=nucleotide&page=0&dispmax=20&WebEnv=skDc%5Dh%5C%3C%60lA%5EBal%40Z%3D%40%3Ff%5EaV%3EgeA_%3D%5Cc%5CDC%40BfICJc%5EGWDAb%3DGg%3C&WebEnvRq=1">AY026941</A></TD>
        <TD><table><tr><td>TIGR: <A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71990">hypothetical protein</A></TD></tr><tr><td><a href="/servlets/Community?action=view&type=person&communityID=211716" target=display>I. Wilson</a>: According to Leonard et al, this gene encodes a Lewis-type alpha1,4-fucosyltransferase</td></tr></table></td></tr>



	</TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
