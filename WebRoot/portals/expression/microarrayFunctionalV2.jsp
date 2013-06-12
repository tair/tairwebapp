<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%!
String pageName = "TAIR - Gene Expression - Functional Genomic Expression Projects";
String highlight = "3";
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

<jsp:include page="/jsp/includes/expressionSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Functional Genomics Expression Projects"/>  
</jsp:include>
		<div id="rightcolumn">
		<span class="mainheader">Functional Genomic Expression Projects</span>
			<dl>

            <dd>
            <dl>
            
            <dt><a href="http://www.uni-frankfurt.de/fb15/botanik/mcb/AFGN/atgenex.htm">AtGenExpress</a></dt>
            <dd>A multinational coordinated effort to uncover the transcriptome of the multicellular model organism Arabidopsis thaliana</dd>
                                       
            <dt><a href="http://atarrays.tigr.org/">AT Arrays</a></dt>
            <dd>TIGR, USA</dd>
            <dt><a href="http://www.catma.org/">CATMA</a></dt>
            <dd>Consortium of European research groups for design and production of GSTs for most Arabidopsis genes.</dd>
            <dt><a href="http://www.fastlane.nsf.gov/servlet/showaward?award=0114783">Expression profiling of plant disease resistance pathways-pathoarrays</a></dt>
            <dd>Xinnian Dong, Shauna Somerville and Fred Ausubel</dd>
            <dt><a href="http://cordis.europa.eu/search/index.cfm?fuseaction=proj.simpledocumentlucene&HD_ID=4639777&CFID=1142050">REGIA </a></dt>
            <dd>European research groups for establishing the function of transcription factors</dd>
            
            <dt><a href="http://stress-genomics.org/stress.fls/expression/expression.html">Functional Genomics of Plant Stress Tolerance</a></dt>
            <dd>Stress Genomics Consortium, USA</dd>
            <dt><a href="http://signal.salk.edu/">Global Expression Studies of the Arabidopsis Genome</a></dt>
            <dd>SIGNAL, USA</dd>
            <dt><a href="/tools/bulk/microarray/analysis/index.jsp">Large-scale analysis of the Arabidopsis microarray data at TAIR</a></dt>
            <dd>TAIR, USA</dd>
            <dt><a href="http://aztec.stanford.edu/cold/">Low Temperature Regulatory Circuits and Gene Regulons in Higher Plants</a></dt>
            <dd>Michael Thomashow's group, USA</dd>
            <dt><a href="http://metnet.vrac.iastate.edu/">MetNet</a></dt>
            <dd>Software to visualize, explore, statistically analyze and
            model transcriptomics, proteomics and metabolomics data in the context of Arabidopsis metabolic and regulatory network maps.</dd>
            <dt><a href="http://mpss.udel.edu/at?/">MPSS</a></dt>
            <dd>Blake Meyers Lab, USA</dd>
            
            <dt><a href="/info/2010_projects/comp_proj/AFGC/index.html">Arabidopsis Functional Genomics Consortium (AFGC)</a></dt>
            <dd>Microarray and gene knockout facilities. Project completed in 2002.</dd>
            </dl>
            </dd>
            
            </dl>
		</div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
