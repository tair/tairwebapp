<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Data Submission - Marker Data Submission";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="126" />
</jsp:include>

<jsp:include page="/jsp/includes/datasubmissionSidebar.jsp" flush ="true">
<jsp:param name="sidebarName" value="Marker and Polymorphism Data" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->

<span class="mainheader">Marker Data Submission</span>

<p>
We encourage users of TAIR to share their marker/polymorphism data with the research community. If you are submitting more than 150 entries, please e-mail <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a> for additional instructions otherwise please submit your data by using the following preformatted spreadsheet:</p>
<P>
<dl>

<p>
<a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/marker_polymorphism_data_form.xls">Download: marker_polymorphism_data_form.xls</a></p>
<p>Send completed marker files or any related questions to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>
</dl>
<dl>
<h3>Instructions on how to use the preformatted spreadsheet:</h3>
<p>If available, always indicate the digest pattern/PCR length/base pair of Col-0 as a reference (not necessary for deletions/insertions). Examples:</p>
<table  align="center" border="1" cellspacing="0" cellpadding="2">
<tr>
    <th>Marker Name</th>
    <th>Marker Type</th>
    <th>Polymorphism Type</th>
    <th>Polymorphism</th>
    <th>Restriction Site</th>
    <th>Ecotype</th>
</tr>
<tr>
    <td>MARKER1</td>
    <td>CAPS</td>
    <td>digest_pattern</td>
    <td>400;230</td>
    <td>1</td>
    <td>Col-0</td>
</tr>
<tr>
    <td>MARKER1</td>
    <td>CAPS</td>
    <td>digest_pattern</td>
    <td>630</td>
    <td>0</td>
    <td>Hi-0</td>
</tr>
<tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
</tr>
<tr>
    <td>MARKER2</td>
    <td>SNPlex</td>
    <td>SNP</td>
    <td>G</td>
    <td>&nbsp;</td>
    <td>Col-0</td>
</tr>
<tr>
    <td>MARKER2</td>
    <td>SNPlex</td>
    <td>SNP</td>
    <td>A</td>
    <td>&nbsp;</td>
    <td>Hi-0</td>
</tr>

</table>

<p>In the case where a marker or polymorphism is shared by several ecotypes, please list all ecotypes in the same row, as shown in this example: </p>

<table  align="center" border="1" cellspacing="0" cellpadding="2">
<tr>
    <th>Marker Name</th>
    <th>Marker Type</th>
    <th>Polymorphism Type</th>
    <th>Polymorphism</th>
    <th>Ecotype</th>

</tr>
<tr>
    <td>MARKER3</td>
    <td>SSLP</td>
    <td>PCR_product_length</td>
    <td>165</td>
    <td>Col-0;Gr-6;Gu-0</td>
</tr>
<tr>
    <td>MARKER3</td>
    <td>SSLP</td>
    <td>PCR_product_length</td>
    <td>150</td>
    <td>RLD;Wil-1;Wt-5</td>
</tr>

</table>


<p>Fields indicated in <span class="blue"><b>blue</b></span> are required. Fields marked with an asterisk (*) can contain multiple entries but these must be separated by a semicolon with no intervening spaces (e.g. Col-0;Ler-0). Note that examples have been included in the column headers; please retain headers as the first line in your files. You can find your Community ID and the Citation/Reference ID by using the links to our TAIR search pages provided in the template below. </p>
</dl>
<p>

If you have any questions or suggestions, please contact us at: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>

<p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">

    <TR><TH><B>Field</B></TH>
        <TH><B>Description</B></TH>
        <TH><B>Values/Constraints</B></TH>
        <TH><B>Example</B></TH></TR>
        

	<TR><TD valign=top><span class="blue"><b>Contact Person Name</B></span>*</TD>
        <TD>Last name,First name</TD>    
        <TD>No space between first and last names or between semicolon</TD>
        <TD>Buschmann,Henrik</TD></TR>

	<TR><TD valign=top><span class="blue"><b>Contact Person Community ID</b></span>*</TD>
        <TD>unique identifier for a community member in TAIR. You must be registered to have a community ID</TD>    
        <TD>TAIR accession from <a href="/servlets/Search?action=new_search&type=community" target="display">TAIR Community Search</A></TD>
        <TD>community:1035</TD></TR>

		
	<TR><TD valign=top><span class="blue"><b>Contact Person E-mail Address</b></span></TD>
        <TD>current email address</TD>    
        <TD>&nbsp;</TD>
        <TD>buschmann@gsf.de</TD></TR>

	<TR><TD valign=top><span class="blue"><b>Marker/Polymorphism Name</b></span></TD>
        <TD>&nbsp;</TD>    
        <TD>&nbsp;</TD>
        <TD>PT1 or Salk_0228</TD></TR>

	<TR><TD valign=top>Alternative Names*</TD>
        <TD>&nbsp;</TD>    
        <TD>&nbsp;</TD>
        <TD>AtPT1</TD></TR>
	
	<TR><TD valign=top><span class="blue"><b>Chromosome</b></span></TD>
        <TD>The chromosome in which the marker/polymorphism is found</TD>    
        <TD>1,2,3,4,5 or unknown</TD>
        <TD>5</TD></TR>

	<TR><TD valign=top><span class="blue"><b>Genetic Marker Type</B> </span></TD>
        <TD>&nbsp;</TD>    
        <TD>CAPS, SSLP, AFLP, RFLP, RAPD, SNPlex or Taqman</TD>
        <TD>CAPS</TD></TR>

	<TR><TD valign=top><span class="blue"><b>Polymorphism Type</b> </span></TD>
        <TD>Dependent on Marker Type</TD>    
        <TD>Digest_pattern (CAPS or RFLP), PCR_product_length (SSLP, AFLP, or RAPD), substitution, insertion, deletion</TD>
        <TD>Digest_pattern</TD></TR>
	
	
	<TR><TD valign=top><span class="blue"><b>Polymorphism Lengths</b> </span>*</TD>
        <TD>Length of digest or PCR product</TD>    
        <TD>numeric, in kb or bp</TD>
        <TD>0.12, 120</TD></TR>

	
	<TR><TD valign=top><span class="blue"><b>Polymorphism Length Units</b> </span></TD>
        <TD>&nbsp;</TD>    
        <TD>bp or kb</TD>
        <TD>kb</TD></TR>

	<TR><TD valign=top><span class="blue"><b>Flank Sequence Type</b></span></TD>
        <TD>Required for all but RFLP submissions</TD>
	  <TD>PCR_primer or Flank</TD>
        <TD>flank</TD></TR>

		<TR><TD valign=top><span class="blue"><b>Flank Sequence 1</b></span></TD>
        <TD>Required for all but RFLP submissions. The first PCR primer sequence </TD>         <TD>&nbsp;</TD>
        <TD>ATGGTGCCGTGACGT</TD></TR>

		<TR><TD valign=top><span class="blue"><b>Flank Sequence 2</b></span></TD>
        <TD>Required for all but RFLP submissions. The second PCR primer sequence</TD>         <TD>&nbsp;</TD>
        <TD>AATTGGGTGTGCTAG</TD></TR>

	<TR><TD valign=top>Special Conditions</TD>
        <TD>Indicate any special conditions required for marker detection</TD>    
        <TD>&nbsp;</TD>
        <TD>annealing temp 62C</TD></TR>

	<TR><TD valign=top><span class="blue"><b>Restriction Enzyme Name</b></span>*</TD>
        <TD>Name of the restriction enzyme used to detect the polymorphism for CAPS, AFLP, or RFLP markers. </TD>    
        <TD>consult REBASE for standard enzyme name.</TD>
        <TD>HindIII;EcoRV</TD></TR>

	<TR><TD valign=top>Restriction Enzyme Number of sites*</TD>
        <TD>Number of recognition sites for each restriction enzyme. The order of number of sites should match the order of restriction enzyme names in previous column.</TD>    
        <TD>numeric</TD>
        <TD>3</TD></TR>


	<TR><TD valign=top><span class="blue"><b>Ecotype/Accession Name</B></span>*</TD>
        <TD>The ecotype which shows the specific polymorphism. If more than one ecotype shares a polymorphism, list all ecotypes.</TD>    
        <TD>Col-0 should always be shown as reference</TD>
        <TD>Col-O;RLD;Ler</TD></TR>

	<TR><TD valign=top>Accession Stock ID</TD>
        <TD>For accessions that correspond to an ABRC stock, this is the stock ID number for that accession.</TD>    
        <TD>&nbsp;</TD>
        <TD>CS3455;CS3444</TD></TR>

	<TR><TD valign=top>Polymorphic Sequence</TD>
        <TD>Sequence of the polymorphic region for the given ecotype/accession</TD>    
        <TD>&nbsp;</TD>
        <TD>ATGTGGCCTCTT</TD></TR>
        
    <TR><TD valign=top>Map Position1</TD>
        <TD>Position of the SNP, insertion site, start position of 5' PCR primer/flanking sequence </TD>    
        <TD>&nbsp;</TD>
        <TD>20215474</TD></TR>
        
    <TR><TD valign=top>Map Position2</TD>
        <TD>End position of 3' PCR primer/flanking sequence</TD>    
        <TD>&nbsp;</TD>
        <TD>26877049</TD></TR>
        
    <TR><TD valign=top>TAIR Version</TD>
        <TD>version of the TAIR genome assembly that your experiment is based on</TD>    
        <TD>&nbsp;</TD>
        <TD>TAIR9 </TD></TR>

	<TR><TD valign=top>Inheritance</TD>
        <TD>The mode of inheritance of the polymorphism</TD>    
        <TD>recessive, dominant, co-dominant, semi-dominant, unknown</TD>
        <TD>dominant</TD></TR>

	<TR><TD valign=top>Marker/Polymorphism Citation/Reference_id</TD>
        <TD>For a reference that describe the marker/polymorphism, this is the unique identifier in TAIR. For articles referring to the markers that are not yet in TAIR, please contact a curator to update this information into the database when the paper is published.</TD>    
        <TD>TAIR accession from <A href="/servlets/Search?action=new_search&type=publication" target="display">TAIR Publication Search</A></TD>
        <TD>publication:12344</TD></TR>
	
</TABLE>

      
<P>
<center>Last modified on Novemeber 24, 2009</center>
</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


