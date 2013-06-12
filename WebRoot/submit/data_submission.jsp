<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Data Submission";
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

<jsp:include page="/jsp/includes/datasubmissionSidebar.jsp" flush ="true">
<jsp:param name="sidebarName" value="Data Submission" />
</jsp:include>

<div id="rightcolumn">
<!-- CONTENT IN HERE -->

<span class="mainheader">Data Submission</span>

<dl>
<dd>We encourage users of TAIR to share their data with the research community.  Please take a look at the specific guidelines below for submitting data to TAIR. If you have any questions or suggestions, please contact us at:
<a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org </A></dd>

<dd><B>Warning:</b> A default setting in Microsoft Excel causes some genetic information to be displayed and processed incorrectly. The excel forms available on these pages have been formatted as text to work around this issue, but problems may still arise when pasting data from a Microsoft Word file. Use the Paste Special
-> Paste: As: Text command to insert text into these forms when copying from another Microsoft application.
Please see <a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=pubmed&dopt=Abstract&list_uids=15214961">this article</a> for more information.</dd>

<dt><B>Locus Identifier Request</b></dt>
<dd><a href="/submit/locus_identifier_request.jsp">Locus Identifier Request Guidelines</A><br>
TAIR is now the central agency responsible for assigning Arabidopsis locus identifiers. Consistency of locus identifiers and avoidance of duplication can only be achieved if individuals do not assign locus identifiers on their own. If you would like TAIR to assign a locus identifier for you, 
please follow the suggested format in submitting your data and send the files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</A></dd>

<dt><B>Gene Structure Additions/Modifications</b></dt>
<dd><a href="/submit/gene_annotation.submission.jsp">Gene Structural Annotation Guidelines</A><br>
If you have found missing information or discrepancies in the existing genes'
structures, we would like to include your gene model in our database.
Please follow the suggested format in submitting your data and send the files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</A></dd>

<dt><B>Literature-Based Gene Function Data</b></dt>
<dd><a href="/doc/submit/functional_annotation/123">Gene Functional Annotation Guidelines</A><br>
We encourage users of TAIR to share their functional annotation data with the research community. Please follow the suggested format in submitting your data and send the files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</A></dd>

<dt><B>Marker Data Submission</b></dt>
<dd><a href="/submit/marker_submission.jsp">Marker and Polymorphism Data Submission Guidelines</A><br>
To submit data for markers please format your data as described in the above link and send the data as an excel attachment to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</A></dd>

<dt><B>Gene Family Data Submission</b></dt>
<dd><A href="/submit/genefamily_submission.jsp">Gene Family Data Submission Guidelines</A><br>
If you would like your gene family to appear on the TAIR <a href="/info/genefamily/genefamily.html" target="display">Arabidopsis Gene Family Information</A> page, please format your data as described in the link above and send it to <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</A> as an excel attachment.</dd>

<dt><B>Functional Genomics Gene List Submission</B></dt>
<dd><a href="/submit/submit_2010.jsp">2010 Gene Submission Guidelines</A><br>
If you are working on a group of genes as a part of a functional genomics initiative, we would like to include your gene list in the <A href="/info/2010_projects/" target="display">2010 Projects</A> section. Please follow the guidelines above and send it to <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</A> as an excel attachment.</dd>

<dt><B>Pathway Data Submission</b></dt>
<dd><a href="/submit/pathway_submission.jsp">Pathway Data Submission Guidelines</A><br>
We encourage users of TAIR to share their pathway data with the research community. You can also use this form to update existing pathways. Please follow the above format in submitting your data and send the files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</A></dd>

<dt><B>Microarray Data Submission</b></dt>
<dd>TAIR will no longer accept new microarray data submissions after June 22,
2005.  If you have already filled out a submission form for TAIR but have
not yet sent us your data, please notify us immediately and send the data
to us by June 22.  If you have not filled out a TAIR submission form,
please submit your data to <a href="http://www.ebi.ac.uk/arrayexpress/Submissions/index.html">ArrayExpress</a>, <a href="http://affymetrix.arabidopsis.info/donating.html">NASCArrays</a> or <a href="http://www.ncbi.nlm.nih.gov/projects/geo/">GEO</a>. For
further information please see the <a href="/submit/microarrayAnnouncement.jsp">full text of our microarray data
announcement</a>.</dd>    

<DT><B>Clone and Seed Donation forms</b></dt>
<dd><a href="https://abrc.osu.edu/donate-stocks">ABRC Seed and DNA Stock Donation Instructions</a><br>
To donate stocks to the ABRC, please follow the instructions for
the appropriate stock type on the page above.</dd>

<dt><B>Protocol Submission</b></dt>
<dd><A href="/submit/protocol_submission.jsp">Protocol Submission Guidelines</A><br>
TAIR encourages the research community to share their protocols. To submit a protocol to TAIR , please follow the guidelines above and send it to <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</A> in .txt, .doc, .jpg, .gif or .pdf format.</dd>

<dt><B>External Link Submission</b></dt>
<dd><a href="/submit/ExternalLinkSubmission.jsp">External Link Submission Guidelines</A><br>
We encourage users of TAIR to submit external links assoiciated to gene loci found in TAIR. Please follow the suggested format in submitting your data and send the files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</A></dd>


   
</dl>
<p>
<center>Last modified on March 1, 2006</center>
</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

