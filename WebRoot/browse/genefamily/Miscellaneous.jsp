<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Miscellaneous Gene Families";
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
 

<A NAME="Miscellaneous"><h2>Miscellaneous Gene Families</h2></A>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD> <TD><A HREF="http://www.cbs.umn.edu/arabidopsis/"> Arabidopsis Membrane Protein Library</A></td></tr>

<td valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Ward, J. (2001) <a href="/servlets/TairObject?type=publication&id=501680716">Identification of novel families of membrane proteins from the model plant <i>Arabidopsis thaliana</i>.</a> <i>Bioinformatics</i>, <b>17</b>, 560-563.</td></tr>

<TR><TD><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=6083"" target="display">John Ward</A></td></tr>

</TABLE>


<p>

 <TABLE align="center" border="1" cellspacing="0" cellpadding="2">
    

	 

<TR>  <th><b>Gene Family<BR>Name:</b></th>
    <th><b>Protein Name:</b></th>
    <th><b>Genomic Locus:</b></th>
    <th><b>Accession:</b></th>
     <th><B>TIGR Annotation:</b></th>
   </TR>
	  

<tr class="alt">  <A NAME="Adenine"><TD ROWSPAN=3 valign=top><B>Adenine phosphoribosyltransferase 1<BR>APRT family</B></TD></A>
    <TD>&nbsp;</TD>
	<TD>F18B13_14<BR>At1g80050</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S71272">S71272</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80050">adenine phosphoribosyltransferase</a></TD></TR> 	

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F2I11_50<BR>AT5g11160</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8953378">CAB96651</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g11160">adenine phosphoribosyltransferase - like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F17L21_25<BR>At1g27450</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S20867">S20867</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27450">adenine phosphoribosyltransferase 1, APRT</a></TD></TR>

<TR>  <TD ROWSPAN=4 valign=top><A NAME="ABA"><B>Similarity to Triticum ABA induced<BR>membrane protein family</B></TD></A>
	<TD>&nbsp;</TD>
	<TD>T1G11_18<BR>At1g04560</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2494121">AAB80630</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04560">unknown protein</a></TD></TR>
	
<TR>  <TD>&nbsp;</TD>
	<TD>K11I1_12<BR>AT5g46530</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177590">BAB10821</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g46530">putative protein</a></TD></TR> 	

<TR>  <TD>&nbsp;</TD>
	<TD>T16G12_10<BR>AT5g18970</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g18970">plasma membrane associated protein -like</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F15D2_10<BR>At1g29520</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B86418">B86418</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29520">plasma membrane associated protein, putative</a></TD></TR>


<tr class="alt">  <TD ROWSPAN=3 valign=top><A NAME="Alpha"><B>Alpha/beta hydrolase fold family</B></A></TD>
    <TD>&nbsp;</TD>
	<TD>F5I6_3<BR>At1g80280</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12324976">AAG52432</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80280">unknown protein</a></TD></TR>  

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T16N11_23<BR>At1g15490</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5103847">AAD39677</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15490">unknown protein</a></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F14G24_2<BR>At1g52750</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E96568">E96568</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g52750">unknown protein</a></TD></TR>	


<TR>  <TD ROWSPAN=9 valign=top><A NAME="Synaptobrevin"><B>Synaptobrevin -like protein family</B></A></TD>
    <TD>&nbsp;</TD>
	<TD>F13M7_22<BR>At1g04760</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04760">synaptobrevin 7B, putative </a></TD></TR>
	  
<TR>  <TD>&nbsp;</TD>
	<TD>F2I11_40<BR>AT5g11150</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8953377">CAB96650</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g11150">putative protein</a></TD></TR>
	
<TR>  <TD>&nbsp;</TD>
	<TD>F24B22_260<BR>AT3g54300</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6822076">CAB71004</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g54300">synaptobrevin -like protein</a></TD></TR>  

<TR>  <TD>&nbsp;</TD>
	<TD>MWD9_16<BR>AT5g22360</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757817">BAB08335</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g22360">synaptobrevin-like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F24L7.19<BR>At2g32670</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2914706">AAC04496</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32670">putative synaptobrevin </a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T22F11.7<br>At2g25340</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4567243">AAD23657</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25340">putative synaptobrevin</a></TD></TR>	
	
<TR>  <TD>&nbsp;</TD>
	<TD>F25I18.14<BR>At2g33120</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2924792">AAC04921</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33120">putative synaptobrevin </a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F10N7_40<BR>AT4g32150</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7270119">CAB79933</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g32150">synaptobrevin-like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T1G11_1<BR>At1g04740</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2494115"> AAB80624</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04740"> putative auxin-induced protein</a></TD></TR>

<tr class="alt">  <TD ROWSPAN=22 valign=top><A NAME="Blue"><B>Blue copper binding protein family</B></A></TD>
    <TD>&nbsp;</TD>
	<TD>K10D20_10<BR>AT3g20570</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=11994144"> BAB01165</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g20570">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>K19P17_3<BR>AT5g53870</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177249">BAB10717</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g53870">putative protein</a></TD></TR>	

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F27J15_27<BR>At1g48940</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7770336">AAF69706</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48940">phytocyanin, putative</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F27H5_60<BR>AT3g60270</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7576203"> CAB87864</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g60270">stellacyanin (uclacyanin 3) - like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F27H5_70<BR>AT3g60280</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3395770">AAC32461</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g60280">uclacyanin 3</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T29A15_10<BR>AT4g27520</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4469003">CAB38264</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g27520"> hypothetical protein</a></TD></TR>	

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F5O24_120<BR>AT5g20230</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g20230">blue copper binding protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T16B12.14<BR>At2g31050</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3746072">AAC63847</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31050">putative blue copper-binding protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T4P13_25<BR>AT3g01070</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6714481">AAF26167</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01070">putative lamin</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T29E15.19<BR>At2g23990</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3738326">AAC63667</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g23990">nodulin-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T32F6.18<BR>At2g32300</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3399767">AAC32038</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32300">putative uclacyanin I</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F27C12.2<BR>At2g25060</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4559346">AAD23007</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25060"> putative peroxidase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F17I23_70<BR>AT4g30590</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7269960">CAB79777</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g30590">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F8M21_240<BR>AT5g15350</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S71273">S71273</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g15350">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F11C18_40<br>AT4g31840</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4584523">CAB40754</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g31840">putative protein</a></TD></TR>
	
<tr class="alt">  <TD>&nbsp;</TD>
	<TD>K24M9_8<BR>AT3g18590</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294320">BAB02217</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g18590">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F18A8.9<BR>At2g26720</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2760838">AAB95306 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26720">putative phytocyanin </a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F8B4_190<BR>AT4g32490</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4049351">CAA22576</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g32490">nodulin - like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F20B17_22<BR>At1g79800</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7715594">AAF68112</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79800">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F9D12_16<BR>AT5g26330</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3319353">AAC26242</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g26330">copper binding - like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F12K8_17<BR>At1g22480</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6587840">AAF18529</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22480">uclacyanin II, putative </a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>K17E12_2<BR>AT3g27200</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294213">BAB02115</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g27200">blue copper protein</a></TD></TR>	

<TR>  <TD ROWSPAN=5 valign=top><a name="Secretory_carrier"><B>Secretory carrier membrane protein family</B></a></TD>
    <TD>&nbsp;</TD>
	<TD>T12O21_5<BR>At1g32050</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12321473">AAG50798</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32050">hypothetical protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F11P17_4<BR>At1g61250</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7109228">AAF36686</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61250">secretory carrier membrane protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T28P6_13<BR>At1g11180</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11180">secretory carrier membrane protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F21B7_17<BR>At1g03550</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9280663">AAF86532</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g03550">unknown protein</a></TD></TR>
	
<TR>  <TD>&nbsp;</TD>
	<TD>F5H14.19<BR>At2g20840</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4454464">AAD20911</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g20840">putative secretory carrier-associated membrane protein</a></TD></TR>

<tr class="alt">  <TD ROWSPAN=12 valign=top><a name="Wax"><B>Wax synthase-like protein family</B></a></TD>
    <TD>&nbsp;</TD>
	<TD>F4F15_80<BR>AT3g51970</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4678926">CAB41317</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g51970">wax synthase-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MTE17_3<BR>AT5g55320</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758164">BAB08549</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55320">wax synthase-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MTE17_4<BR>AT5g55330</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758165"> BAB08550</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55330">wax synthase-like protein</a></TD></TR>
	
<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MTE17_5<BR>AT5g55340</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758166">BAB08551</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55340">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MTE17_6<BR>AT5g55350</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758167">BAB08552</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55350">wax synthase-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MTE17_7<BR>AT5g55360</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758168">BAB08553</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55360">wax synthase-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MTE17_8<BR>AT5g55370</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758169">BAB08554</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55370">wax synthase-like protein</a></TD></TR>
	
<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MTE17_9<BR>AT5g55380</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758170">BAB08555</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55380">wax synthase-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F12K21_14<BR>At1g34520</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34520">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F12K21_16<BR>At1g34500</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34500">hypothetical protein </a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F12K21_17<BR>At1g34490</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34490">hypothetical protein </a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MFG13_13<BR>AT5g51420</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759288">BAB09753</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g51420">putative protein</a></TD></TR>

<TR>  <TD ROWSPAN=5 valign=top><a name="Germin-like"><B>Germin-like protein family</B></a></TD>
    <TD>&nbsp;</TD>
	<TD>MXF12_140<BR>AT5g39130</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177555">BAB10834</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g39130">germin - like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>K3K3_10<BR>AT5g39160</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758844">BAB09370</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g39160">germin-like protein (GLP2a) copy1</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F10A16_23<BR>AT3g05930</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g05930">germin-like protein </a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T1M15_30<BR>AT5g20630</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g20630">germin-like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F28P22_20<BR>At1g72610</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12323768">AAG51848</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72610">germin-like protein</a></TD></TR>

<tr class="alt">  <TD ROWSPAN=14 valign=top><a name="Mlo"><B>Similar to Mlo proteins family</B></a></TD>
    <TD>&nbsp;</TD>
	<TD>MGN6_12<BR>AT5g53760</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759070">BAB09548</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g53760">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F18N11_50<BR>AT3g45290</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6967095">CAB72478</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g45290">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T24P13_7<BR>At1g26700</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9295722"> AAF87028</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26700">Mlo protein, putative</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T16B24.16<BR>At2g39200</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3402694">AAC28997</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39200">similar to Mlo proteins from H. vulgare </a></TD></TR>	
	
<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T25B24_9<BR>At1g61560</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4585879"> AAD25552</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61560">Mlo protein, putative</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F5J6.19<BR>At2g17430</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=6598336&dopt=GenPept">AAB86520</A></TD>
    <TD>&nbsp;</TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MJB20.4<BR>At2g17480</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4914369"> AAD32905</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g17480">similar to Mlo proteins from H. vulgare </a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F8D11_2<BR>At1g42560</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E96495">E96495</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g42560"> pseudogene</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T22A6_80<BR>AT4g24250</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5051767">CAB45060</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g24250">Mlo-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>K2A18_3<BR>AT5g65970</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12541091">CAC25082</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g65970">Mlo protein-like</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F4P9.44<BR>At2g33670</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6598814">AAC69142</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33670">putative thioredoxin</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T28P6_23<BR>At1g11310</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11310">Mlo protein, putative</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F6E13.24<BR>At2g44110</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&list_uids=3212880&dopt=GenPept">AAC23431</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44110">similar to Mlo proteins from H. vulgare</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T10P11_12<BR>AT4g02600</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3892049">AAC78258</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g02600">AtMlo-h1-like protein</a></TD></TR>


<TR><TD ROWSPAN=1 valign=top><a name="Root Cap 1"><B>Root Cap 1 </B></a></TD>  <TD>&nbsp;</TD>
    <TD> K3M16_90<BR>AT5g17520</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9755776">CAC01896</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g17520">root cap 1 (RCP1)</a></TD></TR>
	
<tr class="alt">  <TD ROWSPAN=14 valign=top><a name="Bax"><B>Bax inhibitor-1 / TEGT protein homolog family</B></a></TD>
    <TD>&nbsp;</TD>
	<TD>F10E10_8<BR>AT5g46600</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8885601">BAA97531</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g46600">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F10E10_9<BR>AT5g46610</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8885602">BAA97532</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g46610">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F2J7_18<BR>At1g25480</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A86385">A86385</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g25480">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F15H18_11<BR>At1g18420</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18420">unknown protein </a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F24J5_14<BR>At1g68600</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68600">unknown protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T27G7_22<BR>At1g08430</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08430">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T27G7_25<BR>At1g08440</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08440">hypothetical protein </a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MJB20.3<BR>At2g17470</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4914368">AAD32904</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g17470"> putative RING zinc finger protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>A_TM018A10_3<BR>AT4g00910</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01555">T01555</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g00910">not found</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MYF24_15<BR>AT3g18440</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=11994107">BAB01110</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g18440">unknown protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T19F11_8<BR>AT3g11680</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6041820">AAF02135</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g11680">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>AT4g17585<BR>AT4g17585</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g17585">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T6K21_150<BR>AT4g17970</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T05083">T05083</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g17970">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F12K2.18<BR>At2g27240</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E84670">E84670</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g27240">hypothetical protein</a></TD></TR>

<TR>  <TD ROWSPAN=15 valign=top><a name="beta-keto"><B>Strong similarity to beta-keto-Coa synthase family</B></a></TD>      <TD>&nbsp;</TD>
	<TD>F4F15_270<BR>AT3g52160</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4678945">CAB41336</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g52160">beta-ketoacyl-CoA synthase like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T3A4.10<BR>At2g46720</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3831446">AAC69929</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46720">putative extensin</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F10M10_20<BR>AT4g34250</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7270375">CAB80142 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g34250">fatty acid elongase - like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T4L20_90<BR>AT4g34510</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7270401">CAB80168</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g34510">putative ketoacyl-CoA synthase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T4L20_100<BR>AT4g34520</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7270402">CAB80169</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g34520">fatty acid elongase 1</a></TD></TR>	

<TR>  <TD>&nbsp;</TD>
	<TD>T15J14.13<BR>At2g15090</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15090">putative fatty acid elongase </a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F2J7_9<BR>At1g25450</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4115364">AAD03366</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g25450">hypothetical protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F16F14.22<BR>At2g16280</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F84538">F84538</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16280">putative beta-ketoacyl-CoA synthase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T26J14_10<BR>At1g68530</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12324880">AAG52390</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68530">very-long-chain fatty acid condensing enzyme (CUT1)</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F18O14_5<BR>At1g19440</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19440">very-long-chain fatty acid condensing enzyme CUT1</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F14P13_12<BR>AT3g10280</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6056197">AAF02814</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g10280">putative fatty acid elongase 3-ketoacyl-CoA synthase 1</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>MQD19_11<BR>AT5g43760</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177945">BAB11304</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g43760">beta-ketoacyl-CoA synthase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T1D16.11<BR>At2g26250</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12597467">AAG60062</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26250">beta-ketoacyl-CoA synthase (FIDDLEHEAD) </a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F18A8.1<BR>At2g26640</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2760830">AAB95298</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26640">putative beta-ketoacyl-CoA synthase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F20D22_1<BR>At1g04220</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3142289">AAC16740</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04220"> unknown protein</a></TD></TR>

<tr class="alt">  <TD ROWSPAN=12 valign=top><a name="endosomal"><B>Putative endosomal protein family</B></a></TD>
    <TD>&nbsp;</TD>
	<TD>MMM17_22<BR>AT3g13772</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294023">BAB01926 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g13772">multispanning membrane protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T1P17_240<BR>AT4g12650</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267967">CAB78308</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g12650">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T30N20_110<BR>AT5g10840</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8979718">CAB96839</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g10840">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F14H20.4<BR>At2g01970</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4406780">AAD20090 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01970">putative endosomal protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T25C13_40<BR>AT5g35160</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176814"> BAB10022</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g35160">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F27D4.8<BR>At2g24170</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D84633">D84633</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24170"> unknown proteinAt2g01970	F14H20.4	putative endosomal proteinAt2g26640	F18A8.	 putative beta-ketoacyl-CoA synthaseAt2g26250	T1D16.11	beta-ketoacyl-CoA synthase (FIDDLEHEAD)</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T27G7_4<BR>At1g08350</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6664322">AAF22904</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08350">unknown protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MNJ8_100<BR>AT5g37310</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758717">BAB09103</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g37310">multispanning membrane protein - like</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T11H3_110<BR>AT5g25100</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T50793">T50793</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g25100">putative multispanning membrane protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T19D16_13<BR>At1g10950</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1931647">AAB65482</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10950">endomembrane protein EMP70 precusor isolog</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F10B6_21<BR>At1g14670</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D84431">D84431</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14670">endomembrane protein, putative</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T7N22_7<BR>At1g55130</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12321575">AAG50838</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55130">hypothetical protein</a></TD></TR>

<TR>  <TD ROWSPAN=11 valign=top><a name="Senescence"><B>Senescence-associated protein homolog family</B></a></TD>
    <TD>&nbsp;</TD>
	<TD>MZA15_11<BR>AT5g46700</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758506">BAB08914</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g46700">senescence-associated protein 5-like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T13J8_160<BR>AT4g28050</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7269659">CAB79607</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g28050">senescence-associated protein -like</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F15H18_22<BR>At1g18520</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18520">hypothetical protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F27L4.1<BR>At2g23810</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02338">T02338</A></TD>
    <TD>&nbsp;</TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T18C20.4<BR>At2g03840</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4582432">AAD24818</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g03840">putative senescence-associated protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>MYJ24_2<BR>AT5g23030</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759361">BAB09820</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g23030">senescence-associated protein 5-like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F17I23_230<BR>AT4g30430</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7269944">CAB79761</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g30430">senescence-associated protein homolog</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F16G20_110<BR>AT4g23410</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7269189">CAB79296</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g23410">hypothetical protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F3P11.18<BR>At2g19580</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E84578">E84578</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19580">putative senescence-associated protein 5</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T21B14_110<BR>AT3g12090</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12322011">AAG51049</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g12090">senescence-assocated protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>f15l12_80<BR>AT5g60220</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8885573">BAA97503</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g60220">senescence-associated protein - like</a></TD></TR>

<tr class="alt">  <TD ROWSPAN=13 valign=top><a name="Pglucosyltransferase"><B>Putative glucosyltransferase family</B></a></TD>
    <TD>&nbsp;</TD>
	<TD>T20F21.16<BR>At2g35650</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4263795">AAD15455</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g35650">putative glucosyltransferase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F5O8_4<BR>At1g23480</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D86368">D86368</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23480">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MIG10_4<BR>AT3g28180</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9279781">BAB01433</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g28180">unknown protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T9E8_150<BR>AT4g13410</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4584546">CAB40776</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g13410">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T23E23_17<BR>At1g24070</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9369401">AAF87149</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24070">glucosyltransferase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F21O3_4<BR>AT3g07330</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6041835">AAF02144</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07330">unknown protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F17C15_180<BR>AT5g03760</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7340661">CAB82941</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g03760">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F1K3_3<BR>AT4g07960</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4309698">AAD15482</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g07960">putative glucosyltransferase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MDJ22_16<BR>AT5g22740</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10178248">BAB11680</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g22740">glucosyltransferase-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F25P17.7<BR>At2g24630</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4572669">AAD23884</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24630">putative glucosyltransferase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F27K19_180<BR>AT3g56000</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7573495">CAB87854</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g56000">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>dl4320w<BR>AT4g16590</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2245014">CAB10434</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g16590">cellulose synthase like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F28M20_220<BR>AT4g31590</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3281868">CAA19764</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g31590">putative protein </a></TD></TR>

<TR>  <TD ROWSPAN=2 valign=top><a name="Glucosyltransferase"><B>Glucosyltransferase like protein family</B></a></TD>
    <TD>&nbsp;</TD>
	<TD>T20F21.10<BR>At2g35710</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4263784">AAD15444</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g35710">putative glycogenin</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>dl4325w<BR>AT4g16600</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2245015">CAB10435</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g16600">glucosyltransferase like protein</a></TD></TR>

<tr class="alt">    <TD ROWSPAN=7 valign=top><a name="Vacuolar"><B>Vacuolar sorting receptor family</B></a></TD>
	<TD>&nbsp;</TD>
	<TD>F8J2_20<BR>AT3g52850</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1839244"> AAB46988</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g52850">Spot 3 protein and vacuolar sorting receptor homolog/AtELP1</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F18F4_210<BR>AT4g20110</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04895">T04895</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g20110">vacuolar sorting receptor-like protein</a></TD></TR>

<TR bgcolor=
D5D9DD >  <TD>&nbsp;</TD>
	<TD>T9D9.10<BR>At2g30290</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2347209">AAC16948 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30290"> putative vacuolar sorting receptor</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F26C24.14<BR>At2g14720</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3252815">AAC24185</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g14720">putative vacuolar sorting receptor </a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F26C24.12<BR>At2g14740</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02602">T02602</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g14740">putative vacuolar sorting receptor</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F17F8_23<BR>At1g30900</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9755389">AAF98196</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30900">unknown protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F19I3.17<BR>At2g34940</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3033390">AAC12834 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34940">putative vacuolar sorting receptor</a></TD></TR>

<TR>  <TD ROWSPAN=2 valign=top><a name="Fructose-bis"><B>Fructose-bisphosphate aldolase family</B></a></TD>  <TD>&nbsp;</TD>
	<TD>F8J2_100<BR>AT3g52930</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7529717">CAB86897</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g52930">fructose bisphosphate aldolase - like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F17C15_110<BR>AT5g03690</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7340654">CAB82934</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g03690">fructose-bisphosphate aldolase -like protein</a></TD></TR>	

<tr class="alt">  <TD ROWSPAN=2 valign=top><a name="Nuclear"><B>Nuclear envelope membrane protein-like family</B></a></TD>
    <TD>&nbsp;</TD>
	<TD>F8J2_111<BR>AT3g52940</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7340654">CAB82934</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g52940">nuclear envelope membrane protein - like</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F11F12_22<BR>At1g50430</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F96540">F96540</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g50430">sterol delta7 reductase</a></TD></TR>

<TR>  <TD ROWSPAN=4 valign=top><a name="Nucleotide"><B>Nucleotide sugar epimerase -like family</B></a></TD>  <TD>&nbsp;</TD>
	<TD>T4C9_90<BR>AT4g12250</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267926"> CAB78268</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g12250">nucleotide sugar epimerase -like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F22M8_12<BR>At1g02000</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A86152">A86152</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02000">nucleotide sugar epimerase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F14O13_1<BR>AT3g23820</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294651">BAB03000</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g23820">NAD dependent epimerase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F6N15_16<BR>AT4g00110</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01339">T01339</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g00110">putative nucleotide sugar epimerase</a></TD></TR>

<tr class="alt">  <TD ROWSPAN=8 valign=top><a name="FRO1-like"><B>FRO1-like protein; NADPH oxidase-like family</B></a></TD>
    <TD>&nbsp;</TD>
	<TD>F19G10_4<BR>At1g23020</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2462833"> AAB72168</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23020">putative superoxide-generating NADPH oxidase flavocytochrome</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F22L4_8<BR>At1g01580</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4049399">CAA70770</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01580">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F22L4_9<BR>At1g01590</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F86146">F86146</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01590">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>K2I5_9<BR>AT5g49730</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8978270">BAA98161</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g49730">FRO2-like protein; NADPH oxidase-like</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>K2I5_10<BR>AT5g49740</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8978271">BAA98162</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g49740">FRO1-like protein; NADPH oxidase-like</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>K6A12_2<BR>AT5g50160</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759018">BAB09387</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g50160">FRO1 and FRO2-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MZF18_14<BR>AT5g23980</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758222">BAB08721 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g23980">FRO2 homolog</a></TD></TR>

<TR bgcolor=
D5D9DD >  <TD>&nbsp;</TD>
	<TD>MZF18_13<BR>AT5g23990</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758223"> BAB08722</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g23990">FRO2 homolog</a></TD></TR>

<TR>  <TD ROWSPAN=10 valign=top><a name="Respiratory"><B>Respiratory burst oxidase family</B></a></TD>     <TD>&nbsp;</TD>
	<TD>F16L2_20<BR>AT3g45810</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7339482">CAB82805</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g45810">respiratory burst oxidase - like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>MCA23_25<BR>AT5g47910</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177927">BAB11338</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g47910">respiratory burst oxidase protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T29M8_8<BR>At1g19230</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3242787">AAC39478</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19230">respiratory burst oxidase protein, putative</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F7G19_27<BR>At1g09090</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3242783">AAC39476</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09090">putative respiratory burst oxidase protein B</a></TD></TR>

	<TR>  <TD>&nbsp;</TD>
	<TD>K3K7_25<BR>AT5g51060</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758253">BAB08752 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g51060">respiratory burst oxidase protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T2I1_100<BR>AT5g07390</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7576177">CAB87928</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07390">respiratory burst oxidase protein A</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F22C12_8<BR>At1g64060</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2654868">AAB87789</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64060">cytochrome b245 beta chain homolog RbohAp108, putative</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F13M23_230<BR>AT4g25090</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7269359"> CAB79418</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25090">respiratory burst oxidase - like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>mmn10_230<BR>AT5g60010</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757922">BAB08369</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g60010">respiratory burst oxidase protein - like</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F8L21_20<BR>AT4g11230</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5596469">CAB51407</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g11230">respiratory burst oxidase homolog F - like protein</a></TD></TR>

<tr class="alt"><TD ROWSPAN=1 valign=top><a name="Putative peroxidase"><B>Putative peroxidase </B></a></TD>  <TD>&nbsp;</TD>
    <TD>F20B18_90<BR>AT4g25980</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7269449">CAB79453</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25980">putative peroxidase</a></TD></TR>	
	
<TR>  <TD ROWSPAN=7 valign=top><a name="ER"><B>Putative ER lumen protein retaining receptor family</B></a></TD>
    <TD>&nbsp;</TD>
	<TD>F26H11.5<BR>At2g21190</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4803924">AAD29797</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21190">putative ER lumen protein retaining receptor</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F10A5_13<BR>At1g75760</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9369358">AAF87107</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75760">ER lumen protein retaining receptor, putative</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T20H2_23<BR>At1g19970</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B86333">B86333</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19970">ER lumen protein-retaining receptor</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>K3G3_5<BR>AT3g25040</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9293986"> BAB01889</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g25040">ER lumen retaining receptor (HDEL receptor)</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>MJL12_10<BR>AT3g25160</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294172">BAB02074</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g25160">ER lumen protein retaining receptor</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T9A14_70<BR>AT4g38790</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T06078">T06078</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38790">hypothetical protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F15D2_26<BR>At1g29330</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12323512">AAG51724</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29330">ER lumen protein retaining receptor</a></TD></TR>

<tr class="alt">  <TD ROWSPAN=3 valign=top><a name="kinesin"><B>Putative kinesin heavy chain family</B></a></TD>    <TD>&nbsp;</TD>
	<TD>F3K23.14<BR>At2g21380</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E84600">E84600</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21380">putative kinesin heavy chain</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F15M7_20<BR>AT5g06670</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10178123">BAB11416</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g06670">kinesin heavy chain-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F19H22_150<BR>AT4g39050</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7270888">CAB80568</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g39050">kinesin like protein</a></TD></TR>

<TR>  <TD ROWSPAN=8 valign=top><a name="mildew"><B>Downy mildew resistance-like protein family</B></a></TD>  <TD>&nbsp;</TD>
	<TD>F18F4_20<BR>AT4g19920</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268786">CAB78992</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19920">downy mildew resistance-like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T8F5_18<BR>At1g65390</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3335346">AAC27148</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65390">disease resistance protein RPS4, putative</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>T8L23_14<BR>At1g57670</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A96611">A96611</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g57670">disease resistance protein RPS4</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>F12K22_13<BR>At1g57830</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=11079527"> AAG29237</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g57830">disease resistance protein RPS4, putative </a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>K21C13_8<BR>AT5g44900</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177481">BAB10872</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g44900">putative protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>K21C13_9<BR>AT5g44910</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177482">BAB10873</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g44910">putative protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>K21C13_10<BR>AT5g44920</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177483">BAB10874</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g44920">putative protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
	<TD>K18C1_10<BR>AT5g45220</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759607">BAB11395</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g45220">putative protein</a></TD></TR>

<tr class="alt">  <TD ROWSPAN=5 valign=top><a name="Cell"><B>Cell division protein FtsH-like protein family</B></a></TD>  <TD>&nbsp;</TD>
	<TD>T9I4.16<BR>At2g29080</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3461848">AAC33234</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29080">putative protein kinase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F13I12_110<BR>AT3g47060</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6522587">CAB61952</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47060">FtsH metalloprotease - like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F16B3_8<BR>AT3g02450</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6957708">AAF32452</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g02450">cell division protein FtsH-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>k19m22_70<BR>AT5g58870</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759220">BAB09632</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g58870">cell division protein - like</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>MFH8_11<BR>AT5g53170</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757998">BAB08420</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g53170">cell division protein FtsH protease-like</a></TD></TR>	

<TR>  <TD ROWSPAN=8 valign=top><a name="tropinone"><B>Putative tropinone reductase family</B></a></TD>
    <TD>&nbsp;</TD>
    <TD>F16P2.47<BR>At2g29150</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3980416">AAC95219</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29150">putative tropinone reductase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F16P2.33<BR>At2g29290</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3980405">AAC95208</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29290">putative tropinone reductase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F16P2.31<BR>At2g29310</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3980404">AAC95207</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29310">putative tropinone reductase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F16P2.30<BR>At2g29320</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3980403">AAC95206</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29320">putative tropinone reductase</a></TD></TR>	

<TR>  <TD>&nbsp;</TD>
    <TD>F16P2.29<BR>At2g29330</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3980402">AAC95205</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29330">putative tropinone reductase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F16P2.28<BR>At2g29340</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3980401">AAC95204</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29340">putative tropinone reductase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F22G5_16<BR>At1g07440</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=13605591">AAK32789</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07440">tropinone reductase-I</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>T1J24_9<BR>AT4g05530</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E85069">E85069</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g05530">not found</a></TD></TR>

<tr class="alt">  <TD ROWSPAN=4 valign=top><a name="AtRER1C"><B>AtRER1C family</B></a></TD>
    <TD>&nbsp;</TD>
    <TD>F2G1.13<BR>At2g21600</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4567230"> AAD23645</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21600"> unknown protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T20D16.6<BR>At2g23310</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00501">T00501</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g23310">putative integral membrane protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T30D6.25<BR>At2g18240</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4309742"> AAD15512</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18240">putative integral membrane protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T22F8_120<BR>AT4g39220</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4914434">CAB43637</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g39220">AtRer1A</a></TD></TR>

<TR>  <TD ROWSPAN=2 valign=top><a name="Calnexin"><B>Calnexin homolog family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>mac9_90<BR>AT5g61790</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=16211">CAA79144</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g61790">calnexin - like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>T2I1_50<BR>AT5g07340</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7576172"> CAB87923</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07340">calnexin homolog</a></TD></TR>
<tr class="alt">  <TD ROWSPAN=3 valign=top><a name="P_expan"><B>Putative expansin family</B></a></TD>
    <TD>&nbsp;</TD>
	<TD>T9I4.3<BR>At2g28950</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3461837">AAC33223</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28950">putative expansin</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>T1E22_20<BR>AT5g02260</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7406422">CAB85531</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g02260">expansin precursor - like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
	<TD>F13M22.14<BR>At2g37640</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3236246">AAC23634</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37640">putative expansin</a></TD></TR>	

<TR>  <TD ROWSPAN=5 valign=top><a name="Alternative"><B>Alternative oxidase family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>MGF10_2<BR>AT3g27620</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294467">BAB02686</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g27620">alternative oxidase 1c precursor</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F27G20_12<BR>At1g32350</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C86448">C86448</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32350">oxidase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>MCB17_9<BR>AT3g22360</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2506082">BAA22624</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g22360">alternative oxidase 1b precursor</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>MCB17_10<BR>AT3g22370</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2506083">BAA22625</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g22370">alternative oxidase 1a precursor</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>MSJ1_5<BR>AT5g64210</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759397"> BAB09852</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64210">alternative oxidase 2 (sp|O22049)</a></TD></TR>

<tr class="alt">  <TD ROWSPAN=8 valign=top><a name="Ankyrin-like p"><B>Ankyrin-like protein family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T22P11_210<BR>AT5g02620</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7413651">CAB85999</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g02620">ankyrin - like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F3F20_9<BR>At1g05640</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4836914">AAD30616</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05640">unknown protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T8O11.15<BR>At2g01680</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4220480">AAD12703</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01680">unknown protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F24B9_17<BR>At1g07710</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8439897"> AAF75083</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07710">hypothetical protein </a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F20M17.14<BR>At2g31820</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4887754">AAD32290</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31820">ankyrin-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F11F8_13<BR>AT3g09550</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6682234">AAF23286</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g09550">putative ankyrin</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T2E22_133<BR>AT3g12360</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12321945">AAG51002</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g12360">ankyrin-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>mgo3_40<BR>AT5g60070</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8777346">BAA96936</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g60070">ankyrin-like protein</a></TD></TR>




<TR><TD ROWSPAN=4 valign=top><a name="yrin-like"><B>Ankyrin-like protein family</B></a></TD>
 <TD>&nbsp;</TD>
    <TD>K5F14_6<BR>AT5g54710</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176798">BAB09937</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g54710">putative protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F12G12_160<BR>At1g34050</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D86464">D86464</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34050">hypothetical protein </a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>MPF21_16<BR>AT5g50140</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177225">BAB10300</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g50140">ankyrin-like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F14N23_22<BR>At1g10340</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4914336">AAD32884</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10340">hypothetical protein</a></TD></TR>
	
<tr class="alt"><TD ROWSPAN=6 valign=top><a name="Ankyrin-repeat"><B>Ankyrin-repeat-containing protein-like family</B></a></TD>
 <TD>&nbsp;</TD>
    <TD>MRB17_11<BR>AT5g54610</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758953">BAB09340</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g54610">ankyrin-repeat-containing protein-like</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MRB17_12<BR>AT5g54620</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758954">BAB09341</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g54620">ankyrin-repeat-containing protein-like</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T20K14_110<BR>AT5g15500</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9755805">CAC01749</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g15500">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T12H20_11<BR>AT4g10720</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A85112">A85112</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g10720">putative ankyrin-repeat-containing protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F14L17_30<BR>At1g14480</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F86279">F86279</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14480">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F14L17_24<BR>At1g14500</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H86279">H86279</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14500">hypothetical protein</a></TD></TR>

<TR>  <TD ROWSPAN=2 valign=top><a name="Carnitine racemase"><B>Carnitine racemase like family</B></a></TD>
 <TD>&nbsp;</TD>
    <TD>F5I14_5<BR>At1g65520</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2190542">AAB60906</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65520">hypothetical protein </a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>dl3260c<BR>AT4g14440</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2244800"> CAB10223</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g14440">carnitine racemase like protein</a></TD></TR>
	
<tr class="alt"><TD ROWSPAN=16 valign=top><a name="MTN3-like"><B>MTN3-like protein family</B></a></TD> 
 <TD>&nbsp;</TD>
    <TD>MSN9_160<BR>AT5g40260</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177513">BAB10907</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g40260">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T21E2_2<BR>AT3g14770</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=11994587">BAB02642</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g14770">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MQB2_150<BR>AT5g62850</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177463"> BAB10854</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g62850">LIM7 - like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F4N21_10<BR>At1g66770</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12597757">AAG60070</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66770">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T19L5_130<BR>AT5g13170</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9955561">CAC05445</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g13170">senescence-associated protein (SAG29)</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T7F6.23<BR>At2g39060</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3928090">AAC79616</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39060"> unknown protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MGL6_14<BR>AT3g16690</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=11994624">BAB02761</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g16690">MtN3-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T8P19_250<BR>AT3g48740</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=13605688">AAK32837</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g48740">MTN3-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>dl4000c<BR>AT4g15920</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268340">CAB78634</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15920">cytochrome c oxidoreductase like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MFB16_19<BR>AT5g50790</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8777402">BAA96992</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g50790">MtN3-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>K7B16_1<BR>AT5g50800</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758527">BAB08903</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g50800">MtN3-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MQM1_8<BR>AT5g23660</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8809694">BAA97235</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g23660">MtN3-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F24J8_29<BR>At1g21460</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9454576">AAF87899</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g21460">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F13M23_150<BR>AT4g25010</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4455244">CAB36743</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25010">MtN3 - like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F25I24_60<BR>AT4g10850</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04280">T04280</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g10850">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MFH8_13<BR>AT5g53190</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758000">BAB08422</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g53190">MtN3 protein-like</a></TD></TR>



<TR><TD ROWSPAN=3 valign=top><a name="Disease resistance"><B>Disease resistance protein family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F9E11_4<BR>At1g74190</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12323812">AAG51871</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74190">disease resistance protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F9E11_6<BR>At1g74180</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A96770">A96770</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74180">disease resistance protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>T4D2_170<BR>AT3g53240</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6630744">CAB64227</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g53240">disease resistance - like protein</a></TD></TR>

<tr class="alt"> <TD ROWSPAN=3 valign=top><a name=" 3-hydroxyisobutyryl"><B> 3-hydroxyisobutyryl-coenzyme A hydrolase family</B></a></TD> <TD>&nbsp;</TD>
    <TD>T8B10_170<BR>AT3g60510</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7287999">CAB81837</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g60510">enoyl-CoA-hydratase - like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T11J7.4<BR>At2g30650</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A84711">A84711</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30650"> unknown protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>K14B20_11<BR>AT5g65940</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759578">BAB11141</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g65940">3-hydroxyisobutyryl-coenzyme A hydrolase</a></TD></TR>

<TR><TD ROWSPAN=2 valign=top><a name="ribophorin I"><B>Putative ribophorin I family </B></a></TD>  <TD>&nbsp;</TD>
    <TD>T8O11.11<BR>At2g01720</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4220476">AAD12699</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01720">putative ribophorin I</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F15M4_10<BR>At1g76400</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F96791">F96791</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76400">putative ribophorin I (dolichyl-diphosphooligosaccharide-protein glycosyltransferase) </a></TD></TR>

<tr class="alt"><TD ROWSPAN=3 valign=top><a name="Cinnamyl alcohol"><B>Cinnamyl alcohol dehydrogenase family</B></a></TD>
 <TD>&nbsp;</TD>
    <TD>M4I22_60<BR>AT4g27250</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3269286">CAA19719</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g27250">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F7K24_190<BR>AT5g19440</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C96552">C96552</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g19440">cinnamyl-alcohol dehydrogenase - like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F14J9_17<BR>At1g09510</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3482926">AAC33211</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09510">putative cinnamyl alcohol dehydrogenase</a></TD></TR>

<TR><TD ROWSPAN=3 valign=top><a name="RING zinc"><B>putative RING zinc finger protein family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F1M20_5<BR>At1g74370</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12324808">AAG52370</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74370">putative RING zinc finger protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD> MMF24_2<BR>AT3g29270</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=11994767">BAB03123</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g29270">unknown protein </a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F23O10_9<BR>At1g69330</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12325097">AAG52506</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69330">unknown protein</a></TD></TR>

<tr class="alt"> <TD ROWSPAN=3 valign=top><a name="Xyloglucan"><B>Xyloglucan fucosyltransferase family</B></a></TD>
 <TD>&nbsp;</TD>
    <TD>F1M20_10<BR>At1g74420</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A96773">A96773</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74420">putative xyloglucan fucosyltransferase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T18E12.12<BR>At2g03210</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3548809">AAC34481</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g03210">unknown protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F16A14_19<BR>At1g14070</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A86274">A86274</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14070">hypothetical protein</a></TD></TR>

<TR><TD ROWSPAN=2 valign=top><a name="Actin f"><B>Actin family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F5K20_50<BR>AT3g53750</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1145695">AAA98562</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g53750">actin (ACT3)</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>T6D20.1<BR>At2g42100</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6598382">AAF18605</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42100">putative actin </a></TD></TR>

<tr class="alt"><TD ROWSPAN=2 valign=top><a name="presenilin"><B>Putative presenilin homolog family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F6K5.3<BR>At2g29900</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4567215">AAD23630</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29900">putative presenilin</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F22O13_18<BR>At1g08700</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9802574">AAF99776</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08700">unknown protein</a></TD></TR>

<TR><TD ROWSPAN=4 valign=top><a name="Reticuline"><B>Reticuline oxidase-like family</B></a></TD>
 <TD>&nbsp;</TD>
    <TD>F21C20_170<BR>AT4g20820</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268878">CAB79082</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g20820">reticuline oxidase - like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F22M8_10<BR>At1g01980</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G86151">G86151</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01980">hypothetical protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>T5I8_18<BR>At1g30730</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H86432">H86432</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30730">putative reticuline oxidase-like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>T5I8_22<BR>At1g30760</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D86433">D86433</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30760">putative reticuline oxidase-like protein</a></TD></TR>

<tr class="alt"><TD ROWSPAN=2 valign=top><a name="Ethylene-reg"><B>Ethylene-regulated nuclear protein ERT2-like family</B></a></TD>
 <TD>&nbsp;</TD>
    <TD>T13K14_40<BR>AT4g20880</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268884">CAB79088</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g20880">ethylene-regulated transcript 2 (ERT2)</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>K9L2_14<BR>AT5g44350</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176890">BAB10120</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g44350">ethylene-regulated nuclear protein ERT2-like protein</a></TD></TR>

<TR><TD ROWSPAN=3 valign=top><a name="DNAJ"><B>Homology to DNAJ heatshock protein family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F19K19_23<BR>At1g16680</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9989051">AAG10814</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16680">hypothetical protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>K6M13_13<BR>AT5g49580</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177624"> BAB10771</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g49580">putative protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>YUP8H12R_19<BR>At1g79030</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79030">hypothetical protein</a></TD></TR>

<tr class="alt"><TD ROWSPAN=5 valign=top><a name="ERS2"><B>Putative ethylene receptor; ERS2 family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T27F4_9<BR>At1g66340</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12324402">AAG52169</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66340">ethylene-response protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>K14B15_4<BR>AT3g23150</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3687654">AAC62208 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g23150">ethylene receptor</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T20B5.14<BR>At2g40940</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1046225">AAC49090</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40940">ethylene response sensor (ERS)</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F7O18_5<BR>AT3g04580</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6175182">AAF04908 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g04580">putative ethylene receptor (EIN4)</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F19P19_25<BR>At1g04310</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F86174">F86174</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04310">putative ethylene receptor</a></TD></TR>

<TR><TD ROWSPAN=3 valign=top><a name="Ubiquitin"><B>Ubiquitin conjugating enzyme-like family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F20D23_1<BR>At1g17280</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5734741">AAD50006</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17280"> putative amino acid transporter</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>MXI22_15<BR>AT5g50430</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758925">BAB09462</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g50430">ubiquitin conjugating enzyme-like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>K14A17_12<BR>AT3g17000</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7670024">BAA94978</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g17000">ubiquitin conjugating enzyme</a></TD></TR>

<tr class="alt"><TD ROWSPAN=2 valign=top><a name="Putative recept"><B>Putative receptor protein kinase family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F20D23_5<BR>At1g17250</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5734745">AAD50010</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17250">putative receptor protein kinase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F20D23_6<BR>At1g17240</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5734761">AAD50026</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17240">putative receptor protein kinase</a></TD></TR>

<TR><TD ROWSPAN=2 valign=top><a name="glutathione"><B>Putative glutathione transferase family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F20D23_13<BR>At1g17170</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G86307">G86307</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17170">putative glutathione transferase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F3F9_24<BR>At1g78360</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8052534">AAF71798</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78360">hypothetical protein</a></TD></TR>

<tr class="alt"><TD ROWSPAN=2 valign=top><a name="Oligosaccharyl"><B>Oligosaccharyl transferase STT3-like family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T29J13_110<BR>AT5g19690</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g19690">oligosaccharyl transferase STT3-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F12G12_80<BR>At1g34130</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34130">integral membrane protein, putative</a></TD></TR>

<TR><TD ROWSPAN=4 valign=top><a name="Uncoupling"><B>Uncoupling protein family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T29J13_180<BR>AT5g19760</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=13430482">AAK25863</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g19760">oxoglutarate/malate translocator-like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F24B22_70<BR>AT3g54110</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=6822057">CAB70985</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g54110">uncoupling protein (ucp/PUMP)</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>k19m22_170<BR>AT5g58970</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g58970">uncoupling protein AtUCP2</a></TD></TR>
	
<TR>  <TD>&nbsp;</TD>
    <TD>T5E8_270<BR>AT5g09470</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9955534">CAC05473</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g09470">mitochondrial carrier-like protein</a></TD></TR>

<tr class="alt"><TD ROWSPAN=6 valign=top><a name="Beta-1,3-g"><B>Beta-1,3-glucanase family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F12A12_90<BR>AT3g46570</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6523060">CAB62327 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g46570">glucosidase-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F16F14.27<BR>At2g16230</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4544403">AAD22313</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16230">putative beta-1,3-glucanase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MJC20_21<BR>AT5g42100</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757955">BAB08443</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g42100">beta-1</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MXK3_1<BR>AT5g64790</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8843743">BAA97291</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64790">beta-1</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F3P11.4<BR>At2g19440</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4191774">AAD10143</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19440"> diacylglycerol O-acyltransferase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F13O11_7<BR>At1g64760</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G96670">G96670</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64760">hypothetical protein</a></TD></TR>

<TR><TD ROWSPAN=6 valign=top><a name="Squalene epoxidase"><B>Squalene epoxidase - like family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F9K23_3<BR>At1g58440</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12321049">AAG50645 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g58440">squalene monooxygenase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>T20K9.4<BR>At2g22830</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=3445200">AAC32430</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g22830">putative squalene epoxidase </a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>T28I19_40<BR>AT4g37760</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7270759">CAB80441</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g37760">squalene epoxidase - like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>MLE8_6<BR>AT5g24140</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10178162">BAB11574</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g24140">squalene monooxygenase 2 (squalene epoxidase 2) (SE 2) (sp|O65403)</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>K12G2_2<BR>AT5g24150</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757924">BAB08406</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g24150">squalene monooxygenase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>K12G2_4<BR>AT5g24160</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757925"> BAB08407</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g24160">squalene monooxygenase 1</a></TD></TR>


<tr class="alt"><TD ROWSPAN=2 valign=top><a name="Beta-hydroxyacyl"><B>Beta-hydroxyacyl-ACP dehydratase family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T26C19.11<BR>At2g22230</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4567203">AAD23619</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g22230">putative beta-hydroxyacyl-ACP dehydratase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T31P16_150<BR>AT5g10160</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7960735">CAB92057</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g10160">(3R)-hydroxymyristoyl-[acyl carrier protein] dehydratase -like protein</a></TD></TR>

<TR><TD ROWSPAN=2 valign=top><a name="Peroxisomal membrane"><B>Peroxisomal membrane protein family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T26I20.2<BR>At2g14860</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3650028">AAC61283</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g14860">22 kDa peroxisomal membrane protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F17I5_90<BR>AT4g33900</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3297814">CAA19872</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33900">putative protein</a></TD></TR>

<tr class="alt"><TD ROWSPAN=4 valign=top><a name="acyl-CoA:"><B>Putative acyl-CoA:1-acylglycerol-3-phosphate acyltransferase family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F9E10_13<BR>At1g75020</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B96780">B96780</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75020">putative acyl-CoA:1-acylglycerol-3-phosphate acyltransferase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F11M15_12<BR>At1g51260</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D96550">D96550</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51260">putative acyl-CoA : 1-acylglycerol-3-phosphate acyltransferase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F15B8_160<BR>AT3g57650</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T06755">T06755</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g57650">1-acylcerol-3-phosphate acyltransferase - like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MCB22_2<BR>AT3g18850</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294694">BAB03094</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g18850">hypothetical protein</a></TD></TR>

<TR><TD ROWSPAN=9 valign=top><a name="4-coumarate"><B>4-coumarate--CoA ligase - like family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>C17L7_80<BR>AT4g05160</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267275">CAB81058</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g05160">4-coumarate--CoA ligase - like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>K9H21_8<BR>AT5g63380</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177446">BAB10742</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g63380">4-coumarate-CoA ligase-like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F5M15_15<BR>At1g20510</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=13430676">AAK25960</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20510">hypothetical protein </a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F5M15_25<BR>At1g20500</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778604">AAF79612</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20500">hypothetical protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F5M15_16<BR>At1g20490</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D86338">D86338</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20490">hypothetical protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F5M15_17<BR>At1g20480</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20480">hypothetical protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F16P17_27<BR>At1g62940</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B96654">B96654</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g62940">4-coumarate:coenzyme A ligase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>MXA21_10<BR>AT5g38120</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177788">BAB11279</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g38120">4-coumarate--CoA ligase -like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F13C5_180<BR>AT4g19010</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2832629">CAA16758</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19010">4-coumarate-CoA ligase - like</a></TD></TR>

<tr class="alt"><TD ROWSPAN=7 valign=top><a name="axi 1-like"><B>axi 1-like family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F24B22_60<BR>AT3g54100</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6822056">CAB70984</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g54100">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T8P21.11<BR>At2g37980</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4895186">AAD32773</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37980">similar to axi 1 protein from Nicotiana tabacumAt2g22830	T20K9.	 homeodomain transcription factor (HAT9)</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F17A17_24<BR>AT3g07900</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6648202">AAF21200</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07900">putative auxin-independent growth promoter</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MLE2_2<BR>AT5g63390</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758280">BAB08804</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g63390">auxin-independent growth promoter-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F4I1.31<BR>At2g44500</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02405">T02405</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44500">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F7J8_80<BR>AT5g01100</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6759433">CAB69838</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g01100">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F12K8_19<BR>At1g22460</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6587842">AAF18531</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22460">Similar to auxin-independent growth promoter</a></TD></TR>

<TR><TD ROWSPAN=3 valign=top><a name="Cysteine synthase"><B>Cysteine synthase AtcysC1 family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F2A19_40<BR>AT3g61440</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6850835">CAB71074 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g61440">cysteine synthase AtcysC1</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>T12J13_9<BR>AT3g03630</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6091759">AAF03469</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g03630">O-acetylserine (thiol) lyase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>T9J14_11<BR>AT3g04940</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12322845">AAG51407 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g04940">putative cysteine synthase</a></TD></TR>

<tr class="alt"><TD ROWSPAN=4 valign=top><a name="Rec"><B>Receptor protein kinase-like family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T20F6.8<BR>At2g02780</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2947063">AAC05344</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02780">putative receptor-like protein kinase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MLE2_4<BR>AT5g63410</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758282">BAB08806</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g63410">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MUA22_21<BR>AT5g14210</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757802">BAB08300</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g14210">receptor protein kinase-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F20H23_20<BR>AT3g03770</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6006864">AAF00640</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g03770">hypothetical protein</a></TD></TR>

<TR><TD ROWSPAN=2 valign=top><a name="Alpha/beta hydro"><B>Alpha/beta hydrolase family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T26G12_9<BR>AT3g29770</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g29770">alpha/beta hydrolase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F18D22_70<BR>AT5g10300</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8953411">CAB96686</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g10300">alpha-hydroxynitrile lyase-like protein</a></TD></TR>

<tr class="alt"><TD ROWSPAN=2 valign=top><a name="Aldose 1"><B>Aldose 1-epimerase - like family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T23J7_130<BR>AT3g47800</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T07719">T07719</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47800">aldose 1-epimerase - like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F8M21_30<BR>AT5g15140</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7671483">CAB89324</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g15140">putative aldose 1-epimerase - like protein</a></TD></TR>

<TR> <TD ROWSPAN=3 valign=top><a name="SNF1 related"><B>SNF1 related protein kinase family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>MXC7_3<BR>AT3g23000</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5478791">BAA77716 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g23000">SNF1 related protein kinase (ATSRPK1)</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F28N24_9<BR>At1g29230</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9502417">AAF88116</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29230">protein kinase PK4, putative</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F13P17.2<BR>At2g34180</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3337349">AAC27394</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34180">putative protein kinase</a></TD></TR>

<tr class="alt"><TD ROWSPAN=4 valign=top><a name="glutamate-"><B>Putative glutamate-/aspartate-binding peptide family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>dl3405w<BR>AT4g14730</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2244830">CAB10252</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g14730">hypothetical protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F16M2_160<BR>AT3g63310</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7523413">CAB86432</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g63310">putative protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F10O3_10<BR>At1g03070</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E86161">E86161</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g03070">putative glutamate/aspartate-binding peptide</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T10P11_23<BR>AT4g02690</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3892058">AAC78271</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g02690">putative glutamate-/aspartate-binding peptide </a></TD></TR>

<TR><TD ROWSPAN=2 valign=top><a name="mouse"><B>Contains similarity to mouse and human SL15 proteins family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F28D6_6<BR>AT4g07390</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5732040">AAD48939</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g07390">not found</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>f2o15_130<BR>AT5g59470</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8885552">BAA97482</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g59470">putative protein</a></TD></TR>

<tr class="alt"> <TD ROWSPAN=2 valign=top><a name="kinase-like pro"><B>Receptor protein kinase-like protein family</B></a></TD> <TD>&nbsp;</TD>
    <TD>F16F14.25<BR>At2g16250</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C84538">C84538</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16250">putative LRR receptor protein kinase </a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T22F8_170<BR>AT4g39270</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7270910">CAB80590</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g39270">receptor protein kinase - like protein</a></TD></TR>

<TR><TD ROWSPAN=2 valign=top><a name="Purple"><B>Purple acid phosphatase family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T4M8.12<BR>At2g03450</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4335754">AAD17431</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g03450"> unknown protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F16A14_4<BR>At1g13900</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778406">AAF79414 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g13900">hypothetical protein</a></TD></TR>

<tr class="alt"><TD ROWSPAN=3 valign=top><a name="Gamma-"><B>Gamma-glutamyltransferase-like family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F17A13_30<BR>AT4g29210</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7269819">CAB79679</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g29210">gamma-glutamyltransferase-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T19P19_30<BR>AT4g39640</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T05001">T05001</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g39640">putative gamma-glutamyltransferase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T19P19_40<BR>AT4g39650</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T05002">T05002</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g39650">putative gamma-glutamyltransferase </a></TD></TR>

<TR><TD ROWSPAN=2 valign=top><a name="Globulin-like"><B>Globulin-like protein family</B></a></TD>   <TD>&nbsp;</TD>
    <TD>C7A10_660<BR>AT4g36700</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4006897">CAB16827</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g36700">globulin-like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F24H14.11<BR>At2g18540</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4218005">AAD12213</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18540">putative vicilin storage protein (globulin-like)</a></TD></TR>

<tr class="alt"><TD ROWSPAN=2 valign=top><a name="Monooxygenase"><B>Monooxygenase family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>K18I23_12<BR>AT5g05320</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176744"> BAB09975</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g05320">monooxygenase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F20M13_100<BR>AT4g38540</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7270837">CAB80518</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38540">monooxygenase 2 (MO2)</a></TD></TR>

<TR><TD ROWSPAN=2 valign=top><a name="Patatin-"><B>Patatin-like protein family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>C7A10_300<BR>AT4g37060</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G85437">G85437</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g37060">patatin-like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>T9J22.23<BR>At2g26560</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2739381">AAC14504</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26560">similar to latex allergen from Hevea brasiliensis</a></TD></TR>

<tr class="alt"><TD ROWSPAN=2 valign=top><a name="beta subunit"><B>Signal recognition particle receptor beta subunit-like family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>MJJ3_7<BR>AT5g05670</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759092">BAB09661</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g05670">signal recognition particle receptor beta subunit-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MSF3.15<BR>At2g18770</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4185143">AAD08946 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18770"> putative translation initiation factor eIF-2B gamma subunit</a></TD></TR>

<TR><TD ROWSPAN=2 valign=top><a name="FtsH"><B>Cell division protein FtsH isolog family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>MYA6_4<BR>AT3g16300</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2062173">AAB63647</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g16300">hypothetical protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F20B17_26<BR>At1g79780</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7715593">AAF68111</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79780">hypothetical protein</a></TD></TR>

<tr class="alt"><TD ROWSPAN=2 valign=top><a name="histidine"><B>Putative sensory transduction histidine kinase family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F17L21_11<BR>At1g27320</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9802528">AAF99730</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27320">putative sensory transduction histidine kinase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MXH1_16<BR>AT5g35750</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758650">BAB09274</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g35750">histidine kinase-like protein</a></TD></TR>

<TR><TD ROWSPAN=5 valign=top><a name="glutaredoxin"><B>Putative glutaredoxin family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F28J7_33<BR>AT3g02000</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6091738">AAF03450</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g02000">putative glutaredoxin</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>dl3870w<BR>AT4g15660</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268314">CAB78608</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15660">glutaredoxin</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>dl3875w<BR>AT4g15670</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268315">CAB78609 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15670">glutaredoxin</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>dl3885w<BR>AT4g15690</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268317">CAB78611</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15690">glutaredoxin</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>dl3890w<BR>AT4g15700</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2244926">CAB10348 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15700">glutaredoxin homolog</a></TD></TR>


<tr class="alt"><TD ROWSPAN=2 valign=top><a name="14-alpha"><B>Putative obtusifoliol 14-alpha demethylase family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F5J6.9<BR>At2g17330</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H84550">H84550</A></TD>
    <TD>&nbsp;</TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F25C20_17<BR>At1g11680</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4835788">AAD30254</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11680">putative obtusifoliol 14-alpha demethylase</a></TD></TR>

<TR><TD ROWSPAN=2 valign=top><a name="AMP-bind"><B>AMP-binding protein, putative family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>K14A17_3<BR>AT3g16910</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7670021">BAA94975</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g16910">AMP-binding protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F2D10_4<BR>At1g20560</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20560">hypothetical protein</a></TD></TR>

<tr class="alt"><TD ROWSPAN=3 valign=top><a name="Mandelonitrile"><B>Mandelonitrile lyase-like protein family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F18O21_20<BR>AT3g56060</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7572904">CAB87405</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g56060">mandelonitrile lyase-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MSG15_1<BR>AT5g51930</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177728"> BAB11041</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g51930">mandelonitrile lyase-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MSG15_3<BR>AT5g51950</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177730">BAB11043</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g51950">mandelonitrile lyase-like protein</a></TD></TR>

<TR><TD ROWSPAN=3 valign=top><a name="heat-shock"><B>Calmodulin-binding heat-shock - like family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T2J13_110<BR>AT3g49050</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6522561">CAB62005</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g49050">calmodulin-binding heat-shock - like protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F6N23_21<BR>AT4g00500</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3047111">AAC13622</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g00500">putative calmodulin-binding heat shock protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>K12B20_160<BR>AT5g37710</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757980">BAB08316</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g37710">calmodulin-binding heat-shock protein -like</a></TD></TR>

<tr class="alt"><TD ROWSPAN=2 valign=top><a name="Nucellin"><B>Nucellin, putative family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T5M16_7<BR>At1g77480</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B96804">B96804</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77480">nucellin-like protein</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T7O23_17<BR>At1g44130</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12320825">AAG50556 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g44130">nucellin, putative</a></TD></TR>

<TR><TD ROWSPAN=3 valign=top><a name="SEC61"><B>Putative protein transport protein SEC61 alpha subunit family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F28N24_3<BR>At1g29310</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9502410">AAF88109</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29310"> pseudogene</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F9K20_24<BR>At1g78720</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B96816">B96816</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78720">protein transport protein sec61 alpha subunit, putative</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F13P17.9<BR>At2g34250</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=13605799">AAK32885</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34250">putative protein transport protein SEC61 alpha subunit</a></TD></TR>

<tr class="alt"><TD ROWSPAN=2 valign=top><a name="Aminoalcoholphosphotransferase"><B>Aminoalcoholphosphotransferase family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>MWL2_21<BR>AT3g25585</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=13430478">AAK25861</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g25585">aminoalcoholphosphotransferase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F13B4_27<BR>At1g13560</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9802754">AAF99823</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g13560">hypothetical protein</a></TD></TR>

<TR><TD ROWSPAN=2 valign=top><a name="Ubiquitin-conjugating"><B>Ubiquitin-conjugating enzyme, putative family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F8L10_22<BR>At1g53020</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9454541"> AAF87864</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53020">ubiquitin-conjugating enzyme, putative</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>T1B8.8<BR>At2g33770</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=1707021">AAC69130</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33770">putative ubiquitin-conjugating enzyme E2</a></TD></TR>

<tr class="alt"><TD ROWSPAN=4 valign=top><a name="Glycine-rich"><B>Glycine-rich protein family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T2I1_220<BR>AT5g07510</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7576189">CAB87940 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07510">glycine-rich protein</a></TD></TR>

	<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T2I1_230<BR>AT5g07520</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7576190">CAB87941 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07520">glycine-rich protein atGRP</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>T2I1_240<BR>AT5g07530</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07530">glycine-rich protein atGRP-7</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>MBK20_3<BR>AT5g07600</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759581">BAB11438</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07600">unknown protein</a></TD></TR>

<TR><TD ROWSPAN=2 valign=top><a name="UDP-GlcNAc:"><B>UDP-GlcNAc:dolichol phosphate N-acetylglucosamine-1-phosphate transferase-like protein family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T32G6.1<BR>At2g41490</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g41490"> putative cytokinin oxidase</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>F28O9_70<BR>AT3g57220</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6735301">CAB68128</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g57220">UDP-GlcNAc:dolichol phosphate N-acetylglucosamine-1-phosphate transferase-like protein</a></TD></TR>


<tr class="alt"><TD ROWSPAN=2 valign=top><a name="ive ubiquitin"><B>Putative ubiquitin carboxyl terminal hydrolase family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F25P17.6<BR>At2g24640</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4572681">AAD23896</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24640">putative ubiquitin carboxyl terminal hydrolase</a></TD></TR>

<tr class="alt">  <TD>&nbsp;</TD>
    <TD>F28M20_140<BR>AT4g31670</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3281861">CAA19756</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g31670">putative protein</a></TD></TR>

<TR><TD ROWSPAN=2 valign=top><a name="Luminal"><B>Luminal binding protein family</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T26D3_50<BR>AT5g28540</TD>
	<TD>&nbsp;</TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g28540">luminal binding protein</a></TD></TR>

<TR>  <TD>&nbsp;</TD>
    <TD>MJC20_12<BR>AT5g42020</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757947">BAB08435</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g42020">luminal binding protein (dbj|BAA13948.1)</a></TD></TR>    


<tr class="alt">    <TD ROWSPAN=6 valign=top><a name="MPT"><B>Mitochondrial Protein Translocase (MPT) Family</B></A></TD>    <TD>&nbsp;</TD>	
        <TD>T5C23_120<BR>AT4g11690</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4539460">CAB39940</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g11690">putative protein</A></TD></TR>

<tr class="alt">        <TD>&nbsp;</TD>	
        <TD>F11F19.2<BR>At2g36070 </TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6598677">AAF18666</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36070">hypothetical protein</A></TD></TR>

<tr class="alt">        <TD>&nbsp;</TD>	
        <TD>F3G5.20<BR>At2g37410</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D84792">D84792</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37410">putative protein translocase</A></TD></TR>

<tr class="alt">        <TD>&nbsp;</TD>	
        <TD>F14O10_3<BR>At1g20350</TD>
	<TD>&nbsp;</TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20350">mitochondrial inner membrane translocase component, putative</A></TD></TR>

<tr class="alt">        <TD>&nbsp;</TD>	
        <TD>T13C7.10<BR>At2g20510</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4586033">AAD25651</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g20510">putative mitochondrial inner membrane translocating protein</A></TD></TR>
	
<tr class="alt">        <TD>&nbsp;</TD>	
        <TD>F10M23_10<BR>AT4g26670</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4455190">CAB36513</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g26670">putative protein</A></TD></TR>


 <TR>        <TD ROWSPAN=1 valign=top><a name="SSS"><b>Solute:Sodium Symporter (SSS) Family</B></A></TD><TD>&nbsp;</TD>	
        <TD>MFC19_5<BR>AT5g45380</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758728">BAB09166</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g45380">urea active transporter-like protein</A></TD></TR>     
 <tr class="alt">        <TD ROWSPAN=1 valign=top><A name="SMR"><B>Small Multidrug Resistance (SMR) Family</B></TD><TD>&nbsp;</TD>	
        <TD>T8K22.11<BR>At2g02590</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3184280">AAC18927</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02590">putative transport protein</A></TD></TR>	

<TR>        <TD ROWSPAN=2 valign=top><A name="RND"><B>Resistance-Nodulation-Cell Division (RND) Superfamily</B></TD><TD>&nbsp;</TD>	
        <TD>F22I13_120<BR>AT4g38350</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4539343">CAB37491</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38350">putative protein</A></TD></TR>     

<TR><TD>&nbsp;</TD>	
        <TD>F7F22_1<BR>At1g42470</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6691199">AAF24537</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g42470">Niemann-Pick C disease protein-like protein</A></TD></TR>     
	
<tr class="alt"><TD ROWSPAN=1 valign=top><a name="CCS1"><B>Similar to CCS1</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F13F21_19<BR>At1g49380</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5430762">AAD43162</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g49380">hypothetical protein </a></TD></TR>

<TR><TD ROWSPAN=1 valign=top><a name="EIN2"><B>EIN2</B></a></TD>  <TD>EIN2-NRAMP</TD>
    <TD>&nbsp;<BR>AT5g03280</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48349">T48349</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g03280">putative protein </a></TD></TR>

<tr class="alt"><TD ROWSPAN=1 valign=top><a name="Not56-like"><B>Not56-like protein </B></a></TD>  <TD>&nbsp;</TD>
    <TD>F17A22.15<BR>At2g47760</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B84919">B84919</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47760">Not56-like protein </a></TD></TR>

<TR><TD ROWSPAN=1 valign=top><a name="Peroxisomal membrane protein"><B>Peroxisomal membrane protein</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T26N6_9<BR>AT4g04470</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4773886">AAD29759</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g04470">PEROXISOMAL MEMBRANE PROTEIN PMP22</a></TD></TR>

<tr class="alt"><TD ROWSPAN=1 valign=top><a name="LEA"><B>Putative LEA (late embryogenesis abundant) protein </B></a></TD>  <TD>&nbsp;</TD>
    <TD>T18E12.19<BR>At2g03140</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02712">T02712</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g03140">similar to late embryogenesis abundant proteins</a></TD></TR>

<TR><TD ROWSPAN=1 valign=top><a name="Myosin-like"><B>Myosin-like</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F7C8_60<BR>AT5g20470</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3776579">AAC64896</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g20470">myosin-like protein</a></TD></TR>

<tr class="alt"><TD ROWSPAN=1 valign=top><a name="preprotein"><B>Putative preprotein translocase SECY protein </B></a></TD>  <TD>&nbsp;</TD>
    <TD>T9H9.5<BR>At2g31530</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4582448">AAD24832</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31530">putative preprotein translocase SECY protein</a></TD></TR>

<TR><TD ROWSPAN=1 valign=top><a name="ADP-ribose"><B>Putative poly(3 ADP-ribose) glycohydrolase </B></a></TD>  <TD>&nbsp;</TD>
    <TD>F20M17.10<BR>At2g31860</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4887750">AAD32286 </A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31860">putative poly(3 ADP-ribose) glycohydrolase</a></TD></TR>

<tr class="alt"><TD ROWSPAN=1 valign=top><a name="Leucine"><B>Leucine rich repeat receptor kinase-like protein</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T12H17_120<BR>AT4g22730</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7269119">CAB79228</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g22730">leucine rich repeat receptor kinase-like protein</a></TD></TR>

<TR><TD ROWSPAN=1 valign=top><a name=">Serine O-acetyltransferase"><B>Serine O-acetyltransferase </B></a></TD>  <TD>&nbsp;</TD>
    <TD>T17A5.1<BR>At2g17640</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6598796">AAF18673</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g17640">serine acetyltransferase (GB:AF112303) </a></TD></TR>

<tr class="alt"><TD ROWSPAN=1 valign=top><a name="glycosylasparaginase"><B>Putative glycosylasparaginase</B></a></TD>  <TD>&nbsp;</TD>
    <TD>F6N23_5<BR>AT4g00590</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267398">CAB80868</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g00590">putative glycosylasparaginase</a></TD></TR>

<TR><TD ROWSPAN=1 valign=top><a name="Glycine/proline-rich"><B>Glycine/proline-rich protein</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T2I1_280<BR>AT5g07570</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7576195">CAB87946</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07570">glycine/proline-rich protein</a></TD></TR>

<tr class="alt"><TD ROWSPAN=1 valign=top><a name="Barley Mlo"><B>Barley Mlo protein isolog</B></a></TD>  <TD>&nbsp;</TD>
    <TD>T19D16_26<BR>At1g11000</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2252632">AAB65495</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11000">Barley Mlo protein isolog</a></TD></TR>

<TR><TD ROWSPAN=1 valign=top><a name="p80"><B>Katanin p80 subunit - like </B></a></TD>  <TD>&nbsp;</TD>
    <TD>F8L15_120<BR>AT5g08390</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10178281">CAC08339</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g08390">katanin p80 subunit - like protein</a></TD></TR>

<tr class="alt"><TD ROWSPAN=1 valign=top><a name="A1"><B>Putative replication protein A1 </B></a></TD>  <TD>&nbsp;</TD>
    <TD>F7B19.10<BR>At2g09960</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4558677">AAD22694</A></TD>
    <TD> <a href= "http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g09960">putative replication protein A1</a></TD></TR>


</TABLE>
 </TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
