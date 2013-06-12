<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "AraCyc Tutorial";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="2000" />
</jsp:include>

<jsp:include page="/jsp/includes/aracyctutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="AraCyc Tutorial"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes  here//-->
<span class="mainheader">AraCyc Tutorial- Introduction</span>
<p><a href="/biocyc/index.jsp" target="_blank">AraCyc</a> is a metabolic pathway database for <i>Arabidopsis thaliana</i> that contains information about both predicted and experimentally determined pathways, reactions, compounds, genes and enzymes. The Omics viewer is a software for displaying large scale data such as microarray gene expression results or proteomic data in the context of biochemical pathways.</p>
<p>This tutorial describes how to query and browse Aracyc. In addition to these pages we have included on the last page,  a series of Quicktime movies that demonstrate the features of AraCyc.</p>
<p>See the <a href="/biocyc/index.jsp" target= "_blank">AraCyc home page</a> for information about the status of pathways in AraCyc including recently added, or updated pathways that have been manually curated.</p>
<p>AraCyc is a part of the <a href="http://biocyc.org" target="_blank">BioCyc</a> family of metabolic pathway databases and uses the same software. Therefore, the information presented in this tutorial can also be used to search and navigate the <a href="http://metacyc.org" target ="_blank">MetaCyc</a> database of curated metabolic pathways.</p>
<p>These databases all share the same software tools and database structure; they differ in their content. Where AraCyc describes pathways in a SPECIFIC organism (Arabidopsis), MetaCyc includes pathways from many different types of organisms. An essential difference is that MetaCyc only includes pathways which have been manually curated (information is taken from the experimental literature). AraCyc builds upon the curated pathways from MetaCyc, using these pathways as a basis for predicting the existence of those pathways in Arabidopsis. Pathways in AraCyc and MetaCyc may overlap (e.g. curated Arabidopsis pathways will be found in both databases).
<p>The purpose of this tutorial is to illustrate how to query and browse pathways in AraCyc and how to use the Omics viewer to visualize complex data in a metabolic pathway context. Because the navigation and tools used by AraCyc are shared by MetaCyc, much of the information presented in this tutorial applies to MetaCyc as well. One important difference is the absence of an 'Omics' viewer for MetaCyc.</p>

</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
