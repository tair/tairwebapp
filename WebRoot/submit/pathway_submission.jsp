<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Data Submission - Pathway Data Submission";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="127" />
</jsp:include>

<jsp:include page="/jsp/includes/datasubmissionSidebar.jsp" flush ="true">
<jsp:param name="sidebarName" value="Metabolic Pathway Data" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->

<span class="mainheader">Pathway Data Submission</span>
<p>
We encourage users of TAIR to share their pathway data with the research community. You can also use this form to update existing <a href = "/tools/aracyc/">AraCyc</a> pathways. 
 Please submit your data in one of the following ways:</p>
<dl><P>
Option 1) Use a preformatted Excel spreadsheet.
To submit your data, please download and complete the following excel spreadsheet. Note that examples and instructions have been included. Before submitting your data, review your entries to ensure that the data is correct. Send completed files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>

<P>
Note: Macros must be enabled for this form to work properly. To allow the macros in this form to run, please change your macro security level to medium (recommended) or low. From the Tools menu, choose Macro, then Security. After you change the security level to medium or low, you will have to restart Excel.</p>
<p>
<a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/pathway_data_form.xls">Download: pathway_data_form.xls</a></p>
</dl>
<dl>
<P>
Option 2) Send tab-delimited data from any program.
If you want to create your own file please follow the following format in submitting your data and send the files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a>.
Fields indicated in <span class="blue"><b>blue</b></span> are required. Fields marked with a plus (+) can have more than one entry but the entries must be separated by a comma (e.g. Joseph Ecker, Callum Bell). 
Please include the column headers as the first line in your files.
To find your Community ID please follow the provided links to our TAIR search pages.</p>
</dl>
<p>
If you have any questions or suggestions, please contact us at: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>

<p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">

    <TR><TH><B>Field</B></TH>
        <TH><B>Values/Constraints</B></TH>
        <TH><B>Example</B></TH></TR>
        

	<TR><TD valign=top><span class="blue"><b>Pathway Name</B></span> +</TD> 
        <TD>Also include any synonyms here</TD>
        <TD>IAA biosynthesis II, IAA biosynthesis from conjugates, IAA deconjugation</TD></TR>

	
	<TR><TD valign=top>Pathway URL</TD>
        <TD>Requested if the pathway exists in AraCyc</TD>    
        <TD>http://www.plantcyc.org:1555/ ARA/NEW-IMAGE?type=PATHWAY &object=PWY-1822</TD></TR>
	
	<TR><TD valign=top><span class="blue"><b>Pathway Reference</B></span> +</TD>
        <TD>PubMed id or full reference of recent review papers of the pathway</TD>    
        <TD>Bartel et al, Journal of Plant Growth Regulation (2001) 20:198-216</TD></TR>

	<TR><TD valign=top><span class="blue"><b>Number of Reactions in Pathway</b> </span></TD>  
        <TD>Default is 1</TD>
        <TD>3</TD></TR>
	
	
	<TR><TD valign=top><span class="blue"><b>Reaction Name or EC Number</b> </span></TD>
        <TD>If there is no EC number please temporarily name the reaction, i.e. step1</TD>    
        <TD>3.5.1.-</TD></TR>

	
	<TR><TD valign=top>Reaction URL</TD>
        <TD>Requested if the reaction exists in AraCyc</TD>    
        <TD>http://www.plantcyc.org:1555/ ARA/new-image?type=ENZYME &object=MONOMER-4142</TD></TR>

	<TR><TD valign=top><span class="blue"><b>Reactants of the reaction</b></span> +</TD>
        <TD>&nbsp;</TD>    
        <TD>indole-3-acetyl-alanine, H2O</TD></TR>

	<TR><TD valign=top><span class="blue"><b>Products of the reaction</b></span> +</TD>
        <TD>&nbsp;</TD>    
        <TD>indole-3-acetate, L-alanine</TD></TR>


	<TR><TD valign=top><span class="blue"><b>Number of Unique Genes or Enzymes Catalyzing the Reaction</B></span></TD>   
        <TD>Default is 1</TD>
        <TD>5</TD></TR>





<TR><TD valign=top><span class="blue"><b>Enzyme Name</b></span> +</TD>
        <TD>Also include any synonyms here. May skip this if enzyme unknown.</TD>    
        <TD>indole-3-acetyl-ala hydrolase</TD></TR>


	<TR><TD valign=top><span class="blue"><b>Enzyme Reference</B></span> +</TD>
       <TD>Papers that provide biochemical evidence of the enzyme activity. May skip this if enzyme unknown.</TD>    
        <TD>PUBMED:10072397, PUBMED:11923288</TD></TR>


<TR><TD valign=top>Gene Name +</TD>
        <TD>Symbol or AGI locus id</TD>    
        <TD>iar3, AT1G51760</TD></TR>

<TR><TD valign=top>Gene Reference +</TD>
        <TD>Papers that provide genetic evidence of the enzyme activity</TD>    
        <TD>PUBMED:10072397</TD></TR>

<TR><TD valign=top>Comments</TD>
        <TD>&nbsp;</TD>    
        <TD>&nbsp;</TD></TR>


<TR><TD valign=top><span class="blue"><b>Submitter's Contact Info or Tair Community ID</B></span> +</TD>
       <TD>TAIR accession from <a href="/servlets/Search?action=new_search&type=community" target="display">TAIR Community Search</A></TD>    
        <TD>tair_person:4549</TD></TR>





	
</TABLE>
<P>
<center>Last modified on March 1, 2006</center>
</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


