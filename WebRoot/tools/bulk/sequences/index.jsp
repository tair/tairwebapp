<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - Bulk Download - Sequences";
String cssfile="/css/page/search.css";
%>

<%
String[] ids = null;
String names = "";
if (request.getAttribute("gene_names") != null ) {
    ids = (String[]) request.getAttribute("gene_names");
    for (int i=0; i<ids.length; i++){
        String cur_name = (String) ids[i]; 
        names = names + "\n" + cur_name;
    }
}
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="83" />
</jsp:include>

<script type="text/javascript">
function mySubmit(target) {
document.seq_form.action = target;
document.seq_form.submit();
}

function updateRadios() {
    var dataset = document.seq_form.dataset.value;
    if (dataset == "At_intron") { 
        document.getElementById("search_against1").disabled = true;
        document.getElementById("search_against2").disabled = true;
        document.getElementById("search_against3").disabled = true;
    } else if ( dataset == "At_intergenic" || dataset.match("At_upstream") ||
                dataset.match("At_downstream") ){
        document.getElementById("search_against1").disabled = false;
        document.getElementById("search_against1").checked = true;
        document.getElementById("search_against2").disabled = true;
        document.getElementById("search_against3").disabled = true;
    } else { 
        document.getElementById("search_against1").disabled = false;
        document.getElementById("search_against2").disabled = false;
        document.getElementById("search_against3").disabled = false;
    }
}

</script>

  <span class="mainheader">Sequence Bulk Download and Analysis</span>
  <p id="help">[<a href="/help/helppages/bulkseqhelp.jsp">help</a>]</p>
<p>
This tool can be used to download a variety of sequences from the Arabidopsis Genome Initiative (AGI) in FASTA or tab-delimited formats. Individual or sets of AGI locus identifiers (e.g. At1g01030) can be typed into the textbox below or uploaded from your desktop computer. FASTA formatted sequences can also be sent to the multiple sequence alignment program Clustal W. More information on how to use the tool can be found by following the link to the Help document.
</p>
<p>
		    Please use the <a href=ftp://ftp.arabidopsis.org/home/tair/Sequences/blast_datasets/>ftp server</a> if you want to download entire datasets. Click <a href="/help/helppages/BLAST_help.jsp#datasets">HERE </a>to obtain details about the sequence datasets used at TAIR.
<p><b><font color="red">For Intron Sequences ONLY:</font> </b> A special format is required for obtaining intron sequences using the Intron Sequences dataset.The format must include the locus identifier followed by the gene model suffix. To specify which intron, the model id.suffix is followed by a hyphen (-), and the number of the intron you wish to retrieve. For example, to obtain the sequence of the first intron on the AGAMOUS gene the format would be AT4G18960.1-1
</p>
<p><b><font color="red">For Upstream/Downstream/Intergenic sequences:</font></b> For these data types we ONLY provide the sequence relative to the locus itself (based on the maximum extent of all gene models for that locus) regardless of whether a locus name or a specific gene model name is used for the search.</p>
  <div id="searchbox">
	<form action=/cgi-bin/bulk/sequences/getseq.pl name="seq_form"  method=post enctype="multipart/form-data">
	<fieldset>
  	<legend>Sequences</legend>
	<dl>
		<dt>Locus/Gene Model Identifiers or Sequences:
		</dt>
		<dd><textarea name="loci" rows="10" cols="40"><%=names%></textarea>
		</dd>
		<dt>Upload file:
		</dt>
		<dd><input type="file" name="file">
		</dd>
		<dt>Dataset: </dt>
<dd>
<SELECT name="dataset" onchange="javascript:updateRadios()">
  <OPTION value="At_transcripts">AGI transcripts</OPTION>            
  <OPTION value="ATH1_cds">AGI coding sequences</OPTION>            
  <OPTION value="ATH1_seq">AGI genomic locus sequences</OPTION>
  <OPTION value="ATH1_pep">AGI protein sequences</OPTION>      
  <OPTION value="At_upstream_500">TAIR10 Loci Upstream Seq - 500bp</OPTION>
  <OPTION value="At_upstream_1000">TAIR10 Loci Upstream Seq - 1000bp</OPTION>
  <OPTION value="At_upstream_3000">TAIR10 Loci Upstream Seq - 3000bp</OPTION>
  <OPTION value="At_downstream_500">TAIR10 Loci Downstream Seq - 500bp</OPTION>
  <OPTION value="At_downstream_1000">TAIR10 Loci Downstream Seq - 1000bp</OPTION>
  <OPTION value="At_downstream_3000">TAIR10 Loci Downstream Seq - 3000bp</OPTION>
  <OPTION value="At_intergenic">Intergenic Sequences</OPTION>
  <OPTION value="At_intron">Intron Sequences</OPTION>
  <OPTION VALUE="ATH1_3_UTR">AGI 3' UTRs</OPTION>
  <OPTION VALUE="ATH1_5_UTR">AGI 5' UTRs</OPTION>
</SELECT>
</dd>
<br>
<dt>Search Against:</dt>
<dd>
<input type="radio" id="search_against1" name="search_against" value="rep_gene" checked>Get one sequence per locus (representative gene model/splice form only)
<br>
<input type="radio" id="search_against2" name="search_against" value="both">Get sequences for all gene models/splice forms
<br>
<input type="radio" id="search_against3" name="search_against" value="genemodel">Get sequences for only the gene model/splice form matching my query
</dd>
</dl>
</fieldset>
		    <fieldset>
		    <legend>Output Options:</legend>
                    <dl>
		    <dt>Select output format:
		    </dt>

		<dd><input type=radio name=outputformat value=fasta checked> Fasta<br>
			<input type=radio name=outputformat value=tabtext> Tab-delimited text (format: id tab description tab sequence)
		</dd>
	</dl>
	</fieldset>
	<div id="search_buttons">
		<input type=reset>		    
	      	<input type=submit Value="Get Sequences"
	             onclick="mySubmit('/cgi-bin/bulk/sequences/getseq.pl')" >
	        <input type="button" value="Send Sequences to EBI ClustalW" 
                     onclick="mySubmit('/cgi-bin/bulk/sequences/seqtoclustalw.pl')" >	    
	</div>   

	</form>
  </div>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

