<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%!
String pageName = "Education";
String highlight = "3";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
errorPage="/jsp/common/gen_error.jsp"%>






<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%= cssfile %>" />
</jsp:include>

<jsp:include page="/jsp/includes/educationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="TAIR Presentations(ppt)" />
</jsp:include>

<div id="rightcolumn">
<span class="mainheader">2006 TAIR Presentations </span>
<dl>
<dt>ASPB Meeting - Boston August 2006</dt>
<dd><u>TAIR Workshop I: TAIR for beginners</u></dd>
<dd><a href="/portals/education/presentations/2006/ASPB_partI_TAIR.ppt">Part I</a> How to access TAIR, register and order seed stocks and clones. <i>(presented by Hartmut Foerster)</i></dd>
<dd><a href="/portals/education/presentations/2006/ASPB_partII_TAIR.ppt">Part II</a> Introduction to various tools at TAIR: SeqViewer, AraCyc, PatMatch and Bulk downloads. <i>(presented by Christophe Tissier)</i></dd>
<dd><u>TAIR Workshop II: Gene Ontology and metabolic databases</u></dd>
<dd><a href="/portals/education/presentations/2006/ASPB_partI_GO.ppt">Part I</a> Gene Ontology (GO) introduction: purpose and structure of GO; where to find GO annotations at TAIR and elsewhere. <em>(presented by Christophe Tissier)</em></dd>
<dd><a href="/portals/education/presentations/2006/ASPB_partII_ARACYC.ppt">Part II</a> Presentation of the metabolic databases AraCyc and MetaCyc: their content and functionalitites. <em>(presented by Hartmut Foerster)</em></dd>
</dl>

<dl>
<dt>17th Arabidopsis Meeting - Madison June-July 2006</dt>
<dd><u>TAIR Workshop</u></dd>
<dd><a href="/portals/education/presentations/2006/AraMeet17_partI_TAIR.ppt">Part I</a> Navigation of the TAIR website, user registration, search and order stocks, gene search and gene functional annotations, keyword browser. <em>(presented by Katica Ilic)</em></dd>
<dd><a href="/portals/education/presentations/2006/AraMeet17_partII_TAIR.ppt">Part II</a> Search and browse using TAIR genome browser - SeqViewer, AraCyc 
biochemical pathways, Help Central. <em>(presented by Peifen Zhang)</em></dd>
</dl>
<dl>
<dt><strong>Return to main <a href="/portals/education/presentations.jsp">Presentations page</a></strong></dt>
</dl>
<br>
<center>Last modified on August 14, 2006</center>
</div> 
<!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>