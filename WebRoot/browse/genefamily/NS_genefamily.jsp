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
<h2>Nicotianamine Synthase Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD><A HREF=http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/bauer.htm>AFGN - Nicotianamine Metabolism and Transport</A></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Gene family was based on sequence homology and phylogenetic analyses</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=11323 target=new>Petra Bauer</A><BR>
    <a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=5501 target=new>Rudiger Hell</td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr bgcolor=#D5D9DD><td rowspan=4 valign=top><b>Nicotianamine Synthase</b></td>

       <td>AtNAS1a</td>

       <td>T12M4<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g09240 target="new">At1g09240</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AC003114&doptcmdl=GenBank>AC003114</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09240 target="new">"synthesizes the metal chelator nicotianamine from 3 SAM, enzyme code 2.5.1.43"
</A></td>

        </tr>
<tr bgcolor=#D5D9DD>

       <td>AtNAS1b</td>

       <td>F13N6<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g56430 target="new">At1g56430</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=AC058785&doptcmdl=GenBank>AC058785</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g56430 target="new">"synthesizes the metal chelator nicotianamine from 3 SAM, enzyme code 2.5.1.43"
</A></td>

        </tr>
<tr bgcolor=#D5D9DD>

       <td>AtNAS5a</td>

       <td>MUG13<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g04950 target="new">At5g04950</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAA74589.1&doptcmdl=GenPept>BAA74589.1</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g04950 target="new">"synthesizes the metal chelator nicotianamine from 3 SAM, enzyme code 2.5.1.43"
</A></td>

        </tr>
<tr bgcolor=#D5D9DD>

       <td>AtNAS5b</td>

       <td>MDA7<BR><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g56080 target="new">At5g56080</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=&doptcmdl=GenPept></A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g56080 target="new">"synthesizes the metal chelator nicotianamine from 3 SAM, enzyme code 2.5.1.43"
</A></td>

        </tr>

</table><P>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>