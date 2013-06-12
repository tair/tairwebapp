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
<h2><i>Arabidopsis</i> Aldehyde Dehydrogenase Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Sunkar R, Bartels D, Kirch HH. (2003) <A HREF="/servlets/TairObject?type=publication&id=501710181">Overexpression of a stress-inducible
aldehyde dehydrogenase gene from Arabidopsis thaliana in transgenic plants
improves stress tolerance.</a> Plant J. 35:452-64.<Br>
Skibbe DS, Liu F, Wen TJ, Yandeau MD, Cui X, Cao J, Simmons CR, Schnable
PS. (2002)<A HREF="/servlets/TairObject?type=publication&id=501682094"> Characterization of the aldehyde dehydrogenase gene families of
Zea mays and Arabidopsis.</a> Plant Mol Biol. 48:751-64.<br>
Kirch HH, Nair A, Bartels D. (2001)<A HREF="/servlets/TairObject?type=publication&id=501681944"> Novel ABA- and dehydration-inducible
aldehyde dehydrogenase genes isolated from the resurrection plant
Craterostigma plantagineum and Arabidopsis thaliana. </a>Plant J. 28:555-67.<br>
Vasiliou, V., Bairoch, A., Tipton, K.F. and Nebert, D.W. (1999).
Eucaryotic aldehyde dehydrogenase (ALDH) genes: human polymorphisms, and
recommended nomenclature based on divergent evolution and chromosomal
mapping. Pharmacogenet. 9, 421-434<br>
<a href="http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/bartels.htm">Functional characterization of the A. thaliana Aldehyde Dehydrogenase gene
family</a><br>
<a href="http://www.uchsc.edu/sp/sp/alcdbase/aldhcov.html">The Aldehyde Dehydrogenase Gene Superfamily Database</a>
</td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>phylogenetic analysis;protein sequence conservation</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=5166 target=new>Dorothea Bartels</A><BR>
<a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=210609 target=new>Hans-Hubert Kirch</A>
</td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td rowspan=3 valign=top><b>Family 2: class-1/2 ALDHs</b></td>

       <td>ALDH2C4</td>

       <td>MOB24_3<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g24503 target="new">At3g24503</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM27004&doptcmdl=GenPept>AAM27004</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g24503 target="new">aldehyde dehydrogenase (ALDH1a)
</A></td>

        </tr>
<tr class="alt">

       <td>ALDH2B4</td>

       <td>T17F15_130<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g48000 target="new">At3g48000</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM27003&doptcmdl=GenPept>AAM27003</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g48000 target="new">aldehyde dehydrogenase (ALDH2)
</A></td>

        </tr>
<tr class="alt">

       <td>ALDH2B3</td>

       <td>F5O8_33<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g23800 target="new">At1g23800</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL99612&doptcmdl=GenPept>AAL99612</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g23800 target="new">"aldehyde dehydrogenase, mitochondrial (ALDH3)"
</A></td>

        </tr>
<tr class="alt"><td rowspan=3 valign=top><b>Family 3: class-3 ALDHs</b></td>

       <td>ALDH3I1</td>

       <td>F10M10_10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g34240 target="new">At4g34240</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC84903&doptcmdl=GenPept>CAC84903</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g34240 target="new">aldehyde dehydrogenase (ALDH3)
</A></td>

        </tr>
<tr class="alt">

       <td>ALDH3H1</td>

       <td>T7O23_15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g44170 target="new">At1g44170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAL59944&doptcmdl=GenPept>AAL59944</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g44170 target="new">"aldehyde dehydrogenase, putative (ALDH)"
</A></td>

        </tr>
<tr class="alt">

       <td>ALDH3F1</td>

       <td>F23E13_140<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g36250 target="new">At4g36250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAE48163&doptcmdl=GenPept>CAE48163</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g36250 target="new">aldehyde dehydrogenase family protein
</A></td>

        </tr>
<tr class="alt"><td><b>Family 5: succinic semialdehyde dehydrogenases (SS-ALDH))</b></td>

       <td>ALDH5F1</td>

       <td>T8K14_14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g79440 target="new">At1g79440</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF23590&doptcmdl=GenPept>AAF23590</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79440 target="new">succinate-semialdehyde dehydrogenase (SSADH1)
</A></td>

        </tr>
<tr class="alt"><td><b>Family 6: methylmalonate semialdehyde dehydrogenases (MMS-ALDH))</b></td>

       <td>ALDH6B2</td>

       <td>F15N24_6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g14170 target="new">At2g14170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD25855&doptcmdl=GenPept>AAD25855</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g14170 target="new">"methylmalonate-semialdehyde dehydrogenase, putative"
</A></td>

        </tr>
<tr class="alt"><td><b>Family 7: antiquitin-related/turgor-ALDHs</b></td>

       <td>ALDH7B4</td>

       <td>F15I1_19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g54100 target="new">At1g54100</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAE48164&doptcmdl=GenPept>CAE48164</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54100 target="new">"aldehyde dehydrogenase, putative / antiquitin, putative"
</A></td>

        </tr>
<tr class="alt"><td rowspan=2 valign=top><b>Family 10: betaine aldehyde dehydrogenases (BADH)</b></td>

       <td>ALDH10A8</td>

       <td>F9E10_23<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g74920 target="new">At1g74920</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAM13070&doptcmdl=GenPept>AAM13070</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g74920 target="new">"betaine-aldehyde dehydrogenase, putative"
</A></td>

        </tr>
<tr class="alt">

       <td>ALDH10A9</td>

       <td>T24C20_50<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g48170 target="new">At3g48170</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK44148&doptcmdl=GenPept>AAK44148</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g48170 target="new">"betaine-aldehyde dehydrogenase, putative"
</A></td>

        </tr>
<tr class="alt"><td><b>Family 11: NADP-dependent non-phosphorylating glyceraldehyde-3-phosphate dehydrogenases (GAPDH)</b></td>

       <td>ALDH11A3</td>

       <td>f27d4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g24270 target="new">At2g24270</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK59790&doptcmdl=GenPept>AAK59790</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g24270 target="new">"NADP-dependent glyceraldehyde-3-phosphate dehydrogenase, putative"
</A></td>

        </tr>
<tr class="alt"><td><b>Family 12: Delta1-pyrroline-5-carboxylate dehydrogenases (P5CDH)</b></td>

       <td>ALDH12A1</td>

       <td>K19B1_14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g62530 target="new">At5g62530</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK73756&doptcmdl=GenPept>AAK73756</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g62530 target="new">delta-1-pyrroline-5-carboxylate dehydrogenase (P5CDH)
</A></td>

        </tr>
<tr class="alt"><td><b>Family 22: novel plant ALDH family</b></td>

       <td>ALDH22A1</td>

       <td>T8E24_4<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g66658 target="new">At3g66658</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAE48165&doptcmdl=GenPept>CAE48165</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g66658 target="new">"betaine-aldehyde dehydrogenase, putative"
</A></td>

        </tr>
</table><P>

<center>Last modified on February 12, 2004</center>         


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
