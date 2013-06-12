<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Lateral Organ Boundaries Domain Gene Family";
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

		
		<!-- Content goes here //--> 

<A NAME="lob.html"><span class="header"><i>Arabidopsis</i> Lateral Organ Boundaries Gene Family</span><br><br>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD> 
<TD><LI><b>Shuai, B., Reynaga-Pena C.G., and Springer, P.S.</b> (2002). <a href="/servlets/TairObject?type=publication&id=501681545">The <u>LATERAL ORGAN BOUNDARIES</u> gene defines a novel, plant-specific gene family.</a> Plant Physiol. <b>129,</b> 747-761</TD></TR>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD><li>All members contain the LOB domain, characterized by the amino acid sequence "CX2CX6CX3C"</TD></TR>

<TR><TD valign=top><B>Contact:</B></TD>
<TD><A href="/servlets/Community?type=person&action=view&communityID=1213505">Bin Shuai</A><br> <A href="/servlets/Community?action=view&type=person&communityID=1213506">Cristina Reynaga-Pena</A><br><a href="/servlets/Community?action=view&type=person&communityID=4469">Patricia Springer</A></TD></TR>

</TABLE> 




 <P>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
        

          

<TR>    <TH><B>Gene Family<BR>Name:</B></TH>
        <TH><B>Protein Name:</B></TH>
        <TH><B>Genomic Locus:</B></TH>
        <TH><B>Accession:</B></TH>
        <TH><B>TIGR Annotation:</B></TH>    
            </TR>

<tr class="alt"><TD rowspan=37 valign=top><b>Class I</b></TD>
<TD>LOB</TD>
<TD>MDC12.5<BR>AT5G63090</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=10177290&dopt=GenPept">BAB10551</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT5G63090">putative protein</A></TD></TR>

<tr class="alt">
<TD>LBD1</TD>
<TD> F24B9.1<BR>AT1G07900</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=8439879&dopt=GenPept">AAF75065</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT1G07900">unknown protein</A></TD></TR>

<tr class="alt">
<TD>LBD2</TD>
<TD>F9P14.14<BR>AT1G06280</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=8844133&dopt=GenPept">AAF80225</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT1G06280">hypothetical protein</A></TD></TR>

<tr class="alt">
<TD>LBD3</TD>
<TD>F3O9.33<BR>AT1G16530</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=4966373&dopt=GenPept">AAD34704</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT1G16530">hypothetical protein </A></TD></TR>

<tr class="alt">
<TD>LBD4</TD>
<TD> T19E23.11<BR>AT1G31320</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=6692123&dopt=GenPept">AAF24588</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT1G31320">hypothetical protein </A></TD></TR>

<tr class="alt">
<TD>LBD5</TD>
<TD>T22A15.8<BR>AT1G36000</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=12324709&dopt=GenPept">AAG52312</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT1G36000">hypothetical protein</A></TD></TR>

<tr class="alt">
<TD>LBD6</TD>
<TD> F5I14.15<BR>AT1G65620</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=2190548&dopt=GenPept">AAB60912</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT1G65620">unknown protein</A></TD></TR>

<tr class="alt">
<TD>LBD7</TD>
<TD>F3N23.18<BR>AT1G72980</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=5903087&dopt=GenPept">AAD55645</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT1G72980">hypothetical protein </A></TD></TR>

<tr class="alt">
<TD>LBD8</TD>
<TD>F3P11.11<BR>AT2G19510</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=4191781&dopt=GenPept">AAD10150</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT2G19510">hypothetical protein</A></TD></TR>

<tr class="alt">
<TD>LBD9</TD>
<TD>F6F22.15<BR>AT2G19820</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=3687236&dopt=GenPept">AAC62134</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT2G19820">hypothetical protein </A></TD></TR>

<tr class="alt">
<TD>LBD10</TD>
<TD>F27L4.15<BR>AT2G23660</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=3152616&dopt=GenPept">AAC17095</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT2G23660">hypothetical protein</A></TD></TR>

<tr class="alt">
<TD>LBD11</TD>
<TD>T17D12.6<BR>AT2G28500</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=4510398&dopt=GenPept">AAD21485</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT2G28500">hypothetical protein </A></TD></TR>

<tr class="alt">
<TD>LBD12</TD>
<TD>T27E13.13<BR>AT2G30130</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=3150407&dopt=GenPept">AAC16959</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT2G30130">expressed protein </A></TD></TR>

<tr class="alt">
<TD>LBD13</TD>
<TD>T9D9.15<BR>AT2G30340</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=20196885&dopt=GenPept">AAC16936</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT2G30340">expressed protein</A></TD></TR>

<tr class="alt">
<TD>LBD14</TD>
<TD>F16D14.15<BR>AT2G31310</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=4432826&dopt=GenPept">AAD20676</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT2G31310">hypothetical protein </A></TD></TR>

<tr class="alt">
<TD>LBD15</TD>
<TD>T2P4.18<BR>AT2G40470</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=2651309&dopt=GenPept">AAB87589</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT2G40470">expressed protein</A></TD></TR>

<tr class="alt">
<TD>LBD16</TD>
<TD>MHK10.15<BR>AT2G42430</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=4567314&dopt=GenPept">AAD23725</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT2G42430">expressed protein</A></TD></TR>

<tr class="alt">
<TD>LBD17</TD>
<TD> MHK10.16<BR>AT2G42440</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=4567315&dopt=GenPept">AAD23726</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT2G42440">hypothetical protein </A></TD></TR>

<tr class="alt">
<TD>LBD18</TD>
<TD> F4L23.7<BR>AT2G45420</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=20196916&dopt=GenPept">AAB82622</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT2G45420">expressed protein</A></TD></TR>

<tr class="alt">
<TD>LBD19</TD>
<TD>F4L23.8<BR>AT2G45410</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=2583114&dopt=GenPept">AAB82623</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT2G45410">unknown protein</A></TD></TR>

<tr class="alt">
<TD>LBD20</TD>
<TD>F20H23.21<BR>AT3G03760</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=6006865&dopt=GenPept">AAF00641</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT3G03760">unknown protein</A></TD></TR>

<tr class="alt">
<TD>LBD21</TD>
<TD>F9F8.10<BR>AT3G11090</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=6016686&dopt=GenPept">AAF01513</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT3G11090">hypothetical protein </A></TD></TR>

<tr class="alt">
<TD>LBD22</TD>
<TD>MCP4.8<BR>AT3G13850</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=9294609&dopt=GenPept">BAB02910</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT3G13850">hypothetical protein </A></TD></TR>

<tr class="alt">
<TD>LBD23</TD>
<TD>MLJ15.1<BR>AT3G26620</TD>
<TD>&nbsp;</TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT3G26620"> hypothetical protein</A></TD></TR>

<tr class="alt">
<TD>LBD24</TD>
<TD>MLJ15.5<BR>AT3G26660</TD>
<TD>&nbsp;</TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT3G26660">hypothetical protein</A></TD></TR>

<tr class="alt">
<TD>LBD25</TD>
<TD>MGF10.6<BR>AT3G27650</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=9294470&dopt=GenPept">BAB02689</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT3G27650">expressed protein</A></TD></TR>

<tr class="alt">
<TD>LBD26</TD>
<TD>K24A2.3<BR>AT3G27940</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=9294310&dopt=GenPept">BAB01481</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT3G27940">hypothetical protein</A></TD></TR>

<tr class="alt">
<TD>LBD27</TD>
<TD>T23J7.200<BR>AT3G47870</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=4741204&dopt=GenPept">CAB41870</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT3G47870"> putative protein</A></TD></TR>

<tr class="alt">
<TD>LBD28</TD>
<TD>T20E23.110<BR>AT3G50510</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=6561991&dopt=GenPept">CAB62480</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT3G50510">putative protein </A></TD></TR>

<tr class="alt">
<TD>LBD29</TD>
<TD>F9D24.100<BR>AT3G58190</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=6735331&dopt=GenPept">CAB68157</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT3G58190">expressed protein </A></TD></TR>

<tr class="alt">
<TD>LBD30</TD>
<TD>F6N15.4<BR>AT4G00220</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=3193318&dopt=GenPept">AAC19300</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT4G00220">expressed protein</A></TD></TR>

<tr class="alt">
<TD>LBD31</TD>
<TD>F6N15.25<BR>AT4G00210</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=3193312&dopt=GenPept">AAC19294</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT4G00210">hypothetical protein</A></TD></TR>

<tr class="alt">
<TD>LBD32</TD>
<TD>T12H17.90<BR>AT4G22700</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=2827547&dopt=GenPept">CAA16555</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT4G22700">predicted protein</A></TD></TR>

<tr class="alt">
<TD>LBD33</TD>
<TD>K16F4.4<BR>AT5G06080</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=8978344&dopt=GenPept">BAA98197</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT5G06080">putative protein</A></TD></TR>

<tr class="alt">
<TD>LBD34</TD>
<TD>F2G14<br>&nbsp;</TD>
<TD>&nbsp;</TD>
<TD>&nbsp;</TD></TR>

<tr class="alt">
<TD>LBD35</TD>
<TD>MIK22.21<BR>AT5G35900</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=10176709&dopt=GenPept">BAB09931</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT5G35900">putative protein </A></TD></TR>


<tr class="alt">
<TD>LBD36</TD>
<TD>MUD21.13<BR>AT5G66870</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=9758137&dopt=GenPept">BAB08629</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT5G66870"> putative protein </A></TD></TR>

<tr><td rowspan=6 valign=top><b>Class II</b></td>
<TD>LBD37</TD>
<TD>K8K14.16<BR>AT5G67420</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=9758441&dopt=GenPept">BAB09027</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT5G67420">putative protein </A></TD></TR>

<tr>
<TD>LBD38</TD>
<TD>F3A4.20<BR>AT3G49940</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=6522915&dopt=GenPept">CAB62102</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT3G49940">putative protein</A></TD></TR>

<tr>
<TD>LBD39</TD>
<TD>F6G17.4<BR>AT4G37540</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=4468979&dopt=GenPept">CAB38293</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT4G37540">putative protein </A></TD></TR>

<tr>
<TD>LBD40</TD>
<TD>F5A8.2<BR>AT1G67100</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=4204277&dopt=GenPept">AAD10658</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT1G67100">hypothetical protein</A></TD></TR>

<tr>
<TD>LBD41</TD>
<TD>F16B3.18<BR>AT3G02550</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=6957719&dopt=GenPept">AAF32463</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT3G02550">expressed protein</A></TD></TR>

<tr>
<TD>LBD42</TD>
<TD>T26J14.8<BR>AT1G68510</TD>
<TD><A HREF="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=12324879&dopt=GenPept">AAG52389</A></TD>
<TD><A HREF="http://www.tigr.org/tigr-scripts/edb2_scripts/euk_display.dbi?db=ath1&locus=AT1G68510">expressed protein</A></TD></TR>

</table>
  <center>Last modified on January 15, 2004</center>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
