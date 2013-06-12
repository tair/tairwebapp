<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - TAIR Motif Analysis";
String cssfile="/css/page/search.css";
%>
<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="78" />
</jsp:include>
<div id="rightcolumn">
<!-- CONTENT IN HERE -->
  <span class="mainheader">Statistical Motif Analysis in Promoter or Upstream Gene Sequences </span>

<P>The program compares the frequencies of 6-mer "words" in your query
set of sequences (on both strands) with the frequencies of the words in
the current genomic sequence set of 33518 sequences, each containing 500
(or 1000) bp upstream of the start codon of each gene. You can type in sets of AGI locus identifiers (e.g.
At1g01030) or sets of fasta sequences. Make sure each fasta header is
formated as such, fasta symbol (>), immediatly followed by a unique ID, a
space, then all other descriptions (e.g. >ABCD1.1 my gene). Ensure
that there are no sequences appearing more than once in your query set.
</p>

<form method="post" action="/cgi-bin/bulk/motiffinder/oligoAnalysis.pl" enctype="multipart/form-data">

<textarea name="input" rows=15 cols=60></textarea><BR><BR>
Upload file: <input type="file" name="file">
<BR>
<BR>
Dataset:<BR>
 <input type=radio name=upstream value=500 checked> 500 bp upstream
 <input type=radio name=upstream value=1000> 1000 bp upstream
 <input type=radio name=upstream value=3000> 3000 bp upstream 
<BR>
<BR>
Output type:<BR>
 <input type=radio name=output_type value=html checked> HTML
 <input type=radio name=output_type value=text>Text
<input type=reset> &nbsp; &nbsp;
  <input type=submit name=".submit" value="submit" />

</form>


</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

