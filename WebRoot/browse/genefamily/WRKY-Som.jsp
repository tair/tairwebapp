<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - WRKY Transcription Factors";
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

<A NAME=""><h2>WRKY transcription factors</h2></A>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD>
<TD>Eulgem, T.,Rushton, P. J.,Robatzek, S.,Somssich, I. E. (2000) <a href="/servlets/TairObject?type=publication&id=492" target="new">The WRKY superfamily of plant transcription factors.
</a> Trends Plant Sci.
 5(5): 199-206.
</td></tr>
<TR><TD valign=top>&nbsp;</TD>
<TD>Somssich Research Group 
<A HREF="http://www.mpiz-koeln.mpg.de/english/research/schulzeLefertGroup/somssich/WRYK_Superfamily/index.html">
The WRKY Transcription Factor Superfamily</A></TD></TR>

<TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<TD>&nbsp; </TD></TR>

<TR><TD><B>Contact:</B></TD>
<TD><A HREF="/servlets/Community?action=view&type=person&communityID=4955" target="display">Dr. Imre Somssich</A></TD></TR>

</TABLE>
    
    <p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="0">
        

	  

<TR>    <th><b>Gene Family<BR>Name:</b></th>
        <th><b>Protein Name:</b></th>
        <th><b>Genomic Locus:</b></th>
        <th><b>Accession:</b></th>
	<th><b>TIGR Annotation:</b></th> 
	    </TR>
	    

<tr class="alt">    <TD ROWSPAN=16 valign="top"><B>Group I</B></TD>
<td>AtWRKY1<br>ZAP1</td>
<td>F1O13.1<br>At2g04880</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAA63554&doptcmdl=GenPept">CAA63554</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g04880">transcription factor ZAP1 </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY2</TD>
<td>MXK23.1<br>AT5g56270</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL13039&doptcmdl=GenPept">AAL13039</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g56270">transcription factor NtWRKY4-like</A></td>
    </tr>

<tr class="alt">
<TD>AtWRKY3</TD>
<td>T4M8.23<br>At2g03340</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK28311&doptcmdl=GenPept">AAK28311</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g03340">putative WRKY DNA-binding protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY4</TD>
<td>F7A19.5<br>At1g13960</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL13048&doptcmdl=GenPept">AAL13048</A>/<A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK28313&doptcmdl=GenPept">AAK28313</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g13960">putative DNA-binding protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY10</TD>
<td>F20N2.22<br>At1g55600</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55600">hypothetical protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY19</TD>
<td>F16J13.90<br>AT4g12020</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g12020">putative disease resistance protein</A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY20</TD>
<td>T15N24.90<br>AT4g26640*</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL13050&doptcmdl=GenPept">AAL13050</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g26640">putative protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY25</TD>
<td>T9D9.6<br>AT2g30250</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL13040&doptcmdl=GenPept">AAL13040</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2g30250">putative WRKY-type DNA binding protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY26</TD>
<td>T28J14.40<br>At5g07100</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK28309&doptcmdl=GenPept">AAK28309</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g07100">SPF1-like protein</A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY32</TD>
<td>F6I18.160<br>AT4g30935</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g30935">putative protein</A></td>
    </tr>

<tr class="alt">
<TD>AtWRKY33</TD>
<td>T19C21.4<br>At2g38470</td>
<td>&nbsp;</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g38470">putative WRKY-type DNA binding protein</A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY34</TD>
<td>M3E9.130<br>AT4g26440</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL11010&doptcmdl=GenPept">AAL11010</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g26440">putative protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY44<br>TTG2</TD>
<td>F3G5.5<br>At2g37260</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK96200&doptcmdl=GenPept">AAK96200</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37260">putative WRKY-type DNA binding protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY45</TD>
<td>F1C9.25<br>AT3g01970</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01970">putative WRKY-like transcriptional regulator protein </A></td>
    </tr>
    
<tr class="alt">
<TD>AtWRKY58</TD>
<td>T4P13.24<br>AT3g01080</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g01080">putative DNA-binding protein</A></td>
    </tr>

<tr class="alt">
<TD>AtWRKY73</TD>
<td>EST (AV526908)</TD>    
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
    
<TR>
<td ROWSPAN=3 valign="top"><b>Group II-a</b></td>
<TD>AtWRKY18</TD>
<td>F28M20.10<br>At4g31800*</td>
<td><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK28308&doptcmdl=GenPept">AAK28308</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g31800">putative protein </A></td>
    </tr>


<TR>
<TD>AtWRKY40</TD>
<td>F23A5.19<br>At1g80840</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80840">transcription factor, putative </A></td>
    </tr>


<TR>
<TD>AtWRKY60</TD>
<td>F27C12.8<br>At2g25000</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g25000">putative WRKY-type DNA binding protein </A></td>
    </tr>

<tr class="alt">
<td ROWSPAN=8 valign="top"><b>Group II-b</b></td>
<TD>AtWRKY6</TD>
<td>F19K23.22<br>At1g62300</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK01127&doptcmdl=GenPept">AAK01127</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g62300">unknown protein</A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY9</TD>
<td>T22E19.22<br>At1g68150</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL11006&doptcmdl=GenPept">AAL11006</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g68150">putative DNA binding protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY31</TD>
<td>F1N20.170<br>At4g22070</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL11009&doptcmdl=GenPept">AAL11009</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g22070">putative protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY36</TD>
<td>T17F3.16<br>At1g69810</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK96197&doptcmdl=GenPept">AAK96197</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69810">hypothetical protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY42</TD>
<td>T26N6.6<br>At4g04450</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL11011&doptcmdl=GenPept">AAL11011</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g04450">putative DNA-binding protein</A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY47</TD>
<td>T15B16.12<br>AT4g01720</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g01720">putative DNA-binding protein</A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY61</TD>
<td>F6A14.5<br>At1g18860*</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g18860">hypothetical protein</A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY72</TD>
<td>F8M21.20<br>At5g15130</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g15130">putative protein </A></td>
    </tr>


<TR>
<td ROWSPAN=17 valign="top"><b>Group II-c</b></td>
<TD>AtWRKY8</TD>
<td>MPL12.15<br>At5g46350</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK96193&doptcmdl=GenPept">AAK96193</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g46350">putative protein</A></td>
    </tr>


<tr>
<TD>AtWRKY12</TD>
<td>AC003672*<br>At2g44745</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK96195&doptcmdl=GenPept">AAK96195</A></td>
<td>&nbsp;</td>
    </tr>

<tr>
<TD>AtWRKY13</TD>
<td>F23K16.40<br>At4g39410</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL13042&doptcmdl=GenPept">AAL13042</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g39410">putative WRKY DNA-binding protein</A></td>


    
<tr>
<TD>AtWRKY23</TD>
<td>T8I13.25<br>At2g47260</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL11008&doptcmdl=GenPept">AAL11008</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47260">putative WRKY-type DNA binding protein</A></td>
    </tr>


<tr>
<TD>AtWRKY24</TD>
<td>MBK23.9<br>At5g41570</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK96202&doptcmdl=GenPept">AAK96202</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g41570"> putative protein </A></td>
    </tr>


<tr>
<TD>AtWRKY28</TD>
<td>T9A21.10<br>At4g18170</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g18170">DNA binding-like protein </A></td>
    </tr>


<tr>
<TD>AtWRKY43</TD>
<td>T3F17.40<br>At2g46130</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK96199&doptcmdl=GenPept">AAK96199</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46130">putative WRKY-type DNA binding protein</A></td>
    </tr>


<tr>
<TD>AtWRKY48</TD>
<td>K6M13.6<br>AT5g49520</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g49520">putative protein </A></td>
    </tr>

<tr>
<TD>AtWRKY49</TD>
<td> MNL12.11<br>At5g43290</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g43290">putative protein </A></td>
    </tr>

    
<tr>
<TD>AtWRKY50</TD>
<td>T19G15.20<br>AT5g26170</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g26170">putative protein </A></td>
    </tr>


<tr>
<TD>AtWRKY51</TD>
<td>MXK3.3<br>AT5g64810</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g64810">putative protein </A></td>
    </tr>


<tr>
<TD>AtWRKY56</TD>
<td>F22C12.23<br>At1g64000</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL11010&doptcmdl=GenPept">AAL11010</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g64000">WRKY DNA binding protein, putative </A></td>
    </tr>


<tr>
<TD>AtWRKY57</TD>
<td>F23O10.11<br>At1g69310</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK96200&doptcmdl=GenPept">AAK96200</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69310">unknown protein</A></td>
    </tr>


<tr>
<TD>AtWRKY59</TD>
<td>F7D8.22<br>At2g21900</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g21900">putative WRKY-type DNA binding protein </A></td>
    </tr>


<tr>
<TD>AtWRKY68</TD>
<td>T12C14.40<br>AT3g62340*</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL13044&doptcmdl=GenPept">AAL13044</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g62340">putative protein</A></td>
    </tr>


<tr>
<TD>AtWRKY71</TD>
<td>F1N18.10<br>At1g29860</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL13047&doptcmdl=GenPept">AAL13047</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29860">DNA-binding protein, putative </A></td>
    </tr>


<TR>
<TD>AtWRKY75</TD>
<td>T19L5.40<br>AT5g13080</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g13080"> WRKY-like protein </A></td>
    </tr>


<tr class="alt">
<td ROWSPAN=7 valign="top"><b>Group II-d</b></td>    
<TD>AtWRKY7</TD>
<td>T22A6.70<br>At4g24240</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK28440&doptcmdl=GenPept">AAK28440</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g24240">putative DNA-binding protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY11</TD>
<td>F3L17.120<br>AT4g31550</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK96194&doptcmdl=GenPept">AAK96194</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g31550">putaive DNA-binding protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY15</TD>
<td>T20D16.5<br>At2g23320</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK44009&doptcmdl=GenPept">AAK44009</A>/<A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK28314&doptcmdl=GenPept">AAK28314</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g23320">putative WRKY-type DNA-binding protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY17</TD>
<td>F25P17.13<br>At2g24570*</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL13049&doptcmdl=GenPept">AAL13049</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24570">putative WRKY-type DNA binding protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY21</TD>
<td>T6B20.6<br>At2g30590</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK28441&doptcmdl=GenPept">AAK28441</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30590">unknown protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY39</TD>
<td>F7O18.30<br>AT3g04670</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK96198&doptcmdl=GenPept">AAK96198</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g04670">unknown protein</A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY74</TD>
<td>F4I4.30<br>AT5g28650</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g28650">DNA-binding protein - like </A></td>
    </tr>


<tr>
<td ROWSPAN=8 valign="top"><b>Group II-e</b></td>
<TD>AtWRKY14</TD>
<td>T5I8.10<br>At1g30650</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL11007&doptcmdl=GenPept">AAL11007</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30650">putative DNA-binding protein </A></td>
    </tr>


<tr>
<TD>AtWRKY16</TD>
<td>K21C13.24<br>AT5g45050</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g45050">disease resistance protein-like</A></td>
    </tr>


<tr>
<TD>AtWRKY22</TD>
<td>F2N1.6<br>AT4g01250</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g01250">putative DNA-binding protein </A></td>
    </tr>


<tr>
<TD>AtWRKY27</TD>
<td>MXC20.5<br>At5g52830</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL13041&doptcmdl=GenPept">AAL13041</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g52830">unknown protein </A></td>
    </tr>


<tr>
<TD>AtWRKY29</TD>
<td>F9D16.20<br>AT4g23550</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g23550">putative protein </A></td>
    </tr>


<tr>
<TD>AtWRKY35</TD>
<td>F19I3.6<br>At2g34830</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK96201&doptcmdl=GenPept">AAK96201</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g34830">putative WRKY-type DNA binding protein </A></td>
    </tr>


<tr>
<TD>AtWRKY65</TD>
<td>F28N24.4<br>At1g29280*</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g29280">DNA binding protein, putative </A></td>
    </tr>


<tr>
<TD>AtWRKY69</TD>
<td>T20N10.60<br>AT3g58710*</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL13045&doptcmdl=GenPept">AAL13045</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g58710"> DNA-binding WRKY - like protein </A></td>
    </tr>


<tr class="alt">
<td ROWSPAN=14 valign="top"><b>Group III</b></td>
<TD>AtWRKY30</TD>
<td> MLE8.3<br>At5g24110</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK96196&doptcmdl=GenPept">AAK96196</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g24110"> unknown protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY38</TD>
<td>MQJ16.11<br>AT5g22570</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g22570">putative protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY41</TD>
<td>T22B4.50<br>AT4g11070</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g11070">other putative proteins, Arabidopsis thaliana </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY46</TD>
<td>F11C10.23<br>At2g46400</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK96020&doptcmdl=GenPept">AAK96020</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g46400">putative WRKY-type DNA binding protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY52<br> RRS1</TD>
<td>K9E15.3<br>AT5g45270*</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g45270">unknown protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY53</TD>
<td> F9D16.280<br>AT4g23810</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK28442&doptcmdl=GenPept">AAK28442</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4g23810">putative protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY54</TD>
<td>T7D17.7<br>At2g40750</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40750">hypothetical protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY55</TD>
<td>T7D17.8<br>At2g40740</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g40740">putative WRKY-type DNA binding protein</A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY62</TD>
<td>T20L15.170<br>AT5g01900*</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK28310&doptcmdl=GenPept">AAK28310</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5g01900">putative protein</A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY63</TD>
<td>T12I7.5<br>At1g66600</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66600">hypothetical protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY64</TD>
<td>F28G11.2<br>At1g66560</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66560">hypothetical protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY66</TD>
<td>T21F11.8<br>At1g80590</td>
<td>&nbsp;</td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g80590">hypothetical protein </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY67</TD>
<td>F28G11.3<br>At1g66550*</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL13043&doptcmdl=GenPept">AAL13043</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66550">wrky-type DNA binding protein, putative </A></td>
    </tr>


<tr class="alt">
<TD>AtWRKY70</TD>
<td>T5P19.50<br>AT3g56400</td>
<td><A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL13046&doptcmdl=GenPept">AAL13046</A>/<A HREF="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=T49041&doptcmdl=GenPept">T49041</A></td>
<td><A HREF="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3g56400">DNA-binding protein-like</A></td>
    </tr>


<tr>
<td ROWSPAN=1 valign="top"><b>Unclassified </b></td>
<TD>AtWRKY5</TD>
<TD>At5g35738</td>
<td>AB011485</td>
<td>pseudogene</td>

    </tr>
</TABLE>
<table>
<tr><td><br>* = experimentally determined and found to be different from predicted ORF</td></tr>
</table>



<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
