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
<h2><i>Arabidopsis</i> SBP-box Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Cardon G, Hohmann S, Klein J, Nettesheim K, Saedler H, Huijser P. (1999)
<A HREF="http://arabidopsis.org/servlets/TairObject?type=publication&id=1087">Molecular characterisation of the Arabidopsis SBP-box genes</A> Gene 237:91-104<BR>
<A HREF="http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/Huijser.htm">Functional analysis of the SBP-domain protein family in Arabidopsis thaliana</a>
</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Defined by the presence of the DNA-binding SBP domain (Pfam profile PF03110)</td></tr>
<TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=1435 target=new>Peter Huijser</A></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B><BR>
          Alternate Name:</TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=17 valign=top><b>SBP-box family of putative plant transcription factors</b></td>

       <td>AtSPL1<br>
            </td>

       <td>F14M4_9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g47070 target="new">At2g47070</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_850468&doptcmdl=GenPept>NP_850468</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g47070 target="new">squamosa promoter-binding protein-like 1 (SPL1)</A></td>

        </tr>
<tr class="alt">

       <td>AtSPL2<br>
            </td>

       <td>MNL12_9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g43270 target="new">At5g43270</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_851122&doptcmdl=GenPept>NP_851122</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g43270 target="new">squamosa promoter binding protein-like 2 (SPL2)</A></td>

        </tr>
<tr class="alt">

       <td>AtSPL3<br>
            </td>

       <td>T1B8_11<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g33810 target="new">At2g33810</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_565771&doptcmdl=GenPept>NP_565771</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g33810 target="new">squamosa promoter binding protein-like 3 (SPL3)</A></td>

        </tr>
<tr class="alt">

       <td>AtSPL4<br>
            </td>

       <td>F12M16_2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g53160 target="new">At1g53160</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_175723&doptcmdl=GenPept>NP_175723</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g53160 target="new">squamosa promoter-binding protein-like 4 (SPL4)</A></td>

        </tr>
<tr class="alt">

       <td>AtSPL5<br>
            </td>

       <td>K7L4_7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g15270 target="new">At3g15270</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_188145&doptcmdl=GenPept>NP_188145</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g15270 target="new">squamosa promoter binding protein-like 5 (SPL5)</A></td>

        </tr>
<tr class="alt">

       <td>AtSPL6<br>
            </td>

       <td>F23O10_24<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g69170 target="new">At1g69170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_177077&doptcmdl=GenPept>NP_177077</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g69170 target="new">squamosa promoter binding protein-like 6 (SPL6)</A></td>

        </tr>
<tr class="alt">

       <td>AtSPL7<br>
            </td>

       <td>F17K4_80<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g18830 target="new">At5g18830</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_850850&doptcmdl=GenPept>NP_850850</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g18830 target="new">squamosa promoter binding protein-like 7 (SPL7)</A></td>

        </tr>
<tr class="alt">

       <td>AtSPL8<br>
            </td>

       <td>T7I23_32<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g02065 target="new">At1g02065</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_683267&doptcmdl=GenPept>NP_683267</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g02065 target="new">squamosa promoter-binding protein-like 8 (SPL8)</A></td>

        </tr>
<tr class="alt">

       <td>AtSPL9<br>
            </td>

       <td>T24P15_11<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g42200 target="new">At2g42200</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_850365&doptcmdl=GenPept>NP_850365</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g42200 target="new">squamosa promoter binding protein-like 9 (SPL9) </A></td>

        </tr>
<tr class="alt">

       <td>AtSPL10<br>
            </td>

       <td>F17L21_15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g27370 target="new">At1g27370</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_174057&doptcmdl=GenPept>NP_174057</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27370 target="new">squamosa promoter binding protein-like 10 (SPL10)</A></td>

        </tr>
<tr class="alt">

       <td>AtSPL11<br>
            </td>

       <td>F17L21_14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g27360 target="new">At1g27360</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_564280&doptcmdl=GenPept>NP_564280</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g27360 target="new">squamosa promoter binding protein-like 11 (SPL11)</A></td>

        </tr>
<tr class="alt">

       <td>AtSPL12<br>
            </td>

       <td>T2O9_10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g60030 target="new">At3g60030</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_191562&doptcmdl=GenPept>NP_191562</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g60030 target="new">squamosa promoter binding protein-like 12 (SPL12)</A></td>

        </tr>
<tr class="alt">

       <td>AtSPL13A<br>
            </td>

       <td>MBA10_13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g50570 target="new">At5g50570</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_851161&doptcmdl=GenPept>NP_851161</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g50570 target="new">"squamosa promoter-binding protein, putative"</A></td>

        </tr>
<tr class="alt">

<td>AtSPL13B<br>
            </td>

       <td>MFB16_6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g50670 target="new">At5g50670</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_851161&doptcmdl=GenPept>NP_851161</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g50570 target="new">"squamosa promoter-binding protein, putative"</A></td>

        </tr>
<tr class="alt">


       <td>AtSPL14<br>
           SPL1-Related2</td>

       <td>F9H16_3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g20980 target="new">At1g20980</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_173522&doptcmdl=GenPept>NP_173522</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20980 target="new">SPL1-Related2 protein (SPL1R2)</A></td>

        </tr>
<tr class="alt">

       <td>AtSPL15<br>
            </td>

       <td>T10K17_130<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g57920 target="new">At3g57920</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_191351&doptcmdl=GenPept>NP_191351</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g57920 target="new">"squamosa promoter-binding protein, putative"</A></td>

        </tr>
<tr class="alt">

       <td>AtSPL16<br>
           SPL1-Related3</td>

       <td>F14G6_18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g76580 target="new">At1g76580</A></td>


       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_177784&doptcmdl=GenPept>NP_177784</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g76580 target="new">SPL1-Related3 protein (SPL1R3)</A></td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified April 5, 2004</center>   


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
