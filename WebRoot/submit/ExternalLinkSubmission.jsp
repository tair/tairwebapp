<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Data Submission - External Links";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="121" />
</jsp:include>

<jsp:include page="/jsp/includes/datasubmissionSidebar.jsp" flush ="true">
<jsp:param name="sidebarName" value="External Links" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->

<span class="mainheader">External Links</span>
<p>We encourage users of TAIR to submit external links associated to data objects found in TAIR. Submitted links will be added to the external link band on the object detail pages. Data objects accepted include: Loci, Clones, Genes, Polymorphisms, Genetic Markers, and Clone Ends. The locus example below would create a link on this <a href="/servlets/TairObject?accession=Locus:2127806">locus detail page</A>.</p>
<p>
<B>NOTE: If you want to link to ALL Arabidopsis LOCI and are using the AGI code (e.g. AT4G32520) as part of the variable for the URL, just send the External website name, base URL, and variable syntax to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></B>
</p><p>
If you would like to submit links for a subset of all the data objects found in TAIR, please submit your data in one of the following ways:</p>
<dl>
<p>Option 1) Use a preformatted Excel spreadsheet.
To submit your data, please download and complete the following excel spreadsheet. Note that examples and instructions have been included. Before submitting your data, review your entries to ensure that the data is correct. Send completed files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a>
</p>
<P>
Note: Macros must be enabled for this form to work properly. To allow the macros in this form to run, please change your macro security level to medium (recommended) or low. From the Tools menu, choose Macro, then Security. After you change the security level to medium or low, you will have to restart Excel.</p>
<p>
<a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/external_link_data_form.xls">Download: external_link_data_form.xls</a>
</p></dl><dl><P>
Option 2) Send tab-delimited data from any program.
If you want to create your own file please follow the following format in submitting your data and send the files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a>. Please include the column headers as the first line in your files.</p>
</dl>
<P>
If you have any questions or suggestions, please contact us at: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a>
</p>
<p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">

    <TR><TH><B>Field</B></TH>
        <TH><B>Description</B></TH>
        <TH><B>Example</B></TH></TR>
        

	<TR><TD valign=top><span class="blue"><b>Object Name</B></span></TD>
        <TD>The name of the object found in TAIR to be linked</TD>    
               <TD>AT4g32520 or ATDMC1.1</TD></TR>

<TR><TD valign=top><span class="blue"><b>Object Type</B></span></TD>
        <TD>Type of object. Select from: Locus, Clone, Gene, Polymorphism, GeneticMarker, and CloneEnd</TD>    
               <TD>Locus or GeneticMarker</TD></TR>


	<TR><TD valign=top><span class="blue"><b>External Web Site - Name</b></span></TD>
        <TD>Name of the website that the Base URL refers to</TD>    
       
        <TD>View AraCyc information</TD></TR>

		
	<TR><TD valign=top><span class="blue"><b>External Link - Base URL</b></span></TD>
        <TD>Base rule for the URL. This is ususally the portion of the external link URL before the question mark (?)</TD>    
        
        <TD>http://www.arabidopsis.org: 1555/ARA/NEW-IMAGE</TD></TR>

	<TR><TD valign=top><span class="blue"><b>External Link - Variable</b></span></TD>
        <TD>Variable for the URL. This is usually the portion including and following the question mark (?)</TD>    
       
        <TD>?type=REACTION-IN-PATHWAY& object=GLYOHMETRANS-RXN</TD></TR>

	<TR><TD valign=top><span class="blue"><b>Display Name</b></span></TD>
        <TD>Name of the link to be displayed. For example, if the link is for an associated marker, you can provide the marker name.</TD>    
      
        <TD>formylTHF biosynthesis</TD></TR>

	
</TABLE>


<P>
<center>Last modified on March 1, 2006</center>
</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


