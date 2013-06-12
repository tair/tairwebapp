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

<span class="header">2003 Report of the Reverse Genetic Stocks subcommittee</span>


<p>Fast and reliable access to mutants in selected genes is crucial for systematic reverse genetic approaches.  The MASC Reverse Genetic Stocks subcommittee, which addresses issues of coordination and communication among the existing projects in this field, met at the Cold Spring Harbor meeting on Comparative Plant Genomics.  The current status of existing resources was discussed, and a summary table collecting the existing (known) resources has been put together (see 
<A HREF="/portals/masc/Reverse_Genetic_Stocks.jsp">
Table 1
</A>).  With regard to access to the primary sequence information from flanking sequence tag (FST)-based projects, all providers of FST collections were encouraged to allow access to their sequence data on their web sites.  In addition, the discussion demonstrated that a unification of the definitions of, for example, what constitutes a "potential FST gene hit" is required.  Analysis of the current resources showed that coverage of the 
<I>A. thaliana
</I> gene inventory with KO mutations is already impressive, but it also showed that the number of really useful FSTs, namely those that are likely to be a null mutation, is still not sufficient.
</p>
<p>Recently, some progress has been made to allow users of reverse genetic resources a "one-stop" access to information on T-DNA insertions in a given gene.  The 
<A HREF="http://signal.salk.edu">
Salk Institute Genomic Analysis Laboratory (SIGnAL)
</A> has integrated 
<A HREF="http://www.mpiz-koeln.mpg.de/GABI-Kat/">
GABI-Kat
</A> and 
<A HREF="http://genoplante-info.infobiogen.fr/FLAGdb/">
FLAGdb T-DNA
</A> insertion sequences into their T-DNA express database.  As a result, a quite comprehensive collection of sequence-indexed T-DNA insertion mutants can be searched at a single location on the basis of FST sequence information.
To complement the efforts to saturate the 
<I>A. thaliana
</I> genome with addressable mutations, other projects are under way to systematically set up collections of RNAi lines that cover the genome.  Also, projects based on 
<A HREF="http://tilling.fhcrc.org/">
TILLING
</A> are underway to allow access additional mutations, including change-of-function alleles of a given gene.  Finally, the combination of all existing resources significantly increases our chance to obtain plants containing the mutation(s) and alleles we need to find answers to the biological questions that interest us. 
</p>

<p>
<center>Last modified on August 15, 2006 </center>
</p>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>




