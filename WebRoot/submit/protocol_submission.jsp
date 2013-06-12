<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Data Submission - Protocols and Lab Manuals";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="129" />
</jsp:include>

<jsp:include page="/jsp/includes/datasubmissionSidebar.jsp" flush ="true">
<jsp:param name="sidebarName" value="Protocols" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->

<span class="mainheader">Protocols and Lab Manuals</span>
<p>TAIR encourages the research community to share their protocols. To submit a protocol to TAIR send the protocol in one of the following formats.</p>
<p>Portable Document Format (PDF)<br>
Microsoft Word Document (.doc)<br>
Image (e.g. for powerpoint/photoshop images)- .gif and .jpg<br>
Any text file .txt and .rtf</p>
<p>
Along with the above file, please send in additional data following the format below to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a>.
Fields indicated in <span class="blue"><b>blue</b></span> are required. Fields marked with an asterisk(*) can have more than one entry but the entries must be separated by a semicolon.</p>
<P>
To find your Community ID and the Citation/Reference ID please follow the provided links to our TAIR search pages.
If you have any questions or suggestions, please contact us at: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>

<p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">

    <TR><TH><B>Field</B></TH>
        <TH><B>Description</B></TH>
        <TH><B>Values/Constraints</B></TH>
        <TH><B>Example</B></TH></TR>
        

	<TR><TD valign=top><span class="blue"><b>Author(s)</B></span>*</TD>
        <TD>full name</TD>    
        <TD>1000 character limit</TD>
        <TD>Jerome Giraudat</TD></TR>

	<TR><TD valign=top><span class="blue"><b>Submitter's Community ID</b></span>*</TD>
        <TD>unique identifier for a community member in TAIR. You must be registered to have a community ID</TD>    
        <TD>TAIR accession from <a href="/servlets/Search?action=new_search&type=community" target="display">TAIR Community Search</A></TD>
        <TD>community:4851</TD></TR>

		
	<TR><TD valign=top><span class="blue"><b>Title</b></span></TD>
        <TD>Title of the protocol</TD>    
        <TD>500 character limit</TD>
        <TD>Rapid RNA preparation</TD></TR>

	<TR><TD valign=top><span class="blue"><b>Description</b></span></TD>
        <TD>brief text description</TD>    
        <TD>1000 character limit</TD>
        <TD>A method for rapidly preparing RNA from leaf tissue.</TD></TR>

<TR><TD valign=top>Publication/ Citation/ Reference_id</TD>
        <TD>For a reference that describe the protocol, this is the unique identifier in TAIR. For articles referring to the markers that are not yet in TAIR, please contact a curator to update this information into the database when the paper is published.</TD>    
        <TD>TAIR accession from <A href="/servlets/Search?action=new_search&type=publication" target="display">TAIR Publication Search</A></TD>
        <TD>publication:501682410</TD></TR>	

<TR><TD valign=top>Usage keywords*</TD>
        <TD>One or more keywords that describe the application(s) of the method (e.g. gene expression assay, protein-protein interaction assay).</TD>
        <TD>separate multiple keywords with semicolons</TD>
        <TD>gene expression assay</TD></TR>
	
	
	<TR><TD valign=top>Method keywords*</TD>
        <TD>use as many keywords as necessary to indicate the methods described in the protocol (e.g. mRNA isolation, cell fractionation).</TD>    
        <TD>separate multiple keywords with semicolons</TD>
        <TD>Northern gel blot; RNA extraction</TD></TR>

	
	
</TABLE>


<P>
<center>Last modified on March 1, 2006</center>
</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


