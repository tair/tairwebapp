<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR: Patmatch 1.1 Release Notes") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("2") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>

<span class="header">Patmatch 1.1 Release Notes</span>
<br>
<p>
TAIR's <a href="/cgi-bin/patmatch/nph-patmatch.pl">Pattern Matching</a> allows 
you to search for short nucleotide or peptide sequences, or 
ambiguous/degenerate patterns.  It uses the same Arabidopsis dataset as TAIR's 
<a href="/Blast/">BLAST</a> and 
<a href="/cgi-bin/fasta/nph-TAIRfasta.pl">FASTA</a> programs.
</p>

<b>New Features</b> :
<p>
   <ul>
      <li>Set the minimum number of hits per sequence.
      <li>Set the maximum number of hits per sequence.
   </ul>
</p>

<b>Updated Features</b> :
<p>
   <ul>
      <li>The maximum number of hits retrieved is increased to 250,000.
      <li>The minimum number of the input pattern is 3 residues.
      <li>Select the number of total mismatches and types of mismatches 
          allowed.
      <li>Improved checking of input pattern syntax.
      <li>Modified pattern syntax for peptide searches to conform to standard
	  one-letter codes for amino acids.
   </ul>
</p>

<b>Resolved Bugs</b> :
<p>
   <ul>
      <li>Patterns containing regular expressions now support mismatch options.
      <li>Patterns containing wildcards now support mismatch options.
   </ul>
</p>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
