<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.search.*, org.tair.utilities.*, org.tair.community.*, java.util.*"%>

<%!
String pageName = "Community Search Results";

%>

<% 
// get results of search
SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );
CommunitySummary[] results = (CommunitySummary[]) searchCollection.getResults();
String queryID = (String) request.getAttribute( "query_id" );
int resultSize = searchCollection.getResultSize();
int floor = searchCollection.getFloor();
int ceiling = searchCollection.getCeiling();
String scrollLinks = searchCollection.getScrollLinks();
String searchCriteria = searchCollection.getSearchCriteria();

// determine if publication search called as part of
// another tool's functionality (i.e. from gene symbol
// registry, or expression submission) - use to determine
// how/whether to redirect submission

String mode = request.getParameter( "mode" );
boolean associate = !(TextConverter.isEmpty( mode ));

boolean associate_lab = false ;
boolean associate_person = false ;

String search_what = request.getParameter( "search_what" );
if ( !TextConverter.isEmpty(search_what) && search_what.equals("search lab") ){
   associate_lab =  true;
}
if ( !TextConverter.isEmpty(search_what) && search_what.equals("search person") ){
   associate_person =  true;
}

boolean curator = LoginChecker.isTairCurator( request );

%> 

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<script language='JavaScript'>
 <!--
function mySubmit(page_number, action, size, query_id ) {
   if ( action == 'gene_symbol' ) {
       document.community_search_result.action = "/servlets/processor";
       document.community_search_result.type.value = "genesymbol";
    } else {
      document.community_search_result.pageNum.value = page_number;
      document.community_search_result.search_action.value = action;
      document.community_search_result.size.value = size;
      document.community_search_result.query_id.value = query_id;
    }
     document.community_search_result.submit();
}


function checkAll() {
	for(i=0;i<document.community_search_result.id.length;i++)
           {
             var c = document.community_search_result.id[i];   
             c.checked = true;   
	   }
    }
// here if ya need it
function unCheckAll()
    {
	for(i=0;i<document.community_search_result.id.length;i++)
           {
             var c = document.community_search_result.id[i];   
             c.checked = false;   
	   }
    }
//-->
</script>

<form action="<%= response.encodeURL( "/servlets/Search" ) %>"
      name="community_search_result" method="get">
<input type="hidden" name="search_action" value="" />
<input type="hidden" name="type" value="community" />
<input type="hidden" name="pageNum" value="" />
<input type="hidden" name="size" value="25" />
<input type="hidden" name="query_id" value="" />
<input type="hidden" name="curator" value="<%= curator %>">

<% if ( associate_lab ) { %>
    <input type="hidden" name="mode" value="<%= mode %>">
    <input type="hidden" name="update_action" value="associate_org">
<% } else if (associate_person){ %>
    <input type="hidden" name="mode" value="<%= mode %>">
    <input type="hidden" name="update_action" value="associate_person">
<% } %>

<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
      <tr>
	<td>
    <b><font size="+1">TAIR Community Search Results</font></b> [<a href="/help/helppages/commres.jsp">Help</a>]<br> 
    <p>	    

           <TABLE width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#F1EFEC">
              <tr>
                <td align="center" width="33%" class="sm">
		  
		 <INPUT type="button" value="new search" onClick="javaScript:mySubmit('1','new_search', 25)" ><BR>
                  new community search
		 
                </td>

                <td align="center" width="33%" class="sm" color="#666666"> 
                <!-- <FONT color="#666666">search within this list<br>
					(available soon)</FONT> -->
                &nbsp;
                </td>
		</Font>
                <td align="center" width="34%" class="sm">

		<% if ( associate_lab ) { %>
		     <INPUT type="button" value="use this org" onClick="mySubmit( 0, '<%= mode %>', 25 )" ><BR>
                <% } else if ( associate_person ) { %>
		     <INPUT type="button" value="associate to this person" onClick="mySubmit( 0, '<%= mode %>', 25, '<%= queryID %>' )" ><BR>
                <% } else { %>
		   <INPUT type="button" value="download" onClick="mySubmit( 0,'download', 25, '<%= queryID %>' )" ><BR>
                       check the boxes below and download results
		<% }  %>  
                </td>
              </tr>
            </TABLE>
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
            <% if ( associate_lab ) { %>
              <p>Select the organization you want to associate to by checking its
corresponding box and clicking on the "use this org" button
            
            <%  } else if (associate_person){ %>
            <p>Select the person you want to associate to by checking its
corresponding box and clicking on the "associate to this person" button
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
	 </td>
       </tr>
     <% }  %>
       

     <% if ( resultSize  > 0 ) { %>
    
     <% if (! associate ) {  %>
       <tr valign="top" bgcolor="#F5F9FF">
         <td colspan="8"><input type="button" name="check7" value="Check All" onClick="checkAll()"><input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()"></td>
      </tr>
    <% } %>
      
   	<tr>
	   <td>
            <table width="100%" border="0" cellspacing="0">
              <tr  <%=myBgColor.toggleBgColor()%> align="left"> 
                    <TH class="sm">&nbsp; </TH>
                    <TH class="sm" >Type</TH>
                    <TH class="sm" >Name</TH>

                    <% if ( curator ) { %>
                       <TH class="sm" >Email</TH>
                    <% } %>

                    <TH class="sm" >Location (state, country)</TH>
                    <TH class="sm">Affiliated<br>Organizations</TH>
              </tr>

	      <% for (int i = 0; i < results.length; i++ ) { %>
               <tr <%=myBgColor.toggleBgColor()%> align="left" valign="top">
		 <td class="sm" align="left" nowrap><%= floor++ %>
		    <input type="checkbox" name="id" value="<%= results[ i ].get_community_id() %>">
        
		 </td>
                   
                    <td class="sm" nowrap><%= EmptyTextConverter.convert( results[ i ].get_type()) %>
                     <% if  (results[ i ].get_sub_type()!=null){ %>
                      <%= ":<BR>"+results[ i ].get_sub_type()  %>
                     <% }  %> &nbsp;</td>
                    <td class="sm"><A href="/servlets/TairObject?type=<%= results[ i ].get_type() %>&id=<%= results[ i ].get_community_id() %>"><%= results[ i ].get_name() %></A>&nbsp;</td>

                    <% if ( curator ) { %>
                       <td class="sm"><%= EmptyTextConverter.convert( results[ i ].get_email() ) %>&nbsp;</td>
                    <% } %>
 
                    <td class="sm" align='center'><%= EmptyTextConverter.convert( results[ i ].get_format_address() ) %>&nbsp;</td>
                    <td class="sm">
                       <% if ( results[ i ].hasAffiliateOrganizations() ) {
                            ListCommunity org = null;
                            boolean first = true;
                            Iterator iter = results[ i ].getAffiliateOrganizations();
                            while ( iter.hasNext() ) {
                               org = (ListCommunity) iter.next();
                       %>
                            <% if ( !first ) { %>
                                   <br>
                            <% } %>
                            <a href="/servlets/TairObject?type=<%= org.getCommunityType() %>&id=<%= org.getCommunityID() %>"><%= org.getDisplayName() %></a>
                            <% first = false; %>
                         <% } %>
                      <% } else { %>
                         &nbsp;
                      <% } %>
                      
                   </td>
               </tr>
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
