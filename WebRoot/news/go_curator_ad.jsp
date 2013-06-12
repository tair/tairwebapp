<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("GO curator at TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("2") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
		
		<!--
		
			Content goes here
			
		//-->

<span class="header">TAIR Employment Opportunities</span><BR><BR>
<B>New GO curator position at TAIR</B>
<P>
October 22, 2001
<P>
TAIR is seeking applicants for a full-time position of a Gene Ontology curator. The Gene Ontology Consortium (<a href="http://www.geneontology.org">www.geneontology.org</a>) is a collaboration between model organism databases to develop shared vocabularies to describe gene products.
<p>	  
The TAIR GO curator will be responsible for:
	  <li> annotation of Arabidopsis gene products with GO controlled vocabulary terms,
	  <li>working with members of the GO consortium to modify/update the GO
ontologies as needed to improve the ontology structure,
	  <li>development and application of methods to streamline and enhance the quality of annotations, and 
	  <li>working with members of the plant research community to facilitate the transfer of biological knowledge between Arabidopsis and other plants.
<p>

The successful candidate will work with a team of curators, software
engineers, and database developers at TAIR and collaborating database
projects. Successful candidates will have a Ph.D. degree or equivalent
in some aspect of plant biology (e.g. Development, Physiology, Biochemistry,
Genetics, Plant Pathology), a demonstrated ability for independent,
critical thinking and excellent communication and teamwork
skills. Experience with Arabidopsis is preferred but not
essential. The GO curator must be able to travel and attend 4
meetings/year of the GO consortium. Familiarity with basic UNIX
commands, spreadsheets, and commonly used biological research tools
such as BLAST and MEDLINE searching is desired.  A working knowledge
of PERL and/or SQL would be an asset but an extensive background in
computing is not required.  <P> Qualified candidates should email a
resume to: rhee@acoma.stanford.edu <P>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
