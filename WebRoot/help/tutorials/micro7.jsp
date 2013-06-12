<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "TAIR Microarray Tutoriall";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="2026" />
</jsp:include>

<jsp:include page="/jsp/includes/microtutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="How to download and view microarray data"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes  here//-->
<span class="mainheader">Downloading microarray datasets</span>
<p>Raw and normalized datasets for all of the microarray experiments in TAIR can be downloaded in their entirety from the FTP site. For downloading individual slide data from an experiment, use the Microarray Experiment search to  identify the datasets to download.</p>
<p>This section describes how to find microarray datasets in the FTP site, download the files to your personal computer and how to open the compressed files.</p>
<h3>Finding the datasets in the FTP site</h3>
<p>For each of the experiments stored in TAIR's database, the raw and normalized datasets are kept in the FTP site.Each dataset can be accessed by its TAIR accession which has the format-ExpressionSet:NNNNNNNNNNNN. The ExperimentSet id is a unique identifier for that experiment in TAIR database.</p>
<ol>
<li>From the home page or navigation bar, find the section marked FTP or FTP downloads.</li>
<li>Choose the <a href="ftp://ftp.arabidopsis.org/home/tair/Microarrays/" target="_blank">Microarray directory.</a></li>
<li>Click on the folder 'Datasets'.</li>
<li>Locate the folder having the appropriate ExpressionSet identifier (e.g.ExpressionSet_233).</li>
<li>Click on the folder name to see the contents of the folder.</li>
<p class="sm">In this example there are two files, one for each hybridization in the experiment.</p>
<li>Click on the name of the slide to begin downloading the folder containing the slide data. Repeat for all of the folders in the expression set folder.</li>
<p class="sm">The files are compressed using the WinZip program for faster downloading.</p>
<li>Uncompress the file: For Windows PC users use the WinZip or similar utility to decompress the file. For Mac users, use StuffitExpander or a similar utility. For files marked .gz using UNIX based operating systems, use the following UNIX command:<br />
gzip -d /home/yourname/yourpath/filename.gz<br /></li>
<li>Save the uncompressed folder to the hard drive of your personal computer.</li>
<li>Alternatively, if you have set up your browser to decompress files automatically, navigate to the directory where you have selected to save downloaded files. The uncompressed folder will be located in this directory.</li>
</ol>
<h3>File types and their uses</h3>
<p> Depending on the data set you download there will be several types of files in the slide dataset folder. Once the files are decompressed, you should be able to open any file with a .txt suffix in any text editor software.</p>
<ul>
<li>README. This is a text file containing information about the experiment such as the experiment abstract, array design, slide description (e.g. sample treatment). It also contains information about all of the other files in the directory and the descriptions of each field contained in those files.</li>
<li>original_txt. Files marked 'original' contain normalized data prepared by the submitter.</li>
<li>tair_txt. These files contain TAIR normalized data using the raw data supplied by the submitter.</li>
<li>.CEL files (cell intensity file). For Affymetrix data, these are the raw data files which can be imported into the Affymetrix data analysis software. If you want to re-normalize the data according to your own methods, you will need these files.</li>
<li>.CHP files. Affymetrix files containing data normalized using Affymetrix MAS. In most cases these .CHP files have been saved as .txt files.</li>
<li>.zip files. These files contain TAIR normalized data using the Robust Multchip Average (RMA) method. For Affymetrix data, TAIR has switched to using MAS5.0 from Affymetrix.</li>
</ul>
<h3>Troubleshooting Guide</h3>
<ul>
<li>Information about experiments is missing in the downloaded files.</li>
<p class="sm">In some cases, information about the experimental methods and samples is not included in the README documentation included with the other compressed files (.CEL and .TXT). You should be able to find the missing information in the Experiment Detail page in TAIR. Go to the <a href="micro1.jsp" target="_blank">Microarray Experiment Search</a> and use the ExpressionSet identifier as your query term. From the results, click on the experiment name to see the summary page.</p>
<li>Can't find a dataset.</li>
<p class="sm">Users may have submitted data to TAIR and provided a submission number in their publication and do not have the corresponding ExpressionSet identifier. Use the Microarray Experiment search and search by the submission number. The corresponding ExpressionSet identifier will be shown on the Experiment Summary page. Although we encourage community <a href="/submit/microarray.submission.jsp" target="_blank">microarray data submission</a>, not all published experiments are available from TAIR.</li> 
</ul>
</div> <!--right column-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>