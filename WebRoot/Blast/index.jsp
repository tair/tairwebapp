<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
    String sequence = "";
        String sequence_type = "";
    if (request.getParameter("sequence") != null)
    {
        sequence = request.getParameter("sequence");
    }
    if (request.getParameter("sequence_type") != null ) {
        sequence_type = (String) request.getParameter("sequence_type");
    }

%>

<%
String pageName = "TAIR - BLAST";
String cssfile="/css/page/search.css";
%>

<script type="text/javascript">
function updateDatabase() {
    var x = document.getElementById("default_db");
    var db = document.getElementById("BlastTargetSet");
    var Algorithm = document.getElementById("Algorithm").value;
    var not_match = "";
    if (Algorithm == "blastn" || Algorithm == "tblastx" || Algorithm == "tblastn") {
        not_match = "(Protein)";
    } else {
        not_match = "(DNA)";
    }
    db.options.length = 0;
    for (var i=0; i<x.length; i++){
        var cur_value = x[i].text;
        if (!cur_value.match(not_match)){
            var y = document.createElement("option");
            y.value = x[i].value;
            y.text = x[i].text;
            y.disabled = x[i].disabled; 
            //need to do try/catch command because of IE7
            try { db.add(y, null); } catch (ex) { db.add(y); }
        }
    }
}   

function setSequence( sequence_type ) {
    if (sequence_type == "protein" ) {
        document.getElementById("Algorithm").value = "blastp";
    } else if (sequence_type == "nucleotide") {
        document.getElementById("Algorithm").value = "blastn";
    }
    updateDatabase();
}
                                                                                                                                                                                            </script>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="74" />
</jsp:include>

<!-- CONTENT IN HERE -->
	    
	<span class="mainheader">TAIR BLAST 2.2.8</span>
	<p><b>Please note that this form uses <a href="http://www.ncbi.nlm.nih.gov/BLAST/blast_help.html">NCBI BLAST2.2.8</a>, and NOT <a href="http://www.advbiocomp.com/blast.html">WU-BLAST2.0</a>.</b>

	<div id="searchbox">
	<form name="myForm" ENCTYPE="multipart/form-data" METHOD="POST" ACTION="/cgi-bin/Blast/TAIRblast.pl">
	  <fieldset>
	  <legend>Blast</legend>
	    <dl>
	      <dt>
		<label for="name_type"><a href="/help/helppages/BLAST_help.jsp#methods">BLAST</a>&#8482; program</label>
	      </dt>
	  
	      <dd>
	    	<select id="Algorithm" name="Algorithm" size ="1" onChange="updateDatabase()">
	      	<option selected value="blastn">BLASTN: NT query, NT db
	      	<option value="blastp">BLASTP: AA query, AA db
	      	<option value="blastx">BLASTX: NT query, AA db
	      	<option value="tblastn">TBLASTN: AA query, NT db
	      	<option value="tblastx">TBLASTX: NT query, NT db (All 6 Frames)
	    	</select>
	      </dd>  
	      <dt>
		<label for="method"><a href="/help/helppages/BLAST_help.jsp#datasets">Datasets:</a></label>
	      </dt>
	  
          <dd>
            <%= HTMLFactoryWithCSS.createFastaSelect("default_db", "", false, "", "hidden", "default_db" ) %>
            <select name="BlastTargetSet" id="BlastTargetSet">
            </select>

          </dd>
	      <dt><B>Input</B>:<BR> <INPUT TYPE=RADIO NAME="textbox" VALUE="seq"  CHECKED> 
                    <a href="/help/helppages/BLAST_help.jsp#query">query sequence</a><BR> 
                    <INPUT TYPE=RADIO NAME="textbox" VALUE="locus"> locus name<BR>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(At1g01030)
	      </dt>
              <dd> 
		  <TEXTAREA NAME="QueryText" ROWS=5 COLS=45><%= sequence %></TEXTAREA>
	      </dd>
	  
	      <dt><B>Upload</B> a file</dt>
	      <dd>
	    	   <INPUT TYPE="FILE" NAME="upl-file" SIZE="35">
	      </dd>
	    </dl>      
	    Raw, FASTA, GCG and RSF <a href="/help/helppages/BLAST_help.jsp#formats">formats</a> accepted.
	    
	    <br />
	    <input type="checkbox" name="QueryFilter" value="T" checked>
	    <a href="/help/helppages/BLAST_help.jsp#filtering">Filter query</a><BR>

	    </fieldset>	


	<fieldset id="results">
	    <legend>
	    <b>Advanced BLAST&#8482; <a href="BLASToptions.jsp">Parameter Options</a></b>
	    </legend>
	    <span class="button"><a href="#" onclick="show_hide(this, 'dl'); return false;"><img src="/i/icon_minus.gif" alt="contract" /></a></span>

	  <dl>
	    <dt>
	    <a href="/help/helppages/BLAST_help.jsp#matrix">Weight Matrix:</a>
 	    </dt>
	    <dd>
	    <select NAME="Matrix" size="1">
	      <option value="Blosum45"> blosum45
	      <option value="Blosum50"> blosum50
	      <option selected value="Blosum62"> blosum62
	      <option value="Blosum80"> blosum80
	      <option value="Blosum90"> blosum90
	      <option value="Pam30"> pam30
	      <option value="Pam70"> pam70
	      <option value="Pam250"> pam250
	    </select>
	    </dd>

	    <dt><a href="/help/helppages/BLAST_help.jsp#descriptions">Max Scores</a>:</dt>
	    <dd><input TYPE="text" NAME="MaxScores" SIZE="5" VALUE="500"></dd>
	
	    <dt><a href="/help/helppages/BLAST_help.jsp#expect">Expectation:</a> </dt>
	    <dd>
	    <select name="Expectation" size="1">
	      <option> 0.0001
	      <option value="0.001">0.001
	      <option> 0.01
	      <option value="0.1">0.1
	      <option> 1
	      <option selected> 10
	      <option> 100
	      <option> 1000
	    </select>
	    </dd>
	    <dt><a href="/help/helppages/BLAST_help.jsp#alignments">Max Alignments:</a></dt>
	    <dd><input type="text" name="MaxAlignments" SIZE="5" VALUE="250"></dd>

  	    <dt><a href="/help/helppages/BLAST_help.jsp#mismatch">Nucleic Mismatch</a>:</dt>
	    <dd><input type="text" name="NucleicMismatch" size="5" value="-3"></dd>

	    <dt><a href="/help/helppages/BLAST_help.jsp#gapped">Gapped Alignments:</a></dt>
	    <dd>
	    <select name="GappedAlignment" size="1">
	      <option selected value="T">ON
	      <option value="F">OFF
	    </select>
	    </dd>
	    <dt><a href="/help/helppages/BLAST_help.jsp#match">Nucleic Match</a>:</dt>
	    <dd><input type="text" name="NucleicMatch" size="5" value="1"></dd>

	    <dt><a href="/help/helppages/BLAST_help.jsp#open">Gap Opening Penalty:</a></dt>
	    <dd><input TYPE="text" NAME="OpenPenalty" SIZE="15" VALUE="0 (use default)"></dd>

   	    <dt><a href="/help/helppages/BLAST_help.jsp#ext">Extension Threshold:</a></dt>
	    <dd><input TYPE="text" NAME="ExtensionThreshold" SIZE="15" VALUE="0 (use default)"></dd>

	    <dt><a href="/help/helppages/BLAST_help.jsp#extend">Gap Extension Penalty: </a></dt>
	    <dd><input TYPE="text" NAME="ExtendPenalty" SIZE="15" VALUE="0 (use default)"></dd>

 	    <dt><a href="/help/helppages/BLAST_help.jsp#word">Word Size:</a></dt>
	    <dd><input TYPE="text" NAME="WordSize" SIZE="15" VALUE="0 (use default)"></dd>

	    <dt>
	    <a href="/help/helppages/BLAST_help.jsp#gencodes">Query and Database Genetic Code</a>:
	  </dt>
	    <dd>
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
	    </dd>
	  </dl>
        </fieldset>
	<fieldset>
	    <legend><b>Results Return Options</b></legend>
	    <dl>
	    <dt><a href="/help/helppages/BLAST_help.jsp#results">Output Title</a>
	    </dt>
	    <dd><input TYPE="text" NAME="Comment"
	      value="optional, will be added to output for your use" SIZE="48" MAXLENGTH="100">
	    </dd>

	    <dt><a href="/help/helppages/BLAST_help.jsp#EMAIL">E-mail address:</a></dt>
	    <dd><input TYPE="text" NAME="ReplyTo" SIZE="48"></dd>

	    <dt><a href="/help/helppages/BLAST_help.jsp#VIA">Return Results</a>:</dt>
	    <dd>
	      <select NAME="ReplyVia" size="1">
	      <option selected value="BROWSER">To your web browser
	      <option value="EMAIL-MESSAGE">By E-mail message
	      <option value="EMAIL-URL">By E-mail notice to URL
	      </select>
	    </dd>

	    <dt>
	    <a href="/help/helppages/BLAST_help.jsp#VIA-form">Result Format</a>:</dt>
	    <dd>
	      <select NAME="ReplyFormat" size="1">
	      <option selected value="HTML">HTML hypertext</option>
	      <option value="TEXT">Normal text</option>
	      <option value="XML">XML</option>
	      <option value="TABULAR">Tab-delimited records</option>
	      <option value="TABULAR_COMMENTED">Tab-delimited, commented</option>
              <option value="ASN">ASN</option>
	    </select>
	    </dd>
	    </dl>
	    <p>Please be patient. Replies directly to your browser may take a minute or two.<br>
	    Selecting an e-mail reply allows you to immediately request
	    more searches.</p>
	</fieldset>
			<% if (sequence_type != null) { %>
            <script type="text/javascript">
                setSequence('<%=sequence_type%>');
            </script>
            <% } %>
            
            <script type="text/javascript">
			/* fast way to hide elements */
			div = document.getElementById('results');
			spans = div.getElementsByTagName('span');
			dls = div.getElementsByTagName('dl');
			
			for (i=0; i<spans.length; i++) {
				imgs = spans[i].getElementsByTagName('img');
				for (j=0; j<imgs.length; j++) {
					imgs[j].src = '/i/icon_plus.gif';
					imgs[j].alt = 'expand';
				}
			}
			
			for (i=0; i<dls.length; i++) {
				dls[i].style.display = 'none'; // hide it
			}
			</script>

	<div id="search_buttons">
	    <input type="hidden" NAME="PageType" VALUE="JavaScr">
	    <input type="reset" value="Reset">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" VALUE="Run BLAST">
	</div>

     </form>   
    </div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

