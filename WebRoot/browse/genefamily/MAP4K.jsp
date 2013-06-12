<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "MAP4K Gene Family";
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
<h2><i>Arabidopsis</i> MAP4K Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Jonak C, &Ouml;kr&eacute;sz L, B&ouml;gre L, Hirt H (2002) <a href="/servlets/TairObject?type=publication&id=501681769">Complexity, cross talk and integration of plant MAP kinase signalling.</a> Curr. Opin. Plant Biol. 5: 415-424.<br>
<a href="http://personal.rhul.ac.uk/ujba/110/mapk/map4k_genes.htm" target=display>http://personal.rhul.ac.uk/ujba/110/mapk/map4k_genes.htm</a><br>
The B&ouml;gre Lab web site<br>
<a href="http://personal.rhul.ac.uk/ujba/110/bogrelab.htm" target=display>http://personal.rhul.ac.uk/ujba/110/bogrelab.htm</a></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>
<LI><A href="4KSIG.html" target=new>MAP4K Sequence Alignments</A> 

<BR><LI>Table of <A href="motifs.jsp" target=new>Characteristic Sequence Motifs</A>




</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=/servlets/Community?action=view&type=person&communityID=1213417 target=new>Laszlo B&ouml;gre</A><br><a href="/servlets/Community?action=view&type=person&communityID=7034">Laszlo Okresz</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation:</B></TH>

         </TR>

<tr class="alt"><td valign=top rowspan=10><b>MAP4K</b></td>

       <td>MAP4K1</td>

       <td>F8L10.20<br><a href=/servlets/TairObject?type=locus&name=At1g53165 target="new">At1g53165</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53165 target="new">MAP kinase BnMAP4K alpha1, putative</A></td>

        </tr>
<tr class="alt">

       <td>MAP4K2</td>

       <td>K7L4.2<br><a href=/servlets/TairObject?type=locus&name=At3g15220 target="new">At3g15220</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g15220 target="new">putative MAP kinase </A></td>

        </tr>
<tr class="alt">

       <td>MAP4K3</td>

       <td>F23O10.20<br><a href=/servlets/TairObject?type=locus&name=At1g69220 target="new">At1g69220</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69220 target="new">putative serine threonine kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAP4K4</td>

       <td>T9L3.20<br><a href=/servlets/TairObject?type=locus&name=At5g14720 target="new">At5g14720</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g14720 target="new">protein kinase -like protein</A></td>

        </tr>
<tr class="alt">

       <td>MAP4K5</td>

       <td>T19F6.90<br><a href=/servlets/TairObject?type=locus&name=At4g24100 target="new">At4g24100</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g24100 target="new">putative protein</A></td>

        </tr>
<tr class="alt">

       <td>MAP4K6</td>

       <td>T12H20.4<br><a href=/servlets/TairObject?type=locus&name=At4g10730 target="new">At4g10730</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g10730 target="new">putative protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAP4K7</td>

       <td>F17O7.3<br><a href=/servlets/TairObject?type=locus&name=At1g70430 target="new">At1g70430</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g70430 target="new">Ste-20 related kinase SPAK, putative</A></td>

        </tr>
<tr class="alt">

       <td>MAP4K8</td>

       <td>F20B17.7<br><a href=/servlets/TairObject?type=locus&name=At1g79640 target="new">At1g79640</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79640 target="new">kinase, putative</A></td>

        </tr>
<tr class="alt">

       <td>MAP4K9</td>

       <td>F5O8.25<br><a href=/servlets/TairObject?type=locus&name=At1g23700 target="new">At1g23700</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23700 target="new">putative Ser/Thr protein kinase</A></td>

        </tr>
<tr class="alt">

       <td>MAP4K10</td>

       <td>FCAALL.219<br><a href=/servlets/TairObject?type=locus&name=At4g14480 target="new">At4g14480</A></td>

       <td>&nbsp;</td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g14480 target="new">kinase like protein</A></td>

        </tr>
</table><P>
<center>Last modified on January 15, 2004</center>           


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
