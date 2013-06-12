<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%!
String pageName = "TAIR - Gene Expression";
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

<H2>Microarray data from AtGenExpress</H2>
<div id="right_column">
<TABLE>


<TR><TD>AtGenExpress is a multinational effort designed to uncover the transcriptome of the
multicellular model organism Arabidopsis thaliana. The project is coordinated by Detlef Weigel,
Thomas Altmann and Lutz Nover with funding from the German Arabidopsis Functional Genomics Network (AFGN), and includes contributions from Germany, supported by DFG, as well as  substantial contributions by RIKEN (Japan), NSF (USA; via funding of TAIR and the 2010 program), BBSRC (UK; via funding of the GARNET initiative), and the Max-Planck-Society. For more information
about the project, including project goals, methodology, RNA samples
and contributors please visit the
<a href="http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenex.htm">AFGN site</a><P>
The table below shows the current list of experiments contributing to the AtGenExpress project, the status of the data in TAIR, as well as links to all web sites where data can be searched or downloaded.
</td></tr>
</TABLE>

  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
<TR>
        <TH><B>Experiment</B></TH>

        <TH><B>Group</B></TH>

        <TH><B>Number of Slides</B></TH>

        <TH><B>Date received</B></TH>

        <TH><B>Experiment info searchable</B></TH>

        <TH><B>Datasets downladable via FTP</B></TH>

        <TH><B>Expression values
               searchable</B></TH>

        <TH><B>Data available at</B></TH>
	 </TR>

<tr bgcolor=#D5D9DD>
        <td colspan=8><B>Development</b></td>

        
     </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1006710873">AtGenExpress: Expression Atlas of Arabidopsis Development</a></td>

        <td>Weigel & Lohmann<br>(Germany)</td>

        <td>237</td>

        <td>Apr 14 2004</td>

     

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><BR>(Jul 5 2004)</td>

        <td>yes<BR> <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00319/">.chp & .cel</a><BR>(Jul 5 2004)</td>


        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression">yes<BR></a>(Nov 2004)</td>

	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1006710873">TAIR-ME00319</a>,<br>
 <a href="http://web.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenextable1.htm">AFGN</a>, <br>
<a href="http://www.weigelworld.org/resources/microarray/AtGenExpress/">Weigel lab</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=152">NASCArrays-152</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=150">NASCArrays-150</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=151">NASCArrays-151</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=153">NASCArrays-153</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=149">NASCArrays-149</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=154">NASCArrays-154</a>, <br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a></td>
        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966994">AtGenExpress: Expression profiling of early germinating seeds</a></td>

        <td>Kamiya & Nambara<br>(Japan)</td>

        <td>6</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<BR> <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00346/">.chp & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>

	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966994">TAIR-ME00346</a>, <br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a></td>
        </tr>
<tr bgcolor=#D5D9DD>
        <td colspan=8><B>Biotic treatment</b></td>

        
        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007967417">AtGenExpress: Response to <i>Botrytis cinerea </i> infection</a></td>

        <td>Ausubel<br>(USA)</td>

        <td>12</td>

        <td>Jul 1 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes<br></a>(Nov 2004)</td>


        <td>yes <br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00341">.chip & .cel</a><br>(Dec 2004)</td>

          <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007967417">TAIR-ME00341</a>, <br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a></td>

        </tr>
<tr>
        <td> <a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008031517">AtGenExpress: Pseudomonas half leaf injection</a></td>

        <td>Dong<br>(USA)</td>

        <td>32</td>

        <td>Jul 1 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes <br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00353">.chip & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>

	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008031517">TAIR-ME00353</a>,<br><a href="https://www.genevestigator.ethz.ch/">Genevestigator</a></td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966202">AtGenExpress: Response to virulent, avirulent, typeIII-secretion system deficient and nonhost bacteria</a></td>

        <td>N&#239;&#191;&#189;rnberger, NASC<br>(Germany, UK)</td>

        <td>48</td>

        <td>Aug 28 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>

        <td>yes <br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00331">.chp & .cel</a><br>(Nov 2004)</td>

         <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>

	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966202">TAIR-ME00331</a>, <br>
<a href="http://www.weigelworld.org/resources/microarray/AtGenExpress/">Weigel lab</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=120">NASCArrays-120</a>, <br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>
</td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080727">AtGenExpress: Response to bacterial-(LPS, HrpZ, Flg22) and oomycete-(NPP1) derived elicitors</a></td>

        <Td>N&#239;&#191;&#189;rnberger, NASC<br>(Germany, UK)</td>

        <td>42</td>

        <td>Aug 28 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>

        <td>yes <br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00332">.chp & .cel</a><br>(Nov 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080727">TAIR-ME00332</a>, 
<br><a href="http://web.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenextable3.htm">AFGN</a>,<br>
 <a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=122">NASCArrays-122</a>, <br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966021">AtGenExpress: Response to <i>Phytophthora infestans</i></a></td>

        <td>Scheel, NASC<br>(Germany, UK)</td>

        <td>18</td>

        <td>Aug 28 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>



        <td>yes <br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00342">.chp & .cel</a><br>(Nov 2004)</td>


        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966021">TAIR-ME00342</a>, <br>
<a href="http://web.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenextable3.htm">AFGN</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=123">NASCArrays-123</a>,<br>
 <a href="https://www.genevestigator.ethz.ch/">Genevestigator</a></td>
	</tr>

    <tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008031468">AtGenExpress: Response to <i>Erysiphe orontii</i> infection</a></td>

        <td>Ausubel<br>(USA)</td>

        <td>48</td>

        <td>Oct 28 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes <br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00354">.chp & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008031468">TAIR-ME00354</a>, <br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a></td>


    </tr>

<tr bgcolor=#D5D9DD>
        <td colspan=8><B>Abiotic treatment</b></td>

         </tr>


<tr><td colspan=8><b>Stress Series</b></td></tr>
<tr><td colspan=8>All stress samples (with the exception of the heat stress cell culture
samples) were done from the same set of seedlings, at the same day, in the
same institute and growth chambers as one experiment. To facilitate querying, the
different stress treatments are presented here as separate experiments,
with the corresponding points of the single control series associated to
each of the stress treatments.<P>
<a name="note"><font color=red>Note</font></a>: The data files for the shoot and root test samples in the experiment 'AtGenExpress: Heat stress time course' had been mistakenly labeled. The label of the data files for those samples was corrected in the ftp site on May 10th, 2006. The links to the correct data files from the experiment page are being fixed presently. The data files for the control samples and the cell culture test samples were correctly labeled all along.
</td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966553">AtGenExpress: Cold stress time course</a></td>

        <td>Kudla<br>(Germany)</td>

        <td>52</td>

        <td>Jul 9 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00325">.chp & .cel</a><br>(Nov 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966553">TAIR-ME00325</a>, <br>
<a href="http://web.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenextable2.htm">AFGN</a>, <br>
 <a href="http://www.weigelworld.org/resources/microarray/AtGenExpress/">Weigel lab</a>, <br> 
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=138">NASCArrays-138</a>,
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=137">NASCArrays-137</a>,<br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>,<br>
<a href="http://mapman.gabipd.org/web/guest/mapmanweb/-/mapman?Mode=Show&Name=cold+stress&ExperimentId=11737&PathwayId=39&MappingId=280&DataType=Affymetrix&View=individual">MapMan</a></td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966668">AtGenExpress: Drought stress time course</a></td>

        <td>Kudla<br>(Germany)</td>

        <td>60</td>

        <td>Jul 9 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00338">.chp & .cel</a><br>(Nov 2004)</td>

         <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966668">TAIR-ME00338</a>,  <br>
<a href="http://web.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenextable3.htm">AFGN</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=141">NASCArrays-141</a>,
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=137">NASCArrays-137</a>,<br>
<a href="http://www.weigelworld.org/resources/microarray/AtGenExpress/">Weigel lab</a>,<br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>,<br>
<a href="http://mapman.gabipd.org/web/guest/mapmanweb/-/mapman?Mode=Show&Name=drought+stress&ExperimentId=11738&PathwayId=39&MappingId=280&DataType=Affymetrix&View=individual">MapMan</a></td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966782">AtGenExpress: Genotoxic stress time course</a></td>

        <td>Puchta<br>(Germany)</td>

        <td>52</td>

        <td>Jul 9 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00326">.chp & .cel</a><br>(Nov 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966782">TAIR-ME00326</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=142">NASCArrays-142</a>,
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=137">NASCArrays-137</a>,<br>
<a href="http://web.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenextable2.htm">AFGN</a>,<br>
<a href="http://www.weigelworld.org/resources/microarray/AtGenExpress/">Weigel lab</a>,<br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>,<br>
<a href="http://mapman.gabipd.org/web/guest/mapmanweb/-/mapman?Mode=Show&Name=genotoxic+stress&ExperimentId=11739&PathwayId=39&MappingId=280&DataType=Affymetrix&View=individual">MapMan</a></td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007967124">AtGenExpress: Heat stress time course</a><br>
<a href="#note"><font color=red>(See Note)</a></font></td>

        <td>von Koskull-D&#239;&#191;&#189;ring<br>(Germany)</td>

        <td>94</td>

        <td>Jul 9 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00339">.chp & .cel</a><br>(Nov 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>

	<td>
<a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007967124">TAIR-ME00339</a>,<br>
<a href="http://web.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenextable2.htm">AFGN</a>,<br>
<a href="http://www.weigelworld.org/resources/microarray/AtGenExpress/">Weigel lab</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=146">NASCArrays-146</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=137">NASCArrays-137</a>,<br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>,<br>
<a href="http://mapman.gabipd.org/web/guest/mapmanweb/-/mapman?Mode=Show&Name=heat+stress&ExperimentId=11740&PathwayId=39&MappingId=280&DataType=Affymetrix&View=individual">MapMan</a></td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966835">AtGenExpress: Osmotic stress time course</a></td>

        <td>Kudla<br>(Germany)</td>

        <td>52</td>

        <td>Jul 9 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</a></td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00327">.chp & .cel</a><br>(Nov 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966835">TAIR-ME00327</a>,<br>
<a href="http://web.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenextable2.htm">AFGN</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=139">NASCArrays-139</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=137">NASCArrays-137</a>,<br>
<a href="http://www.weigelworld.org/resources/microarray/AtGenExpress/">Weigel lab</a>,<br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>,<br>
<a href="http://mapman.gabipd.org/web/guest/mapmanweb/-/mapman?Mode=Show&Name=osmotic+stress&ExperimentId=11741&PathwayId=39&MappingId=280&DataType=Affymetrix&View=individual">MapMan</a> </td>
        </tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966941">AtGenExpress: Oxidative stress time course</a></td>

        <td>Kirch<br>(Germany)</td>

        <td>52</td>

        <td>Jul 9 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00340">.chp & .cel</a><br>(Nov 2004)</td>

         <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966941">TAIR-ME00340</a>,<br>
<a href="http://web.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenextable2.htm">AFGN</a>,  <br>
<a href="http://www.weigelworld.org/resources/microarray/AtGenExpress/">Weigel lab</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=143">NASCArrays-143</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=137">NASCArrays-137</a>,<br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>,<br>
<a href="http://mapman.gabipd.org/web/guest/mapmanweb/-/mapman?Mode=Show&Name=oxidative+stress&ExperimentId=11742&PathwayId=39&MappingId=280&DataType=Affymetrix&View=individual">MapMan</a></td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966888">AtGenExpress: Salt stress time course</a></td>

        <td>Kudla<br>(Germany)</td>

        <td>52</td>

        <td>Jul 9 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</a></td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00328">.chp & .cel</a><br>(Nov 2004)</td>

         <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>

<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966888">TAIR-ME00328</a>,<br>
<a href="http://web.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenextable2.htm">AFGN</a>,  <br>
<a href="http://www.weigelworld.org/resources/microarray/AtGenExpress/">Weigel lab</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=140">NASCArrays-140</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=137">NASCArrays-137</a>,<br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>,<br>
<a href="http://mapman.gabipd.org/web/guest/mapmanweb/-/mapman?Mode=Show&Name=salt+stress&ExperimentId=11743&PathwayId=39&MappingId=280&DataType=Affymetrix&View=individual">MapMan</a></td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966606">AtGenExpress: UV-B stress time course</a></td>

        <td>Harter<br>(Germany)</td>

        <td>60</td>

        <td>Jul 9 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00329">.chp & .cel</a><br>(Nov 2004)</td>

       <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966606">TAIR-ME00329</a>,<br>
<a href="http://web.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenextable2.htm">AFGN</a>,  <br>
<a href="http://www.weigelworld.org/resources/microarray/AtGenExpress/">Weigel lab</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=144">NASCArrays-144</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=137">NASCArrays-137</a>,<br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>,<br>
<a href="http://mapman.gabipd.org/web/guest/mapmanweb/-/mapman?Mode=Show&Name=UV+light+stress&ExperimentId=11736&PathwayId=39&MappingId=280&DataType=Affymetrix&View=individual">MapMan</a></td>

        </tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966439">AtGenExpress: Wounding stress time course</a></td>

        <td>Harter<br>(Germany)</td>

        <td>60</td>

        <td>Jul 9 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00330">.chp & .cel</a><br>(Nov 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>



	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966439">TAIR-ME00330</a>,<br>
<a href="http://web.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenextable2.htm">AFGN</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=145">NASCArrays-145</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=137">NASCArrays-137</a>,<br>
<a href="http://www.weigelworld.org/resources/microarray/AtGenExpress/">Weigel lab</a>,<br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>,<br>
<a href="http://mapman.gabipd.org/web/guest/mapmanweb/-/mapman?Mode=Show&Name=wound+stress&ExperimentId=11744&PathwayId=39&MappingId=280&DataType=Affymetrix&View=individual">MapMan</a></td>

        </tr>
<tr><td colspan=8><b>Other abiotic treatments </b></td></tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966126">AtGenExpress: Light treatments</a></td>

        <td>Kretsch, NASC<br>(Germany, UK)</td>

        <td>48</td>

        <td>Aug 28 2004</td>


        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>


        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00345">.chp & .cel</a><br>(Nov 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966126">TAIR-ME00345</a>,<br>
<a href="http://web.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenextable3.htm">AFGN</a>,<br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=124">NASCArrays-124</a>,<br>

<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a></td>
        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007967219">AtGenExpress: Different temperature treatment of seeds</a></td>

        <td>Yamaguchi<br>(Japan)</td>

        <td>4</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00348">.chp & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>

	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007967219">TAIR-ME00348</a>,<br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=170">NASCArrays-170</a></td>
        </tr>
<tr bgcolor=#D5D9DD>
        <td colspan=8><B>Nutrient treatment</B></td>

       
        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007967006">AtGenExpress: Response to sulfate limitation</a></td>

        <td>Takahashi<br>(Japan)</td>

        <td>22</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00347">.chp & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007967006">TAIR-ME00347</a>,<br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=171">NASCArrays-171</a></td>

        </tr>
<tr bgcolor=#D5D9DD>
        <td colspan=8><B>Hormone treatment</b></td>

        
        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007965762">AtGenExpress: ACC time course in wildtype seedlings</a></td>

        <td>Yoshida<br>(Japan)</td>

        <td>12</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00334">.chp & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007965762">TAIR-ME00334</a>,<br>
 <a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=172">NASCArrays-172</a></td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966040">AtGenExpress: Zeatin time course in wildtype seedlings</a></td>

        <td>Yoshida<br>(Japan)</td>

        <td>12</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00344">.chp & .cel</a> </a><br>(Nov 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


        <td> <a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966040">TAIR-ME00344</a>,<br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=173">NASCArrays-173</a></td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007965964">AtGenExpress: Methyl Jasmonate time course in wildtype seedlings</a>
</td>

        <td>Yoshida<br>(Japan)</td>

        <td>12</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00337">.chp & .cel</a><br>(Dec 2004)</td>

         <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007965964">TAIR-ME00337</a>,<br> 
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=174">NASCArrays-174</a></td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007965859">AtGenExpress: IAA time course in wildtype seedlings</a></td>

        <td>Yoshida<br>(Japan)</td>

        <td>12</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00336">.chp & .cel</a><br>(Nov 2004)</td>

         <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007965859">TAIR-ME00336</a>,<br> <a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=175">NASCArrays-175</a></td>

        </tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007964750">AtGenExpress: ABA time course in wildtype seedlings</a>
</td>

        <td>Yoshida<br>(Japan)</td>

        <td>12</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00333">.chp & .cel</a><br>(Nov 2004)</td>

       <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007964750">TAIR-ME00333</a>,<br><a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=176">NASCArrays-176</a> </td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966175">AtGenExpress: GA3 time course in wildtype and ga1-5 mutant seedlings</a></td>

        <td>Yoshida<br>(Japan)</td>

        <td>24</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes<br>(Nov 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00343">.chp & .cel</a><br>(Nov 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966175">TAIR-ME00343</a>,<br>
<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=177">NASCArrays-177</a></td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966053">AtGenExpress: Brassinolide time course in wildtype and det2-1 mutant seedlings</a></td>

        <td>Yoshida<br>(Japan)</td>

        <td>24</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Nov 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00335">.chp & .cel</a><br>(Nov 2004)</td>

         <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007966053">TAIR-ME00335</a>, 
<br><a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=178">NASCArrays-178</a></td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007999438">AtGenExpress: Effect of Brassinosteroids on seedlings</a></td>

        <td>Yoshida<br>(Japan)</td>

        <td>26</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00352">.chp & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>

        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007999438">TAIR-ME00352</a>, <a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=179">NASCArrays-179</a></td>


        </tr>


<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008031453">AtGenExpress: Cytokinin treatment of seedlings</a></td>

        <td>Mizuno<br>(Japan)</td>

        <td>12</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00356">.chp & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008031453">TAIR-ME00356</a>,<br><a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=181">NASCArrays-181</a></td>

        </tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007967394">AtGenExpress: Effect of ABA during seed imbibition</a></td>

        <td>Kamiya & Nambara<br>(Japan)</td>

        <td>8</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00351">.chp & .cel</a><br>(Dec 2004)</td>

         <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007967394">TAIR-ME00351</a>,<br><a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=183">NASCArrays-183</a></td>


        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007967381">AtGenExpress: Basic hormone treatment of seeds</a></td>

        <td>Yamaguchi<br>(Japan)</td>

        <td>12</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00350">.chp & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>

        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007967381">TAIR-ME00350</a>,<br><a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=184">NASCArrays-184</a></td>

        </tr>
<tr bgcolor=#D5D9DD>
        <td colspan=8><B>Chemical treatment</b></td>
        
        </tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080692">AtGenExpress: Effect of gibberellic acid inhibitors on seedlings</a></td>

        <td>Yoshida<br>(Japan)</td>

        <td>20</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00357">.chp & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


         <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080692">TAIR-ME00357</a>,<br>
	<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=185">NASCArrays-185</a></td>


        </tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080715">AtGenExpress: Effect of auxin inhibitors on seedlings</a></td>

        <td>Yoshida<br>(Japan)</td>

        <td>10</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00358">.chp & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


         <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080715">TAIR-ME00358</a>,<br>
	<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=186">NASCArrays-186</a></td>


        </tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008205330">AtGenExpress: Effect of brassinosteroid inhibitors on seedlings</a></td>

        <td>Yoshida<br>(Japan)</td>

        <td>12</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00359">.chp & .cel</a><br>(Dec 2004)</td>

         <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)<br></td>


         <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008205330">TAIR-ME00359</a>,<br>
	<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=187">NASCArrays-187</a></td>


        </tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080786">AtGenExpress: Effect of ethylene inhibitors on seedlings</a></td>

        <td>Yoshida<br>(Japan)</td>

        <td>6</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00360">.chp & .cel</a><br>(Dec 2004)</td>

       <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


         <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080786">TAIR-ME00360</a>,<br>
	<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=188">NASCArrays-188</a></td>


        </tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080804">AtGenExpress: Effect of cycloheximide on seedlings</a></td>

        <td>Yoshida<br>(Japan)</td>

        <td>4</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00361">.chp & .cel</a><br>(Dec 2004)</td>

       <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


         <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080804">TAIR-ME00361</a>,<br>
	<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=189">NASCArrays-189</a></td>


        </tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080822">AtGenExpress: Effect of proteasome inhibitor MG13 on seedlings</a></td>

        <td>Yoshida<br>(Japan)</td>

        <td>4</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00362">.chp & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


         <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080822">TAIR-ME00362</a>,<br>
	<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=190">NASCArrays-190</a></td>


        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080809">AtGenExpress: Effect of photosystem inhibitor PNO8 on seedlings</a></td>

        <td>Yoshida<br>(Japan)</td>

        <td>12</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00363">.chp & .cel</a><br>(Dec 2004)</td>

         <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>

         <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080809">TAIR-ME00363</a>,<br>
	<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=191">NASCArrays-191</a></td>


        </tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080827">AtGenExpress: Effect of ibuprofen, salicylic acid and daminozide on seedlings</a></td>

        <td>Yoshida<br>(Japan)</td>

        <td>8</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00364">.chp & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


         <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008080827">TAIR-ME00364</a>,<br>
	<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=192">NASCArrays-192</a></td>


        </tr>
<tr bgcolor=#D5D9DD>
        <td colspan=8><B>Cell cycle</b></td>
        
        </tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008231896">AtGenExpress: Genome-wide cell cycle studies</a></td>

        <td>Murray (UK),<br> Hennig & Gruissem (Switzerland)</td>

        <td>10</td>

        <td>Dec 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Feb 2005)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00365">.chp & .cel</a><br>(Feb 2005)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Feb 2005)</td>


         <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008231896">TAIR-ME00365</a>,<br>
	<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>
</tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008231915">AtGenExpress: Growth of suspension-cultured cells</a></td>

        <td>Murray (UK),<br> Hennig & Gruissem (Switzerland)</td>

        <td>4</td>

        <td>Dec 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Feb 2005)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00367">.chp & .cel</a><br>(Feb 2005)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Feb 2005)</td>


         <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008231915">TAIR-ME00367</a>,<br>
	<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>
</tr>

<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008231907">AtGenExpress: Cell cycle re-entry in suspension-cultured cells</a></td>

        <td>Murray (UK),<br> Hennig & Gruissem (Switzerland)</td>

        <td>7</td>

        <td>Dec 2 2005</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Feb 2005)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00366">.chp & .cel</a><br>(feb 2005)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Feb 2005)</td>


         <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008231907">TAIR-ME00366x</a>,<br>
	<a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>
</tr>

<tr bgcolor=#D5D9DD>
        <td colspan=8><B>Genotype Comparison</b></td>
        
        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007967232">AtGenExpress: Comparison of plant hormone-related mutants</td>

        <td>Yoshida<br>(Japan)</td>

        <td>8</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00349">.chp & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>


        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1007967232">TAIR-ME00349</a>,<br><a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=180">NASCArrays-180</a></td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008031444">AtGenExpress: ARR21C overexpression</a></td>

        <td>Mizuno<br>(Japan)</td>

        <td>6</td>

        <td>Sep 2 2004</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Dec 2004)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00355">.chp & .cel</a><br>(Dec 2004)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jan 2005)</td>

        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008031444">TAIR-ME00355</a>,<br><a href="https://www.genevestigator.ethz.ch/">Genevestigator</a>, <br>
<a href="http://affymetrix.arabidopsis.info/narrays/experimentpage.pl?experimentid=182">NASCArrays-182</a></td>


        </tr>
<tr>
        <td> <a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008803819">AtGenExpress: NPR1 direct targets</a></td>

        <td>Dong<br>(USA)</td>

        <td>4</td>

        <td>Apr 4 2005</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Jun 2005)</td>

        <td>yes <br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00372">.chip & .cel</a><br>(Jun 2005)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jun 2005)</td>

	<td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008803819">TAIR-ME00372</a></td>

        </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008803961">AtGenExpress: Ecotypes</a></td>

        <td>Weigel & Lohmann
<br>(Germany)</td>

        <td>30</td>

        <td>May 12 2005</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Jun 2005)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00374">.chp & .cel</a><br>(Jun 2005)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jun 2005)</td>


        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008803961">TAIR-ME00374</a><br>

 </tr>
<tr>
        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008803992">AtGenExpress: Ecotypes Singletons</a></td>

        <td>Weigel & Lohmann
<br>(Germany)</td>

        <td>25</td>

        <td>May 12 2005</td>

        <td><a href="http://arabidopsis.org/servlets/Search?type=expr&search_action=new_search">yes</a><br>(Jun 2005)</td>

        <td>yes<br><a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/ExpressionSet_ME00375">.chp & .cel</a><br>(Jun 2005)</td>

        <td><a href="http://arabidopsis.org/servlets/Search?action=new_search&type=expression"> yes</a><br>(Jun 2005)</td>


        <td><a href="http://arabidopsis.org/servlets/TairObject?type=expression_set&id=1008803992">TAIR-ME00375</a><br>

 </tr>


</table>
</div>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


