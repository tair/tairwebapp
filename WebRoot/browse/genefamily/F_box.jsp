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
<table width="602" align=center border=0 cellspacing=0 cellpadding=2>
        <tr>
                <td width="602"><TR><TD><h2><i>Arabidopsis</i> F-Box Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Gagne JM, Downes BP, Shiu SH, Durski AM, Vierstra RD.<A HREF='http://arabidopsis.org/servlets/TairObject?type=publication&id=501681836'>The F-box subunit of
the SCF E3 complex is encoded by a diverse
superfamily of genes in Arabidopsis.</A><br>Proc Natl Acad Sci U S A. 2002 Aug
20;99(17):11519-24.</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Contains F-box domain and leucine-rich repeat domain</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=507 target=new>Claus Schwechheimer</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=4 valign=top><b>F-Box Protein Subfamily</b></td>

       <td>FBP At1</td>

       <td>F2G19_16<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g47056 target="new">At1g47056</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG50633&doptcmdl=GenPept>AAG50633</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g47056 target="new">"F-box family protein, similar to SKP1 interacting partner 2 (SKP2) TIGR_Ath1:At5g67250."
</A></td>

        </tr>
<tr class="alt">

       <td>FBP At3</td>

       <td>F3A4_160<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g50080 target="new">At3g50080</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_566928&doptcmdl=GenPept>NP_566928</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g50080 target="new">"F-box family protein (FBL16), contains similarity to SKP1 interacting partner 2 GI:10716949 from [Arabidopsis thaliana], contains pFam profile: PF00646 F-box domain"
</A></td>

        </tr>
<tr class="alt">

       <td>FBP At4</td>

       <td>F28D6_13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g07400 target="new">At4g07400</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD48947&doptcmdl=GenPept>AAD48947</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g07400 target="new">"F-box protein (FBL8) (FBL24), containss similarity to SKP1 interacting partner 2 GI:10716949 [Arabidopsis thaliana]; contains Pfam PF00646: F-box domain"
</A></td>

        </tr>
<tr class="alt">

       <td>FBP At5</td>

       <td>K21H1_6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g67250 target="new">At5g67250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG21977&doptcmdl=GenPept>AAG21977</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g67250 target="new">SKP1 interacting partner 2 (SKP2)
</A></td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified on January 12, 2004</center>          

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
