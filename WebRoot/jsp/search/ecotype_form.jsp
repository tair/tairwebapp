<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, java.util.*" %>

<%!
String pageName = "Ecotype (Natural Variant) Search";
String cssfile="/css/page/search.css";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="502" />

</jsp:include>

<script language="javascript">
<!--

// check selected range method for menu group with baseName
// if "between" is not selected, clear all options from 
// "to" menu since only one year value required for "before"
// or "after" searches
function updateRangeMethod( baseName ) {
      var methodMenu = eval( "document.searchForm." + baseName + "_method" );
      var fromMenu = eval( "document.searchForm." + baseName + "_from" );
      var toMenu = eval( "document.searchForm." + baseName + "_to" );

      var selectedMethod = methodMenu.options[ methodMenu.selectedIndex ].value;

      toMenu.options.length = 0;
      if ( selectedMethod == "between" ) {
          createYearMenu( toMenu )
      } else {
        toMenu.options[ 0 ] = new Option( "-unused-", "" );
      }

}

//-->
</script>

<!-- Content -->

<span class="mainheader">Ecotype (Natural Variant) Search</span> 
    <p id="help">[<a href="/help/helppages/ecosearch.jsp">Help</a>]</p>
    <p class="intro">This page allows you to identify natural variants of Arabidopsis and
    closely related species using various parameters.</p>
    
    <form name="searchForm" method="post" action="/servlets/Search">
      <input type="hidden" name="type" value="ecotype">
      <input type="hidden" name="search_action" value="search">
      <input type="hidden" name="pageNum" value="1">
      
      <div id="searchbox">
        <span class="search_buttons">
          <input type="reset" name="reset" value="Reset">
          <input type="submit" name="search" value="Submit query">
        </span>
      <fieldset>
        <legend>Search by Name</legend>
        <dl>
            <dt>
                <label>Species:</label>
            </dt>
            <dd>
             <%= HTMLFactory.createSpeciesVariantTaxonSelect( "taxon", "1", false ) %>
            </dd>
            <dt>
               <select name="name_type_1" class="large_sel">
		    <option value="donor_person">donor last name (e.g. Kranz)</option>
                    <option value="donor_organization">donor organization (e.g. Syngenta)</option>
		    <option value="ecotype_abbrev" selected>ecotype abbrev. name (e.g. Col)</option>
		    <option value="ecotype_full">ecotype full name (e.g. Columbia)</option>
		    <option value="germplasm_description">description (e.g. serrated)</option>
		    <option value="stock_number">stock number (e.g. CS1092)</option>
		    <option value="donor_stock_number">donor stock number</option>
		  </select> 
          </dt>
          <dd>
            <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method_1", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
            <input type="text" name="name_1" size="28" maxlength="62"> and
          </dd>
          
          <dt>
             <select name="name_type_2" class="large_sel">
		    <option value="donor_person">donor last name (e.g. Kranz)</option>
                    <option value="donor_organization">donor organization (e.g. Syngenta)</option>
		    <option value="ecotype_abbrev">ecotype abbrev. name (e.g. Col)</option>
		    <option value="ecotype_full" selected>ecotype full name (e.g. Columbia)</option>
		    <option value="germplasm_description">description (e.g. serrated)</option>
		    <option value="stock_number">stock number (e.g. CS1092)</option>
		    <option value="donor_stock_number">donor stock number</option>
		  </select>
          </dt>
          
          <dd>
            <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method_2", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
            <input type="text" name="name_2" size="28" maxlength="62"> and
          </dd>
          
          
          
          <dt>
            <select name="name_type_3" class="large_sel">
		    <option value="donor_person" selected>donor last name (e.g. Kranz)</option>
                    <option value="donor_organization">donor organization (e.g. Syngenta)</option>
		    <option value="ecotype_abbrev">ecotype abbrev. name (e.g. Col)</option>
		    <option value="ecotype_full">ecotype full name (e.g. Columbia)</option>
		    <option value="germplasm_description">description (e.g. serrated)</option>
		    <option value="stock_number">stock number (e.g. CS1092)</option>
		    <option value="donor_stock_number">donor stock number</option>
		  </select>
          </dt>
          <dd>
            <!--<%= HTMLFactory.createSearchMethodSelect( "method_3", DataConstants.SEARCH_STARTS, false ) %> -->
            <select name="method_3" class="small_sel">
               <option value="1" >contains</option>
               <option value="2" selected>starts with</option>
               <option value="3" >ends with</option>
               <option value="4" >exactly</option>
           </select>
            <input type="text" name="name_3" size="28" maxlength="62"> and
          </dd>
          <dt>
            <label for="is_abrc_stock">is ABRC stock</label>
          </dt> 
          <dd>
            <input type="checkbox" name="is_abrc_stock" value="true">
          </dd>
      </dl>
      </fieldset>
      
      <fieldset>
      <legend>Restrict by Collection Details</legend>
      <dl>
        <dt>
            <label>Country of Collection</label>
        </dt>
        <dd>
            <%= HTMLFactory.createSpeciesVariantCountrySelect( "country", "", true ) %>
        </dd>
        <dt>
            <label>Location/City/Region</label>
        </dt>
        <dd>
            <%= HTMLFactory.createSearchMethodSelect( "location_method", DataConstants.SEARCH_STARTS, false ) %>
            <input type="text" name="location" size="12" maxlength="62">
        </dd>
        <dt>
            <label>Habitat (eg. sandy ground) </label>
        </dt>
        <dd>
            <%= HTMLFactory.createSearchMethodSelect( "habitat_method", DataConstants.SEARCH_STARTS, false ) %>
            <input type="text" name="habitat" size="12" maxlength="62">
        </dd>
    </dl>
    </fieldset>
    
    <fieldset>
    <legend>Output Options</legend>
    <dl>
        <dt>
            <label for="">number of records/page </label>
        </dt>
        <dd>
            <select name="size">
		    <option value="25" selected>25</option>
		    <option value="50">50</option>
		    <option value="100">100</option>
		    <option value="200">200</option>
		  </select>
        </dd>
        <dt>
            <label for="map_type">sort records by</label>
        </dt>
        <dd>
            <select name="order">
		    <option value="name" selected>ecotype full name</option>
		    <option value="country">country</option>
            <option value="location">location</option>
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
