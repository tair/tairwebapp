<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, org.tair.community.*" %>

<%!
String pageName = "Community";
String cssfile="/css/page/search.css";
%>

<%
boolean curator = LoginChecker.isTairCurator( request );
String select25 = ( curator ) ? "" : "selected";
String mode = request.getParameter( "mode" );
String search_what = request.getParameter ("search_what"); 
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="507" />
</jsp:include>

<!--Content-->

<form action="<%=response.encodeURL("/servlets/Search") %>" enctype="application/x-www-form-urlencoded" method="post">
    <INPUT TYPE="HIDDEN" NAME="pageNum" VALUE="1">
    <INPUT TYPE="HIDDEN" NAME="type" VALUE="community">    
    <input type="hidden" name="action" value="search">
    <input type="hidden" name="curator" value="<%= curator %>">

     <% if ( !TextConverter.isEmpty( mode ) && ( !TextConverter.isEmpty(search_what ))  ){  %>
       <input type="hidden" name="mode" value="<%= mode %>">
       <input type="hidden" name="search_what" value="<%= search_what %>">
    <% } %>
    
<span class="mainheader">TAIR Community Search</span>
    <p id="help">[<a href="/help/helppages/commsearch.jsp">Help</a>]</p>
    <p class=intro">Use this form to find People and Organizations in TAIR's Community.
    Use the input boxes and drop down menus to define your
    parameters, restrict your search and define your output options.</p>
          
          
    <p class=intro">If you would like to be added to the TAIR Community, 
    please <a href="/servlets/Community?action=edit&new=true&type=person">
    <FONT class="req">REGISTER HERE</FONT></A>.</p>
    
    <p class=intro">To order stocks from the ABRC you must be affiliated with a LAB in 
     TAIR's Community.If you are registered at TAIR and are the head of a lab 
     (i.e responsible party for billing such as PI, project leader, instructor), 
     you can <A href="/servlets/Community?action=edit&type=organization&new=true&lab=true"><FONT class="req">ADD YOUR LAB</FONT> </A> here.</p> 
    
    
    <p class=intro">To add other types of organizations (e.g. Databases, Universities, Schools, Stock Centers etc.) to the TAIR Community, 
    please go to <A href="/servlets/Community?action=edit&type=organization&new=true">
    <FONT class="req">ADD ORGANIZATION</FONT></A>.</p>
    
<div id="searchbox">
    <span class="search_buttons">
        <input type="reset" name="reset" value="Reset" onClick="resetHelper()">
        <input type="submit" name="search" value="Submit Query">
    </span>
    
    <fieldset>
    <dl>
        <dt>Search for</dt>
        <dd>
            <select name="search_type">
              <option value="any" selected>Any</option>
              <option value="person"
                <%  if ( !TextConverter.isEmpty( mode ) && mode.equals("gene_symbol")
                 && ( !TextConverter.isEmpty( search_what ) && search_what.equals("search person") ) ){ %>
                      selected 
                 <% } %>>person</option>
              <option value="organization"
                 <%  if ( !TextConverter.isEmpty( mode ) && mode.equals("gene_symbol")
                       && ( !TextConverter.isEmpty( search_what ) && search_what.equals("search lab") ) ){ %>
                      selected 
                 <% } %>
              >organization</option>
            </select>
      </dd>
      
      <dt>
        Organization type
      <dt>
      <dd>
        <%= HTMLFactory.createOrgTypeSelect( "org_type", true, "Any" ) %>
      </dd>
      
      <dt>
        Person's job title
      <dt>
      <dd>
        <%= HTMLFactory.createTitleSelect( "primary_job_title", true, "Any" ) %>
      </dd>
      
      <% if ( curator ) { %>
      
      <dt>
        Last Modified Date (mm/dd/yyyy)
      <dt>
      <dd>
         <input type="text" name="date_from" size="10" maxlength="10">
	    -
	    <input type="text" name="date_to" size="10" maxlength="10"> 
      </dd>
      
      <dt>
        Person ID
      <dt>
      <dd>
        <input type="text" name="person_id_from" size="12" maxlength="12">
	    -
	    <input type="text" name="person_id_to" size="12" maxlength="12">
      </dd>
      
      <dt>
        Organization ID
      <dt>
      <dd>
        <input type="text" name="organization_id_from" size="12" maxlength="12">
	    -
	    <input type="text" name="organization_id_to" size="12" maxlength="12">
      </dd>
      
      <dt>
        ABRC Fees Waived?
      <dt>
      <dd>
        <input type="checkbox" name="ABRC_fees_waived" value="T">
      </dd>
      
      <dt>
        Commercial Organization?
      <dt>
      <dd>
        <input type="checkbox" name="commercial" value="T">
      </dd>
      
      <dt>
        Status
      <dt>
      <dd>
        <%= HTMLFactoryWithCSS.createStatusSelect( "status", DataConstants.getActiveStatus(), true, "Any", "small_sel", ""  ) %>
	    &nbsp;&nbsp;
	    Is Obsolete? <input type="checkbox" name="is_obsolete" value="T">
      </dd>
      
      <% } %>
      
      <dt>
        Last/Organization Name
      </dt>
      <dd>
        <%= HTMLFactoryWithCSS.createSearchMethodSelect( "last_org_name_method", DataConstants.SEARCH_CONTAINS, false, "small_sel", "" ) %>
        <input type="text" name="last_org_name" size="30" maxlength="100">
      </dd>
      
      <dt>
        First Name
      </dt>
      <dd>
        <%= HTMLFactoryWithCSS.createSearchMethodSelect( "first_name_method", DataConstants.SEARCH_CONTAINS, false, "small_sel", "" ) %>
        <input type="text" name="first_name" size="30" maxlength="30">
      </dd>

      <dt>
        Email
      </dt>
      <dd>
        <%= HTMLFactoryWithCSS.createSearchMethodSelect( "email_method", DataConstants.SEARCH_CONTAINS, false, "small_sel", "" ) %>
        <input type="text" name="email" size="30" maxlength="100">
      </dd>
      
      <dt>
        City
      </dt>
      <dd>
        <%= HTMLFactoryWithCSS.createSearchMethodSelect( "city_method", DataConstants.SEARCH_CONTAINS, false, "small_sel", "" ) %>
        <input type="text" name="city" size="30" maxlength="30">
      </dd>
      
      <dt>
        State/Province (US &amp; Canada)
      </dt>
      <dd>
        <%= HTMLFactoryWithCSS.createRegionSelect( "us_state", true, "Any", "", "" ) %>
      </dd>
      
      <dt>
        State/Province (Outside US &amp; Canada)
      </dt>
      <dd>
        <input type="text" name="other_state" size="30" maxlength="30">
      </dd>
      
      <dt>
        Country
      </dt>
      <dd>
        <%= HTMLFactory.createCountrySelect( "country", true, "Any" ) %>
      </dd>
      
      <dt>
        URL
      </dt>
      <dd>
        <%= HTMLFactoryWithCSS.createSearchMethodSelect( "url_method", DataConstants.SEARCH_CONTAINS, false, "small_sel", "" ) %>
        <input type="text" name="url" size="30" maxlength="255">
      </dd>
  </dl>
</fieldset>

<fieldset>
    <legend>Output Options</legend>
    <dl>  
      <dt>
        Number of records per page
      </dt>
      <dd>
        <SELECT name="size">
               <OPTION value="25" <%= select25 %>>25</OPTION>
               <OPTION value="50">50</OPTION>
               <OPTION value="100">100</OPTION>
               <OPTION value="200">200</OPTION>

              <% if ( curator ) { %>
               <OPTION value="500" selected>500</OPTION>
              <% } %>

            </SELECT>
      </dd>
      
      <dt>
        Sort Records by 
      </dt>
      <dd>
        <select name="order_by">  
             <option value = "name" selected> Name</option>   
             <option  value="type">Type</option>
             <option value="location"> Location</option>
          <% if ( curator ) { %>
             <option value="table_id">Person/Organization id</option>
          <% } %>
             </select>
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
