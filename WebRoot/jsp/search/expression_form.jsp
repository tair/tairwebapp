<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.utilities.*, java.util.*, org.tair.search.*"
%>
<%!
String pageName = "TAIR: Expression Search";
String cssfile="/css/page/search.css";

// 
// The expression search form relies heavily on the org.tair.search.ExpressionFormHelper
// class to do its rendering.  The search form is complicated because it relies
// heavily on javascripting, but also because it tries to emulate a "show/hide"
// mechanism with the different sections of the form.  Since this behavior is
// difficult to write and maintain using javascript and CSS, it is emulated by
// submitting the form every time the user opts to show or hide a section. The
// form is then re-rendered with the values user previously filled in and with
// the requested section now hidden or revealed.  
//
// ExpressionSearchFormHelper mainly helps with the rendering of form elements
// following a reload; it dynamically populates elements with the proper options
// and displays any previously entered input in the proper fields.  The helper
// class also needs to interact with javascript functions defined in the page
// by populating dynamic variables (such as whether a section is displaying
// or not, and also by centralizing the literal values used in many of the
// select menus of the form.
//
// So...is this easier than using javascript and CSS??? Let me know - NM
//
//
//



//
// Utility method to write body of javascript function that just
// return arrays of literal values to use when dynamically populating
// select menus. These literal values all ultimately are defined 
// in ExpressionSearchFormHelper; this method can be used in combination
// with the values from the helper to get the values into javascript
// world, and also has the bonus of easily generating multiple js 
// functions that are essentially the same.
//
public String writeJavaScriptOptions( String[] menuValues ) {
    StringBuffer buffer = new StringBuffer();

    // write javascript to allocate new array of values

    buffer.append( "var values = new Array( " + menuValues.length + ");\n" );


    // loop through values and write javascript assignment statement to
    // set element of array equal to the string literal value

    for ( int i = 0; i < menuValues.length; i++ ) {
        buffer.append( "    values[ " + i + " ] = \"" + menuValues[ i ] + "\";\n" );
    }

    // write function return statments
    buffer.append( "\n" );
    buffer.append( "    return values;" );

    return buffer.toString();
}


%>

<%
// create form helper class for use in populating form below 
// pass in reference to request for retrieving search params 
// entered on previous page view
ExpressionSearchFormHelper helper = new ExpressionSearchFormHelper( request );
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="506" />
</jsp:include>


<!-- javascript to handle collapsing & expanding of form sections and
     dynamic population of menus based on array type selection -->

<script type="text/javascript">

var showExpression = true
var showExperiment = true


//
// Set hidden parameter in form that controls show/hide value of
// section.  Automatically set value to boolean opposite value
// of current value. Submit form to servlet to get new page
// view.
//
// Change search_action to "update_display" to differentiate between
// request to search and this type of request.  update_display will
// cause all params to be retrieved and stored in user's session
// so we can preserve params between requests
//
function toggleSection( section ) {

   // make sure that search by list option is selected if 
   // a file name has been entered
    if ( document.expressionSearch.input[ 0 ].checked && 
         !isblank( document.expressionSearch.file ) ) {
        alert( "Search Using List must be selected if uploading file" );

    } else {
        if ( section == "expression" ) {
           document.expressionSearch.showExpression.value = !showExpression;

        } else if ( section == "experiment" ) {
            document.expressionSearch.showExperiment.value = !showExperiment;

        }

        document.expressionSearch.search_action.value="update_display";
        document.expressionSearch.submit();
    }

}


//
// Update contents of ArrayDesign menu to only show options relevant
// to selected array type.  Activate or deactivate elements in Expression
// values section according to array type as well as whether section is
// currently being displayed or not.
//
function updateArrayDesign( arrayTypeMenu ) {
    var selectedArrayType = arrayTypeMenu.options[ arrayTypeMenu.selectedIndex ].value;

    var optionsList;

    // get list of menu options for selected type; enable associated
    // expression fields and disable fields no longer applicable

    if ( selectedArrayType == "single_channel" ) {
        optionsList = getSingleChannelArrayDesignOptions();
	enableSingleChannelFields( showExpression );
        disableDualChannelFields( showExpression );

    } else {
        optionsList = getDualChannelArrayDesignOptions();
	enableDualChannelFields( showExpression );
        disableSingleChannelFields( showExpression );
    }  

    // populate array design menu with relevant options for array type
    var arrayDesignMenu = document.expressionSearch.design; 
    populateSelectMenu( arrayDesignMenu, optionsList, optionsList );

}

// 
// Generic function to dynamically populate a select menu with 
// submitted option values and display values
//
function populateSelectMenu( selectMenu, values, displays ) {
    selectMenu.options.length = 0;	
    for ( i = 0; i < values.length; i++ ) {
       selectMenu.options[ i ] = new Option( displays[ i ], values[ i ] );
    }
}


//	    
// Populate single channel expression menus if Expression section of
// form is being displayed.  This function will be called when user has
// selected to search single channel experiments and will be accompanied by
// a call to disable the dual channel menus
//
function enableSingleChannelFields( showExpression ) {
    // only need to populate fields if section is displaying
    if ( showExpression ) {

        var detectionMenu = document.expressionSearch.detection;
        populateSelectMenu( detectionMenu, getDetectionValues(), getDetectionDisplays() );

	document.expressionSearch.signal_min.value = "0";
        document.expressionSearch.signal_max.value = "50000";
        document.expressionSearch.percentile_min.value = "0";
        document.expressionSearch.percentile_max.value = "100";
    }
}	    

//
// Disable single channel expression menus if Expression section of
// form is being displayed. Since HTML form elements cannot be actually
// disabled, this method will populate select menus to contain a single
// option with disabled text, and text fields will display disabled text
//
function disableSingleChannelFields( showExpression ) {

    // only need to disable fields if section is displaying
    if ( showExpression ) {

        var detectionMenu = document.expressionSearch.detection;
        var disabledText = getDisabledText();

	var disabledOption = new Array( 1 );
	disabledOption[ 0 ] = disabledText
        populateSelectMenu( detectionMenu, disabledOption, disabledOption );

	document.expressionSearch.signal_min.value = disabledText;
        document.expressionSearch.signal_max.value = disabledText;
        document.expressionSearch.percentile_min.value = disabledText;
        document.expressionSearch.percentile_max.value = disabledText;
    }	    
}


//	    
// Populate dual channel expression menus if Expression section of
// form is being displayed.  This function will be called when user has
// selected to search dual channel experiments and will be accompanied by
// a call to disable the single channel menus
//
function enableDualChannelFields( showExpression ) {

    // only need to populate fields if section is displaying
    if ( showExpression ) {

        var absoluteMenu = document.expressionSearch.absolute;
        populateSelectMenu( absoluteMenu, getAbsoluteValues(), getAbsoluteDisplays() );
        setSelected( absoluteMenu, "expressed" );

        var relativeMenu = document.expressionSearch.relative;
        populateSelectMenu( relativeMenu, getRelativeValues(), getRelativeDisplays() );
        setSelected( relativeMenu, "any" );

        var errorMenu = document.expressionSearch.error;
        populateSelectMenu( errorMenu, getStandardErrorValues(), getStandardErrorDisplays() );
        setSelected( errorMenu, "any" );

        var foldChangeMenu = document.expressionSearch.value;
        populateSelectMenu( foldChangeMenu, getFoldChangeValues(), getFoldChangeDisplays() );
        setSelected( foldChangeMenu, "2" );
    }
}	    

//
// Utility method to select default values after dynamically creating a select
// menu. This is done by looping through all of the menus options and setting
// the selectedIndex property to the index of the option that matches submitted
// optionValue
//
function setSelected( selectMenu, optionValue ) {
    for ( i = 0; i < selectMenu.options.length; i++ ) {
       if ( selectMenu.options[ i ].value == optionValue ) {
           selectMenu.selectedIndex = i;
           break;
       }
    }
}

//
// Disable dual channel expression menus if Expression section of
// form is being displayed. Since HTML form elements cannot be actually
// disabled, this method will populate select menus to contain a single
// option with disabled text, and text fields will display disabled text
//
function disableDualChannelFields( showExpression ) {

    // only need to disable fields if section is displaying
    if ( showExpression ) {

        var disabledText = getDisabledText();

	var disabledOption = new Array( 1 );
	disabledOption[ 0 ] = disabledText

        var absoluteMenu = document.expressionSearch.absolute;
        populateSelectMenu( absoluteMenu, disabledOption, disabledOption );

        var relativeMenu = document.expressionSearch.relative;
        populateSelectMenu( relativeMenu, disabledOption, disabledOption );

        var errorMenu = document.expressionSearch.error;
        populateSelectMenu( errorMenu, disabledOption, disabledOption );

        var foldChangeMenu = document.expressionSearch.value;
        populateSelectMenu( foldChangeMenu, disabledOption, disabledOption );
    }	    
}


//
// Function to retrieve text to use for disabled form fields.  Literal
// text is defined in ExpressionSearchFormHelper.
//
function getDisabledText() {
    var disabledText = "<%= helper.getDisabledText() %>";

    return disabledText;
}



//
//
// Below here are functions that create arrays of literal values to
// use when creating select menu options dynamically through javascript.
// These functions are called by above functions and are all written
// using a single JSP method that takes a String array of values as
// an argument.  This allows us to keep hardcoded definitions of values
// for all menus localized in ExpressionSearchFormHelper, and also
// allows us to use a single java method to generate several otherwise
// identical javascript functions.  
//
//

function getSingleChannelArrayDesignOptions() {
    <%= writeJavaScriptOptions( helper.getSingleChannelArrayDesignOptions() ) %>
}

function getDualChannelArrayDesignOptions() {
    <%= writeJavaScriptOptions( helper.getDualChannelArrayDesignOptions() ) %>
}

function getDetectionValues() {
    <%= writeJavaScriptOptions( helper.getDetectionMenuValues() ) %>
}

function getDetectionDisplays() {
    <%= writeJavaScriptOptions( helper.getDetectionMenuDisplays() ) %>
}

function getAbsoluteValues() {
    <%= writeJavaScriptOptions( helper.getAbsoluteMenuValues() ) %>
}

function getAbsoluteDisplays() {
    <%= writeJavaScriptOptions( helper.getAbsoluteMenuDisplays() ) %>
}

function getRelativeValues() {
    <%= writeJavaScriptOptions( helper.getRelativeMenuValues() ) %>
}

function getRelativeDisplays() {
    <%= writeJavaScriptOptions( helper.getRelativeMenuDisplays() ) %>
}

function getFoldChangeValues() {
    <%= writeJavaScriptOptions( helper.getFoldChangeMenuValues() ) %>
}

function getFoldChangeDisplays() {
    <%= writeJavaScriptOptions( helper.getFoldChangeMenuDisplays() ) %>
}

function getStandardErrorValues() {
    <%= writeJavaScriptOptions( helper.getStandardErrorMenuValues() ) %>
}

function getStandardErrorDisplays() {
    <%= writeJavaScriptOptions( helper.getStandardErrorMenuDisplays() ) %>
}



</script>




<script type='text/javaScript'>

// this function clears the value set for the form element passed to it
// so long as the value is the default text passed in the variable txt.
function clearme(fe){
        // clear the text
        fe.value = "";
        return;
}

// this function returns a true/false result based on the presence of copy
// in the form element passed. this is used by checkvalue() 
function isblank(fe){
        // check that the value is not empty
        if (fe.value == "") {
                // its blank
                return true;
        } else {
                // it has data
                return false;
        }
}

// this takes a form element and checks to see if there is a value assigned 
// to it. If it comes back as a blank field, the form element will display 
// the errormessage variable to the user
function checkvalue(fe, msg) {
        // call the isblank() function with this form element
        if (isblank(fe)){
                // display the error to the user
                alert(msg);
                // set focus on the element we just checked
                fe.focus();
                return false;
        }
                return true;
}

// function to handle scripting w/name type radio buttons & input
// text fields.  Function makes sure that if one name type is selected,
// the other name input field(s) are blanked out and that there's
// agreement between selected input types
function checkNameInput( fieldName ) {

    if ( fieldName == "wild" ) {
        clearme(document.expressionSearch.names);
        document.expressionSearch.listNameType[ 0 ].checked = false; 
        document.expressionSearch.listNameType[ 1 ].checked = false; 
        document.expressionSearch.expression_term.focus();

    } else if ( fieldName == "expression_term" ) {
        document.expressionSearch.input[ 0 ].checked = true;     
        document.expressionSearch.input[ 1 ].checked = false;     
        document.expressionSearch.listNameType[0].checked = false; 
        document.expressionSearch.listNameType[1].checked = false;

    } else if ( fieldName == "list" ) {
        clearme(document.expressionSearch.expression_term); 
        document.expressionSearch.listNameType[ 0 ].checked = true;
        document.expressionSearch.names.focus();

    } else if ( fieldName == "element" ) {
        clearme(document.expressionSearch.expression_term); 
        document.expressionSearch.input[1].checked = true;
        document.expressionSearch.names.focus();

    } else if ( fieldName == "locus" ) {
        clearme(document.expressionSearch.expression_term); 
        document.expressionSearch.input[1].checked = true;
        document.expressionSearch.names.focus();

    } else if ( fieldName == "names" ) {
        document.expressionSearch.input[1].checked = true;   
        document.expressionSearch.listNameType[0].checked = true;

    } else if ( fieldName == "file" ) {
        document.expressionSearch.input[ 1 ].checked = true;
        document.expressionSearch.listNameType[ 0 ].checked = true;
    }
}

// flag to determine if an upload file of names was received
// on last form view -- if so, user will not be allowed to
// change name search and regular form error checking will
// be ignored
//
// Value is populated by JSP, which determines value from page helper
var fileUploaded = <%= helper.fileUploaded() %>


// validation method to check form before submitting for search --
// ensures that either name/GenBank accession or name list search
// params have been entered
//
// only do validation if input file was *not* uploaded on previous
// page view -- if so, ignore all other error checking  
function checkForm( form ) {
    if ( fileUploaded == true ) {
       return true;

    } else if ( form.input[0].checked ) {
       if ( !isblank( form.file ) ) {
           alert( "Search Using List must be selected if uploading file" );
           return false;
       } else {
            return checkvalue( form.expression_term, 
                               "You need to provide input in the Search " +
                               "by Name or GenBank Accession textbox" );
       }
    } else if ( isblank( form.names) && isblank( form.file) ) {
        return checkvalue( form.names,
                           "You need to provide input in the Search " +
                           "Using List or File of Loci or Element Names text area" );
    }
}

// flag to track status of Any option in experiment category menu
var categoryAnyChecked = true;

// function to make any/other options mutually exclusive on experiment
// category select menu. 
function checkCategoryAny() {
      var selectMenu = document.expressionSearch.experiment_category;


      // if another option was just selected, make sure "any" is no 
      // longer selected
      if ( categoryAnyChecked == true  ) {
          selectMenu.options[ 0 ].selected = false;
          categoryAnyChecked = false;

      // if any flag isn't set, check if "any" option is now selected.  if so,
      // make sure all other options are no longer selected 
      } else {
         if ( selectMenu.options[ 0 ].selected == true ) {
              for ( i = 1; i < selectMenu.length; i++ ) {
                 selectMenu.options[ i ].selected = false;
              }
              categoryAnyChecked = true;
          }
      }
}




</script>

<!-- Content -->

<span class="mainheader">TAIR Microarray Expression Search</span>
<p id="help">[<a href="/help/helppages/expression_search.jsp" target="_blank">Help</A>]</p>
<p class="intro">
This page allows searching for microarray gene expression profiles. Genes can be searched by locus name (e.g. At5g01810)<%= DefinitionsLookup.createPopupLink("Locus","class") %>, 
gene symbol (e.g. ap1)<%=DefinitionsLookup.createPopupLink("Gene","name")%>, array element name (e.g. 251059_at)<%= DefinitionsLookup.createPopupLink("ArrayElement","name") %> or GenBank accession (e.g. T13762). To search for multiple 
genes (maximum 10), either paste the names on the lower text box, or upload the list from a file on your local computer. 
Please separate names by tab, comma or carriage return. By default, the tool searches all the experiments with replicated 
hybridizations and returns only the values where the gene was detected with single channel platforms (e.g. Affymetrix GeneChips&reg;). 
To search data obtained with dual channel platforms (e.g. cDNA microarrays) or only certain experiments, 
expression values, or array designs, 
click on the plus sign alongside the corresponding section below to expand it and specify your limits.
</p> 

<p class=intro><b>
Please note that TAIR stopped accepting new microarray data submissions in June 2005. 
Newer and more comprehensive microarray data sets are available at <a href="http://www.ncbi.nlm.nih.gov/geo/">GEO</a>, <a href="http://www.ebi.ac.uk/arrayexpress/ ">ArrayExpress</a> 
and <a href="http://affymetrix.arabidopsis.info/narrays/experimentbrowse.pl">NASCArrays</a>.</b></p>

<form action="/servlets/MultiServlet" name="expressionSearch" enctype="multipart/form-data" method="post" onsubmit="return checkForm( this )">
    <input type="hidden" name="type" value="expression">
    
<!-- if form is submitted to change display only, this property will be
     changed at runtime by javascript toggleSection function to contain
     proper value to submit to search handler -->
<input type="hidden" name="search_action" value="search">


<!-- Redone entire form so ignore these comments

display params for showing/hiding form sections. Values will be initially set
     to contain requested values from previous form view (if any) and will be changed
     at runtime by javascript toggleSection function in response to user's click on
     +/- sign.

<input type="hidden" name="showExpression" value="true">
<input type="hidden" name="showExperiment" value="true">
-->

<div id="searchbox">
    <span class="search_buttons">
    <!-- implement resets as a call for a new form to get original form
               view and make sure any session data is completely cleaned up -->
      <input type="button" value="Reset" onClick="document.location.href='/servlets/Search?type=expression&search_action=new_search'">
      <input type="submit" name="search" value="Submit Query">
    </span>
    
    <fieldset>
        <legend>Select Genes/Array Elements</legend>
        <dl>
            <dt>
                <input type="radio" name="input" value="wild" onclick="checkNameInput( 'wild' )" <%= helper.getRadioButtonCheckedValue( "input", "wild", true ) %>>
                  Search by Name or GenBank Accession
            </dt>
          
            <dd>
                <%= helper.createExpressionNameTypeSelect( "expression_name_type", "medium_sel", "" ) %>
                <input type="text" name="expression_term" size="12" maxlength="60" onfocus="clearme( document.expressionSearch.names );" onclick="checkNameInput( 'expression_term' )" value="<%= helper.getFormValue( "expression_term" ) %>">
                ( exact match ) <br /> <br />
            </dd>
            
            <dt>
                <input type="radio" name="input" value="list" onclick="checkNameInput( 'list' )" <%= helper.getRadioButtonCheckedValue( "input", "list", false ) %>>
                Search Using List or File of Loci or Element Names
            </dt>
            
            <dd>
                <input type="radio" name="listNameType" value="locus" onclick="checkNameInput( 'locus' )" <%= helper.getRadioButtonCheckedValue( "listNameType", "locus", false ) %>>
                    locus (e.g. At5g01810) <%= DefinitionsLookup.createPopupLink("Locus","class") %>
                <input type="radio" name="listNameType" value="element" onclick="checkNameInput( 'element' )" <%= helper.getRadioButtonCheckedValue( "listNameType", "element", false ) %>>
                    element (e.g. 251059_at) <%= DefinitionsLookup.createPopupLink("ArrayElement","name") %>
            </dd>
            <dd>
                <textarea name="names" rows="5" cols="40" onfocus="clearme( document.expressionSearch.expression_term );" onclick="checkNameInput( 'names' )"><%= helper.getFormValue( "names" ) %></textarea>
            </dd>
            <dd>
                 <!-- If file uploaded on last page view, show file name as hardcoded value
                       that can't now be altered -->
                  <% if ( helper.fileUploaded() ) { %>
                      <br>
                      <b><font size="3">File uploaded:</b></font> <%= helper.getOriginalFileName() %>
                      <br><br>
                  <% } else { %>
              Upload file: <input type="file" name="file" onChange="checkNameInput( 'file' )">
                  <% } %>
            </dd>
            
        </dl>
    </fieldset>
    <fieldset>
    <legend>Select Array Type/Design</legend>
        <dl>
            <dt>Array Type</dt>
            <dd>
                <%= helper.createArrayTypeSelect( "array_type", "", "" ) %>
            </dd>
            
            <dt>Array Design <%= DefinitionsLookup.createPopupLink("ArrayDesign","name") %></dt>
            <dd>
                <%= helper.createArrayDesignSelect( "design", "array_type", "", "" ) %>
            </dd>
        </dl>
    </fieldset>
    
     <!-- Selected value for array type will determine which parameters are
                       enabled or disabled. -->
                  <% String arrayType = helper.getFormValue( "array_type" ); 
                     boolean singleChannelSelected = arrayType.equals( "single_channel" );
                     boolean dualChannelSelected = arrayType.equals( "dual_channel" );
		    		     
                  %>
    <div id="results">
    <fieldset>
        <legend>Limit Search by Expression Values</legend>
            <dl>
                <dt>
                    <input type="radio" name="analysis_level" value="replicate"  onclick="checkNameInput( 'analysis_level' )" <%= helper.getRadioButtonCheckedValue( "analysis_level", "replicate", true ) %>>
                        Data from Arrays with Replicates
                        
                </dt>
                <dd>
                    <input type="radio" name="analysis_level" value="element"  onclick="checkNameInput( 'analysis_level' )" <%= helper.getRadioButtonCheckedValue( "analysis_level", "element", false ) %>>
                        Data from All Arrays
                </dd>
               
                
                 <!-- mmmmm Selected value for array type will determine which parameters are
                       enabled or disabled. -->
                
                <dt>
                    &nbsp;
                </dt>
                <dd>
                    &nbsp;
                </dd>
                
                <dt>
                   Affymetrix GeneChip Parameters 
               </dt>
               <dd>
                    &nbsp;
                </dd>
                
                <dt>
                    &nbsp;
                </dt>
                <dd>
                    &nbsp;
                </dd>
               
                <dt>
                   Detection <%= DefinitionsLookup.createPopupLink( "SingleChannelHybData", "detection" ) %>
                </dt>
                <dd>
                   <%= helper.createDetectionSelect( "detection", singleChannelSelected, "", "" ) %>
                </dd>
                
               
                
                <dt>
                    Signal<%= DefinitionsLookup.createPopupLink( "SingleChannelHybData", "signal" ) %>
                </dt>
                <dd>
                    between <input type="text" name="signal_min" size="5" maxlength="5" value="<%= helper.getTextFieldValue( "signal_min", "0", singleChannelSelected ) %>">
			        and <input type="text" name="signal_max" size="5" maxlength="5" value="<%= helper.getTextFieldValue( "signal_max", "50000", singleChannelSelected ) %>">
                </dd>
                
                <dt>
                    Signal Percentile<%= DefinitionsLookup.createPopupLink( "SingleChannelHybData", "signal_percentile" ) %>
                </dt>
                <dd>
                    between<input type="text" name="percentile_min" size="3" maxlength="3" value="<%= helper.getTextFieldValue( "percentile_min", "0", singleChannelSelected ) %>">
                    and<input type="text" name="percentile_max" size="3" maxlength="3" value="<%= helper.getTextFieldValue( "percentile_max", "100", singleChannelSelected ) %>">
                </dd>
                
                <dt>
                    &nbsp;
                </dt>
                <dd>
                    &nbsp;
                </dd>
                
                <dt>
                    cDNA Microarray Parameters
                </dt>
                <dd>
                    &nbsp;
                </dd>
                
                <dt>
                    &nbsp;
                </dt>
                <dd>
                    &nbsp;
                </dd>
                
                <dt>
                    Absolute<%= DefinitionsLookup.createPopupLink("DualChannelHybData","is_expressed") %>
                </dt>
                <dd>
                    <%= helper.createAbsoluteSelect( "absolute", dualChannelSelected, "", "" ) %>
                </dd>
                
                <dt>
                   Relative<%= DefinitionsLookup.createPopupLink("DualChannelHybData","relative") %>
                </dt>
                <dd>
                    <%= helper.createRelativeSelect( "relative", dualChannelSelected, "", "" ) %>
                </dd>
                
                <dt>
                    Fold Change<%= DefinitionsLookup.createPopupLink("DualChannelHybData","fold_change") %>
                </dt>
                <dd>
                    <%= helper.createFoldChangeSelect( "value", dualChannelSelected, "", "" ) %>
                </dd>
                
                <dt>
                    Std Error<%= DefinitionsLookup.createPopupLink("DualChannelHybData","fold_change_std_err") %>
                </dt>
                <dd>
                   <%= helper.createStandardErrorSelect( "error", dualChannelSelected, "", "" ) %> 
                </dd>
                
            </dl>
        </fieldset>
        
       
        
        <fieldset>
        <legend>Limit Search by Experiment Parameters</legend>
        
        <dl>
        <dt>
            Search by Experiment Name, Description and/or Author
        </dt>
        <dd>
                <%= helper.createExperimentNameTypeSelect( "name_type_1", "large_sel", "" ) %>
           
                <%= helper.createSearchMethodSelect( "method_1", DataConstants.SEARCH_STARTS, "small_sel", "" ) %>
                <input type="text" name="term_1" size="12" maxlength="60" value="<%= helper.getFormValue( "term_1" ) %>">
            </dd>
            
            <dt>
            &nbsp;
            </dt>
            <dd>
            &nbsp;
            </dd>  
                
            <dt>
                Search by Experiment
            </dt>
            <dd>
                &nbsp;
            </dd>
            <dt>
                &nbsp;
            </dt>
            <dd>
                &nbsp;
            </dd>
            
            <dt>
                KeywordsGoals<%=DefinitionsLookup.createPopupLink("RelationshipType","experimental_goal")%> 
            </dt>
            <dd>
                <%= helper.createSearchMethodSelect( "goal_method", DataConstants.SEARCH_STARTS, "small_sel", "" ) %>
                <input type="text" name="experiment_goal" size="12" maxlength="60" value="<%= helper.getFormValue( "experiment_goal" ) %>"> (e.g. aging; defense response)
            </dd>
            
            <dt>
            &nbsp;
            </dt>
            <dd>
            &nbsp;
            </dd>            
        
            <dt>
                Experimental Variables<%=DefinitionsLookup.createPopupLink("RelationshipType","experimental_factor")%>
            </dt>
            <dd>
                <%= helper.createSearchMethodSelect( "factor_method", DataConstants.SEARCH_STARTS, "small_sel", "" ) %>
                <input type="text" name="experimental_factor" size="12" maxlength="60" value="<%= helper.getFormValue( "experimental_factor" ) %>"> (e.g. light)
            </dd>
            
            <dt>
            &nbsp;
            </dt>
            <dd>
            &nbsp;
            </dd>
            
            <dt>
                Plant Tissue<%=DefinitionsLookup.createPopupLink("Glossary","plant_tissue")%>
            </dt>
            <dd>
                <%= helper.createSearchMethodSelect( "bio_sample_method", DataConstants.SEARCH_STARTS, "small_sel", "" )  %>
                <input type="text" name="bio_sample" size="12" maxlength="60" value="<%= helper.getFormValue( "bio_sample" ) %>"> (e.g. leaf; root)
            </dd>
            
            <dt>
                Experiment Category<%=DefinitionsLookup.createPopupLink("RelationshipType","experiment_category")%>
                <br />(allows multiple selection)
            </dt>
            <dd>
                <%= helper.createExperimentCategorySelect( "experiment_category", 3, "", "" ) %>
                
            </dd>
        </dl>
       
   </fieldset>
   
               <fieldset>
                <legend>Output Options</legend>
                <dl>
                    <dt>
                        number of records/page
                    </dt>
                    <dd>
                        <%= helper.createSizeSelect( "size", "", "" ) %>
                    </dd>
                        
                    <dt>
                        fold change color (ignored for Affymetrix)<%= DefinitionsLookup.createPopupLink("DualChannelHybData","color_encoding") %>
                    </dt>
                    <dd>
                        <%= helper.createColorSelect( "color", "", "" ) %>
                    </dd>
                </dl>
            </fieldset>
   </div>
   
		<span class="search_buttons">
            <input type="button" value="Reset" onClick="document.location.href='/servlets/Search?type=expression&search_action=new_search'">
            <input type="submit" name="search" value="Submit Query" />
        </span>
   
</div>

</form>
<!-- End of Content -->

<script type="text/javascript">
updateArrayDesign( document.expressionSearch.array_type )
</script>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


