<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "ABC transporter- PDR subfamily";
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
<h2><i>Arabidopsis</i> ABC transporter- PDR subfamily </h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><li><b>van den Br&ucirc;le S. and Smart, C.C.</b> (2002) <A href="/servlets/TairObject?type=publication&id=501682515">The plant PDR family of ABC transporters.</A>
<i>Planta</i> 216: 95-106.
<br>


</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td><li>A molecular characterisation of the Arabidopsis PDR ABC transporters by analysing their genomic structure and expression patterns.  The criteria 
used were sequence similarity to the deduced amino acid sequence of 
SpTUR2 (the first plant PDR cDNA cloned) over a threshold E value of 
e-70 and the presence of a duplicated Walker A motif, ABC signature 
and transmembrane spanning domains.</td></tr>

<TR><TD valign=top><B>Contact:</b></td>
<td><li><A href="/servlets/Community?type=person&action=view&communityID=731">Cheryl Smart</A>
<br>
<li><a href="/servlets/Community?action=view&type=organization&communityID=8918" target=new>Cheryl Smart Laboratory</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation:</B></TH>

         </TR>

<tr class="alt"><td rowspan=15 valign=top><b>ABC transporter<br>PDR subfamily</b></td>

       <td>AtPDR1</td>

       <td>T2O4.17<br>MYA6.14<br><a href=/servlets/TairObject?type=locus&name=At3g16340 target="new">At3g16340</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB01273&doptcmdl=GenPept">AAB63643</a><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB01273&doptcmdl=GenPept">BAB01273</A><br><A href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_566543&doptcmdl=GenPept">NP_566543</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g16340 target="new">ABC transporter family protein</A></td>

        </tr>
<tr class="alt">

       <td>AtPDR2</td>

       <td>ATFCA3<br>ATCHRIV40<br><a href=/servlets/TairObject?type=locus&name=At4g15230 target="new">At4g15230</A> </td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB10301&doptcmdl=GenPept">CAB10301</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB45997&doptcmdl=GenPept">CAB45997</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78564&doptcmdl=GenPept">CAB78564</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78565&doptcmdl=GenPept">CAB78565</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_567461&doptcmdl=GenPept">NP_567461</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_193258&doptcmdl=GenPept">NP_193258</A></td>

       <td><A href="http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g15230" target="new">ABC transporter like protein</a></td>

        </tr>
<tr class="alt">

       <td>AtPDR3</td>

       <td>F23F1.14<br><a href=/servlets/TairObject?type=locus&name=At2g29940 target="new">At2g29940</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC31858&doptcmdl=GenPept">AAC31858</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_180555&doptcmdl=GenPept">NP_180555</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29940 target="new">ABC transporter family protein </A></td>

        </tr>

<tr class="alt">

       <td>AtPDR4</td>

       <td>F12C20.5<br><a href=/servlets/TairObject?type=locus&name=At2g26910 target="new">At2g26910</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=>AAC32236&doptcmdl=GenPept">AAC32236</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_180259&doptcmdl=GenPept">NP_180259</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26910 target="new">ABC transporter family protein</A></td>

        </tr>


<tr class="alt">

       <td>AtPDR5</td>

       <td>F3G5.7<br><a href=/servlets/TairObject?type=locus&name=At2g37280 target="new">At2g37280</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC98048&doptcmdl=GenPept">AAC98048</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_181265&doptcmdl=GenPept">NP_181265</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g37280 target="new">ABC transporter family protein</A></td>

        </tr>

<tr class="alt">

       <td>AtPDR6</td>

       <td>F1O11.1<br><a href=/servlets/TairObject?type=locus&name=At2g36380 target="new">At2g36380</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD24623&doptcmdl=GenPept">AAD24623</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_181179&doptcmdl=GenPept">NP_181179</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g36380 target="new">ABC transporter family protein</A></td>

        </tr>

<tr class="alt">

       <td>AtPDR7</td>

       <td>F9L1.15<br><a href=/servlets/TairObject?type=locus&name=At1g15210 target="new">At1g15210</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD39650&doptcmdl=GenPept">AAD39650</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_172973&doptcmdl=GenPept">NP_172973</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15210 target="new">ABC transporter family protein</A></td>

        </tr>

<tr class="alt">

       <td>AtPDR8</td>

       <td>F23H11.19<br><a href=/servlets/TairObject?type=locus&name=At1g59870 target="new">At1g59870</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD39329&doptcmdl=GenPept">AAD39329</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_176196&doptcmdl=GenPept">NP_176196</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g59870 target="new">ABC transporter family protein</A></td>

        </tr>

<tr class="alt">

       <td>AtPDR9</td>

       <td>F4P12.180<br><a href=/servlets/TairObject?type=locus&name=At3g53480 target="new">At3g53480</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB67655&doptcmdl=GenPept">CAB67655</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_190916&doptcmdl=GenPept">NP_190916</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g53480 target="new">ABC transporter family protein</A></td>

        </tr>

<tr class="alt">

       <td>AtPDR10</td>

       <td>MJI6.3<br><a href=/servlets/TairObject?type=locus&name=At3g30842 target="new">At3g30842</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02609&doptcmdl=GenPept">BAB02609</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g30842 target="new">putative ABC transporter</A></td>

        </tr>

<tr class="alt">

       <td>AtPDR11</td>

       <td>F1O19.3<br>T4O24.9<br><a href=/servlets/TairObject?type=locus&name=At1g66950 target="new">At1g66950</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF98206&doptcmdl=GenPept">AAF98206</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG50592&doptcmdl=GenPept">AAG50592</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_176867&doptcmdl=GenPept">NP_176867</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66950 target="new">ABC transporter family protein</A></td>

        </tr>

<tr class="alt">

       <td>AtPDR12</td>

       <td>T16N11.3<br><a href=/servlets/TairObject?type=locus&name=At1g15520 target="new">At1g15520</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF71978&doptcmdl=GenPept">AAF71978</A><br><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_173005&doptcmdl=GenPept">NP_173005</A></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g15520 target="new">ABC transporter family protein </A></td>

        </tr>

<tr class="alt">

       <td>AtPDR13</td>

       <td>182595-189399<br><font size=1>(nucleotide position)</font><br>At4g15218</td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AL161540&doptcmdl=GenBank">AL161540</A></td>

       <td>&nbsp;</td>

        </tr>

<tr class="alt">

       <td>AtPDR14</td>

       <td>6442-12552<br><font size=1>(nucleotide position)</font><br>At4g15232</td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AL161541&doptcmdl=GenBank">AL161541</A></td>

       <td>&nbsp;</td>

        </tr>

<tr class="alt">

       <td>AtPDR15</td>

       <td>14797-20847<br><font size=1>(nucleotide position)</font><br>At4g15238</td>

       <td><a href="http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AL161541&doptcmdl=GenBank">AL161541</A></td>

       <td>&nbsp;</td>

        </tr>

</table>



<center>Last modified on July 5, 2007</center>  


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
