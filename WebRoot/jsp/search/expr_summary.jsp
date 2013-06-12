<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, org.tair.search.*, org.tair.community.*, org.tair.querytools.*, java.util.*" %>

<%!
String pageName = "Microarray Experiment Search Results";
%>

<% 
// get results of search
SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );
ExprSummary[] results = (ExprSummary[]) searchCollection.getResults();
int resultSize = searchCollection.getResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String scrollLinks = searchCollection.getScrollLinks();
String searchCriteria = searchCollection.getSearchCriteria();
String query_id = (String) request.getAttribute( "query_id" );
%>

<SCRIPT LANGUAGE="JavaScript">
<!--

function mySubmit( pageNum, action, size, query_id) {
    document.search_result.pageNum.value = pageNum;
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

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<form action="<%=response.encodeURL("/servlets/Search")%>" name="search_result" method="get">
<input type="hidden" name="search_action" value="" />
<input type="hidden" name="type" value="expr" />
<input type="hidden" name="size" value="25"  />
<input type="hidden" name="pageNum" value="" />
<input type="hidden" name="query_id" value="" />

<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2" bgcolor="#ffffff">
      <tr>
	<td width="100%" align="left"> 
          <H1>TAIR Microarray Experiments Search Results</H1>
	  <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#F1EFEC">
	    <tr>
	      <td align="center" class="sm">
		<input type="button" value="new search" onClick="javaScript:mySubmit('1','new_search', 25 )" ><BR>
		new microarray experiments search
	      </td>
	      <td align="center" class="sm">
		<input type="button" value="download" onClick="javaScript:mySubmit( 0,'download', 25, '<%= query_id %>')" ><BR>
		check the boxes below and get summary
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

        <tr valign="top" bgcolor="#F5F9FF">
           <td>
	       <input type="button" name="check7" value="Check All" onClick="checkAll()">
	       &nbsp;&nbsp;
	       <input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()">
           </td>
        </tr> 

	<tr>
	   <td>
            <table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
               <tr align="left" <%=myBgColor.toggleBgColor()%> valign="bottom"> 
                 <th class="sm" align="center">Check to<br>Download</th>
                 <th class="sm" align="center">Experiment<BR>Name</th>
                 <th class="sm" align="center">Author (Organization)</th>
                 <th class="sm" align="center">Experiment<br>Categories<%=DefinitionsLookup.createPopupLink("RelationshipType","experiment_category")%></th>
                 <th class="sm" align="center">Experimental<br>Goals<%=DefinitionsLookup.createPopupLink("RelationshipType","experimental_goal")%></th>
                 <th class="sm" align="center">Experimental<br>Variables<%=DefinitionsLookup.createPopupLink("RelationshipType","experimental_factor")%></th>
		 <th class="sm" align="center">Array <BR>Manufacturer</th>
               </tr>

   	     <% for ( int i = 0; i < results.length; i++ ) { %>
               <tr <%=myBgColor.toggleBgColor()%> valign="top">
		 <td class="sm"><%= floor++ %><input type="checkbox" name="id" value="<%= results[ i ].getTairObjectID() %>"></td>

		 <td class="sm" ><a href="/servlets/TairObject?type=expression_set&id=<%= results[ i ].getTairObjectID() %>"><%= results[ i ].getOriginalName() %>&nbsp;</a></td>
		 
                 <td class="sm" align="center">
		   <% if ( results[ i ].hasExperimenters() ) {
		          ListCommunity experimenter = null;
                          Iterator iter = results[ i ].getExperimenters() ;
                          boolean first = true;
                          while ( iter.hasNext() ) {
                             experimenter = (ListCommunity) iter.next();
                             if ( !first ) {
                                out.write( ",<BR>" );
                             }
                   %><%--
                      --%><a href="/servlets/TairObject?type=<%= experimenter.getCommunityType() %>&id=<%= experimenter.getCommunityID() %>"><%= experimenter.getDisplayName() %></a><%--
                      --%><% first = false; %><%--
                      --%><% }  out.write( "<BR>" ); %>
		     <% }  %> 
		   
                     <% if ( results[ i ].hasSubmitOrganizations() ) {
		          out.write("(" );
                          ListCommunity experimenter = null;
                          Iterator iter = results[ i ].getSubmitOrganizations() ;
                          boolean first = true;
                          while ( iter.hasNext() ) {
                             experimenter = (ListCommunity) iter.next();
                             if ( !first ) {
                                out.write( ",<br>" );
                             }
                     %><%--
                        --%><a href="/servlets/TairObject?type=<%= experimenter.getCommunityType() %>&id=<%= experimenter.getCommunityID() %>"><%= experimenter.getDisplayName() %></a><%--
                        --%><% first = false; %><%--
                        --%><% }   out.write( ")" );  %>
		       
                   <% } %>

                 </td>


                 <td class="sm" align="center">
                      <% Iterator categoryIter = results[ i ].getExperimentCategories();
                         if ( categoryIter != null ) {
                             KeywordLite category = null;
                             boolean categoryFirst = true;
                             while ( categoryIter.hasNext() ) {
                                 category = (KeywordLite) categoryIter.next();
                                 if ( !categoryFirst ) {
                                   out.write( ",<br>" );
                                 }
                       %>
                                <a href="/servlets/TairObject?type=keyword&id=<%= category.getKeywordID() %>"><%= category.getKeywordName() %></a>
                               <% categoryFirst = false; %>
                          <% } %>
                      <% } %>
                    &nbsp;
                  </td>


                 <td class="sm" align="center">
                      <% Iterator goalIter = results[ i ].getExperimentGoals();
                         if ( goalIter != null ) {
                             KeywordLite goal = null;
                             boolean goalFirst = true;
                             while ( goalIter.hasNext() ) {
                                 goal = (KeywordLite) goalIter.next();
                                 if ( !goalFirst ) {
                                   out.write( ",<br>" );
                                 }
                       %>
                                <a href="/servlets/TairObject?type=keyword&id=<%= goal.getKeywordID() %>"><%= goal.getKeywordName()%></a>
                               <% goalFirst = false; %>
                          <% } %>
                      <% } %>
                     &nbsp;
                  </td>

                  <td class="sm" align="center">
                      <% Iterator factorIter = results[ i ].getExperimentFactors();
                         if ( factorIter != null ) {
                             KeywordLite factor = null;
                             boolean factorFirst = true;
                             while ( factorIter.hasNext() ) {
                                 factor = (KeywordLite) factorIter.next();
                                 if ( !factorFirst ) {
                                   out.write( ",<br>" );
                                 }
                       %>
                                <a href="/servlets/TairObject?type=keyword&id=<%= factor.getKeywordID() %>"><%= factor.getKeywordName() %></a>
                               <% factorFirst = false; %>
                          <% } %>
                      <% } %>
                    &nbsp;
                  </td>
		  <td class="sm" valign=top align="center"> <%=  results[ i ].getManufacturer() %> </td>  
               </tr>
  	     <% } %>

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
