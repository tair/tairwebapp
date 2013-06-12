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
<jsp:param name="id" value="2013" />
</jsp:include>

<jsp:include page="/jsp/includes/gotutorialSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Finding genes using GO terms"/>
</jsp:include>

<div id="rightcolumn">


<!--content goes here //-->
<span class="mainheader">Finding genes using GO terms</span>
<p>There are several ways to find genes using keywords such as GO terms. You can search the entire database using keywords and select the type of associated data to view, or search specifically for genes using keywords. This page shows how you can perform general keyword searches and to search for genes by keyword using examples and tools embedded within the page.</p>
<h2 class="main">Searching TAIR with Keywords</h2>
<p>Keyword searches can be done by typing in the term you wish to search for and choosing "TAIR Database" from the  Quick search box located in the upper right corner of all TAIR pages. By default, this is an EXACT match search. To use the quick search in an in-exact mode use the wild card character (*).For example type in *kinase* to find anything in the database with a name containing the term kinase. Alternatively, use the General Search or Keyword Search for inexact searching.</p>
<p>To use the General Search </p>
<ol>
<li>Go to the <a href="/servlets/Search?type=general&action=new_search" target="_new">General Search page</a> or try it using the form below.</li>
<li>Choose keyword search radio button.</li>
<li>Choose an inexact match (contains) search.</li>
<li>Enter the keyword search term (e.g.kinase).</li>
<li>Click submit.</li>
<li>If more than one keyword result is returned, find the appropriate term in the list of results.If there are any genes annotated to the term they will be displayed under the "Associated Data" header.Click on the link to "genes" in this section to view a list of genes annotated to the term (or its children).</li>
</ol>
<center>
 <FORM name="form1" action=<%=response.encodeURL("/servlet/Search")%> method="get" target="_new">
             <INPUT type="hidden" name="type" value="general">
            <INPUT type="hidden" name="action" value="search">
             <INPUT type="hidden" name="origForm" value="general">

            <TABLE width="400 px" border="0" cellspacing="0" bgcolor="#D5D9DD">
              <TR valign="top">
                <TD valign="middle"><img src="/images/cleargif.gif" width="20" height="1"></TD>
                <TD valign="middle">
                    <INPUT type="radio" name="radiobutton" value="name" checked>name<BR>
                    <INPUT type="radio" name="radiobutton" value="keyword">keyword</P>
                </TD>
                <TD valign="middle"><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
                <TD valign="middle" ><SELECT name="method">
                                <OPTION value="1">contains</OPTION>
                                <OPTION value="2"selected>starts with</OPTION>
                                <OPTION value="3">ends with</OPTION>
                                <OPTION value="4">exactly</OPTION>
                        </SELECT>
                </TD>

                <TD valign="middle"><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
                <TD valign="middle">
                  <INPUT type="text" name="name" size="20">
                </TD>
                <td><img src="/images/cleargif.gif" width="20" height="1"></td>
                <TD valign="middle">
                  <input type="button" value="submit" onClick="mySubmit()" >
                </TD>
                <TD valign="middle"><IMG src="/images/cleargif.gif" width="20" height="1"></TD>

                <TD valign="middle"><INPUT type="reset" name="reset" value="reset"></TD>

                <td valign="middle"><img src="/images/cleargif.gif" width="20" height="1"></td>
              </TR>
              <TR><TD colspan="11">&nbsp;</td></TR>
            </TABLE>
          </FORM>
</center>
<p>The associated genes include genes annotated to the term itself (e.g. kinase activity) as well as genes annotated to children terms (e.g. MAP kinase activity).</p>
<p>The number of genes found using the keyword search may differ substantially from the number of genes found using a gene name or description search.This is because a gene name search will only find those genes which have the term 'kinase' somewhere in the name or description (e.g. similar to casein kinase'). Conversely, the name or description of a gene may contain information that is not captured in the GO annotation. For example, a gene described as 'stress response protein' may NOT be annotated to the term 'response to stress' either because there is no evidence to support the association or because the gene has not yet been annotated.</p>

<h2>Searching for genes using keywords</h2>
<p>The Advanced Gene search can also be used to find genes using keywords such as GO terms. It differs from the general search in several important ways.</p>
<ul>
<li> You can  filter the results based upon the type of evidence used to make the GO annotation.</li>
<li> You can include other features of the gene in the search, such as location in the genome. </li>
</ul>
<p>
To use the Advanced Gene Search</p>
<ol>
<li>Go to the <a href="/servlets/Search?type=gene&action=new_search" target="_new">Advanced Gene Search Page</a></li>
<li>In the Search by Keyword section type in the keyword term  and choose an inexact or exact search.</li>
<li>Choose one or more types of keywords to search for or leave the default (Any) option selected.</li>
<li>To filter the results by evidence, select one or more types of evidence, or leave the default (Any) option selected.</li>
</ol>
<p>For example, to find all of the genes which have been assigned a molecular function based upon a direct assay, leave the keyword term field blank and choose Keyword Type= GO Molecular Function and Evidence =inferred from direct assay.</p>
</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
