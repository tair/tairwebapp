<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Heat Shock Transcription Factors";
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
 
<h2><A NAME="Hsfs"><b>The heat shock transcription factors (Hsf) of <i>Arabidopsis thaliana</i></B></A></h2>

<TABLE><TR>

<TD><B>Source:</B></TD> <TD><A HREF="http://www.uni-frankfurt.de/fb15/botanik/nover.html">The Arabidopsis Functional Genomics Network</A></TD></TR> 

<TR><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD><li>By structural characteristics and phylogenetic comparison, the 21 representatives are assigned to 3 classes and 14 groups.
<br><li>Hsf family is based on the highly conserved DNA binding domain and adjacent oligomerization domains (HR-A/B region).</TD></TR>

<TR><TD><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=912135" target="display">Prof. Lutz Nover</A></TD></TR>

</TABLE> 

    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</B></TH></TR>	    


<tr class="alt"> <TD ROWSPAN=4 valign=top><B>Class A<br>Group A1</B></TD>   <TD>AtHsfA1a</TD>
	<TD>fca_all<BR>At4g17750</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=2245134&dopt=GenPept">CAB10555</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g17750">heat shock transcription factor HSF1</A></TD></TR>

<tr class="alt">    <TD>AtHsfA1b </TD>
	<TD>ku_e_26<BR>At5g16820</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=3256068&dopt=GenPept">CAA74397</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g16820">Heat Shock Factor 3</A></TD></TR>

<tr class="alt">    <TD>AtHsfA1d</TD>
	<TD>f27g20<BR>At1g32330</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=8920606&dopt=GenPept">AAF81328</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1g32330">heat shock transcription factor HSF8, putative</A></TD></TR>

<tr class="alt">    <TD>AtHsfA1e</TD>
	<TD>f13e7<BR>At3g02990</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=6728962&dopt=GenPept">AAF26960</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g02990">putative heat shock transcription factor</A></TD></TR>

<TR> <TD ROWSPAN=1 valign=top><B>Class A<br>Group A2  </B></TD>     <TD>AtHsfA2</TD>
	<TD>t19118<BR>At2g26150</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=3413699&dopt=GenPept">AAC31222</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g26150">putative heat shock transcription factor </A></TD></TR>

<tr class="alt"><TD ROWSPAN=1 valign=top><B>Class A<br>Group A3  </B></td>    <TD>At-HsfA3</TD>
	<TD>pl_e_21<BR>At5g03720</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=7340657&dopt=GenPept">CAB82937</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g03720">heat shock transcription factor -like protein </A></TD></TR>


<TR><TD ROWSPAN=2 valign=top><B>Class A<br>Group A4  </B></td>    <TD> At-HsfA4a </TD>
	<TD>pl_d_20<BR>At4g18880</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=2832616&dopt=GenPept">CAA16745</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18880">heat shock transcription factor - like protein</A></TD></TR>

<TR>    <TD> At-HsfA4c</TD>
	<TD>mra19<BR>At5g45710</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=9758674&dopt=GenPept">BAB09213</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g45710">heat shock transcription factor</A></TD></TR>

<tr class="alt"> <TD ROWSPAN=1 valign=top><B>Class A<br>Group A5  </B></td>    <TD> At-HsfA5 </TD>
	<TD>fca_all<BR>At4g13980</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=2244754&dopt=GenPept">CAB10177</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g13980">heat shock transcription factor like protein</A></TD></TR>

<TR> <TD ROWSPAN=2 valign=top><B>Class A<br>Group A6  </B></td>    <TD> At-HsfA6a</TD>
	<TD>mqd19<BR>At5g43840</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=10177954&dopt=GenPept">BAB11313</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g43840">heat shock transcription factor-like protein</A></TD></TR>

<TR>    <TD> At-HsfA6b</TD>
	<TD>mwi23<BR>At3g22830</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=9279701&dopt=GenPept">BAB01258</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g22830">putative heat shock protein</A></TD></TR>

<tr class="alt"> <TD ROWSPAN=2 valign=top><B>Class A<br>Group A7  </B></td>    <TD> At-HsfA7a</TD>
	<TD>me_c_20<BR>At3g51910</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=4678920&dopt=GenPept">CAB41311</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g51910">putative heat shock transcription factor</A></TD></TR>

<tr class="alt">    <TD> At-HsfA7b</TD>
	<TD>rr_c_27<BR>At3g63350</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=7523417&dopt=GenPept">CAB86436</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g63350">heat shock transcription factor-like protein </A></TD></TR>

<TR><TD ROWSPAN=2 valign=top><B>Class A<br>Group A8,A9  </B></td>     <TD> At-HsfA8</TD>
	<TD>t23k23<BR>At1g67970</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?val=AAF16564.1">AAF16564</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67970">putative heat shock transcription factor </A></TD></TR>

<TR>    <TD> At-HsfA9</TD>
	<TD>mjp23<BR>At5g54070</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=8809578&dopt=GenPept">BAA97129</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g54070">putative protein </A></TD></TR>

<tr class="alt"><TD ROWSPAN=1 valign=top><B>Class B<br>Group B1  </B></td>     <TD>At-HsfB1</TD>
	<TD>ap2<BR>At4g36990</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=2464881&dopt=GenPept">CAB16764</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g36990">heat shock transcription factor HSF4</A></TD></TR>

<TR> <TD ROWSPAN=2 valign=top><B>Class B<br>Group B2  </B></td>   <TD> At-HsfB2a </TD>
	<TD>mtg10<BR>At5g62020</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=6624616&dopt=GenPept">CAB63802</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g62020"> heat shock factor 6</A></TD></TR>

<TR>    <TD> At-HsfB2b </TD>
	<TD>dt_d_26<BR>At4g11660</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=4539457&dopt=GenPept">CAB39937</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g11660">heat shock transcription factor - like protein</A></TD></TR>

<tr class="alt"> <TD ROWSPAN=1 valign=top><B>Class B<br>Group B3  </B></td>   <TD> At-HsfB3</TD>
	<TD>t32g6<BR>At2g41690</TD>
	<TD><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=2618703&dopt=GenPept">AAB84350</A></TD>
        <td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g41690">putative heat shock transcription factor </A></TD></TR>


<TR> <TD ROWSPAN=1 valign=top><B>Class B<br>Group B4  </B></td>   <TD> At-HsfB4</TD>
<td>F2G19<br>At1g46264</td>
<td><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=11321779&dopt=GenPept">AAG34256</A></td>
    <td><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g46264">heat shock transcription factor, putative</A></td></tr>

<tr class="alt"> <TD ROWSPAN=1 valign=top><B>Class C  </B></td>   <TD> At-HsfC1</TD>
<td>mob24<br>At3g24520</td>
<td><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=9294046&dopt=GenPept">BAB02003</a></TD>
    <td><a href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g24520">heat shock transcription factor HSF1, putative </td></tr>

    
	

	</TABLE>

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
