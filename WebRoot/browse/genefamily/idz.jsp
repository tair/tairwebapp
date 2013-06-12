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
<h2><i>Arabidopsis</i> IDZ Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Haasen D, Kohler C, Neuhaus G, Merkle T. (1999) <a href="/servlets/TairObject?type=publication&id=778">Nuclear export of
proteins
in plants: AtXPO1 is the export receptor for
leucine-rich nuclear export signals in Arabidopsis thaliana.</a>
Plant Journal 20:695-705<br>Merkle T. (2001) <a href="/servlets/TairObject?type=publication&id=1546289">Nuclear import and export of proteins in plants: a tool
for the
regulation of signalling.</a>
Planta. 213:499-517<br><a href="http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/merkle.htm">Functional analysis of the Arabidopsis IDZ family of zinc finger proteins</a></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Defined by the presence of a C2H2 zinc finger motif, followed by a second
motif with a CCHC signature, and by high sequence similarity with the
maize ID1 protein in the zinc finger domains and in the adjacent regions;
different to the WIP zinc finger protein family that shares the same zinc
finger motifs</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=1827 target=new>Thomas Merkle</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=11 valign=top><b>INDETERMINATE1-like zinc finger protein IDZ family</b></td>

       <td>AtIDZ1</td>

       <td>F18N11_20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g45260 target="new">At3g45260</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAF18562&doptcmdl=GenPept>CAF18562</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g45260 target="new">zinc finger (C2H2 type) family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtIDZ2</td>

       <td>F5O4_16<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g02070 target="new">At2g02070</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAF18564&doptcmdl=GenPept>CAF18564</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02070 target="new">zinc finger (C2H2 type) family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtIDZ3</td>

       <td>F15A17_180<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g03150 target="new">At5g03150</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAF18563&doptcmdl=GenPept>CAF18563</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g03150 target="new">zinc finger (C2H2 type) family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtIDZ4</td>

       <td>F21M11_25<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g03840 target="new">At1g03840</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAP12858&doptcmdl=GenPept>AAP12858</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g03840 target="new">zinc finger (C2H2 type) family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtIDZ5</td>

       <td>MLN1_8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g44160 target="new">At5g44160</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK59787&doptcmdl=GenPept>AAK59787</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g44160 target="new">zinc finger (C2H2 type) family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtIDZ6</td>

       <td>T3A5_80<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g50700 target="new">At3g50700</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB62439&doptcmdl=GenPept>CAB62439</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g50700 target="new">zinc finger (C2H2 type) family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtIDZ7</td>

       <td>MSN2_12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g66730 target="new">At5g66730</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM20710&doptcmdl=GenPept>AAM20710</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g66730 target="new">zinc finger (C2H2 type) family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtIDZ8</td>

       <td>T10P11_4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g02670 target="new">At4g02670</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC78253&doptcmdl=GenPept>AAC78253</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g02670 target="new">zinc finger (C2H2 type) family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtIDZ9</td>

       <td>MCP4_2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g13810 target="new">At3g13810</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK32810&doptcmdl=GenPept>AAK32810</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g13810 target="new">zinc finger (C2H2 type) family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtIDZ10</td>

       <td>T7N22_5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g55110 target="new">At1g55110</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM14021&doptcmdl=GenPept>AAM14021</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g55110 target="new">zinc finger (C2H2 type) family protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtIDZ11</td>

       <td>MUF9_10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g60470 target="new">At5g60470</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB08230&doptcmdl=GenPept>BAB08230</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g60470 target="new">zinc finger (C2H2 type) family protein
</A></td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified on February 6, 2004</center>  



<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
