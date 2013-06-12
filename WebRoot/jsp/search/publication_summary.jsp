<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.sql.*, java.math.BigInteger, org.tair.search.*, org.tair.utilities.*, org.tair.community.*, org.tair.querytools.*, org.tair.bs.community.*" %>

<%!
String pageName = "Publication Search Results";
%>


<%!

//
// Define method to determine whether checkbox next to publication
// should be checked or not.  Returns text to be included in HTML
// tag of checkbox (i.e. "checked" or empty string). Will return 
// checked if in community->publication association mode and user
// is already associated to publication; also will return checked
// if publication's id is contained in user's SearchSession as an 
// item selected on a different page load for association or download
//

private String checkPublicationAssociation( boolean associate,
                                            BsPerson person,
                                            HttpServletRequest request, 
                                            BigInteger referenceID ) 
                                            throws SQLException {
    String checked = "";
    if ( associate && 
         person != null && 
         person.containsPublication( referenceID ) ) {

             checked = "checked";

    } else { // check search session
         SearchSession searchSession = SessionHandler.getSearchSession( request );
         if ( searchSession.hasDownloadID( PublicationSearchHandler.getSearchType(),
                                           referenceID.longValue() ) ) {
             checked = "checked";
         }
    }

    return checked;
}

%>

<% 
// get results of search
SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );
PublicationSummary[] results = (PublicationSummary[]) searchCollection.getResults();
String query_id = (String) request.getAttribute( "query_id" );
int resultSize = searchCollection.getResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String scrollLinks = searchCollection.getScrollLinks();
String searchCriteria = searchCollection.getSearchCriteria();

// determine if publication search called as part of
// another tool's functionality (i.e. from gene symbol
// registry, or community profile maintenance) - use to determine
// how/whether to redirect submission
String mode = request.getParameter( "mode" );

// use simple boolean flag down below
boolean associate = !(TextConverter.isEmpty( mode ));

// get person object if in community mode for pre-selecting
// checkboxes of publications user is already associated to
BsPerson person = null;
if ( associate && mode.equals( "community" ) ) {
     person = SessionHandler.getPerson( request ); // throws exception if not found
}

%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<SCRIPT LANGUAGE="JavaScript">
<!--

// set form action to proper URL based on value of action -
// this allows us to send request back to gene symbol registry
// or community profile if needed
function mySubmit(page_number, action, size, query_id) {

    if ( action == 'gene_symbol' ) {
       document.search_result.action = "/servlets/processor";
       document.search_result.type.value = "genesymbol";
    } else if ( action == 'community' ) {
       document.search_result.action = "/servlets/Community";

    } else {
       document.search_result.type.value = "publication";
       document.search_result.pageNum.value = page_number;
       document.search_result.search_action.value = action;
       document.search_result.size.value = size;
       document.search_result.query_id.value = query_id;
    }
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

<form action="<%=response.encodeURL("/servlets/Search")%>" name="search_result" method="get">
<input type="hidden" name="search_action" value="" />
<input type="hidden" name="type" value="" />
<input type="hidden" name="size" value="25" />
<input type="hidden" name="pageNum" value="" />
<input type="hidden" name="query_id" value="" />

<% if ( associate ) { %>
    <input type="hidden" name="mode" value="<%= mode %>" />
  
    <!-- pass mode specific params for rejoining original workflow -->
    <% if ( mode.equals( "gene_symbol" ) ) { %>
       <input type="hidden" name="update_action" value="associate_pubs" />

    <% } else if ( mode.equals( "community" ) ) { %>
       <input type="hidden" name="community_action" value="publication" />
       <input type="hidden" name="pub_action" value="associate_pubs" />
    <% } %>
 
<% } %>

<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2" bgcolor="#F5F9FF">
      <TR>
	<TD width="100%" align="left"> 
        <b><font size="+1">TAIR Publication Search Results</font></b> [<a href="/help/helppages/pubres.jsp">Help</a>]<br>
          <p>
	  <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#F1EFEC">
	    <TR>
	      <TD align="center" width="33%" class="sm">
		<input type="button" value="new search" onClick="mySubmit('1','new_search', 25 )" ><BR>
		new publication search
	      </TD>
	      
	      <TD align="center" width="33%" class="sm" color="#666666"> 
                <!--<input type="button" value="refine_search"><BR> -->
		<!--<FONT color="#666666">search within this list<br>
		  (available soon)</FONT> -->
                &nbsp;
	      </TD>
	      <TD align="center" width="34%" class="sm">
                <% if ( associate ) { %>
		     <input type="button" value="associate" onClick="mySubmit( 0, '<%= mode %>', 25, '<%= query_id %>')" ><BR>
                <% } else { %>
		     <input type="button" value="download" onClick="mySubmit( 0, 'download', 25, '<%= query_id %>')" ><BR>
		     check the boxes below and download results
                <% } %>

	      </TD>
	    </TR>
	  </table>
	</TD>
      </TR>

      <TR>
	<TD>&nbsp;</TD>
      </TR>


      <% if ( resultSize >  0 ){ %>
       <tr>
         <td>
            <%= EmptyTextConverter.convert( searchCriteria ) %>
            <p>
              Displaying <%= floor %> - <%= ceiling %>.

            <% if ( associate ) { %>
              <p>
                Select publications to associate to your submission by checking the box next 
                to your desired publication(s) and clicking the "associate" button

               <% if ( mode.equals( "community" ) ) { %>
               <p>
                 If a paper you are looking for was published before 1988 click on the 'new
                 search' link above to alter the search dates. If a paper is not found in
                 TAIR, please <a href="mailto:curator@arabidopsis.org">contact the curators</a>.
                 Send the citation or pubmed id and we will add the paper to the database.
              <% } %>
            <% } %>


         </td>
       </tr>

      <% } else { %>
       <tr>
         <td>
            <%= EmptyTextConverter.convert( searchCriteria ) %>
            <p>
            Please consider the following as you modify your query and try again:<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Check the spelling.<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- For a broader or narrower search make the appropriate selection from the name drop-down menu<br><br></FONT></P><br>

            <!-- Give link back to community profile if user came here from profile maintenance.  -->
     
            <% if ( associate && mode.equals( "community" ) ) { %>

                <p>
               <input type="button" value="Return to Profile" onClick="document.location.href='/servlets/Community?action=redirect&req_page=personProfile'">
            <% } %>
	 </td>
       </tr>
     <% } %>


      <% if ( resultSize > 0 ) { %> 
      <TR valign="top" bgcolor="#F5F9FF">
      	<TD colspan="8"><input type="button" name="check7" value="Check All" onClick="checkAll()"><input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()"></TD>
      </TR>

      <TR>
        <td>
	    <table width="100%" border="0" cellspacing="0" cellpadding="0">

        <% for (int i = 0; i < results.length; i++ ) { %>

               <!-- check checkbox if in community mode and person already associated to pub,
                    or if pub was selected for download/association on a previous page and
                    is stored in user's session -->
               <% String checked = checkPublicationAssociation( associate, person, request, results[ i ].get_reference_id() ); %>

    		<TR <%=myBgColor.toggleBgColor()%>>
      	            <TD class="sm" align="left" valign=top><%= floor++ %><input type="checkbox" name="id" value="<%= results[ i ].get_reference_id() %>" <%= checked %>></TD>
                    <TH class="sm" align="left" valign=top>Authors</TH>
		    <TD class="sm" align="left" valign=top>&nbsp;</TD>
		    <TD class="sm" align="left"><%= EmptyTextConverter.convert( results[ i ].get_authors() ) %>&nbsp;</TD>
		 </TR>
		   
                 <TR <%= myBgColor.sameBgColor()%>>
      	            <TD class="sm" align="left" valign=top>&nbsp;</TD>
                    <TH class="sm" align="left" valign=top >Title</TH>
		    <TD class="sm" align="left" valign=top>&nbsp;</TD>
		    <TD class="sm" align="left" ><a href="/servlets/TairObject?type=publication&id=<%= results[ i ].get_reference_id() %>"><%= EmptyTextConverter.convert( results[ i ].get_title() ) %></A>&nbsp;</TD>
		 </TR>
		   
                <TR <%= myBgColor.sameBgColor()%>>
      	            <TD class="sm" align="left" valign=top>&nbsp;</TD>
                    <TH class="sm" align="left" valign=top>Source</TH>
		    <TD class="sm" align="left" valign=top>&nbsp;</TD>
		    <TD class="sm" align="left"><%= EmptyTextConverter.convert( results[ i ].get_pub_source_name() ) %>&nbsp;</TD>
		</TR>
		  
        	<TR <%= myBgColor.sameBgColor()%>>
      	            <TD class="sm" align="left" valign=top>&nbsp;</TD>
		    <TH class="sm" align="left" valign=top>Year</TH>
		    <TD class="sm" align="left" valign=top>&nbsp;</TD> 
      		    <TD >
		      <table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <TR <%= myBgColor.sameBgColor()%> >
		        <TD class="sm" align="left"><%= EmptyTextConverter.convert( results[ i ].get_year() ) %>&nbsp;</TD>
			<TH class="sm" align="center">Volume</TH>
      			<TD class="sm" align="center"><%= EmptyTextConverter.convert( results[ i ].get_volume() ) %>&nbsp;</TD>
			<TH class="sm" align="center">Page</TH>
      			<TD class="sm" align="left"><%= EmptyTextConverter.convert( results[ i ].get_page_start() ) %>&nbsp;</TD>
	             </TR>
		     </table> 
	           </TD>
		</TR>
		 
		<TR <%= myBgColor.sameBgColor()%>>
		    <TD class="sm" align="left" valign=top>&nbsp;</TD>
                    <TH class="sm" align="left"  valign=top>Keywords</TH>
		    <TD class="sm" align="left" valign=top>&nbsp;</TD>
                    <td class="sm" wrap align="left"><%=EmptyTextConverter.convert( results[ i ].getHighlightedKeywordList() ) %>&nbsp;</td>
    		</TR>
        <% } %>

   	  </table>
       </td>
    </tr>

   <% if ( scrollLinks != null ) { %>
    <tr>
      <td class="sm" align="center"><%= scrollLinks %></td>
    </tr>
   <% } %>
	
<% } %> 

</table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

