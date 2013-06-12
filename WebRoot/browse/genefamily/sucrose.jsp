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
<h2><i>Arabidopsis</i> Sucrose Transporter Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Williams, L.E., Lemoine, R. Sauer, N. (2000) <a href=http://www.arabidopsis.org/servlets/TairObject?type=publication&id=501711723> Sugar transporters
in higher plants - a diversity of roles and complex regulation.</a> Trends
Plant Sci. 5,283-90.<br>
<a href="http://www.biologie.uni-erlangen.de/mpp/TPer/index_TP.shtml">Arabidopsis sugar transporter homepage</a></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Homology to the functionally characterized sucrose transporters
AtSUC1 and AtSUC2 (more than 40% identical amino acids)</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=4935 target=new>Norbert Sauer</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td><b>Sucrose-H+ symporters</b></td>

       <td>AtSUC1</td>

       <td>F17M19_3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g71880 target="new">At1g71880</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAA53147&doptcmdl=GenPept>CAA53147</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71880 target="new">sucrose-H+ symporter
</A></td>

        </tr>
<tr class="alt"><td><b>Sucrose-H+ symporters</b></td>

       <td>AtSUC2</td>

       <td>T22J18_12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g22710 target="new">At1g22710</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC25515&doptcmdl=GenPept>AAC25515</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g22710 target="new">sucrose-H+ symporter
</A></td>

        </tr>
<tr class="alt"><td><b>Sucrose-H+ symporters</b></td>

       <td>AtSUC3</td>

       <td>T17M13_3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g02860 target="new">At2g02860</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC32907&doptcmdl=GenPept>AAC32907</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g02860 target="new">sucrose-H+ symporter
</A></td>

        </tr>
<tr class="alt"><td><b>Sucrose-H+ symporters</b></td>

       <td>AtSUC4</td>

       <td>F21M12_35<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g09960 target="new">At1g09960</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB92308&doptcmdl=GenPept>CAB92308</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g09960 target="new">sucrose-H+ symporter
</A></td>

        </tr>
<tr class="alt"><td><b>Sucrose-H+ symporters</b></td>

       <td>AtSUC5</td>

       <td>F17M19_4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g71890 target="new">At1g71890</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG27852&doptcmdl=GenPept>AAG27852</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g71890 target="new">sucrose-H+ symporter
</A></td>

        </tr>
<tr class="alt"><td><b>Sucrose-H+ symporters</b></td>

       <td>AtSUC6</td>

       <td>K9D7_11<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g43610 target="new">At5g43610</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB11624&doptcmdl=GenPept>BAB11624</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g43610 target="new">sucrose transporter-like protein (non-functional ?)
</A></td>

        </tr>
<tr class="alt"><td><b>Sucrose-H+ symporters</b></td>

       <td>AtSUC7</td>

       <td>T12I7_2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g66570 target="new">At1g66570</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG27852&doptcmdl=GenPept>AAG27852</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g66570 target="new">sucrose transporter-like protein (non-functional ?)
</A></td>

        </tr>
<tr class="alt"><td><b>Sucrose-H+ symporters</b></td>

       <td>AtSUC8</td>

       <td>T6B13_9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g14670 target="new">At2g14670</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC69375&doptcmdl=GenPept>AAC69375</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g14670 target="new">sucrose-H+ symporter
</A></td>

        </tr>
<tr class="alt"><td><b>Sucrose-H+ symporters</b></td>

       <td>AtSUC9</td>

       <td>MBL20_5<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g06170 target="new">At5g06170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB09682&doptcmdl=GenPept>BAB09682</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g06170 target="new">sucrose-H+ symporter
</A></td>

        </tr>
</table><P>

<A href=index.jsp>Return to Gene Family Index</A><P>

<center>Last modified on January 16, 2004</center>         


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
