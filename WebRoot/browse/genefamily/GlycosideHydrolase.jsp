<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Glycoside Hydrolase Gene Families";
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
 




<A NAME="GlycosideHydrolase.html"><H2>Glycoside Hydrolase Gene Families</H2></a>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD>
<TD><a href="http://www.cazy.org/" target="display"><B>Carbohydrate-Active enZymes server</B></a><B> (CAZy)</B><BR><BR>           
  <a href="http://www.cazy.org/fam/acc_CE.html" target="display">Carbohydrate Esterases Family Server</a><BR>
  <a href="http://www.cazy.org/fam/acc_GH.html" target="display">Glycoside Hydrolases Family Server</a><BR>
  <a href="http://www.cazy.org/fam/acc_GT.html" target="display">Glycosyltransferase Family Server</a><BR>
  <a href="http://www.cazy.org/fam/acc_PL.html" target="display">Polysaccharide Lyases Family Server</a>
</TD></TR>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD> </TD></TR>

<TR><TD valign=top><B>Contact:</B></TD>
<TD><a href="/servlets/Community?action=view&type=person&communityID=912146" target="display">Bernard Henrissat</a><BR><A href="/servlets/Community?action=view&type=person&communityID=912144" target="display">Pedro M.Coutinho</a><BR><A href="mailto:emeline@afmb.cnrs-mrs.fr">Emeline Deleury</a></TD></TR>

</TABLE>

	  
    <P>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <TH><B>Gene Family<BR>Name:</B></TH>
        <TH><B>Protein Name:</B></TH>
        <TH><B>Genomic Locus:</B></TH>
        <TH><B>Accession:</B></TH>
	<TH><B>TIGR Annotation:</B></TH>    
	    </TR>
	    


<tr class="alt">    <TD ROWSPAN=48 valign=top><B><a href="http://www.cazy.org/GH1.html">Glycoside Hydrolase Family 1</a></B></TD>
	      <TD></TD>
	      <TD>F19K6_15<BR><a href="/servlets/TairObject?type=locus&name=At1g52400">At1g52400</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF22295.1">AAF22295.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g52400">beta-glucosidase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T12J13.8<br><a href="/servlets/TairObject?type=locus&name=At3g03640">At3g03640</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC31962.1">AAC31962.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g03640">glycosyl hydrolase family 1</a></TD></TR>


<tr class="alt">	      <TD>PSR3.1</TD>
	      <TD>F3L24.13<br><a href="/servlets/TairObject?type=locus&name=At3g09260">At3g09260</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB38783.1">AAB38783.1</a></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g09260">glycosyl hydrolase family 1</TD></TR>

<tr class="alt">	      <TD>PSR3.2</TD>
	      <TD>T6J19.2<br>T27F4.2<BR><a href="/servlets/TairObject?type=locus&name=At1g66270">At1g66270</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB64244.1">AAB64244.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66270">beta-glucosidase</a></TD></TR>


<tr class="alt">	      <TD>PYK10</TD>
	      <TD>&nbsp;</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA61592.1">CAA61592.1</a></TD>
	      <TD></TD></TR>

<tr class="alt">	      <TD> &nbsp;</TD>
	      <TD>T1N24.7<BR><a href="/servlets/TairObject?type=locus&name=AT5g26000">AT5g26000</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC18869.1">AAC18869.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g26000">myrosinase precursor</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>T1N24_18<BR><a href="/servlets/TairObject?type=locus&name=AT5g25980">AT5g25980</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK28645.1">AAK28645.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g25980">myrosinase TGG2</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>At2g25630 (fragment)</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD31364.1">AAD31364.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25630">putative beta-glucosidase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>MRC8.6<BR><a href="/servlets/TairObject?type=locus&name=AT3g18080">AT3g18080</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK25950.1">AAK25950.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g18080">beta-glucosidase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T2O9_120<BR><a href="/servlets/TairObject?type=locus&name=AT3g60140">AT3g60140</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG23719.1">AAG23719.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g60140">beta-glucosidase-like protein</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>ATA27</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC39504.1">AAC39504.1</a></TD>
	      <TD></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F16N3.11<BR><a href="/servlets/TairObject?type=locus&name=At1g47600">At1g47600</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD46026.1">AAD46026.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g47600">thioglucosidase, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F17L22.220<BR><a href="/servlets/TairObject?type=locus&name=AT4g21760">AT4g21760</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB36820.1">CAB36820.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g21760">beta-glucosidase -like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F1N20.200<BR><a href="/servlets/TairObject?type=locus&name=AT4g22100">AT4g22100</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA18113.1">CAA18113.1</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF02882.1ath1&locus=AT4g22100">glucosidase like protein</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F22D16.15<BR><a href="/servlets/TairObject?type=locus&name=At1g02790">At1g02790</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF02882.1 ">AAF02882.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02790">polygalacturonase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F26K9_170<BR><a href="/servlets/TairObject?type=locus&name=AT3g62740">AT3g62740</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB83124.1 ">CAB83124.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g62740">beta-glucosidase-like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F26K9_180<BR><a href="/servlets/TairObject?type=locus&name=AT3g62750">AT3g62750</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB83125.1 ">CAB83125.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g62750">beta-glucosidase-like protein</a></TD></TR>		      

<tr class="alt">	      <TD>PSR3.1</TD>
	      <TD>F3L24.13<BR><a href="/servlets/TairObject?type=locus&name=AT3g09260">AT3g09260</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF14024.1">AAF14024.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g09260">thioglucosidase 3D precursor</a></TD></TR>



<tr class="alt">	      <TD></TD>
	      <TD>F4I1.26<BR><a href="/servlets/TairObject?type=locus&name=At2g44450">At2g44450</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC16091.1">AAC16091.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44450">putative beta-glucosidase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F4I1.27<BR><a href="/servlets/TairObject?type=locus&name=At2g44460">At2g44460</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC16092.1">AAC16092.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44460">putative beta-glucosidase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F4I1.28<BR><a href="/servlets/TairObject?type=locus&name=At2g44470">At2g44470</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC16093.1">AAC16093.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44470">putative beta-glucosidase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F4I1.29<BR><a href="/servlets/TairObject?type=locus&name=At2g44480">At2g44480</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC16094.1">AAC16094.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44480">putative beta-glucosidase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F4I1.30<BR><a href="/servlets/TairObject?type=locus&name=At2g44490">At2g44490</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC16095.1">AAC16095.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44490">putative beta-glucosidase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F5D21.16<BR><a href="/servlets/TairObject?type=locus&name=At1g51490">At1g51490</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG52622.1">AAG52622.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51490">cyanogenic beta-glucosidase, putative</a></TD></TR>	      


<tr class="alt">	      <TD></TD>
	      <TD>F5D21.17<BR><a href="/servlets/TairObject?type=locus&name=At1g51470">At1g51470</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG52628.1">AAG52628.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51470">myrosinase precursor, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F5E6.16<BR><a href="/servlets/TairObject?type=locus&name=AT3g06510">AT3g06510</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG51335.1">AAG51335.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g06510">beta-glucosidase, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F8K4.2<BR><a href="/servlets/TairObject?type=locus&name=At1g61810">At1g61810</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC28501.1">AAC28501.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61810">beta-glucosidase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F8K4.3<BR><a href="/servlets/TairObject?type=locus&name=At1g61820">At1g61820</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC28502.1">AAC28502.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61820">beta-glucosidase, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>K15C23.9<BR><a href="/servlets/TairObject?type=locus&name=AT5g44640">AT5g44640</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA98117.1">BAA98117.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g44640">beta-glucosidase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>K18P6.7<BR><a href="/servlets/TairObject?type=locus&name=AT5g24540">AT5g24540</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11206 ">BAB11206</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g24540">beta-glucosidase</a></TD></TR>
	      
	      <tr class="alt">	      <TD></TD>
	      <TD>K18P6.8<BR><a href="/servlets/TairObject?type=locus&name=AT5g24550">AT5g24550</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11207.1 ">BAB11207.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g24550">beta-glucosidase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>K5J14.6<BR><a href="/servlets/TairObject?type=locus&name=AT5g42260">AT5g42260</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10199.1">BAB10199.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g42260">beta-glucosidase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MHC9.5<BR><a href="/servlets/TairObject?type=locus&name=AT3g21370">AT3g21370</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB03050.1">BAB03050.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g21370">beta-glucosidase, putative</a></TD></TR>
	      

<tr class="alt">	      <TD></TD>
	      <TD>MLF18.1</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11630.1 ">BAB11630.1</a></TD>
	      <TD></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MRB17.7<BR><a href="/servlets/TairObject?type=locus&name=AT5g54570">AT5g54570</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09336.1 ">BAB09336.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g54570">beta-glucosidase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>MRC8.5<BR><a href="/servlets/TairObject?type=locus&name=AT3g18070">AT3g18070</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02019.1 ">BAB02019.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g18070">beta-glucosidase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MTG13.2 (fragment)<BR><a href="/servlets/TairObject?type=locus&name=AT5g16580">AT5g16580</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10185.1">BAB10185.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g16580">putative protein</a></TD></TR>	      
	      
<tr class="alt">	      <TD></TD>
	      <TD>T13D8.15<BR><a href="/servlets/TairObject?type=locus&name=At1g60260">At1g60260</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC24061.1">AAC24061.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60260">beta-glucosidase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T13D8.16<BR><a href="/servlets/TairObject?type=locus&name=At1g60270">At1g60270</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC24060.1">AAC24060.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60270">beta-glucosidase, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>T1K7.7<BR><a href="/servlets/TairObject?type=locus&name=At1g26560">At1g26560</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val= T21L14.20http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF98564.1">AAF98564.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/e2k1/euk_display.dbi?db=AAB91979.1ath1&locus=At1g26560">beta-glucosidase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T26D3.6</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF88017.1">AAF88017.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=T26D3.6">hypothetical protein</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>T27E11.60<BR><a href="/servlets/TairObject?type=locus&name=AT4g27820">AT4g27820</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB43970.1">CAB43970.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g27820">putative beta-glucosidase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T27E11.70<BR><a href="/servlets/TairObject?type=locus&name=AT4g27830">AT4g27830</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB43971.1">CAB43971.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g27830">putative beta-glucosidase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>T27F4.3<BR><a href="/servlets/TairObject?type=locus&name=At1g66280">At1g66280</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG52159.1">AAG52159.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66280">beta-glucosidase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T2K10.15<BR><a href="/servlets/TairObject?type=locus&name=At1g60090">At1g60090</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD14488.1">AAD14488.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60090">beta-glucosidase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T2O9.100<BR><a href="/servlets/TairObject?type=locus&name=AT3g60120">AT3g60120</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB75927.1 ">CAB75927.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g60120">beta-glucosidase-like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T2O9.110<BR><a href="/servlets/TairObject?type=locus&name=AT3g60130">AT3g60130</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB75928.1">CAB75928.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g60130">beta-glucosidase-like protein</a></TD></TR>


<tr class="alt">	      <TD>ATA27</TD>
	      <TD>T4O12.15<BR><a href="/servlets/TairObject?type=locus&name=At1g75940">At1g75940</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF26759.1">AAF26759.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75940">beta-glucosidase, putative</a></TD></TR>

<TR>	<TD ROWSPAN=2 valign=top><B><a href="http://www.cazy.org/fam/GH2.html">Glycoside Hydrolase Family 2</a></B></TD>     <TD></TD>
	      <TD>F7G19.12<BR><a href="/servlets/TairObject?type=locus&name=At1g09010">At1g09010</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB70407.1">AAB70407.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09010">unknown protein</a></TD></TR>		      

<TR>	      <TD></TD>
	      <TD>T14E10_10<br><a href="/servlets/TairObject?type=locus&name=At3g54440">At3g54440</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB77564.1 ">CAB77564.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g54440">Expressed protein</a></TD></TR>


	      
<tr class="alt">  
	  <TD ROWSPAN=14 valign=top><B><a href="http://www.cazy.org/fam/GH3.html">Glycoside Hydrolase Family 3</a></B></TD>
<TD></TD>
	  <TD>T14P4_11<BR><a href="/servlets/TairObject?type=locus&name=At1g02640">At1g02640</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val= AAK56255.1 ">AAK56255.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02640">beta-xylosidase, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F12B17_90<BR><a href="/servlets/TairObject?type=locus&name=AT5g10560">AT5g10560</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val= CAB89387.1 ">CAB89387.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g10560">beta-xylosidase - like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F13I12.100<BR><a href="/servlets/TairObject?type=locus&name=AT3g47050">AT3g47050</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB61951.1 ">CAB61951.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47050">beta-D-glucan exohydrolase - like protein</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>F13I12.50<BR><a href="/servlets/TairObject?type=locus&name=AT3g47000">AT3g47000</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val= CAB61946.1 ">CAB61946.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47000">beta-D-glucan exohydrolase - like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F13I12.60<BR><a href="/servlets/TairObject?type=locus&name=AT3g47010">AT3g47010</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB61947.1 ">CAB61947.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47010">beta-D-glucan exohydrolase - like protein</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F13I12.90<BR><a href="/servlets/TairObject?type=locus&name=AT3g47040">AT3g47040</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB61950.1 ">CAB61950.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47040">beta-D-glucan exohydrolase - like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F17I14_80<BR><a href="/servlets/TairObject?type=locus&name=AT5g09730">AT5g09730</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val= CAB89357.1 ">CAB89357.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g09730">beta-xylosidase - like protein</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>F26K9_140<BR><a href="/servlets/TairObject?type=locus&name=AT3g62710">AT3g62710</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB83121.1 ">CAB83121.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g62710">beta-D-glucan exohydrolase-like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F28K19.27<BR><a href="/servlets/TairObject?type=locus&name=At1g78060">At1g78060</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF17692.1 ">AAF17692.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78060">xylosidase, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>K7J8.3<BR><a href="/servlets/TairObject?type=locus&name=AT5g49360">AT5g49360</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09906.1 ">BAB09906.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g49360">xylosidase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MMB12.9<br><a href="/servlets/TairObject?type=locus&name=At3g19620">At3g19620</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02547.1 ">BAB02547.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g19620">glycosyl hydrolase family 3</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>MUB3.9<BR><a href="/servlets/TairObject?type=locus&name=AT5g64570">AT5g64570</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11424.1 ">BAB11424.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64570">beta-xylosidase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F22D1.110<BR><a href="/servlets/TairObject?type=locus&name=At5g20940">At5g20940</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AY092999">AY092999</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g20940">glycosyl hydrolase family 3</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F22D1.120<BR><a href="/servlets/TairObject?type=locus&name=At5g20950">At5g20950</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=AF462808">AF462808</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g20940">glycosyl hydrolase family 3 </a></TD></TR>



<TR><TD ROWSPAN=13 valign=top><B><a href="http://www.cazy.org/fam/GH5.html">Glycoside Hydrolase Family 5</a></B></TD>     <TD></TD>
	      <TD>F26K10_200<BR><a href="/servlets/TairObject?type=locus&name=AT4g28320">AT4g28320</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB79634.1">CAB79634.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g28320">putative (1-4)-beta-mannan endohydrolase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F5H14.35<BR><a href="/servlets/TairObject?type=locus&name=At2g20680">At2g20680</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD20927.1 ">AAD20927.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g20680">(1-4)-beta-mannan endohydrolase</a></TD></TR>	      

<TR>	      <TD></TD>
	      <TD>F3F19.15<BR><a href="/servlets/TairObject?type=locus&name=At1g13130">At1g13130</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD31066.1">AAD31066.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g13130">hypothetical protein</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F5E19_40<BR><a href="/servlets/TairObject?type=locus&name=AT5g16700">AT5g16700</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01834.1 ">CAC01834.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g16700">putative protein</a></TD></TR>

	      
<TR>	      <TD></TD>
	      <TD>K1F13.12<BR><a href="/servlets/TairObject?type=locus&name=AT5g66460">AT5g66460</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10922.1 ">BAB10922.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g66460">mannan endo-1,4-beta-mannosidase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>K3M16_70<BR><a href="/servlets/TairObject?type=locus&name=AT5g17500">AT5g17500</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01894.1 ">CAC01894.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g17500">putative protein</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>MQP15.4<BR><a href="/servlets/TairObject?type=locus&name=AT3g30540">AT3g30540</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01021.1 ">BAB01021.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g30540">putative beta-mannan endohydrolase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>MTC11.2<BR><a href="/servlets/TairObject?type=locus&name=AT3g26130">AT3g26130</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02432.1 ">BAB02432.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g26130">cellulase, putative</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>MTC11.4<BR><a href="/servlets/TairObject?type=locus&name=AT3g26140">AT3g26140</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02434.1 ">BAB02434.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g26140">cellulase, putative</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T20L15_200<BR><a href="/servlets/TairObject?type=locus&name=AT5g01930">AT5g01930</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB82763.1 ">CAB82763.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g01930">(1-4)-beta-mannan endohydrolase-like protein</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T6A9.1<BR><a href="/servlets/TairObject?type=locus&name=At1g02310">At1g02310</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG00883.1 ">AAG00883.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02310">(1-4)-beta-mannan endohydrolase precursor, putative</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T7M13.2<BR><a href="/servlets/TairObject?type=locus&name=AT3g10900">AT3g10900</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF19559.1 ">AAF19559.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g10900">putative (1-4)-beta-mannan endohydrolase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T7M13.3<BR><a href="/servlets/TairObject?type=locus&name=AT3g10890">AT3g10890</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF19560.1">AAF19560.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g10890">putative (1-4)-beta-mannan endohydrolase</a></TD></TR>

 	      

<tr class="alt"><TD ROWSPAN=25 valign=top><B><a href="http://www.cazy.org/fam/GH9.html">Glycoside Hydrolase Family 9</a></B></TD>	      <TD></TD>
	      <TD>F5A18_11<br><a href="/servlets/TairObject?type=locus&name=At1g70710">At1g70710</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA67156.1">CAA67156.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70710">glycosyl hydrolase family 9 (endo-1,4-beta-glucanase)</TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F26A9.24<br><a href="/servlets/TairObject?type=locus&name=At1g71380">At1g71380</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAA90944.1 ">AAA90944.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71380">glycosyl hydrolase family 9</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F22D16.21<BR><a href="/servlets/TairObject?type=locus&name=At1g02800">At1g02800</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC16418.1">AAC16418.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02800">endo-1,4-beta-glucanase precursor, putative</a></TD></TR>


<tr class="alt">	      <TD>KORRIGAN</TD>
	      <TD>K2I5_8<br><a href="/servlets/TairObject?type=locus&name=At5g49720">At5g49720</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC83240.1">AAC83240.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49720">glycosyl hydrolase family 9 (endo-1,4-beta-glucanase)</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F15H21_9<BR><a href="/servlets/TairObject?type=locus&name=At1g64390">At1g64390</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val==AAG21508.1">AAG21508.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64390">endo-beta-1,4-glucanase, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F10A5.13<BR><a href="/servlets/TairObject?type=locus&name=At1g75680">At1g75680</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF87112.1">AAF87112.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75680">endo-beta-1,4-glucanase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F16B22.5<BR><a href="/servlets/TairObject?type=locus&name=At2g44560">At2g44560</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC16102.1">AAC16102.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44560">putative glucanase</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>F16B22.6<BR><a href="/servlets/TairObject?type=locus&name=At2g44570">At2g44570</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC27459.1">AAC27459.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44570">putative glucanase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F17A8.90<BR><a href="/servlets/TairObject?type=locus&name=AT4g09740">AT4g09740</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB39641.1">CAB39641.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g09740">cellulase-like protein</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F19G10.16<BR><a href="/servlets/TairObject?type=locus&name=At1g22880">At1g22880</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB72171.1">AAB72171.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22880">putative endo-1,4-beta-D-glucanase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F19H22.100<BR><a href="/servlets/TairObject?type=locus&name=AT4g39000">AT4g39000</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB38820.1">CAB38820.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g39000">putative endo-1,4-beta-glucanase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F19H22.110<BR><a href="/servlets/TairObject?type=locus&name=AT4g39010">AT4g39010</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB38821.1">CAB38821.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g39010">putative endo-1,4-beta-glucanase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F19H22.90<BR><a href="/servlets/TairObject?type=locus&name=AT4g38990">AT4g38990</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB38819.1">CAB38819.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38990">putative endo-1,4-beta-glucanase</a></TD></TR>	


<tr class="alt">	      <TD></TD>
	      <TD>F27J15.28 F27K7.5<BR><a href="/servlets/TairObject?type=locus&name=At1g48930">At1g48930</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF69707.1">AAF69707.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48930">endo-beta-1,4-glucanase, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F2P3.1<BR><a href="/servlets/TairObject?type=locus&name=AT4g11050">AT4g11050</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC35539.1">AAC35539.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g11050">putative glucanase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F4I1.36 F16B22.3<BR><a href="/servlets/TairObject?type=locus&name=At2g44540">At2g44540</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC16100.1">AAC16100.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44540">putative cellulase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F4I1.37; F16B22.4<BR><a href="/servlets/TairObject?type=locus&name=At2g44550">At2g44550</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC16101.1">AAC16101.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g44550">putative glucanase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F5I14.14<BR><a href="/servlets/TairObject?type=locus&name=At1g65610">At1g65610</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB60922.1">AAB60922.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65610">endo-1,4-beta-glucanase, putative</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>F6F9.1<BR><a href="/servlets/TairObject?type=locus&name=At1g19940">At1g19940</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF79918.1">AAF79918.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19940">endo-beta-1,4-D-glucanase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F9D16.30<BR><a href="/servlets/TairObject?type=locus&name=AT4g23560">AT4g23560</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA23022.1">CAA23022.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g23560">putative cellulase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>T21L14.7<BR><a href="/servlets/TairObject?type=locus&name=At2g32990">At2g32990</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB91971.1">AAB91971.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32990">putative glucanse</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T22A6.90<BR><a href="/servlets/TairObject?type=locus&name=AT4g24260">AT4g24260</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB45061.1">CAB45061.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g24260">endo-1,4-beta-glucanase like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T26J12.2 or F26F24.6<BR><a href="/servlets/TairObject?type=locus&name=At1g23210">At1g23210</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC00616.1">AAC00616.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23210">Hypothetical protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T28A8_150<BR><a href="/servlets/TairObject?type=locus&name=AT3g43860">AT3g43860</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB83158.1">CAB83158.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g43860">cellulase-like protein</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>T2H3.5<BR><a href="/servlets/TairObject?type=locus&name=AT4g02290">AT4g02290</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC28173.1">AAC28173.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g02290">putative endo-1,4-beta glucanase</a></TD></TR>

<TR>	<TD ROWSPAN=12 valign=top><B><a href="http://www.cazy.org/fam/GH10.html">Glycoside Hydrolase Family 10</a></B></TD>     <TD></TD>
	      <TD>F17I5.10<BR><a href="/servlets/TairObject?type=locus&name=AT4g33820">AT4g33820</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19864.1">CAA19864.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33820">putative protein</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>F17I5.20<BR><a href="/servlets/TairObject?type=locus&name=AT4g33830">AT4g33830</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19865.1">CAA19865.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33830">putative protein</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F17I5.30<BR><a href="/servlets/TairObject?type=locus&name=AT4g33840">AT4g33840</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19866.1">CAA19866.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33840">putative protein</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F17I5.40<BR><a href="/servlets/TairObject?type=locus&name=AT4g33850">AT4g33850</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19867.1">CAA19867.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33850">putative protein</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F17I5.50<BR><a href="/servlets/TairObject?type=locus&name=AT4g33860">AT4g33860</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19868.1">CAA19868.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33860">putative protein</a></TD></TR>	

<TR>	      <TD></TD>
	      <TD>F20M13.210<BR><a href="/servlets/TairObject?type=locus&name=AT4g38650">AT4g38650</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB37521.1">CAB37521.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38650">putative protein</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F22I13.70<BR><a href="/servlets/TairObject?type=locus&name=AT4g38300">AT4g38300</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB37486.1">CAB37486.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38300">putative protein</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>F9M13.1<BR><a href="/servlets/TairObject?type=locus&name=AT4g08160">AT4g08160</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD27896.1">AAD27896.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g08160">putative xylan endohydrolase</a></TD></TR>

<TR>	      <TD>RXF12</TD>
	      <TD>F19C14.2 F9K23.10<BR><a href="/servlets/TairObject?type=locus&name=At1g58370">At1g58370</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF82251.1">AAF82251.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g58370">xylan endohydrolase, putative</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T16L1.300<BR><a href="/servlets/TairObject?type=locus&name=AT4g33810">AT4g33810</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA20594.1">CAA20594.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33810">beta-xylan endohydrolase -like protein</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T27I1.7<BR><a href="/servlets/TairObject?type=locus&name=At1g10050">At1g10050</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC34334.1">AAC34334.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10050">putative xylan endohydrolase</a></TD></TR>	
<TR>	      <TD></TD>
	      <TD>T6B13.7<BR><a href="/servlets/TairObject?type=locus&name=At2g14690">At2g14690</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC69373.1">AAC69373.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g14690">1,4-beta-xylan endohydrolase</a></TD></TR>	

<tr class="alt">	<TD ROWSPAN=10 valign=top><B><a href="http://www.cazy.org/fam/GH13.html">Glycoside Hydrolase Family 13</a></B></TD>     <TD>SBE2.1</TD>
	      <TD>F1O11.2<br><a href="/servlets/TairObject?type=locus&name=At2g36390">At2g36390</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB03099.1">AAB03099.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36390">starch branching enzyme II</a></TD></TR>

<tr class="alt">	     
<TD>SBE2.2</TD>
	      <TD>F17C15_70<br><a href="/servlets/TairObject?type=locus&name=At5g03650">At5g03650</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=U22428">U22428</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g03650">1,4-alpha-glucan branching enzyme protein soform SBE2.2 precursor </a></TD></TR>

<tr class="alt">	      <TD></TD>
<TD>T19N18.90<br><a href="/servlets/TairObject?type=locus&name=AT5G04360">AT5G04360</a></TD>
<TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?val=NC_003076">NC_003076</a></TD>
<TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g04360">pullulanase-like protein (starch debranching enzyme)</a></TD></TR> 

<tr class="alt">	      <TD></TD>
	      <TD>F23J3_50<BR><a href="/servlets/TairObject?type=locus&name=AT4g09020">AT4g09020</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB78026.1">CAB78026.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g09020">isoamylase-like protein</a></TD></TR>



<tr class="alt">	      <TD></TD>
	      <TD>F13M23.140<BR><a href="/servlets/TairObject?type=locus&name=AT4g25000">AT4g25000</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB36742.1">CAB36742.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25000">alpha-amylase - like protein</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F15K9.9<BR><a href="/servlets/TairObject?type=locus&name=At1g03310">At1g03310</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC72113.1">AAC72113.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g03310">putative isoamylase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MQC12.23<br><a href="/servlets/TairObject?type=locus&name=AT3G20440">AT3G20440</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02827.1">BAB02827.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G20440">1,4-alpha-glucan branching enzyme, putative</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>T17F3.14<BR><a href="/servlets/TairObject?type=locus&name=At1g69830">At1g69830</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF07390.1">AAF07390.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69830">putative alpha-amylase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T23E18.6<BR><a href="/servlets/TairObject?type=locus&name=At1g76130">At1g76130</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF17626.1">AAF17626.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76130">alpha-amylase, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>T28M21.9<BR><a href="/servlets/TairObject?type=locus&name=At2g39930">At2g39930</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB95278.1 ">AAB95278.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39930">putative isoamylase</a></TD></TR>



<TR><TD ROWSPAN=9 valign=top><B><a href="http://www.cazy.org/fam/GH14.html">Glycoside Hydrolase Family 14</a></B></TD>     <TD></TD>
	      <TD>dl3650c<BR><a href="/servlets/TairObject?type=locus&name=AT4g15210">AT4g15210</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAA32737.1">AAA32737.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g15210">beta-amylase</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>dl4575c<BR><a href="/servlets/TairObject?type=locus&name=AT4g17090">AT4g17090</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB46051.1">CAB46051.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g17090">putative beta-amylase</a></TD></TR>

<tr>	      <td>BMY3</td>
              <td>T1A4_50<br><a href="/servlets/TairObject?type=locus&name=AT5G18670">AT5G18670</a></TD>
	      <td><A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AF402598">AF402598</a></td>
	      <td><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G18670">glycosyl hydrolase family 14 (beta-amylase)</a></td></tr>	      

  
<TR>	      <TD></TD>
	      <TD>F14O13_11<BR><a href="/servlets/TairObject?type=locus&name=AT3g23920">AT3g23920</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK56281.1">AAK56281.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g23920">beta-amylase, putative</a></TD></TR>	

<TR>	      <TD></TD>
	      <TD>F6N23.1<BR><a href="/servlets/TairObject?type=locus&name=AT4g00490">AT4g00490</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC13634.1">AAC13634.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g00490">putative beta-amylase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F4I18.14<BR><a href="/servlets/TairObject?type=locus&name=At2g45880">At2g45880</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC28536.1">AAC28536.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g45880">putative beta-amylase</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>K9E15.8<BR><a href="/servlets/TairObject?type=locus&name=AT5g45300">AT5g45300</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10251.1">BAB10251.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g45300">beta-amylase-like</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>MDF20.14<BR><a href="/servlets/TairObject?type=locus&name=AT5g55700">AT5g55700</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09237.1">BAB09237.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55700">beta-amylase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T32F6.19<BR><a href="/servlets/TairObject?type=locus&name=At2g32290">At2g32290</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC69949.1">AAC69949.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32290">putative beta-amylase</a></TD></TR>

<tr class="alt"><TD ROWSPAN=33 valign=top><B><a href="http://www.cazy.org/fam/GH16.html">Glycoside Hydrolase Family 16</a></B></TD>	      <TD></TD>
	      <TD>F17I23_380<BR><a href="/servlets/TairObject?type=locus&name=AT4g30280">AT4g30280</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB81021.1">CAB81021.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g30280">xyloglucan endo-1,4-beta-D-glucanase-like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F17I23_370<BR><a href="/servlets/TairObject?type=locus&name=AT4g30290">AT4g30290</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB81022.1">CAB81022.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g30290">xyloglucan endo-1,4-beta-D-glucanase-like protein</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F13C5.160<BR><a href="/servlets/TairObject?type=locus&name=AT4g18990">AT4g18990</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA16756.1">CAA16756.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18990">xyloglucan endo-transglycosylase - like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F16A16.40<BR><a href="/servlets/TairObject?type=locus&name=AT4g28850">AT4g28850</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA22967.1">CAA22967.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g28850">xyloglucan endotransglycosylase - like protein</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>F25G13.170<BR><a href="/servlets/TairObject?type=locus&name=AT4g13080">AT4g13080</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB45507.1">CAB45507.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g13080">endoxyloglucan transferase-like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F25G13.180<BR><a href="/servlets/TairObject?type=locus&name=AT4g13090">AT4g13090</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB45508.1">CAB45508.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g13090">endoxyloglucan transferase-like protein</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F4C21.14<BR><a href="/servlets/TairObject?type=locus&name=AT4g03210">AT4g03210</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD14449.1">AAD14449.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g03210">putative xyloglucan endotransglycosylase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F6H11.140<br><a href="/servlets/TairObject?type=locus&name=AT5G65730">AT5G65730</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA16685.1">CAA16685.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G65730">xyloglucan endotransglycosylase, putative</a></TD></TR>

<tr class="alt">	      <TD>MERI5B</TD>
	      <TD>F9N11.120<BR><a href="/servlets/TairObject?type=locus&name=AT4g30270">AT4g30270</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK59660.1">AAK59660.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g30270">xyloglucan endo-1,4-beta-D-glucanase precursor</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>K3G3.7<br><a href="/servlets/TairObject?type=locus&name=AT3G25050">AT3G25050</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01890.1">BAB01890.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G25050">xyloglucan endotransglycosylase, putative </a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>MDN11.15<BR><a href="/servlets/TairObject?type=locus&name=AT5g48070">AT5g48070</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11071.1">BAB11071.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g48070">xyloglucan endo-1,4-beta-D-glucanase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MSF3.18<BR><a href="/servlets/TairObject?type=locus&name=At2g18800">At2g18800</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD08949.1">AAD08949.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18800">putative xyloglucan endo-transglycosylase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MUA2.10<BR><a href="/servlets/TairObject?type=locus&name=AT5g57530">AT5g57530</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB08788.1">BAB08788.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g57530">xyloglucan endotransglycosylase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>MUA2.11<BR><a href="/servlets/TairObject?type=locus&name=AT5g57540">AT5g57540</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB08789.1">BAB08789.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g57540">xyloglucan endotransglycosylase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MYM9.7<BR><a href="/servlets/TairObject?type=locus&name=AT3g23730">AT3g23730</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01849.1">BAB01849.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g23730">xyloglucan endotransglycosylase, putative</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>T10O24.17<BR><a href="/servlets/TairObject?type=locus&name=At1g10550">At1g10550</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD39577.1">AAD39577.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10550">putative endoxyloglucan transferase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T1J8.5<BR><a href="/servlets/TairObject?type=locus&name=At2g36870">At2g36870</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD31572.1">AAD31572.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36870">putative xyloglucan endo-transglycosylase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>T23J18.21</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF16642.1">AAF16642.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=T23J18.21">endo-xyloglucan transferase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T28I19.80<BR><a href="/servlets/TairObject?type=locus&name=AT4g37800">AT4g37800</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB38928.1">CAB38928.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g37800">endo-xyloglucan transferase - like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T6B13.14<BR><a href="/servlets/TairObject?type=locus&name=At2g14620">At2g14620</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC69380.1">AAC69380.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g14620">putative endoxyloglucan glycosyltransferase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T8F5.9<BR><a href="/servlets/TairObject?type=locus&name=At1g65310">At1g65310</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC27142.1">AAC27142.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65310">xyloglucan endotransglycosylase, putative</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>T8P19.90<BR><a href="/servlets/TairObject?type=locus&name=AT3g48580">AT3g48580</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB62347.1">CAB62347.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g48580">endoxyloglucan transferase-like protein</a></TD></TR>

<tr class="alt">	      <TD>XTR4</TD>
	      <TD>F3C3.5<BR><a href="/servlets/TairObject?type=locus&name=At1g32170">At1g32170</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB18365.1">AAB18365.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32170">endoxyloglucan transferase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F14D17_60<BR><a href="/servlets/TairObject?type=locus&name=AT3g44990">AT3g44990</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA63553.1">CAA63553.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g44990">xyloglucan endo-transglycosylase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>MUA2_13<BR><a href="/servlets/TairObject?type=locus&name=AT5g57560">AT5g57560</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAA92363.1">AAA92363.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g57560">TCH4 protein (gb|AAA92363.1)</a></TD></TR>

<tr class="alt">	      <TD>EXGT-A1</TD>
	      <TD>T9F8.4<br><a href="/servlets/TairObject?type=locus&name=At2g06850">At2g06850</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AF163819">AF163819</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g06850">xyloglucan endotransglycosylase (ext/EXGT-A1)</a></TD></TR>	

<tr class="alt">	      <TD>EXGT-A3</TD>
	      <TD>T23K3.4<br><a href="/servlets/TairObject?type=locus&name=At2g01850">At2g01850</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD21783.1">AAD21783.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01850">xyloglucan endotransglycosylase (EXGT-A3)</a></TD></TR>

<tr class="alt">	      <TD>EXGT-A4</TD>
	      <TD>MAC12.33<br><a href="/servlets/TairObject?type=locus&name=AT5G13870">AT5G13870</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD45126.1">AAD45126.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G13870">xyloglucan endotransglycosylase (EXGT-A4)</a></TD></TR>

<tr class="alt">	      <TD>XTR2</TD>
	      <TD>F10B6_29<BR><a href="/servlets/TairObject?type=locus&name=At1g14720">At1g14720</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB18366.1">AAB18366.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g14720">xyloglucan endo-transglycosylase, putative</a></TD></TR>

<tr class="alt">	      <TD>XTR3</TD>
	      <TD>MUA2.12<BR><a href="/servlets/TairObject?type=locus&name=AT5g57550">AT5g57550</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB18364.1">AAB18364.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g57550">endoxyloglucan transferase (gb|AAD45127.1)</a></TD></TR>

<tr class="alt">	      <TD>XTR6</TD>
	      <TD>F14M19.90<BR><a href="/servlets/TairObject?type=locus&name=AT4g25810">AT4g25810</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB18367.1">AAB18367.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25810">xyloglucan endo-1,4-beta-D-glucanase (XTR-6)</a></TD></TR>	

<tr class="alt">	      <TD>XTR7</TD>
	      <TD>dl3105c<BR><a href="/servlets/TairObject?type=locus&name=AT4g14130">AT4g14130</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB18368.1">AAB18368.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g14130">xyloglucan endotransglycosylase-related protein XTR-7</a></TD></TR>

<tr class="alt">	      <TD>XTR9</TD>
	      <TD>F14M19.100<BR><a href="/servlets/TairObject?type=locus&name=AT4g25820">AT4g25820</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD12249.1">AAD12249.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g25820">putative xyloglucan endo-1,4-beta-D-glucanase</a></TD></TR>

<TR>	<TD ROWSPAN=50 valign=top><B><a href="http://www.cazy.org/fam/GH17.html">Glycoside Hydrolase Family 17</a></B></TD>     <TD></TD>
	      <TD>dl3080c<BR><a href="/servlets/TairObject?type=locus&name=AT4g14080">AT4g14080</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA49853.1">CAA49853.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g14080">A6 anther-specific protein</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>F28O9.110<BR><a href="/servlets/TairObject?type=locus&name=AT3g57260">AT3g57260</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAA32755.1">AAA32755.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g57260">beta-1,3-glucanase 2 (BG2) (PR-2)</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F28O9.90<BR><a href="/servlets/TairObject?type=locus&name=AT3g57240">AT3g57240</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAA32756.1">AAA32756.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g57240">beta-1,3-glucanase</a></TD></TR>	

<TR>	      <TD></TD>
	      <TD>dl4170c<BR><a href="/servlets/TairObject?type=locus&name=AT4g16260">AT4g16260</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10405.1">CAB10405.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g16260">beta-1,3-glucanase class I precursor</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F6E21_60<BR><a href="/servlets/TairObject?type=locus&name=AT4g31140">AT4g31140</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB79832.1">CAB79832.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g31140">1,3-beta-glucanase - like protein</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>T25M19.1<BR><a href="/servlets/TairObject?type=locus&name=At2g05790">At2g05790</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD26909.1">AAD26909.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g05790">putative beta-1,3-glucanase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>dl4625w<BR><a href="/servlets/TairObject?type=locus&name=AT4g17180">AT4g17180</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB10499.1">CAB10499.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g17180">putative protein</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F17A13_180<BR><a href="/servlets/TairObject?type=locus&name=AT4g29360">AT4g29360</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB79694.1">CAB79694.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g29360">beta-1,3-glucanase-like protein</a></TD></TR>

<TR>	      <TD>BETAG4</TD>
	      <TD>F5O24.220<br><a href="/servlets/TairObject?type=locus&name=AT5G20330">AT5G20330</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA56134.1">CAA56134.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G20330">glycosyl hydrolase family 17 (beta-1,3-glucanase bg4) </a></TD></TR>	

<TR>	      <TD>BETAG5</TD>
	      <TD>F5O24.230<br><a href="/servlets/TairObject?type=locus&name=AT5G20340">AT5G20340</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA56135.1">CAA56135.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G20340">glycosyl hydrolase family 17 (beta-1,3-glucanase bg5)</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F10A12.18<BR><a href="/servlets/TairObject?type=locus&name=At2g27500">At2g27500</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD15611.1">AAD15611.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g27500">putative beta-1,3-glucanase</a></TD></TR>	      
	      
<TR>	      <TD></TD>
	      <TD>F10M23.170<BR><a href="/servlets/TairObject?type=locus&name=AT4g26830">AT4g26830</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB36529.1">CAB36529.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g26830">putative beta-1,3-glucanase</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>F12A12.90<BR><a href="/servlets/TairObject?type=locus&name=AT3g46570">AT3g46570</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB62327.1">CAB62327.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g46570">glucosidase-like protein</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>AT1G11820<br>F12F1.33</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC17632.1">AAC17632.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=F12F1.33">hypothetical protein</a></TD></TR>	

<TR>	      <TD></TD>
	      <TD>F13O11.7<BR><a href="/servlets/TairObject?type=locus&name=At1g64760">At1g64760</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD38251.1">AAD38251.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64760">beta-1,3-glucanase, putative</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F15G16.200<BR><a href="/servlets/TairObject?type=locus&name=AT3g61810">AT3g61810</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB71111.1">CAB71111.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g61810">putative protein</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>F16F14.27<BR><a href="/servlets/TairObject?type=locus&name=At2g16230">At2g16230</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD22313.1">AAD22313.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16230">putative beta-1,3-glucanase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F17A14.1<BR><a href="/servlets/TairObject?type=locus&name=At2g39640">At2g39640</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB97119.1">AAB97119.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g39640">putative beta-1,3-glucanase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F1I16_190<BR><a href="/servlets/TairObject?type=locus&name=AT3g55780">AT3g55780</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB81603.1">CAB81603.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55780">beta-1,3-glucanase - like protein</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>At3g07320<br>F21O3.3</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF02143.1">AAF02143.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=F21O3.3">putative glucan endo-1-3-beta-glucosidase</a></TD></TR>	


<TR>	      <TD></TD>
	      <TD>F28O9.120<BR><a href="/servlets/TairObject?type=locus&name=AT3g57270">AT3g57270</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB68133.1">CAB68133.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g57270">glucan endo-1,3-beta-D-glucosidase-like protein</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>F3P11.4<BR><a href="/servlets/TairObject?type=locus&name=At2g19440">At2g19440</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD10143.1">AAD10143.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g19440">putative beta-1,3-glucanase</a></TD></TR>

	      

<TR>	      <TD></TD>
	      <TD>F9L11.6<BR><a href="/servlets/TairObject?type=locus&name=At1g32860">At1g32860</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF31288.1">AAF31288.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g32860">beta-1,3-glucanase precursor, putative</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>K21L19.9<br><a href="/servlets/TairObject?type=locus&name=AT5G58090">AT5G58090</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11001.1">BAB11001.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G58090">glycosyl hydrolase family 17</a></TD></TR> 	      



<TR>	      <TD></TD>
	      <TD>K7M2.10<BR><a href="/servlets/TairObject?type=locus&name=AT3g24350">AT3g24350</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02933.1">BAB02933.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g24350">syntaxin-like protein</a></TD></TR>

	      

<TR>	      <TD></TD>
	      <TD>MCO15.13<BR><a href="/servlets/TairObject?type=locus&name=AT5g55180">AT5g55180</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB08587.1">BAB08587.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g55180">beta-1,3-glucanase-like protein</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>MIK19.3<BR><a href="/servlets/TairObject?type=locus&name=AT5g56590">AT5g56590</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09876.1">BAB09876.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g56590">beta-1,3-glucanase-like protein</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>MJB21.9<BR><a href="/servlets/TairObject?type=locus&name=AT5g42720">AT5g42720</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10628.1">BAB10628.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g42720">beta-1,3-glucanase-like protein</a></TD></TR>

	      

<TR>	      <TD></TD>
	      <TD>MJC20.21<BR><a href="/servlets/TairObject?type=locus&name=AT5g42100">AT5g42100</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB08443.1">BAB08443.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g42100">beta-1,3-glucanase-like protein</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>MQJ2.8<br><a href="/servlets/TairObject?type=locus&name=AT5G58480">AT5G58480</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10263.1">BAB10263.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G58480">glycosyl hydrolase family 17 </a></TD></TR>


<TR>	      <TD></TD>
	      <TD>MRG7.18<BR><a href="/servlets/TairObject?type=locus&name=AT5g18220">AT5g18220</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09480.1">BAB09480.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g18220">beta-1,3-glucanase-like protein</a></TD></TR>

	      

<TR>	      <TD></TD>
	      <TD>MRP15.22<br><a href="/servlets/TairObject?type=locus&name=AT3G13560">AT3G13560</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK59446.1">AAK59446.1</a></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G13560">glycosyl hydrolase family 17</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>MSJ11.20<BR><a href="/servlets/TairObject?type=locus&name=AT3g15800">AT3g15800</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02311.1">BAB02311.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g15800">putative beta-1,3-glucanase precursor</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>MXK3.1<BR><a href="/servlets/TairObject?type=locus&name=AT5g64790">AT5g64790</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA97291.1">BAA97291.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64790">beta-1,3-glucanase</a></TD></TR>

	      

<TR>	      <TD></TD>
	      <TD>MYM9.11<BR><a href="/servlets/TairObject?type=locus&name=AT3g23770">AT3g23770</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01853.1">BAB01853.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g23770">beta-1,3-glucanase, putative</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T11I18.12<BR><a href="/servlets/TairObject?type=locus&name=AT3g04010">AT3g04010</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF05860.1">AAF05860.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g04010">putative beta-1,3-glucanase</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>T1B9.1<BR><a href="/servlets/TairObject?type=locus&name=AT3g07070">AT3g07070</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF20214.1">AAF20214.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07070">putative protein kinase</a></TD></TR>

	      

<TR>	      <TD></TD>
	      <TD>T1P2.13<BR><a href="/servlets/TairObject?type=locus&name=At1g30080">At1g30080</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG12865.1">AAG12865.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30080">beta-1,3-glucanase precursor, putative</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T22E16.90<BR><a href="/servlets/TairObject?type=locus&name=AT3g55430">AT3g55430</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB75901.1">CAB75901.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55430">beta-1,3-glucanase - like protein</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>T32E8.11<BR><a href="/servlets/TairObject?type=locus&name=At1g77780">At1g77780</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF08558.1">AAF08558.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77780">putative endo-1,3-beta-glucanase</a></TD></TR>

	      

<TR>	      <TD></TD>
	      <TD>T32E8.12<BR><a href="/servlets/TairObject?type=locus&name=At1g77790">At1g77790</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF08559.1">AAF08559.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77790">putative endo-1,3-beta-glucanase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T4L20.60<BR><a href="/servlets/TairObject?type=locus&name=AT4g34480">AT4g34480</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA18827.1">CAA18827.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g34480">putative protein (fragment)</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>T6J19.7<BR><a href="/servlets/TairObject?type=locus&name=At1g66250">At1g66250</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG12932.1">AAG12932.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66250">beta-1,3-glucanase precursor, putative</a></TD></TR>

	      

<TR>	      <TD></TD>
	      <TD>T8O11.20<BR><a href="/servlets/TairObject?type=locus&name=At2g01630">At2g01630</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD12708.1">AAD12708.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g01630">putative beta-1,3-glucanase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T9A21.190<BR><a href="/servlets/TairObject?type=locus&name=AT4g18340">AT4g18340</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA16806.1">CAA16806.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18340">beta-1,3-glucanase-like protein</a></TD></TR> 	      

	      
<TR>	      <TD></TD>
	      <TD>T9J22.27<BR><a href="/servlets/TairObject?type=locus&name=At2g26600">At2g26600</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC14508.1">AAC14508.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26600">putative beta-1,3-glucanase</a></TD></TR>

	      

<TR>	      <TD></TD>
	      <TD>T9L6.8;  T16O9.3<BR><a href="/servlets/TairObject?type=locus&name=At1g33220">At1g33220</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF97351.1">AAF97351.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g33220">beta-1,3-glucanase, putative</a></TD></TR>

<tr>	      <TD>&nbsp;</TD>
	      <TD>F5O24.280<BR><a href="/servlets/TairObject?type=locus&name=AT5G20390">AT5G20390</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AY065376">AY065376</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G20390">glycosyl hydrolase family 17 (beta-1,3-glucanase)</a></TD></TR>

<tr>	      <TD>&nbsp;</TD>
	      <TD>F7C8.150<BR><a href="/servlets/TairObject?type=locus&name=AT5G20560">AT5G20560</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=NC_003076">NC_003076</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G20560">glycosyl hydrolase family 17 (beta-1,3-glucanase)</a></TD></TR>

<tr>	      <TD>&nbsp;</TD>
	      <TD>F22D1.40<BR><a href="/servlets/TairObject?type=locus&name=AT5G20870">AT5G20870</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=NC_003076">NC_003076</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G20870">glycosyl hydrolase family 17 </a></TD></TR>




<tr class="alt">	<TD ROWSPAN=10 valign=top><B><a href="http://www.cazy.org/fam/GH18.html">Glycoside Hydrolase Family 18</a></B></TD>     <TD></TD>
	      <TD>MZF18.2<BR><a href="/servlets/TairObject?type=locus&name=AT5g24090">AT5g24090</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAA32768.1">AAA32768.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g24090">acidic endochitinase (dbj|BAA21861.1)</a></TD></TR>   

	      
<tr class="alt">	      <TD></TD>
	      <TD>T16H5.100<BR><a href="/servlets/TairObject?type=locus&name=AT4g19740">AT4g19740</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19691.1">CAA19691.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19740">putative protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T16H5.110<BR><a href="/servlets/TairObject?type=locus&name=AT4g19750">AT4g19750</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19692.1">CAA19692.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19750">chitinase - like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T16H5.120<BR><a href="/servlets/TairObject?type=locus&name=AT4g19760">AT4g19760</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19693.1">CAA19693.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19760">chitinase - like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T16H5.130<BR>AT4g19770 (fragment)</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19694.1">CAA19694.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19770">putative protein</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>T16H5.160<BR><a href="/servlets/TairObject?type=locus&name=AT4g19800">AT4g19800</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19697.1">CAA19697.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19800">chitinase - like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T16H5.170<BR><a href="/servlets/TairObject?type=locus&name=AT4g19810">AT4g19810</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19698.1">CAA19698.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19810">putative chitinase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>T16H5.180<BR><a href="/servlets/TairObject?type=locus&name=AT4g19820">AT4g19820</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19699.1">CAA19699.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19820">putative chitinase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T16H5.80<BR><a href="/servlets/TairObject?type=locus&name=AT4g19720">AT4g19720</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19689.1">CAA19689.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19720">putative protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T16H5.90<BR><a href="/servlets/TairObject?type=locus&name=AT4g19730">AT4g19730</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA19690.1">CAA19690.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g19730">putative protein</a></TD></TR>


<TR><TD ROWSPAN=15 valign=top><B><a href="http://www.cazy.org/fam/GH19.html">Glycoside Hydrolase Family 19</a></B></TD>	      <TD></TD>
	      <TD>K14A17.4<BR><a href="/servlets/TairObject?type=locus&name=AT3g16920">AT3g16920</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA94976.1">BAA94976.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g16920">basic chitinase, putative</a></TD></TR>

<TR>	      <TD>CHIB</TD>
	      <TD>T2E22.18<BR><a href="/servlets/TairObject?type=locus&name=AT3g12500">AT3g12500</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAA32769.1">AAA32769.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g12500">basic chitinase</a></TD></TR>

<TR>	      <TD>CHIV</TD>
	      <TD>T12E18_110<BR><a href="/servlets/TairObject?type=locus&name=AT3g54420">AT3g54420</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA74930.1">CAA74930.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g54420">class IV chitinase (CHIV)</a></TD></TR>	

<TR>	      <TD></TD>
	      <TD>F18O19.27<BR><a href="/servlets/TairObject?type=locus&name=At2g43620">At2g43620</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB64044.1">AAB64044.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43620">putative endochitinase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F18O19.28<BR><a href="/servlets/TairObject?type=locus&name=At2g43610">At2g43610</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB64045.1">AAB64045.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43610">putative endochitinase</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>F18O19.29 T01O24.34<BR><a href="/servlets/TairObject?type=locus&name=At2g43600">At2g43600</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB64046.1">AAB64046.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43600">putative endochitinase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F18O19.30 T01O24.33<BR><a href="/servlets/TairObject?type=locus&name=At2g43590">At2g43590</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB64047.1">AAB64047.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43590">putative endochitinase</a></TD></TR>	      


<TR>	      <TD></TD>
	      <TD>F18O19.31; T01O24.32<BR><a href="/servlets/TairObject?type=locus&name=At2g43580">At2g43580</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB64048.1">AAB64048.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43580">putative endochitinase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F18O19.32; T01O24.31<br><a href="/servlets/TairObject?type=locus&name=AT2G43570">AT2G43570</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB64049.1">AAB64049.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G43570">glycosyl hydrolase family 19 (chitinase)</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F1P2.90<BR><a href="/servlets/TairObject?type=locus&name=AT3g47540">AT3g47540</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB61980.1">CAB61980.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g47540">endochitinase-like protein</a></TD></TR>	

<TR>	      <TD></TD>
	      <TD>F25P12.88<BR><a href="/servlets/TairObject?type=locus&name=At1g56680">At1g56680</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG09096.1">AAG09096.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g56680">chitinase, putative</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T15B16.5<BR><a href="/servlets/TairObject?type=locus&name=AT4g01700">AT4g01700</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC72865.1">AAC72865.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g01700">putative chitinase</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>T20M3.12<BR><a href="/servlets/TairObject?type=locus&name=At1g05850">At1g05850</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF29391.1">AAF29391.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05850">class I chitinase, putative</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T6A9.5<BR><a href="/servlets/TairObject?type=locus&name=At1g02360">At1g02360</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG00887.1">AAG00887.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02360">glycosyl hydrolase family 19 (chitinase)</a></TD></TR>	      


<TR>	      <TD></TD>
	      <TD>F18O19.28<br><a href="/servlets/TairObject?type=locus&name=AT2G43610">AT2G43610</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AY072357">AY072357</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G43610">glycosyl hydrolase family 19 (chitinase)</a></TD></TR>

<tr class="alt">	<TD ROWSPAN=3 valign=top><B><a href="http://www.cazy.org/fam/GH20.html">Glycoside Hydrolase Family 20</a></B></TD>     <TD></TD>
	      <TD>F3F20.4<BR><a href="/servlets/TairObject?type=locus&name=At1g05590">At1g05590</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD30612.1">AAD30612.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05590">hypothetical protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F5I14.13<br><a href="/servlets/TairObject?type=locus&name=At1g65600">At1g65600</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB60911.1">AAB60911.1</a></TD>
	      <TD>&nbsp;</TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>T26I12.140<BR><a href="/servlets/TairObject?type=locus&name=AT3g55260">AT3g55260</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB75760.1">CAB75760.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g55260">beta-N-acetylhexosaminidase -like protein</a></TD></TR>

<TR>	<TD ROWSPAN=4 valign=top><B><a href="http://www.cazy.org/fam/GH27.html">Glycoside Hydrolase Family 27</a></B></TD>     <TD></TD>
	      <TD>F20C19.10<BR><a href="/servlets/TairObject?type=locus&name=At3g26380">At3g26380</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=NC_003074">NC_003074</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g26380">glycosyl hydrolase family 27 (alpha-galactosidase/melibiase)</a></TD></TR>


<TR>	      <TD></TD>
	      <TD>F8L15_100<br><a href="/servlets/TairObject?type=locus&name=At5g08370">At5g08370</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AY074321">AY074321</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g08370">glycosyl hydrolase family 27 (alpha-galactosidase/melibiase)</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F8L15_110<BR><a href="/servlets/TairObject?type=locus&name=At5g08380">At5g08380</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AY093200">AY093200</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g08380">glycosyl hydrolase family 27 (alpha-galactosidase/melibiase)</a></TD></TR>	      


<TR>	      <TD></TD>
	      <TD>F18O21_270<BR><a href="/servlets/TairObject?type=locus&name=AT3g56310">AT3g56310</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB87430.1">CAB87430.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g56310">alpha-galactosidase-like protein</a></TD></TR>

<tr class="alt">	<TD ROWSPAN=70 valign=top><B><a href="http://www.cazy.org/fam/GH28.html">Glycoside Hydrolase Family 28</a></B></TD>     <TD></TD>
	      <TD>F22D16.22<BR><a href="/servlets/TairObject?type=locus&name=At1g02850">At1g02850</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF02888.1">AAF02888.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02850">beta-glucosidase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F17M5.200<BR><a href="/servlets/TairObject?type=locus&name=AT4g33440">AT4g33440</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB80061.1">CAB80061.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g33440">putative protein</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>F20B24_8<BR><a href="/servlets/TairObject?type=locus&name=At1g10640">At1g10640</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF17670.1">AAF17670.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g10640">polygalacturonase PG1, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F20B24.8<BR><a href="/servlets/TairObject?type=locus&name=At2g15450">At2g15450</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD22279.1">AAD22279.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15450">polygalacturonase PG1, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F26H6.2<BR><a href="/servlets/TairObject?type=locus&name=At2g15460">At2g15460</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD17390.2">AAD17390</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15460">putative polygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F9O13.2<BR><a href="/servlets/TairObject?type=locus&name=At2g15470">At2g15470</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD17391.1">AAD17391</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g15470">polygalacturonase, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F16G20.200<BR><a href="/servlets/TairObject?type=locus&name=AT4g23500">AT4g23500</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA20471.1">CAA20471.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g23500">putative protein</a></TD></TR>	      




	      
<tr class="alt">	      <TD></TD>
	      <TD>F17A17.16<BR><a href="/servlets/TairObject?type=locus&name=AT3g07820">AT3g07820</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF21192.1">AAF21192.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07820">polygalacturonase (PGA3)</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F17A17.17<BR><a href="/servlets/TairObject?type=locus&name=AT3g07830">AT3g07830</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF21193.1">AAF21193.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07830">putative polygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F17A17.18<BR><a href="/servlets/TairObject?type=locus&name=AT3g07840">AT3g07840</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF21194.1">AAF21194.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07840">putative polygalacturonase</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>F17A17.19<BR><a href="/servlets/TairObject?type=locus&name=AT3g07850">AT3g07850</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF21195.1">AAF21195.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07850">exopolygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F17A17.31<BR><a href="/servlets/TairObject?type=locus&name=AT3g07970">AT3g07970</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF21207.1">AAF21207.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g07970">putative polygalacturonase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F18A5.150<BR><a href="/servlets/TairObject?type=locus&name=AT4g13760">AT4g13760</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB36840.1">CAB36840.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g13760">putative polygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F18B13.22<BR><a href="/servlets/TairObject?type=locus&name=At1g80140">At1g80140</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD55472.1">AAD55472.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80140">polygalacturonase, putative</a></TD></TR>	      


<tr class="alt">	      <TD></TD>
	      <TD>F18B13.25<BR><a href="/servlets/TairObject?type=locus&name=At1g80170">At1g80170</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD55489.1">AAD55489.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80170">polygalacturonase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F18O19.2<BR><a href="/servlets/TairObject?type=locus&name=At2g43870">At2g43870</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB64019.1">AAB64019.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43870">putative polygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F18O19.3<BR><a href="/servlets/TairObject?type=locus&name=At2g43860">At2g43860</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB64020.1">AAB64020.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43860">putative polygalacturonase</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>F18P9_110<BR><a href="/servlets/TairObject?type=locus&name=AT3g42950">AT3g42950</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB86682.1">CAB86682.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g42950">polygalacturonase -like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F20D23.15<br><a href="/servlets/TairObject?type=locus&name=AT1G17150">AT1G17150</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD50028.1">AAD50028.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G17150">polygalacturonase, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F21D18.18<BR><a href="/servlets/TairObject?type=locus&name=At1g48100">At1g48100</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AY050798">AY050798</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48100">polygalacturonase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F21D18_17<BR><a href="/servlets/TairObject?type=locus&name=At1g48100">At1g48100</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF79535.1">AAF79535</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g48100">polygalacturonase, putative</a></TD></TR>



<tr class="alt">	      <TD></TD>
	      <TD>F24G16.120<BR><a href="/servlets/TairObject?type=locus&name=AT3g59850">AT3g59850</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB75804.1">CAB75804.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g59850">polygalacturonase-like protein</a></TD></TR>	      


<tr class="alt">	      <TD></TD>
	      <TD>F24J13.7<BR><a href="/servlets/TairObject?type=locus&name=At1g70500">At1g70500</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF04869.1">AAF04869.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70500">putative polygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F25I18.10<BR><a href="/servlets/TairObject?type=locus&name=At2g33160">At2g33160</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC04907.1">AAC04907.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33160">putative polygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F25P12.85<BR><a href="/servlets/TairObject?type=locus&name=At1g56710">At1g56710</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG09093.1">AAG09093.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g56710">polygalacturonase, putative</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>F28C11.10<br><a href="/servlets/TairObject?type=locus&name=At1g23470">At1g23470</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF79585.1">AAF79585.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23470">polygalacturonase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F28C11.9<br><a href="/servlets/TairObject?type=locus&name=At1g23460">At1g23460</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF79584.1">AAF79584.1</a></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23460">polygalacturonase, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F2A19.90<BR><a href="/servlets/TairObject?type=locus&name=AT3g61490">AT3g61490</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB71079.1">CAB71079.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g61490">putative protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F2H10.10<BR><a href="/servlets/TairObject?type=locus&name=At1g43100">At1g43100</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG29730.1">AAG29730.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g43100">polygalacturonase, putative</a></TD></TR>	      

<tr class="alt">	      <TD></TD>
	      <TD>F2H10.11<BR><a href="/servlets/TairObject?type=locus&name=At1g43090">At1g43090</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG29726.1">AAG29726.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g43090">polygalacturonase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F2H10.12<BR><a href="/servlets/TairObject?type=locus&name=At1g43080">At1g43080</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG29727.1">AAG29727.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g43080">polygalacturonase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F2K15.30<BR><a href="/servlets/TairObject?type=locus&name=AT3g49170">AT3g49170</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB66396.1">CAB66396.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g49170">putative protein</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>F3F20.10<BR><a href="/servlets/TairObject?type=locus&name=At1g05650">At1g05650</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD30617.1">AAD30617.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05650">putative polygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F3F20.11<BR><a href="/servlets/TairObject?type=locus&name=At1g05660">At1g05660</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD30618.1">AAD30618.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05660">putative polygalacturonase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F3F9.9<BR><a href="/servlets/TairObject?type=locus&name=At1g78410">At1g78410</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF71796.1">AAF71796.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78410">hypothetical protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F5I14.10<BR><a href="/servlets/TairObject?type=locus&name=At1g65570">At1g65570</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB60920.1">AAB60920.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g65570">polygalacturonase, putative</a></TD></TR>	      
	      
<tr class="alt">	      <TD></TD>
	      <TD>F5O8.2<br><a href="/servlets/TairObject?type=locus&name=AT1G23460">AT1G23460</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC98004.1">AAC98004.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G23460">polygalacturonase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F6E13.1<BR><a href="/servlets/TairObject?type=locus&name=At2g43880">At2g43880</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC23426.1">AAC23426.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43880">putative polygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F6E13.2<BR><a href="/servlets/TairObject?type=locus&name=At2g43890">At2g43890</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC23398.1">AAC23398.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43890">putative polygalacturonase</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>F3E22.9<BR><a href="/servlets/TairObject?type=locus&name=At3g06770">At3g06770</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AY093030">AY093030</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g06770">polygalacturonase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F8A5.12<BR><a href="/servlets/TairObject?type=locus&name=At1g60590">At1g60590</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB71972.1">AAB71972.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g60590">polygalacturonase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F8B4.70<BR><a href="/servlets/TairObject?type=locus&name=AT4g32370">AT4g32370</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA22564.1">CAA22564.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g32370">putative protein</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F8B4.80<BR><a href="/servlets/TairObject?type=locus&name=AT4g32380">AT4g32380</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA22565.1">CAA22565.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g32380">putative protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F8D20.180<BR><a href="/servlets/TairObject?type=locus&name=AT4g35670">AT4g35670</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA20037.1">CAA20037.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g35670">putative polygalacturonase</a></TD></TR>	      

<tr class="alt">	      <TD></TD>
	      <TD>F9D16.290<BR><a href="/servlets/TairObject?type=locus&name=AT4g23820">AT4g23820</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA23048.1">CAA23048.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g23820">putative polygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>K20I9.8<BR><a href="/servlets/TairObject?type=locus&name=AT3g16850">AT3g16850</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK59579.1">AAK59579.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g16850">polygalacturonase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F21A20.240<BR><a href="/servlets/TairObject?type=locus&name=At5g27530">At5g27530</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=NP_198105.1 ">NP_198105</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27530">polygalacturonase, putative </a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MFE16.14<br><a href="/servlets/TairObject?type=locus&name=AT3G26610">AT3G26610</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01843.1">BAB01843.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G26610">polygalacturonase, putative</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>F15B8.20<br><a href="/servlets/TairObject?type=locus&name=At3g57790">At3g57790</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAL38256.1">AAL38256</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g57790">polygalacturonase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MIF21.3<br><a href="/servlets/TairObject?type=locus&name=AT5G48140">AT5G48140</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA96994.1">BAA96994.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G48140">polygalacturonase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MKP11.5<BR><a href="/servlets/TairObject?type=locus&name=AT5g17200">AT5g17200</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10507.1">BAB10507.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g17200">polygalacturonase-like protein</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>K21P3.9<BR><a href="/servlets/TairObject?type=locus&name=At5g49215">At5g49215</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAM14020.1">AAM14020.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g49215">Expressed protein </a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>MSJ11.12<BR><a href="/servlets/TairObject?type=locus&name=AT3g15720">AT3g15720</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02303.1">BAB02303.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g15720">putative polygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MYH19.11<br><a href="/servlets/TairObject?type=locus&name=At5g39910">At5g39910</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10216.1">BAB10216.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g39910">polygalacturonase, putative</a></TD></TR>	      

<tr class="alt">	      <TD></TD>
	      <TD>T07M07.19<BR><a href="/servlets/TairObject?type=locus&name=At2g40310">At2g40310</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD25666.1">AAD25666.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40310">putative polygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>K16L22.16<BR><a href="/servlets/TairObject?type=locus&name=At5g41870">At5g41870</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=NP_199002">NP_199002</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g41870">polygalacturonase, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>T11A7.5<BR><a href="/servlets/TairObject?type=locus&name=At2g41850">At2g41850</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC02763.1">AAC02763.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g41850">putative polygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T14P4.18<br><a href="/servlets/TairObject?type=locus&name=AT1G02460">AT1G02460</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG10640.1">AAG10640.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G02460">polygalacturonase, putative</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>T15N1_140<BR><a href="/servlets/TairObject?type=locus&name=AT5g14650">AT5g14650</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB87632.1">CAB87632.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g14650">polygalacturonase - like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T17J13.70<BR><a href="/servlets/TairObject?type=locus&name=AT3g62110">AT3g62110</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG40344.1">AAG40344.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g62110">putative protein</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>T19K24.5<br><a href="/servlets/TairObject?type=locus&name=AT5G44840">AT5G44840</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC79137.1">AAC79137.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G44840">polygalacturonase, putative</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T19K24.6 K23L20.18<BR><a href="/servlets/TairObject?type=locus&name=AT5g44830">AT5g44830</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC79138.1">AAC79138.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g44830">polygalacturonase-like protein</a></TD></TR>	      

<tr class="alt">	      <TD></TD>
	      <TD>T29E15.10<BR><a href="/servlets/TairObject?type=locus&name=At2g23900">At2g23900</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC63679.1">AAC63679.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g23900">putative polygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T29M8.4<BR><a href="/servlets/TairObject?type=locus&name=At1g19170">At1g19170</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF82228.1">AAF82228.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19170">hypothetical protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T2J13.210<BR><a href="/servlets/TairObject?type=locus&name=AT3g48950">AT3g48950</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB62015.1">CAB62015.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g48950">endo-polygalacturonase - like protein</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>T7B11.15<BR><a href="/servlets/TairObject?type=locus&name=AT4g01890">AT4g01890</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD22651.1">AAD22651.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g01890">endo-polygalacturonase - like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T9A21.20<BR><a href="/servlets/TairObject?type=locus&name=AT4g18180">AT4g18180</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA16789.1">CAA16789.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g18180">polygalacturonase-like protein</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>T9J22.29<BR><a href="/servlets/TairObject?type=locus&name=At2g26620">At2g26620</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC14511.1">AAC14511.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26620">putative polygalacturonase</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>MDC16.18<br><a href="/servlets/TairObject?type=locus&name=At3g14040">At3g14040</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAL32525.1">AAL32525</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g14040">exopolygalacturonase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T8H10.110<br><a href="/servlets/TairObject?type=locus&name=At3g57510">At3g57510</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC98923.1">AAC98923</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g57510">polygalacturonase, putative</a></TD></TR>


<TR><TD ROWSPAN=5 valign=top><B><a href="http://www.cazy.org/fam/GH31.html">Glycoside Hydrolase Family 31</a></B></TD>	      <TD>alpha-glucosidase 1</TD>
	      <TD>T22P22_110<BR><a href="/servlets/TairObject?type=locus&name=AT5g11720">AT5g11720</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB82656.1">AAB82656.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g11720">alpha-glucosidase 1</a></TD></TR>

<TR>	      <TD>XYL1</TD>
	      <TD>F24J5.20<BR><a href="/servlets/TairObject?type=locus&name=At1g68560">At1g68560</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD05539.1">AAD05539.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68560">alpha-xylosidase precursor</a></TD></TR>	

<TR>	      <TD></TD>
	      <TD>F16L2_150<BR><a href="/servlets/TairObject?type=locus&name=AT3g45940">AT3g45940</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB82818.1">CAB82818.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g45940">putative protein</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>MDB19.14<BR><a href="/servlets/TairObject?type=locus&name=AT3g23640">AT3g23640</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB02784.1">BAB02784.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g23640">glycosyl hydrolase family 31 </a></TD></TR>


<TR>	      <TD></TD>
	      <TD>MGI19.4<BR><a href="/servlets/TairObject?type=locus&name=AT5g63840">AT5g63840</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11032.1">BAB11032.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g63840">glucosidase II alpha subunit</a></TD></TR>

<tr class="alt">	 <TD ROWSPAN=8 valign=top><B><a href="http://www.cazy.org/fam/GH32.html">Glycoside Hydrolase Family 32</a></B></TD>     
              <td>&nbsp;</td>
	      <TD>F22O6.20<BR><a href="/servlets/TairObject?type=locus&name=AT3g52600">AT3g52600</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAA63802.1">AAA63802.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g52600">beta-fructofuranosidase</a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>MMM17.24<BR><a href="/servlets/TairObject?type=locus&name=AT3g13790">AT3g13790</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01930.1">BAB01930.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g13790">glycosyl hydrolase family 32</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T28K15.3<BR><a href="/servlets/TairObject?type=locus&name=At1g12240">At1g12240</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG12569.1">AAG12569.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g12240">beta-fructosidase, putative</a></TD></TR>


<tr class="alt">	      <TD></TD>
	      <TD>F2H17.20<BR><a href="/servlets/TairObject?type=locus&name=At2g36190">At2g36190</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD21446.1">AAD21446.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36190">putative beta-fructofuranosidase (invertase)</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F14F18_90<BR><a href="/servlets/TairObject?type=locus&name=AT5g11920">AT5g11920</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB87665.1">CAB87665.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g11920">fructosidase - like protein</a></TD></TR>	      




	      
<tr class="alt">	      <TD></TD>
	      <TD>F23N19.3<BR><a href="/servlets/TairObject?type=locus&name=At1g62660">At1g62660</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF19535.1">AAF19535.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g62660">beta-fructosidase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MMM17.23<br><a href="/servlets/TairObject?type=locus&name=AT3G13784">AT3G13784</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01929.1">BAB01929.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G13784">glycosyl hydrolase family 32</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T7N22.6<BR><a href="/servlets/TairObject?type=locus&name=At1g55120">At1g55120</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG12941.1">AAG12941.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55120">beta-fructofuranosidase, putative</a></TD></TR>


<TR><TD ROWSPAN=18 valign=top><B><a href="http://www.cazy.org/fam/GH35.html">Glycoside Hydrolase Family 35</a></B></TD>	      <TD></TD>
	      <TD>F8J2_10<BR><a href="/servlets/TairObject?type=locus&name=AT3g52840">AT3g52840</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAK32914.1">AAK32914.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g52840">beta-galactosidase precursor - like protein</a></TD></TR>
	      
<TR>	      <TD>BGAL10</TD>
	      <TD>MGI19.1<BR><a href="/servlets/TairObject?type=locus&name=AT5g63810">AT5g63810</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB64746.1">CAB64746.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g63810">beta-galactosidase (emb|CAB64746.1)</a></TD></TR>	      


<TR>	      <TD></TD>
	      <TD>F3L12.16<br><a href="/servlets/TairObject?type=locus&name=At2g04060">At2g04060</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=NP_178493">NP_178493</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g04060">glycosyl hydrolase family 35 (beta-galactosidase)</a></TD></TR>

<TR>	      <TD>BGAL12</TD>
	      <TD>F20B18.250<BR><a href="/servlets/TairObject?type=locus&name=AT4g26140">AT4g26140</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB39679.1">CAB39679.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g26140">putative beta-galactosidase</a></TD></TR>

<TR>	      <TD>BGAL13</TD>
	      <TD>T24I21.14<br><a href="/servlets/TairObject?type=locus&name=At2g16730">At2g16730</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB64749.1">CAB64749.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16730">glycosyl hydrolase family 35 (beta-galactosidase)</a></TD></TR>	

<TR>	      <TD>BGAL3</TD>
	      <TD>C7A10.1000<BR><a href="/servlets/TairObject?type=locus&name=AT4g36360">AT4g36360</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB16852.1">CAB16852.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g36360">beta-galactosidase like protein</a></TD></TR>


<TR>	      <TD>BGAL4</TD>
	      <TD>MPI10.3<br><a href="/servlets/TairObject?type=locus&name=At5g56870">At5g56870</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA97206.1">BAA97206.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g56870">glycosyl hydrolase family 35 (beta-galactosidase) </a></TD></TR>

<TR>	      <TD>BGAL6</TD>
	      <TD>MBK5.28<BR><a href="/servlets/TairObject?type=locus&name=AT5g63800">AT5g63800</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB64742.1">CAB64742.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g63800">beta-galactosidase (emb|CAB64742.1)</a></TD></TR>	      


<TR>	      <TD>BGAL7</TD>
	      <TD>T1M15.110<br><a href="/servlets/TairObject?type=locus&name=At5g20710">At5g20710</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB64743.1">CAB64743.1</a></TD>
	      <TD><A heref="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g20710">glycosyl hydrolase family 35 (beta-galactosidase)</a></TD></TR>

<TR>	      <TD>BGAL8</TD>
	      <TD>T17D12.3<BR><a href="/servlets/TairObject?type=locus&name=At2g28470">At2g28470</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB64744.1 ">CAB64744.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g28470">putative beta-galactosidase</a></TD></TR>


<TR>	      <TD>BGAL14</TD>
	      <TD>F20M13.150<BR><a href="/servlets/TairObject?type=locus&name=AT4g38590">AT4g38590</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB37515.1">CAB37515.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g38590">galactosidase like protein</a></TD></TR>


<TR>	      <TD>BGAL9</TD>
	      <TD>F24L7.5<BR><a href="/servlets/TairObject?type=locus&name=At2g32810">At2g32810</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC04500.1">AAC04500.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g32810">putative beta-galactosidase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F27F5.20<BR><a href="/servlets/TairObject?type=locus&name=At1g45130">At1g45130</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF69162.1">AAF69162.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g45130">beta-galactosidase, putative</a></TD></TR>	      

<TR>	      <TD></TD>
	      <TD>F27M3_5<br><a href="/servlets/TairObject?type=locus&name=At1g31740">At1g31740</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG60136.1">AAG60136.1</a></TD>
	      <TD><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g31740">similar to glycosyl hydrolase family 35 (beta-galactosidase)</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F3N23.19<BR><a href="/servlets/TairObject?type=locus&name=At1g72990">At1g72990</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD55646.1">AAD55646.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72990">beta-galactosidase (BGAL), putative</a></TD></TR>

<TR>	      <TD>BGAL11</TD>
	      <TD>M4E13.70<BR><a href="/servlets/TairObject?type=locus&name=AT4g35010">AT4g35010</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAA17766.1">CAA17766.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g35010">beta-galactosidase - like protein</a></TD></TR>	

<TR>	      <TD>BGAL1</TD>
	      <TD>MMM17.17<br><a href="/servlets/TairObject?type=locus&name=At3g13750">At3g13750</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01923.1">BAB01923.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13750">glycosyl hydrolase family 35 (beta-galactosidase)</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T5M16.1</TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF07776.1">AAF07776.1</a></TD>
	      <TD></TR>


<tr class="alt">	<TD ROWSPAN=5 valign=top><B><a href="http://www.cazy.org/fam/GH36.html">Glycoside Hydrolase Family 36</a></B></TD>      <TD></TD>
	      <TD>T7B11.23<BR><a href="/servlets/TairObject?type=locus&name=AT4g01970">AT4g01970</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD22659.1">AAD22659.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g01970">putative raffinose synthase or seed imbibition protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F5O24.140<br><a href="/servlets/TairObject?type=locus&name=AT5G20250">AT5G20250</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAL90901.1">AAL90901</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G20250">glycosyl hydrolase family 36</a></TD></TR>	      
	      
<tr class="alt">	      <TD></TD>
	      <TD>F20N2.14<BR><a href="/servlets/TairObject?type=locus&name=At1g55740">At1g55740</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF79504.1">AAF79504.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55740">glycosyl hydrolase family 36</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MPO12.13<br><a href="/servlets/TairObject?type=locus&name=At5g40390">At5g40390</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11595.1">BAB11595.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g40390">glycosyl hydrolase family 36</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T8H10.120<BR><a href="/servlets/TairObject?type=locus&name=AT3g57520">AT3g57520</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB66109.1">CAB66109.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g57520">imbibition protein homolog</a></TD></TR>	

<TR><TD ROWSPAN=1 valign=top><B><a href="http://www.cazy.org/fam/GH37.html">Glycoside Hydrolase Family 37</a></B></TD>	      <TD></TD>
	      	      <TD>T19F6.30<BR><a href="/servlets/TairObject?type=locus&name=AT4g24040">AT4g24040</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB51647.1">CAB51647.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g24040">trehalase - like protein</a></TD></TR>


<tr class="alt"><TD ROWSPAN=4 valign=top><B><a href="http://www.cazy.org/fam/GH38.html">Glycoside Hydrolase Family 38</a></B></TD>	     	      <TD></TD>
	      <TD>MLJ15.11<br><a href="/servlets/TairObject?type=locus&name=At3g26720">At3g26720</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01735.1">BAB01735.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g26720">glycosyl hydrolase family 38 (alpha-mannosidase)</a></TD></TR>	      

<tr class="alt">	      <TD></TD>
	      <TD>F2G14_70<BR><a href="/servlets/TairObject?type=locus&name=AT5g14950">AT5g14950</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01814.1">CAC01814.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g14950">alpha-mannosidase -like protein</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>K2A18.23<BR><a href="/servlets/TairObject?type=locus&name=AT5g66150">AT5g66150</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10420.1">BAB10420.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g66150">alpha-mannosidase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MAC12.5<BR><a href="/servlets/TairObject?type=locus&name=AT5g13980">AT5g13980</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB11126.1">BAB11126.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g13980">alpha-mannosidase</a></TD></TR>	

<TR><TD ROWSPAN=2 valign=top><B><a href="http://www.cazy.org/fam/GH43.html">Glycoside Hydrolase Family 43</a></B></TD>     <TD></TD>
	      <TD>K9I9.10<BR><a href="/servlets/TairObject?type=locus&name=AT5g67540">AT5g67540</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB08462.1">BAB08462.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g67540">glycosyl hydrolase family 43</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T16K5.230<BR><a href="/servlets/TairObject?type=locus&name=AT3g49880">AT3g49880</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAB66926.1">CAB66926.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g49880">glycosyl hydrolase family 43</a></TD></TR>


<tr class="alt"><TD ROWSPAN=5 valign=top><B><a href="http://www.cazy.org/fam/GH47.html">Glycoside Hydrolase Family 47</a></B></TD>	      <TD></TD>
	      <TD>F5D21.1 F19C24.18<br><a href="/servlets/TairObject?type=locus&name=At1g51590">At1g51590</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG12762.1">AAG12762.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g51590">mannosyl-oligosaccharide alpha-1,2-mannosidase, putative </a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MQD19.4<BR><a href="/servlets/TairObject?type=locus&name=AT5g43710">AT5g43710</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG52623.1">AAG52623.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g43710">glycoside hydrolase family 47 family </a></TD></TR>	      

<tr class="alt">	      <TD></TD>
	      <TD>MSA6.20<BR><a href="/servlets/TairObject?type=locus&name=AT3g21160">AT3g21160</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB01459.1">BAB01459.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g21160">mannosyl-oligosaccharide 1,2-alpha-mannosidase, putative </a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T17H3.2<BR><a href="/servlets/TairObject?type=locus&name=At1g27520">At1g27520</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD45990.1">AAD45990.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27520">glycoside hydrolase family 47 family</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>T1P2.10<BR><a href="/servlets/TairObject?type=locus&name=At1g30000">At1g30000</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG12868.1">AAG12868.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30000">endoplasmic reticulum alpha-mannosidase, putative</a></TD></TR>	

<TR><TD ROWSPAN=2 valign=top><B><a href="http://www.cazy.org/fam/GH51.html">Glycoside Hydrolase Family 51</a></B></TD>	      <TD></TD>
	      <TD>T7M13_18<BR><a href="/servlets/TairObject?type=locus&name=AT3g10740">AT3g10740</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF19575.1">AAF19575.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g10740">putative alpha-L-arabinofuranosidase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T1N24.13<BR><a href="/servlets/TairObject?type=locus&name=AT5g26120">AT5g26120</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAD40132.1">AAD40132.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g26120">arabinosidase - like protein</a></TD></TR>


<tr class="alt">	<TD ROWSPAN=2 valign=top><B><a href="http://www.cazy.org/fam/GH63.html">Glycoside Hydrolase Family 63</a></B></TD>      <TD></TD>
	      <TD>F3I6.26<BR><a href="/servlets/TairObject?type=locus&name=At1g24320">At1g24320</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAC00593.1">AAC00593.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g24320">putative glucosidase</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>F12B7.4 T1F15.4<br><a href="/servlets/TairObject?type=locus&name=At1g67490">At1g67490</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAG52297.1">AAG52297.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67490">glycosyl hydrolase family 63 (alpha-glucosidase I)</a> </TD></TR>	      

<TR><TD ROWSPAN=2 valign=top><B><a href="http://www.cazy.org/fam/GH77.html">Glycoside Hydrolase Family 77</a></B></TD>	      <TD></TD>
	      <TD>MXK3.9<BR><a href="/servlets/TairObject?type=locus&name=AT5g64860">AT5g64860</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAA97298.1 ">BAA97298.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64860"> 4-alpha-glucanotransferase</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>T20B5.4<BR><a href="/servlets/TairObject?type=locus&name=At2g40840">At2g40840</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAB86444.1">AAB86444.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40840">4-alpha-glucanotransferase</a></TD></TR>

<tr class="alt"><TD ROWSPAN=3 valign=top><B><a href="http://www.cazy.org/fam/GH79.html">Glycoside Hydrolase Family 79</a></B></TD>	      <TD></TD>
	      <TD>F13G24.30<BR><a href="/servlets/TairObject?type=locus&name=AT5g07830">AT5g07830</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09947.1">BAB09947.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g07830">glycosyl hydrolase family 79 (endo-beta-glucuronidase/heparanase) </a></TD></TR>	

<tr class="alt">	      <TD></TD>
	      <TD>MFB13.2<br><a href="/servlets/TairObject?type=locus&name=At5g61250">At5g61250</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB08480.1">BAB08480.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g61250">glycosyl hydrolase family 79 (endo-beta-glucuronidase/heparanase)</a></TD></TR>

<tr class="alt">	      <TD></TD>
	      <TD>MGG23.2<BR><a href="/servlets/TairObject?type=locus&name=At5g34940">At5g34940</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB10787.1">BAB10787.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g34940">putative protein</a></TD></TR>


<TR><TD ROWSPAN=2 valign=top><B><a href="http://www.cazy.org/fam/GH81.html">Glycoside Hydrolase Family 81</a></B></TD>	      <TD></TD>
	      <TD>F15H18.17<BR><a href="/servlets/TairObject?type=locus&name=At1g18310">At1g18310</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF25988.1">AAF25988.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18310">glycosyl hydrolase family 81</a></TD></TR>

<TR>	      <TD></TD>
	      <TD>F1N13_10<BR><a href="/servlets/TairObject?type=locus&name=AT5g15870">AT5g15870</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=CAC01786.1">CAC01786.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g15870">glycosyl hydrolase family 81</a></TD></TR>	      

<tr class="alt"><TD ROWSPAN=2 valign=top><B><a href="http://www.cazy.org/fam/GH85.html">Glycoside Hydrolase Family 85</a></B></TD>	      <TD></TD>
	      <TD>F9F8.14<BR><a href="/servlets/TairObject?type=locus&name=AT3g11040">AT3g11040</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF01517.1">AAF01517.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g11040">glycosyl hydrolase family 85</a></TD></TR>


<tr class="alt">	<TD></TD>
	      <TD>K18I23.27<BR><a href="/servlets/TairObject?type=locus&name=AT5g05460">AT5g05460</a></TD>
	      <TD><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=BAB09989.1">BAB09989.1</a></TD>
	      <TD><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g05460">glycosyl hydrolase family 85</a></TD></TR>      
	      
	</TABLE>


<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</a>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
