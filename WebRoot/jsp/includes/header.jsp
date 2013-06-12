
  <% String msg = org.tair.utilities.WebApp.getProperty("HEADER_MESSAGE"); if(msg != null && !msg.equals("")) { %>
   <p class="header-message"><%=msg%></p>
   <div style="clear:both"></div>
  <% } %>

  <div id="nav">
    <ul id="search_cont">
      <li id="search">

        <form name="search_textbox_form" action="/servlets/Search" method="get" onsubmit="return doSearch()" id="search_textbox_form">
          <div>
            <input type="hidden" name="type" value="general">
            <input type="hidden" name="search_action">
            <input type="hidden" name="method">
            <input type="hidden" name="show_obsolete">
            <input type="text" name="name" size="10" id="searchfield">
            <select name="sub_type">
              <option value="aracyc">Metabolic Pathways</option>
              <option value="textpresso">Textpresso full text</option>
              <option value="any">Exact name search</option>
              <option value="clone_end">EST or BAC end</option>
              <option value="clone">Clone</option>
              <option value="community">Person or lab</option>
              <option value="ecotype">Ecotype</option>
              <option value="gene" selected>Gene</option>
              <option value="germplasm">Germplasm</option>
              <option value="keyword">Keyword</option>
              <option value="library">Library</option>
              <option value="marker">Marker</option>
              <option value="polyallele">Polymorphisms</option>
              <option value="protein">Protein</option>
              <option value="seed">Seed stock</option>
              <option value="stock">DNA stock</option>
              <option value="vector">Vector</option>
            </select>
            <input type="submit" alt="search" value="Search" id="searchbutton">
            <input type="hidden" name="SEARCH_EXACT" value="<%= org.tair.utilities.DataConstants.SEARCH_EXACT %>">
            <input type="hidden" name="SEARCH_CONTAINS" value="<%= org.tair.utilities.DataConstants.SEARCH_CONTAINS %>">
          </div>
        </form>

        <form name="google_form" method="get" action="http://www.google.com/custom" id="google_form">
          <input type="hidden" name="q" size="10" maxlength="255" value="">
          <input type="hidden" name="cof" value="L:http://www.arabidopsis.org/images/logosmall.gif;AH:left;GL:0;S:http://www.arabidopsis.org;AWFID:56b9e4624af96ab2;">
          <input type="hidden" name="domains" value="arabidopsis.org">
          <input type="hidden" name="sitesearch" value="arabidopsis.org">
        </form>

        <form name="aracyc_form" method="get" action="http://pmn.plantcyc.org/ARA/substring-search" id="aracyc_form">
          <input type="hidden" name="type" size="10" maxlength="255" value="NIL">
          <input type="hidden" name="object" size="10" maxlength="255" value="">
        </form>

        <form name="textpresso_form" method="get" action="http://www.textpresso.org/cgi-bin/arabidopsis/query" id="textpresso_form" onclick="javascript:urchinTracker('/outgoing/textpresso');">
          <input type="hidden" name="textstring" value="">
        </form>
      </li>
    </ul>

    <div id="logo">
      <a href="/index.jsp"><img src="/i/logo2.gif" width="87" height="61" alt="tair"></a>
    </div>

    <%@ include file="/jsp/includes/topnav.html" %>
    <%@ include file="/jsp/includes/secondnav.html" %>
  </div>
  <%@ include file="/jsp/includes/analytics.html" %>
