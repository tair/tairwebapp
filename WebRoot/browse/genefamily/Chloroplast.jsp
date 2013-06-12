<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Chloroplast and Mitochondria Gene Families";
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
 
<h2><A NAME="Chloroplast"><i> Arabidopsis</i> Chloroplast and Mitochondria Gene Families</A></h2>

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
	<th><b>TIGR Annotation:</B></TH></TR>
    
	    

<tr class="alt">    <TD ROWSPAN=2 valign=top><B>Chloroplast membrane protein<br>ALBINO3 family</B></TD>	
	<TD>&nbsp;</TD>
	<TD>F8N16.9<BR>At2g28800</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A84689">A84689</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28800">chloroplast membrane protein (ALBINO3)</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F21J9_160<BR>At1g24500</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9743337">AAF97961</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24500">putative chloroplast membrane protein, ALBINO3</a></TD></TR>

<TR>    <TD ROWSPAN=17 valign=top><B>Chlorophyll a/b-binding protein family</B></TD>	<TD>&nbsp;</TD>
	<TD>F7H2_15<BR>At1g15820</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T52314">T52314</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15820">chlorophyll binding protein, putative</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MGF10_9<BR>AT3g27690</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T52322">T52322</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g27690">putative chlorophyll A-B binding protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F2A19_70<BR>AT3g61470</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47939">T47939</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g61470">Lhca2 protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F28P10_130<BR>AT3g54890</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S25435">S25435</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g54890">chlorophyll a/b-binding protein </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T16O11_12<BR>AT3g08940</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T52317">T52317</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g08940">putative chlorophyll a/b-binding protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F14G6_17<BR>At1g76570</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6642675">AAF20255</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76570">putative chlorophyll A-B binding protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T25B24_12<BR>At1g61520</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4585882">AAD25555 </A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61520">PSI type III chlorophyll a/b-binding protein, putative</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F1O13.20<BR>At2g05070</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T52324">T52324</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g05070">putative chlorophyll a/b binding protein </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F15L11.2<BR>At2g05100</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4874296">AAD31358</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g05100">putative chlorophyll a/b binding protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F27I1.2<BR>At2g40100</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T52316">T52316</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40100">putative chlorophyll a/b binding protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F1N18_23<BR>At1g29930</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=16376">CAA27543</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29930">chlorophyll A-B-binding protein 2 precursor, 5' partial</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F1N18_80<BR>At1g29920</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A29280">A29280</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29920">photosystem II type I chlorophyll a /b binding protein, putative</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F1N18_9<BR>At1g29910</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A29280">A29280</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29910">photosystem II type I chlorophyll a /b binding protein, putative</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F24G24_140<BR>AT4g10340</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04049">T04049</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g10340">chlorophyll a/b-binding protein - like</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T31E10.24<BR>At2g34420</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S23546">S23546</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34420">photosystem II type I chlorophyll a/b binding protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T31E10.23<BR>At2g34430</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S25677">S25677</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34430">putative photosystem II type I chlorophyll a/b binding protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
        <TD>F7A7_50<BR>AT5g01530</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S33443">S33443</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g01530">chlorophyll a/b-binding protein CP29 </a></TD></TR>    
      
<tr class="alt">    <TD ROWSPAN=2 valign=top><B>Cytochrome c putative family</B></TD>	       <TD>&nbsp;</TD>
	<TD>MHK7_4<BR>AT5g40810</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177960">BAB11343</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g40810">cytochrome c1 precursor</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>K17E12_6<BR>AT3g27240</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294217">BAB02119</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g27240">cytochrome c, putative</a></TD></TR>

<TR>    <TD ROWSPAN=3 valign=top><B>Strong similarity to a mitochondrial<BR>carrier protein-Ribes nigrum family</B></TD>	<TD>&nbsp;</TD>
	<TD>T27E13.10<BR>At2g30160</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00582">T00582</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30160">putative mitochondrial carrier protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F10K1_31<BR>At1g07030</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8954043">AAF82217</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07030">mitochondrial carrier protein, putative </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F10K1_18<BR>At1g07020</TD>    
	<TD>&nbsp;</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07020">hypothetical protein</a></TD></TR>

<tr class="alt">    <TD ROWSPAN=2 valign=top><B>Mitochondrial carrier protein family</B></TD>	<TD>&nbsp;</TD>
	<TD>T30B22.21<BR>At2g47490</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00435">T00435</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47490">putative mitochondrial carrier protein </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F2J7_15<BR>At1g25380</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10092331">AAG12742</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g25380">mitochondrial carrier protein, putative</a></TD></TR>

<TR>    <TD ROWSPAN=3 valign=top><B>Putative NADH dehydrogenase family</B></TD>	<TD>&nbsp;</TD>
	<TD>F26K10_100<BR>AT4g28220</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T09038">T09038</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g28220">putative NADH dehydrogenase</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F18E5_110<BR>AT4g21490</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T05157">T05157</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g21490">AT4g21490</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F5H14.23<BR>At2g20800</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E84593">E84593</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g20800">putative NADH-ubiquinone oxireductase </a></TD></TR>

<tr class="alt">    <TD ROWSPAN=3 valign=top><B>Inner mitochondrial membrane family</B></TD>	<TD>&nbsp;</TD>
	<TD>F1L3_5<BR>At1g17530</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778460">AAF79468 </A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17530">inner mitochondrial membrane protein, putative</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T9J14_25<BR>AT3g04800</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6175180">AAF04906</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g04800">putative inner mitochondrial membrane protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F28P22_6 <BR>At1g72750</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S71194">S71194</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72750">inner mitochondrial membrane protein</a></TD></TR>

<TR>    <TD ROWSPAN=4 valign=top><B>Cytochrome b-561 family</B></TD>
        <TD>&nbsp;</TD>
	<TD>F28B23_22<BR>At1g26100</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176831">BAB10153</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26100">cytochrome b-561, putative</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD> MBB18_18<BR>AT5g38630</TD>    
	<TD>&nbsp;</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g38630">cytochrome b-561 (gb|AAD45585.1)</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>M7J2_60<BR>AT4g25570</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E85295">E85295</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25570">putative protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F10B6_24<BR>At1g14730</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778213">AAF79222</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14730">cytochrome B561, putative</a></TD></TR>

<tr class="alt">    <TD ROWSPAN=3 valign=top><B>Mitochondrial phosphate<BR> transporter family</B></TD>
        <TD>&nbsp;</TD>
	<TD>MUA22_4<BR>AT5g14040</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757785">BAB08283</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g14040">mitochondrial phosphate translocator</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T21J18_120<BR>AT3g48850</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T49281">T49281</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g48850">mitochondrial phosphate transporter</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F5J6.3<BR>At2g17270</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B84550">B84550</A></TD>
        <TD>&nbsp;</TD></TR>

<TR>    <TD ROWSPAN=2 valign=top><B>Ubiquinol-cytochrome C reductase complex<BR>ubiquinone-binding protein (QP-C)-like family</B></TD> 	<TD>&nbsp;</TD>
	<TD>K18I23_18<BR>AT5g05370</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176749">BAB09980</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g05370">ubiquinol-cytochrome C reductase complex ubiquinone-binding protein (QP-C)-like protein (gb|AAF19563.1)</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T7M13_6<BR>AT3g10860</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6630544">AAF19563</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g10860">putative ubiquinol-cytochrome C reductase complex ubiquinone-binding protein (QP-C)</a></TD></TR>

<tr class="alt">    <TD ROWSPAN=3 valign=top><B>Putative mitochondrial carrier<BR>protein family</B></TD>	<TD>&nbsp;</TD>
	<TD>F14F8_20<BR>AT5g15640</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T51393">T51393</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g15640">putative mitochondrial carrier protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T19G15_50<BR>AT5g26200</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01839">T01839</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g26200">mitochondrial carrier - like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F3N23_2<BR>At1g72820</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5903071">AAD55629</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72820">unknown protein</a></TD></TR>

<TR>    <TD ROWSPAN=2 valign=top><B>Beta-carotene hydroxylase family</B></TD>	<TD>&nbsp;</TD>
	<TD>F6N7_5<BR>AT5g52570</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8953712">BAA98075</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g52570">beta-carotene hydroxylase</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>L73G19_80<BR>AT4g25700</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T09562">T09562</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25700">beta-carotene hydroxylase</a></TD></TR>

<tr class="alt">    <TD ROWSPAN=1 valign=top><B>Putative chloroplast protein<BR>import component</B></TD>	<TD>&nbsp;</TD>
	<TD>F4C21_25<BR>AT4g03320</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B85042">B85042</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g03320">putative chloroplast protein import component</a></TD></TR>

<TR>    <TD ROWSPAN=1 valign=top><B>Putative mitochondrial carrier protein</B></TD>	<TD>&nbsp;</TD>
	<TD>F11F19.29<BR>At2g35800</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B84773">B84773</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g35800">putative mitochondrial carrier protein </a></TD></TR>

<tr class="alt">    <TD ROWSPAN=1 valign=top><B>Putative cytochrome c biogenesis<BR>protein precursor</B></TD>	<TD>&nbsp;</TD>
	<TD>MDK4_11<BR>AT5g54290</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759502">BAB10752</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g54290">cytochrome c biogenesis protein precursor (gb|AAF35369.1)</a></TD></TR>

<TR>    <TD ROWSPAN=1 valign=top><B>SecY homolog;<BR>targetted to the thylakoid membrane</B></TD> 	<TD>&nbsp;</TD>
	<TD> MSF3.9<BR>At2g18710</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1049293">AAB60305</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18710">putative preprotein translocase SECY protein</a></TD></TR>


</TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
