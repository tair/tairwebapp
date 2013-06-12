<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Gene Family";
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
<h2><i>Arabidopsis</i> Plant Defensins Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Thomma, B. P.,Cammue, B. P.,Thevissen, K. (2002) <a href="/servlets/TairObject?type=publication&id=501682461">Plant Defensins.</a> Planta 216:193</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B> </TD>
<td valign=top>Genes encoding small (45-55 amino acids) highly basic peptides sharing a conserved pattern of eight structure-stabilizing cysteines</td></tr>
<TR><TD valign=top><B>Contact: </b></td>
<td><a href="/servlets/TairObject?type=person&id=10830">Bart Thomma</a></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</B></TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td valign=top rowspan=7><b>Plant defensins: Family 1</b></td>

       <td>PDF1.1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g75830 target="new">At1g75830</A></td>

       <td>NM_106233</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75830 target="new">putative plant defensin gene
</A></td>

        </tr>
<tr class="alt">

       <td>PDF1.2a</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g44420 target="new">At5g44420</A></td>

       <td>NM_123809</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g44420 target="new">putative plant defensin gene
</A></td>

        </tr>
<tr class="alt">

       <td>PDF1.2b</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g26020 target="new">At2g26020</A></td>

       <td>NM_128161</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26020 target="new">putative plant defensin gene
</A></td>

        </tr>
<tr class="alt">

       <td>PDF1.2c</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g44430 target="new">At5g44430</A></td>

       <td>NM_123810</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g44430 target="new">putative plant defensin gene
</A></td>

        </tr>
<tr class="alt">

       <td>PDF1.3</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g26010 target="new">At2g26010</A></td>

       <td>NM_128160</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26010 target="new">putative plant defensin gene
</A></td>

        </tr>
<tr class="alt">

       <td>PDF1.4</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g19610 target="new">At1g19610</A></td>

       <td>NM_101817</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19610 target="new">putative plant defensin gene
</A></td>

        </tr>
<tr class="alt">

       <td>PDF1.5</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g55010 target="new">At1g55010</A></td>

       <td>NM_104375</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55010 target="new">putative plant defensin gene
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=6><b>Plant defensins: Family 2</b></td>

       <td>PDF2.1</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g02120 target="new">At2g02120</A></td>

       <td>NM_126272</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02120 target="new">putative plant defensin gene
</A></td>

        </tr>
<tr class="alt">

       <td>PDF2.2</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g02100 target="new">At2g02100</A></td>

       <td>NM_126271</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02100 target="new">putative plant defensin gene
</A></td>

        </tr>
<tr class="alt">

       <td>PDF2.3</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g02130 target="new">At2g02130</A></td>

       <td>NM_126273</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02130 target="new">putative plant defensin gene
</A></td>

        </tr>
<tr class="alt">

       <td>PDF2.4</td>

       <td><a href=/servlets/TairObject?type=locus&name=At1g61070 target="new">At1g61070</A></td>

       <td>NM_104778</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g61070 target="new">putative plant defensin gene
</A></td>

        </tr>
<tr class="alt">

       <td>PDF2.5</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g63660 target="new">At5g63660</A></td>

       <td>NM_125761</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g63660 target="new">putative plant defensin gene
</A></td>

        </tr>
<tr class="alt">

       <td>PDF2.6</td>

       <td><a href=/servlets/TairObject?type=locus&name=At2g02140 target="new">At2g02140</A></td>

       <td>NM_126274</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02140 target="new">putative plant defensin gene
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=2><b>Plant defensins: Family 3</b></td>

       <td rowspan=2>&nbsp;</td>

       <td><a href=/servlets/TairObject?type=locus&name=At5g38330 target="new">At5g38330</A></td>

       <td>NM_123194</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g38330 target="new">"putative plant defensin fusion, contains C-terminal plant defensin domain"
</A></td>

        </tr>
<tr class="alt">


       <td><a href=/servlets/TairObject?type=locus&name=At4g30070 target="new">At4g30070</A></td>

       <td>NM_119153</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g30070 target="new">"putative plant defensin fusion, contains C-terminal plant defensin domain"
</A></td>

        </tr>
</table><P>
<center>Last modified on January 16, 2004</center>        

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
