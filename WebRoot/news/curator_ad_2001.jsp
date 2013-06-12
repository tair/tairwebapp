<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR Employment") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("2") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
		
		<!--
		
			Content goes here
			
		//-->

<span class="header">TAIR Employment Opportunities</span><BR><BR>
<B>New curator position at TAIR</B>
<P>
September 1, 2001
<P>
A full-time scientific curator position is available immediately at
the Arabidopsis Information Resource (TAIR). A scientific curator at
TAIR interacts with the research community in the collection,
processing, and displaying of the information via the Web and
participates in the design of database structure and software tools
for curating and making accessible all available Arabidopsis data to
the research community.
<P>
We are currently focusing on associating genome sequence,
computational annotation and genome-wide expression data with
germplasm and phenotype information from the Arabidopsis Biological
Resource Center and the literature.
<P>
The successful candidate will work with a team of curators, software
engineers, and database developers at TAIR and collaborating database
projects. Successful candidates will have a Ph.D degree or equivalent
in biology, a demonstrated ability for independent, critical thinking
and excellent communication and teamwork skills. Prior laboratory
experience with Arabidopsis is preferred but not required. Candidates
with genetic and/or developmental biology backgrounds are especially
encouraged to apply.  Familiarity with basic UNIX commands,
spreadsheets, and commonly used biological research tools such as
BLAST and MEDLINE searching is desired.  A working knowledge of PERL
and/or SQL would be an asset but an extensive background in computing
is not required.
<P>
Qualified candidates should email a resume to: huala@acoma.stanford.edu
<P>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
