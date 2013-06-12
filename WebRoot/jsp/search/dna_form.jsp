<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*" %>

<%!
String pageName = "DNA Search";
String cssfile="/css/page/search.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="501" />
</jsp:include>

<% String currentDate = TextConverter.dateToString( new java.util.Date() ); %>

<script type="text/javascript">
// keep current date in javascript world for form resetting
var currentDate = "<%= currentDate %>";

// alter menus according to output selection -- main gateway function to all updates based on search type
function updateOutput() {
      var selectedType = document.searchForm.dna_type.options[ document.searchForm.dna_type.selectedIndex ].value;

      // empty all menus so only type relevant choices show
      document.searchForm.vector_type.options.length = 0;
      document.searchForm.insert_type.options.length = 0;
      document.searchForm.clone_end_type.options.length = 0;
      document.searchForm.other_features.options.length = 0;

      if ( selectedType == "clone" ) {
          updateClone();

      } else if ( selectedType == "clone_end" ) {
          updateCloneEnd();

      } else if ( selectedType == "library" ) {
          updateLibrary();

      } else if ( selectedType == "vector" ) {
          updateVector();

      } else if ( selectedType == "pool" ) {
          updatePooledGenomic();

      } else if ( selectedType == "filter" ) { 
          updateFilter();

      } else if ( selectedType == "stock" ) {
          updateStock();

      } else if ( selectedType == "strain" ) {
          updateHostStrain();
      }
}


// alter form to match clone criteria
function updateClone() {
      var nameTypes = new Array( "clone name", "clone end name", "locus name", "gene name", "library name", "vector name", "filter name", "donor last name", "donor organization", "donor stock number", "GenBank accession", "GenBank gi", "stock description", "stock number" );
      var nameTypeValues = new Array( "clone", "clone_end", "locus", "gene", "library", "vector", "filter", "donor_person", "donor_organization", "donor_stock_number", "accession", "genbank_gi", "stock_description", "stock_number" );
      var nameSelected = new Array( 0, 10, 13 );
      updateNameTypes( nameTypes, nameTypeValues, nameSelected );
      
      populateVectorType();
      populateInsertType();
      populateCloneEndType();

      var otherFeatures = new Array( "is sequenced", "is genetic marker", "is on a map", "is ABRC stock", "is full length cDNA" );
      var otherFeaturesValues = new Array( "is_sequenced", "is_genetic_marker", "is_on_a_map", "is_abrc_stock", "is_full_length_cds" );
      updateMenu( document.searchForm.other_features, otherFeatures, otherFeaturesValues );
      
      document.searchForm.taxon.disabled = false;

      checkSortBy();

}

// alter form to match clone end criteria
function updateCloneEnd() {
      var nameTypes = new Array( "clone name", "clone end name", "locus name", "gene name", "library name", "vector name", "donor last name", "donor organization", "donor stock number", "GenBank accession", "GenBank gi", "stock description", "stock number" );
      var nameTypeValues = new Array( "clone", "clone_end", "locus", "gene", "library", "vector", "donor_person", "donor_organization", "donor_stock_number", "accession", "genbank_gi", "stock_description", "stock_number" );
      var nameSelected = new Array( 1, 0, 12 );
      updateNameTypes( nameTypes, nameTypeValues, nameSelected );
      
      populateVectorType();
      populateInsertType();
      populateCloneEndType();

      var otherFeatures = new Array( "is sequenced", "is genetic marker", "is on a map", "is ABRC stock" );
      var otherFeaturesValues = new Array( "is_sequenced", "is_genetic_marker", "is_on_a_map", "is_abrc_stock" );
      updateMenu( document.searchForm.other_features, otherFeatures, otherFeaturesValues );
      
      document.searchForm.taxon.disabled = false;

      checkSortBy();

}

// alter form to match library criteria
function updateLibrary() {
      var nameTypes = new Array( "clone name", "library name", "vector name", "filter name", "donor last name", "donor organization", "donor stock number", "stock description", "stock number" );
      var nameTypeValues = new Array( "clone", "library", "vector", "filter", "donor_person", "donor_organization", "donor_stock_number", "stock_description", "stock_number" );
      var nameSelected = new Array( 1, 2, 8 );
      updateNameTypes( nameTypes, nameTypeValues, nameSelected );

      populateVectorType();
      populateInsertType();

      var otherFeatures = new Array( "is ABRC stock" );
      var otherFeaturesValues = new Array( "is_abrc_stock" );
      updateMenu( document.searchForm.other_features, otherFeatures, otherFeaturesValues );
      
      document.searchForm.taxon.disabled = true;
      
      checkSortBy();
}

// alter form to match vector criteria
function updateVector() {

      // set value of GenBank accession to "vector accession" to differentiate searching
      // value in Vector table instead of in NTSequence like other search types
      var nameTypes = new Array( "clone name", "library name", "vector name", "donor last name", "donor organization", "donor stock number", "GenBank accession", "stock description", "stock number" );
      var nameTypeValues = new Array( "clone", "library", "vector", "donor_person", "donor_organization", "donor_stock_number", "accession", "stock_description", "stock_number" );
      var nameSelected = new Array( 2, 1, 8 );
      updateNameTypes( nameTypes, nameTypeValues, nameSelected );

      var otherFeatures = new Array( "is ABRC stock" );
      var otherFeaturesValues = new Array( "is_abrc_stock" );
      updateMenu( document.searchForm.other_features, otherFeatures, otherFeaturesValues );
      
      populateVectorType();
      populateInsertType();
      
      document.searchForm.taxon.disabled = true;

      checkSortBy();

}

// alter form to match filter
function updateFilter() {
      var nameTypes = new Array( "filter name", "donor last name", "donor organization", "donor stock number", "stock description", "stock number" );
      var nameTypeValues = new Array( "filter", "donor_person", "donor_organization", "donor_stock_number", "stock_description", "stock_number" );
      var nameSelected = new Array( 0, 1, 5 );
      updateNameTypes( nameTypes, nameTypeValues, nameSelected );

      var otherFeatures = new Array( "is ABRC stock" );
      var otherFeaturesValues = new Array( "is_abrc_stock" );
      updateMenu( document.searchForm.other_features, otherFeatures, otherFeaturesValues );
      document.searchForm.other_features.selectedIndex = 0;
      
      document.searchForm.taxon.disabled = true;

      checkSortBy();
}

// alter form to match pooled genomic dna
function updatePooledGenomic() {
      var nameTypes = new Array( "donor last name", "donor organization", "donor stock number", "stock description", "stock number" );
      var nameTypeValues = new Array( "donor_person", "donor_organization", "donor_stock_number", "stock_description", "stock_number" );
      var nameSelected = new Array( 0, 3, 4 );
      updateNameTypes( nameTypes, nameTypeValues, nameSelected );

      var otherFeatures = new Array( "is ABRC stock" );
      var otherFeaturesValues = new Array( "is_abrc_stock" );
      updateMenu( document.searchForm.other_features, otherFeatures, otherFeaturesValues );
      document.searchForm.other_features.selectedIndex = 0;
      
      document.searchForm.taxon.disabled = true;

      checkSortBy();
}

// alter form to match stocks
function updateStock() {
      var nameTypes = new Array( "donor last name", "donor organization", "donor stock number", "stock description", "stock number" );
      var nameTypeValues = new Array( "donor_person", "donor_organization", "donor_stock_number", "stock_description", "stock_number" );
      var nameSelected = new Array( 0, 3, 4 );
      updateNameTypes( nameTypes, nameTypeValues, nameSelected );

      var otherFeatures = new Array( "is ABRC stock" );
      var otherFeaturesValues = new Array( "is_abrc_stock" );
      updateMenu( document.searchForm.other_features, otherFeatures, otherFeaturesValues );
      document.searchForm.other_features.selectedIndex = 0;
      
      document.searchForm.taxon.disabled = true;

      checkSortBy();
}

// alter form to match host strains
function updateHostStrain() {
      var nameTypes = new Array( "strain name", "stock number", "donor last name", "donor organization", "donor stock number", "strain description" );
      var nameTypeValues = new Array( "strain_name", "stock_number", "donor_person", "donor_organization", "donor_stock_number", "strain_description" );
      var nameSelected = new Array( 0, 1, 2 );
      updateNameTypes( nameTypes, nameTypeValues, nameSelected );

      var otherFeatures = new Array( "is ABRC stock" );
      var otherFeaturesValues = new Array( "is_abrc_stock" );
      updateMenu( document.searchForm.other_features, otherFeatures, otherFeaturesValues );
      
      document.searchForm.taxon.disabled = true;

      checkSortBy();
}


// utility function to update all 3 name type menus at one shot
function updateNameTypes( nameTypes, nameTypeValues, nameSelected ) {
      updateMenu( document.searchForm.type_1, nameTypes, nameTypeValues );
      eval( "document.searchForm.type_1.selectedIndex = " + nameSelected[ 0 ] );

      updateMenu( document.searchForm.type_2, nameTypes, nameTypeValues );
      eval( "document.searchForm.type_2.selectedIndex = " + nameSelected[ 1 ] );

      updateMenu( document.searchForm.type_3, nameTypes, nameTypeValues );
      eval( "document.searchForm.type_3.selectedIndex = " + nameSelected[ 2 ] );
}


// populate sort by menu
function updateSortBy( optionsList ) {
      updateMenu( document.searchForm.order, optionsList, optionsList );
      document.searchForm.order.selectedIndex = 0;
}


// populate vector_type menu
function populateVectorType() {
      var vectorType = new Array( 9 );
      vectorType[ 0 ] = "Any";
      vectorType[ 1 ] = "All BACS (BAC,TAC,P1,BiBAC)";
      vectorType[ 2 ] = "BAC (incl. BiBAC)";
      vectorType[ 3 ] = "TAC";
      vectorType[ 4 ] = "P1";
      vectorType[ 5 ] = "YAC";
      vectorType[ 6 ] = "plasmid";
      vectorType[ 7 ] = "cosmid";
      vectorType[ 8 ] = "lambda";

      var vectorValues = new Array( 9 );
      vectorValues[ 0 ] = "any";
      vectorValues[ 1 ] = "BAC_ALL";
      vectorValues[ 2 ] = "BAC";
      vectorValues[ 3 ] = "TAC";
      vectorValues[ 4 ] = "P1";
      vectorValues[ 5 ] = "YAC";
      vectorValues[ 6 ] = "plasmid";
      vectorValues[ 7 ] = "cosmid";
      vectorValues[ 8 ] = "lambda";

      updateMenu( document.searchForm.vector_type, vectorType, vectorValues );
      document.searchForm.vector_type.selectedIndex = 0;
}

// populate insert_type menu
function populateInsertType() {
      var insertType = new Array( 5 );
      var insertValues = new Array( 5 );

      insertType[ 0 ] = "Any";
      insertType[ 1 ] = "cDNA";
      insertType[ 2 ] = "construct";
      insertType[ 3 ] = "genomic";
      insertType[ 4 ] = "inverted repeat";
      insertType[ 5 ] = "T-DNA";
      insertType[ 6 ] = "transposon";
      insertType[ 7 ] = "transposase";
      insertType[ 8 ] = "unknown";


      insertValues[ 0 ] = "any";
      insertValues[ 1 ] = "cDNA";
      insertValues[ 2 ] = "construct";
      insertValues[ 3 ] = "genomic";
      insertValues[ 4 ] = "inverted_repeat";
      insertValues[ 5 ] = "t_dna";
      insertValues[ 6 ] = "transposon";
      insertValues[ 7 ] = "transposase";
      insertValues[ 8 ] = "unknown";

      updateMenu( document.searchForm.insert_type, insertType, insertValues );
      document.searchForm.insert_type.selectedIndex = 0;
}

function populateCloneEndType() {
      var cloneEndType = new Array( 4 );
      var cloneEndValues = new Array( 4 );
      
      cloneEndType[ 0 ] = "Any";
      cloneEndType[ 1 ] = "EST";
      cloneEndType[ 2 ] = "BAC end";
      cloneEndType[ 3 ] = "YAC end";

      cloneEndValues[ 0 ] = "any";
      cloneEndValues[ 1 ] = "EST";
      cloneEndValues[ 2 ] = "BAC_end";
      cloneEndValues[ 3 ] = "YAC_end";
      updateMenu( document.searchForm.clone_end_type, cloneEndType, cloneEndValues );
      document.searchForm.clone_end_type.selectedIndex = 0;
}

// check sort by box & populate w/relevant options based on dna type
function checkSortBy() {
      var selectedType = document.searchForm.dna_type.options[ document.searchForm.dna_type.selectedIndex ].value;
      var addPosition = false;
      var addType = false;

    // add sort by position only if selected type allows it
    if ( selectedType == "clone" || selectedType == "clone_end" ) {
         addPosition = true;
    } else {
         // make sure map type & chromosome no longer selected if selected type doesn't allow searching by position
         var selectedOrder = document.searchForm.order.options[ document.searchForm.order.selectedIndex ].value;
         if ( selectedOrder == "position" ) {
              for ( i = 0; i < document.searchForm.map_type.length; i++ ) {
                  document.searchForm.map_type[ i ].checked = false;
              }

              for ( i = 0; i < document.searchForm.chromosome.length; i++ ) {
                  document.searchForm.chromosome[ i ].checked = false;
              }

         }
    }

    // only show type option if relevant
    if ( selectedType == "clone" ||
         selectedType == "clone_end" ||
         selectedType == "vector" ||
         selectedType == "stock" ) {
       addType = true;
    }

    var sortBy;
    if ( addType == true && addPosition == true ) {
       sortBy = new Array( "name", "type", "position" );
    } else if ( addType == true ) {
       sortBy = new Array( "name", "type" );
    } else {
       sortBy = new Array( "name" );
    }

    updateSortBy( sortBy );

}


// generic function to make any/other options mutually exclusive in submitted
// select menu. Return new value to set for flag that tracks "any" option's status for each menu
function checkAny( selectMenu, anyFlag ) {
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


var vectorAnyChecked = true;
function checkVectorAny() {
      var selectMenu = document.searchForm.vector_type;
      vectorAnyChecked = checkAny( selectMenu, vectorAnyChecked );
}


var insertAnyChecked = true;
function checkInsertAny() {
      var selectMenu = document.searchForm.insert_type;
      insertAnyChecked = checkAny( selectMenu, insertAnyChecked );
}

var clone_endAnyChecked = true;
function checkCloneEndAny() {
      var selectMenu = document.searchForm.clone_end_type;
      clone_endAnyChecked = checkAny( selectMenu, clone_endAnyChecked );
}


// reset form to initial values - manually reset all controls since we can't rely on HTML reset button
function resetHelper() {
    document.searchForm.low_unit.options.length = 0;
    document.searchForm.low_unit.options[0] = new Option("none", "unit" );

    document.searchForm.high_unit.options.length = 0;
    document.searchForm.high_unit.options[0] = new Option("none", "unit" );

    for ( i = 0; i < document.searchForm.map_type.length; i++ ) {
        document.searchForm.map_type[ i ].checked = false;
    }

    for ( i = 0; i < document.searchForm.chromosome.length; i++ ) {
        document.searchForm.chromosome[ i ].checked = false;
    }

    document.searchForm.dna_type.selectedIndex = 0; // make sure clone is reset as chosen type
    updateClone(); // reset form to clone values - initial version, & includes all options

    // blank out all text fields...
    document.searchForm.term_1.value = "";
    document.searchForm.term_2.value = "";
    document.searchForm.term_3.value = "";
    document.searchForm.restrict_date_from.value = "";
    document.searchForm.restrict_date_to.value = currentDate;
    document.searchForm.low_range.value = "";
    document.searchForm.high_range.value = "";
    document.searchForm.range_type.selectedIndex = 0;
}


</script>
<script type="text/javascript" src="/js/map.js"></script>

<span class="mainheader">TAIR DNA Search</span>
<p id="help">[ <a href="/help/helppages/dnasearch.jsp">Help</a> ]</p>
     <p class="intro">This page allows you to search for any DNA, which includes Clones, 
 Libraries, Genomic DNA, and Filters. Many of these objects are available as 
 DNA stocks from ABRC. <br>DNA may be searched: by name, features and/or location. 
 Submitting the form with no search criteria will return ALL items of the selected 
 type in the database without restriction.
     </p>

<form name="searchForm" method="get" action=<%=response.encodeURL("/servlet/Search")%> id="searchForm">
<input type="hidden" name="type" value="dna">       
<input type="hidden" name="action" value="search">
<input type="hidden" name="pageNum" value="1">
   <div id="searchbox">
        <span class="search_buttons">
  	  <input type="reset" name="reset" value="Reset" onClick="resetHelper()" />
          <input type="submit" name="search" value="Submit Query" />
        </span>

	<fieldset>
	<legend>Search for</legend>
	  <dl>
		<dt>
		   <select name="dna_type" onChange="updateOutput()">
                                <option value="clone" selected >clone</OPTION>
                                <option value="clone_end">clone end</OPTION>
                                <option value="library">library</OPTION>
                                <option value="vector">vector</OPTION>
                                <option value="pool">pooled genomic DNA</OPTION>
                                <option value="filter">filter</OPTION>
                                <option value="stock">stock</OPTION>
                                <option value="strain">host strain</OPTION>
                   </select>
		</dt>	
	  </dl>	
	</fieldset>
	<fieldset>
	<legend>Search by<a href="/help/helppages/dnasearch.jsp#search1" class="img_link" onclick="popwin(this.href); return false;">
          <img src="/i/icon_help.gif" alt="help" /></a></legend>
	  <dl>
		
        <dt>
            <label>Species:</label>
        </dt>
        <dd>
        <%= HTMLFactory.createCloneTaxonSelect("taxon", null, true) %>
        </dd>
        
        <dt>
       			<SELECT name="type_1" class="medium_sel">
        		   <OPTION value="clone" selected>clone name</OPTION>
        		   <OPTION value="clone_end">clone end name</OPTION>
        		   <OPTION value="locus">locus name</OPTION>
        		   <OPTION value="gene">gene name</OPTION>
        		   <OPTION value="library">library name</OPTION>
        	           <OPTION value="vector">vector name</OPTION>
        	           <OPTION value="filter">filter name</OPTION>
        	           <OPTION value="donor_person">donor last name</OPTION>
        	           <OPTION value="donor_organization">donor organization</OPTION>
                           <OPTION value="donor_stock_number">donor stock number</OPTION>
        	           <OPTION value="accession">GenBank accession</OPTION>
        	           <OPTION value="genbank_gi">GenBank gi</OPTION>
        	           <OPTION value="stock_description">stock description</OPTION>
        	           <OPTION value="stock_number">stock number</OPTION>
      			</SELECT>
		</dt>
		<dd>
		        <select name="method_1" class="small_sel">
			   <option value="1" >contains</option>
			   <option value="2" selected>starts with</option>
			   <option value="3" >ends with</option>
			   <option value="4" >exactly</option>
			</select>
                         <input type="text" name="term_1" class="box" /> and
		</dd>
		<dt>
       			<SELECT name="type_2" class="medium_sel">
        		   <OPTION value="clone" >clone name</OPTION>
        		   <OPTION value="clone_end">clone end name</OPTION>
        		   <OPTION value="locus">locus name</OPTION>
        		   <OPTION value="gene">gene name</OPTION>
        		   <OPTION value="library">library name</OPTION>
        	           <OPTION value="vector">vector name</OPTION>
        	           <OPTION value="filter">filter name</OPTION>
        	           <OPTION value="donor_person">donor last name</OPTION>
        	           <OPTION value="donor_organization">donor organization</OPTION>
                           <OPTION value="donor_stock_number">donor stock number</OPTION>
        	           <OPTION value="accession" selected>GenBank accession</OPTION>
        	           <OPTION value="genbank_gi">GenBank gi</OPTION>
        	           <OPTION value="stock_description">stock description</OPTION>
        	           <OPTION value="stock_number">stock number</OPTION>
      			</SELECT>
		</dt>
		<dd>
                        <select name="method_2" class="small_sel">
                           <option value="1" >contains</option>
                           <option value="2" selected>starts with</option>
                           <option value="3" >ends with</option>
                           <option value="4" >exactly</option>
                        </select>
			<input type="text" name="term_2" class="box" /> and
		</dd>
		<dt>
			<SELECT name="type_3" class="medium_sel">
        		   <OPTION value="clone">clone name</OPTION>
        		   <OPTION value="clone_end">clone end name</OPTION>
        		   <OPTION value="locus">locus name</OPTION>
        		   <OPTION value="gene">gene name</OPTION>
        		   <OPTION value="library">library name</OPTION>
        	           <OPTION value="vector">vector name</OPTION>
        	           <OPTION value="filter">filter name</OPTION>
        	           <OPTION value="donor_person">donor last name</OPTION>
        	           <OPTION value="donor_organization">donor organization</OPTION>
                           <OPTION value="donor_stock_number">donor stock number</OPTION>
        	           <OPTION value="accession">GenBank accession</OPTION>
        	           <OPTION value="genbank_gi">GenBank gi</OPTION>
        	           <OPTION value="stock_description">stock description</OPTION>
        	           <OPTION value="stock_number" selected>stock number</OPTION>
      			</SELECT>
		</dt>
		<dd>
			<select name="method_3" class="small_sel">
                           <option value="1" >contains</option>
                           <option value="2" selected>starts with</option>
                           <option value="3" >ends with</option>
                           <option value="4" >exactly</option>
                        </select>
                        <input type="text" name="term_3" class="box" />
		</dd>
	  </dl>
	</fieldset>
	<div id="results">
	<fieldset>
	<legend>Restrict by Features <a href="/help/helppages/dnasearch.jsp#features" class="img_link" onclick="popwin(this.href); return false;">
                        <img src="/i/icon_help.gif" alt="help" /></a></legend>
		<dl>
                    <dt>
                    <label for="vector_type">Vector Type <a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(101285);"><img src='/images/questionmark.gif' width='12' height='12' border='0' alt='(?)'></a></label> 
                    <br />(allows multiple selection)
                    </dt>
                    <dd>
		          <select name="vector_type" size="10" multiple onChange="checkVectorAny()">
                            <option value="any" selected>Any</option>
                            <option value="BAC_ALL">All BACs (BAC,TAC,P1,BiBAC)</option>

                            <option value="BAC">BAC (incl. BiBAC)</option>
                            <option value="TAC">TAC</option>
                            <option value="P1">P1</option>
                            <option value="YAC">YAC</option>
                            <option value="plasmid">plasmid</option>
                            <option value="cosmid">cosmid</option>

                            <option value="lambda">lambda</option>
                          </select>
                    </dd>
                    <dt>
                        <label for="insert_type">Insert Type <a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(268);"><img src='/images/questionmark.gif' width='12' height='12' border='0' alt='(?)'></a></label>
                        <br />(allows multiple selection)
                    </dt>
		    <dd>
                          <select name="insert_type" size="10" multiple onChange="checkInsertAny()">

                            <option value="any" selected>Any</option>
                            <option value="cDNA">cDNA</option>
                            <option value="construct">construct</option>
                            <option value="genomic">genomic</option>
                            <option value="inverted_repeat">inverted repeat</option>
                            <option value="t_dna">T-DNA</option>

                            <option value="transposon">transposon</option>
                            <option value="transposase">transposase</option>
                            <option value="unknown">unknown</option>

                          </select>
		    </dd>
		    <dt>
                <label for="clone_end_type">Clone End Type <a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(319);"><img src='/images/questionmark.gif' width='12' height='12' border='0' alt='(?)'></a></label>
                <br />(allows multiple selection)
		    </dt>
		    <dd>
                        <select name="clone_end_type" size="4" multiple onChange="checkCloneEndAny()">
                            <option value="any" selected>Any</option>
                            <option value="EST">EST</option>
                            <option value="BAC_end">BAC end</option>
                            <option value="YAC_end">YAC end</option>

                          </select>
		    </dd>
		    <dt>
                <label for="other_features">Other Features<a href="/help/helppages/dnasearch.jsp#other_features" class="img_link" onclick="popwin(this.href); return false;">
                <img src="/i/icon_help.gif" alt="help" /></a></label>
                <br />(allows multiple selection)
		    </dt>
		    <dd>
                          <select name="other_features" size="5" multiple>
                            <option value="is_sequenced">is sequenced</option>

                            <option value="is_genetic_marker">is genetic marker</option>
                            <option value="is_on_a_map">is on a map</option>
                            <option value="is_abrc_stock">is ABRC stock</option>
                            <option value="is_full_length_cds">is full length cDNA</option>
                          </select>
		    </dd>
                  </dl>
	</fieldset>

	<fieldset>
	<legend>Restrict by Map Locations <a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(500101750);"><img src='/images/questionmark.gif' width='12' height='12' border='0' alt='(?)'></a></legend>
	<dl>

		  <dt>
		  <label for="chromosome">Chromosome
<a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(536);"><img src='/images/questionmark.gif' width='12' height='12' border='0' alt='(?)'></a></label>
		  </dt>
		  <dd>
			<select name="chromosome" id="chromosome">
		 		<option value="" selected="selected">select</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="C">chloroplast genome</option>
				<option value="M">mitochondrial genome</option>
			</select>

		  </dd>
						
		  <dt>
	  	  <label for="map_type">Map Type<a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(667);"><img src='/images/questionmark.gif' width='12' height='12' border='0' alt='(?)'></a></label>
		  </dt>
		  <dd>
			<select name="map_type" id="map_type" onchange="updateUnits(this.options[this.selectedIndex].value)">
				<option value="" selected="selected">select</option>
				<option value="physical">Physical</option>
				<option value="AGI">AGI</option>
			</select>
		  </dd>
		  <dt>
		  <label for="range_type">Range
<a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(500101751);"><img src='/images/questionmark.gif' width='12' height='12' border='0' alt='(?)'></a></label>				
		  </dt>
                  <dd>
			<select name="range_type" onchange="checkRange()" class="small_sel">

				<option value="between" selected="selected">between</option>
				<option value="around">around</option>
			</select>

			<input type="text" name="low_range" maxlength="30" class="tiny_sel" />
							
			<select size="1" name="low_unit" class="small_sel">
				<option selected="selected">none</option>
			</select>

			and
							
			<input type="text" name="high_range" id="high_range" maxlength="30" class="tiny_sel" />
							
			<select size="1" name="high_unit" class="small_sel">
				<option selected="selected">none</option>
			</select>
		  </dd>
		</dl>
	</fieldset>
	</div>
	<fieldset>
		  <legend>Output Options<a href="/help/helppages/dnasearch.jsp" class="img_link" onclick="popwin(this.href); return false;"><img src="/i/icon_help.gif" alt="help" /></a></legend>
		<dl>
		  <dt>
		  <label for="">Number of records per page</label>
		  </dt>
		  <dd>

			<select name="size">
				<option value="25" selected="selected">25</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
		  </dd>

						
		  <dt>
		  <label for="map_type">Sort records by</label>
		  </dt>
		  <dd>
			<select name="order" onchange="checkPosition()">
				<option value="name" selected="selected">name</option>
				<option value="position">position</option>

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
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
