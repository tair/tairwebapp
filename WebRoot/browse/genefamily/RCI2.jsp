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
<h2>RCI2 Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Capel J, Jarillo JA, Salinas J, Martinez-Zapater JM  (1997) <a href="/servlets/TairObject?type=publication&id=3029">Two homologous
low-temperature-inducible genes from Arabidopsis encode highly hydrophobic
proteins</a>. Plant Physiol Oct;115(2):569-76.<br>
Medina J, Catala R, Salinas J (2001) <a href="/servlets/TairObject?type=publication&id=501679459">Developmental and stress regulation
of RCI2A and RCI2B, two cold-inducible genes of arabidopsis encoding
highly conserved hydrophobic proteins</a>. Plant Physiol. Apr;125(4):1655-66.<br>
Medina J, Jare&ntilde;o ML, Salinas J Molecular characterization and functional
analysis of RCI2, a novel Arabidopsis gene family involved in abiotic
stress responses (not yet published).
</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Sequence homology Phylogenetic analyses</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://www.arabidopsis.org/servlets/Community?action=view&type=person&communityID=5454 target=new>Julio Salinas</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH>
       <B>BAC Locus:</B><BR>

       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=8 valign=top><b>RCI2 gene Family</b></td>

       <td>RCI2A</td>

       <td>F10A16<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G05880 target="new">AT3G05880</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD17302&doptcmdl=GenPept>AAD17302</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G05880 target="new">hydrophobic protein 
</A></td>

        </tr>
<tr class="alt">

       <td>RCI2B</td>

       <td>F10A16<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G05890 target="new">AT3G05890</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD17303&doptcmdl=GenPept>AAD17303</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G05890 target="new">hydrophobic protein
</A></td>

        </tr>
<tr class="alt">

       <td>RCI2C</td>

       <td>F25P12<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G57550 target="new">AT1G57550</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_176067&doptcmdl=GenPept>NP_176067</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G57550 target="new">Low-temperature-specific protein-related
</A></td>

        </tr>
<tr class="alt">

       <td>RCI2D</td>

       <td>T29E15<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G24040 target="new">AT2G24040</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_179982&doptcmdl=GenPept>NP_179982</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G24040 target="new">Expressed protein.
</A></td>

        </tr>
<tr class="alt">

       <td>RCI2E</td>

       <td>F17I23<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4G30650 target="new">AT4G30650</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_194794&doptcmdl=GenPept>NP_194794</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G30650 target="new">Low temperature and salt responsive protein homolog
</A></td>

        </tr>
<tr class="alt">

       <td>RCI2F</td>

       <td>T10C21<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4G30660 target="new">AT4G30660</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_194795&doptcmdl=GenPept>NP_194795</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G30660 target="new">Stress responsive protein homolog
</A></td>

        </tr>
<tr class="alt">

       <td>RCI2G</td>

       <td>T13J8<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT4G28088 target="new">AT4G28088</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=&doptcmdl=GenPept></A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT4G28088 target="new">
</A></td>

        </tr>
<tr class="alt">

       <td>RCI2H</td>

       <td>T7F6<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT2G38905 target="new">AT2G38905</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_565897&doptcmdl=GenPept>NP_565897</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT2G38905 target="new">Expressed protein
</A></td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified on July 20, 2004</center>         


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
