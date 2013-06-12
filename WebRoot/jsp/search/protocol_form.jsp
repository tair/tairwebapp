<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, java.util.*" %>

<%!
String pageName = "Protocol Search";
String cssfile="/css/page/search.css";
String id="510";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="510" />
</jsp:include>

<!--Content-->

<span class="mainheader">TAIR  Protocol Search </span>
<p id="help">[<a href="/help/helppages/protsearch_help.jsp">Help</a>]</p>

<form name="searchForm" method="post" action="<%=response.encodeURL("/servlets/Search")%>" id="searchForm">
    <p class="intro">
      <input type="hidden" name="type" value="protocol">
      <input type="hidden" name="action" value="search">
      <input type="hidden" name="pageNum" value="1">

        Use this form to search for protocols, experimental methods and classroom activities 
        in TAIR's database. Protocols have been obtained from individual submissions and compilations
        such as the Complete Guide, and EMBO and CSHL Arabidopsis Course manuals.  We encourage you to share your protocols with the
        research community and welcome your contributions. To submit a protocol to
        TAIR please follow the <a href="/submit/protocol_submission.jsp">Guidelines
        for protocol submission.</a>
    </p>
    
    <div id="searchbox">
    <span class="search_buttons">
        <input type="reset" name="reset" value="Reset" onClick="resetHelper()">
        <input type="submit" name="search" value="Submit Query">
    </span>
    
    <fieldset>
        <dl>
            <dt>
                Search Term(s)
            </dt>
            <dd>
                <SELECT name="type_1" class="small_sel">
                  <OPTION value="title">title</OPTION>
                  <OPTION value="authors">authors</option>
                  <OPTION value="description" selected>description</OPTION>
                </SELECT>
                
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method_1", DataConstants.SEARCH_CONTAINS, false, "small_sel", "" ) %>
                <INPUT type="text" name="term_1" size="12" maxlength="62"> and
            </dd>
    
            <dt>
                &nbsp;
            </dt>
            <dd>
                <SELECT name="type_2" class="small_sel">
                  <OPTION value="title" selected>title</OPTION>
                  <OPTION value="authors" >authors</option>
                  <OPTION value="description">description</OPTION>
                </SELECT>
                
                <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method_2", DataConstants.SEARCH_CONTAINS, false, "small_sel", "" ) %>
                <INPUT type="text" name="term_2" size="12" maxlength="62" >  and
            </dd>
            
            <dt>
                Browse Keywords <%=DefinitionsLookup.createPopupLink("Keyword","type")%><br>
		       (allow multiple selections)
            </dt>
            <dd>
                <%= HTMLFactory.createProtocolKeywordSelect( "keywords", "", 8 ) %>
            </dd>
        <dl>
    </fieldset>
    
    <fieldset>
    <legend>Output Options</legend>
        <dl>
            <dt>
                number of records/page
            </dt>
            <dd>
                <SELECT name="size">
                    <OPTION value="25" selected>25
                    <OPTION value="50">50
                    <OPTION value="100">100
                    <OPTION value="200">200
                </SELECT>
            </dd>
            <dt>
                sort records by
            </dt>
            <dd>
                <SELECT name="order">
                    <OPTION value="title" selected>title
                    <OPTION value="authors">authors
                </SELECT>
            </dd>
        </dl>
    </fieldset>
    
   
		<span class="search_buttons">
            <input type="reset" name="reset" value="Reset" onClick="resetHelper()" />
            <input type="submit" name="search" value="Submit Query" />
        </span>
  </div>
</form>


<!-- End of Content -->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
           
    
        
            
