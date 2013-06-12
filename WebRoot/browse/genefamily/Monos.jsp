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
<h2><i>Arabidopsis</i> Monosaccharide Transporter(-like) Gene Family</h2>
<table border=0 cellspacing=0 cellpadding=2>
<TR><TD valign=top><B>Source:</B></TD>
<TD>Buettner, M., Sauer, N. (2000) <A HREF=http://www.arabidopsis.org/servlets/TairObject?type=publication&id=501711724>Monosaccharide transporters in
plants: structure, function and physiology.</A> Biochim. Biophys. Acta. 1465,
263-274.<br>
Williams, L.E., Lemoine, R. Sauer, N. (2000) <a href=http://www.arabidopsis.org/servlets/TairObject?type=publication&id=501711723> Sugar transporters
in higher plants - a diversity of roles and complex regulation.</a> Trends
Plant Sci. 5,283-90.<br>
<a href="http://www.biologie.uni-erlangen.de/mpp/TPer/index_TP.shtml">Arabidopsis sugar transporter homepage</a></td></tr>
<tr><TD valign=top><B>Gene Family<BR>Criteria:</B></TD>
<td>Homology to the functionally characterized monosaccharide-H+
symporters of the AtSTP family and homology to sugar transporters from
other organisms (bacteria, mammals etc.)</td></tr><TR><TD valign=top><B>Contact:</b></td>
<td><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=4935 target=new>Norbert Sauer</A><br><a href=http://arabidopsis.org/servlets/Community?action=view&type=person&communityID=560 target=new>Michael Buettner</a></td></tr></table><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2"><TR><TH><B>Gene Family<BR>Name:</B></TH>

   <TH><B>Protein Name:</B></TH>

   <TH><B>BAC Locus:</B><BR>
       <B>Genomic Locus:</TH>

   <TH><B>Accession:</B></TH>

   <TH><B>TIGR Annotation<br>Comment:</B></TH>

         </TR>

<tr class="alt"><td valign=top rowspan=14><b>Monosaccharide (hexoses / pentoses)-H+ symporter family (plasma membrane)</b></td>

       <td>AtSTP1</td>

       <td>T28P6_18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g11260 target="new">At1g11260</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD49995&doptcmdl=GenPept>AAD49995</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g11260 target="new">"monosaccharide-H+ symporter, STP1"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSTP2</td>

       <td>F22G5_32<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g07340 target="new">At1g07340</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=18390756>NM_100608</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g07340 target="new">"monosaccharide-H+ symporter, STP2"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSTP3</td>

       <td>K11J9_8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g61520 target="new">At5g61520</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAA05384&doptcmdl=GenPept>CAA05384</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g61520 target="new">"monosaccharide-H+ symporter, STP3"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSTP4</td>

       <td>MPN9_19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g19930 target="new">At3g19930</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=30685559>NM_112883</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g19930 target="new">"monosaccharide-H+ symporter, STP4"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSTP5</td>

       <td>F12K21_8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g34580 target="new">At1g34580</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF79273&doptcmdl=GenPept>AAF79273</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g34580 target="new">"monosaccharide-H+ symporter, STP5"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSTP6</td>

       <td>F2O10_8<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g05960 target="new">At3g05960</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF23220&doptcmdl=GenPept>AAF23220</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05960 target="new">"monosaccharide-H+ symporter, STP6"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSTP7</td>

       <td>T10M13_6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g02050 target="new">At4g02050</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB80698&doptcmdl=GenPept>CAB80698</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g02050 target="new">"monosaccharide-H+ symporter, STP7 "
</A></td>

        </tr>
<tr class="alt">

       <td>AtSTP8</td>

       <td>T19G15_100<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g26250 target="new">At5g26250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC69068&doptcmdl=GenPept>CAC69068</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g26250 target="new">"monosaccharide-H+ symporter, STP8"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSTP9</td>

       <td>F14I3_20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g50310 target="new">At1g50310</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC69072&doptcmdl=GenPept>CAC69072</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g50310 target="new">"monosaccharide-H+ transporter, STP9"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSTP10</td>

       <td>MPN9_18<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g19940 target="new">At3g19940</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=18402423>NM_112884</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g19940 target="new">"monosaccharide-H+ transporter, STP10"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSTP11</td>

       <td>MKD15_13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g23270 target="new">At5g23270</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC69075&doptcmdl=GenPept>CAC69075</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g23270 target="new">"monosaccharide-H+ symporter, STP11"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSTP12</td>

       <td>F18E5_100<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g21480 target="new">At4g21480</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC69069&doptcmdl=GenPept>CAC69069</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g21480 target="new">"monosaccharide-H+ symporter, STP12"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSTP13</td>

       <td>F9D12_17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g26340 target="new">At5g26340</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC69074&doptcmdl=GenPept>CAC69074</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g26340 target="new">"monosaccharide-H+ symporter, STP13"
</A></td>

        </tr>
<tr class="alt">

       <td>AtSTP14</td>

       <td>T14N5_7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g77210 target="new">At1g77210</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC69070&doptcmdl=GenPept>CAC69070</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g77210 target="new">"monosaccharide-H+ symporter, STP14"
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=6><b>H+-Symporter family for polyols and monosaccharides (plasma membrane)</b></td>

       <td>AtPLT1</td>

       <td>F7H1_14<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g16120 target="new">At2g16120</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD26954&doptcmdl=GenPept>AAD26954</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16120 target="new">polyol and monosaccharide H+ symporter PLT1
</A></td>

        </tr>
<tr class="alt">

       <td>AtPLT2</td>

       <td>F7H1_15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g16130 target="new">At2g16130</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD26955&doptcmdl=GenPept>AAD26955</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g16130 target="new">polyol and monosaccharide H+ symporter PLT2
</A></td>

        </tr>
<tr class="alt">

       <td>AtPLT3</td>

       <td>F24H14_17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g18480 target="new">At2g18480</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD12218&doptcmdl=GenPept>AAD12218</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g18480 target="new">polyol and monosaccharide H+ symporter PLT3
</A></td>

        </tr>
<tr class="alt">

       <td>AtPLT4</td>

       <td>F5H14_25<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g20780 target="new">At2g20780</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD20917&doptcmdl=GenPept>AAD20917</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g20780 target="new">polyol and monosaccharide H+ symporter PLT4
</A></td>

        </tr>
<tr class="alt">

       <td>AtPLT5</td>

       <td>MVE11_22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g18830 target="new">At3g18830</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB01812&doptcmdl=GenPept>BAB01812</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g18830 target="new">polyol and monosaccharide H+ symporter PLT5
</A></td>

        </tr>
<tr class="alt">

       <td>AtPLT6</td>

       <td>C7A10_690<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g36670 target="new">At4g36670</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB80333&doptcmdl=GenPept>CAB80333</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g36670 target="new">polyol and monosaccharide H+ symporter PLT6</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=4><b>Putative polyol (cyclic)-H+ symporter family (tonoplast membrane ?)</b></td>

       <td>AtINT1</td>

       <td>T1O24_7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g43330 target="new">At2g43330</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAB64332&doptcmdl=GenPept>AAB64332</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g43330 target="new">putative polyol (cyclic) transporter
</A></td>

        </tr>
<tr class="alt">

       <td>AtINT2</td>

       <td>F12P21_2<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g30220 target="new">At1g30220</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB10424&doptcmdl=GenPept>CAB10424</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g30220 target="new">putative polyol (cyclic) transporter
</A></td>

        </tr>
<tr class="alt">

       <td>AtINT3</td>

       <td>T20F21_7<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g35740 target="new">At2g35740</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD15441&doptcmdl=GenPept>AAD15441</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g35740 target="new">putative polyol (cyclic) transporter 
</A></td>

        </tr>
<tr class="alt">

       <td>AtINT4</td>

       <td>FCAALL_375<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g16480 target="new">At4g16480</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB78690&doptcmdl=GenPept>CAB78690</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g16480 target="new">putative polyol (cyclic) transporter
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>Putative monosaccharide transporter family (homology to bacterial xylose transporters)</b></td>

       <td>&nbsp;</td>

       <td>T17B22_22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g03090 target="new">At3g03090</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF26115&doptcmdl=GenPept>AAF26115</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g03090 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F2K13_160<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g17010 target="new">At5g17010</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC01714&doptcmdl=GenPept>CAC01714</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g17010 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>MNC17_140<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g59250 target="new">At5g59250</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB09770&doptcmdl=GenPept>BAB09770</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g59250 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=3><b>Putative monosaccharide transporter family (large central loop)</b></td>

       <td>AttMT1</td>

       <td>F9H16_19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g20840 target="new">At1g20840</A></td>

       <td><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=30687048">NM_101937</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g20840 target="new">tonoplast monosaccharide transporter
</A></td>

        </tr>
<tr class="alt">

       <td>AttMT3</td>

       <td>F26O13_130<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g51490 target="new">At3g51490</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=18409353>NM_115008</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g51490 target="new">tonoplast monosaccharide transporter
</A></td>

        </tr>
<tr class="alt">

       <td>AttMT2</td>

       <td>F23E12_140<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g35300 target="new">At4g35300</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAA18739&doptcmdl=GenPept>CAA18739</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g35300 target="new">tonoplast monosaccharide transporter
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=4><b>Putative monosaccharide transporter family (plastidic localization)</b></td>

       <td>&nbsp;</td>

       <td>T7A14_10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g05030 target="new">At1g05030</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC98002&doptcmdl=GenPept>AAC98002</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g05030 target="new">putative monosaccharide transporter (plaastids?)
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F1N21_12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g67300 target="new">At1g67300</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG00251&doptcmdl=GenPept>AAG00251</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g67300 target="new">putative monosaccharide transporter (plastids?)
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F19K16_22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g79820 target="new">At1g79820</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF09060&doptcmdl=GenPept>AAF09060</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g79820 target="new">putative monosaccharide transporter (plastids?)
</A></td>

        </tr>
<tr class="alt">

       <td>AtpGlcT</td>

       <td>T21H19_70<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g16150 target="new">At5g16150</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAC01856&doptcmdl=GenPept>CAC01856</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g16150 target="new">putative monosaccharide transporter (plastids?)
</A></td>

        </tr>
<tr class="alt"><td valign=top rowspan=19><b>Putative monosaccharide transporter family (ERD-group = induced by early dehydration)</b></td>

       <td>&nbsp;</td>

       <td>F7G19_23<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g08890 target="new">At1g08890</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAB70415&doptcmdl=GenPept>AAB70415</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08890 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F7G19_22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g08900 target="new">At1g08900</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAB70414&doptcmdl=GenPept>AAB70414</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08900 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F7G19_20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g08920 target="new">At1g08920</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB64733&doptcmdl=GenPept>CAB64733</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08920 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtERD6</td>

       <td>F7G19_19<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g08930 target="new">At1g08930</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB64732&doptcmdl=GenPept>CAB64732</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g08930 target="new">"putative sugar transport protein, ERD6"
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F18O14_20<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g19450 target="new">At1g19450</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF79445&doptcmdl=GenPept>AAF79445</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g19450 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T22H22_15<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g54730 target="new">At1g54730</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAC64898&doptcmdl=GenPept>AAC64898</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g54730 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F22H5_6<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At1g75220 target="new">At1g75220</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAG12689&doptcmdl=GenPept>AAG12689</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At1g75220 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T9J23_17<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At2g48020 target="new">At2g48020</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAD13706&doptcmdl=GenPept>AAD13706</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At2g48020 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T12H1_11<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g05150 target="new">At3g05150</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF27021&doptcmdl=GenPept>AAF27021</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05150 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T12H1_12<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g05160 target="new">At3g05160</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF27022&doptcmdl=GenPept>AAF27022</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05160 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T12H1_13<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g05165 target="new">At3g05165</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=15081629>AY048207</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05165 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F22F7_16<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g05400 target="new">At3g05400</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAF64542&doptcmdl=GenPept>AAF64542</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05400 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>MQC12_22<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g20460 target="new">At3g20460</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=BAB02829&doptcmdl=GenPept>BAB02829</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g20460 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T4B21_10<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g04750 target="new">At4g04750</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB80840&doptcmdl=GenPept>CAB80840</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g04750 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T4B21_9<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At4g04760 target="new">At4g04760</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=CAB80841&doptcmdl=GenPept>CAB80841</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At4g04760 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>T12H1_36<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At3g05155 target="new">At3g05155</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=NP_683530&doptcmdl=GenPept>NP_683530</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At3g05155 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>&nbsp;</td>

       <td>F17K4_90<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g18840 target="new">At5g18840</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?db=nucleotide&val=30687035>NM_121889</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g18840 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtSFP1</td>

       <td>F21A20_60<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g27350 target="new">At5g27350</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK11720&doptcmdl=GenPept>AAK11720</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27350 target="new">putative sugar transport protein
</A></td>

        </tr>
<tr class="alt">

       <td>AtSFP2</td>

       <td>F21A20_70<br><a href=http://arabidopsis.org/servlets/TairObject?type=locus&name=At5g27360 target="new">At5g27360</A></td>

       <td><a href=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Protein&term=AAK11721&doptcmdl=GenPept>AAK11721</A><br></td>

       <td><a href=http://www.tigr.org/tigr-scripts/euk_manatee/shared/ORF_infopage.cgi?db=ath1&orf=At5g27360 target="new">putative sugar transport protein 
</A></td>

        </tr>
</table><P>
<A href=index.jsp>Return to Gene Family Index</A><P>
<center>Last modified on June 27, 2005</center>      


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
