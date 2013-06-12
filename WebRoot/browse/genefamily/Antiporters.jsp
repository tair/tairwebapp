<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Antiporter Gene Families";
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
 
<h2><A NAME="Antiporters"><b><i> Arabidopsis</i> Antiporter Gene Families</B></A></h2>


<TABLE><TR>

<TD valign=top><B>Source:</B></TD> <TD><A HREF="http://www.cbs.umn.edu/arabidopsis/"> Arabidopsis Membrane Protein Library</A></td></tr>

<td valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Ward, J. (2001) <a href="/servlets/TairObject?type=publication&id=501680716">Identification of novel families of membrane proteins from the model plant <i>Arabidopsis thaliana</i>.</a> <i>Bioinformatics</i>, <b>17</b>, 560-563.</td></tr>

<TR><TD><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=6083" target="display">John Ward</A></td></tr>

</TABLE> 


  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<TH><B>TIGR Annotation:</B></TH></TR>
	    

<tr class="alt">    <TD ROWSPAN=8 valign=top><B>Phosphate/triose-phosphate<br>translocator family</B></TD>
        <TD>&nbsp;</TD>
	<TD>MCL19_16<BR>AT5g46110</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757731">BAB08256</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g46110">phosphate/triose-phosphate translocator precursor (gb|AAC83815.1)</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MBG8_6<BR>AT5g54800</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758260">BAB08759</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g54800">glucose-6-phosphate/phosphate translocator</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T19B17_1<BR>AT4g04300</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267187">CAB77898</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g04300">hypothetical protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F26C17_50<BR>AT5g28230</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267187">CAB77898</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g28230">putative protein</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F4P13_10<BR>AT3g01550</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6016714">AAF01540</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01550">putative phosphate/phosphoenolpyruvate translocator</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F19N2_40<BR>AT5g33320</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1778141">AAB40646</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g33320">phosphate/phosphoenolpyruvate translocator precursor </a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F8K4_1<BR>At1g61800</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02126">T02126</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61800">glucose-6-phosphate/phosphate-translocator precursor, putative</a></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>K10A8_110<BR>AT5g17630</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T51467">T51467</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g17630">glucose 6 phosphate/phosphate translocator-like protein</a></TD></TR>

<TR>    <TD ROWSPAN=6 valign=top><B>Low affinity calcium antiporter<BR>CAX2 family</B></TD><TD>AtCAX2</TD>
	<TD>MDC11_10<BR>AT3g13320</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294538">BAB02801</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g13320">low affinity calcium antiporter CAX2</a></TD></TR>

<TR>    <TD>AtCAX1</TD>
	<TD>F16M14.10<BR>At2g38170</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01249">T01249</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38170">high affinity Ca2+ antiporter</a></TD></TR>

<TR>    <TD>AtCAX3<BR>AtHCX1</TD>
	<TD>ORF11<BR>AT3g51860</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T51157">T51157</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g51860">Ca2+/H+-exchanging protein-like</a></TD></TR>

<TR>    <TD>AtCAX4</TD>
	<TD>F7A7_10<BR>AT5g01490</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48170">T48170</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g01490">Ca2+/H+ exchanger-like protein</A></TD></TR>

<TR>    <TD>AtCAX6</TD>
	<TD>F20N2_23<BR>At1g55720</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778497">AAF79505</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55720">H+/Ca2+ antiporter, putative</a></TD></TR>

<TR>    <TD>AtCAX5</TD>
	<TD>F20N2_16<BR>At1g55730</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778496">AAF79504</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55730">H+/Ca2+ antiporter, putative</a></TD></TR>
	

<tr class="alt">	<TD ROWSPAN=4 valign=top><B>Sodium proton exchanger<BR>family</B></TD>
        <TD>AtNHX1</TD>
	<TD>T21B4_60<BR>AT5g27150</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4324597">AAD16946</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g27150">NHE1 Na+/H+ exchanger </a></TD></TR>

<tr class="alt">	<TD>AtNHX4</TD>
	<TD>F24P17_16<BR>AT3g06370</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6437550">AAF08577</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g06370">putative sodium proton exchanger</A></TD></TR>

<tr class="alt">	<TD>AtNHX3</TD>
	<TD>MTE17_18<BR>AT5g55470</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758179">BAB08564</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55470">sodium proton exchanger</a></TD></TR>

<tr class="alt">	<TD>AtNHX2</TD>
	<TD>T9J14_2<BR>AT3g05030</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5932533">AAD56988</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g05030">putative sodium proton exchanger</a></TD></TR>

<TR>	<TD ROWSPAN=7 valign=top><B>Putative anion exchange<BR>protein family</B></TD>
        <TD>&nbsp;</TD>
	<TD>T16N11_24<BR>At1g15460</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5103843">AAD39673</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15460">hypothetical protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F24P17_6<BR>AT3g06450</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6437544">AAF08571</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g06450">unknown protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T3D7.3<BR>At2g47160</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G84911">G84911</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47160">putative anion exchange protein 3</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F9E10_34<BR>At1g74810</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6646783">AAF21095</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74810">putative anion exchanger </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T17J13_230<BR>AT3g62270</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48019">T48019</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g62270">putative protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F8B4_210<BR>AT4g32510</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T05361">T05361</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g32510">putative protein</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F18G18_170<BR>AT5g25430</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T05361">T05361</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g25430">anion exchanger-like protein</a></TD></TR>

<tr class="alt">    <TD ROWSPAN=26 valign=top><B>Putative Na+/H+ antiporter family</B></TD>
        <TD>AtCHX1</TD>
	<TD>F3O9_18<BR>At1g16380</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B84509">B84509</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16380">putative Na/H antiporter</a></TD></TR>

<tr class="alt">	<TD>AtCHX15</TD>
	<TD>T10F5.16<BR>At2g13620</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B84509">B84509</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g13620">putative Na/H antiporter</a></TD></TR>

<tr class="alt">	<TD>AtCHX23</TD>
	<TD>F3F20_20<BR>At1g05580</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4836908">AAD30610</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05580">hypothetical protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX20</TD>
	<TD>F5K20_20<BR>AT3g53720</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T45912">T45912</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g53720">putative protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX13</TD>
	<TD>T9D9.5<BR>At2g30240</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00576">T00576</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30240">putative Na/H antiporter</a></TD></TR>

<tr class="alt">	<TD>AtCHX18</TD>
	<TD>MBK23_12<BR>AT5g41610</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10178015">BAB11467</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g41610">Na+/H+ antiporter-like protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX14</TD>
	<TD>F10K1_23<BR>At1g06970</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00576">T00576</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06970">hypothetical protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX6</TD>
	<TD>T6D22_24<BR>At1g08140</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778833">AAF79832</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08140">hypothetical protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX5</TD>
	<TD>T6D22_25<BR>At1g08150</TD>    
	<TD>&nbsp;</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08150">hypothetical protein </a></TD></TR>

<tr class="alt">	<TD>AtCHX21</TD>
	<TD>F20M17.5<BR>At2g31910</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F84726">F84726</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31910">putative Na+/H+ antiporter</a></TD></TR>

<tr class="alt">	<TD>AtCHX3</TD>
	<TD>MRN17_13<BR>AT5g22900</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177237">BAB10611</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g22900">Na+/H+ antiporter-like protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX9</TD>
	<TD>MRN17_14<BR>AT5g22910</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177238">BAB10612</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g22910">Na+/H+ antiporter-like protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX17</TD>
	<TD>F9D16_170<BR>AT4g23700</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T05602">T05602</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g23700">putative Na+/H+-exchanging protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX19</TD>
	<TD>MKP6_18<BR>AT3g17630</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294151">BAB02053</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g17630">unknown protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX25</TD>
	<TD>mqj2_50<BR>AT5g58460</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177023">BAB10261</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g58460">putative protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX24</TD>
	<TD>mjg14_30<BR>AT5g37060</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177985">BAB11358</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g37060">putative transporter protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX16</TD>
	<TD>F22C12_6<BR>At1g64170</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6692096">AAF24561</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64170">hypothetical protein </a></TD></TR>

<tr class="alt">	<TD>AtCHX2</TD>
	<TD>T8K14_18<BR>At1g79400</TD>    
	<TD>&nbsp;</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79400">hypothetical protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX4</TD>
	<TD>F28D10_90<BR>AT3g44900</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T51787">T51787</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g44900">putative protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX12</TD>
	<TD>F28D10_100<BR>AT3g44910</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T51788">T51788</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g44910">putative protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX11</TD>
	<TD>F28D10_110<BR>AT3g44920</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T51789">T51789</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g44920">putative protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX10</TD>
	<TD>F28D10_120<BR>AT3g44930</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T51790">T51790</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g44930">putative protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX7</TD>
	<TD>F24D13.4<BR>At2g28170</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F84681">F84681</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28170">hypothetical protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX8</TD>
	<TD>F24D13.3<BR>At2g28180</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G84681">G84681</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28180">hypothetical protein </a></TD></TR>

<tr class="alt">	<TD>AtCHX26</TD>
	<TD>F7A7_200<BR>AT5g01680</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48189">T48189</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g01680">putative transporter protein</a></TD></TR>

<tr class="alt">	<TD>AtCHX27</TD>
	<TD>F7A7_210<BR>AT5g01690</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48190">T48190</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g01690">putative transporter protein</a></TD></TR>

<TR>    <TD ROWSPAN=2 valign=top><B>Putative Na+/H+ antiporter family</B></TD><TD>AtSOS1<BR>AtNHX7</TD>
	<TD>F14H20.5<BR>At2g01980</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E84431">E84431</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01980">putative Na+/H+ antiporter</a></TD></TR>

<TR>	<TD>AtNHX8</TD>
	<TD>T5E21_5<BR>At1g14660</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7527724">AAF63173</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14660">Sodium/hydrogen exchanger, putative</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=3 valign=top><B>Putative potassium proton<BR>antiporter family</B></TD>	<TD>AtKEA6</TD>
	<TD>T22P22_190<BR>AT5g11800</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48539">T48539</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g11800">putative potassium transport protein</a></TD></TR>

<tr class="alt">	<TD>AtKEA5</TD>
	<TD>MIO24_16<BR>AT5g51710</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177870">BAB11240</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g51710">potassium/proton antiporter-like protein </a></TD></TR>

<tr class="alt">	<TD>AtKEA4</TD>
	<TD>F3P11.20<BR>At2g19600</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G84578">G84578</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19600">putative potassium/proton antiporter</a></TD></TR>

<TR>    <TD ROWSPAN=2 valign=top><B>Na+/H+ antiporter-Putative family</B></TD>      <TD>AtNHD2</TD>
	<TD>F10F5_6<BR>At1g49810</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10092167">AAG12587</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g49810">putative potassium/proton antiporter</a></TD></TR>

<TR>	<TD>AtNHD1</TD>
	<TD>MLD14_21<BR>AT3g19490</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9229353">BAA99699</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g19490">unknown protein</a></TD></TR>

<tr class="alt">    <TD ROWSPAN=3 valign=top><B>2-oxoglutarate/malate<BR>translocator precursor-like</B></TD>	<TD>&nbsp;</TD>
	<TD>T24H18_30<BR>AT5g12860</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T49900">T49900</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g12860">2-oxoglutarate/malate translocator precursor -like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MSJ1_12<BR>AT5g64280</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759404">BAB09859</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64280">2-oxoglutarate/malate translocator </a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MSJ1_13<BR>AT5g64290</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759405">BAB09860</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64290">2-oxoglutarate/malate translocator</a></TD></TR>

<TR>    <TD ROWSPAN=4 valign=top><B>ADP, ATP carrier-like<BR>Protein family</B></TD><TD>&nbsp;</TD>
	<TD>F20O9_60<BR>AT4g28390</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04608">T04608</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g28390">ADP,ATP carrier-like protein </a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F17O14_5<BR>AT3g08580</TD>    
	<TD>&nbsp;</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g08580">adenylate translocator</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T6I14_20<BR>AT5g13490</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9955541">CAC05426</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g13490">adenosine nucleotide translocator</a></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T10B6_60<BR>AT5g17400</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T51577">T51577</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g17400">ADP/ATP translocase-like protein </a></TD></TR>

<tr class="alt">    <TD ROWSPAN=3 valign=top><B>Potassium-dependent <BR>sodium-calcium exchanger like-family</B></TD><TD>AtCAX11</TD>
	<TD>F7G19_17<BR>At1g08960</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1922938">AAB70411</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08960">hypothetical protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MVA3_200<BR>AT5g17850</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177886">BAB11218</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g17850">potassium-dependent sodium-calcium exchanger - like protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MVA3_210<BR>AT5g17860</TD>    
	<TD>&nbsp;</TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g17860">potassium-dependent sodium-calcium exchanger - like protein</a></TD></TR>

<TR>    <TD ROWSPAN=1 valign=top><B>Putative Na+/Ca2+ antiporter</B></TD><TD>AtMHX1</TD>
	<TD>T30B22.10<BR>At2g47600</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00424">T00424</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47600">putative Na+/Ca2+ antiporter</a></TD></TR>

<tr class="alt">    <TD ROWSPAN=1 valign=top><B>Putative carnitine/acylcarnitine<BR>translocase</B></TD><TD>&nbsp;</TD>
	<TD>F19K16_14<BR>At1g79900</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6453859">AAF09043</A></TD>
      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79900">putative carnitine/acylcarnitine translocase</a></TD></TR>

	</TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
