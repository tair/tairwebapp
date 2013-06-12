<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Title of Page";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="732" />
</jsp:include>
<!-- SIDEBAR -->

<jsp:include page="/jsp/includes/aracycSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Downloads/FTP" />
</jsp:include>

<div id="rightcolumn">


<!-- CONTENT IN HERE -->

<p align="center"><img src="aracyc_files/aracyc_logo.gif" width="100" height="58"></p>
<p class="mainheader">FTP</p>
<p>We have compiled for you a few preformatted files containing information extracted for the latest AraCyc release. </p>
<dl>
	<dd><b><a href="ftp://ftp.plantcyc.org/Pathways/">AraCyc pathways</a> </b>Get a list of reactions and genes which are associated to pathways in AraCyc. This file (<em>aracyc_dump</em>) is in a tab-delimited text format.</dd>
	<dd><b><a href="ftp://ftp.plantcyc.org/Pathways/">AraCyc compounds</a> </b>Get a comprehensive list of compounds found in AraCyc pathways. This file (<em>aracyc_compounds</em>) is in a tab-delimited text format. <b>Note:</b> This file ONLY contains AraCyc compounds that are used in the database's pathways.</dd>
	<dd><b><a href="http://www.plantcyc.org/downloads/license_agreement.faces">AraCyc database</a> </b>Get the complete AraCyc database in a BioCyc format from the <a href="http://www.plantcyc.org">Plant Metabolic Network</a> (PMN) website. You will also receive access to other PMN plant metabolic pathway databases.</dd>
</dl>
<p><strong>Quick Tip</strong> At the bottom of each Pathway page, you will find a '<strong>Download Genes</strong>' button. Click on it and retrieve a tab-delimited file containing all the genes shown in this pathway.</p>
<p class="mainheader">Downloads</p>
<p>If you want to query the database through a locally-installed version of Pathway Tools (click <a href="http://bioinformatics.ai.sri.com/ptools/">here</a> for more info), here are a couple of applications allowing you to query your local database programmatically.</p>
<dl>
	<dd><b><a href="/biocyc/perlcyc/index.jsp">PerlCyc</a> </b>This module allows programmers to access their local Pathway Tools-supported databases using Perl.</dd>
	<dd><b><a href="/biocyc/perlcyc/index.jsp">JavaCyc</a> </b>...same as above using Java instead of Perl.</dd>
</dl>
<p class="mainheader">&nbsp;</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

