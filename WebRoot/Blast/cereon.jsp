<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">


<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR BLAST") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("2") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("/Blast/BLAST_help.jsp") %>' />
<jsp:param name="colspan" value="3" />
</jsp:include>

	    <span class="header">TAIR BLAST 2.2.8</span><BR>
	    
<jsp:include page="/jsp/includes/toolsminiheader.jsp" flush ="true">
<jsp:param name="link" value="Blast" />
</jsp:include>

<p>
     <B>Please note that this form uses <a href="http://www.ncbi.nlm.nih.gov/BLAST/blast_help.html">NCBI BLAST2.2.8</a>, and NOT <a href="http://blast.wustl.edu/blast/README.html">WU-BLAST2.0</a>.</B><br>

    <form name="myForm" ENCTYPE="multipart/form-data" METHOD="POST" ACTION="/cgi-bin/Blast/TAIRblast.pl">

     <table width="602" border="0">
        <tr>
           <td>

          <table>
      	    
        <tr>
                <td colspan="3">    

	  </TD>
	</TR>

	<TR>
	  <TD><a href="/help/helppages/BLAST_help.jsp#methods">BLAST</a>&#8482; program
	  </TD>

	  <TD COLSPAN=2>
	    <select name="Algorithm" size ="1">
	      <option selected value="blastn">BLASTN: NT query, NT db</option>
	      <option value="tblastn">TBLASTN: AA query, NT db</option>
	      <option value="tblastx">TBLASTX: NT query, NT db (All 6 Frames)</option>
	    </select>
	    
	  </TD>
	</TR>


	<TR>
	  <TD><a href="/help/helppages/BLAST_help.jsp#datasets">Dataset:</a><img src="/images/new.gif">
	  </TD>

	  <TD COLSPAN=2>
	    <select name="BlastTargetSet">
	      <OPTION  SELECTED VALUE="Cereon_Ath_Ler">Landsberg Sequence from Cereon, Total Genome (DNA)</OPTION>
	    </select>
	    
	  </TD>
	</TR>

	<TR >
	  <TD COLSPAN="3" ALIGN=right>
	    <INPUT TYPE="reset" VALUE="Reset">&nbsp;&nbsp;
	    <INPUT TYPE="submit" VALUE="Run BLAST">
	  </TD>
	</TR>
	


	
	<TR>
	  <TD>

	    <B>Input</B>:<BR> <INPUT TYPE=RADIO NAME="textbox" VALUE="seq"  CHECKED> <a href="/help/helppages/BLAST_help.jsp#query">query sequence</a><BR> <INPUT TYPE=RADIO NAME="textbox" VALUE="locus"> locus name <BR> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(At1g01030)<BR><BR>
	  </TD>
	  
	  <TD COLSPAN=2>
	    <TEXTAREA NAME="QueryText" COLS=45 ROWS=10> </TEXTAREA>
	  </TD>
	</TR>
	
		
	<TR>
	  <TD>	    
	    <B>Upload</B> a file
	  </TD>

	  <TD COLSPAN="2">
	    <INPUT TYPE="FILE" NAME="upl-file" SIZE="35">
	  </TD>
	</TR>
      </TABLE>
        
 
      <table width="602" align="center" border="0" cellspacing="0" cellpadding="2">
	<TR>
	  <TD>
	    Raw, FASTA, GCG and RSF <a href="/help/helppages/BLAST_help.jsp#formats">formats</a> accepted.
	  </TD>
	</TR>
	
	
	<TR>
	  <TD>
	    <input type="checkbox" name="QueryFilter" value="T" checked>
	    <a href="/help/helppages/BLAST_help.jsp#filtering">Filter query</a><BR>
	    Please be patient. Replies directly to your browser may take a minute or two.<br>
	    Selecting an e-mail reply allows you to immediately request
	    more searches.
	  </TD>
	</TR>	


	<TR><TD>
	    <b>Results Return Options</b><BR>
	    <a href="/help/helppages/BLAST_help.jsp#results">Output Title</a>:
	  </TD></TR>
	<TR><TD>
	    <input TYPE="text" NAME="Comment"
	      value="optional, will be added to output for your use" SIZE="48" MAXLENGTH="100">
	    <BR>
	  </TD></TR>
	<TR><TD>
	    <a href="/help/helppages/BLAST_help.jsp#EMAIL">E-mail address:</a><BR>
	    <input TYPE="text" NAME="ReplyTo" SIZE="48"><BR>
	  </TD></TR>
	<TR><TD>
	    <a href="/help/helppages/BLAST_help.jsp#VIA">Return Results</a>:
	    <select NAME="ReplyVia" size="1">
	      <option selected value="BROWSER">To your web browser
	      <option value="EMAIL-MESSAGE">By E-mail message
	      <option value="EMAIL-URL">By E-mail notice to URL
	    </select>
	    <a href="/help/helppages/BLAST_help.jsp#VIA-form">Result Format</a>:
	    <select NAME="ReplyFormat" size="1">
	      <option selected value="HTML">HTML hypertext</option>
	      <option value="TEXT">Normal text</option>
	      <option value="XML">XML</option>
	      <option value="TABULAR">Tab-delimited records</option>
	      <option value="TABULAR_COMMENTED">Tab-delimited, commented</option>
              <option value="ASN">ASN</option>
	    </select>
	  </TD></TR>
      </table>
      
      <table border="0" width=600 align="center" cellspacing="0" cellpadding="2">
	<tr>
	  <td valign="middle" colspan="4">
	    <b>Advanced BLAST&#8482; <a href="BLASToptions.jsp">Parameter Options</a></b></td>
	</tr>
	<tr>
	  <td align="left">
	    <a href="/help/helppages/BLAST_help.jsp#matrix">Weight Matrix:</a></td>
	  <td width="150" valign="middle" align="center">
	    <select NAME="Matrix" size="1">
	      <option value="Blosum45"> blosum45
	      <option value="Blosum50"> blosum50
	      <option selected value="Blosum62"> blosum62
	      <option value="Blosum80"> blosum80
	      <option value="Blosum90"> blosum90
	      <option value="Pam30"> pam30
	      <option value="Pam70"> pam70
	      <option value="Pam250"> pam250
	    </select></td>
	  <td align="left"><a href="/help/helppages/BLAST_help.jsp#descriptions">Max Scores</a>:</td>
	  <td width="150" valign="middle" align="center"><input TYPE="text" NAME="MaxScores" SIZE="5" VALUE="100"></td>
	</tr>
   	<tr>
	  <td align="left"><a href="/help/helppages/BLAST_help.jsp#expect">Expectation:</a> </td>
	  <td width="150" valign="middle" align="center">
	    <select name="Expectation" size="1">
	      <option> 0.0001
	      <option value="0.001">0.001
	      <option> 0.01
	      <option value="0.1">0.1
	      <option> 1
	      <option selected> 10
	      <option> 100
	      <option> 1000
	    </select></td>
	  <td align="left"><a href="/help/helppages/BLAST_help.jsp#alignments">Max Alignments:</a></td>
	  <td width="150" valign="middle" align="center"><input type="text" name="MaxAlignments" SIZE="5" VALUE="50"></td>
	</tr>
   	<tr>
	  <td align="left"><a href="/help/helppages/BLAST_help.jsp#mismatch">Nucleic Mismatch</a>:</td>
	  <td width="150" valign="middle" align="center"><input type="text" name="NucleicMismatch" size="3" value="-3"></td>
	  <td align="left"><a href="/help/helppages/BLAST_help.jsp#gapped">Gapped Alignments:</a></td>
	  <td width="150" valign="middle" align="center">
	    <select name="GappedAlignment" size="1">
	      <option selected value="T">ON
	      <option value="F">OFF
	    </select></td>
	</tr>
   	<tr>
	  <td align="left"><a href="/help/helppages/BLAST_help.jsp#match">Nucleic Match</a>:</td>
	  <td width="150" valign="middle" align="center"><input type="text" name="NucleicMatch" size="3" value="1"></td>
	  <td align="left"><a href="/help/helppages/BLAST_help.jsp#open">Gap Opening Penalty:</a></td>
	  <td width="150" valign="middle" align="center"><input TYPE="text" NAME="OpenPenalty" SIZE="15" VALUE="0 (use default)"></td>
   	</tr>
 	<tr>
	  <td align="left"><a href="/help/helppages/BLAST_help.jsp#ext">Extension Threshold:</a></td>
	  <td width="150" valign="middle" align="center"><input TYPE="text" NAME="ExtensionThreshold" SIZE="15" VALUE="0 (use default)"></td>
	  <td align="left"><a href="/help/helppages/BLAST_help.jsp#extend">Gap Extension Penalty: </a></td>
	  <td width="150" valign="middle" align="center"><input TYPE="text" NAME="ExtendPenalty" SIZE="15" VALUE="0 (use default)"></td>
 	</tr>
	<tr align="center">
	  <td align="left"><a href="/help/helppages/BLAST_help.jsp#word">Word Size:</a></td>
	  <td  width="150" valign="middle" align="center"><input TYPE="text" NAME="WordSize" SIZE="15" VALUE="0 (use default)"></td>
          <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
	  <td colspan=4>&nbsp;</td>
	</tr>
	<tr><td colspan=2>
	    <a href="/help/helppages/BLAST_help.jsp#gencodes">Query and Database Genetic Code</a>:
	  </td>
	  <td colspan=2>
	    <select name="QueryGeneticCode" size="1">
	      <option value="1">Standard or Universal (default)
	      <option value="2"> Vertebrate Mitochondrial 
	      <option value="3"> Yeast Mitochondrial 
	      <option value="4"> Mold Mitochondrial 
	      <option value="5"> Invertebrate Mitochondrial 
	      <option value="6"> Ciliate Nuclear 
	      <option value="9"> Echinoderm Mitochondrial 
	      <option value="10"> Euplotid Nuclear 
	      <option value="11"> Bacterial 
	      <option value="12"> Alternative Yeast Nuclear 
	      <option value="13"> Ascidian Mitochondrial 
	      <option value="14"> Flatworm Mitochondrial 
	      <option value="15"> Blepharisma Macronuclear 
	    </select>
	  </td></tr>
	<tr><td colspan=4>&nbsp;</td></tr>
	
	<tr>
	  <td align="right" colspan=4>
	    <input type="hidden" NAME="PageType" VALUE="JavaScr">
	    <input type="reset" value="Reset">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" VALUE="Run BLAST">
	  </td>
	</tr>

	<tr><td colspan=4>&nbsp;</td></tr>
      </table>

      </td>
    </tr>
  </table>

 
    </form>
    
<!-- hhmts start -->
Last modified: Tue May 11 17:14:02 MDT 2004
<!-- hhmts end -->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
