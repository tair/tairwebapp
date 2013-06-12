<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Data Submission - Locus Identifier Request Guidelines";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="125" />
</jsp:include>

<jsp:include page="/jsp/includes/datasubmissionSidebar.jsp" flush ="true">
<jsp:param name="sidebarName" value="Locus Identifier Request" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->

<span class="mainheader">Locus Identifier Request Guidelines</span>

<p>TAIR is now the central agency responsible for assigning Arabidopsis locus identifiers. Consistency of locus identifiers and avoidance of duplication can only be achieved if individuals do not assign locus identifiers on their own. If you would like TAIR to assign a locus identifier for you, 
please submit your data in one of the following ways:</br>
<dl>
<P>Option 1) Use a preformatted Excel spreadsheet.
To submit your data, please download and complete the following excel spreadsheet. Note that examples are provided, and an arrow <img src="/images/small_arrow.gif" alt="(red arrow)"> will appear next to incorrectly formatted data in the left and right flanking loci and genbank accession columns. Before submitting your data, review any to entries marked with <img src="/images/small_arrow.gif" alt="(red arrow)"> to ensure that the data is in the correct format. Send completed files to: curator@arabidopsis.org</p>
<P>Note: Macros must be enabled for this form to work properly. To allow the macros in this form to run, please change your macro security level to medium (recommended) or low. From the Tools menu, choose Macro, then Security. After you change the security level to medium or low, you will have to restart Excel.</p>
<p><a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/locus_identifier_request_data_form.xls">Download: locus_identifier_request_data_form.xls</a></p>
</dl>
<dl>
<P>Option 2) Send tab-delimited data from any program.
If you want to create your own file please follow the following format in submitting your data and send the files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a>.
Fields indicated in <span class="blue"><b>blue</b></span> are required. Fields marked with an asterisk(*) can have more than one entry but the entries must be seperated by a semicolon with no intervening spaces (e.g. Ecker,Joseph;Bell,Callum). 
Please include the column headers as the first line in your files.</p>
</dl>
<P>If you have any questions or suggestions, please contact us at: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>
<P><b><u>Description file</u></b></p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
    <TR><TH><B>Field</B></TH>
        <TH><B>Description</B></TH>
        <TH><B>Values/Constraints</B></TH>
        <TH><B>Example</B></TH></TR>
        


<TR><TD valign=top>Gene name</TD>
        <TD>gene symbolic name and/or full name</TD>    
        <TD>symbolic names and full names should be listed in one column and separated with a colon</TD>
        <TD>AG:AGAMOUS</TD></TR>

<TR><TD valign=top><span class="blue"><b>Gene description</b></span></TD>
        <TD>description of the gene</TD>    
        <TD>&nbsp;</TD>
        <TD>&nbsp;</TD></TR>


<TR><TD valign=top><span class="blue"><b>Left Flanking Locus</b></span></TD>
        <TD>&nbsp;</TD>    
        <TD>At#g#####, see <a href="/portals/nomenclature/guidelines.jsp" target="display">AGI coding convention</A> if the gene is new, spliting or merging existing genes</TD>
        <TD>AT1G23450</TD></TR>

<TR><TD valign=top><span class="blue"><b>Right Flanking Locus</b></span></TD>
        <TD>&nbsp;</TD>    
        <TD>At#g#####, see <a href="/portals/nomenclature/guidelines.jsp" target="display">AGI coding convention</A> if the gene is new, spliting or merging existing genes</TD>
        <TD>AT1G23460</TD></TR>


<TR><TD valign=top><span class="blue"><b>cDNA Sequence</b></span></TD>
        <TD>&nbsp;</TD>    
        <TD>&nbsp;</TD>
        <TD>gaacaacattgagaagtcatgtaatgt</TD></TR>

<TR><TD valign=top>Protein Sequence</TD>
        <TD>The protein sequence will help us determine the correct translational start and stop</TD>    
        <TD>&nbsp;</TD>
        <TD>MGLVNEVELKSLLEQETDSP</TD></TR>

<TR><TD valign=top>GenBank accession</TD>
        <TD>&nbsp;</TD>    
        <TD>&nbsp;</TD>
        <TD>AAF79505</TD></TR>


	<TR><TD valign=top><span class="blue"><b>Contact person name</B></span>*</TD>
        <TD>Last name,First name</TD>    
        <TD>no space between first and last names or between semicolon</TD>
        <TD>Henry,John</TD></TR>


	
	<TR><TD valign=top><span class="blue"><b>Contact person TAIR community accession</b></span>*</TD>
        <TD>unique identifier for a community member in TAIR. You must be registered to have a community ID</TD>    
        <TD>TAIR accession from <a href="/servlets/Search?action=new_search&type=community" target="display">TAIR People/Labs Search</A></TD>
        <TD>person:1035</TD></TR>

<TR><TD valign=top><span class="blue"><b>Method description</b></span></TD>
        <TD>method used to derive the structural annotation</TD>    
        <TD>&nbsp;</TD>
        <TD>full-length cDNA clone sequencing</TD></TR>		
	
	

	<TR><TD valign=top rowspan="2">Publication</TD>
        <TD>please use the unique TAIR publication accession.</TD>    
        <TD>TAIR accession from <A href="/servlets/Search?action=new_search&type=publication" target="display">TAIR Publication Search</A></TD>
        <TD>publication:12344</TD></TR>

	
	<TR>
        <TD>Citation for reference(s) that are not in the TAIR database please contact a <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator</A> to update this information into the database when the paper is published.</TD>    
        <TD>&nbsp;</TD>
        <TD>Lewis, J and Martin, D (2001) Identification of a locus required for funny bone development. Antics 14:3001-3903</TD></TR>

<tr><td>URL</td>
  <td>&nbsp;</td>
      <td>&nbsp;</td>
	<td>http://www.humor.edu</td>



      </TABLE>

      
<p>
<b><u>FASTA files</u></b></p>
 <p>   We would request that you send three FASTA files using the following header format:<br>
    <span class="blue"><b>>Chromosome based locus name|Other name|Contact person name</b></span></p>
<p> <dl>
<dt>1. <b>FASTA.pep</b></dt>
   <dd>Should contain translated amino acid sequence.</dd>
<dt>2. <b>FASTA.transcript</b></dt>
<dd>Does not include introns, but includes untranslated regions. e.g. mRNA</dd>
<dt>3. <b>FASTA.genomic</B></dt>
<dd>Unprocessed transcript sequence, including introns, and 500 base pairs of &nbsp;&nbsp;upstream and downstream sequences from the start and end of the transcript</dd>

</dl>

</p>    
<p>
<center>Last modified on March 1, 2006</center>
</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


