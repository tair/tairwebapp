<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Data Submission - Functional Genomics Project Gene List";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="130" />
</jsp:include>

<jsp:include page="/jsp/includes/datasubmissionSidebar.jsp" flush ="true">
<jsp:param name="sidebarName" value="2010 Functional Genomics Gene List" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->

<span class="mainheader">Functional Genomics Project Gene List</span>
<P>
If you are working on a group of genes as a part of a functional genomics initiative, we would like to include your gene list in the 2010 projects section.
Please submit your data in one of the following ways:</p>
<dl>
<P>
Option 1) Use a preformatted Excel spreadsheet.
To submit your data, please download and complete the following excel spreadsheet. Note that examples are provided, and an arrow <img src="/images/small_arrow.gif" alt="(red arrow)"> will appear next to incorrectly formatted data in the genbank accession and chromosomal locus columns. Before submitting your data, review any entries marked with <img src="/images/small_arrow.gif" alt="(red arrow)"> to ensure that the data is correct. Send completed files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>
<P>
Note: Macros must be enabled for this form to work properly. To allow the macros in this form to run, please change your macro security level to medium (recommended) or low. From the Tools menu, choose Macro, then Security. After you change the security level to medium or low, you will have to restart Excel.</p>
<p>
<a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/functional_genomics_data_form.xls">Download: functional_genomics_data_form.xls</a></p>
</dl>
<dl> <P>
Option 2) Send tab-delimited data from any program.
If you want to create your own file please follow the following format in submitting your data and send the files to: curator@arabidopsis.org 
Fields indicated in <span class="blue"><b>blue</b></span> are required. Fields marked with an asterisk(*) can have more than one entry but the entries must be seperated by a colon with no intervening spaces. 
Please include the column headers as the first line in your files.</p>
</dl>
<P>

If you have any questions or suggestions, please contact us at: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>

	    
	  <p>
<TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
      <TR><TH><B>Field</B></TH>
	          <TH><B>Description</B></TH>
		              <TH><B>Values/Constraints</B></TH>
				          <TH><B>Example</B></TH></TR>

<tr><TD valign=top>GenBank accession</td>
    <td>&nbsp;</td>
	<td>&nbsp;</td>
	    <td>BH173012</td></tr>


<TR><TD valign=top><span class="blue"><B>Chromosome based name</B></span></TD>
          <TD>&nbsp; </TD>
	              <TD>At#g#####, see <A href="/portals/nomenclature/guidelines.jsp" target="display">AGI coding convention</A> if the gene is new, spliting or merging existing genes</TD>
			          <TD>AT1G23450</TD></TR>
				  


<tr><TD valign=top>Gene name*</td>
    <td>gene symbolic name and/or full name</td>
	<td>symbolic names and full names should be listed in one column and separated with a colon</td>
	    <td>AG:AGAMOUS</td></tr>
	    




<tr><td valign=top><span class="blue"><B>Proposal title</b></span> </td>
    <td>&nbsp;</td>
	<td>&nbsp;</td>
	    <td>Developing Paradigms for
	                                       Functional
	                                       Genomics of
	                                       Protein Kinases
	                                       and
	                                       Phosphoproteins
	                                       Using the CDPK
	                                       Superfamily </td></tr>

<tr><td valign=top><span class="blue"><B>Proposal number</b></span> </td>
      <td>proposal ID</td>
	          <td>&nbsp;</td>
		                  <td>114769</td></tr>
				  
<tr><td valign=top><span class="blue"><B>Lead PI name + email</B></span></td>
      <td>&nbsp;</td>
	          <td>First name Surname (email)</td>
		                  <td>Alice Harmon (harmon@botany.ufl.edu)</td></tr>
				  
				  

<tr><td valign=top>Comment</td>
    <td>&nbsp;</td>
	<td>any short comment</td>
	    <td>gene family name tentative </td></tr>

	    
<tr><td valign=top>Granting agency</td>
      <td>name of granting agancy</td>
	          <td>&nbsp;</td>
		                  <td>NSF</td></tr>
				  
<tr><td valign=top>Website URL</td>
  <td>&nbsp;</td>
      <td>&nbsp;</td><td>&nbsp;</td></tr>
</table>

      
<P>
<center>Last modified on March 1, 2006</center>
</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


