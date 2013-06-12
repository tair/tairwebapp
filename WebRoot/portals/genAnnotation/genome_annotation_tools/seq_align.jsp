<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd\
">
<%String pageName = "Multiple Sequence Alignment Tools: ";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11432" />
</jsp:include>

<jsp:include page="/jsp/includes/genAnnotationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Multiple Sequence Alignment Tools" />
</jsp:include>
<div id="rightcolumn">



		
		<!-- Content goes here //--> 

<span class="mainheader">Multiple Sequence Alignment Tools</span>


               <dl>
                <dt><a href="http://www.ebi.ac.uk/clustalw/">CLUSTALW</a></dt>
                <dd>Compares overall sequence similarity of multiple sequences. 
                
                <dt><a href="http://meme.sdsc.edu/meme/intro.html">MEME (Multiple EM for Motif Elicitation)</a></dt>
                <dd>Analyzes your sequences for similarities among them and produces a description (motif) for each pattern it discovers.</dd>
                
                <dt><a href="http://bioinformatics.weizmann.ac.il/blocks/blockmkr/www/make_blocks.html">Block Maker</a></dt> 
                <dd>Finds conserved blocks in a group of two or more unaligned protein sequences.</dd>
                
                <dt><a href="http://www.ch.embnet.org/software/BOX_form.html">BOXSHADE</A>
                <dd>Highlights conserved residues of the resulting multiple sequence alignment.</a></dd>
                
                <dt>
                <a href="http://www.biochem.ucl.ac.uk/bsm/dbbrowser/CINEMA2.02/index2.html">CINEMA (Colour INteractive Editor for Multiple Alignments)</dt>
                <dd>Editing tool that allows the user to manipulate the alignment.</dd>
                
                <dt><a href="http://sgn.cornell.edu/tools/align_viewer/ ">SGN Alignment Analyzer </a></dt>
                <dd>Aligns DNA or protein sequences and graphically displays the results. Accepts AGI codes as input as well as unaligned or aligned sequences. </dd>
                
                <dt><a href="http://sgn.cornell.edu/tools/tree_browser/ ">SGN Tree Browser</a></dt>
                <dd>Calculates and displays trees based on alignment data (accepts several different input formats)</dd>
                
                <dt><a href="http://athena.bioc.uvic.ca/virology-ca-tools/base-by-base/">Base-By-Base</a></dt>
                <dd>Whole genome pairwise and multiple alignment editor.</dd>

</dl>


            </div> <!--right column-->
<center>Last modified on May 14, 2012</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


