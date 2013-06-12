<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Data Submission - Gene Functional Annotation";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="123" />
</jsp:include>

<jsp:include page="/jsp/includes/datasubmissionSidebar.jsp" flush ="true">
<jsp:param name="sidebarName" value="Literature-Based Gene Function Data" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->

<span class="mainheader">Gene Functional Annotation</span>

<p>This document contains information on how to submit functional annotation data such as gene function, localization (cellular, sub-cellular or gross anatomy), biological role and interacting partners to TAIR. We encourage users of TAIR to share their data with the research community. Please submit your data in one of the following ways:</p>

<dl><P>Option 1) Use a preformatted Excel spreadsheet.
To submit your data, please download and complete the following excel spreadsheet. Note that examples are provided, and an arrow <img src="/images/small_arrow.gif" alt="(red arrow)"> will appear next to incorrectly formatted data in the gene name / identifier column. Before submitting your data, review any to entries marked with <img src="/images/small_arrow.gif" alt="(redarrow)"> to ensure that the data is in the correct format. Send completed files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>

<P>Note: Macros must be enabled for this form to work properly. To allow the macros in this form to run, please change your macro security level to medium (recommended) or low. From the Tools menu, choose Macro, then Security. After you change the security level to medium or low, you will have to restart Excel.</p>

<p><a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/functional_annotation_data_form.xls">Download: functional_annotation_data_form.xls</a></p>
</dl>
<dl>
<P>Option 2) Send tab-delimited data from any program.
If you want to create your own file please follow the following format in submitting your data and send the files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a>.
Fields indicated in <span class="blue"><b>blue</b></span> are required. Fields marked with an asterisk(*) can have more than one entry but the entries must be separated by a pipe with no intervening spaces (e.g. Ecker,Joseph|Bell,Callum). 
Please include the column headers as the first line in your files.</p>
</dl>
<P>If you have any questions or suggestions, please contact us at: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>

<P>
   <DT><b><u>Description of column headers</u></b><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
    <TR><TH><B>Field</B></TH>
        <TH><B>Description</B></TH>
        <TH><B>Values/Constraints</B></TH>
        <TH><B>Examples</B></TH></TR>

<TR><TD valign=top><span class="blue"><b>Contact Person/<br>Submitter</B></span>*</TD>
        <TD>Name of the person we can contact if we have questions about the annotation</TD>
        <TD>none</TD>
        <TD>Eva Huala</TD></TR>

<TR><TD valign=top><span class="blue"><b>Locus Identifier</b></span></TD>
        <TD>AGI locus id or name of genetic locus</TD>
        <TD>At#g#####, see <a href="/portals/nomenclature/guidelines.jsp#locus" target="display">AGI coding convention</A> if the gene is new, splitting or merging existing genes</TD>
        <TD>AAAP or At1g10010</TD></TR>
        
<TR><TD valign=top><b>Gene Name</b></TD>
        <TD>symbol-based name of gene, if this exists</TD>    
        <TD>See <a href = "/portals/nomenclature/guidelines.jsp#genes">nomenclature guidelines</a></TD>
        <TD>ETO1</TD></TR>

<TR><TD valign=top><span class="blue"><b>Reference</b></span>*</TD>
        <TD>PubMedID, citation or personal communication</TD>
        <TD>PubMed ID can be obtained from <A href="/servlets/Search?action=new_search&type=publication" target="display">TAIR Publication Search</A> or <A href="http://www.ncbi.nih.gov/entrez/query.fcgi" target="display">Entrez-PubMed</A> </TD>
        <TD>PubMedID:14576282; <br>Smith (2006) Science 123:23;<br> Jones (2006) Nature (in press);<br> Huala, personal communication</TD></TR>


<TR><TD valign=top><span class="blue"><b>Gene function, process, location or interacting partner</span></b></TD>
        <TD>functional annotation that you'd like to make</TD>    
        <TD>For interacting partners, please use the AGI code (At1g01010.1) in addition to the gene name</TD>    
        <TD>ser/thr kinase, outer mitochondrial membrane, anther, gynoecium morphogenesis, At1g01010.1(ABC1)</TD></TR>    

<TR><TD valign=top><b>Method description</b></TD>
        <TD>Method and evidence used to support the functional annotation</TD>    
        <TD>A list of method descriptions is given as the second sheet of the Excel workbook</TD>
        <TD>enzyme assay, mutant phenotype, transcript levels, yeast two-hybrid-assay</TD></TR>		

      </TABLE>

      
      
<P><center>Last modified on June 23, 2006</center></p>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


