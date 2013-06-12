<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Ion Channel Gene Families";
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
 
<A NAME="Ionchannels"><h2>Ion Channel Gene Families</h2></A>
<TABLE><TR>

<TD valign=top><B>Source:</B></TD> <TD><A HREF="http://www.cbs.umn.edu/arabidopsis/"> Arabidopsis Membrane Protein Library</A><br>Lacombe et al., (2001) <a href="/servlets/TairObject?type=publication&id=501683243">The Identity of Plant Glutamate Receptors.</a> Science 292: 1486-1487 **</td></tr>

<td valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Ward, J. (2001) <a href="/servlets/TairObject?type=publication&id=501680716">Identification of novel families of membrane proteins from the model plant <i>Arabidopsis thaliana</i>.</a> <i>Bioinformatics</i>, <b>17</b>, 560-563.</td></tr>

<TR><TD valign=top><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=6083"" target="display">John Ward</A><br><A href="/servlets/Community?action=view&type=person&communityID=211861" target=display>Benoit Lacombe</A><A NAME="lacombe">**</A>
</td></tr>

</TABLE>


	  <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th>
	    </TR>
	    

<tr class="alt">    <TD ROWSPAN=9 valign=top><B>Shaker family</B></TD>
	<TD>KAT1</TD>
	<TD>MPL12_2<BR>AT5g46240</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S32816">S32816</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g46240">potassium channel protein KAT1 (pir||S32816) </A></TD></TR>
	
<tr class="alt">	<TD>AKT2</TD>
	<TD>T10I14_30<BR>AT4g22200</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S68699">S68699</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g22200">potassium channel protein AKT3</A></TD></TR>

<tr class="alt">	<TD>SKOR</TD>
	<TD>F13E7_21<BR>AT3g02850</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6728977">AAF26975</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g02850">stelar K+ outward rectifying channel (SKOR)</A></TD></TR>

<tr class="alt">	<TD>AKT6, SPIK</TD>
	<TD>F3N11.5<BR>At2g25600</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4874315">AAD31377</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25600">putative potassium transporter/channel</A></TD></TR>

<tr class="alt">	<TD>GORK</TD>
	<TD>mpa22_p_30<BR>AT5g37500</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3810676">CAA11280</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g37500">stelar K+ outward rectifying channel (SKOR) - like protein</A></TD></TR>

<tr class="alt">	<TD>AKT1</TD>
	<TD>F18A8.2<BR>At2g26650</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2569933">CAA44693</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26650">K+ transporter, AKT1</A></TD></TR>

<tr class="alt">	<TD>AKT5</TD>
	<TD>F8B4_200<BR>AT4g32500</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F85381">F85381</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g32500">potassium channel - protein</A></TD></TR>

<tr class="alt">	<TD>KAT3</TD>
	<TD>F4D11_150<BR>AT4g32650</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7270169">CAB79982</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g32650">potassium channel protein AtKC</A></TD></TR>
	
<tr class="alt">	<TD>KAT2</TD>
	<TD>T9A21_140<BR>AT4g18290</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H85205">H85205</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18290">potassium channel protein KAT2 </A></TD></TR>

<TR>    <TD ROWSPAN=1 valign=top><B>KCO-like protein 3 family</B></TD>	<TD>KCO3</TD>
	<TD>MPL12_16<BR>AT5g46360</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177717">BAB11091</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g46360">KCO-like protein 3 (emb|CAB40380.1)</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=5 valign=top><B>KCO5 protein family</B></TD>	<TD>KCO2</TD>
	<TD>MPL12_17<BR>AT5g46370</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177718">BAB11092 </A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g46370">outward rectifying potassium channel KCO </A></TD></TR>

<tr class="alt">	<TD>KCO1</TD>
	<TD>MDF20_7<BR>AT5g55630</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758597">BAB09230</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55630">outward rectifying potassium channel KCO</A></TD></TR>

<tr class="alt">	<TD>KCO4</TD>
	<TD>T14P4_20<BR>At1g02510</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9972388">AAG10638</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02510">hypothetical protein </A></TD></TR>

<tr class="alt">	<TD>KCO5</TD>
	<TD>T7B11_10<BR>AT4g01840</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F85023">F85023</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g01840">putative potassium channel</A></TD></TR>

<tr class="alt">	<TD>KCO6</TD>
	<TD>F15J5_130<BR>AT4g18160</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5817002">CAB53657</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18160">potassium channel - like protein</A></TD></TR>
	
<TR>    <TD ROWSPAN=20 valign=top><B>Glutamate Receptor (ATGLR) Family<a href="
lacombe">**</a></B></TD>
	<TD><I>AtGLR1.1</I></TD>
	<TD>T6K12_27<BR>AT3g04110</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6721174">AAF26802</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g04110">putative glutamate receptor (GLR1)</A></TD></TR>

<TR>	<TD><i>AtGLR1.2</I></TD>
	<TD>MJE7_3<BR>AT5g48400</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8777370">BAA96960</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g48400">ligand-gated ion channel protein-like; glutamate receptor-like</A></TD></TR>	

	
<TR>	<TD><i>AtGLR1.3</I></TD>
	<TD>MJE7_4<BR>AT5g48410</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758208">BAA96961</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g48410">ligand-gated ion channel protein-like; glutamate receptor-like</A></TD></TR>

<TR>	<TD><i>AtGLR1.4</I></TD>
	<TD>F21O3_23<BR>AT3g07520</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6041847">AAF02156</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07520">unknown protein</A></TD></TR>


<tr>  <TD><i>AtGLR2.1</i></TD>
	<TD>T21B4_10<BR>AT5g27100</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=2191183&dopt=GenPept">AAB61068.1</A> </TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g27100">ion channel - like protein</A></TD></TR>

<TR>	<TD><i>AtGLR2.2</I></TD>
	<TD>F27A10.3<BR>At2g24720</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4646232">AAD26895</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24720">putative ligand-gated ion channel protein</A></TD></TR>	

<TR>	<TD><i>AtGLR2.3</i></TD>
	<TD>F27A10.2<BR>At2g24710</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4646231">AAD26894</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24710">putative ligand-gated ion channel protein</A></TD></TR>

<TR>	<TD><i>AtGLR2.4</I></TD>
	<TD>F28M20_100<BR>AT4g31710</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3281857">CAA19752</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g31710">putative protein</A></TD></TR>

<TR>	<TD><i>AtGLR2.5</I></TD>
	<TD>F2I11_100<BR>AT5g11210</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8953383">CAB96656</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g11210">putative protein </A></TD></TR>

<TR>	<TD><i>AtGLR2.6</I></TD>
	<TD>F2I11_70<BR>AT5g11180</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8953380">CAB96653</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g11180">putative protein </A></TD></TR>

<TR>	<TD><i>AtGLR2.7</i></TD>
	<TD>T9I4.20<BR>At2g29120</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02742">T02742</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29120">putative ligand-gated ion channel protein</A></TD></TR>

<TR>	<TD><i>AtGLR2.8</i></TD>
	<TD>T9I4.19<BR>At2g29110</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02741">T02741</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29110">putative ligand-gated ion channel protein</A></TD></TR>

	
<TR>	<TD><i>AtGLR2.9</i></TD>
	<TD>T9I4.18<BR>At2g29100</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02740">T02740</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29100">putative ligand-gated ion channel protein</A></TD></TR>

<TR>	<TD><i>AtGLR3.1</i></TD>
	<TD>F5J6.2<BR>At2g17260</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=7532409&dopt=GenPept">AAF63223</A></TD>
        <TD>&nbsp;</TD></TR>

<TR>	<TD><i>AtGLR3.2</i></TD>
	<TD>F23E12_150<BR>AT4g35290</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3080421">CAA18740</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g35290">putative protein </A></TD></TR>	

<TR>	<TD><i>AtGLR3.3</i></TD>
	<TD>T8D8_1<BR>At1g42540</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=12322630&dopt=GenPept">AAG51316</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g42540">ligand-gated ion channel, putative</A></TD></TR>

	<TR>	<TD><i>AtGLR3.4</i></TD>
	<TD>YUP8H12_19<BR>At1g05200</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5713181">AAD47833</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05200">putative ligand-gated ion channel protein </A></TD></TR>

	
<TR>	<TD><i>AtGLR3.5</i></TD>
	<TD>T32F6.9<BR>At2g32390</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E84732">E84732</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32390">putative ligand-gated ion channel subunit</A></TD></TR>

<TR>	<TD><i>AtGLR3.6</i></TD>
	<TD>F26O13_120<BR>AT3g51480</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6572069">CAB63012</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g51480">putative glutamate receptor</A></TD></TR>
	
<TR>	<TD><i>AtGLR3.7</i></TD>
	<TD>T32F6.8<BR>At2g32400</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F84732">F84732</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32400">putative ligand-gated ion channel subunit</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=20 valign=top><B>Cyclic nucleotide gated channel family</B></TD>	<TD>AtCNGC15</TD>
	<TD>T3B23.7<BR>At2g28260</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4803955">AAD29827</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28260">putative cyclic nucleotide and calmodulin-regulated ion channel protein</A></TD></TR>
	
<tr class="alt">	<TD>AtCNGC7</TD>
	<TD>T24D18_9<BR>At1g15990</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10086501">AAG12561</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15990">cyclic nucleotide and calmodulin-regulated ion channel protein, putative</A></TD></TR>

<tr class="alt">	<TD>AtCNGC3</TD>
	<TD>F11C10.12<BR>At2g46430</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G84902">G84902</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46430">putative cyclic nucleotide-regulated ion channel protein</A></TD></TR>

<tr class="alt">	<TD>AtCNGC11</TD>
	<TD>F11C10.13<BR>At2g46440</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H84902">H84902</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46440">putative cyclic nucleotide-regulated ion channel protein</A></TD></TR>

<tr class="alt">	<TD>AtCNGC12</TD>
	<TD>F11C10.14<BR>At2g46450</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A84903">A84903</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46450">putative cyclic nucleotide-regulated ion channel protein</A></TD></TR>

<tr class="alt">	<TD>AtCNGC4</TD>
	<TD>MDK4_7<BR>AT5g54250</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T52574">T52574</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g54250">cyclic nucleotide and calmodulin-regulated ion channel </A></TD></TR>

<tr class="alt">	<TD>AtCNGC10<BR>(ACBK1)</TD>
	<TD>F6F3_15<BR>At1g01340</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9665147">AAF97331</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01340">cyclic nucleotide and calmodulin-regulated ion channel, putative</A></TD></TR>
	
<tr class="alt">	<TD>AtCNGC6</TD>
	<TD>T29E15.18<BR>At2g23980</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3738325">AAC63666</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g23980">cyclic nucleotide and calmodulin-regulated ion channel</A></TD></TR>

<tr class="alt">	<TD>AtCNGC16</TD>
	<TD>T17F15_120<BR>AT3g48010</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4678327">CAB41138</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g48010">putative cyclic nucleotide-gated channel</A></TD></TR>

<tr class="alt">	<TD>AtCNGC18</TD>
	<TD>T9L3_170<BR>AT5g14870</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9755755">CAC01886</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g14870">cyclic nucleotide and calmodulin-regulated ion channel -like protein </A></TD></TR>	
	
<tr class="alt">	<TD>AtCNGC14</TD>
	<TD>F25P17.9<BR>At2g24610</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4572671">AAD23886</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24610">putative cyclic nucleotide-regulated ion channel protein</A></TD></TR>
	
<tr class="alt">	<TD>AtCNGC17</TD>
	<TD>F17I23_300<BR>AT4g30360</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7269936">CAB81029</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g30360">cyclic nucleotide and calmodulin-regulated ion channel-like protein</A></TD></TR>

<tr class="alt">	<TD>AtCNGC9</TD>
	<TD>F17I23_100<BR>AT4g30560</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7269957">CAB79774</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g30560">cyclic nucleotide and calmodulin-regulated ion channel-like protein </A></TD></TR>

<tr class="alt">	<TD>AtCNGC8</TD>
	<TD>F14P1_46<BR>At1g19780</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19780">cyclic nucleotide and calmodulin-regulated ion channel protein, putative </A></TD></TR>

<tr class="alt">	<TD>AtCNGC19<BR>(CNBT2)</TD>
	<TD>MKP6_24<BR>AT3g17690</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294159">BAB02061</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g17690">hypothetical protein </A></TD></TR>
	
<tr class="alt">	<TD>AtCNGC20<BR>(CNBT1)</TD>
	<TD>MKP6_25<BR>AT3g17700</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294160">BAB02062</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g17700">hypothetical protein</A></TD></TR>

<tr class="alt">	<TD>AtCNGC2<BR>(DND1)</TD>
	<TD>T20K14_20<BR>AT5g15410</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9755796">CAC01740</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g15410">cyclic nucleotide-gated cation channel</A></TD></TR>

<tr class="alt">	<TD>AtCNGC5</TD>
	<TD>MTI20_20<BR>AT5g57940</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T52573">T52573</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g57940">cyclic nucleotide and calmodulin-regulated ion channel (emb|CAB40130.1)</A></TD></TR>

<tr class="alt">	<TD>AtCNGC13</TD>
	<TD>f3i3_30<BR>AT4g01010</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7228242">CAB45784</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g01010">cyclic nucleotide gated channel (CNGC4) like protein</A></TD></TR>

<tr class="alt">	<TD>AtCNGC1</TD>
	<TD>MFH8_6<BR>AT5g53130</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T51354">T51354</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g53130">cyclic nucleotide-regulated ion channel (emb|CAA76178.1)</A></TD></TR>

<TR>    <TD ROWSPAN=5 valign=top><B>Anion channel protein family</B></TD>	<TD>&nbsp;</TD>
	<TD>MHK7_12<BR>AT5g40890</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177968">BAB11351</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g40890">anion channel protein (gb|AAC05742.1)</A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>T29A4_90<BR>AT5g33280</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g33280">chloride channel-like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>K9P8_3<BR>AT5g49890</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g49890">chloride channel (emb|CAA70310.1)</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T19G15_90<BR>AT5g26240</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1742959">CAA96065</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g26240">CLC-d chloride channel protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MYF5_4<BR>AT3g27170</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1742955">CAA96058</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g27170">CLC-b chloride channel protein</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=1 valign=top><B>Putative calcium channel</B></TD> 	<TD>&nbsp;</TD>
	<TD>F9H3_19<BR>AT4g03560</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B85045">B85045</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g03560">putative calcium channel</A></TD></TR>
	</TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
