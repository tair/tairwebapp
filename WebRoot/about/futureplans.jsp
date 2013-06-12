<%!
String pageName = "TAIR - About TAIR";
String highlight = "0";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
<script type="text/javascript" src="/js/aboutTairSidebar.js"></script>

<script type="text/javascript" language="javascript">var active = "FuturePlans"; aboutTairSidebar(active);</script>
<!--
		<div id="breadcrumbs"><a href="index.jsp">Home</a> &gt; <a href="#">Read About</a></div>
-->
<div id="rightcolumn">		
		<!--		
			Content goes here
			
		//-->


<B>TAIR 3rd Year Progress Report</B>
<UL>
<LI>[<a href="/about/third.pdf">Download PDF</a>]
</UL>
<P>
<B>Projects In Development, Testing, and Planning Phases</B>
<P>
<B>1. Data Import and Analysis</B>
<UL>
<LI>Mitochondrial sequences and annotations
<LI>Locus History Update form TAIR DB
<LI>Structural annotation pipeline
<LI>TAIR 1.0 Version to GenBank
<LI>Allele and phenotype curation from the literature
<LI>Genetic and molecular interactions and pathways curation
<LI>Sequence export from TAIR DB
<LI>Affymetrix gene chip microarray data

</UL>

<B>2. Database Development</B>
<UL>
<LI>Integration of gene family information
<LI>Integration of cis-elements data
<LI>Integration of metabolic pathways information
<LI>Integration of molecular interaction data
</UL>

<B>3. Database Functionality Development</B>
<UL>
<LI>Interactive genetic marker submission
<LI>Interactive web curation tools to update data in TAIR DB
<LI>Ability to associate papers to community
<LI>Gene family search
<LI>Gene symbol registry
<LI>Protocol search
<LI>Interactive protocol submission
<LI>Interactive germplasm and DNA stock submission
<LI>Multiple query input for DB searches
</UL>

<B>4. Data Visualization and Analysis Web Tools Development</B>
<UL>
<LI>Seqviewer-add organellar genomes
<LI>Microarray visualization tool
<LI>Multiple sequence alignment and tree viewing tool
<LI>Conversion of website into JSP
<LI>Full-text querying
<LI>Integration of Seqviewer from DB search
<LI>Integration of seqence analysis tools from DB search
<LI>Mapviewer-add mutant genes
<LI>TAIR glossary
<LI>Keyword tree browser
<LI>Generic data browser
<LI>Online user survey
<LI>Interactive user's guide

</UL>

<P><center>Last modified on June 11, 2003</center>
</div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
