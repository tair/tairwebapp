<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
    String sequence = "";
    String sequence_type = "";
    if (request.getParameter("sequence") != null) {
        sequence = request.getParameter("sequence");
    }
    if (request.getParameter("sequence_type") != null ) {
        sequence_type = (String) request.getParameter("sequence_type"); 
    }
%>

<%
String pageName = "TAIR - WU-BLAST 2.0 Form";
String cssfile="/css/page/search.css";
%>

<script type="text/javascript">
function updateDatabase() {
    var x = document.getElementById("default_db"); 
    var db = document.getElementById("database");
    var program = document.getElementById("program").value;
    var not_match = "";
    if (program == "blastn" || program == "tblastx" || program == "tblastn") {
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
        document.getElementById("program").value = "blastp";
    } else if (sequence_type == "nucleotide") {
        document.getElementById("program").value = "blastn";
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
<jsp:param name="id" value="75" />
</jsp:include>

<!-- CONTENT IN HERE -->
	    
	<span class="mainheader"><EM>Arabidopsis thaliana</EM> <A HREF="http://blast.wustl.edu/blast/README.html">WU-BLAST2</A>  Search</span>

		
		<form METHOD="post" ACTION="/cgi-bin/wublast/wublast" ENCTYPE="multipart/form-data">
	<div id="searchbox">
	  <fieldset>
	  <span class="legend">WuBlast</span>
	<dl>
		      
		<dt><A HREF="/help/helppages/BLAST_help.jsp#methods"> BLAST </A> program</dt>		      
		<dd>
		      <SELECT NAME="program" id="program" onChange="updateDatabase()">
			<OPTION  VALUE="blastn">BLASTN  : NT query to NT db
			<OPTION  VALUE="blastp">BLASTP  : AA query to AA db
			<OPTION  VALUE="blastx">BLASTX  : NT query to AA db
			<OPTION  VALUE="tblastx">TBLASTX : NT query to NT db (All 6 frames)
			<OPTION  VALUE="tblastn">TBLASTN : AA query to NT db
		      </SELECT>
		</dd>
		  
		  <dt><A HREF="/help/helppages/BLAST_help.jsp#datasets">Datasets</A><IMG src="/images/new.gif"></dt>

		  <dd>
            <%= HTMLFactoryWithCSS.createFastaSelect("default_db", "", false, "", "hidden", "default_db" ) %>
            <select name="database" id="database">
            </select>
          </dd>
		   <dt>
		      <B>Input</B>:<BR> <INPUT TYPE=RADIO NAME="textbox" VALUE="seq"  CHECKED> <a href="/help/helppages/BLAST_help.jsp#query">query sequence</a><BR> <INPUT TYPE=RADIO NAME="textbox" VALUE="locus"> locus name <BR> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(cds)<BR> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(At1g01030)<BR><BR>
		   </dt>   
		   <dd>
			    <TEXTAREA NAME="QueryText" ROWS=10 COLS=45><%= sequence %></TEXTAREA>
		   </dd>


		    <dt>  <B>Or</B> <A HREF="/help/helppages/BLAST_help.jsp#query">upload</A> a file</dt>

		    <dd>  <INPUT TYPE="file" NAME="filename"  SIZE=35>		      
		    </dd>


		  
		  
		</dl>
		  FASTA, GCG or RAW  <A HREF="/help/helppages/BLAST_help.jsp#query">formats</A> accepted. 
		  
		<p> 
		  
		  If sequence is less than 30 letters you need to set the S value to less than 100 or you can miss matches.
		</fieldset>

		<fieldset id="results">


		  <span class="legend"><B>Advanced options: </B></span> 
		  <span class="button"><a href="#" onclick="show_hide(this, 'dl'); return false;"><img src="/i/icon_minus.gif" alt="contract" /></a></span>
		<dl>		  
		  <!-- Search Options -->
		                    <p>For descriptions of BLAST options and parameters, refer to the
                        <A HREF="http://www.ncbi.nlm.nih.gov/BLAST/blast_help.html">documentation at NCBI.</A></p> 
		<dt><A HREF="http://www.ncbi.nlm.nih.gov/BLAST/blast_help.html#filter">Filter options:</A></dt>
		    <dd><SELECT NAME="filtop">
			<OPTION SELECTED VALUE="default">default
			<OPTION  VALUE="none">none
			<OPTION  VALUE="dust">dust
			<OPTION  VALUE="seg">seg
			<OPTION  VALUE="xnu">xnu
			<OPTION  VALUE="seg-xnu">seg-xnu
		      </SELECT>
		      
		      <br />(dust for blastn, seg filter for all others)
		    </dd>
		  <dt><A HREF="http://www.ncbi.nlm.nih.gov/BLAST/blast_help.html">Output format</A></dt>
		  <dd><SELECT NAME="output">
			<OPTION SELECTED VALUE="gapped">gapped alignments
			<OPTION  VALUE="nongapped">nongapped alignments
		      </SELECT>
		  </dd>
		  
		  <dt><A HREF="/help/helppages/BLAST_help.jsp#matrix">Comparison Matrix</A></dt> 
		    
		    <dd>
		      <SELECT NAME="matrix">
			<OPTION  VALUE="BLOSUM30">BLOSUM30
			<OPTION SELECTED VALUE="BLOSUM62">BLOSUM62
			<OPTION  VALUE="BLOSUM100">BLOSUM100
			<OPTION  VALUE="PAM40">PAM40
			<OPTION  VALUE="PAM120">PAM120
			<OPTION  VALUE="PAM250">PAM250
			<OPTION  VALUE="GONNET">GONNET
			<OPTION  VALUE="IDENTITY">IDENTITY
		      </SELECT>
		    </dd>
		  
		  <dt><A HREF="http://www.ncbi.nlm.nih.gov/BLAST/blast_help.html#cutoff">Cutoff Score ( S value):</A></dt> 
		    
		    <dd><SELECT NAME="sthr">
			<OPTION SELECTED VALUE="default">default
			<OPTION  VALUE="30">30
			<OPTION  VALUE="50">50
			<OPTION  VALUE="70">70
			<OPTION  VALUE="90">90
			<OPTION  VALUE="110">110
		      </SELECT>
		    </dd> 
		  
		  
		  <dt><A HREF="http://www.ncbi.nlm.nih.gov/BLAST/blast_help.html#expect">Expect (E threshold):</A></dt> 
		  <dd><SELECT NAME="ethr">
			<OPTION SELECTED VALUE="default">default
			<OPTION  VALUE="0.0001">0.0001
			<OPTION  VALUE="0.01">0.01
			<OPTION  VALUE="1">1
			<OPTION  VALUE="10">10
			<OPTION  VALUE="100">100
			<OPTION  VALUE="1000">1000
		      </SELECT>
		    </dd>
		  
		  
		  <dt><A HREF="http://www.ncbi.nlm.nih.gov/BLAST/blast_help.html#alignments"># of best alignments to show</A></dt> 
		  <dd><SELECT NAME="showal">
			<OPTION  VALUE="0">0
			<OPTION  VALUE="25">25
			<OPTION  VALUE="50">50
			<OPTION SELECTED VALUE="100">100
			<OPTION  VALUE="200">200
			<OPTION  VALUE="400">400
			<OPTION  VALUE="800">800
			<OPTION  VALUE="1000">1000
		      </SELECT>
		    </dd> 
		  

		  <dt>Sort output by</dt> 
		    <dd>
		      <SELECT NAME="sortop">
			<OPTION SELECTED VALUE="pvalue">pvalue
			<OPTION  VALUE="count">count
			<OPTION  VALUE="highscore">highscore
			<OPTION  VALUE="totalscore">totalscore
		      </SELECT>
		    </dd>
		</dl>
		</fieldset>
		<fieldset>
	        <span class="legend"><b>Results Return Options</b></span>
	        <dl>

		
		  <dt><A HREF="/help/helppages/BLAST_help.jsp#results">Output Title</A></dt>
			    <dd><input TYPE="text" NAME="seqname"
	      			value="optional, will be added to output for your use" SIZE="48" MAXLENGTH="100">
	    		    </dd>

		  <dt><A HREF="/help/helppages/BLAST_help.jsp#results">EMAIL Return Option</A></dt>
		    
		    <dd><INPUT TYPE="text" NAME="email"  LABEL=" Send reply via Email to " size="48"> 
		    </dd>
		</dl>
	    <p>Please be patient. Replies directly to your browser may take a minute or two.<br>
	    Selecting an e-mail reply, by putting your email address in the box above allows you to immediately request
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

		<INPUT TYPE="reset">
		  <INPUT TYPE="submit" NAME="value" VALUE="Run BLAST"> 

		</div>
	</div>
	</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

