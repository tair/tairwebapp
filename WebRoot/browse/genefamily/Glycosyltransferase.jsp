<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Glycosyltransferase Gene Families";
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
 





<A NAME="Glycosyltransferase.html"> <h2>Glycosyltransferase Gene Families</h2></A>
<TABLE><TR>

<TD valign=top><B>Source:</B></TD>
<TD><a href="http://www.cazy.org/" target="display"><B>Carbohydrate-Active enZymes server</B></a><B> (CAZy)</B><BR><BR>  
<a href="http://www.cazy.org/fam/acc_CE.html" target="display">Carbohydrate Esterases Family Server</a><BR>
<a href="http://www.cazy.org/fam/acc_GH.html" target="display">Glycoside Hydrolases Family Server</a><BR>
<a href="http://www.cazy.org/fam/acc_GT.html" target="display">Glycosyltransferase Family Server</a><BR>
<a href="http://www.cazy.org/fam/acc_PL.html" target="display">Polysaccharide Lyases Family Server</a>
</TD></TR>

<TD valign=top><B>Source:</B></TD>
<TD><A Href="http://www.P450.kvl.dk"> <B><a href="http://www.cazy.org/fam/PL1.html">Glycosyltransferase Family 1 Site at PlaCe</B><br> <A HREF="/servlets/Community?action=view&type=person&communityID=958" target="display">Dr. Soren Bak</A></td></tr>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD> </TD></TR>

<TR><TD valign=top><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=912146" target="display">Bernard Henrissat</A><BR><A href="/servlets/Community?action=view&type=person&communityID=912144" target="display">Pedro M.Coutinho</A><BR><A href="mailto:emeline@afmb.cnrs-mrs.fr">Emeline Deleury</A></TD></TR>

</TABLE>
<p>

	     <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th>    
	    </TR>
	    

<tr class="alt">    <TD ROWSPAN=119 valign=top><B><a href="http://www.cazy.org/fam/GT1.html">Glycosyltransferase- Family 1</a></b></td>
	      <TD>&nbsp;</TD>
	      <TD>K21L13.6<br><a href="/servlets/TairObject?type=locus&name=At5g65550">At5g65550</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA98174.1">BAA98174.1</A></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g65550">anthocyanidin-3-glucoside rhamnosyltransferase</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB58497.1">AAB58497.1 </A></TD>
	      <TD>&nbsp;</TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MJP23.2<br><a href="/servlets/TairObject?type=locus&name=At5g54060">At5g54060</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA97127.1">BAA97127.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g54060">flavonol 3-O-glucosyltransferase-like</A></TD></TR>



<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>K2I5.5<br><a href="/servlets/TairObject?type=locus&name=At5g49690">At5g49690</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA98157.1">BAA98157.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49690">anthocyanidin-3-glucoside rhamnosyltransferase-like</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T15G18_80<BR><a href="/servlets/TairObject?type=locus&name=AT4g09500">AT4g09500</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB78073.1">CAB78073.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g09500">putative protein </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>FCAALL.191<br><a href="/servlets/TairObject?type=locus&name=AT4g14100">AT4g14100</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10189.1">CAB10189.1</A></TD>
	      <TD>&nbsp;</TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>dl3680c<BR><a href="/servlets/TairObject?type=locus&name=AT4g15270">AT4g15270</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10306.1">CAB10306.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15270">UTP-glucose glucosyltransferase like protein </A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T29A15_50<BR><a href="/servlets/TairObject?type=locus&name=AT4g27560">AT4g27560</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB38268.1">CAB38268.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g27560">UDP rhamnose-anthocyanidin-3-glucoside<br> rhamnosyltransferase - like
 protein </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F9O13.3<BR><a href="/servlets/TairObject?type=locus&name=At2g15480">At2g15480</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD17392.1">AAD17392.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15480">putative glucosyltransferase </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F9O13.4<BR><a href="/servlets/TairObject?type=locus&name=At2g15490">At2g15490</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD17393.1">AAD17393.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15490">putative glucosyltransferase </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F12A24.7<BR><a href="/servlets/TairObject?type=locus&name=At2g16890">At2g16890</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC64220.1">AAC64220.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16890">putative glucosyltransferase </A></TD></TR>	



<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T20K9.14<BR><a href="/servlets/TairObject?type=locus&name=At2g22930">At2g22930</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC32440.1">AAC32440.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g22930">putative flavonol 3-O-glucosyltransferase </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T27A16.19<BR><a href="/servlets/TairObject?type=locus&name=At2g29710">At2g29710</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC35240.1">AAC35240.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29710">putative flavonol 3-O-glucosyltransferase </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T27A16.17<BR><a href="/servlets/TairObject?type=locus&name=At2g29730">At2g29730</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC35239.1">AAC35239.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29730">putative flavonol 3-O-glucosyltransferase</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T27A16.16<BR><a href="/servlets/TairObject?type=locus&name=At2g29740">At2g29740</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC35238.1">AAC35238.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29740">putative flavonol 3-O-glucosyltransferase </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T27A16.15<BR><a href="/servlets/TairObject?type=locus&name=At2g29750">At2g29750</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC35226.1">AAC35226.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29750">putative flavonol 3-O-glucosyltransferase </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F20M17.21<BR><a href="/servlets/TairObject?type=locus&name=At2g31750">At2g31750</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD32297.1">AAD32297.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31750">putative glucosyltransferase </A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F20M17.17<BR><a href="/servlets/TairObject?type=locus&name=At2g31790">At2g31790</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD32293.1">AAD32293.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31790">putative glucosyltransferase</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T1J8.15<BR><a href="/servlets/TairObject?type=locus&name=At2g36970">At2g36970</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD31582.1">AAD31582.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36970">putative glucosyltransferase </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MSD21_6<BR><a href="/servlets/TairObject?type=locus&name=AT3g21750">AT3g21750</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK32764.1">AAK32764.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g21750">putative UDP-glucose glucosyltransferase</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MSD21_7<br><a href="/servlets/TairObject?type=locus&name=AT3g21760">AT3g21760</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK50110.1">AAK50110.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g21760"> putative UDP-glucose glucosyltransferase </A></TD></TR>	



<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F2N1_15<BR><a href="/servlets/TairObject?type=locus&name=AT4g01070">AT4g01070</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB80916.1">CAB80916.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g01070">putative flavonol glucosyltransferase</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>C7A10_590<BR><a href="/servlets/TairObject?type=locus&name=AT4g36770">AT4g36770</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB16822.1">CAB16822.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g36770">glucosyltransferase-like protein </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>dl3675w<BR><a href="/servlets/TairObject?type=locus&name=AT4g15260">AT4g15260</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10305.1">CAB10305.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15260">glucosyltransferase </A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> dl3685w<BR><a href="/servlets/TairObject?type=locus&name=AT4g15280">AT4g15280</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10307.1">CAB10307.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15280">UTP-glucose glucosyltransferase </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>dl3780c<BR><a href="/servlets/TairObject?type=locus&name=AT4g15480">AT4g15480</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10326.1">CAB10326.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15480">indole-3-acetate beta-glucosyltransferase like protein </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>dl3785c<BR><a href="/servlets/TairObject?type=locus&name=AT4g15490">AT4g15490</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10327.1">CAB10327.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15490">indole-3-acetate beta-glucosyltransferase like protein</A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>dl3790c<BR><a href="/servlets/TairObject?type=locus&name=AT4g15500">AT4g15500</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10328.1">CAB10328.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15500">indole-3-acetate beta-glucosyltransferase like protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>dl3815c<BR><a href="/servlets/TairObject?type=locus&name=AT4g15550">AT4g15550</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10333.1">CAB10333.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15550">glucosyltransferase like protein </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F10K1.3<BR><a href="/servlets/TairObject?type=locus&name=At1g07260">At1g07260</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF82195.1">AAF82195.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07260">UDP-glucose glucosyltransferase, putative </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F10K1.4<BR><a href="/servlets/TairObject?type=locus&name=At1g07250">At1g07250</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG18592.1>">AAG18592.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07250">UDP-glucose glucosyltransferase, putative </A></TD></tr>

		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F10K1.5<BR><a href="/servlets/TairObject?type=locus&name=At1g07240">At1g07240</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG18591.1>">AAG18591.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07240">UDP-glucose glucosyltransferase, putative</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F11B9.23<br>F24K9.1</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG50970.1">AAG50970 </A></TD>
	      <TD>&nbsp;</TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F11F12.10 <br>F17J6.10<BR><a href="/servlets/TairObject?type=locus&name=At1g50580">At1g50580</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF87877.1">AAF87877.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g50580">putative indole-3-acetate beta-glucosyltransferase </A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F11M15.8<BR><a href="/servlets/TairObject?type=locus&name=At1g51210">At1g51210</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD30635.1">AAD30635.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51210">putative glucosyl transferase</A></TD></TR>	
<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F12A12.170<br><a href="/servlets/TairObject?type=locus&name=At3g46650">At3g46650</a></TD>
	      <TD><A HREF=""http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB62335.1">CAB62335.1</A></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g46650">glucosyltransferase-like protein</A></TD></TR>


	      
<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F12A12.180<br><a href="/servlets/TairObject?type=locus&name=At3g46660">At3g46660</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB62336.1">CAB62336.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g46660">glucosyltransferase-like protein</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F12A12.190<br><a href="/servlets/TairObject?type=locus&name=At3g46670">At3g46670</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB62336.1">CAB62336.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g46670">glucosyltransferase-like protein </A></TD></TR>
	      

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F12A12.200<br><a href="/servlets/TairObject?type=locus&name=At3g46680">At3g46680</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB62338.1">CAB62338.1 </A></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g46680">glucosyltransferase-like protein</A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F12E4_260<BR><a href="/servlets/TairObject?type=locus&name=AT5g03490">AT5g03490</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB83309.1">CAB83309.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g03490">putative protein </A></TD></TR>		  
<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F12K8.26<BR><a href="/servlets/TairObject?type=locus&name=At1g22400">At1g22400</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF18537.1 ">AAF18537.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22400">UDP-glucose glucosyltransferase, putative </A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F13K3.15<BR><a href="/servlets/TairObject?type=locus&name=At2g36750">At2g36750</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD20151.1">AAD20151.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36750">putative glucosyl transferase </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F13K3.16<BR><a href="/servlets/TairObject?type=locus&name=At2g36760">At2g36760</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD20152.1">AAD20152.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g3676">putative glucosyl transferase</A></TD></TR>


	      
<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F13K3.17<BR><a href="/servlets/TairObject?type=locus&name=At2g36770">At2g36770</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD20153.1 ">AAD20153.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36770">putative glucosyl transferase</A></TD></TR>		  
<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F13K3.18<BR><a href="/servlets/TairObject?type=locus&name=At2g36780">At2g36780</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD20154.1 ">AAD20154.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36780">putative glucosyl transferase</A></TD></TR>
	      
	      
<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F13K3.19<BR><a href="/servlets/TairObject?type=locus&name=At2g36790">At2g36790</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD20155.1">AAD20155.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36790">putative glucosyl transferase </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F13K3.20<BR><a href="/servlets/TairObject?type=locus&name=At2g36800">At2g36800</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD20156.1 ">AAD20156.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36800">putative glucosyl transferase </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F13O11.21<BR><a href="/servlets/TairObject?type=locus&name=At1g64910">At1g64910</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD38265.1 ">AAD38265.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64910">rhamnosyltransferase, putative</A></TD></TR>		  
<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F13O11.22<BR><a href="/servlets/TairObject?type=locus&name=At1g64920">At1g64920</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD38266.1">AAD38266.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64920">anthocyanidin-3-glucoside rhamnosyltransferase, putative</A></TD></TR>		  



	      
<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F14N23.30<BR><a href="/servlets/TairObject?type=locus&name=At1g10400">At1g10400</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD32892.1">AAD32892.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10400">puative glucosyl transferase </A></TD></TR>	
<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F16F17.1<br><a href="/servlets/TairObject?type=locus&name=At5g38010">At5g38010</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA97533.1">BAA97533.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g38010">glucosyltransferase-like protein</A></TD></TR>
	      

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F16F17.6<br><a href="/servlets/TairObject?type=locus&name=At5g38035">At5g38035</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA97538.1 ">BAA97538.1 </A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g38035">Expressed protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F18B3.20<br><a href="/servlets/TairObject?type=locus&name=At3g50740">At3g50740</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB42903.1">CAB42903.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g50740">UTP-glucose glucosyltransferase - like protein</A></TD></TR>	



<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F18O19.5<BR><a href="/servlets/TairObject?type=locus&name=At2g43840">At2g43840</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB64022.1">AAB64022.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43840">putative glucosyltransferase</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F18O19.7<BR><a href="/servlets/TairObject?type=locus&name=At2g43820">At2g43820</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB64024.1">AAB64024.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43820">putative glucosyltransferase</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F1C9.11<br><a href="/servlets/TairObject?type=locus&name=At3g02100">At3g02100</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF14850.1">AAF14850.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g02100">putative UDP-glucosyl transferase</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F1I16_110<BR><a href="/servlets/TairObject?type=locus&name=AT3g55700">AT3g55700</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB81595.1">CAB81595.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55700">glucuronosyl transferase - like protein </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F1I16_120<BR><a href="/servlets/TairObject?type=locus&name=AT3g55710">AT3g55710</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB81596.1">CAB81596.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55710">glucuronosyl transferase - like protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F24D13.13<BR><a href="/servlets/TairObject?type=locus&name=At2g28080">At2g28080</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC98458.1">AAC98458.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28080">putative glucosyltransferase</A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F24H14.8<BR><a href="/servlets/TairObject?type=locus&name=At2g18570">At2g18570</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD12210.1">AAD12210.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18570">putative flavonol 3-O-glucosyltransferase </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F24H14.9<BR><a href="/servlets/TairObject?type=locus&name=At2g18560">At2g18560</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD12211.1">AAD12211.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18560">putative flavonol 3-O-glucosyltransferase </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F26G16.15<BR><a href="/servlets/TairObject?type=locus&name=At1g30530">At1g30530</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF19756.1">AAF19756.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30530">UDP glucose:flavonoid 3-o-glucosyltransferase, putative</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F28A23.110<BR> <a href="/servlets/TairObject?type=locus&name=AT4g34130">AT4g34130</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA17559.1">CAA17559.1</A></TD>
	      <TD>&nbsp;</TD></TR>	



<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F2K13_180<BR><a href="/servlets/TairObject?type=locus&name=AT5g17030">AT5g17030</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01716.1">CAC01716.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g17030">UDP glucose:flavonoid 3-o-glucosyltransferase -like protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F2K13_190<BR><a href="/servlets/TairObject?type=locus&name=AT5g17040">AT5g17040</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01717.1">CAC01717.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g17040">UDP glucose:flavonoid 3-o-glucosyltransferase -like protein </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F2K13_200<BR><a href="/servlets/TairObject?type=locus&name=AT5g17050">AT5g17050</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01718.1">CAC01718.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g17050">UDP glucose:flavonoid 3-o-glucosyltransferase -like protein</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F2O15.25<br><a href="/servlets/TairObject?type=locus&name=At5g59520">At5g59520</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA97492.1">BAA97492.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59520">putative zinc transporter ZIP2 - like</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F2O15.26<br><a href="/servlets/TairObject?type=locus&name=At5g59530">At5g59530</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA97493.1">BAA97493.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59530">1-aminocyclopropane-1-carboxylate oxidase - like protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F2P9.25<br><a href="/servlets/TairObject?type=locus&name=At1g73880">At1g73880</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF36747.1">AAF36747.1</A></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73880">putative glucosyltransferase</a></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F3F20.12<BR><a href="/servlets/TairObject?type=locus&name=At1g05670">At1g05670</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD30619.1">AAD30619.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05670">putative indole-3-acetate beta-glucosyltransferase </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F3F20.13<BR><a href="/servlets/TairObject?type=locus&name=At1g05680">At1g05680</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD30627.1">AAD30627.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05680">putative indole-3-acetate beta-glucosyltransferase</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F3F9.19<BR><a href="/servlets/TairObject?type=locus&name=At1g78280">At1g78280</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF71803.1">AAF71803.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78280">unknown protein </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F3I6.2<BR><a href="/servlets/TairObject?type=locus&name=At1g24100">At1g24100</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC00570.1">AAC00570.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24100">putative indole-3-acetate beta-glucosyltransferase </A></TD></TR>	



<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F6F3.19<BR><a href="/servlets/TairObject?type=locus&name=At1g01390">At1g01390</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF97324.1">AAF97324.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01390">flavonol 3-o-glucosyltransferase, putative</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F6F3.22<BR><a href="/servlets/TairObject?type=locus&name=At1g01420">At1g01420</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF97321.1">AAF97321.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01420">flavonol 3-o-glucosyltransferase, putative</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F9D12.4<br><a href="/servlets/TairObject?type=locus&name=At5g26310">At5g26310</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC26233.1">AAC26233.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g26310">UTP-glucose glucosyltransferase - like protein</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>K18J17.2<br><a href="/servlets/TairObject?type=locus&name=At5g05870">At5g05870</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10792.1">BAB10792.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g05870">glucuronosyl transferase-like protein</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>K18J17.3<br><a href="/servlets/TairObject?type=locus&name=At5g05880">At5g05880</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10793.1">BAB10793.1</A></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g05880">glucuronosyl transferase-like protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>K18J17.4<br><a href="/servlets/TairObject?type=locus&name=At5g05890">At5g05890</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10794.1">BAB10794.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g05890">glucuronosyl transferase-like protein</a></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>K18J17.5<br><a href="/servlets/TairObject?type=locus&name=At5g05900">At5g05900</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10795.1">BAB10795.1</A></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g05900">glucuronosyl transferase-like protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>K18L3.15</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09041.1">BAB09041.1</A></TD>
	      <TD>&nbsp;</TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>K19P17.16<br><a href="/servlets/TairObject?type=locus&name=At5g53990">At5g53990</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10729.1">BAB10729.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g53990">glycosyltransferase family</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>K19P17.18<br><a href="/servlets/TairObject?type=locus&name=At5g54010">At5g54010</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10731.1">BAB10731.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g54010">glycosyltransferase family</A></TD></TR>	



<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MDC8.15<br><a href="/servlets/TairObject?type=locus&name=At3g16520">At3g16520</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK59856.1">AAK59856.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16520">putative glucosyltransferase</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MJJ3.28<br><a href="/servlets/TairObject?type=locus&name=At5g05860">At5g05860</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10791.1">BAB10791.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g05860">glucuronosyl transferase-like protein</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MMP21.3<br><a href="/servlets/TairObject?type=locus&name=At3g22250">At3g22250</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01943.1">BAB01943.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g22250">glycosyltransferase family</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MSD21.10<br><a href="/servlets/TairObject?type=locus&name=At3g21770">At3g21770</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02841.1">BAB02841.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g21770">peroxidase, putative </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MSD21.11<br><a href="/servlets/TairObject?type=locus&name=At3g21780">At3g21780</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02842.1">BAB02842.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g21780">putative UDP-glucose glucosyltransferase</A> </TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MSD21.9<br><a href="/servlets/TairObject?type=locus&name=At3g21760">At3g21760</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02840.1">BAB02840.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g21760">glycosyltransferase family</A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MSN2.8<br><a href="/servlets/TairObject?type=locus&name=At5g66690">At5g66690</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA97275.1">BAA97275.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g66690">UTP-glucose glucosyltransferase</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MTO24.16</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01199.1">BAB01199.1</A></TD>
	      <TD>&nbsp;</TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F17A9.17<BR><a href="/servlets/TairObject?type=locus&name=AT3g07020">AT3g07020</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF27006.1">AAF27006.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07020">UDP-glucose:sterol glucosyltransferase </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T10P12.7<BR><a href="/servlets/TairObject?type=locus&name=At1g43620">At1g43620</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD39269.1">AAD39269.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=">sterol glucosyltransferase, putative </A></TD></TR>	



<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T16E15.1 fragment<BR><a href="/servlets/TairObject?type=locus&name=At1g22380">At1g22380</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF87254.1">AAF87254.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22380">UDP-glucose glucosyltransferase, putative</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T16E15.2<BR><a href="/servlets/TairObject?type=locus&name=At1g22370">At1g22370</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF87255.1">AAF87255.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22370">UDP-glucose glucosyltransferase, putative</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T16E15.2<BR><a href="/servlets/TairObject?type=locus&name=At1g22370">At1g22370</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF87255.1">AAF87255.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=">UDP-glucose glucosyltransferase, putative</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T16E15.4</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF87258.1">AAF87258.1</A></TD>
	      <TD>&nbsp;</TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T16E15.5<BR><a href="/servlets/TairObject?type=locus&name=At1g22340">At1g22340</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF87257.1">AAF87257.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22340">UDP-glucose glucosyltransferase, putative </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T20D16.11<BR><a href="/servlets/TairObject?type=locus&name=At2g23260">At2g23260</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB87119.1">AAB87119.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g23260">putative glucosyltransferase</A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T20D16.12<BR><a href="/servlets/TairObject?type=locus&name=At2g23250">At2g23250</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB87106.1">AAB87106.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g23250">putative glucosyltransferase </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T20D16.16<BR><a href="/servlets/TairObject?type=locus&name=At2g23210">At2g23210</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB87110.1">AAB87110.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g23210">putative glucosyltransferase </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T21E18.5<BR><a href="/servlets/TairObject?type=locus&name=At1g06000">At1g06000</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF80123.1">AAF80123.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06000">unknown protein </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T24H18_60<BR><a href="/servlets/TairObject?type=locus&name=AT5g12890">AT5g12890</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB88253.1">CAB88253.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g12890">glucosyltransferase -like protein</A></TD></TR>	



<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T25N20.18<BR><a href="/servlets/TairObject?type=locus&name=At1g05530">At1g05530</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF79732.1">AAF79732.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05530">UDP-glucose:indole-3-acetate beta-D-glucosyltransferase, putative </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T27E13.11<BR><a href="/servlets/TairObject?type=locus&name=At2g30150">At2g30150</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC16957.1">AAC16957.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30150">putative glucosyltransferase </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T27E13.12<BR><a href="/servlets/TairObject?type=locus&name=At2g30140">At2g30140</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC16958.1">AAC16958.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30140">putative glucosyltransferase </A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T29A15.60<br> <a href="/servlets/TairObject?type=locus&name=AT4g27570">AT4g27570</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB38269.1">CAB38269.1</A></TD>
	      <TD>&nbsp;</TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T4D2.80</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB64218.1">CAB64218.1</A></TD>
	      <TD>&nbsp;</TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T4D2.90<br><a href="/servlets/TairObject?type=locus&name=At3g53160">At3g53160</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB64219.1">CAB64219.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g53160">glucosyltransferase - like protein</A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T6H20.250<BR><a href="/servlets/TairObject?type=locus&name=AT3g46720">AT3g46720</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB51193.1">CAB51193.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g46720">glucuronosyl transferase-like protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T6H20.270<BR><a href="/servlets/TairObject?type=locus&name=AT3g46700">AT3g46700</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB51195.1">CAB51195.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g46700">glucuronosyl transferase-like protein </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T6H20.280<BR><a href="/servlets/TairObject?type=locus&name=AT3g46690">AT3g46690</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB51196.1">CAB51196.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g46690">glucuronosyl transferase-like protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T9I22.3<BR><a href="/servlets/TairObject?type=locus&name=At2g22590">At2g22590</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD15567.1">AAD15567.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g22590">putative anthocyanidin-3-glucoside rhamnosyltransferase </A></TD></TR>	



<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T9J22.15<BR><a href="/servlets/TairObject?type=locus&name=At2g26480">At2g26480</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC14497.1">AAC14497.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26480">putative glucosyltransferase </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T9L3_160<BR><a href="/servlets/TairObject?type=locus&name=AT5g14860">AT5g14860</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01885.1">CAC01885.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g14860">glucosyltransferase -like protein</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD><a href="/servlets/TairObject?type=locus&name=AT4g34130">AT4g34130</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK59668.1">AAK59668.1</A></TD>
	      <TD>&nbsp;</TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T16E15.3<BR><a href="/servlets/TairObject?type=locus&name=At1g22360">At1g22360</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA34687.1">BAA34687.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22360">UDP-glucose glucosyltransferase</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MIL23.13<br><a href="/servlets/TairObject?type=locus&name=At3g21560">At3g21560</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02351.1">BAB02351.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g21560">UDP-glucosyltransferase, putative</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T25N20_20<BR><a href="/servlets/TairObject?type=locus&name=At1g05560">At1g05560</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK32944.1">AAK32944.1</A></TD>
	      <TD>&nbsp;</TD></TR>	


<TR>	      <TD ROWSPAN=48 valign=top><B><a href="http://www.cazy.org/fam/GT2.html">Glycosyltransferase- Family 2</a></b></TD><TD>&nbsp;</TD>
	      <TD>K2A11.4<br><a href="/servlets/TairObject?type=locus&name=At5g05170">At5g05170</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC39336.1">AAC39336.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g05170">cellulose synthase catalytic subunit (gb|AAC39336.1)</A></TD></TR>		  

<TR>	      <TD>&nbsp;</TD>
	      <TD>F28A21.190<br><a href="/servlets/TairObject?type=locus&name=AT4g18780">AT4g18780</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB37463.1">CAB37463.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18780">cellulose synthase - like protein</A></TD></TR>	

<TR>	      <TD>&nbsp;</TD>
	      <TD>F28A21.190<br><a href="/servlets/TairObject?type=locus&name=AT4g18780">AT4g18780</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD32031.1">AAD32031.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18780">cellulose synthase - like protein</A></TD></TR>		  


<TR>	      <TD>&nbsp;</TD>
	      <TD>T22F8.250<br><a href="/servlets/TairObject?type=locus&name=AT4g39350">AT4g39350</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC39335.1">AAC39335.1</A></TD>
	      <TD>&nbsp;</TD></TR>		  

<TR>	      <TD>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC29067.1">AAC29067.1</A></TD>
	      <TD>&nbsp;</TD></TR>	

<TR>	      <TD>&nbsp;</TD>
	      <TD>dl3690c<BR><a href="/servlets/TairObject?type=locus&name=AT4g15290">AT4g15290</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10308.1">CAB10308.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15290">cellulose synthase like protein</A></TD></TR>

<TR>	      <TD>&nbsp;</TD>
	      <TD>dl3705c<br><a href="/servlets/TairObject?type=locus&name=AT4g15320">AT4g15320</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10311.1">CAB10311.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15320">cellulose synthase like protein </A></TD></TR>	

<TR>	      <TD>&nbsp;</TD>
	      <TD> F28M20.220<br><a href="/servlets/TairObject?type=locus&name=AT4g31590">AT4g31590</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19764.1">CAA19764.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g31590">putative protein</A></TD></TR>		  

<TR>	      <TD>&nbsp;</TD>
	      <TD>F25P17.7<br><a href="/servlets/TairObject?type=locus&name=At2g24630">At2g24630</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD23884.1">AAD23884.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24630">putative glucosyltransferase</A></TD></TR>	


<TR>	      <TD>&nbsp;</TD>
	      <TD>F13B15.20<br><a href="/servlets/TairObject?type=locus&name=At2g25540">At2g25540</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD20713.1">AAD20713.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25540">putative cellulose synthase catalytic subunit </A></TD></TR>		  

<TR>	      <TD>&nbsp;</TD>
	      <TD>MVP7_7<br><a href="/servlets/TairObject?type=locus&name=AT5g64740">AT5g64740</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK53023.1">AAK53023.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64740">cellulose synthase catalytic subunit </A></TD></TR>	

<TR>	      <TD>&nbsp;</TD>
	      <TD>dl4320w<br>AT4g16590 (fragment)</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10434.1">CAB10434.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g16590">cellulose synthase like protein</A></TD></TR>		  

<TR>	      <TD>&nbsp;</TD>
	      <TD>F14J16.9<BR><a href="/servlets/TairObject?type=locus&name=At1g55850">At1g55850</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF79313.1">AAF79313.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55850">cellulose synthase catalytic subunit, putative</A></TD></TR>	



<TR>	      <TD>&nbsp;</TD>
	      <TD>F17C15_180 (MED24.4)<BR><a href="/servlets/TairObject?type=locus&name=AT5g03760">AT5g03760</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB08601.1">BAB08601.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g03760">putative protein</A></TD></TR>		  

<TR>          <td>&nbsp;</td> 
	      <TD>F1K3.3<br><a href="/servlets/TairObject?type=locus&name=AT4g07960">AT4g07960</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD15482.1">AAD15482.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g07960">putative glucosyltransferase </A></TD></TR>	

<TR>          <td>&nbsp;</td> 
	      <TD>F20D10.310<BR><a href="/servlets/TairObject?type=locus&name=AT4g38190">AT4g38190</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB37559.1">CAB37559.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38190">putative protein</A></TD></TR>

<TR>          <td>&nbsp;</td> 
	      <TD>F21O3.4<BR><a href="/servlets/TairObject?type=locus&name=AT3g07330">AT3g07330</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF02144.1">AAF02144.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07330">unknown protein</A></TD></TR>	

<TR>          <td>&nbsp;</td> 
	      <TD> F22D16.26</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF02892.1">AAF02892.1</A></TD>
	      <TD>&nbsp;</TD></TR>		  

<TR>          <td>&nbsp;</td> 
	      <TD> F25I18.16<BR><a href="/servlets/TairObject?type=locus&name=At2g33100">At2g33100</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC04910.1">AAC04910.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33100">putative cellulose synthase</A></TD></TR>	


<TR>          <td>&nbsp;</td> 
	      <TD> F27K19_180<BR><a href="/servlets/TairObject?type=locus&name=AT3g56000">AT3g56000</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB87854.1">CAB87854.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g56000">putative protein</A></TD></TR>		  

<TR>          <td>&nbsp;</td> 
	      <TD> F28C11.11<BR><a href="/servlets/TairObject?type=locus&name=At1g23480">At1g23480</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF79586.1">AAF79586.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23480">hypothetical protein</A></TD></TR>	

<TR>          <td>&nbsp;</td> 
	      <TD> F2D10.6<BR><a href="/servlets/TairObject?type=locus&name=At1g20570">At1g20570</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF80640.1">AAF80640.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20570">dolichol-phosphate-mannose synthase, putative</A></TD></TR>		  

<TR>          <td>&nbsp;</td> 
	      <TD> F2K13_60<BR><a href="/servlets/TairObject?type=locus&name=AT5g16910">AT5g16910</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01704.1">CAC01704.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g16910">cellulose synthase catalytic subunit -like protein</A></TD></TR>	



<TR>          <td>&nbsp;</td> 
	      <TD> F3C3.4<BR><a href="/servlets/TairObject?type=locus&name=At1g32180">At1g32180</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG23436.1">AAG23436.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32180">cellulose synthase catalytic subunit, putative </A></TD></TR>		  

<TR>          <td>&nbsp;</td> 
	      <TD> F5M15.10</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF79605.1">AAF79605.1</A></TD>
	      <TD>&nbsp;</TD></TR>	

<TR>          <td>&nbsp;</td> 
	      <TD> F5O8.4</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC98005.1">AAC98005.1</A></TD>
	      <TD>&nbsp;</TD></TR>

<TR>          <td>&nbsp;</td> 
	      <TD> F7D8.9<BR><a href="/servlets/TairObject?type=locus&name=At2g21770">At2g21770</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD20396.1">AAD20396.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21770">putative cellulose synthase catalytic subunit</A></TD></TR>	

<TR>          <td>&nbsp;</td> 
	      <TD> F8B4.110<br><a href="/servlets/TairObject?type=locus&name=AT4g32410">AT4g32410</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC39334.1">AAC39334.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g32410">cellulose synthase catalytic subunit (RSW1)</A></TD></TR>		  

<TR>          <td>&nbsp;</td> 
	      <TD> MDJ22.16<br><a href="/servlets/TairObject?type=locus&name=At5g22740">At5g22740</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11680.1">BAB11680.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g22740">glucosyltransferase-like protein</A></TD></TR>	


<TR>          <td>&nbsp;</td> 
	      <TD> MIG10.8<br><a href="/servlets/TairObject?type=locus&name=At3g28180">At3g28180</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01433.1">BAB01433.1</A></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g28180">expressed protein</A></TD></TR>		  

<TR>          <td>&nbsp;</td> 
	      <TD> MRH10.14<br><a href="/servlets/TairObject?type=locus&name=At5g44030">At5g44030</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09063.1">BAB09063.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g44030">cellulose synthase catalytic subunit-like protein </A></TD></TR>	

<TR>          <td>&nbsp;</td> 
	      <TD> MYH9.8<br><a href="/servlets/TairObject?type=locus&name=At5g09870">At5g09870</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09408.1">BAB09408.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g09870">cellulose synthase catalytic subunit</TD></TR>		  

<TR>          <td>&nbsp;</td> 
	      <TD> T19F6.17</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB63622.1">AAB63622.1</A></TD>
	      <TD>&nbsp;</TD></TR>	



<TR>          <td>&nbsp;</td> 
	      <TD> T19F6.18</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB63623.1">AAB63623.1</A></TD>
	      <TD>&nbsp;</TD></TR>		  

<TR>          <td>&nbsp;</td> 
	      <TD> T19F6.19</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB63624.1">AAB63624.1</A></TD>
	      <TD>&nbsp;</TD></TR>	

<TR>          <td>&nbsp;</td> 
	      <TD> T20F21.16<BR><a href="/servlets/TairObject?type=locus&name=At2g35650">At2g35650</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD15455.1">AAD15455.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g35650">putative glucosyltransferase</A></TD></TR>

<TR>          <td>&nbsp;</td> 
	      <TD> T21H19_110<BR><a href="/servlets/TairObject?type=locus&name=AT5g16190">AT5g16190</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01860.1">CAC01860.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g16190">putative protein</A></TD></TR>	

<TR>          <td>&nbsp;</td> 
	      <TD> T23E23.23<BR><a href="/servlets/TairObject?type=locus&name=At1g24070">At1g24070</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF87149.1">AAF87149.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24070">glucosyltransferase, putative</A></TD></TR>		  

<TR>          <td>&nbsp;</td> 
	      <TD> T26B15.10<BR><a href="/servlets/TairObject?type=locus&name=At2g32540">At2g32540</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC25936.1">AAC25936.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32540">putative cellulose synthase </A></TD></TR>	


<TR>          <td>&nbsp;</td> 
	      <TD> T26B15.17<BR><a href="/servlets/TairObject?type=locus&name=At2g32610">At2g32610</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC25943.1">AAC25943.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32610">putative cellulose synthase</A></TD></TR>		  

<TR>          <td>&nbsp;</td> 
	      <TD> T26B15.18<BR><a href="/servlets/TairObject?type=locus&name=At2g32620">At2g32620</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC25944.1">AAC25944.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32620">putative cellulose synthase </A></TD></TR>	

<TR>          <td>&nbsp;</td> 
	      <TD> T26B15.9<BR><a href="/servlets/TairObject?type=locus&name=At2g32530">At2g32530</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC25935.1">AAC25935.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32530">putative cellulose synthase </A></TD></TR>		  

<TR>          <td>&nbsp;</td> 
	      <TD> T32A16.160 <br><a href="/servlets/TairObject?type=locus&name=AT4g23990">AT4g23990</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB43899.1">CAB43899.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g23990">cellulose synthase catalytic subunit - like protein</A></TD></TR>	



<TR>          <td>&nbsp;</td> 
	      <TD> T32A16.170<br><a href="/servlets/TairObject?type=locus&name=AT4g24000">AT4g24000</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB43900.1">CAB43900.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g24000">putative protein </A></TD></TR>		  

<TR>          <td>&nbsp;</td> 
	      <TD> T32A16.180<BR> <a href="/servlets/TairObject?type=locus&name=AT4g24010">AT4g24010</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB43901.1">CAB43901.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g24010">putative protein</A></TD></TR>	

<TR>          <td>&nbsp;</td> 
	      <TD> T9E8.150<BR><a href="/servlets/TairObject?type=locus&name=AT4g13410">AT4g13410</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB40776.1">CAB40776.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g13410">putative protein</A></TD></TR>

<TR>          <TD>&nbsp;</TD>
	      <TD>T17B22.26<BR><a href="/servlets/TairObject?type=locus&name=AT3g03050">AT3g03050</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF26119.1">AAF26119.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g03050">putative cellulose synthase catalytic subunit</A></TD></TR>	

<TR>          <TD>&nbsp;</TD>
	      <TD>T17B22.26<br><a href="/servlets/TairObject?type=locus&name=AT3g03050">AT3g03050</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF26119.1">AAF26119.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g03050">putative cellulose synthase catalytic subunit </A></TD></TR>		  

<tr class="alt">          <TD ROWSPAN=23 valign=top><B><a href="http://www.cazy.org/fam/GT4.html">Glycosyltransferase- Family 4</a></b></TD><td>&nbsp;</td>
	      <TD>T19F11.7<BR><a href="/servlets/TairObject?type=locus&name=AT3g11670">AT3g11670</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD42378.1">AAD42378.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g11670">digalactosyldiacylglycerol synthase</A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F6N23.24<br><a href="/servlets/TairObject?type=locus&name=AT4g00550">AT4g00550</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC13625.1">AAC13625.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g00550">predicted protein of unknown function</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F13M14.8(F18K10.25)<BR><a href="/servlets/TairObject?type=locus&name=AT3g10630">AT3g10630</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF04165.1">AAF04165.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g10630">unknown protein</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F13M7.9<BR><a href="/servlets/TairObject?type=locus&name=At1g04920">At1g04920</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF40445.1">AAF40445.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g04920">sucrose-phosphate synthase, putative</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F1B16.5<BR><a href="/servlets/TairObject?type=locus&name=At1g75420">At1g75420</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG13070.1">AAG13070.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75420">unknown protein</A></TD></TR>	



<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F24J7.20<br><a href="/servlets/TairObject?type=locus&name=AT4g19460">AT4g19460</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB78948.1">CAB78948.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19460">putative protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F28M11.40<br><a href="/servlets/TairObject?type=locus&name=AT4g10120">AT4g10120</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC62812.1">AAC62812.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g10120">sucrose-phosphate synthase - like protein </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F3N23.36 (T18K17.18)<BR><a href="/servlets/TairObject?type=locus&name=At1g73160">At1g73160</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD55663.1">AAD55663.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73160">putative glycosyl transferase</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F5O24_170<br><a href="/servlets/TairObject?type=locus&name=AT5g20280">AT5g20280</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK64015.1">AAK64015.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g20280">sucrose-phosphate synthase-like protein</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F6D8.36 (F19K6.13)<BR><a href="/servlets/TairObject?type=locus&name=At1g52420">At1g52420</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD55621.1">AAD55621.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g52420">hypothetical protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F6F9.24<BR><a href="/servlets/TairObject?type=locus&name=At1g19710">At1g19710</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG12556.1">AAG12556.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19710">hypothetical protein </A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F7J8.200<BR><a href="/servlets/TairObject?type=locus&name=AT5g01220">AT5g01220</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB69850.1">CAB69850.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g01220">putative protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F7K15_40<BR><a href="/servlets/TairObject?type=locus&name=AT3g43190">AT3g43190</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK59464.1">AAK59464.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g43190">sucrose synthase -like protein</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F9K20.16<BR><a href="/servlets/TairObject?type=locus&name=At1g78800">At1g78800</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC83030.1">AAC83030.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78800">hypothetical protein </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> K18B18.7</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10782.1">BAB10782.1</A></TD>
	      <TD>&nbsp;</TD></TR>	



<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> K21P3.6<BR><a href="/servlets/TairObject?type=locus&name=AT5g49190">AT5g49190</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10337.1">BAB10337.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g49190">sucrose synthase </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> MJG14.25<br><a href="/servlets/TairObject?type=locus&name=At5g37200">At5g37200</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11375.1">BAB11375.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g37200">putative protein</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> MVC8.8<br><a href="/servlets/TairObject?type=locus&name=At3g15940">At3g15940</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02880.1">BAB02880.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g15940">hypothetical protein</A> </TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T07M07.7</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD25934.1">AAD25934.1</A></TD>
	      <TD>&nbsp;</TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T14D3.40<BR><a href="/servlets/TairObject?type=locus&name=AT3g45100">AT3g45100</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB72148.1">CAB72148.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g45100">n-acetylglucosaminyl-phosphatidylinositol-like protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T2H3.8<br><a href="/servlets/TairObject?type=locus&name=AT4g02280">AT4g02280</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC28175.1">AAC28175.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g02280">putative sucrose synthetase</A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA50317.1">CAA50317.1</A></TD>
	      <TD>&nbsp;</TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA43303.1">CAA43303.1</A></TD>
	      <TD>&nbsp;</TD></TR>	

<TR>          <TD ROWSPAN=5 valign=top><B><a href="http://www.cazy.org/fam/GT5.html">Glycosyltransferase- Family 5</a></b></td><td>&nbsp;</TD>
	      <TD>F25C20.13<BR><a href="/servlets/TairObject?type=locus&name=At1g11720">At1g11720</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD30251.1">AAD30251.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11720">putative glycogen synthase</A></TD></TR>		  

<TR>          <TD>&nbsp;</TD>
	      <TD>F9L11.8<BR><a href="/servlets/TairObject?type=locus&name=At1g32900">At1g32900</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF31273.1">AAF31273.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32900">starch synthase, putative</A></TD></TR>	

	      
<TR>          <TD>&nbsp;</TD>
	      <TD>T4P13.13<BR><a href="/servlets/TairObject?type=locus&name=AT3g01180">AT3g01180</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF26156.1">AAF26156.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01180">putative glycogen synthase</A></TD></TR>

<TR>          <TD>&nbsp;</TD>
	      <TD>T9A21.90<br><a href="/servlets/TairObject?type=locus&name=AT4g18240">AT4g18240</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA16796.1">CAA16796.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18240">starch synthase-like protein </A></TD></TR>		  

<TR>          <TD>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF24126.1">AAF24126.1</A></TD>
	      <TD>&nbsp;</TD></TR>	

<tr class="alt">          <TD ROWSPAN=37 valign=top><B><a href="http://www.cazy.org/fam/GT8.html">Glycosyltransferase- Family 8</a></b></td><td>&nbsp;</TD>
	      <TD>F5H14.22 <br><a href="/servlets/TairObject?type=locus&name=At2g20810">At2g20810</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD20914.1">AAD20914.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g20810">unknown protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T6A23.15<br> <a href="/servlets/TairObject?type=locus&name=At2g38650">At2g38650</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC67353.1">AAC67353.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38650">hypothetical protein</A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> dl4325w <br><a href="/servlets/TairObject?type=locus&name=AT4g16600">AT4g16600</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10435.1">CAB10435.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g16600"> glucosyltransferase like protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F11A12.4<BR><a href="/servlets/TairObject?type=locus&name=AT3g02350">AT3g02350</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG12603.1">AAG12603.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g02350">unknown protein </A></TD></TR>	
	      
<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F13A10.1<BR><a href="/servlets/TairObject?type=locus&name=At2g46480">At2g46480</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD20159.1">AAD20159.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=">hypothetical protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F14J9.1<br><a href="/servlets/TairObject?type=locus&name=At1g09350">At1g09350</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC33195.1">AAC33195.1</A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09350">putative galactinol synthase</A> </TD></TR>


<tr class="alt">           <TD>&nbsp;</TD>
	      <TD> F17M5.90<br><a href="/servlets/TairObject?type=locus&name=AT4g33330">AT4g33330</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB38791.1">CAB38791.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33330">putative protein </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F18O14.2<BR><a href="/servlets/TairObject?type=locus&name=At1g19300">At1g19300</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF79456.1">AAF79456.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19300">unknown protein</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F20P5.18<BR><a href="/servlets/TairObject?type=locus&name=At1g70090">At1g70090</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB61117.1">AAB61117.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70090">unknown protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F22I13.40<br><a href="/servlets/TairObject?type=locus&name=AT4g38270">AT4g38270</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB37483.1">CAB37483.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38270">putative protein </A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F25P12.95<BR><a href="/servlets/TairObject?type=locus&name=At1g56600">At1g56600</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG09103.1">AAG09103.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g56600">water stress-induced protein, putative </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F26K9_90<BR><a href="/servlets/TairObject?type=locus&name=AT3g62660">AT3g62660</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB83116.1">CAB83116.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g62660">putative protein</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F28L1.20<BR><a href="/servlets/TairObject?type=locus&name=AT3g06260">AT3g06260</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF30319.1">AAF30319.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g06260">putative glycosyl transferase</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F3I6.10<BR><a href="/servlets/TairObject?type=locus&name=At1g24170">At1g24170</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC00579.1">AAC00579.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24170">putative glycosyl transferase</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F4H5.13<BR><a href="/servlets/TairObject?type=locus&name=At1g06780">At1g06780</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF63140.1">AAF63140.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06780">unknown protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F7G19.14<BR><a href="/servlets/TairObject?type=locus&name=At1g08990">At1g08990</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB70408.1">AAB70408.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08990">unknown protein</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> K5F14.3<BR><a href="/servlets/TairObject?type=locus&name=AT5g54690">AT5g54690</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09935.1">BAB09935.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g54690">putative protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> MCA23.10<BR><a href="/servlets/TairObject?type=locus&name=AT5g47780">AT5g47780</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11325.1">BAB11325.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g47780">putative protein</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> MJL12.8<BR><a href="/servlets/TairObject?type=locus&name=AT3g25140">AT3g25140</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02072.1">BAB02072.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g25140">glycosyl transferase, putative</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> MRO11.17<BR><a href="/servlets/TairObject?type=locus&name=AT5g23790">AT5g23790</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10052.1">BAB10052.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g23790">galactinol synthase</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> MVE11.2<BR><a href="/servlets/TairObject?type=locus&name=AT3g18660">AT3g18660</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01792.1">BAB01792.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g18660">hypothetical protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> MZF16.15</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02626.1">BAB02626.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=MZF16.15">pseudogene</TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T10M13.14<br><a href="/servlets/TairObject?type=locus&name=AT4g02130">AT4g02130</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC78704.1">AAC78704.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g02130">predicted glycosyl transferase</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T14N5.1<BR><a href="/servlets/TairObject?type=locus&name=At1g77130">At1g77130</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC34345.1">AAC34345.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77130">hypothetical protein</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T14P4.1</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG10630.1">AAG10630.1</A></TD>
	      <TD>&nbsp;</TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T20F21.10<BR><a href="/servlets/TairObject?type=locus&name=At2g35710">At2g35710</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD15444.1">AAD15444.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g35710">putative glycogenin </A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T20K12.30<BR> <a href="/servlets/TairObject?type=locus&name=AT3g61130">AT3g61130</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB71043.1">CAB71043.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf= AT3g61130">putative protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T20K14_80<BR><a href="/servlets/TairObject?type=locus&name=AT5g15470">AT5g15470</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01746.1">CAC01746.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g15470">putative protein</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T20N10_140<BR><a href="/servlets/TairObject?type=locus&name=AT3g58790">AT3g58790</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB88296.1">CAB88296.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g58790">putative protein</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T24C10.6 (F14C21.11)</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG00875.1">AAG00875.1</A></TD>
	      <TD>&nbsp;</TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T25K17.60 <br><a href="/servlets/TairObject?type=locus&name=AT4g26250">AT4g26250</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB38954.1">CAB38954.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g26250">putative protein</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T3A5.140 (F18B3.40)<BR><a href="/servlets/TairObject?type=locus&name=AT3g50760">AT3g50760</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB42905.1">CAB42905.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g50760"> putative protein</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T4P13.28<BR><a href="/servlets/TairObject?type=locus&name=AT3g01040">AT3g01040</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF26170.1">AAF26170.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01040">unknown protein</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T6J4.1<BR><a href="/servlets/TairObject?type=locus&name=At1g13250">At1g13250</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG09558.1">AAG09558.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g13250">hypothetical protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T08I13.2</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB63818.1">AAB63818.1</A></TD>
	      <TD>&nbsp;</TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F8A5.2<BR><a href="/servlets/TairObject?type=locus&name=At1g60470">At1g60470</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB71970.1">AAB71970.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60470">galactinol synthase, putative</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T13D8.32<BR><a href="/servlets/TairObject?type=locus&name=At1g60450">At1g60450</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC24075.1">AAC24075.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60450">galactinol synthase, putative</A></TD></TR>

<TR>          <TD ROWSPAN=3 valign=top><B><a href="http://www.cazy.org/fam/GT10.html">Glycosyltransferase- Family 10</a></b></td><td>&nbsp;</TD>
	      <TD>F14J22.8<BR><a href="/servlets/TairObject?type=locus&name=At1g49710">At1g49710</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG13053.1 ">AAG13053.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g49710">fucosyltransferase c3 protein, putative</A></TD></TR>		  

<TR>          <TD>&nbsp;</TD>
	      <TD>F17M19.14<BR><a href="/servlets/TairObject?type=locus&name=At1g71990">At1g71990</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC38049.1 ">CAC38049.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71990">hypothetical protein </A></TD></TR>	

<TR>          <TD>&nbsp;</TD>
	      <TD>MVI11.20<BR><a href="/servlets/TairObject?type=locus&name=AT3g19280">AT3g19280</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02969.1">BAB02969.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g19280">fucosyltransferase, putative </A></TD></TR>


<tr class="alt">          <TD ROWSPAN=2 valign=top><B><a href="http://www.cazy.org/fam/GT13.html">Glycosyltransferase- Family 13</a></b></td><td>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB45521.1">CAB45521.1</A></TD>
	      <TD>&nbsp;</TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F20D10.360 <BR><a href="/servlets/TairObject?type=locus&name=AT4g38240">AT4g38240</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB37480.1">CAB37480.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38240">glycosyltransferase like protein</A></TD></TR>		  

<TR>          <TD ROWSPAN=11 valign=top><B><a href="http://www.cazy.org/fam/GT14.html">Glycosyltransferase- Family 14</a></b></td><td>&nbsp;</TD>
	      <TD>F13M22.8<br><a href="/servlets/TairObject?type=locus&name=At2g37580">At2g37580</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC23649.1">AAC23649.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37580">putative RING zinc finger protein </A></TD></TR>	

<TR>          <TD>&nbsp;</TD>
	      <TD>T12J13_3<BR><a href="/servlets/TairObject?type=locus&name=AT3g03690">AT3g03690</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF03464.1">AAF03464.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g03690">hypothetical protein</A></TD></TR>


<TR>          <TD>&nbsp;</TD>
	      <TD> F14O13.23<BR><a href="/servlets/TairObject?type=locus&name=AT3g24040">AT3g24040</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB03022.1">BAB03022.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g24040">hypothetical protein</A></TD></TR>

<TR>          <TD>&nbsp;</TD>
	      <TD> F21B7.14<BR><a href="/servlets/TairObject?type=locus&name=At1g03520">At1g03520</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF86534.1">AAF86534.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g03520">putative glycosylation enzyme</A></TD></TR>		  

<TR>          <TD>&nbsp;</TD>
	      <TD> F23N20.6<BR><a href="/servlets/TairObject?type=locus&name=At1g71070">At1g71070</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF26009.1">AAF26009.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=">unknown protein</A></TD></TR>	

<TR>          <TD>&nbsp;</TD>
	      <TD> F27G19.80<br><a href="/servlets/TairObject?type=locus&name=AT4g27480">AT4g27480</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB43880.1">CAB43880.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g27480">putative protein</A></TD></TR>


<TR>          <TD>&nbsp;</TD>
	      <TD> F2G14_170<BR><a href="/servlets/TairObject?type=locus&name=AT5g15050">AT5g15050</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01824.1">CAC01824.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g15050">putative protein</A></TD></TR>

<TR>          <TD>&nbsp;</TD>
	      <TD> F4C21.27<br><a href="/servlets/TairObject?type=locus&name=AT4g03340">AT4g03340</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD14462.1">AAD14462.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g03340">putative glycosylation enzyme</A></TD></TR>		  

<TR>          <TD>&nbsp;</TD>
	      <TD> F8L10.4</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF87858.1">AAF87858.1</A></TD>
	      <TD>&nbsp;</TD></TR>	

<TR>          <TD>&nbsp;</TD>
	      <TD> K7L4.15<BR><a href="/servlets/TairObject?type=locus&name=AT3g15350">AT3g15350</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF34844.1">AAF34844.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g15350">unknown protein</A></TD></TR>


<TR>          <TD>&nbsp;</TD>
	      <TD> MYH19.19</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10223.1">BAB10223.1</A></TD>
	      <TD>&nbsp;</TD></TR>

<tr class="alt">          <TD ROWSPAN=6 valign=top><B><a href="http://www.cazy.org/fam/GT17.html">Glycosyltransferase- Family 17</a></b></td><td>&nbsp;</TD>
	      <TD>F15O11.7<BR><a href="/servlets/TairObject?type=locus&name=At2g13290">At2g13290</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD20428.1 ">AAD20428.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g13290">putative N-acetylglucosaminyltransferase </A></TD></TR>

	      
<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F18O22_270<BR><a href="/servlets/TairObject?type=locus&name=AT5g14480">AT5g14480</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB87787.1 ">CAB87787.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g14480">putative protein</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F3F19.2<BR><a href="/servlets/TairObject?type=locus&name=At1g12990">At1g12990</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD31053.1">AAD31053.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g12990">putative beta-1,4-N-acetylglucosaminyltransferase</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F4P13.16<BR><a href="/servlets/TairObject?type=locus&name=AT3g01620">AT3g01620</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF01546.1 ">AAF01546.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01620">hypothetical protein</A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>MMJ24.9<BR><a href="/servlets/TairObject?type=locus&name=AT3g27540">AT3g27540</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF16573.1">AAF16573.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g27540">hypothetical protein</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T23K23.27<BR><a href="/servlets/TairObject?type=locus&name=At1g67880">At1g67880</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF16573.1">AAF16573.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67880">unknown protein</A></TD></TR>


<TR>          <TD ROWSPAN=1 valign=top><B><a href="http://www.cazy.org/fam/GT19.html">Glycosyltransferase- Family 19</a></b></td><td>&nbsp;</TD>
	      <TD>T1O3.3<BR><a href="/servlets/TairObject?type=locus&name=At2g04560">At2g04560</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD25824.1">AAD25824.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g04560">hypothetical protein </A></TD></TR>

<tr class="alt">          <TD ROWSPAN=12 valign=top><B><a href="http://www.cazy.org/fam/GT20.html">Glycosyltransferase- Family 20</a></b></td><td>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA69879.1">CAA69879.1</A></TD>
	      <TD>&nbsp;</TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>dl4920w<BR><a href="/servlets/TairObject?type=locus&name=AT4g17770">AT4g17770</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10557.1">CAB10557.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g17770">trehalose-6-phosphate synthase like protein</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T29A15_40<BR><a href="/servlets/TairObject?type=locus&name=AT4g27550">AT4g27550</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB81405.1">CAB81405.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g27550">trehalose-6-phosphate synthase - like protein</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F17O7.18<BR><a href="/servlets/TairObject?type=locus&name=At1g70290">At1g70290</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC18810.1">AAC18810.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70290">trehalose-6-phosphate synthase, putative</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F20D23.30</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD50035.1">AAD50035.1</A></TD>
	      <TD>&nbsp;</TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F6I1.1<BR><a href="/servlets/TairObject?type=locus&name=At1g16980">At1g16980</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF99834.1">AAF99834.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16980">trehalose-6-phosphate synthase, putative</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> MSF3.8<BR><a href="/servlets/TairObject?type=locus&name=At2g18700">At2g18700</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD08939.1">AAD08939.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18700">putative trehalose-6-phosphate synthase</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T13D8.4<BR><a href="/servlets/TairObject?type=locus&name=At1g60140">At1g60140</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC24048.1">AAC24048.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60140">trehalose-6-phosphate synthase, putative</A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T23E23.3<BR><a href="/servlets/TairObject?type=locus&name=At1g23870">At1g23870</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF87136.1">AAF87136.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23870">trehalose 6-phosphate synthase, putative </A></TD></TR>		  

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T23K23.13<BR><a href="/servlets/TairObject?type=locus&name=At1g68020">At1g68020</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF16560.1">AAF16560.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68020">putative trehalose-6-phosphate synthase</A></TD></TR>	

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T2D23.11<BR><a href="/servlets/TairObject?type=locus&name=At1g06410">At1g06410</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF82169.1">AAF82169.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06410">trehalose-6-phosphate synthase, putative</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T30F21.9<BR><a href="/servlets/TairObject?type=locus&name=At1g78580">At1g78580</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD30578.1">AAD30578.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78580">trehalose-6-phosphate synthase, putative</A></TD></TR>

<TR> <TD ROWSPAN=2 valign=top><B><a href="http://www.cazy.org/fam/GT22.html">Glycosyltransferase- Family 22</a></b></td>         <TD>&nbsp;</TD>
	      <TD>F6I1.10<br><a href="/servlets/TairObject?type=locus&name=At1g16900">At1g16900</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF99843.1 ">AAF99843.1 </A></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16900">Ser Thr protein kinase, putative</A></TD></TR>		  

<TR>          <TD>&nbsp;</TD>
	      <TD>T9L3_150<BR><a href="/servlets/TairObject?type=locus&name=AT5g14850">AT5g14850</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01884.1 ">CAC01884.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g14850">dolichyl-phosphate-mannose--glycolipid <br>alpha-mannosyltransferase -like protein </A></TD></TR>	

<tr class="alt"><TD ROWSPAN=1 valign=top><B><a href="http://www.cazy.org/fam/GT24.html">Glycosyltransferase- Family 24</B></TD>          <TD>&nbsp;</TD>
	      <TD>F3I17.13<BR><a href="/servlets/TairObject?type=locus&name=At1g71220">At1g71220</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF26036.1">AAF26036.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71220">putative UDP-glucose:glycoprotein glucosyltransferase</A></TD></TR>


<TR>  <TD ROWSPAN=4 valign=top><B><a href="http://www.cazy.org/fam/GT28.html">Glycosyltransferase Family- 28</B></TD>        <TD>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB12041.1">BAB12041.1</A></TD>
	      <TD>&nbsp;</TD></TR>

<TR>          <TD>&nbsp;</TD>
	      <TD>F5O24_300<BR><a href="/servlets/TairObject?type=locus&name=AT5g20410">AT5g20410</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA04005.1 ">CAA04005.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g20410">monogalactosyldiacylglycerol synthase </A></TD></TR>		  

<TR>          <TD>&nbsp;</TD>
	      <TD>F28M20.30<BR><a href="/servlets/TairObject?type=locus&name=AT4g31780">AT4g31780</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF65066.1">AAF65066.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g31780">monogalactosyldiacylglycerol synthase - like protein </A></TD></TR>	


<TR>          <TD>&nbsp;</TD>
	      <TD>F25P22.16<BR><a href="/servlets/TairObject?type=locus&name=At1g73740">At1g73740</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG52070.1">AAG52070.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g73740">putative UDP-N-acetylglucosamine--N-acetylmuramyl-<br>(pentapeptide)-pyrophosphoryl-undecaprenol<br> N-acetylglucosamine transferase </A></TD></TR>


<tr class="alt">  <TD ROWSPAN=2 valign=top><B><a href="http://www.cazy.org/fam/GT29.html">Glycosyltransferase Family- 29</B></TD>        <TD>&nbsp;</TD>
	      <TD>F22O13.14<BR><a href="/servlets/TairObject?type=locus&name=At1g08660">At1g08660</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF99778.1 ">AAF99778.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08660">unknown protein </A></TD></TR>

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>T21J18_90<BR><a href="/servlets/TairObject?type=locus&name=AT3g48820">AT3g48820</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB87910.1">CAB87910.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g48820">putative protein </A></TD></TR>		  

<TR><TD ROWSPAN=1 valign=top><B><a href="http://www.cazy.org/fam/GT30.html">Glycosyltransferase Family- 30</B></TD>          <TD>&nbsp;</TD>
	      <TD>F17C15_190 (MED24.5)<BR><a href="/servlets/TairObject?type=locus&name=AT5g03770">AT5g03770</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB82942.1 ">CAB82942.1 </A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g03770">3-deoxy-D-manno-octulosonic acid transferase -like protein </A></TD></TR>	

<tr class="alt"> <TD ROWSPAN=33 valign=top><B><a href="http://www.cazy.org/fam/GT31.html">Glycosyltransferase Family- 31</B></TD>         <TD>&nbsp;</TD>
	      <TD>&nbsp;</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA97209.1">BAA97209.1</A></TD>
	      <TD>&nbsp;</TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F10M23.280<BR><a href="/servlets/TairObject?type=locus&name=AT4g26940">AT4g26940</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB36540.1">CAB36540.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g26940">Avr9 elicitor response like protein</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>YUP8H12_22<BR><a href="/servlets/TairObject?type=locus&name=At1g05170">At1g05170</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB71461.1">AAB71461.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05170">putative AVR9 elicitor response protein</A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T22F11.11<BR><a href="/servlets/TairObject?type=locus&name=At2g25300">At2g25300</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD23661.1">AAD23661.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25300">unknown protein </A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F24P17_7<BR><a href="/servlets/TairObject?type=locus&name=AT3g06440">AT3g06440</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF08572.1">AAF08572.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g06440">unknown protein </A></TD></TR>	




<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>A_IG005I10_16 <BR><a href="/servlets/TairObject?type=locus&name=AT4g00300">AT4g00300</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB62835.1">AAB62835.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g00300">not found</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F8L21_140<BR><a href="/servlets/TairObject?type=locus&name=AT4g11350">AT4g11350</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB51419.1">CAB51419.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g11350">putative protein </A></TD></TR>



<tr class="alt">          <TD>&nbsp;</TD>
	      <TD>F16G20.190<BR><a href="/servlets/TairObject?type=locus&name=AT4g23490">AT4g23490</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA20470.1">CAA20470.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g23490">putative protein</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> dl3665c<br><a href="/servlets/TairObject?type=locus&name=AT4g15240">AT4g15240</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10303.1">CAB10303.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15240">hypothetical protein</A></TD></TR>	
	      

<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F10C21.10<BR><a href="/servlets/TairObject?type=locus&name=At1g33430">At1g33430</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG21603.1">AAG21603.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g33430">elicitor response protein, putative</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F10N7.80<br><a href="/servlets/TairObject?type=locus&name=AT4g32110">AT4g32110</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA16578.1">CAA16578.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g32110">putative protein</A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F12M16.19<BR><a href="/servlets/TairObject?type=locus&name=At1g53290">At1g53290</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF69535.1">AAF69535.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53290">hypothetical protein</A></TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F13M22.23<br><a href="/servlets/TairObject?type=locus&name=At2g37730">At2g37730</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC23643.1">AAC23643.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37730">putative zinc finger protein</A></TD></TR>		      


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F22L4.11<BR><a href="/servlets/TairObject?type=locus&name=At1g01570">At1g01570</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF81315.1">AAF81315.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g01570">hypothetical protein </A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F24B9.5<BR><a href="/servlets/TairObject?type=locus&name=At1g07850">At1g07850</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF75069.1">AAF75069.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07850">hypothetical protein</A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F24K9.9<BR><a href="/servlets/TairObject?type=locus&name=AT3g11420">AT3g11420</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF00656.1">AAF00656.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g11420">unknown protein</A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F25A4.23<BR><a href="/servlets/TairObject?type=locus&name=At1g74800">At1g74800</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD55296.1">AAD55296.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74800">hypothetical protein</A></TD></TR>		  


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F25C20.12<BR><a href="/servlets/TairObject?type=locus&name=At1g11730">At1g11730</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD30250.1">AAD30250.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11730">Avr9 elicitor response-like protein</A></TD></TR>		  


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F28K19.2<BR><a href="/servlets/TairObject?type=locus&name=At1g77810">At1g77810</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF17702.1">AAF17702.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77810">Avr9 elicitor response protein, putative </A></TD></TR>		  


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F2E2.6</TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF86563.1">AAF86563.1</A></TD>
	      <TD>&nbsp;</TD></TR>


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> F9L11.10<BR><a href="/servlets/TairObject?type=locus&name=At1g32930">At1g32930</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF31275.1">AAF31275.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32930">Avr9 elicitor response protein, putative</A></TD></TR>		  



<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> K15M2.10<BR><a href="/servlets/TairObject?type=locus&name=AT3g14960">AT3g14960</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA97059.1">BAA97059.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g14960">galactosyltransferase, putative</A></TD></TR>		  


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> K19E1.14<BR><a href="/servlets/TairObject?type=locus&name=AT5g53340">AT5g53340</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK62387.1">AAK62387.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g53340">Avr9 elicitor response protein-like</A></TD></TR>		  


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> MUA2.7<BR><a href="/servlets/TairObject?type=locus&name=AT5g57500">AT5g57500</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB08785.1">BAB08785.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g57500">putative protein</A></TD></TR>		  


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> MYC6.16<BR><a href="/servlets/TairObject?type=locus&name=AT5g41460">AT5g41460</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB08517.1">BAB08517.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g41460">strong similarity to unknown protein (pir||T13026)</A></TD></TR>	


<tr class="alt">          <TD>&nbsp;</TD>
	      <TD> T13K14.220<br><a href="/servlets/TairObject?type=locus&name=AT4g21060">AT4g21060</a></TD>
	      <TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB45901.1">CAB45901.1</A></TD>
	      <TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g21060">putative protein</A></TD></TR>	

<tr class="alt">    <td>&nbsp;</td>
        <td> T16O9.11<br><a href="/servlets/TairObject?type=locus&name=At1g33250">At1g33250</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG27909.1">AAG27909.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g33250">unknown protein</A></TD></TR>
	
	
<tr class="alt">    <td>&nbsp;</td>
        <td> T19L18.9<br><a href="/servlets/TairObject?type=locus&name=At2g26100">At2g26100</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC31227.1">AAC31227.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26100">unknown protein</A></TD></TR>


<tr class="alt">    <td>&nbsp;</td>
        <td> T24P13.20<br><a href="/servlets/TairObject?type=locus&name=At1g26810">At1g26810</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF87039.1">AAF87039.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g26810">hypothetical protein</A></TD></TR>
	
	
<tr class="alt">    <td>&nbsp;</td>
        <td> T32E8.14</td>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF08567.1">AAF08567.1</A></TD>
	<TD>&nbsp;</TD></TR>

<tr class="alt">    <td>&nbsp;</td>
        <td> T32F6.5<br><a href="/servlets/TairObject?type=locus&name=At2g32430">At2g32430</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC69935.1">AAC69935.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32430">unknown protein</A></TD></TR>
	
	
<tr class="alt">    <td>&nbsp;</td>
        <td> T7N9.18<br><a href="/servlets/TairObject?type=locus&name=At1g27120">At1g27120</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF79857.1">AAF79857.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27120">unknown protein </A></TD></TR>



<tr class="alt">    <td>&nbsp;</td>
        <td> YUP8H12.11<br><a href="/servlets/TairObject?type=locus&name=At1g05280">At1g05280</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB71450.1">AAB71450.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05280">hypothetical protein</A></TD></TR>
	
	
<TR><TD ROWSPAN=5 valign=top><B><a href="http://www.cazy.org/fam/GT32.html">Glycosyltransferase Family- 32</B></TD>    <td>&nbsp;</td>
        <td> F16M14.8<br><a href="/servlets/TairObject?type=locus&name=At2g38150">At2g38150</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC27164.1">AAC27164.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38150">hypothetical protein </A></TD></TR>

<TR>    <td>&nbsp;</td>
        <td> F18F4.6<BR><a href="/servlets/TairObject?type=locus&name=AT4g19900">AT4g19900</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB52870.1">CAB52870.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19900">putative protein</A></TD></TR>	

<TR>    <td>&nbsp;</td>
        <td> F7J8.230<br><a href="/servlets/TairObject?type=locus&name=AT5g01250">AT5g01250</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB69853.1">CAB69853.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g01250">putative protein </A></TD></TR>
	
	
<TR>    <td>&nbsp;</td>
        <td> T16O11.2<br><a href="/servlets/TairObject?type=locus&name=AT3g09020">AT3g09020</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD56318.1">AAD56318.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g09020">unknown protein </A></TD></TR>

<TR>    <td>&nbsp;</td>
        <td> T7P1.18<br><a href="/servlets/TairObject?type=locus&name=At1g61050">At1g61050</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF27676.1">AAF27676.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61050">hypothetical protein</A></TD></TR>	

	
<tr class="alt"><TD ROWSPAN=1 valign=top><B><a href="http://www.cazy.org/fam/GT33.html">Glycosyltransferase Family- 33</B></TD>    <td>&nbsp;</td>
        <td>F19K19.11<br><a href="/servlets/TairObject?type=locus&name=At1g16570">At1g16570</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG10823.1 ">AAG10823.1 </A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g16570">unknown protein</A></TD></TR>

<TR> <TD ROWSPAN=8 valign=top><B><a href="http://www.cazy.org/fam/GT34.html">Glycosyltransferase Family- 34</B></TD>   <td>&nbsp;</td>
        <td>F22I13.80<BR>AT4g38310 (fragment)</td>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB37487.1">CAB37487.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38310">putative protein </A></TD></TR>	

<TR>    <td>&nbsp;</td>
        <td> F19F18.180<BR><a href="/servlets/TairObject?type=locus&name=AT4g37690">AT4g37690</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB38308.1">CAB38308.1</A></TD>
	<TD>&nbsp;</TD></TR>
	
	
<TR>    <td>&nbsp;</td>
        <td> F1M20.6<br><a href="/servlets/TairObject?type=locus&name=At1g74380">At1g74380</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF15910.1">AAF15910.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74380">putative alpha galactosyltransferase</A></TD></TR>

<TR>    <td>&nbsp;</td>
        <td> F26K9_150<br><a href="/servlets/TairObject?type=locus&name=AT3g62720">AT3g62720</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB83122.1">CAB83122.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g62720">alpha galactosyltransferase-like protein</A></TD></TR>	

<TR>    <td>&nbsp;</td>
        <td> F6A14.20<br><a href="/servlets/TairObject?type=locus&name=At1g18690">At1g18690</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF27110.1">AAF27110.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18690">alpha galactosyltransferase, putative </A></TD></TR>
	
	
<TR>    <td>&nbsp;</td>
        <td> MBK20.18<br><a href="/servlets/TairObject?type=locus&name=AT5g07720">AT5g07720</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11451.1">BAB11451.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07720">alpha galactosyltransferase protein</A></TD></TR>

<TR>    <td>&nbsp;</td>
        <td> T14P8.23 T10P11.20<BR><a href="/servlets/TairObject?type=locus&name=AT4g02500">AT4g02500</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC78266.1">AAC78266.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g02500">putative glycosyltransferase</A></TD></TR>	

<TR>    <td>&nbsp;</td>
        <td> T20K9.11</td>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC32437.1">AAC32437.1</A></TD>
	<TD>&nbsp;</TD></TR>
	
	
<tr class="alt"> <TD ROWSPAN=2 valign=top><B><a href="http://www.cazy.org/fam/GT35.html">Glycosyltransferase Family- 35</B></TD>   <td>&nbsp;</td>
        <td> F13I12.20<br><a href="/servlets/TairObject?type=locus&name=AT3g46970">AT3g46970</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB61943.1">CAB61943.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g46970">starch phosphorylase H (cytosolic form) - like protein</A></TD></TR>

<tr class="alt">    <td>&nbsp;</td>
        <td>MUO10.2<br><a href="/servlets/TairObject?type=locus&name=AT3g29320">AT3g29320</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02576.1">BAB02576.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g29320">alpha-glucan phosphorylase, putative</A></TD></TR>	

<TR> <TD ROWSPAN=11 valign=top><B><a href="http://www.cazy.org/fam/GT37.html">Glycosyltransferase Family- 37</B></TD>     <td>&nbsp;</td>
        <td> F26H6.13<br><a href="/servlets/TairObject?type=locus&name=At2g15350">At2g15350</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD22289.1">AAD22289.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15350">unknown protein</A></TD></TR>
	
	
<TR>    <td>&nbsp;</td>
        <td> F26H6.11<br><a href="/servlets/TairObject?type=locus&name=At2g15370">At2g15370</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD22287.1">AAD22287.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15370">unknown protein</A></TD></TR>

<TR>    <td>&nbsp;</td>
        <td>F26H6.9 <br><a href="/servlets/TairObject?type=locus&name=At2g15390">At2g15390</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD22285.1">AAD22285.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15390">unknown protein </A></TD></TR>	
	
<TR>    <td>&nbsp;</td>
        <td> F16A14.28<br><a href="/servlets/TairObject?type=locus&name=At1g14070">At1g14070</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF79408.1">AAF79408.1</A></TD>
	<TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14070">xyloglucan fucosyltransferase, putative</A></TD></TR>
	
	
<TR>    <td>&nbsp;</td>
        <td> F1M20.10<br><a href="/servlets/TairObject?type=locus&name=At1g74420">At1g74420</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF15914.1">AAF15914.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74420">putative xyloglucan fucosyltransferase</A></TD></TR>

<TR>    <td>&nbsp;</td>
        <td> F7A19.15<br><a href="/servlets/TairObject?type=locus&name=At1g14070">At1g14070</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD39292.1">AAD39292.1</A></TD>
	<TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14070">xyloglucan fucosyltransferase, putative</A></TD></TR>	

<TR>    <td>&nbsp;</td>
        <td> F7A19.16<br><a href="/servlets/TairObject?type=locus&name=At1g14080">At1g14080</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD39293.1">AAD39293.1</A></TD>
	<TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14080">xyloglucan fucosyltransferase, putative</A></TD></TR>
	
	
<TR>    <td>&nbsp;</td>
        <td> F7A19.18<br><a href="/servlets/TairObject?type=locus&name=At1g14100">At1g14100</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD39294.1">AAD39294.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14100">hypothetical protein</A></TD></TR>

<TR>    <td>&nbsp;</td>
        <td> F7A19.19<br><a href="/servlets/TairObject?type=locus&name=At1g14110">At1g14110</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD39295.1">AAD39295.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14110">hypothetical protein </A></TD></TR>	

<TR>    <td>&nbsp;</td>
        <td> T18E12.12<br><a href="/servlets/TairObject?type=locus&name=At2g03210">At2g03210</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC34481.1">AAC34481.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g03210">unknown protein</A></TD></TR>
	
	
<TR>    <td>&nbsp;</td>
        <td>T18E12.11<br><a href="/servlets/TairObject?type=locus&name=At2g03220">At2g03220</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC34480.1">AAC34480.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g03220">unknown protein</A></TD></TR>

<TR  bgcolor=
D5D9DD> <TD ROWSPAN=2 valign=top><B><a href="http://www.cazy.org/fam/GT41.html">Glycosyltransferase Family- 41</B></TD>   <td>&nbsp;</td>
        <td>T6K12.14<br><a href="/servlets/TairObject?type=locus&name=AT3g04240">AT3g04240</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF26789.1 ">AAF26789.1 </A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g04240">putative O-linked GlcNAc transferase</A></TD></TR>	

<tr class="alt">    <td>&nbsp;</td>
        <td>F24K9.29<br><a href="/servlets/TairObject?type=locus&name=AT3g11540">AT3g11540</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC49446.1">AAC49446.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g11540">spindly (gibberellin signal transduction protein)</A></TD></TR>
	
	
<TR><TD ROWSPAN=4 valign=top><B><a href="http://www.cazy.org/fam/GT43.html">Glycosyltransferase Family- 43</B></TD>    <td>&nbsp;</td>
        <td>T2N18.15<br> <a href="/servlets/TairObject?type=locus&name=At2g37090">At2g37090</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD18150.1">AAD18150.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37090">unknown protein</A></TD></TR>

<TR>    <td>&nbsp;</td>
        <td> C7A10.470<br><a href="/servlets/TairObject?type=locus&name=AT4g36890">AT4g36890</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB16800.1">CAB16800.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g36890">UDP-glucuronyltransferase-like protein</A></TD></TR>	

<TR>    <td>&nbsp;</td>
        <td> T17H3.10<br><a href="/servlets/TairObject?type=locus&name=At1g27600">At1g27600</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD45998.1">AAD45998.1</A></TD>
	<TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27600">expressed protein</A></TD></TR>
	
	
<TR>    <td>&nbsp;</td>
        <td> T22C5.4<br><a href="/servlets/TairObject?type=locus&name=At1g27600">At1g27600</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF24965.1">AAF24965.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27600">hypothetical protein</A></TD></TR>

<TR  bgcolor=
D5D9DD><TD ROWSPAN=4 valign=top><B><a href="http://www.cazy.org/fam/GT47.html">Glycosyltransferase Family- 47</B></TD>    <td>&nbsp;</td>
        <td> F27K19_10<br><a href="/servlets/TairObject?type=locus&name=AT3g55830">AT3g55830</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB87837.1">CAB87837.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55830">putative protein</A></TD></TR>	
	
<tr class="alt">    <td>&nbsp;</td>
        <td> F5I6.4<br><a href="/servlets/TairObject?type=locus&name=At1g80290">At1g80290</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF27686.1">AAF27686.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80290">hypothetical protein </A></TD></TR>
	
	
<tr class="alt">    <td>&nbsp;</td>
        <td> T27B3.50<br><a href="/servlets/TairObject?type=locus&name=AT3g42180">AT3g42180</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB68119.1">CAB68119.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g42180">putative protein</A></TD></TR>

<tr class="alt">    <td>&nbsp;</td>
        <td> T32M21_100<br><a href="/servlets/TairObject?type=locus&name=AT5g04500">AT5g04500</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB85556.1">CAB85556.1</A></TD>
	<TD><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g04500">putative protein</A></TD></TR>

<TR><TD ROWSPAN=12 valign=top><B><a href="http://www.cazy.org/fam/GT48.html">Glycosyltransferase Family- 48</B></TD>   <td>&nbsp;</td>
        <td>F3F20.1<br><a href="/servlets/TairObject?type=locus&name=At1g05570">At1g05570</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD30609.1">AAD30609.1</A></td>
	<Td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05570">putative glucan synthase</A></TD></TR>

<TR>    <td>&nbsp;</td>
        <td>F22D22.29<br><a href="/servlets/TairObject?type=locus&name=At2g31960">At2g31960</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD15408.1 ">AAD15408.1 </A></td>     <Td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g31960">putative glucan synthase</A></TD></TR>
	
<TR>    <td>&nbsp;</td>
        <td>T1J8.3<br> <a href="/servlets/TairObject?type=locus&name=At2g36850">At2g36850</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD31571.1">AAD31571.1</A></td>
	<Td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36850">putative glucan synthase</A></TD></TR>

<TR>    <td>&nbsp;</td>
        <td>F9H3.18 T5L23.4<br><a href="/servlets/TairObject?type=locus&name=AT4g03550">AT4g03550</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD11597.1">AAD11597.1</A></td>
	<Td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g03550">putative glucan synthase component</A></TD></TR>
	
<TR>    <td>&nbsp;</td>
        <td>T32N4.8<br><a href="/servlets/TairObject?type=locus&name=AT4g04970">AT4g04970</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD48971.1">AAD48971.1</A></td>
	<Td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g04970">not found</A></TD></TR>

<TR>    <td>&nbsp;</td>
        <td>F12K11.17<br><a href="/servlets/TairObject?type=locus&name=At1g06490">At1g06490</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF24822.1">AAF24822.1</A></td>
	<Td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06490">glucan synthase, putative</A></TD></TR>
	
<TR>    <td>&nbsp;</td>
        <td>F17J16_150<br><a href="/servlets/TairObject?type=locus&name=AT3g59100">AT3g59100</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB86938.1">CAB86938.1</A></td>
	<Td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g59100">putative protein</A></TD></TR>


<TR>    <td>&nbsp;</td>
        <td>F5H8.14<br><a href="/servlets/TairObject?type=locus&name=At5g36870">At5g36870</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA98065.1">BAA98065.1</A></td>
	<Td><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g36870">callose synthase (1,3-beta-glucan synthase) family</A></TD></TR>
	
<TR>    <td>&nbsp;</td>
        <td>MIE1.7<br><a href="/servlets/TairObject?type=locus&name=AT3g14570">AT3g14570</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02389.1">BAB02389.1</A></td>
	<Td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g14570">hypothetical protein</A></TD></TR>

<TR>    <td>&nbsp;</td>
        <td>T1B9.18<br><a href="/servlets/TairObject?type=locus&name=AT3g07170">AT3g07170</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF20230.1">AAF20230.1</A></td>
	<Td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07170">unknown protein</A></TD></TR>
	
<TR>    <td>&nbsp;</td>
        <td>T24H18_170<br><a href="/servlets/TairObject?type=locus&name=AT5g13000">AT5g13000</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB88264.1">CAB88264.1</A></td>
	<Td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g13000">callose synthase catalytic subunit -like protein</A></TD></TR>

<TR>    <td>&nbsp;</td>
        <td>T25N20.22 (probable fragment)</td>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF79729.1">AAF79729.1</A></td>
	<Td>&nbsp;</TD></TR>
	
<tr class="alt">  <TD ROWSPAN=1 valign=top><B><a href="http://www.cazy.org/fam/GT50.html">Glycosyltransferase Family- 50</B></TD> <td>&nbsp;</td>
        <td><a href="/servlets/TairObject?type=locus&name=At5g22130">At5g22130</a></TD>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC34506.1 ">CAC34506.1 </A></td>
	<Td>&nbsp;</TD></TR>

<TR><TD ROWSPAN=1 valign=top><B>Non-Classified GT</B></TD>    <td>&nbsp;</td>
        <td>&nbsp;</td>
	<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB90610.1 ">CAB90610.1 </A></td>
	<Td>&nbsp;</TD></TR>
	



	
	
  </table>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
