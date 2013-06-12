<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "AraCyc Tutorial";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="20004" />
</jsp:include>

<jsp:include page="/jsp/includes/aracyctutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Displaying Gene Expression, Proteomic, Metabolomic and other Data in the Omics Viewer"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes  here//-->
<span class="mainheader">Displaying Gene Expression, Proteomic and Metabolomic data using the Omics viewer</span>
<p>The Omics viewer is a tool for evaluating the results of large scale expression, metabolite or proteomic studies in a metabolic context. Users can upload their own data to overlay onto the metabolic map. Depending on the type of data, reactions lines or compounds will be colored according to the submitted values.</p>
<p>It is possible to upload a file with multiple types of data such as gene expression and metabolite concentrations. For example, it would be possible to correlate changes in expression levels of enzymes with an increase or decrease in a substrate or product compound. Practically, it may be difficult to distinguish both types of data on the map as multiple types of data are represented as differently colored reaction lines. Therefore it is not always possible to distinguish if a changed value is due to changes in expression or enzyme concentration.</p>
<h2>Omics viewer file format requirements</h2>
<p>In order to visualize data on the Omics viewer, the data should be formatted as a tab delimited text file. Word documents or Excel spreadsheets MUST be saved as TEXT only (.txt) extension. The first column of the file (referred to as column zero in AraCyc) should only contain the name of the object, such as a gene or compound name. For genes we recommend using the AGI locus code (e.g. AT1G01010) because they are non ambiguous, unique gene identifiers. The remaining columns (1-n) will contain the data values. A <a href="ftp://ftp.arabidopsis.org/home/tair/tmp/ExpressionSample.txt">sample file</a> is available on the TAIR ftp site.This file contains a 6 columns, the first column contains gene names, the remaining columns display a series of time points showing expression values from a Microarray experiment. You can download this file and use it as an example query to see how the viewer functions.</p>
<h3>Uploading the data file</h3>
<ol>
<li>From the <a href="/biocyc/index.jsp">AraCyc home page</a>, click on the link to the <a href="http://www.plantcyc.org:1555/expression.html" target="_blank">Omics viewer</a>.</li>
<li>Select the A.thaliana (COL) dataset.</li>
<li>Upload the data file from your computer. Type in the location of the file or use the Browse function to locate and select the file.</li>
<li>Set the data values to absolute or relative. Which one you choose depends on how you choose to display the values in the next step. 
<i>Choose relative if you want to calculate a ratio from two or more columns in your dataset. For example, if you wanted to show the ratio of expression values for each time point compared to the starting (T=0) time point. Choose absolute if the values for each column should be displayed without taking a ratio.</i></li>
<li>If your dataset has log values (negative numbers) check the next box. This will ensure that negative values (e.g. decreased expression) will be displayed.</li>
<li>Indicate the types of data contained in your file. The options are genes, proteins, reactions and compounds or any combination of these types.</li>
<li>Specify the data columns to display and how to display them (relative or absolute). If you are using a ratio, the left column is used to specify the numerator, the denominator is specified in the right text box.<br /><i>Depending on the data set, you can set up a single time experiment or animated time series. For each time point, enter the column number corresponding to the time point in the data file (remember the first column is zero so the first data column is number 1).Enter the number(s) for the columns in the first (left) text entry box. If you want to derive a ratio for one or more timepoint, then type in the number of the corresponding (denominator) column in the right hand text box. NOTE: You must enter a value in the left text entry box.</i><br />
For a visual example see the <a href="aracycexpr.mov">Omics Viewer Demo</a> Quicktime movie.</li>
<li>Choose a color scheme for displaying values on the metabolic map overview diagram. Choose either the default cutoff or a cutoff of your choosing.
<i>The default cut off takes the values from the dataset. So if your values are extreme or there are a few outliers the color range available to display differences will be spread out over a wider range. In most cases, it is better to set your own cutoff. There are two reasons for this. First, having a smaller cutoff makes it easier to distinguish small differences, say in expression values. If the cutoff is set to 2, then all fold increases greater than 2 will be colored the same, leaving more of the color spectrum available for coding smaller differences. Second, if you want to compare maps from more than one experiment, the color range associated with values should be the same.</i></li>
<li>Submit the data. Please be patient. For large datasets it may take some time to draw the map.</li>
</ol>
<h2>Interpreting the results</h2>
<p>Depending on the type of data used, the Omics viewer returns either a single page (for a single time point or experiment) or, if the data had multiple time points, an animation will play showing all the time points. </p>
<p>NOTE: An important consideration when uploading data with multiple data types (e.g. expression plus proteomic data) is that there is currently no way to distinguish color values from expression data vs. proteomic data. For both datatypes, the reaction lines are colored reflecting either changes in expression of the enzymes or increase/decrease in protein concentration. Also, the Omics viewer currently does not distinguish between isozymes that may catalyze identical reactions, nor does it allow for distinctions to be made for relative expression values for genes that are part of multimeric enzyme complexes. So if there is data for more than one subunit, isozyme or for both the gene and protein for a single reaction, the software determines which data point to use. If the numeric values have opposite signs, the highest positive value is selected. If the numeric values have the same sign (e.g. negative) the larger of the absolute value is displayed.</p>
<h3>Color Scale</h3>
<p>The color spectrum used ranges from yellow/green to red, where red is the highest value and yellow is the lowest. If there is no or little change, the color range is blue. The color key to the right of the diagram shows the assignment of color values to numeric values. Below the color key is a histogram of color values indicating the range of values within the dataset.If there are values for data that cannot be shown in the overview (such as expression values for genes not included in AraCyc) they will also be displayed. Comparing the histogram of the two datasets can provide a quick sense of how different the expression of some or all metabolic pathways is affected in an experiment compared to other pathways.</p>
<h3>Statistics</h3>
<p>Along with the metabolic overview, a table of statistics is generated. This table lists any gene/protein/compound names that could not be found, or for which the data was missing or incorrectly formatted. A second list may be generated for all of the data types in the sample set that could not be matched to something in AraCyc (Objects not found). Objects with names that could not be resolved are also listed. These might include names which match more than one data type in AraCyc.</p>
<p>Note: Statistics are not calculated for time series experiments.</p>
<h3>Animation Controls</h3>
<p> For time series experiments, the Omics viewer uses Dynamic HTML to display the series. Animation controls can be used to stop playing the animation at any point, start playing, go forward or go backward one time point. Browsers that do not support DHTML will not be able to run the animations.</p>
</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
