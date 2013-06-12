<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Nodulin like Gene Family";
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

<A NAME="Nodulin.html"><h2>Nodulin-like Gene Family</h2></A>

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
         <th><B>TIGR Annotation:</b></th>
      </TR>

	  
<tr class="alt">   <A NAME="Nodulin-like"> <TD ROWSPAN=43 valign=top><B>Nodulin-like protein family</B></A></TD>
	<TD>&nbsp;</TD>
	<TD>T25K16_19<BR><a href="/servlets/TairObject?type=locus&name=At1g01070 "/>At1g01070</a></TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D86141">D86141</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01070">unknown protein</a></TD></TR>	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T18B16_150<BR><a href="/servlets/TairObject?type=locus&name=At4g19180 "/>At4g19180</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2828293">CAA16707</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19180">putative protein</a></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F16L2_80<BR><a href="/servlets/TairObject?type=locus&name=At3g45870 "/>At3g45870</a></TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47527">T47527</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g45870">putative protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MMG15_6<BR><a href="/servlets/TairObject?type=locus&name=At3g28050 "/>At3g28050</a></TD>
	<TD>&nbsp;</TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g28050">unknown protein </a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MMG15_7<BR><a href="/servlets/TairObject?type=locus&name=At3g28060 "/>At3g28060</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=11994126">BAB01128</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g28060">hypothetical protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MMG15_8<BR><a href="/servlets/TairObject?type=locus&name=At3g28070 "/>At3g28070</a></TD>
	<TD>&nbsp;</TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g28070">unknown protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MMG15_9<BR><a href="/servlets/TairObject?type=locus&name=At3g28080 "/>At3g28080</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=11994129"> BAB01131</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g28080">unknown protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MMG15_10<BR><a href="/servlets/TairObject?type=locus&name=At3g28090 "/>At3g28090</a></TD>
	<TD>&nbsp;</TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g28090">hypothetical protein</a></TD></TR>	
	
<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MNJ7_6<BR><a href="/servlets/TairObject?type=locus&name=At5g47470 "/>At5g47470</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=9758775">BAB09073</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g47470">nodulin-like protein</a></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MSN9_130<BR><a href="/servlets/TairObject?type=locus&name=At5g40230 "/>At5g40230</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177510">BAB10904</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g40230">putative protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MSN9_140<BR><a href="/servlets/TairObject?type=locus&name=At5g40240 "/>At5g40240</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177511">BAB10905</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g40240">putative protein </a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T4D2_140<BR><a href="/servlets/TairObject?type=locus&name=At3g53210 "/>At3g53210</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6630741">CAB64224</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g53210">putative protein </a></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F3G5.24<BR><a href="/servlets/TairObject?type=locus&name=At2g37450 "/>At2g37450</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4056505">AAC98071</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37450">nodulin-like protein </a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F3G5.25<BR><a href="/servlets/TairObject?type=locus&name=At2g37460 "/>At2g37460</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4056506">AAC98072</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37460">nodulin-like protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T13J8_150<BR><a href="/servlets/TairObject?type=locus&name=At4g28040 "/>At4g28040</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4455363">CAB36773</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g28040">Medicago nodulin N21-like protein </a></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F10A5_24<BR><a href="/servlets/TairObject?type=locus&name=At1g75500 "/>At1g75500</a></TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E96785">E96785</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75500">nodulin-like protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F4F7_12<BR><a href="/servlets/TairObject?type=locus&name=At1g25270 "/>At1g25270</a></TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D86382">D86382</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g25270">MtN21 nodulin protein, putative</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T2K10_17<BR><a href="/servlets/TairObject?type=locus&name=At1g60050 "/>At1g60050</a></TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H96624">H96624</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60050">hypothetical protein</a></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD> MSH12_14<BR><a href="/servlets/TairObject?type=locus&name=At5g13670 "/>At5g13670</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758033">BAB08694</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g13670">putative protein </a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T22E19_23<BR><a href="/servlets/TairObject?type=locus&name=At1g68170 "/>At1g68170</a></TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A96705">A96705</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68170">MtN21-like protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T6J22_10<BR><a href="/servlets/TairObject?type=locus&name=At3g30340 "/>At3g30340</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294338">BAB02235</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g30340">hypothetical protein</a></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F12L6.17<BR><a href="/servlets/TairObject?type=locus&name=At2g39510 "/>At2g39510</a></TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00561">T00561</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39510">nodulin-like protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>dl3810w<BR><a href="/servlets/TairObject?type=locus&name=At4g15540 "/>At4g15540</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268301">CAB78596</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15540">hypothetical protein </a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T12G13_130<BR><a href="/servlets/TairObject?type=locus&name=At4g08290 "/>At4g08290</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5262202">CAB45799 </A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g08290">nodulin-like protein</a></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T12G13_140<BR><a href="/servlets/TairObject?type=locus&name=At4g08300 "/>At4g08300</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5262203">CAB45800</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g08300">nodulin-like protein</a></TD></TR>

	
<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MVP7_2<BR><a href="/servlets/TairObject?type=locus&name=At5g64700 "/>At5g64700</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177201">BAB10303</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64700">nodulin-like protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T23J18_12<BR><a href="/servlets/TairObject?type=locus&name=At1g11450 "/>At1g11450</a></TD>
	<TD>&nbsp;</TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11450">unknown protein</a></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T23J18_29<BR><a href="/servlets/TairObject?type=locus&name=At1g11460 "/>At1g11460</a></TD>
	<TD>&nbsp;</TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11460">hypothetical protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F17I23_240<BR><a href="/servlets/TairObject?type=locus&name=At4g30420 "/>At4g30420</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7269943">CAB79760</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g30420"> nodulin-like protein </a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MOJ9_22<BR><a href="/servlets/TairObject?type=locus&name=At5g07050 "/>At5g07050</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759561">BAB11163</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07050">MtN21 nodulin protein-like</a></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T5P19_270<BR><a href="/servlets/TairObject?type=locus&name=At3g56620 "/>At3g56620</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7594540">CAB88065</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g56620">nodulin-like protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F20P5_31<BR><a href="/servlets/TairObject?type=locus&name=At1g70260 "/>At1g70260</a></TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F96725">F96725</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70260">hypothetical protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F14J9_4<BR><a href="/servlets/TairObject?type=locus&name=At1g09380 "/>At1g09380</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3482913">AAC33198</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09380">putative nodulin protein, N21	</a></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>dl4335c<BR><a href="/servlets/TairObject?type=locus&name=At4g16620 "/>At4g16620</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268412">CAB78704</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g16620">membrane protein homolog</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T20B5.10<BR><a href="/servlets/TairObject?type=locus&name=At2g40900 "/>At2g40900</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2623304">AAB86450</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40900">putative integral membrane protein nodulin</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MRC8_19<BR><a href="/servlets/TairObject?type=locus&name=At3g18200 "/>At3g18200</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294076">BAB02033</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g18200">integral membrane protein</a></TD></TR>


<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F13M23_120<BR><a href="/servlets/TairObject?type=locus&name=At4g24980 "/>At4g24980</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4455241">CAB36740</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g24980">putative protein (fragment)</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F3D13_4<BR><a href="/servlets/TairObject?type=locus&name=At4g01430 "/>At4g01430</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268186">CAB77713</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g01430">predicted protein of unknown function</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F3D13_3<BR><a href="/servlets/TairObject?type=locus&name=At4g01440 "/>At4g01440</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268187">CAB77714</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g01440">predicted protein of unknown function</a></TD></TR>
	
<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F11O4_14<BR><a href="/servlets/TairObject?type=locus&name=At4g01450 "/>At4g01450</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268188">CAB77715</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g01450">predicted protein of unknown function</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T12C22_7<BR><a href="/servlets/TairObject?type=locus&name=At1g44800 "/>At1g44800</a></TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A96507">A96507</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g44800">nodulin protein, putative</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MFC19_4<BR><a href="/servlets/TairObject?type=locus&name=At5g45370 "/>At5g45370</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758727">BAB09165</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g45370">nodulin-like protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T26F17_6<BR><a href="/servlets/TairObject?type=locus&name=At1g21890 "/>At1g21890</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6552743">AAF16542</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g21890">nodulin-like protein </a></TD></TR>

<TR>    <TD ROWSPAN=16 valign=top><a name="Nodulin-l"><B>Nodulin-like protein family</B></a></TD>
        <TD>&nbsp;</TD>
	<TD>T21F11_14<BR><a href="/servlets/TairObject?type=locus&name=At1g80530 "/>At1g80530</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6730730">AAF27120</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80530">nodulin-like protein</a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>T5K18_230<BR><a href="/servlets/TairObject?type=locus&name=At4g19450 "/>At4g19450</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3080375">CAA18632</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19450">putative protein</a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>F25A4_25<BR><a href="/servlets/TairObject?type=locus&name=At1g74780 "/>At1g74780</a></TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B96777">B96777</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74780">hypothetical protein</a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>F11I11_190<BR><a href="/servlets/TairObject?type=locus&name=At4g34950 "/>At4g34950</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5123712">CAB45456 </A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g34950">putative protein</a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>T9D9.11<BR><a href="/servlets/TairObject?type=locus&name=At2g30300 "/>At2g30300</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2347195">AAC16934</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30300"> putative vacuolar sorting receptor</a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>MUA22_12<BR><a href="/servlets/TairObject?type=locus&name=At5g14120 "/>At5g14120</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757793">BAB08291 </A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g14120">nodulin-like protein</a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>T24I21.7<BR><a href="/servlets/TairObject?type=locus&name=At2g16660 "/>At2g16660</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4581109">AAD24599</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16660">nodulin-like protein</a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>T16B24.15<BR><a href="/servlets/TairObject?type=locus&name=At2g39210 "/>At2g39210</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3402684">AAC28987</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39210">nodulin-like protein </a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>F4P13_17<BR><a href="/servlets/TairObject?type=locus&name=At3g01630 "/>At3g01630</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6016721">AAF01547</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01630">hypothetical protein</a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>F28J7_26<BR><a href="/servlets/TairObject?type=locus&name=At3g01930 "/>At3g01930</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6091732">AAF03444</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01930">unknown protein</a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>F14D16_4<BR><a href="/servlets/TairObject?type=locus&name=At1g18940 "/>At1g18940</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778273">AAF79282</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18940">hypothetical protein </a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>MBA10_8<BR><a href="/servlets/TairObject?type=locus&name=At5g50520 "/>At5g50520</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758761">BAB09137</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g50520">nodulin-like protein</a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>MFB16_2<BR><a href="/servlets/TairObject?type=locus&name=At5g50630 "/>At5g50630</a></TD>
	<TD>&nbsp;</TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g50630">nodulin-like protein</a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>F13P17.19<BR><a href="/servlets/TairObject?type=locus&name=At2g34350 "/>At2g34350</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3337366"> AAC27411</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34350">nodulin-like protein </a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>F24D13.9<BR><a href="/servlets/TairObject?type=locus&name=At2g28120 "/>At2g28120</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4063746">AAC98454</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28120">nodulin-like protein</a></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>T8E3_15<BR><a href="/servlets/TairObject?type=locus&name=At1g31470 "/>At1g31470</a></TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G86440">G86440</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31470">hypothetical protein</a></TD></TR>

<tr class="alt"><TD ROWSPAN=5 valign=top><a name="Nodu"><B>Nodulin-like protein family</B></a></TD>    <TD>&nbsp;</TD>
        <TD>F28O16_17<BR><a href="/servlets/TairObject?type=locus&name=At1g76800 "/>At1g76800</a></TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F96796">F96796</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76800">nodulin-like protein</a></TD></TR>

	<tr class="alt">    <TD>&nbsp;</TD>
        <TD>MJL12_14<BR><a href="/servlets/TairObject?type=locus&name=At3g25190 "/>At3g25190</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294177">BAB02079</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g25190">integral membrane protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
        <TD>T22I11_3<BR><a href="/servlets/TairObject?type=locus&name=At1g21140 "/>At1g21140</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8886987">AAF80647</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g21140">nodulin</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
        <TD>F23N14_10<BR><a href="/servlets/TairObject?type=locus&name=At3g43630 "/>At3g43630</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7362788">CAB83064</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g43630">nodulin -like protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
        <TD>F23N14_40<BR><a href="/servlets/TairObject?type=locus&name=At3g43660 "/>At3g43660</a></TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7362791">CAB83067</A></TD>
        <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g43660">nodulin - like protein</a></TD></TR>
</TABLE>	


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
