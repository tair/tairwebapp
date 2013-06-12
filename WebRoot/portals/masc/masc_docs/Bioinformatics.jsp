<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "MASC";
String cssfile="/css/page/search.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
		
<!-- Content goes here //--> 

<span class="mainheader">2003 Report of the Bioinformatics subcommittee</span>

<p>The MASC Bioinformatics subcommittee met in November of 2002.  The main thrust of the discussion was a re-evaluation of goals for the 
<I>Arabidopsis
</I> bioinformatics community, and an assessment of ways in which major bioinformatics outlets can benefit from and be a service to the functional genomics community.
<p>Issues identified for the Bioinformatics community include the need for a centralized information source: what is the scope of the activities and datasets at the major centers and how should disparate pieces of functional genomics information be gathered into a "one-stop" resource for community?  Secondly, criteria for assignment of gene function should be mutually agreed upon and clearly articulated.  Wherever possible, ambiguous and/or overlapping terms such as "unknown protein," "hypothetical protein," and "putative protein" that are in use at different bioinformatics outlets should be replaced by more informative and uniform nomenclature.  Gene ontology assignments will form part of this process.  <p>Thirdly, individual functional genomics projects are now creating "expert" databases - extensive data collections on a specific topic; should these be incorporated into "backbone" genomics databases, and if so, how?  Finally, the bioinformatics community needs a mechanism for discovering the types of bioinformatics capacity and tools needed by the community, while at the same time, the bioinformatics community would like to learn what tools and capacity are being developed by the functional genomics projects.
<p>In response to these issues, a new set of goals was identified for the 
<I>Arabidopsis
</I> bioinformatics community.  These goals center on the idea of communication - both between the various bioinformatics outlets and between the outlets and the people they serve, the world-wide community of 
<I>Arabidopsis
</I> scientists.

<p>On-going goals for the 
<I>Arabidopsis
</I> Bioinformatics community:
<UL type=disc>
<LI>Establish and maintain connectivity between the major databases.
<LI>Survey and compile a comprehensive list of functional genomic resources that is web-accessible, searchable and extensively hyperlinked.
<LI>Define "unknown function;" establish parameters for assigning a function to a gene.
<LI>Establish parameters for minimal data content for submission of expert data sets into backbone databases.
<LI>Creation of "exit strategies" for functional genomics projects to plan for successful integration of expert database contents into backbone databases.
<LI>Make community and funding agencies aware of need for exit strategy; encourage funding agencies to require an explicit exit strategy.
<LI>Backbone genomics sites serve as a repository for output by projects.
<LI>Keep 
<I>Arabidopsis
</I> community at large informed about activities of Bioinformatics community.
</UL>
<p>Bioinformatics resources specifically serving the 
<I>Arabidopsis
</I> research community:
<UL type=disc>
<LI>AGR at UK Cropnet (
<A HREF="http://ukcrop.net/agr/">
http://ukcrop.net/agr/
</A>)
<LI>GABI-Info and GABI-Primary Database (links from 
<A HREF="http://www.gabi.de">
http://www.gabi.de
</A>)
<LI>Genoplante-Info (
<A HREF="http://genoplante-info.infobiogen.fr/">
http://genoplante-info.infobiogen.fr/
</A>)
<LI>Kazusa Dept of Plant Gene Research (
<A HREF="http://www.kazusa.or.jp/en/plant/">
http://www.kazusa.or.jp/en/plant/
</A>) (plus ESTs)
<LI>MAtDB at MIPS (
<A HREF="http://mips.gsf.de/proj/plant/jsf/athal/index.jsp">
http://mips.gsf.de/proj/plant/jsf/athal/index.jsp
</A>)
<LI>NCBI (
<A HREF="http://www.ncbi.nlm.nih.gov/cgi-bin/Entrez/map_search?chr=arabid.inf">
http://www.ncbi.nlm.nih.gov/cgi-bin/Entrez/map_search?chr=arabid.inf
</A>)
<LI>RIKEN Genomic Sciences Center (
<A HREF="http://pfgweb.gsc.riken.go.jp/">
http://pfgweb.gsc.riken.go.jp/
</A>) RIKEN Arabidopsis Genome Encyclopedia (RARGE) (
<A HREF="http://rarge.gsc.riken.go.jp/">
http://rarge.gsc.riken.go.jp/
</A>)
<LI>TAIR (
<A HREF="http://arabidopsis.org">
http://arabidopsis.org
</A>)
<LI>TIGR (
<A HREF="http://www.tigr.org/tdb/e2k1/ath1/">
http://www.tigr.org/tdb/e2k1/ath1/
</A>)
</UL>
</p>

<p>
<center>Last modified on August 15, 2006</center>
</p>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
