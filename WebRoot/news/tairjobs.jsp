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
<B>New curator positions at TAIR</B>
<P>
The Arabidopsis Information Resource (TAIR) is seeking two full-time database curators to participate in the collection and display of data for research use, the development and improvement of
data model for TAIR database, and the development of software tools for literature curation, data integration, visualization, and analysis. Data types to curate and develop into the database
structure include experimental data from the Arabidopsis literature, genome sequencing and annotation, functional genomics, genetic and physical maps and genetic markers, microarrays,
phenotype and mutant lines, and biochemical pathways. 
<P>
Successful candidates will have a Ph.D degree or equivalent in biology, a demonstrated ability for independent, critical thinking and excellent communication and teamwork skills. Prior laboratory
experience with Arabidopsis is preferred. Candidates with some background in biochemistry are especially encouraged to apply. Also, candidates with a working knowledge of PERL, SQL,
and/or basic shell scripting languages is desired but an extensive background in computing is not required. Familiarity with basic UNIX commands, spreadsheets, and commonly used biological
research tools such as BLAST and MEDLINE searching would be assets. 
<P>
For more information contact us by email at curator@arabidopsis.org OR bring a resume and come talk to us at our drop-in help corner at the upcoming Arabidopsis meeting in
Madison. 
<P>
Qualified candidates should send a resume to: 
<P>
The Arabidopsis Information Resource <BR>
  Attn: Sue Rhee <BR>
     Carnegie Institution of Washington, Dept. of Plant Biology <BR>
     260 Panama Road<BR> 
     Stanford, CA 94305<BR> 
<P>
     APPLICATION DEADLINE: AUGUST 31, 2000 
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
