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
<B>Postdoctoral position at TAIR</B>
<P>
September 28, 2001
<P>
A postdoctoral position is available October 1, 2001 at TAIR to develop bioinformatic methods and tools in analyzing genome-wide expression studies to understand the 'genomic' basis of cold tolerance of plants. Overall goals of the project will be to determine the composition of the low temperature transcriptome in Arabidopsis, organize cold-regulated genes into regulons, identify genetic loci that control expression of the regulons, and determine which regulons have important roles in cold tolerance. Information gathered for Arabidopsis will be utilized to ask whether the cold tolerance meachanisms are conserved in plants.
	  
<P>
The postdoctoral associate will be primarily responsible for developing a set of bioinformatic tools for comparing genome annotation data with the microarray data, developing a set of standard analysis methods to assess the significance of the results from the microarry data, and to develop data exchange formats for disseminating the data to other databases for wide-public access. S/he will gain experience in analyzing microarry data, developing relational databases, and writing scripts to manage and analyze large-scale data.	  
<P>
Minimum requirements include a Ph.D. in biology or statistics. Background in computer science a plus but not required.
	  
<P>
Qualified candidates should email a resume to Sue Rhee at:
	  rhee@acoma.stanford.edu
<P>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
