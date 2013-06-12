<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR Motif Analysis") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("2") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
  <span class="header">Statistical Motif Analysis in Promoter or Upstream Gene Sequences</span>
<jsp:include page="/jsp/includes/toolsminiheader.jsp" flush ="true">
<jsp:param name="link" value="Motif" />
</jsp:include>
		    <BR>
<br>

Several online resources are available for motif finding in regulatory
regions of co-clustered genes.  The databases <a
href="http://intra.psb.ugent.be:8080/PlantCARE/">plantCARE</a>
and <a href="http://www.dna.affrc.go.jp/htdocs/PLACE/">PLACE</a> allow
querying of already known plant cis-acting regulatory elements. Novel,
over-represented motifs in sets of co-clustered genes may be found
using Gibbs-sampling, as implemented in the plantCARE <a
href="http://www.esat.kuleuven.ac.be/~thijs/Work/MotifSampler.html">motif
sampler</a>, or by downloading and installing <a
href="http://atlas.med.harvard.edu/">AlignACE</a>.

<p> Alternatively, analysis of sets of co-clustered Arabidopsis
sequences for over-represented 6-mer 'words' is available below
(originally written by Dr. Robert Ewing from AFGC). Paste <A
href="/blast/BLAST_help.html#formats">FASTA-formatted</A>
sequences into the space below. The program then compares the
frequencies of 6-mer words in this set of sequences (on both strands)
with the frequencies of these words in the current genomic sequence
set of 27117 sequences, each containing 500 bp upstream of the start
codon of each gene (TIGR's July 2002 release). You can obtain 500 bp
upstream sequences of your genes of interest using our <a
href="/tools/bulk/sequences/index.jsp">Sequence Bulk Download
Tool</a>. Ensure that there are no sequences appearing more than once
in your query set.  </p>

<form method="post" action="/cgi-bin/bulk/motiffinder/oligoAnalysis.pl" enctype="multipart/form-data">

<textarea name="input" rows=15 cols=60></textarea><BR><BR>
Upload file: <input type="file" name="file">
<BR>
<BR>
Output type:<BR>
 <input type=radio name=output_type value=html checked> HTML
 <input type=radio name=output_type value=text>Text
  </TD>
</TR>
<TR>
  <TD><input type=reset> &nbsp; &nbsp;</TD>
  <TD><input type=submit name=".submit" value="submit" /></TD>
</TR>

</form>

<TR><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2>&nbsp;</TD></TR>

<TR>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
