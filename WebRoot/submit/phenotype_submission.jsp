<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Data Submission - Phenotype Submission";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="128" />
</jsp:include>

<jsp:include page="/jsp/includes/datasubmissionSidebar.jsp" flush ="true">
<jsp:param name="sidebarName" value="Phenotypes" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->

<span class="mainheader">Phenotype Submission</span>

<p>This document contains information on how to submit phenotype data to TAIR. We accept phenotype data for all mapped and/or
sequenced Arabidopsis mutants, including existing ABRC stocks, stocks from other stock centers, and lines that have not been
deposited in a public repository. If you are submitting phenotype data for stocks not in ABRC we encourage you to consider also
submitting the seed stock.  A form for seed stock submission to ABRC can be found <a href = "https://abrc.osu.edu/donate-stocks">here</a>.</p>

<p>Please submit your phenotype data in one of the following ways:</p>

<dl><P>Option 1) Use a preformatted Excel spreadsheet.
To submit your data, please download and complete the following Excel spreadsheet. Examples are provided for each column. Send completed files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>

<p><a href="ftp://ftp.arabidopsis.org/home/tair/Data_Submission/phenotype_data_form.xls">Download: phenotype_data_form.xls</a></p>
</dl>
<dl>
<P>Option 2) Send tab-delimited data from any program.
If you want to create your own file please follow the following format in submitting your data and send the files to: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a>.
Please include the column headers as the first line in your files.</p>
</dl>


<P>If you have any questions or suggestions, please contact us at: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>

<P>
   <DT><b><u>Description of column headers</u></b><p>
  <TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
    <TR><TH><B>Field</B></TH>
        <TH><B>Description</B></TH></TR>

<TR><TD valign=top><b>Contact Person</B></TD>
        <TD>Please provide name and email of the contact person/corresponding author</TD>
</TR>

<TR><TD valign=top><b>Reference (Pubmed ID, DOI, or other format)</b></TD>
        <TD>PMID: 18485063 - we prefer Pubmed ID, but the following format without Pubmed ID is OK too:Plant J (2008), 55: 798</TD>
    </TR>
        
<TR><TD valign=top><b>Allele Symbol / Polymorphism Name</b></TD>
        <TD>For example: rpp3, rpp4(SALK_12345), atswc6(SAIL_1142_C03)</TD>    
        </TR>

<TR><TD valign=top><b>Accession</b></TD>
        <TD>Example, Ws, Col-0</TD>
        </TR>

<TR><TD valign=top><b>Locus</b></TD>
        <TD>If this polymorphism is an allele of a locus, enter the unique locus code here. Otherwise, leave empty.  Example: AT4G32520</TD>
        </TR>
        
<TR><TD valign=top><b>Mutagen</b></TD>
        <TD>EMS, X-rays, T-DNA insertion, transposon, fast neutron etc.</TD>
        </TR>

<TR><TD valign=top><b>Mutation Site</b></TD>
        <TD>Please describe the mutation site (3rd intron, 2nd exon, promoter, 3'UTR, 5'UTR etc).  Please also give details of the mutation if known (for instance, contains a G to A subsitution at nucleotide position 123)</TD>
       </TR>
    <TR><TD valign=top><b>Genotype</b></TD>
        <TD>Select from homozygous, heterozygous, hemizygous, and unknown.</TD>
       </TR>
    <TR><TD valign=top><b>Inheritance</b></TD>
        <TD>Select from dominant, recessive, incompletely dominant, co-dominant, and unknown.</TD>
       </TR>
    <TR><TD valign=top><b>Allele Mode</b></TD>
        <TD>Select from hypermorphic, hypomorphic, haplo-insufficient, antimorphic, gain-of-function, loss-of-function, and unknown.</TD>
       </TR>
    <TR><TD valign=top><b>Phenotype</b></TD>
        <TD>Please provide a brief description of the mutant phenotype.  Note: please specify if the phenotype is for double/triple mutants (for example, mop3/mop4).</TD>
       </TR>

      </TABLE>

      
      
<P><center>Last modified on August 4, 2011</center></p>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


