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
                <td width="602"><TR><TD><h2><i>Arabidopsis</i> FtsH Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Adam, Z., Adamska, I., Nakabayashi, K., Ostersetzer, O., Haussuhl,
K., Manuell, A., Zheng, B., Vallon, O., Rodermel, S. R., Shinozaki, K.,
Clarke, A. K. (2001)<A HREF="/servlets/TairObject?type=publication&id=501679453">Chloroplast and mitochondrial proteases in arabidopsis. A proposed
nomenclature.</a> Plant Physiol. 125. 1912-8<br>
Sakamoto, W., Zaltsman, A., Adam, Z., Takahashi, Y. (2003) <a href="http://arabidopsis.org/servlets/TairObject?type=publication&id=501711388">Coordinated
regulation and complex formation of yellow variegated1 and yellow
variegated2, chloroplastic FtsH metalloproteases involved in the repair
cycle of photosystem II in Arabidopsis thylakoid membranes.</a> Plant
Cell. 15. 2843-55</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Summary:</B></TD>
<td>FtsH is  a membrane-bound
metalloprotease that is characterized by an ATPase domain (AAA motif) and
a zinc-binding domain, His-Glu-X-X-His, that serves the catalytic
function. Biochemical activities of FtsH proteases include degradation of
unassembled or oxidatively damaged membrane proteins.</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=1012567 target=new>Adi Zaltsman</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH>
<!--<B>BAC Locus:</B><BR>
-->
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>Alternate Name:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=12 valign=top><b>FtsH protein family</b></td>

       <td>FtsH1</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g50250 target="new">At1g50250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD50055&doptcmdl=GenPept>AAD50055</A><br></td>

<td>&nbsp;</td>
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g50250 target="new">Arabidopsis thaliana chloroplast FtsH protease 
</A></td>

        </tr>
<tr class="alt">

       <td>FtsH2</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g30950 target="new">At2g30950</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF65925&doptcmdl=GenPept>AAF65925</A><br></td>

       <td>VAR II</td>
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g30950 target="new">VarII FtsH2 Z dependent protease
</A></td>

        </tr>
<tr class="alt">

       <td>FtsH3</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g29080 target="new">At2g29080</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC33234&doptcmdl=GenPept>AAC33234</A><br></td>

<td>&nbsp;</td>
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g29080 target="new">putative  AAA-type  ATPase
</A></td>

        </tr>
<tr class="alt">

       <td>FtsH4</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g26140 target="new">At2g26140</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC31223&doptcmdl=GenPept>AAC31223</A><br></td>

<td>&nbsp;</td>
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g26140 target="new">Arabidopsis thaliana At2g26140 mRNA sequence
</A></td>

        </tr>
<tr class="alt">

       <td>FtsH5</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g42270 target="new">At5g42270</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB10200&doptcmdl=GenPept>BAB10200</A><br></td>

       <td>VAR I </td>
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g42270 target="new">VarI FtsH5 Z depandent protease
</A></td>

        </tr>
<tr class="alt">

       <td>FtsH6</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g15250 target="new">At5g15250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB89335&doptcmdl=GenPept>CAB89335</A><br></td>

<td>&nbsp;</td>
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g15250 target="new">putative  AAA-type  ATPase
</A></td>

        </tr>
<tr class="alt">

       <td>FtsH7</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g47060 target="new">At3g47060</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB61952&doptcmdl=GenPept>CAB61952</A><br></td>

<td>&nbsp;</td>
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g47060 target="new">putative  AAA-type  ATPase
</A></td>

        </tr>
<tr class="alt">

       <td>FtsH8</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g06430 target="new">At1g06430</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL31897&doptcmdl=GenPept>AAL31897</A><br></td>

<td>&nbsp;</td>
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g06430 target="new">FtsH  AAA ATP and  Z dependent protease 
</A></td>

        </tr>
<tr class="alt">

       <td>FtsH9</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g58870 target="new">At5g58870</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL24338&doptcmdl=GenPept>AAL24338</A><br></td>

<td>&nbsp;</td>
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g58870 target="new">putative  AAA-type  ATPase
</A></td>

        </tr>
<tr class="alt">

       <td>FtsH10</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g07510 target="new">At1g07510</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF79577&doptcmdl=GenPept>AAF79577</A><br></td>

<td>&nbsp;</td>
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07510 target="new">putative  AAA-type  ATPase
</A></td>

        </tr>
<tr class="alt">

       <td>FtsH11</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g53170 target="new">At5g53170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM13906&doptcmdl=GenPept>AAM13906</A><br></td>

<td>&nbsp;</td>
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g53170 target="new">putative  AAA-type  ATPase
</A></td>

        </tr>
<tr class="alt">

       <td>FtsH12</td>

       <td><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g79560 target="new">At1g79560</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD30220&doptcmdl=GenPept>AAD3022</A><br></td>

<td>&nbsp;</td>
       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79560 target="new">putative  AAA-type  ATPase
</A></td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>

<center>Last modified on January 9, 2004</center>                </td>
        </tr>
</TABLE>



<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
