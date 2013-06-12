<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Primary Pumps (ATPases) Gene Family";
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
 
<A NAME="ATPases"><h2>Primary Pumps (ATPases) Gene Family</h2></A>

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
	<th><b>TIGR Annotation:</b></th>   </TR>
	    
<tr class="alt">    <TD ROWSPAN=12 valign=top><B>Plasma membrane H+-ATPase family</B></TD>
        <TD>&nbsp;</TD>
	<TD>F23A5_1<BR>At1g80660</TD>
	<TD><A HREF="http://www3.ncbi.nlm.nih.gov/htbin-post/Entrez/query?uid=AAF14653.1&form=6&db=p&Dopt=g">AAF14653</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80660">plasma membrane ATPase, putative</A></TD></TR>
	
<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F27H5_120<BR>AT3g60330</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T49228">T49228</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g60330">plasma membrane H+-ATPase - like </A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MRG21_9<BR>AT5g62670</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8809663">BAA97214</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g62670">plasma membrane proton ATPase-like</A></TD></TR> 

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F20D23_4<BR>At1g17260</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6630530">AAD50009</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17260">H+-transporting ATPase AHA10</A></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T17F15_180<BR>AT3g47950</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4678333">CAB41144</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47950">H+-transporting ATPase - like protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F25P17.18<BR>At2g24520</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4572678">AAD23893</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24520">putative plasma membrane proton ATPase</A></TD></TR> 

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MJB24_16<BR>AT5g57350</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176793">BAB09963</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g57350">plasma membrane ATPase 3 (proton pump) (sp|P20431)</A></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F9N11_40<BR>AT4g30190</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5730129">CAB52463</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g30190">H+-transporting ATPase type 2, plasma membrane</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T12K4_90<BR>AT3g42640</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47322">T47322</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g42640">plasma membrane H+-ATPase-like protein</A></TD></TR> 

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F19F24.16<BR>At2g18960</TD>
	<TD>AAC09030</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18960">plasma membrane proton ATPase (PMA) </A></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F9A16.7<BR>At2g07560</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4895170">AAD32758</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g07560">putative plasma membrane proton ATPase</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T5C23_160<BR>AT4g11730</TD>
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g11730">H+-transporting ATPase - like protein</A></TD></TR> 

<TR>    <TD ROWSPAN=3 valign=top><B>Putative vacuolar proton-ATPase subunit 1 family</B></TD>
        <TD>&nbsp;</TD>
	<TD>T17D12.8<BR>At2g28520</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H84685">H84685</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28520">putative vacuolar proton-ATPase subunit</A></TD></TR> 	

<TR>    <TD>&nbsp;</TD>
	<TD>F3K23.17<BR>At2g21410</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4567273">AAD23686</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21410">putative vacuolar proton-ATPase subunit</A></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>F19H22_180<BR>AT4g39080</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4539327">CAB38828</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g39080">putative proton pump</A></TD></TR> 

<tr class="alt">    <TD ROWSPAN=3 valign=top><B>Vacuolar H+-pyrophosphatase family</B></TD>
        <TD>&nbsp;</TD>
	<TD>F7H2_3<BR>At1g15690</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A38230">A38230</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15690">inorganic pyrophosphatase, putative</A></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F17F16_11<BR>At1g16780</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9954727">AAG09080</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16780">vacuolar-type H+-translocating inorganic pyrophosphatase, putative</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F9K20_2<BR>At1g78920</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H96818">H96818</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78920">vacuolar-type H+-translocating inorganic pyrophosphatase</A></TD></TR> 

<TR>    <TD ROWSPAN=14 valign=top><B>Putative P-type ATPase family</B></TD>    <TD>&nbsp;</TD>
	<TD>K16N12_9<BR>AT3g27870</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9229745">BAB00402</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g27870">P-type ATPase, putative</A></TD></TR> 	

<TR>   <TD>&nbsp;</TD>	
        <TD>T20D16.9<BR>At2g23280</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2642437">AAB87105</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g23280">unknown protein</A></TD></TR>	


<TR>    <TD>&nbsp;</TD>	
        <TD>F6G3_150<BR>AT4g30120</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A85352">A85352</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g30120">cadmium-transporting ATPase-like protein</A></TD></TR>
	
<TR>    <TD>&nbsp;</TD>
	<TD>MDC16_2<BR>AT3g13900</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9229288">BAA99591</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g13900">putative ATPase </A></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>F23H11_14<BR>At1g59820</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C96622">C96622</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g59820">chromaffin granule ATPase II homolog, putative</A></TD></TR> 

<TR>    <TD>&nbsp;</TD>
	<TD>F1L3_24<BR>At1g17500</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778459">AAF79467</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17500">P-type ATPase, putative</A></TD></TR> 	

<TR>    <TD>&nbsp;</TD>
	<TD>F28B23_19<BR>At1g26130</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D86387">D86387</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26130">P-type transporting ATPase, putative</A></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>MUG13_22<BR>AT5g04930</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10178032">BAB11515</A></TD>
        <TD>&nbsp;</TD></TR> 

<TR>    <TD>&nbsp;</TD>
	<TD>F24J5_12<BR>At1g68710</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F96711">F96711</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68710">ATPase, putative</A></TD></TR> 	

<TR>    <TD>&nbsp;</TD>
	<TD>T5M7_3<BR>AT3g25610</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9229867">BAB00597</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g25610">ATPase II, putative</A></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>F3F19_24<BR>At1g13210</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F86266">F86266</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g13210">puative calcium-transporting ATPase</A></TD></TR> 

<TR>    <TD>&nbsp;</TD>
	<TD>MLN1_17<BR>AT5g44240</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759525">BAB10991</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g44240">ATPase, calcium-transporting</A></TD></TR> 	

<TR>    <TD>&nbsp;</TD>
	<TD>F20D21_10<BR>At1g54280</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C96584">C96584</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54280">hypothetical protein</A></TD></TR>	

<TR>    <TD>&nbsp;</TD>
	<TD>F28P22_11<BR>At1g72700</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6648158">AAF21158</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72700">putative P-type transporting ATPase</A></TD></TR> 	

<tr class="alt">    <TD ROWSPAN=11 valign=top><B>Ca2+-transporting ATPase-like protein family</B></TD>    <TD>&nbsp;</TD>
	<TD>MXL8_3<BR>AT3g21180</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9280219">BAB01709</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g21180">putative P-type transporting ATPase</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T20K9.16<BR>At2g22950</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6598414">AAF18608</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g22950">putative Ca2+-ATPase</A></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F5N5_8<BR>AT3g22910</TD>
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g22910">calmodulin-stimulated calcium-ATPase, putative</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F27B13_140<BR>AT4g29900</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C85349">C85349</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g29900">Ca2+-transporting ATPase - like protein </A></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F28L5_1<BR>At1g27770</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D86402"> D86402</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27770">envelope Ca2+-ATPase</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MUL3_5<BR>AT5g57110</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8843813">BAA97361</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g57110">Ca2+-transporting ATPase-like protein (emb|CAB79748.1)</A></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MAA21_10<BR>AT3g63380</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T49179">T49179</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g63380">Ca2+-transporting ATPase -like protein</A></TD></TR>

<tr class="alt">    <TD>ACA2</TD>
	<TD>F19F18_130<BR>AT4g37640</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T04721">T04721</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g37640">plasma membrane-type calcium ATPase (ACA2)</A></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T32G6.8<BR>At2g41560</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00812">T00812</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g41560">putative Ca2+-ATPase</A></TD></TR>
	
<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F28O9_180<BR>AT3g57330 </TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T45811">T45811</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g57330 ">Ca2+-transporting ATPase-like protein</A></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>MNB8_7<BR>AT5g53010</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8809590">BAA97141</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g53010">Ca2+-transporting ATPase-like protein </A></TD></TR>

<TR>    <TD ROWSPAN=7 valign=top><B>Vacuolar proton-ATPase 16 kDa proteolipid family</B></TD>    <TD>&nbsp;</TD>
	<TD>T4L20_300<BR>AT4g34720 </TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S60130">S60130</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g34720 ">vacuolar H+-transporting ATPase 16K chain </A></TD></TR> 	

<TR>    <TD>&nbsp;</TD>
	<TD>F10A5_17<BR>At1g75630</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S60131">S60131</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75630">vacuolar ATP synthase, putative</A></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>F1P15.11<BR>At2g16510</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S60130">S60130</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16510">putative vacuolar proton-ATPase 16 kDa proteolipid</A></TD></TR> 	
<TR><TD>&nbsp;</TD>
    <td>F6F9_3<BR>At1g19910</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S60132">S60132</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19910">vacuolar H+-ATPase proteolipid (16 kDa) subunit</A></TD></TR>
<TR>    <TD>&nbsp;</TD>
	<TD>F3N11.6<BR>At2g25610</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4874301">AAD31363</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25610">putative vacuolar ATP synthase proteolipid subunit </A></TD></TR>	
	
<TR>    <TD>&nbsp;</TD>
	<TD>F19H22_20<BR>AT4g38920</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S60130">S60130</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38920">H+-transporting ATPase 16K chain P2, vacuolar</A></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>L23H3_10<BR>AT4g32530</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T08586">T08586</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g32530">H+-transporting ATPase - like protein</A></TD></TR> 	

<tr class="alt">    <TD ROWSPAN=4 valign=top><B>Endoplasmic reticulum-type Ca-ATPase (ECA) family</B></TD>    <TD>&nbsp;</TD>
	<TD>F24B9_9<BR>At1g07810</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2078292">AAC68819</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07810">ER-type Ca2+-pump protein</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F24B9_21<BR>At1g07670</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F86211">F86211</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07670">endoplasmic reticulum-type calcium-transporting ATPase 4</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>T27I1_16<BR>At1g10130</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T52581">T52581</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10130">putative calcium ATPase </A></TD></TR> 	

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>A_TM018A10_4<BR>AT4g00900</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01556">T01556</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g00900">Ca2+-transporting ATPase - like protein</A></TD></TR>

 <TR>    <TD ROWSPAN=2 valign=top><B>Cadmium-transporting ATPase-like family</B></TD>   <TD>&nbsp;</TD>
	<TD>F6G3_140<BR>AT4g30110</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4938487">CAB43846</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g30110">cadmium-transporting ATPase-like protein</A></TD></TR>

<TR>    <TD>&nbsp;</TD>
	<TD>T20K24.12<BR>At2g19110</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F84572">F84572</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19110">putative cadmium-transporting ATPase</A></TD></TR> 	

<tr class="alt">    <TD ROWSPAN=3 valign=top><B>Metal-transporting P-type ATPase family</B></TD>
  <TD>&nbsp;</TD>
	<TD>K23L20_14<BR>AT5g44790</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758383">BAB08832</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g44790">ATP dependent copper transporter</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F2K11_17<BR>At1g63440</TD>
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g63440">ATP dependent copper transporter, putative</A></TD></TR>

<tr class="alt">    <TD>&nbsp;</TD>
	<TD>F17M5_280<BR>AT4g33520</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T06003">T06003</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33520">metal-transporting P-type ATPase</A></TD></TR> 	

<TR>    <TD ROWSPAN=1 valign=top><B>Cu2+-transporting ATPase-like protein</B></TD>     <TD>&nbsp;</TD>
	<TD>C7A10_90<BR>AT4g37270</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D85440">D85440</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g37270">Cu2+-transporting ATPase-like protein</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=1 valign=top><B>Cation-transporting ATPase</B></TD>     <TD>&nbsp;</TD>
	<TD>MQM1_11<BR>AT5g23630</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8809697">BAA97238</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g23630">cation-transporting ATPase</A></TD></TR>

<TR><TD ROWSPAN=22 valign=top><B>V-Type ATPase</B></TD> 	
         <TD>&nbsp;</TD>	
        <TD>MQD22_17<BR>AT5g47030</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=13430526">AAK25885</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g47030">ATP synthase delta chain</A></TD></TR>	

<TR>    <TD>VHA -F</TD>	
        <TD>T10P11_25<BR>AT4g02620</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3892056">AAC78269 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g02620">putative vacuolar ATPase</A></TD></TR>


<TR>    <TD>VHA-B1</TD>	
        <TD>T4O12_24<BR>At1g76030</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A31886">A31886</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76030">anter-specific proline-rich -like protein (APG-like)</A></TD></TR>

<TR>    <TD>VHA-G3</TD>	
        <TD>F20B18_60<BR>AT4g25950</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7269446">CAB79450</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25950">V-ATPase G-subunit like protein</A></TD></TR>


<TR>    <TD>VHA-G1</TD>	
        <TD>T13O15_3<BR>AT3g01390</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6692259">AAF24609</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01390">putative amino acid permease</A></TD></TR>

<TR>    <TD>VHA-C</TD>	
        <TD>F13K23_7<BR>At1g12840</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=12248023">AAG50103 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g12840">vacuolar ATP synthase subunit C, putative</A></TD></TR>

<TR>    <TD>VHA-D</TD>	
        <TD>T20N10_80<BR>AT3g58730</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7630068">CAB88290</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g58730">putative amino acid permease</A></TD></TR>	

<TR>    <TD>&nbsp;</TD>	
        <TD>F4M19_10<BR>AT3g42050</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48960">T48960</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g42050">putative amino acid permease</A></TD></TR>

<TR>    <TD>&nbsp;</TD>	
        <TD>F1P15.11<BR>At2g16510</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4589976">AAD26493</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16510">putative vacuolar proton-ATPase 16 kDa proteolipid</A></TD></TR>

<TR>    <TD>&nbsp;</TD>	
        <TD>F7H2_4<BR>At1g15700</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=166788">AAA32833</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15700">ATP synthase gamma-subunit, putative</A></TD></TR>

<TR>    <TD>&nbsp;</TD>	
        <TD>T25P22_90<BR>AT4g09650</TD>
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G85098">G85098</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g09650">H+-transporting ATP synthase-like protein</A></TD></TR>



<TR>    <TD>VHA-B2</TD>	
        <TD>F20M13_70<BR>AT4g38510</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7270834">CAB80515</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38510">probable H+-transporting ATPase </A></TD></TR>


<TR>    <TD>VHA-E3</TD>	
        <TD>F22C12_23<BR>At1g64200</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6692094">AAF24559</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64200">H+-transporting ATPase protein, putative</A></TD></TR>



<TR>    <TD>&nbsp;</TD>	
        <TD>MCO15_24<BR>AT5g55290</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758126">BAB08598 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55290">unknown protein</A></TD></TR>	

<TR>    <TD>VHA-B3</TD>	
        <TD>F14O10_11<BR>At1g20260</TD>
	<TD>&nbsp;</TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20260">hypothetical protein</A></TD></TR>

<TR>    <TD>VHA-G2/Vag2</TD>	
        <TD>F9D16_180<BR>AT4g23710</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7269220">CAB81289 </A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g23710">V-ATPase subunit G (vag2 gene)</A></TD></TR>

<TR>    <TD>&nbsp;</TD>	
        <TD>T22N19_100<BR>AT5g13450</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7543912"> CAB87152</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g13450">delta subunit of mitochondrial F1-ATPase</A></TD></TR>	

<TR>    <TD>&nbsp;</TD>	
        <TD>T17D12.8<BR>At2g28520</TD>
	<TD><A HREF=""http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H84685>H84685</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28520">putative vacuolar proton-ATPase subunit</A></TD></TR>


<TR>    <TD>&nbsp;</TD>	
        <TD>F10M23_50<BR>AT4g26710</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4455194">CAB36517</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g26710">putative protein</A></TD></TR>


<TR>    <TD>&nbsp;</TD>	
        <TD>MZN14_21<BR>AT3g28715</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=11994778">BAB03168</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g28715">putative amino acid permease</A></TD></TR>	

<TR>    <TD>&nbsp;</TD>	
        <TD>T15D2_7<BR>AT3g32990</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9884626">BAB02632</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g32990">putative amino acid permease</A></TD></TR>



<TR>    <TD>VHA-E1</TD>	
        <TD>T22B4_130<BR>AT4g11150</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267814"> CAB81216</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g11150">H+-transporting ATPase chain E</A></TD></TR>



  </table>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
