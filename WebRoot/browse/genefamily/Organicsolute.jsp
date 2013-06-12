<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Organic Solute Cotransporter Gene Families";
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
 

<A NAME="Organicsolute"><h2>Organic Solute Cotransporter Gene Families</h2></A>

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
	<th><b>TIGR Annotation:</b></th></TR>
	    

<tr class="alt">    <TD ROWSPAN=9 valign=top><B>Putative oligopeptide transporter<BR>ISP4-like family</B></TD>
	<TD>&nbsp;</TD>
	<TD>MNC6_5<BR>AT5g53510</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759190">BAB09727</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g53510">isp4 protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MNC6_6<BR>AT5g53520</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759191">BAB09728</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g53520">isp4 protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T15N24_40<BR>AT4g26590 </TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4938497">CAB43855</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g26590 ">isp4 like protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T29A15_220<BR>AT4g27730</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4469024">CAB38285</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g27730">putative protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MYN21_4<BR>AT5g55930</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758213">BAB08658</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55930">sexual differentiation process protein ISP4-like</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MSJ1_25<BR>AT5g64410</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759417">BAB09872</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64410">Isp4-like protein</A></TD></TR>
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>dl4215c<BR>AT4g16370</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268386">CAB78679</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g16370">isp4 like protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F21M12_32<BR>At1g09930</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2160185">AAB60748</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09930">unknown protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T12H20_7<BR>AT4g10770</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267775">CAB81178</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g10770">putative oligopeptide transporter </A></TD></TR>

<TR>    <TD ROWSPAN=48 valign=top><B>Putative sugar transporter family</B></TD>	<TD>&nbsp;</TD>
	<TD>MQC12_22<BR>AT3g20460</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294566">BAB02829</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g20460">sugar transporter, putative </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T7A14_10<BR>At1g05030</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4056428">AAC98002</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05030">putative sugar transporter protein </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T20F21.7<BR>At2g35740</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4263781">AAD15441</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g35740">putative sugar transporter </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F21A20_60<BR>AT5g27350</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6729026">AAF27022</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g27350">sugar transporter-like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F21A20_70<BR>AT5g27360</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g27360">sugar transporter-like protein </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F2O10_8<BR>AT3g05960</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6671961">AAF23220</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g05960">putative hexose transporter</A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>k11j9_40<BR>AT5g61520</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4127417">CAA05384</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g61520">monosaccharide transporter STP3</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F17K4_90<BR>AT5g18840</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g18840">sugar transporter - like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F1N21_12<BR>At1g67300</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9828628">AAG00251</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67300">integral membrane protein, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F14I3_20<BR>At1g50310</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5734775">AAD50040</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g50310">hexose transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T4B21_10<BR>AT4g04750</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267233">CAB80840</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g04750">putative sugar transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T4B21_9<BR>AT4g04760</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267234">CAB80841</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g04760">putative sugar transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F22H5_6<BR>At1g75220</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10092276">AAG12689</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75220">integral membrane protein, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F18E5_100<BR>AT4g21480</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3080392">CAA18712</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g21480">glucose transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T9J23.17<BR>At2g48020</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4249409">AAD13706</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g48020">putative sugar transporter</A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>F22G5_26<BR>At1g07340</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07340">hexose transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F7H1.14<BR>At2g16120</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4678208">AAD26954</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16120">putative sugar transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F7H1.15<BR>At2g16130</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4678209">AAD26955</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16130">putative sugar transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>C7A10_690<BR>AT4g36670</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7270615">CAB80333</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g36670">sugar transporter like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>At1g34580F12K21_7<br>At1g34580</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778264">AAF79273</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34580"> monosaccharide transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F18O14_20<BR>At1g19450</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778437">AAF79445</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19450">integral membrane protein, putative </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MKD15_13<BR>AT5g23270</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177816">BAB11182</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g23270">monosaccharide transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F7G19_19<BR>At1g08930</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6686825">CAB64732</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08930">zinc finger protein ATZF1, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F7G19_20<BR>At1g08920</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6686827">CAB64733</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08920">putative sugar transport protein, ERD6</A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>F7G19_22<BR>At1g08900</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2342688">AAB70414</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08900">putative sugar transport protein, ERD6</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F7G19_23<BR>At1g08890</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2342689">AAB70415</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08890">putative sugar transport protein, ERD6</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T14N5_7<BR>At1g77210</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00450">T00450</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77210">sugar carrier protein, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T17B22_22<BR>AT3g03090</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6714427">AAF26115</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g03090">hypothetical protein </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>dl4265w<BR>AT4g16480</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268398">CAB78690</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g16480">membrane transporter like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T21H19_70<BR>AT5g16150</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9755825">CAC01856</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g16150">sugar transporter-like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F24H14.17<BR>At2g18480</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4218010">AAD12218</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18480">putative sugar transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T1O24.7<BR>At2g43330</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2289003">AAB64332</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43330">putative membrane transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>mnc17_140<BR>AT5g59250</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759246">BAB09770</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g59250">D-xylose-H+ symporter - like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T28P6_18<BR>At1g11260</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5734730">AAD49995</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11260">glucose transporter</A></TD></TR>

	
<TR>	<TD>&nbsp;</TD>
	<TD>T10M13_6<BR>AT4g02050</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7268589">CAB80698</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g02050">putative hexose transporter </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MVE11_22<BR>AT3g18830</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9293909">BAB01812</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g18830">sugar transport, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F2K13_160<BR>AT5g17010</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9755702">CAC01714</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g17010">sugar transporter - like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F12P21_2<BR>At1g30220</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F71431">F71431</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30220">hypothetical protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T22H22_15<BR>At1g54730</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3776581">AAC64898</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54730">integral membrane protein, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T12H1_11<BR>AT3g05150</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6729025">AAF27021</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g05150">putative sugar transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T12H1_13<BR>AT3g05160</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6729026">AAF27022</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g05160">putative sugar transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F22F7_16<BR>AT3g05400</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7596771">AAF64542</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g05400">sugar transporter, putative </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F19K16_22<BR>At1g79820</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6453876">AAF09060</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79820">hexose transporter, putative</A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>T19G15_100<BR>AT5g26250</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g26250">hexose transporter - like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F9D12_17<BR>AT5g26340</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01853">T01853</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g26340">hexose transporter - like protein </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F5H14.25<BR>At2g20780</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4454470">AAD20917</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g20780">putative sugar transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MPN9_17<BR>AT3g19930</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S25009">S25009</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g19930">monosaccharide transport protein, STP4</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
	<TD>MPN9_18<BR>AT3g19940</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g19940">putative monosaccharide transport protein, STP4 </A></TD></TR>

<tr class="alt">    <TD ROWSPAN=2 valign=top><B>Putative adenine nucleotide translocase<BR> family</B></TD><TD>&nbsp;</TD>
	<TD>F5I6_5<BR>At1g80300</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6751705">AAF27687</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80300">adenine nucleotide translocase</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T16N11_1<BR>At1g15500</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8072388">AAF71976</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15500">adenine nucleotide translocase, putative</A></TD></TR>

<TR>    <TD ROWSPAN=5 valign=top><B>Similarity to cationic amino acid<BR> transporter 1 family</B></TD>	<TD>&nbsp;</TD>
	<TD>68069_m00156 <BR>At1g31830</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D86442">D86442</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31830">amino acid permease, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>K20M4_6<BR>AT3g13620</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g13620">hypothetical protein </A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>F5M6_26<BR>At1g31820</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C86442">C86442</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31820">amino acid permease, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MJJ3_2<BR>AT5g05630</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759088">BAB09657</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g05630">putative protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T31J18_6<BR>AT3g19553</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294126">BAB01977</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g19553">amino acid permease, putative</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=5 valign=top><B>Glycerol-3-phosphate permease<BR>like protein family</B></TD>
        <TD>&nbsp;</TD>
	<TD>T17A11.9<BR>At2g13100</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4586068">AAD25685</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g13100">putative membrane transporter</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T21L8_170<BR>AT3g47420</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5541709">CAB51214</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47420">putative protein </A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>dl4810c<BR>AT4g17550</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B71445">B71445</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g17550">putative protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T5I8_1<BR>At1g30560</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G86430">G86430</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30560">unknown protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F24A6_60<BR>AT4g25220</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4454010">CAA23063</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25220">putative protein </A></TD></TR>

<TR>    <TD ROWSPAN=6 valign=top><B>Sugar transporter family</B></TD>	<TD>&nbsp;</TD>
	<TD>T18K17_11<BR>At1g73220</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6598860">AAF18714 </A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73220">putative transporter</A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>F3O9_17<BR>At1g16370</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H86298">H86298</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16370">putative transport protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F3O9_19<BR>At1g16390</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B86299">B86299</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16390">putative transport protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F3H11_5<BR>AT3g20660</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294345">BAB02242</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g20660">hypothetical protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>YUP8H12R_25<BR>At1g79360</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01019">T01019</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79360">hypothetical protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T8K14_17<BR>At1g79410</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B96825">B96825</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79410">hypothetical protein</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=11 valign=top><B>Adenylate translocator (brittle-1)-like<br>family</B></TD>	<TD>&nbsp;</TD>
	<TD>F20B18_290<BR>AT4g26180</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4538947">CAB39683</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g26180">putative mitochondrial carrier protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MHC9_7<BR>AT3g21390</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294686">BAB03052</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g21390">unknown protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F5K20_240<BR>AT3g53940</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7630014">CAB88356</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g53940">putative protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T8P21.20<BR>At2g37890</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4895195">AAD32782</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37890">putative mitochondrial carrier protein</A></TD></TR>
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F1I16_50<BR>AT3g55640</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47703">T47703</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55640">Ca-dependent solute carrier - like protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MXK3_20<BR>AT5g64970</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8843761">BAA97309</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64970">mitochondrial carrier protein-like</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F8B4_100<BR>AT4g32400</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T05350">T05350</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g32400">adenylate translocator (brittle-1) - like protein </A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>ORF12<BR>AT3g51870</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g51870">putative carrier protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T5E21_9<BR>At1g14560</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7527717">AAF63166</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14560">mitochondrial carrier protein, putative</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F7A7_20<BR>AT5g01500</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7327809">CAB82266 </A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g01500">putative protein</A></TD></TR>
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MAL21_28<BR>AT3g20240</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9293980">BAB01883</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g20240">mitochondrial carrier protein, putative</A></TD></TR>

<TR>    <TD ROWSPAN=8 valign=top><B>Similarity to auxin transport<BR>protein family</B></TD>	<TD>&nbsp;</TD>
	<TD>F6D5_2<BR>At1g73590</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10092369">AAG12777</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73590">auxin transporter splice variant b, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T26J12_14<BR>At1g23080</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5817305">AAD52697</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23080">putative auxin transport protein </A></TD></TR>
	
<TR>	<TD>&nbsp;</TD>
	<TD>F2I9.4<BR>At2g01420</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3785972">AAC67319</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01420">putative auxin transport protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MUL3_3<BR>AT5g57090</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8843811">BAA97359</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g57090">auxin transport protein EIR1 (gb|AAC39513.1)</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F2G14_220<BR>AT5g15100</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9755677">CAC01829</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g15100">auxin transport protein - like</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T14N5_17<BR>At1g77110</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5817303">AAD52696</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77110">auxin transport protein EIR1, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F15H11_14<BR>At1g70940</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5817301">AAD52695</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70940">auxin transport protein REH1, putative </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MQK4_28<BR>AT5g16530</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759137">BAB09622</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g16530">putative protein</A></TD></TR>
	

<tr class="alt">    <TD ROWSPAN=9 valign=top><B>Sucrose-proton symporter family</B></TD>	<TD>&nbsp;</TD>
	<TD>T22J18_12<BR>At1g22710</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G86360">G86360</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22710">putative sucrose transport protein, SUC2</A></TD></TR>
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T6B13.9<BR>At2g14670</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3810593">AAC69375</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g14670">putative sucrose-proton symporter</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T12I7_2<BR>At1g66570</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E96691">E96691</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66570">sucrose-proton symporter, putative</A></TD></TR>	
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T17M13.3<BR>At2g02860</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G84441">G84441</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02860">putative sucrose-proton symporter</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>MBL20_5<BR>AT5g06170</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759315">BAB09682</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g06170">sucrose transporter protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>K9D7_11<BR>AT5g43610</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10178200">BAB11624</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g43610">sucrose transporter protein</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F21M12_35<BR>At1g09960</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8052192">CAB92308</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09960">putative sucrose/H+ symporter</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F17M19_3<BR>At1g71880</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S38197">S38197</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71880">sucrose transport protein SUC1</A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F17M19_4<BR>At1g71890</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F96741">F96741</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71890">putative sucrose transport protein</A></TD></TR>

<TR>    <TD ROWSPAN=51 valign=top><B>Similar to LeOPT1 family</B></TD>
        <TD>&nbsp;</TD>
	<TD>F9K21_230<BR>AT3g45650</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6996268">CAB75494</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g45650">putative protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F9K21_240<BR>AT3g45660</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6996269">CAB75495</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g45660">putative protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T6D9_10<BR>AT3g45680</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7019634">CAB75781</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g45680">putative transporter protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T6D9_20<BR>AT3g45690</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7019635">CAB75782</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g45690">putative transporter protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T6D9_30<BR>AT3g45700</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7019636">CAB75783</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g45700">putative transporter protein </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T6D9_40<BR>AT3g45710</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7019637">CAB75784</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g45710">putative transporter protein </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T6D9_50<BR>AT3g45720</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7019638">CAB75785</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g45720">putative transporter protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F5D14_8<BR>At1g32450</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G86449">G86449</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32450">peptide transporter PTR2-B, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F15N18_160<BR>AT5g11570</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7573414">CAB87717</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g11570">putative oligopeptide transporter protein </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F14H20.9<BR>At2g02020</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A84432">A84432</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02020">putative peptide/amino acid transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F14H20.11<BR>At2g02040</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C84432">C84432</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02040">histidine transport protein (PTR2-B)</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MRG21_10<BR>AT5g62680</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8809664">BAA97215</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g62680">peptide transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MQB2_30<BR>AT5g62730</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177451">BAB10842</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g62730">nitrate transporter NTL1 - like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T29J13_60<BR>AT5g19640</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g19640">peptide transport protein-like</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F24J2_10<BR>AT5g28470</TD>    
	<TD>&nbsp;</TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g28470">peptide transporter - like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MIL23_23<BR>AT3g21670</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9229512">BAB00017</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g21670">nitrate transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F23H11_29<BR>At1g59740 </TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C96621">C96621</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g59740 ">oligopeptide transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F5K20_260<BR>AT3g53960</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T45936">T45936</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g53960">transporter-like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F24B22_100<BR>AT3g54140</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47573">T47573</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g54140">peptide transport - like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T14E10_20<BR>AT3g54450</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47604">T47604</A></TD>
        <TD>&nbsp;</TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T8P21.19<BR>At2g37900</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4895194">AAD32781</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37900">putative peptide/amino acid transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F10C21_11<BR>At1g33440</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10645494">AAG21606</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g33440">nitrate transporter NTL1, putative </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F17L22_140<BR>AT4g21680</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4455276">CAB36812</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g21680">peptide transporter - like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T22N4_2<BR>AT3g01350</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6094559">AAF03501</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01350">putative peptide transporter </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T22N19_50<BR>AT5g13400</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48587">T48587</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g13400">peptide transporter - like protein</A></TD></TR>
	
<TR>   <TD>&nbsp;</TD>
       <TD>MSL1_22<BR>AT3g16180</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294465">BAB02684</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g16180">putative transport protein</A></TD></TR>   
	
	
<TR>	<TD>&nbsp;</TD>
	<TD>T7N9_10<BR>At1g27040</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778878">AAF79877</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27040">nitrate transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T7N9_14<BR>At1g27080</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E86397">E86397</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27080">peptide transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F6A14_2<BR>At1g18880</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G86322">G86322</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18880">peptide transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T17F15_170<BR>AT3g47960</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4678332">CAB41143</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47960">putative peptide transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F24J5_7<BR>At1g68570</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F023472">F023472</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68570">peptide transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F9I5_4<BR>At1g52190</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6850341">AAF29404</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g52190">peptide transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F2G14_60<BR>AT5g14940</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T51439">T51439</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g14940">oligopeptide transporter -like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T28K15_13<BR>At1g12110</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=166668">AAA32770</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g12110">putative cytochrome P450</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T2P4.19<BR>At2g40460</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G84829">G84829</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40460">putative PTR2 family peptide transporter </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F19K23_13<BR>At1g62200</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E96648">E96648</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g62200">oligopeptide transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T17F3_10<BR>At1g69870</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6358806">AAF07386</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69870">putative peptide transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T17F3_11<BR>At1g69860</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H96720">H96720</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69860">putative peptide transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T17F3_12<BR>At1g69850</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G96720">G96720</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69850">nitrate transporter (NTL1)</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MJL12_22<BR>AT3g25260</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294183">BAB02085</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g25260">nitrate transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MJL12_24<BR>AT3g25280</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9294185">BAB02087</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g25280"> nitrate transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F18A8.6<BR>At2g26690</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2760834">AAB95302</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26690">putative nitrate transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F28P5_2<BR>At1g72120</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E96744">E96744</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72120">oligopeptide transporter, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T9N14_15<BR>At1g72130</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10645370">AAG21489</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72130">peptide transporter PTR2-B, putative</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>T9N14_16<BR>At1g72140</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10645373">AAG21492</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72140">peptide transporter PTR2-B, putative </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F7J8_160<BR>AT5g01180</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T45958">T45958</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g01180">oligopeptide transporter - like protein</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F12K8_8<BR>At1g22570</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B86359">B86359</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22570">peptide transporter, putative </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F12K8_11<BR>At1g22550</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G86358">G86358</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22550">peptide transporter, putative </A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>F12K8_12<BR>At1g22540</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F86358">F86358</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22540">oligopeptide transporter, putative </A></TD></TR>	
	
<TR>	<TD>&nbsp;</TD>
	<TD>MCL19_9<BR>AT5g46040</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757724">BAB08249</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g46040">peptide transporter</A></TD></TR>

<TR>	<TD>&nbsp;</TD>
	<TD>MCL19_10<BR>AT5g46050</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9757725">BAB08250</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g46050">peptide transporter</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=4 valign=top><B>AUX1 family</B></TD>	<TD>&nbsp;</TD>
	<TD>F26H11.19<BR>At2g21050</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E84596">E84596</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21050">AUX1-like amino acid permease </A></TD></TR>	
	
<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F16M14.5<BR>At2g38120</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01244">T01244</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38120">unknown protein </A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>T32E8_2<BR>At1g77690</TD>    
	<TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F96806">F96806</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77690">putative AUX1-like permease </A></TD></TR>

<tr class="alt">	<TD>&nbsp;</TD>
	<TD>F7J8_220<BR>AT5g01240</TD>    
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6759447">CAB69852</A></TD>
        <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g01240">LAX1 / AUX1 -like permease</A></TD></TR>	
	
<TR>    <TD ROWSPAN=12 valign=top><B>Permease 1-like family</B></TD>
  <TD>&nbsp;</TD>
       <TD>F5I14_31<BR>At1g65550</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D96680">D96680</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65550">permease 1, putative</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>MQB2_190<BR>AT5g62890</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177467">BAB10858</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g62890">permease 1 - like protein</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>F2J10_14<BR>At1g49960</TD>
       <TD>&nbsp;</TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g49960">permease, putative</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>T2K10_8<BR>At1g60030</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F96624">F96624</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60030">permease, putative</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>K9P8_13<BR>AT5g49990</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758398">BAB08803</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g49990">permease</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>F20D10_170<BR>AT4g38050</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4467111">CAB37545</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38050">putative protein</A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>T25M19.4<BR>At2g05760</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4662639">AAD26910</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g05760">putative membrane transporter</A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>T10O24_15<BR>At1g10540</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=5091547">AAD39576</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10540">putative permease</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>T9J22.18<BR>At2g26510</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T00984">T00984</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26510">putative membrane transporter</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>F13P17.3<BR>At2g34190</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T02307">T02307</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34190">putative membrane transporter</A></TD></TR>  

<TR>   <TD>&nbsp;</TD>
       <TD>F18G18_160<BR>AT5g25420</TD>
       <TD>&nbsp;</TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g25420">permease 1-like protein</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>F15K20.9<BR>At2g27810</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3860251">AAC73019</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g27810">putative membrane transporter</A></TD></TR>
       
<tr class="alt">    <TD ROWSPAN=23 valign=top><B>Amino acid permease family</B></TD>
       <TD>&nbsp;</TD>
       <TD>F11I4_17<BR>At1g48640</TD>
       <TD>&nbsp;</TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48640">lysine and histidine specific transporter, putative</A></TD></TR>
       
<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F1O11.22<BR>At2g36590</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D84782">D84782</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36590">putative proline transporter</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>K1B16_3<BR>AT5g40780</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177957">BAB11340</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g40780">amino acid permease</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>T12J5_50<BR>AT4g35180</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4455344">CAB36725</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g35180">amino acid permease - like protein </A></TD></TR>  

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F21J9_260<BR>At1g24400</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C86378">C86378</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24400">putative lysine/histidine-specific permease</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F19C14_3<BR>At1g58360</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A48187">A48187</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g58360">amino acid permease I</A></TD></TR>
       
<tr class="alt">   <TD>&nbsp;</TD>
       <TD>K16L22_8<BR>AT5g41800</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177364">BAB10655</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g41800">amino acid permease-like protein; proline transporter-like protein</A></TD></TR>
       
<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F2J7_5<BR>At1g25530</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F86385">F86385</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g25530"> lysine and histidine specific transporter, putative</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F12B7_20<BR>At1g67640</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6382531">AAF07813</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67640">amino acid permease, putative</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F11P17_1<BR>At1g61270</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2443875">AAB71468</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61270">amino acid permease, putative</A></TD></TR>  

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>MGI19_5<BR>AT5g63850</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177673">BAB11033</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g63850">amino acid transporter AAP4 (pir||S51169)</A></TD></TR>

 <tr class="alt">   <TD>&nbsp;</TD>
       <TD>MNI5_1<BR>AT5g49630</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T50691">T50691</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g49630">amino acid permease 6 (emb|CAA65051.1)</A></TD></TR>
       
<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F1I16_150<BR>AT3g55740</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T47713">T47713</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55740">proline transporter 2 </A></TD></TR>
       
<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F28J7_9<BR>AT3g01760</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6091720">AAF03432</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01760">putative amino acid permease</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>T23G18_9<BR>At1g08230</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6579208">AAF18251</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08230">hypothetical protein</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>T28M21.5<BR>At2g39890</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T50692">T50692</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39890">proline transporter 1 </A></TD></TR>  

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F2P24_9<BR>At1g77380</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H96802">H96802</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77380">amino acid carrier, putative</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>MRO11_15<BR>AT5g23810</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176848">BAB10054</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g23810">amino acid transporter</A></TD></TR>
       
<tr class="alt">   <TD>&nbsp;</TD>
       <TD>T27I1_3<BR>At1g10010</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3540179">AAC34329</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10010">putative amino acid permease </A></TD></TR>
       
<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F14O23_2<BR>At1g71680</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6682613">AAF23334</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71680">amino acid permease, putative</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>T7O23_19<BR>At1g44100</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=608673">CAA54632</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g44100">amino acid permease, putative </A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>T5E8_20<BR>AT5g09220</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S52421">S52421</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g09220">amino acid transport protein AAP2</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F16N3_4<BR>At1g47670 </TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F96517">F96517</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g47670 ">lysine and histidine specific transporter, putative</A></TD></TR>  

<TR>    <TD ROWSPAN=16 valign=top><B>Putative phosphate/phosphoenolpyruvate<BR> translocator protein family</B></TD>
       <TD>&nbsp;</TD>
       <TD>F2I11_120<BR>AT5g11230</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8953385">CAB96658</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g11230">putative protein</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>MLN21_19<BR>AT3g14410</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9279588">BAB01046</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g14410">hypothetical protein </A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>F21E1_80<BR>AT5g04160</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9955571">CAC05498</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g04160">phosphate/phosphoenolpyruvate translocator - like protein</A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>MJJ3_24<BR>AT5g05820</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759107">BAB09676</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g05820">phosphate/phosphoenolpyruvate translocator protein-like</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>F14P13_11<BR>AT3g10290</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6056196">AAF02813</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g10290">unknown protein</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>MTO12_2<BR>AT3g17430</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9229387">BAA99790</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g17430">unknown protein</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>T5M16_20<BR>At1g77610</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=F96805">F96805</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77610">unknown protein</A></TD></TR>  

<TR>   <TD>&nbsp;</TD>
       <TD>F13B15.18<BR>At2g25520</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4432863">AAD20711</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25520">putative phosphate/phosphoenolpyruvate translocator protein </A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>T12C24_29<BR>At1g12500</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778643">AAF79651</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g12500">hypothetical protein</A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>F22G10_26<BR>At1g53660</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G96576">G96576</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53660">phosphate/phosphoenolpyruvate translocator precursor, putative</A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>F11B9_126<BR>AT3g11320</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10645555">AAG21665</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g11320"> integral membrane protein, putative</A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>F24K9_10<BR>AT3g11430</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6006882">AAF00657</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g11430">unknown protein </A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>F8B4_90<BR>AT4g32390</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4049341">CAA22566</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g32390">putative protein </A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>F18G18_140<BR>AT5g25400</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8953385">CAB96658</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g25400">putative protein </A></TD></TR>  

<TR>   <TD>&nbsp;</TD>
       <TD>T26F17_4<BR>At1g21870</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6552731">AAF16530</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g21870">glucose 6 phosphate/phosphate translocator, putative </A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>F21D18_4<BR>At1g48230</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778534">AAF79542</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48230"> unknown protein</A></TD></TR>
       
<tr class="alt">    <TD ROWSPAN=2 valign=top><B>Putative nucleotide-sugar<BR>transporter family</B></TD>   <TD>&nbsp;</TD>
       <TD>T10F5.19<BR>At2g13650</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E84509">E84509</A></TD><TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g13650">putative vanadate resistance protein</A></TD></TR>
       
<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F22G5_31<BR>At1g07290</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=8778553">AAF79561</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07290">hypothetical protein </A></TD></TR>

<TR>    <TD ROWSPAN=1 valign=top><B>Putative glucose-6-phosphate/<BR>phosphate-translocator family</B></TD>
       <TD>&nbsp;</TD>
       <TD>T24M8_5<BR>AT4g03950</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01868">T01868</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g03950">putative glucose-6-phosphate/phosphate-translocator </A></TD></TR>

<tr class="alt">    <TD ROWSPAN=8 valign=top><B>Putative cationic amino acid<BR>transporter family</B></TD>
       <TD>&nbsp;</TD>
       <TD>T21E18_1<BR>At1g05940</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E86194">E86194</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05940">hypothetical protein</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F7J7_60<BR>AT4g21120</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=S51171">S51171</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g21120">amino acid transport protein AAT1 </A></TD></TR>  

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F20D23_19<BR>At1g17120</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A86307">A86307</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17120">putative amino acid transporter</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>MUK11_9<BR>AT5g04770</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758452">BAB08981</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g04770">amino acid transport - like protein</A></TD></TR>
       
<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F13M14_11<BR>AT3g10600</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6119523">AAF04167</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g10600">putative amino acid transporter</A></TD></TR>
       
<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F20H23_25<BR>AT3g03720</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6006869">AAF00645</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g03720">putative cationic amino acid transporter </A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>MLF18_60<BR>AT5g36940</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10178213">BAB11637</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g36940">cationic amino acid transporter -like protein</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F19I3.19<BR>At2g34960</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3033391">AAC12835</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34960">putative amino acid transporter</A></TD></TR>

<TR>    <TD ROWSPAN=5 valign=top><B>Na+-dependent inorganic phosphate<BR>cotransporter-like protein family</B></TD>   <TD>&nbsp;</TD>
       <TD>T27A16.25<BR>At2g29650</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3582333">AAC35230</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29650">putative Na+-dependent inorganic phosphate cotransporter</A></TD></TR>  

<TR>   <TD>&nbsp;</TD>
       <TD>T8P21.3<BR>At2g38060</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4895179">AAD32766</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38060">putative Na+-dependent inorganic phosphate cotransporter</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>F13I12_30<BR>AT3g46980</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6522579">CAB61944</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g46980">putative protein </A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>A_IG005I10_nn<BR>AT4g00370</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01534">T01534</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g00370">not found</A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>K9L2_16<BR>AT5g44370</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10176892">BAB10122</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g44370">Na+-dependent inorganic phosphate cotransporter-like protein</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=2 valign=top><B>UDP-galactose transporter related<BR>protein-like family</B></TD>
       <TD>&nbsp;</TD>
       <TD>F12M12_150<BR>AT3g46180</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7799006">CAB90945</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g46180">putative protein</A></TD></TR>

 <tr class="alt">  <TD>&nbsp;</TD>
       <TD>mth12_140<BR>AT5g59740</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758839">BAB09511</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g59740">protein serine /threonine kinase - like protein </A></TD></TR>

<TR>    <TD ROWSPAN=18 valign=top><B>Purine permease family</B></TD>
  <TD>&nbsp;</TD>
       <TD>68103_m00109<BR>At1g57980</TD>
       <TD>&nbsp;</TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g57980">hypothetical protein </A></TD></TR>  

<TR>   <TD>&nbsp;</TD>
       <TD>68103_m00110<BR>At1g57990</TD>
       <TD>&nbsp;</TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g57990">unknown protein</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>MEE6_23<BR>AT5g41160</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9759162">BAB09718</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g41160">purine permease-like protein</A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>F1B16_7<BR>At1g75470</TD>
       <TD>&nbsp;</TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75470">hypothetical protein </A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>F27D4.13<BR>At2g24220</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=A84634">A84634</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24220">hypothetical protein </A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>T32A17_10<BR>AT4g08700</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C85087">C85087</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g08700">putative protein</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>F3H9_10<BR>At1g28230</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D86408">D86408</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g28230">purine permease</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>F3H9_11<BR>At1g28220</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C86408">C86408</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g28220">purine permease, putative</A></TD></TR>  

<TR>   <TD>&nbsp;</TD>
       <TD>F6F9_13<BR>At1g19770</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G86330">G86330</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19770">unknown protein</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>F21M12_25<BR>At1g09860</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H86232">H86232</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09860">unknown protein</A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>T1B8.6<BR>At2g33750</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B84749">B84749</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33750">hypothetical protein</A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>T12C22_2<BR>At1g44750</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D96506">D96506</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g44750">hypothetical protein</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>T17H7_15<BR>At1g30840</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4926830">AAD32940</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30840">hypothetical protein </A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>T9A21_30<BR>AT4g18190</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2832692">CAA16790</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18190">putative protein</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>T9A21_50<BR>AT4g18200</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2832694">CAA16792</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18200">putative protein </A></TD></TR>  

<TR>   <TD>&nbsp;</TD>
       <TD>T9A21_60<BR>AT4g18210</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2832695">CAA16793</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18210">putative protein </A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>T9A21_70<BR>AT4g18220</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2832696">CAA16794</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18220">putative protein </A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>F16N3_30<BR>At1g47590</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E96516">E96516</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g47590">hypothetical protein</A></TD></TR>
       
<tr class="alt">    <TD ROWSPAN=2 valign=top><B>Transporter like protein family</B></TD>
        <TD>&nbsp;</TD>
       <TD>AT5g03570</TD>
       <TD>&nbsp;</TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g03570">putative protein</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>T19C21.5<BR>At2g38460</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3395426">AAC28758</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38460">unknown protein</A></TD></TR>

<TR>    <TD ROWSPAN=8 valign=top><B>Putative nucleoside transporter family</B></TD>   <TD>&nbsp;</TD>
       <TD>C17L7_30<BR>AT4g05110</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267270">CAB81053</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g05110">putative protein</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>C17L7_40<BR>AT4g05120</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267271">CAB81054</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g05120">putative protein</A></TD></TR>  

<TR>   <TD>&nbsp;</TD>
       <TD>C17L7_50<BR>AT4g05130</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267272">CAB81055</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g05130">putative protein </A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>C17L7_60<BR>AT4g05140</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7267273">CAB81056</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g05140">putative protein </A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>T25B24_2<BR>At1g61630</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G96641">G96641</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61630">hypothetical protein</A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>T22K18_20<BR>AT3g09990</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6143877">AAF04424</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g09990">hypothetical protein</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>F17O7_24<BR>At1g70330</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01489">T01489</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70330">unknown protein</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>T14P4_12<BR>At1g02630</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C86156">C86156</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02630">hypothetical protein</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=3 valign=top><B>Sugar transporter-like protein family</B></TD>   <TD>&nbsp;</TD>
       <TD>F23E12_140<BR>AT4g35300</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3080420">CAA18739</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g35300">putative sugar transporter protein</A></TD></TR>  

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F9H16_19<BR>At1g20840</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=H86340">H86340</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20840">putative sugar transporter protein </A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F26O13_130<BR>AT3g51490</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T45780">T45780</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g51490">sugar transporter-like protein </A></TD></TR>
       
<TR>    <TD ROWSPAN=2 valign=top><B>CMP-sialic acid transporter-like<BR>protein family</B></TD>   <TD>&nbsp;</TD>
       <TD>F23E12_100<BR>AT4g35340</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T06123">T06123</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g35340">UDP-galactose transporter - like protein </A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>K16L22_3<BR>AT5g41760</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177360">BAB10651</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g41760">CMP-sialic acid transporter-like protein</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=5 valign=top><B>Putative Na+ dependent ileal bile acid<BR> transporter family</B></TD>   <TD>&nbsp;</TD>
       <TD>T12H17_230<BR>AT4g22840</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=2827561">CAA16569</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g22840">predicted protein</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>MWL2_2<BR>AT3g25410</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9279722">BAB01312</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g25410">unknown protein</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>T30F21_29<BR>At1g78560</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=B96814">B96814</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78560">unknown protein</A></TD></TR>  

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F12C20.6<BR>At2g26900</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=3426051">AAC32250</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26900">putative Na+ dependent ileal bile acid transporter </A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F16J13_100<BR>AT4g12030</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4586108">CAB40944</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g12030">putative transport protein </A></TD></TR>
       
<TR>    <TD ROWSPAN=3 valign=top><B>Putative tetracycline transporter<BR> protein family</B></TD>
       <TD>&nbsp;</TD>
       <TD>F12A24.15 <BR>At2g16970</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=E84546">E84546</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16970">putative tetracycline transporter protein</A></TD></TR>
       
<TR>   <TD>&nbsp;</TD>
       <TD>F12A24.16<BR>At2g16980</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6598356">AAF18594</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16980">putative tetracycline transporter protein</A></TD></TR>

<TR>   <TD>&nbsp;</TD>
       <TD>F6P23.2<BR>At2g16990</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=G84546">G84546</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16990">tetracycline transporter-like protein</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=3 valign=top><B>Amino acid transport protein family</B></TD>   <TD>&nbsp;</TD>
       <TD>F22I13_20<BR>AT4g38250</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4539333">CAB37481</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38250">putative amino acid transport protein</A></TD></TR>

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>F26K24_19<BR>AT3g11900</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=6671946">AAF23206</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g11900">putative amino acid transporter protein </A></TD></TR>  

<tr class="alt">   <TD>&nbsp;</TD>
       <TD>K2A18_5<BR>AT5g65990</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=10177114">BAB10404</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g65990">amino acid transporter protein-like</A></TD></TR>

<TR>    <TD ROWSPAN=1 valign=top><B>Amino acid permease</B></TD><TD>&nbsp;</TD>
    <TD>F10A8.5<BR>At2g01170</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=4262224">AAD14517</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01170">putative amino acid permease</A></TD></TR>
       
<tr class="alt">    <TD ROWSPAN=1 valign=top><B>Uracil transporter-like protein</B></TD>
       <TD>&nbsp;</TD>
       <TD>AT5g03555</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T48383">T48383</A></TD>
       <TD>&nbsp;</TD></TR>
       
<TR>    <TD ROWSPAN=1 valign=top><B>Putative peptide/amino acid<BR>transporter </B></TD>
  <TD>&nbsp;</TD>
       <TD>F16M14.3<BR>At2g38100</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=T01242">T01242</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38100">putative peptide/amino acid transporter</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=1 valign=top><B>IAA-alanine resistance protein 1 </B></TD>  <TD>&nbsp;</TD>
       <TD>T23K23_5<BR>At1g68100</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C96704">C96704</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68100">unknown protein</A></TD></TR>

<TR>    <TD ROWSPAN=1 valign=top><B>Putative cation transport protein</B></TD>   <TD>&nbsp;</TD>
       <TD>F7D11.2<BR>At2g04620</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=D84459">D84459</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g04620">putative cation transport protein</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=1 valign=top><B>Putative tyrosine-specific transport protein </B></TD>   <TD>&nbsp;</TD>
       <TD>F4P9.3<BR>At2g33260</TD>
       <TD><A HREF="http://www-nbrf.georgetown.edu/cgi-bin/nbrfget?uid=C84743">C84743</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33260">putative tyrosine-specific transport protein</A></TD></TR>  

<TR>    <TD ROWSPAN=1 valign=top><B>Urea active transporter-like protein </B></TD>   <TD>&nbsp;</TD>
       <TD>MFC19_5<BR>AT5g45380</TD>
       <TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=9758728">BAB09166</A></TD>
       <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g45380">urea active transporter-like protein</A></TD></TR>

<tr class="alt">    <TD ROWSPAN=1 valign=top><B>The Nucleobase:Cation Symporter-1 (NCS1) Family</B></TD>   <TD>&nbsp;</TD>      
      <TD><TD>&nbsp;<BR>AT5g03560</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=Protein&dopt=GenPept&list_uids=7378643">CAB83319</A></TD>
        <td>&nbsp;</TD></TR>
  </TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
