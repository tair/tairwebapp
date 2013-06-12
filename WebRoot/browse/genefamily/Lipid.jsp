<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Lipid Metabolism Gene Families";
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
 

<A NAME="Lipid"><h2>Lipid Metabolism Gene Families</h2></A>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD> <TD><A HREF="http://www.cbs.umn.edu/arabidopsis/"> Arabidopsis Membrane Protein Library</A></td></tr>

<td valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Ward, J. (2001) <a href="/servlets/TairObject?type=publication&id=501680716">Identification of novel families of membrane proteins from the model plant <i>Arabidopsis thaliana</i>.</a> <i>Bioinformatics</i>, <b>17</b>, 560-563.</td></tr>

<TR><TD><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=6083"" target="display">John Ward</A></td></tr>

</TABLE>

    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th>    
	    </TR>
	    

<tr class="alt">    <TD ROWSPAN=3 valign=top><B>Putative CDP-diacylglycerol<BR>synthetase family</B></TD>
	<TD>&nbsp;</TD>
	<TD>F10M23_110<BR>AT4g26770</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04800">T04800</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g26770">putative CDP-diacylglycerol synthetase</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T10I14_170<BR>AT4g22340</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04915">T04915</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g22340">CDP-diacylglycerol synthetase-like protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F24O1_45<BR>At1g62430</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2181182">CAA63969</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g62430">hypothetical protein</A></TD></TR>

<TR>    <TD ROWSPAN=11 valign=top><B>Oleosin-like protein family</B></TD>	       <TD>&nbsp;</TD>
	<TD>k11j9_130<BR>AT5g61610</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758476">BAB09005</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g61610">putative protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MGF10_6<BR>AT3g27660</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S71286">S71286</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g27660">oleosin isoform</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F27J15_22<BR>At1g48990</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7770342">AAF69712</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48990">hypothetical protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MPO12_130<BR>AT5g40420</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10178154">BAB11599</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g40420">oleosin</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F4P13_12<BR>AT3g01570</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6016716">AAF01542</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01570">putative oleosin</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MWD22_16<BR>AT5g51210</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9755840">CAA90878</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g51210">oleosin-like</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F17H15.8<BR>At2g25890</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A84654">A84654</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25890">putative oleosin protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T2I1_260<BR>AT5g07550</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T49895">T49895</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07550">glycine-rich protein PUTG1</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T2I1_270<BR>AT5g07560</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7576194">CAB87945</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07560">oleosin-like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>K24M9_6<BR>AT3g18570</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294318">BAB02215</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g18570">hypothetical protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F13M23_280<BR>AT4g25140</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S22538">S22538</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25140">oleosin, 18.5K</A></TD></TR>	


<tr class="alt">    <TD ROWSPAN=16 valign=top><B>Similar to phosphoribosylanthranilate<BR> transferase family</B></TD>	<TD>&nbsp;</TD>
	<TD>F18F4_180<BR>AT4g20080</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04892">T04892</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g20080">Phosphoribosylanthranilate transferase</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F25A4_35<BR>At1g74720</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5882720">AAD55273</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74720">hypothetical protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>&nbsp;<BR>AT5g03435</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48366">T48366</A></TD>
      <TD>&nbsp;</TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T24H18_140<BR>AT5g12970</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T49911">T49911</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g12970">anthranilate phosphoribosyltransferase -like protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MDN11_14<BR>AT5g48060</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177757">BAB11070</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g48060">phosphoribosylanthranilate transferase-like protein </A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T20K12_200<BR>AT3g61300</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47922">T47922</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g61300">anthranilate phosphoribosyltransferase-like protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F15G16_110<BR>AT3g61720</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47964">T47964</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g61720">putative protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F5D21_2<BR>At1g51570</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T46010">T46010</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51570">anthranilate phosphoribosyltransferase, putative</A></TD></TR>
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MOJ9_2<BR>AT5g06850</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759541">BAB11143</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g06850">anthranilate phosphoribosyltransferase-like protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F6N23_8<BR>AT4g00700</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01234">T01234</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g00700">putative phosphoribosylanthranilate transferase</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T12J13_4<BR>AT3g03680</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6091755">AAF03465</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g03680">putative phosphoribosylanthranilate transferase</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD> T10K17_90<BR>AT3g57880</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T46010">T46010</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g57880">anthranilate phosphoribosyltransferase-like protein</A></TD></TR>
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T5C23_40<BR>AT4g11610</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04208">T04208</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g11610">putative phosphoribosylanthranilate transferase</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F12K8_4<BR>At1g22610</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6587829">AAF18518</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22610">putative phosphoribosylanthranilate transferase, 5' partial</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F20D22_8<BR>At1g04150</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00958">T00958</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04150">putative phosphoribosylanthranilate transferase</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MCM23_5<BR>AT5g17980</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757890">BAB08397</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g17980">phosphoribosylanthranilate transferase-like protein</A></TD></TR>

<TR>    <TD ROWSPAN=2 valign=top><B>Fatty acid desaturase family</B></TD>	       <TD>&nbsp;</TD>
	<TD>T3F17.14<BR>At2g46210</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3702328">AAC62885</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46210">putative fatty acid desaturase/cytochrome b5 fusion protein</A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>F2A19_180<BR>AT3g61580</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47950">T47950</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g61580">delta-8 sphingolipid desaturase</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=11 valign=top><B>Lipid transfer protein family</B></TD><TD>&nbsp;</TD>
	<TD>T25N20_24<BR>At1g05450</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778716">AAF79724 </A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05450">lipid-transfer protein, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F17L24.13<BR>At2g13820</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B84511">B84511</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g13820">putative nonspecific lipid-transfer protein precursor</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F11L15.4<BR>At2g48140</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H84923">H84923</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g48140">unknown protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F16J14_17<BR>AT3g22600</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G84923">G84923</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g22600">unknown protein</A></TD></TR>
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F16J14_18<BR>AT3g22610</TD>    
	<TD>&nbsp;</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g22610">hypothetical protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MHJ24_6<BR>AT5g64080</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176956">BAB10276</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64080">putative protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T3F12_2<BR>AT4g08670</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267509">CAB77992</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g08670">putative lipid transfer protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F5J5_27<BR>At1g36150</TD>    
	<TD>&nbsp;</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g36150">non-specific lipid transfer protein, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T28A8_10<BR>AT3g43720</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47408">T47408</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g43720">lipid-transfer protein-like protein</A></TD></TR>
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T20P8.18<BR>At2g27130</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B84669">B84669</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g27130">hypothetical protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T5E8_170<BR>AT5g09370</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9955524">CAC05463</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g09370">putative lipid transfer protein</A></TD></TR>

<TR>    <TD ROWSPAN=4 valign=top><B>Putative phosphatidic acid <BR>phosphatase family</B></TD>	<TD>&nbsp;</TD>
	<TD>F10A8.6<BR>At2g01180</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E84421">E84421</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01180">putative phosphatidic acid phosphatase</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F16B3_23<BR>AT3g02600</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6957723">AAF32467</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g02600">putative phosphatidate phosphohydrolase</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MIE15_1<BR>AT3g18220</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9279656">BAB01172</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g18220">diacylglycerol pyrophosphate phosphatase, putative</A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>F9L1_2<BR>At1g15080 </TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5103807">AAD39637</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15080 ">putative phosphatidic acid phosphatase</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=9 valign=top><B>Delta 9 desaturase family</B></TD> 	<TD>&nbsp;</TD>
	<TD>T21E18_10<BR>At1g06080</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T52111">T52111</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06080">delta 9 desaturase</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T21E18_11<BR>At1g06090</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8810472">AAF80133</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06090">delta 9 desaturase, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T21E18_12<BR>At1g06100</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8810472">AAF80133</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06100">delta 9 desaturase, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T21E18_14<BR>At1g06120</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12083276">AAG48797</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06120">delta 9 desaturase, putative</A></TD></TR>
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T2D23_16<BR>At1g06350</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C86199">C86199</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06350">delta 9 desaturase, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T2D23_4<BR>At1g06360</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12083262">AAG48790</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06360">delta 9 desaturase, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T28P16.15<BR>At2g31360</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G84719">G84719</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31360">delta 9 desaturase</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MSJ11_25<BR>AT3g15850</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9230020">BAB00771</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g15850">putative delta 9 desaturase</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MSJ11_27<BR>AT3g15870</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9230021">BAB00772</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g15870">putative delta 9 desaturase</A></TD></TR>
	
<TR>    <TD ROWSPAN=2 valign=top><B>Putative lipase family</B></TD>
        <TD>&nbsp;</TD>
	<TD>F2P9_21<BR>At1g73920</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7109480">AAF36744</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73920">putative lipase</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F15H18_15<BR>At1g18460</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6714304">AAF26000</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18460">unknown protein</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=2 valign=top><B>Putative phosphatidate<BR>cytidylyltransferase family</B></TD>
	<TD>&nbsp;</TD>
	<TD>T4C21_30<BR>AT3g60620</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47873">T47873</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g60620">phosphatidate cytidylyltransferase - like protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T14P1.4 <BR>At2g45150</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A84887">A84887</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g45150">putative phosphatidate cytidylyltransferase</A></TD></TR>
	
<TR>    <TD ROWSPAN=4 valign=top><B>Putative C-4 sterol methyl oxidase family</B></TD>	<TD>&nbsp;</TD>
	<TD>F16P2.23<BR>At2g29390</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G84695">G84695</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29390">putative C-4 sterol methyl oxidase</A></TD></TR>	

<TR>	<TD>&nbsp;</TD>
	<TD>F22G5_18<BR>At1g07420</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778563">AAF79571</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07420">unknown protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T12H17_140<BR>AT4g22750</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04570">T04570</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g22750">predicted protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F16J13_180<BR>AT4g12110</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4586116">CAB40952</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g12110">putative C-4 sterol methyl oxidase </A></TD></TR>

<tr class="alt">    <TD ROWSPAN=4 valign=top><B>Omega-3 fatty acid desaturase family</B></TD>	<TD>&nbsp;</TD>
	<TD>F23F1.10<BR>At2g29980</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=471091">BAA04505</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29980">omega-3 fatty acid desaturase</A></TD></TR>
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MOP10_12<BR>AT5g05580</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10178135">BAB11547</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g05580">temperature-sensitive omega-3 fatty acid desaturase, chloroplast precursor
 (sp|P48622) </A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F9F8_4<BR>AT3g11170</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10645567">AAG21677</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g11170">omega-3 fatty acid desaturase, chloroplast precursor</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T21B14_107<BR>AT3g12120</TD>    
	<TD>&nbsp;</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g12120">omega-6 fatty acid desaturase, endoplasmic reticulum (FAD2)</A></TD></TR>

<TR>    <TD ROWSPAN=2 valign=top><B>Fatty acid hydroxylase-like family</B></TD>   <TD>&nbsp;</TD>
	<TD>T13K14_30<BR>AT4g20870</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5262777">CAB45882</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g20870">fatty acid hydroxylase - like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T29F13.2<BR>At2g34770</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01359">T01359</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34770">fatty acid hydroxylase (FAH1)</A></TD></TR>
	
<tr class="alt">    <TD ROWSPAN=2 valign=top><B>Putative b-keto acyl reductase family</B></TD>	<TD>&nbsp;</TD>
	<TD>F21J9_190<BR>At1g24470</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9743335">AAF97959</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24470">putative b-keto acyl reductase</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F12A21_31<BR>At1g67730</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6728876">AAF26949</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67730">b-keto acyl reductase, putative </A></TD></TR>

<TR>    <TD ROWSPAN=2 valign=top><B>Lipophosphoglycan biosynthetic<BR> protein - like family</B></TD>	<TD>&nbsp;</TD>
	<TD>F28I16_130<BR>AT5g19980</TD>    
	<TD>&nbsp;</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g19980">lipophosphoglycan biosynthetic protein - like </A></TD></TR>

	<TR>	<TD>&nbsp;</TD>
	<TD>F15M4_16<BR>At1g76340</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6554485">AAF16667 </A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76340">unknown protein</A></TD></TR>


<tr class="alt">    <TD ROWSPAN=4 valign=top><B>Lipid transfer protein;<BR> glossy1 homolog family</B></TD>	<TD>&nbsp;</TD>
	<TD>F13M22.20<BR>At2g37700</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02536">T02536</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37700">CER1-like protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MTI20_3<BR>AT5g57800</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758349">BAB08850</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g57800">lipid transfer protein; glossy1 homolog</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T7I23_9<BR>At1g02190</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1418319">CAA65200</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02190">CER1-like protein </A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T7I23_10<BR>At1g02200</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1209703">AAB87721</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02200">CER1 protein</A></TD></TR>
	
<TR>    <TD ROWSPAN=2 valign=top><B>Phosphatidylinositol synthase family</B></TD>	<TD>&nbsp;</TD>
	<TD>T23K23_15<BR>At1g68000</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3367632">CAA04172</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68000">phosphatidylinositol synthase (PIS1)</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F20M13_130<BR>AT4g38570</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T05685">T05685</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38570"> putative phosphatidylinositol synthase</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=2 valign=top><B>Phosphatidylglycerophosphate synthase-like<BR>protein family</B></TD>
        <TD>&nbsp;</TD>
	<TD>T15C9_30<BR>AT3g55030</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47642">T47642</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55030">phosphatidylglycerophosphate synthase - like protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T16B24.7<BR>At2g39290</TD>    
	<TD>&nbsp;</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39290">putative CDP-diacylglycerol--glycerol-3-phosphate
 3-phosphatidyltransferase</A></TD></TR>

<TR>    <TD ROWSPAN=2 valign=top><B>Phospholipase A2-like family</B></TD>     <TD>&nbsp;</TD>
	<TD>F17A13_280<BR>AT4g29460</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G85343">G85343</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g29460">phospholipase A2-like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F17A13_290<BR>AT4g29470</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H85343">H85343</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g29470">putative protein</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=2 valign=top><B>3-hydroxy-3-methylglutaryl-CoA reductase<BR> family</B></TD>	<TD>&nbsp;</TD>
	<TD>F14G6_9<BR>At1g76490</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A32107">A32107</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76490">3-hydroxy-3-methylglutaryl CoA reductase (AA 1-592) </A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F5J6.24<BR>At2g17370</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2262168">AAB86514</A></TD>
      <TD>&nbsp;</TD></TR>
	
<TR>    <TD ROWSPAN=2 valign=top><B>Putative sterol-C5-desaturase family</B></TD>	      <TD>&nbsp;</TD>
	<TD> F16B3_21<BR>AT3g02580</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4234768">AAD12944 </A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g02580">sterol-C5-desaturase</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F16B3_22<BR>AT3g02590</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6957722">AAF32466 </A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g02590">putative sterol-C5-desaturase</A></TD></TR>


<tr class="alt">    <TD ROWSPAN=2 valign=top><B>Phosphatidylinositol 4-kinase family</B></TD>    <TD>&nbsp;</TD>
	<TD> MHJ24_5<BR>AT5g64070 </TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176955">BAB10275</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64070 ">phosphatidylinositol 4-kinase (emb|CAB37928.1)</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T5E8_150<BR>AT5g09350</TD>    
	<TD>&nbsp;</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g09350">putative protein </A></TD></TR>

<TR>    <TD ROWSPAN=2 valign=top><B>Undecaprenyl diphosphate synthase<BR>family</B></TD>	<TD>&nbsp;</TD>
	<TD>muf9_150<BR>AT5g60500</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757752">BAB08233</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g60500">undecaprenyl diphosphate synthase </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>muf9_160<BR>AT5g60510</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757753">BAB08234</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g60510">undecaprenyl diphosphate synthase</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=1 valign=top><B>Putative fatty acid desaturase</B></TD>
  <TD>&nbsp;</TD>
	<TD>T1J1_1<BR>AT4g04930</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267252">CAB81035</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g04930">putative fatty acid desaturase</A></TD></TR>

<TR>    <TD ROWSPAN=1 valign=top><B>Putative phosphatidylinositolglycan class N<BR>short form</B></TD>	<TD>&nbsp;</TD>
	<TD>T13O15_2<BR>AT3g01380</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6692267">AAF24617</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01380">putative phosphatidylinositolglycan class N short form</A></TD></TR>
	
<tr class="alt">    <TD ROWSPAN=1 valign=top><B>Putative steroid dehydrogenase</B></TD>	<TD>&nbsp;</TD>
	<TD>F4P9.40<BR>At2g33630</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H84747">H84747</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33630">putative steroid dehydrogenase</A></TD></TR>

<TR>    <TD ROWSPAN=1 valign=top><B>Diacylglycerol O-acyltransferase</B></TD> 	<TD>&nbsp;</TD>
	<TD>F3P11.5<BR>At2g19450</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H84576">H84576</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19450">hypothetical protein</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=1 valign=top><B>Putative heme A: farnesyltransferase</B></TD><TD>&nbsp;</TD>
	<TD>F16B22.1<BR>At2g44520</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E84879">E84879</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44520">putative heme A:farnesyltransferase </A></TD></TR>

<TR>    <TD ROWSPAN=1 valign=top><B>Putative phosphatidylinositol-glycan synthase</B></TD> 	<TD>&nbsp;</TD>
	<TD>F19I3.21<BR>At2g34980</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00479">T00479</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34980">putative phosphatidylinositol-glycan synthase</A></TD></TR>
</TABLE>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
