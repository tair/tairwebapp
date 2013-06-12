<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Single Myb Histone (SMB) Gene Family";
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

<h2>Single Myb Histone (SMH) Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Marian, C.O., Bordoli, S.J., Goltz M., Santarella, R.A., Jackson, L.P.,
Danilevskaya, O., Beckstette, M., Meeley, R., and Bass, H.W. (2003) <a href="http://arabidopsis.org/servlets/TairObject?type=publication&id=501711232">The Maize Single myb histone
1 Gene, Smh1,
Belongs to a Novel Gene Family and Encodes a Protein
That Binds Telomere DNA Repeats in Vitro.</A> Plant Physiology. <b>133</b>:1336-1350<br>
<A HREF=http://bio.fsu.edu/~bass>Hank Bass Lab</a></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Diagnostic triple motif organization: N-terminal myb-like domain, central globular domain of linker histone H1/H5, and C-terminal coiled-coil domain</td></tr>
<TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=3460 target=new>Hank Bass</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=5 valign=top><b>Single Myb Histone (SMH)</b></td>

       <td>TRB1</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT1G49950 target="new">AT1G49950</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=U83624&doptcmdl=GenBank>U83624</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT1G49950 target="new">Arabidopsis thaliana telomere repeat binding factor 1 (TRB1) mRNA</A></td>

        </tr>
<tr class="alt">


       <td>TRB2</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT5G67580 target="new">AT5G67580</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=U83837&doptcmdl=GenBank>U83837</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT5G67580 target="new">Arabidopsis thaliana telomere repeat binding factor 2 (TRB2) mRNA</A></td>

        </tr>
<tr class="alt">

       <td>TRB3</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=AT3G49850 target="new">AT3G49850</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=U83839&doptcmdl=GenBank>U83839</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=AT3G49850 target="new">Arabidopsis thaliana telomere repeat binding factor 3 (TRB3) mRNA</A></td>

        </tr>
<tr class="alt">

       <td>K9I9.15</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g17520 target="new">At1g17520</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=BT005290&doptcmdl=GenBank>BT005290</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g17520 target="new">Arabidopsis thaliana At1g17520 mRNA</A></td>

        </tr>
<tr class="alt">

       <td>At1g72740</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g72740 target="new">At1g72740</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&term=NM_105933&doptcmdl=GenBank>NM_105933</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g72740 target="new">Arabidopsis thaliana DNA-binding protein -related (At1g72740) mRNA</A></td>

        </tr>
</table><P>

<A href=index.jsp>Return to Gene Family Index</A><P>

<center>Last modified on October 14, 2003</center>           

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
