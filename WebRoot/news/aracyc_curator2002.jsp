<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR Employment") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("4") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
		
		<!--
		
			Content goes here
			
		//-->

<span class="header">TAIR Employment Opportunities</span><BR><BR>
<B>Curator position at TAIR</B>
<P>
February 26, 2002
<P>
TAIR is seeking applicants for a full-time position of a curator to
	  annotate metabolic pathways of plants. This project is a collaboration
	  between TAIR and SRI International, in which
	  plant metabolic pathways will be curated into AraCyc, an Arabidopsis
	  metabolic pathway database based on MetaCyc software system developed
	  by Dr. Karp's group at SRI International. See URL for more information:
	  <a href="http://ecocyc.org/ecocyc/metacyc.html">http://ecocyc.org/ecocyc/metacyc.html</a>
	  
<P>
The curator will be responsible for:
<dd>
	 1. researching new plant metabolic enzymes and pathways in the
	  scientific literature, and to evaluate, organize, and add that
	  information to the AraCyc database.
<dd>
	 2. annotating Arabidopsis gene products to metabolic pathways
<dd>
	 3. contributing to the development of standard procedure operation rules on annotation methods and to the design of tools to perform complex queries between the different data types in TAIR and AraCyc. 
<P>
	  The successful candidate will work with a team of curators, software
	  engineers, and database developers at TAIR and collaborating database
	  projects. Successful candidates will have a Ph.D. degree or equivalent
	  in biochemistry, a demonstrated ability for independent, critical
	  thinking and excellent communication and teamwork skills. Experience
	  with Arabidopsis is preferred but not essential.
<P>
Qualified candidates should email a resume to Lukas Mueller at:
	  mueller@acoma.stanford.edu
<P>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
