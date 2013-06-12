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
<h2><i>Arabidopsis</i> Strubbelig Receptor Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><A HREF=http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/schneitz.htm>Receptor-mediated cell-cell communication in plants: functional analysis
of the LRR-V/SRF family of putative leucine-rich repeat receptor-like
kinases</a></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>A SUB domain and six LRRs in extracellular domain, kinase domain homology,
possibly unfunctional  kinase domain, short homology just upstream of
kinase domain.</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=5928 target=new>Kay Schneitz</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=9 valign=top><b>Strubbelig Receptor Family</b></td>

       <td>SUB:STRUBBELIG</td>

       <td>T28P6_18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g11130 target="new">At1g11130</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AF399923&doptcmdl=GenBank>AF399923</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11130 target="new">leucine-rich repeat family protein / protein kinase family protein
</A></td>

        </tr>
<tr class="alt">

       <td>SRF1</td>

       <td>F5H14_18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g20850 target="new">At2g20850</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY518286&doptcmdl=GenBank>AY518286</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g20850 target="new">"leucine-rich repeat protein kinase, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>SRF2</td>

       <td>MPH15_19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g06820 target="new">At5g06820</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY518287&doptcmdl=GenBank>AY518287</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g06820 target="new">"leucine-rich repeat transmembrane protein kinase, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>SRF3</td>

       <td>F4C21_35<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g03390 target="new">At4g03390</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY518288&doptcmdl=GenBank>AY518288</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g03390 target="new">"leucine-rich repeat transmembrane protein kinase, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>SRF4</td>

       <td>MGH6_18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g13065 target="new">At3g13065</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY518289&doptcmdl=GenBank>AY518289</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13065 target="new">"leucine-rich repeat transmembrane protein kinase, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>SRF5</td>

       <td>YUP8H12R_44<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g78980 target="new">At1g78980</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY518290&doptcmdl=GenBank>AY518290</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g78980 target="new">"leucine-rich repeat transmembrane protein kinase, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>SRF6</td>

       <td>F22G10_3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g53730 target="new">At1g53730</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY518291&doptcmdl=GenBank>AY518291</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53730 target="new">"leucine-rich repeat transmembrane protein kinase, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>SRF7</td>

       <td>MLN21_13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g14350 target="new">At3g14350</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY518292&doptcmdl=GenBank>AY518292</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g14350 target="new">"leucine-rich repeat transmembrane protein kinase, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>SRF8</td>

       <td>F1N20_230<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g22130 target="new">At4g22130</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AY518293&doptcmdl=GenBank>AY518293</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g22130 target="new">protein kinase family protein
</A></td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified on February 24, 2004</center>        


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
