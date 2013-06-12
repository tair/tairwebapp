<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "TAIR Help Central";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="2" />
</jsp:include>


<jsp:include page="/jsp/includes/helpSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value=""/>
</jsp:include>

<div id="rightcolumn">


<dl class="results">
<p>This section of TAIR's website contains links to documents to help you maximally utilize TAIRs database and tools. </p>
<p>Use the  Definitions help. Wherever you see a <img src="/images/questionmark.gif"> symbol next to a word , click on the symbol to see a definition for the word or phrase.</p>
<p> 
If you have a specific topic you need help with, you can search ONLY within the help section of TAIR using the search box below.</p>

<table><tr><td valign=center colspan=3>
<FORM method=GET action=http://www.google.com/u/TAIR>
<INPUT TYPE=text name=q size=15 maxlength=255 value="">&nbsp;
<input type=submit value="Search Help"></td>
<font face=arial,sans-serif size=-1>
<input type=hidden name=domains value="www.arabidopsis.org">
<input type=hidden name=sitesearch value="www.arabidopsis.org">
<input type=hidden name=hq value="inurl:arabidopsis.org/help"></font><br></td></tr></TABLE></FORM>


<dl>
<dt><a href="/help/tutorials/index.jsp">Tutorials</a></dt>
<dd>Note: These tutorials work best with the following browsers: Firefox, Internet Explorer 6.X(Win), Safari and Netscape 8 and up. Quicktime is required to view the demos.</dd>
</dl>
<dl>
<dt><a href="faq.jsp">FAQ</a> </dt>
<dd>A list of frequently asked questions ordered by major topic. </dd>
</dl>
<dl>
<dt><a href="quickstart.jsp">Quick Start</a></dt>
<dd>A brief introduction to common uses of TAIR.</dd>
</dl>
<dl>
<dt><a href="helpcontents.jsp">Database and Tool Help Pages</a></dt>
<dd> Help pages for searching TAIR database and using the analysis tools.</dd>
</dl>
<dl>
<dt><a href="/servlets/processor?type=definition&update_action=glossary">TAIR Glossary</a></dt>
<dd> A glossary of terms used in TAIR database.</dd>
</dl>
<dl>
<dt>Configuring your browser to use TAIR.</dt>
<dd>This site makes extensive use of Java and Javascript. If you don't see a toolbar and the tair logo on the top of the page, make sure that both Java and Javascript are enabled in your browser. Registration, ordering and a variety of other processes requires you to enable cookies. Please update your browser configuration to accept cookies for the site.</dd>
<ul>
<li>To enable Javascript in Netscape, go to the Edit Menu, choose Preferences, click on 'Advanced', check both Java and Javascript boxes.
<li> To enable Javascript in Internet Explorer, go to the Explorer menu, choose Preferences. Under Web Content/Active Scripting, choose "enable scripting".
<li> To accept Cookies, in Internet Explorer, go to the Explorer menu, choose Preferences. Under Receiving Files , choose Cookies. You can opt to accept all cookies, cookies per site or ask for each cookie.
</ul>
</dl>
</dl>
</div><!--end right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


