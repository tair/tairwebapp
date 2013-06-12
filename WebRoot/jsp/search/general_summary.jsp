<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%!
String pageName = "General Result";
String highlight = "1";
%>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import= "org.tair.search.*, org.tair.utilities.*, java.net.*, java.util.*"%>

<%!
// displayTypes map holds formatted values to display for
// specific search types.  Only search types that need a special
// display value other than the search type + (s) should appear
// here.  For example, search type for clone ends is "clone_end",
// but display value should leave off the underscore.  All values
// that don't have special cases should be left out of this collection
HashMap displayTypes = getDisplayTypes();


private HashMap getDisplayTypes() {
    HashMap displayTypes = new HashMap();
    displayTypes.put( "marker", "genetic marker(s)" );
    displayTypes.put( "clone_end", "clone end(s)" );
    displayTypes.put( "community", "person(s)/organization(s)" );
    displayTypes.put( "polyallele", "polymorphism(s)" );
    displayTypes.put( "library", "libraries" );
    displayTypes.put( "seed", "seed stock(s)" );
    displayTypes.put( "stock", "dna stock(s)" );
    displayTypes.put( "gene", "locus/loci" );
    return displayTypes;
}

%>


<%

GeneralSummary general = (GeneralSummary) request.getAttribute( "searchResults" );
String url = null;
String searchTerm = null;
String method = null;
String type = null;
String typeURL = null;
int totalCount = 0;
HashMap results = null;
Iterator searchTypes = null;
boolean forward = false;

if ( general != null ) {
      searchTerm =  general.getSearchTerm();	
      method = general.getSearchMethod();
      totalCount = general.getTotalCount();
      results = new HashMap();

      searchTypes = general.getSearchTypes();
      while ( searchTypes.hasNext() ) {
         type = (String) searchTypes.next();
         if ( general.hasTypeCount( type ) ) { 
           typeURL = response.encodeURL( "/servlets/Search?type=general&name=" + URLEncoder.encode( searchTerm ) + "&action=detail&method=" + URLEncoder.encode( method ) + "&sub_type=" + type );

           if ( general.hasMultipleResults() ) {
              if ( results == null ) {
                results = new HashMap();
              }  
              results.put( type, typeURL );
           } else {
             forward = true;
             break;
           }
         }
      }

      if ( forward ) {
         pageContext.forward( typeURL );
      }
}

%>



<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<script language="javascript">
//
// Determines whether an "any" search or a type specific search was
// executed and populates the "search_action" parameter of the main
// search form to ensure to correct search is executed. Form is
// submitted here after form values are set.
//
function mySubmit() {
    var selectedTypeIndex = document.form1.sub_type.selectedIndex;
    var selectedType = document.form1.sub_type.options[ selectedTypeIndex ].value;

    if ( selectedType == "any" ) {
        document.form1.search_action.value = "search";
    } else {
        document.form1.search_action.value = "detail";
    }
    document.form1.submit();
}
</script>

<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
	<tr>
	<td width="100%"> 
          <h1>TAIR Search Result</h1>
	    <form name="form1" action="<%= response.encodeURL( "/servlet/Search" ) %>" method="get">
	    <input type="hidden" name="type" value="general">
	    <input type="hidden" name="search_action">

            <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#F1EFEC">

             <tr align="center">
		<td><IMG src="/images/cleargif.gif" width="20" height="1"></td>
		<td valign="middle">

		    <select name="sub_type">
		      <option value="google">Google TAIR website</option>
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
                </td>
		<td><IMG src="/images/cleargif.gif" width="20" height="1"></td>
		<td><%= HTMLFactory.createSearchMethodSelect( "method", DataConstants.SEARCH_STARTS, false ) %></td>
		<td><IMG src="/images/cleargif.gif" width="20" height="1"></td>
		<td><input type="text" name="name" size="12"></td>
                <td><img src="/images/cleargif.gif" width="20" height="1"></td>
	        <td align="left" class="sm"><input type="button" value="submit" onClick="mySubmit()"></td>
                <td><img src="/images/cleargif.gif" width="20" height="1"></td>
		<td><INPUT type="reset" name="reset" value="reset"</td>
		<td><IMG src="/images/cleargif.gif" width="20" height="1"></td>
              </tr>

	     </table>
	    </form>


            <% if ( totalCount > 0 ) { %>
                <P><B>Your query <%=" '<font color=\"red\">" + searchTerm + "</font>' "%>matched records in multiple types. Select from the list below to see selected records of that type.
            <% } else {%>
                <P><B>Your query <%=" '<font color=\"red\">" + searchTerm + "</font>' "%>matched 0 records. Please consider the following as you modify your query and try again:<br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Check the spelling.<br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Broaden your search by selecting a non-exact match search of your term from the drop-down menu. 
            <% } %>


            <blockquote>

            <% if ( results != null && !results.isEmpty() ) {
                  searchTypes = results.keySet().iterator();
                  String displayType = null;
                  while ( searchTypes.hasNext() ) {
                     type = (String) searchTypes.next();
                     typeURL = (String) results.get( type );
                     displayType = ( displayTypes.containsKey( type ) ) ? (String) displayTypes.get( type ) : type + "(s)";
   
            %>

                 <P><%= general.getTypeCount( type ) %> <a href="<%= typeURL %>"><%= displayType %></a> were found
              <% } %>
           <% } %>

            </blockquote>

         </td>
       </tr>
</TABLE>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
