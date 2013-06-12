<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%!
String pageName = "Microarray Experiments Search";
String cssfile="/css/page/search.css";
%>

<%@ page import="org.tair.utilities.*" %>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="513" />
</jsp:include>

<script language="javascript">
<!--

// generic function to make any/other options mutually exclusive in submitted
// select menu. Return new value to set for flag that tracks "any" option's status for each menu
function checkSelectAny( selectMenu, anyFlag ) {
      // if another option was just selected, make sure "any" is no longer selected
      if ( anyFlag == true  ) {
          selectMenu.options[ 0 ].selected = false;
          anyFlag = false;

      // if any flag isn't set, check if "any" option is now selected.  if so,
      // make sure all other options are no longer selected 
      } else {
         if ( selectMenu.options[ 0 ].selected == true ) {
              for ( i = 1; i < selectMenu.length; i++ ) {
                 selectMenu.options[ i ].selected = false;
              }
              anyFlag = true;
          }
      }

      return anyFlag;
}



var categoryAnyChecked = true;
function checkCategoryAny() {
      var selectMenu = document.searchForm.experiment_category;
      categoryAnyChecked = checkSelectAny( selectMenu, categoryAnyChecked );
}

// -->
</script>

<!-- Content -->

<span class="mainheader">TAIR Microarray Experiments Search</span> 
<p id="help">[<a href="/help/helppages/exper_search.jsp">Help</a>]</p>

<p class=intro>
This page allows you to search microarray experiments by name,
description, experimenter's last name, array manufacturer and keywords. To
see all available experiments leave blank all the boxes and click "submit
query"</p>

<p class=intro><b>
Please note that TAIR stopped accepting new microarray data submissions in June 2005. 
Newer and more comprehensive microarray data sets are available at <a href="http://www.ncbi.nlm.nih.gov/geo/">GEO</a>, <a href="http://www.ebi.ac.uk/arrayexpress/ ">ArrayExpress</a> 
and <a href="http://affymetrix.arabidopsis.info/narrays/experimentbrowse.pl">NASCArrays</a>.</b></p>

<form method="get" action="<%= response.encodeURL( "/servlets/Search" ) %>" name="searchForm">
    <p>    
        <input type="hidden" name="type" value="expr">
        <input type="hidden" name="search_action" value="search">
        <input type="hidden" name="pageNum" value="1">
    </p>
    
    <div id="searchbox">
        <span class="search_buttons">
            <input type="reset" name="reset" value="reset" onClick="resetHelper()">
            <input type="submit" name="search" value="submit query">
        </span>
        
        <fieldset>
            <legend>Search by Name, Description, Authors and/or Organization</legend>
            <dl>
                <dt>
                    <select name="name_type_1" class="large_sel">
                      <option value="name" selected>Experiment name (e.g. cell death)</option>
                      <option value="experimenter">Author's last name (e.g. Berleth)</option> 
                      <option value="description">Description (e.g. mutant)</option>
                      <option value="submission_number">Submission Number (e.g. ME00317)</option>
                      <option value="organization">Organization (e.g. AtGenExpress)</option> 
                    </select>
                <dt>
                
                <dd>
                    <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method_1", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
                    <input type="text" name="term_1" size="12" maxlength="60">and
                </dd>
                
                <dt>
                    <select name="name_type_2" class="large_sel">
                      <option value="name">Experiment name (e.g. cell death)</option>
                      <option value="experimenter" selected>Author's last name (e.g. Berleth)  </option> 
                      <option value="description">Description (e.g. mutant)</option>
                      <option value="submission_number">Submission Number (e.g. ME00317)</option>
                      <option value="organization">Organization (e.g. AtGenExpress)</option> 
                    </select>
                <dt>
                
                <dd>
                    <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method_2", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
                    <input type="text" name="term_2" size="12" maxlength="60">and
                </dd>
                <dt>
                    <select name="name_type_3" class="large_sel">
                      <option value="name">Experiment name (e.g. cell death)</option>
                      <option value="experimenter">Author's last name (e.g. Berleth)</option> 
                      <option value="description" selected>Description (e.g. mutant)</option>
                      <option value="submission_number">Submission Number (e.g.ME00317)</option>
                      <option value="organization">Organization (e.g. AtGenExpress)</option> 
                    </select>
                </dt>
                
                <dd>
                    <%= HTMLFactoryWithCSS.createSearchMethodSelect( "method_3", DataConstants.SEARCH_CONTAINS, false, "small_sel", "" ) %>
                    <input type="text" name="term_3" size="12" maxlength="60">                    
                </dd>
            </dl>
            </fieldset>
            <fieldset>
                <legend>Search by Array Manufacturer</legend>
                    <dl>    
                        <dt>Name</dt>
                        <dd>
                           <select name="array_name">
                              <option value="any" selected>any
                              <option value="AFGC">AFGC
                              <option value="Affymetrix">Affymetrix
                              <option value="Carnegie">Carnegie   
                            </select> 
                        </dd>
                    <dl>
            </fieldset>
            
            <div id="results">
            <fieldset>
                <legend>Search by Keywords</legend>
                    <dl>
                        <dt>
                        Experiment Goals<%=DefinitionsLookup.createPopupLink("RelationshipType","experimental_goal")%>
                        </dt>
                        <dd>
                            <%= HTMLFactoryWithCSS.createSearchMethodSelect( "goal_method", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
                            <input type="text" name="experiment_goal" size="12" maxlength="60"> (e.g. aging; defense response)
                        </dd>
                    
                        <dt>
                            Experimental Variables<%=DefinitionsLookup.createPopupLink("RelationshipType","experimental_factor")%>
                        </dt>
                        <dd>
                            <%= HTMLFactoryWithCSS.createSearchMethodSelect( "factor_method", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
                            <input type="text" name="experimental_factor" size="12" maxlength="60"> (e.g. light)
                        </dd>
                        
                        <dt>
                            Plant Tissue<%=DefinitionsLookup.createPopupLink("Glossary","plant_tissue")%>
                        </dt>
                        <dd>
                            <%= HTMLFactoryWithCSS.createSearchMethodSelect( "bio_sample_method", DataConstants.SEARCH_STARTS, false, "small_sel", "" ) %>
                            <input type="text" name="bio_sample" size="12" maxlength="60"> (e.g. leaf; root)
                        </dd>
                        
                        <dt>
                            Experiment Category<%=DefinitionsLookup.createPopupLink("RelationshipType","experiment_category")%><br />
                            (allows multiple selection)
                            </dt>
                        <dd>
                            <%= HTMLFactory.createExperimentCategorySelect( "experiment_category", "Any","onChange=\"checkCategoryAny()\"" ) %>
                        </dd>
                    </dl>
            </fieldset>
            </div>
            <fieldset>
                <legend>Output Options</legend>
                <dl>
                    <dt>
                        number of records/page
                    </dt>
                    <dd>
                        <select name="size">
                          <option value="25" selected>25
                          <option value="50">50
                          <option value="100">100    
                          <option value="200">200
                        </select>
                    </dd>
                        
                    <dt>
                        sort records by
                    <dt>
                    <dd>
                        <select name="order">
                          <option value="name" selected>experiment name</option>
                          <option value="experimenter">experimenter's last name</option>
                          <option value="category">experiment category</option>
                          <option value="goal">experiment goals</option>
                          <option value="factor">experiment variables</option>
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
                    
                  
                    
                
            


