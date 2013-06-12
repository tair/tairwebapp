<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "GO Tutorial";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="201" />
</jsp:include>

<jsp:include page="/jsp/includes/gotutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="TAIR's GO Tutorial"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes here //-->

<span class="mainheader">Introduction</span>
<p>The purpose of this tutorial is to:<br/>
<ol>
<li>Explain how the Gene Ontology Consortium's controlled vocabularies are structured</li>
<li>Illustrate how the controlled vocabularies are used at TAIR to describe Arabidopsis genes and </li>
<li>Demonstrate how to use the GO resources at TAIR to find or predict the functions of Arabidopsis genes.</li>
</ol>
</p>
<p>After completing this tutorial you should be able to:<br/>
<ol>
<li>Understand the structure of the GO ontologies and annotations.</li>
<li>Rank GO annotations based upon evidence codes.
<li>Find genes using keywords.</li>
<li>Find all GO annotations for a gene or set of genes.</li>
<li>Group sets of genes by GO term and display the distribution in a pie chart.</li>
</ol>
<p>
To view definitions of terms used in this tutorial click on the <img src="/images/questionmark.gif"/> next to the term. This will open a pop-up window displaying the definition for the term.
</p>
<p>To navigate between pages in the tutorial , either click on the link to the specific page in the table of contents or use the pointers in the menu to move to the previous or next page.</p>

<p>This tutorial makes use of Quicktime.Click here  <a href="http://www.apple.com/quicktime/download"><IMG SRC="http://a772.g.akamai.net/7/772/51/9a209465e85cbe/www.apple.com/main/elements/getquicktime.gif" WIDTH="88" HEIGHT="31" BORDER="0" ALT="Get QuickTime"/></a>to get the Quicktime Plug-in</p>

</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>