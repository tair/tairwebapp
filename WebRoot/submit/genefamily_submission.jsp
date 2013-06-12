<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Data Submission - Gene Family Data Submission";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="122" />
</jsp:include>

<jsp:include page="/jsp/includes/datasubmissionSidebar.jsp" flush ="true">
<jsp:param name="sidebarName" value="Gene Family Data" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->

<span class="mainheader">Gene Family Data Submission</span>

<dl>
<p>
We encourage users of TAIR to share their gene family data with the research community (gene families with criteria based solely on sub-cellular localization will not be accepted). 
To submit your data, please download and complete the following excel spreadsheet:<br />
<a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/gene_family_submission_form07.xls">Download: gene_family_submission_form07.xls</a>
</p>

<P>Note that <i>examples</i> are provided in the second row of the spreadsheet. Fields indicated in <span class="purple">purple</span> are required. Fields marked with an asterisk (*) can have more than one entry, but the entries must be separated by a semicolon with no intervening spaces (e.g. Ecker,Joseph;Bell,Callum). A publication and/or a URL can be used as a reference for your gene family.
</p>
<p>Send completed files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>


<P>
If you have any questions or suggestions, please contact us at: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>
 
<p>Please refer to the table below for a specific example on how to fill out the spreadsheet.</p>
<p>
</dl>
 <Table  align="center" border="1" cellspacing="0" cellpadding="2">
    <TR><TH><B>Field</B></TH>
        <TH><B>Description</B></TH>
        <TH><B>Values/Constraints</B></TH>

        <TH><B>Example</B></TH></TR>
        

<tr><TD valign=top><span class="purple"><b>Gene Family Name</B></span></TD>
    <td>gene family name</td> 
    <td>&nbsp;</td>	
    <td>Low affinity calcium antiporter CAX2 family</td></tr>

<tr><TD valign=top><b>Sub Family Name</B></TD>
    <td>sub family name</td> 
    <td>&nbsp;</td>	
    <td>&nbsp;</td></tr>

<tr><TD valign=top><span class="purple"><b>Gene Name</b></span></TD>
    <td>gene symbolic name and/or full name</td> 
    <td>symbolic names and full names should be separated with a colon</td>	
    <td>AtCAX3</td></tr>

<tr><TD valign=top>Alternate Gene Name*</TD>
    <td>gene symbolic name and/or full name</td> 
    <td>&nbsp;</td>	
    <td>AtHCX1</td></tr>

<tr><TD valign=top>BAC Locus Tag</TD>
    <td>the BAC locus name</td> 
    <td>&nbsp;</td>	
    <td>F20N2_23</td></tr>

<tr><td valign=top><span class="purple"><B>Genomic Locus Tag</B></span></TD>
          <TD>&nbsp; </TD>
	              <TD>At#g#####, see <A href="/portals/nomenclature/guidelines.jsp" target="display">AGI coding convention</A> if the gene is new, spliting or merging existing genes</TD>

			          <TD>AT3g51860</TD></TR>

<tr><TD valign=top><b>GI</b></TD>
    <td>GenBank identifier</td> 
    <td rowspan=3>Please enter at least one of these three GeneBank Accessions</td>	
    <td>30693547</td></tr>
<tr><TD valign=top><b>Refseq_ID*</b></TD>
    <td>GenBank locus</td> 
    <td>NM_115045.2</td></tr>

<tr><TD valign=top><b>Entrez_GeneID</b></TD>
    <td>GenBank GeneID</td> 
    <td>824349</td></tr>

			  
<tr><td <b>GenBank Nucleotide Accession</b></TD>
    <td></td> 
    <td rowspan='2'>You must provide either the Nucleotide or Protein accession from GenBank.<br>Both accessions are preferred if available.</br></td>	
    <td>AY251394</td></tr>   

    


<tr>
    <td><b>GenBank Protein Accession</b></td> 
    <td></td>
	
    <td>AAF79505</td></tr>   
	
<tr><TD valign=top><span class="purple"><b>Protein Function</b></span></TD>
    <td>Short description of the function of the protein</td> 
    <td>free text field</td>	
    <td>Ca2+/H+-exchanging protein</td></tr> 
    
<tr><TD valign=top>Comments</TD>
    <td>Miscellaneous comments, and data not requested elsewhere may be added here.</td> 
    <td>&nbsp;</td>	
    <td>&nbsp;</td></tr>

	
 <tr><td valign=top><span class="purple"><b>Gene Family Criteria</b></span>*</td>

<td>methods used to derive the gene family. Criteria based solely on subcellular localisation will not be accepted</td>
<td>can include a description of sequence or structural similarity, algorithms and databases accessed, or the cutoff P-value used to detemine the gene family</td>
    <td>A thorough molecular characterisation of
the CBL and CIPK protein families by analysing their expression,
subcelluar localisation, biochemical properties and interaction
specificity</td></tr>

<tr>
    <td><span class="purple"><b>Similar sequence and/or common domain</b></span>*</td> 
    <td>GenBank Accession(nucleotide and/or protein) and/or domain name(Interpro or other) for the sequence used in the analysis</td>	
    <td>You must provide either the accession from GenBank and/or the domain name</td>

    <td>AY251394 and/or IPR000003</td></tr> 

<TR><TD valign=top><b>TAIR Community Accession (Person)</B>*</TD>
        <TD>unique identifier for a community member in TAIR. You must be registered to have a community ID</TD>    
        <TD>TAIR accession from <a href="/servlets/Search?action=new_search&type=community" target="display">TAIR Community Search</a> which is the number located next to Person:</TD> 
        <TD>6083</TD></TR>

<TR><TD valign=top><span class="purple"><b>TAIR Community Accession (Organization/Lab)</B></span>*</TD>
        <TD>unique identifier for an orginazation/lab in TAIR. You must be registered to have a community ID</TD>    
        <TD>TAIR accession from <a href="/servlets/Search?action=new_search&type=community" target="display">TAIR Community Search</A> which is the number located next to Organization:
        <TD>5</TD></TR>
	


		<TR><TD valign=top><span class="purple"><b>TAIR publication reference</B>*</TD>
	<td>&nbsp;</td>
	<td>TAIR accession from <a href="/servlets/Search?action=new_search&type=publication" target="display">TAIR Publication Search </A> which is the number located next to Publication:</td>
		            <td>142</td></tr>
                    
                    

<tr>
<td><b>Pubmed ID</b></td>

<td>Journal Reference</td>  
<td>if not yet in PubMed, please send author(s), title, (expected date of publication) and journal name</td>
<td>17203484G <br> <b>or</b></b><br>Koh, S.,Wiles, A. M.,Sharp, J. S.,Naider, F. R.,Becker, J. M.,Stacey, G. An oligopeptide transporter gene family in Arabidopsis.(January 2002) PLANT PHYSIOLOGY</td>
</tr>

<tr>
</tr>    

    <TR><td>Web Page URL</TD>
<td>URL for gene family or laboratory website</td>

<td>&nbsp;</td>
<td>http://www.cbs.umn.edu/ arabidopsis/</td>   </tr> 

<tr><td>Web Page Title</TD>
<td>Title of the website</td>
<td>&nbsp;</td>
<td>Arabidopsis Membrane Protein Library</td></tr>    




		      </table> 
<p>
<center>Last modified on May 2, 2007</center>
</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


