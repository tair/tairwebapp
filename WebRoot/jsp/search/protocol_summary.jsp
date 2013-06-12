<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.search.*, org.tair.utilities.*, java.util.*, org.tair.tfc.*, org.tair.querytools.*" %>

<%!
String pageName = "Protocol Search Results";
%>
<% 
// get results of search
SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );
ProtocolSummary[] results = (ProtocolSummary[]) searchCollection.getResults();
String queryID = (String) request.getAttribute( "query_id" );
int resultSize = searchCollection.getResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String scrollLinks = searchCollection.getScrollLinks();
String searchCriteria = searchCollection.getSearchCriteria();
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />


<script language='JavaScript'>
<!--

var helpfile="/help/index.jsp";

function mySubmit(page_number, action, size, query_id ) {
      // if requesting a new search
      if ( action == "new_search" ) {
         document.search_result.action = "/servlets/Search";
         document.search_result.type.value = "protocol"
      }

      document.search_result.pageNum.value = page_number;
      document.search_result.search_action.value = action;
      document.search_result.size.value = size;
      document.search_result.query_id.value = query_id;

      document.search_result.submit();
}

function checkAll() {
      if ( document.search_result.id.length >= 1 ) {
          for ( i = 0; i< document.search_result.id.length; i++ ) {
              document.search_result.id[ i ].checked = true;
          }
      } else {
          document.search_result.id.checked = true;
      }
}

function unCheckAll(){
      if ( document.search_result.id.length >= 1 ) {
          for ( i = 0; i < document.search_result.id.length; i++ ) {
              document.search_result.id[ i ].checked = false;
          }
      } else {
          document.search_result.id.checked = false;
      }
}

// -->
</SCRIPT>

<form action="<%= response.encodeURL( "/servlets/Search" ) %>" name="search_result" method="get">
<input type="hidden" name="type" value="protocol" />
<input type="hidden" name="search_action" value="" />
<input type="hidden" name="size" value="25" />
<input type="hidden" name="pageNum" value="" />
<input type="hidden" name="query_id" value="" />

<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
      <tr>
	<td width="100%"> 
	  
          <h1>TAIR Protocol Search Results</h1>
	  <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#F1EFEC">
	    <tr>
	      <td align="center" width="33%" class="sm">
		<input type="button" value="new search" onClick="javaScript:mySubmit('1','new_search', 25 )" ><BR>
		new protocol search
	      </td>
	      
	      <td align="center" width="33%" class="sm" color="#666666"> 
                &nbsp;
	      </td>
	      <td align="center" width="34%" class="sm">
		<input type="button" value="download" onClick="javaScript:mySubmit( 0, 'download', 25, '<%=queryID%>')" ><BR>
		check the boxes below and download results
	      </td>
	    </tr>
	  </table>
	</td>
      </tr>


       <tr>
           <td>&nbsp;</td>
       </tr>
      
      <% if ( resultSize >  0 ){ %>
       <tr>
         <td>
            <%= EmptyTextConverter.convert( searchCriteria ) %>
            <p>
              Displaying <%= floor %> - <%= ceiling %>.
         </td>
       </tr>

      <% } else { %>
       <tr>
         <td>
            <%= EmptyTextConverter.convert( searchCriteria ) %>
            <p>
            Please consider the following as you modify your query and try again:<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Check the spelling.<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- For a broader or narrower search make the appropriate selection from the name drop-down menu<br><br>
	 </td>
       </tr>
     <% } %>

     <% if ( resultSize > 0 ) { %>

    <tr >
      <td>
	<table width="100%" border="0" cellspacing="0">
	  <tr>
	    <td colspan="2">
	        <input type="button" name="check7" value="Check All" onClick="checkAll()">
	    </td>
	    <td colspan="3" align="right">	
	        <input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()">
	    </td>
	  </tr>

	<% for ( int i = 0; i < results.length; i++ ) { %>
	    <tr <%=myBgColor.toggleBgColor()%> valign="top">
      	    <td class="sm" align="center"><%= floor++ %></td>
	    <td><input type="checkbox" name="id" 
			value="<%= results[ i ].get_reference_id() %>" >
	    </td>
	    <th class="sm" align="right">Title</th>
	    <td>&nbsp;</td>
	    <td class="sm" align="left">
            <a href="/servlets/TairObject?type=protocol&id=<%=results[ i ].get_reference_id()%>"><%= results[ i ].get_title()%></a>
	   <!-- pdf links -->
	     <%  if( results[ i ]. hasPdfLink()){
	         out.print (" ("); 
                 for ( Iterator iter = results[ i ].getPdfLinks(); iter.hasNext(); ) {
	         String link = (String)iter.next();
             %>  
	     <A href="<%=link  %>">download PDF&nbsp;</A>
	     <%  } out.print( ") "); } %>   
	      
	    </td>
	    </tr>

	    <tr <%= myBgColor.sameBgColor()%>>
	    <td class="sm" align="center" colspan=2></td>
	    <th class="sm" align="right">Authors</th>
	    <td>&nbsp;</td>
            <td class="sm" align="left"><%= EmptyTextConverter.convert( results[ i ].get_authors() ) %></td>
            </tr>

	    <tr <%= myBgColor.sameBgColor()%>>
	    <td class="sm" align="center" colspan=2></td>
	    <th class="sm" align="right">Description</th>
	    <td>&nbsp;</td>
            <td class="sm" align="left"><%= EmptyTextConverter.convert( TextConverter.truncateString( results[ i ].get_description(), 100 ) ) %></td>
            </tr>

	    <tr <%= myBgColor.sameBgColor()%>>
            <td class="sm" align="center" colspan=2></td>
            <th class="sm" align="right">Keywords<%=DefinitionsLookup.createPopupLink("Keyword","keyword")%></th>
	    <td>&nbsp;</td>
            <td class="sm" align="left"><%= results[ i ].getKeywordList()%> </td>
            </tr>

      <% } // for (results) %>

       </table>
     </td>
    </tr>
  <% } %>

  <% if ( scrollLinks != null ) { %>
    <tr>
      <td class="sm" align="center"><%= scrollLinks %></td>
    </tr>
  <% } %>

</table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
