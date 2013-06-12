//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.11 $
// $Date: 2005/01/07 23:42:34 $
//------------------------------------------------------------------------------

package org.tair.search;

import java.sql.SQLException;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;

import org.tair.utilities.HTMLFactoryWithCSS;
import org.tair.utilities.SessionHandler;
import org.tair.utilities.TextConverter;

/**
 * ExpressionSearchFormHelper is a helper class that encapsulates methods and
 * logic for displaying data on the expression search form JSP.  This search
 * form is more complex than others because it simulates a "show/hide" feature
 * that allows user to collapse and expand sections of the form.  Since this
 * is not feasible to do with HTML/javascript, this is done through multiple
 * page loads of the search form page.  This is additionally complicated because
 * steps need to be taken to preserve form input from a previous page on the
 * next page view.  Since the amount of methods and logic needed to do this
 * is fairly large, this class has been created as a central holding point
 * for all that code.
 */

public class ExpressionSearchFormHelper {

    // search form field values from last page view
    private Map searchParams;

    // expression search session data contained in user's session -- 
    // used for storing uploaded files between page loads before
    // ultimately executing search
    private ExpressionSearchSession expressionSearchSession;


    // String value to display for expression fields that have been 
    // disabled according to selected array type
    private String disabledText = "n/a";

    /**
     * Creates an instance of ExpressionSearchFormHelper by retrieving
     * a reference to Map of search parameters entered on previous view
     * of search form from submitted servlet request.  This collection
     * is then referenced whenever a previous form value is required.
     * Map will have been set as an attribute of request by forwarding
     * servlet and will contain form data with String field name referencing
     * String value.
     *
     * @param request HttpServletRequest forwarded from servlet
     */
    public ExpressionSearchFormHelper( HttpServletRequest request ) {
        this.searchParams = (Map) request.getAttribute( "searchParams" );
        this.expressionSearchSession =
	    SessionHandler.getExpressionSearchSession( request );
    }


    /**
     * Determines if user uploaded a file of identifiers on a previous view
     * of the search form. Uploaded file is stored in user's session until
     * search is actually executed -- this is done to avoid having to upload
     * this file multiple times between page loads. 
     *
     * @return <code>true</code> if user previously uploaded a file,
     *  or <code>false</code> if no file has been uploaded.
     */
    public boolean fileUploaded() {
        return ( expressionSearchSession != null && 
                 expressionSearchSession.hasUploadedFile() );
    }


    /**
     * Retrieves the original name of file that was uploaded for display on
     * the search form after file has already been uploaded. File name should
     * be the name of the file on user's file system (not the file name on
     * the web server).
     * 
     * @return Name of uploaded file as it appears on user's file system,
     *  <code>null</code> if no file upload has been received.
     */
    public String getOriginalFileName() {
        return fileUploaded() ? 
            expressionSearchSession.getOriginalFileName() : null;
    }

    /**
     * Retrieves a formatted value for displaying a previously submitted 
     * search parameter in a current form view.  This utility method will return 
     * an empty string if submitted map of search parameters or requested form 
     * field is empty or null.
     *
     * <p>
     * NOTE: This method will always assume value for requested field has
     * been retrieved and stored in search parameters collection as a String
     * value. If field value is stored as any other Object type, a
     * ClassCastException will be thrown.
     *
     * @param fieldName Name of form field to retrieve any previous value for
     * @return Previously submitted value of fieldName, or an empty string if
     *  no value for fieldName found
     */
    public String getFormValue( String fieldName ) {
        String formValue = "";
        
        if ( searchParams != null ) {
            String lastValue = (String) searchParams.get( fieldName );
            if ( !TextConverter.isEmpty( lastValue ) ) {
                formValue = lastValue;
            }
        }

        return formValue;
    }


    /**
     * Retrieves a formatted value for displaying a previously submitted 
     * search parameter in one of the Expression values text fields. Since
     * expression value menus are conditionally populated depending on selected
     * array type, this method will only return searchable values if form
     * field is meant to be enabled. 
     *
     * <p>
     * If form field is meant to be enabled, this utility method will return
     * either the last submitted value for this field, or the defined default
     * value for the field as submitted.
     *
     * <p>
     * NOTE: This method will always assume value for requested field has
     * been retrieved and stored in search parameters collection as a String
     * value. If field value is stored as any other Object type, a
     * ClassCastException will be thrown.
     *
     * @param fieldName Name of text field to retrieve any previous value for
     * @param defaultValue Default value to return if no previous value 
     * submitted for text field.
     * @param enabled If <code>true</code> text field should be enabled, if
     * <code>false</code> text field should be disabled.
     * @return If field is enabled, previously submitted value of fieldName, or
     * default value for field is returned.  If field is disabled, standard
     * disabled text is returned.
     */
    public String getTextFieldValue( String fieldName, 
				     String defaultValue, 
				     boolean enabled ) 
    {
        String formValue = null;

	if ( enabled ) {
	    formValue = defaultValue;
	    if ( searchParams != null ) {
		String lastValue = (String) searchParams.get( fieldName );
		if ( !TextConverter.isEmpty( lastValue ) ) {
		    formValue = lastValue;
		}
	    }
	} else {
	    formValue = getDisabledText();
	}

        return formValue;
    }

    /**
     * Retrieves text to use for display in expression form fields that
     * are disabled according to selected value of array type.
     *
     * @return Text to use in disabled form fields.
     */
    public String getDisabledText() {
	return disabledText;
    }
        
    
    /**
     * Creates a hyperlink that allows user to expand/collapse a section
     * of the search form.  Link will be returned as a fully created HTML
     * link referencing the javascript function toggleSection (defined on
     * expression_form.jsp) and passing the submitted section.  For display,
     * returned text will include HTML for inserting either a plus sign (+)
     * or a minus sign (-) as an image based on whether the section is
     * currently being displayed or not (as flagged by submitted show 
     * parameter).
     *
     * @param section Section of expression form link will reference. 
     * Acceptable values are "expression", "experiment" and "array".
     * @param show If <code>true</code> section is currently being shown; if
     * <code>false</code> section is currently hidden.
     * @return HTML to create a link to the javascript function toggleSection
     * with an plus or minus sign image for display
     */
    public String makeSectionLink( String section, boolean show ) {
        StringBuffer link = new StringBuffer();
        
        link.append( "<a href=\"javascript:toggleSection( '" + 
		     section + 
		     "' )\">" );
        
        // if section currently being displayed, show "-" image to 
        // collapse, else if section hidden, show "+" image to expand
        String imageName = show ? 
	    "minus_only_light_grey.gif" : "plus_only_light_grey.gif";

        link.append( "<img src=\"/images/tree/" + 
		     imageName + 
		     "\" border=\"0\">" );
        
        link.append( "</a>" );
        
        return link.toString();
    }
    
    /**
     * Utility method to get requested value of a section display parameter
     * as a simple boolean that flags whether a given section should be 
     * displayed or not.  These values should be retrieved by 
     * ExpressionSearchHandler and put into search params Map as String values.
     * Method will return true if submitted parameter name was submitted with
     * a value of "true".
     *
     * @param sectionParameter Name of section display parameter to interpret
     * @return <code>true</code> if submitted section display parameter was
     * submitted as "true" (in which case section should be displayed), or
     * <code>false</code> if any other value for sectionParameter was submitted
     * (in which case section should not be displayed)
     */
    public boolean getSectionDisplayValue( String sectionParameter ) {
        String requestValue = getFormValue( sectionParameter );

        return requestValue.equals( "true" );
    }


    /**
     * Utility method to help show radio buttons as checked or not based on
     * submitted input from previous form.  Returns as string that can be safely
     * included in the button's HTML tag (i.e. "checked" or an empty string).
     * Method will return "checked" if previously submitted value for fieldName 
     * matches submitted fieldValue.
     *
     * <p>
     * If the setDefault flag is submitted as true, method will return "checked"
     * if no previous value has been submitted for fieldName. This allows a 
     * specific radio button to be set as the default option for a group on
     * JSP form.
     *
     * @param fieldName Name of radio button form field to check
     * @param fieldValue Value of radio button to compare against last submitted
     * value
     * @param setDefault If <code>true</code> current radio button being checked
     * should be used for default value if no other value for field name has
     * been previously submitted; if <code>false</code> current radio button
     * should not be default value
     * @return "checked" if radio button should be checked, or empty string if 
     * radio button should not be checked
     */
    public String getRadioButtonCheckedValue( String fieldName, 
                                              String fieldValue,
                                              boolean setDefault ) 
    {
        String previousValue = getFormValue( fieldName );

        String checked = "";
        if ( ( TextConverter.isEmpty( previousValue ) && setDefault ) ||
             previousValue.equals( fieldValue ) ) {

            checked = "checked";
        }

        return checked;
    }

    /**
     * Creates HTML for displaying the "expression name type" select menu.  Any
     * option previously chosen will be pre-selected; "locus name" will be 
     * selected as a default.
     *
     * @param fieldName Name of form element
     * @return HTML for displaying the "name type" select menu with previously
     *  submitted value pre-selected.
     */
    public String createExpressionNameTypeSelect( String fieldName, String tag_class, String tag_id ) {
        String previousValue = getFormValue( fieldName );

        // default to locus name
        if ( TextConverter.isEmpty( previousValue ) ) {
            previousValue = "locus";
        }

        // create arrays for menu options and display
        String[] values = new String[] {
            "name",
	    "gene",
	    "locus",
	    "genbank"
	};

        String[] displays = new String[] {
            "element name (e.g. 39B5T7)",
	    "gene name/symbol (e.g. AP1)",
	    "locus (e.g. At5g01810)",
	    "GenBank accession (e.g. T13762)"
	};
        
        return HTMLFactoryWithCSS.createSelect( fieldName, 
                                         previousValue,
                                         values,
                                         displays,
                                         false, tag_class, tag_id ); // don't show "Select One"
    }


    /**
     * Creates HTML for displaying the "number of records" select menu.  Any
     * option previously chosen will be pre-selected; "25" will be selected as
     * a default.
     *
     * @param fieldName Name of size select form element
     * @return HTML for displaying the "number of records" select menu with 
     * previously submitted value pre-selected.
     */
    public String createSizeSelect( String fieldName, String tag_class, String tag_id ) {

        // size is stored as an Integer in searchParams
        String previousValue = "";
        if ( searchParams != null ) {
            Integer sizeParam = (Integer) searchParams.get( fieldName );
            previousValue = sizeParam != null ? sizeParam.toString() : null;
        }

        // create arrays for menu options - same values for option and display
        String[] values = new String[] {
            "25", 
	    "50",
	    "100",
	    "200" };

        String[] displays = values;

        return HTMLFactoryWithCSS.createSelect( fieldName, 
                                         previousValue,
                                         values,
                                         displays,
                                         false, tag_class, tag_id  ); // don't show "Select One"
    }


    /**
     * Creates HTML for displaying the "sort records by" select menu.  Any 
     * option previously chosen will be pre-selected; "fold change" will be 
     * selected by default.
     *
     * @param fieldName Name of form element
     * @return HTML for displaying the "sort records by" select menu with 
     * previously submitted value pre-selected.
     */
    public String createOrderSelect( String fieldName, String tag_class, String tag_id  ) {
        String previousValue = getFormValue( fieldName );

        // create arrays for order by options & display
        String[] values = new String[] {
	    "name", 
	    "locus", 
	    "experiment_name" 
	};

        String [] displays = new String[] {
	    "element name",
	    "locus",
	    "experiment name"
	};

        return HTMLFactoryWithCSS.createSelect( fieldName, 
                                         previousValue,
                                         values,
                                         displays,
                                         false, tag_class, tag_id  ); // don't show "Select One"
    }

    /**
     * Creates HTML for displaying the "color encoding" select menu.  Any option
     * previously chosen will be pre-selected; "red/green" will be selected by
     * default.
     *
     * @param fieldName Name of form element
     * @return HTML for displaying the "color encoding" select menu with 
     * previously submitted value pre-selected.
     */
    public String createColorSelect( String fieldName, String tag_class, String tag_id  ) {
        String previousValue = getFormValue( fieldName );

        // create arrays for color options & display
        String[] values = new String[] {
            "RG",
	    "RB", 
	    "YB"
	};

        String[] displays = new String[] {
            "red/green",
	    "red/blue",
	    "yellow/blue"
	};
        
        return HTMLFactoryWithCSS.createSelect( fieldName, 
                                         previousValue,
                                         values,
                                         displays,
                                         false, tag_class, tag_id  ); // don't show "Select One"
    }


    /**
     * Creates HTML for displaying the "absolute" select menu, If field is
     * enabled, any option previously chosen will be pre-selected; "expressed"
     * will be selected by default. If field is disabled, menu will contain a
     * single option with the standard disabled text.
     *
     * @param fieldName Name of form element
     * @param enabled If <code>true</code> form field should be enabled, if
     * <code>false</code> form field should be disabled.
     * @return HTML for displaying the "absolute" select menu with previously
     *  submitted value pre-selected, or with disabled text.
     */
    public String createAbsoluteSelect( String fieldName, boolean enabled, String tag_class, String tag_id  ) {
        String previousValue = null;

        // create arrays for absolute value options & display
        String[] values = null;
	String[] displays = null;
	
	if ( !enabled ) {
	    values = new String[] { getDisabledText() };
	    displays = values;
	} else {
	    previousValue = getFormValue( fieldName );
	    values = getAbsoluteMenuValues();
	    displays = getAbsoluteMenuDisplays();
	}

        return HTMLFactoryWithCSS.createSelect( fieldName, 
                                         previousValue,
                                         values,
                                         displays,
                                         false, tag_class, tag_id  ); // don't show "Select One"
    }

    /**
     * Retrieves array of values to use for populating "absolute" select
     * menu. Implemented as a public method so javascript functions in
     * search form can use same values.
     *
     * @return array of values to use for populating menu
     */
    public String[] getAbsoluteMenuValues() {
	String[] values =  new String[] {
	    "expressed", 
	    "not expressed"
	    // "absent"
	};

	return values;
    }
	
    /**
     * Retrieves array of display values to use for populating "absolute"
     * select menu. Implemented as a public method so javascript functions in
     * search form can use same values. This array ends up being the same
     * as getAbsoluteMenuValues, but is offered for convenience.
     *
     * @return array of values to use for populating menu
     */
    public String[] getAbsoluteMenuDisplays() {
	return getAbsoluteMenuValues();
    }

    /**
     * Creates HTML for displaying the "relative" select menu. If field is
     * enabled, any option previously chosen will be pre-selected; "any" will 
     * be selected by default. If field is disabled, menu will contain a
     * single option with the standard disabled text.
     *
     * @param fieldName Name of form element
     * @param enabled If <code>true</code> form field should be enabled, if
     * <code>false</code> form field should be disabled.
     * @return HTML for displaying the "relative" select menu with previously
     * submitted value pre-selected, or with disabled text
     */
    public String createRelativeSelect( String fieldName, boolean enabled, String tag_class, String tag_id  ) {
        String previousValue = null; 

	// create arrays for relative value - same values for options & display
	String[] values = null;
	String[] displays = null;

	if ( !enabled ) {
	    values = new String[] { getDisabledText() };
	    displays = values;

	} else {
	    previousValue = getFormValue( fieldName );
	    values = getRelativeMenuValues();
	    displays = getRelativeMenuDisplays();
	}
        
        return HTMLFactoryWithCSS.createSelect( fieldName, 
                                         previousValue,
                                         values,
                                         displays,
                                        false, tag_class, tag_id ); // don't show "Select One"
    }

    /**
     * Retrieves array of values to use for populating "relative" select
     * menu. Implemented as a public method so javascript functions in
     * search form can use same values.
     *
     * @return array of values to use for populating menu
     */
    public String[] getRelativeMenuValues() {
	String[] values = new String[] {
	    "any",
	    "up",
	    "down",
	    "unchanged"
	};

	return values;
    }

    /**
     * Retrieves array of display values to use for populating "relative"
     * select menu. Implemented as a public method so javascript functions in
     * search form can use same values. This array ends up being the same
     * as getRelativeMenuValues, but is offered for convenience.
     *
     * @return array of values to use for populating menu
     */
    public String[] getRelativeMenuDisplays() {
	return getRelativeMenuValues();
    }



    /**
     * Creates HTML for displaying the "fold change" select menu.  If field is
     * enabled, any option previously chosen will be pre-selected; ">=2" will 
     * be selected by default.  If field is disabled, menu will contain a
     * single option with the standard disabled text.
     *
     * @param fieldName Name of form element
     * @param enabled If <code>true</code> form field should be enabled, if
     * <code>false</code> form field should be disabled.
     * @return HTML for displaying the "fold change" select menu with previously
     * submitted value pre-selected or with disabled text
     */
    public String createFoldChangeSelect( String fieldName, boolean enabled, String tag_class, String tag_id  ) {
        String previousValue = null;

	// create arrays for fold change options & display
	String[] values = null;
	String[] displays = null;

	if ( !enabled ) {
	    values = new String[] { getDisabledText() };
	    displays = values;

	} else {
	    previousValue = getFormValue( fieldName );
	    
	    // default display to >= 2  if no value previously selected
	    if ( TextConverter.isEmpty( previousValue ) ) {
		previousValue = "2";
	    }

	    values = getFoldChangeMenuValues();
	    displays = getFoldChangeMenuDisplays();
	}
       
        return HTMLFactoryWithCSS.createSelect( fieldName, 
                                         previousValue,
                                         values,
                                         displays,
                                         false, tag_class, tag_id ); // don't show "Select One"
    }

    /**
     * Retrieves array of values to use for populating "fold change" select
     * menu. Implemented as a public method so javascript functions in
     * search form can use same values.
     *
     * @return array of values to use for populating menu
     */
    public String[] getFoldChangeMenuValues() {
	String[] values = new String[] {
	    "1-2",
	    "2",
	    "3",
	    "4",
	    "5",
	    "10"
	};
	
	return values;
    }

    /**
     * Retrieves array of display values to use for populating "fold change"
     * select menu. Implemented as a public method so javascript functions in
     * search form can use same values.
     *
     * @return array of display values to use for populating menu
     */
    public String[] getFoldChangeMenuDisplays() {
	String[] displays = new String[] {
	    "1-2",
	    ">=2",
	    ">=3",
	    ">=4",
	    ">=5",
	    ">=10"
	};
	
	return displays;
    }
	


    /**
     * Creates HTML for displaying the "standard error" select menu.  If field
     * is enabled, any option previously chosen will be pre-selected; "any" will
     * be selected by default. If field is disabled, menu will contain a
     * single option with the standard disabled text.
     *
     * @param fieldName Name of form element
     * @param enabled If <code>true</code> form field should be enabled, if
     * <code>false</code> form field should be disabled.
     * @return HTML for displaying the "standard error" select menu with 
     * previously submitted value pre-selected or with disabled text
     */
    public String createStandardErrorSelect( String fieldName, 
					     boolean enabled, String tag_class, String tag_id  ) 
    {
        String previousValue = null;

        // create arrays for standard error options & display
	String[] values = null;
	String[] displays = null;
	
	if ( !enabled ) {
	    values = new String[] { getDisabledText() };
	    displays = values;

	} else {
	    previousValue = getFormValue( fieldName );
	    values = getStandardErrorMenuValues();
	    displays = getStandardErrorMenuDisplays();
	}

        return HTMLFactoryWithCSS.createSelect( fieldName, 
                                         previousValue,
                                         values,
                                         displays,
                                         false, tag_class, tag_id  ); // don't show "Select One"
    }

    /**
     * Retrieves array of values to use for populating "standard error" select
     * menu. Implemented as a public method so javascript functions in
     * search form can use same values.
     *
     * @return array of values to use for populating menu
     */
    public String[] getStandardErrorMenuValues() {
	String[] values = new String[] {
	    "any", 
	    "< 2",
	    "< 1",
	    "< 0.5", 
	    "< 0.25"
	};
	
	return values;
    }

    /**
     * Retrieves array of display values to use for populating "standard error"
     * select menu. Implemented as a public method so javascript functions in
     * search form can use same values.
     *
     * @return array of display values to use for populating menu
     */
    public String[] getStandardErrorMenuDisplays() {
	String[] displays = new String[] {
	    "any",
	    "<2",
	    "<1",
	    "<0.5",
	    "<0.25" 
	};
	
	return displays;
    }



    /**
     * Creates HTML for displaying the "detection" select menu.  If field
     * is enabled, any option previously chosen will be pre-selected; "present"
     * will be selected by default. If field is disabled, menu will contain a
     * single option with the standard disabled text.
     *
     * @param fieldName Name of form element
     * @param enabled If <code>true</code> form field should be enabled, if
     * <code>false</code> form field should be disabled.
     * @return HTML for displaying the "detection" select menu with previously
     * submitted value pre-selected or disabled text
     */
    public String createDetectionSelect( String fieldName, boolean enabled, String tag_class, String tag_id  ) {
	String previousValue = null;

	// create arrays for detection options and display
	String[] values = null;
	String[] displays = null;

	if ( !enabled ) {
	    values = new String[] { getDisabledText() };
	    displays = values;

	} else {
	    previousValue = getFormValue( fieldName );
	    values = getDetectionMenuValues();
	    displays = getDetectionMenuDisplays();
	}

        return HTMLFactoryWithCSS.createSelect( fieldName, 
                                         previousValue,
                                         values,
                                         displays,
                                         false, tag_class, tag_id  ); // don't show "Select One"
    }

    /**
     * Retrieves array of values to use for populating "detection" select
     * menu. Implemented as a public method so javascript functions in
     * search form can use same values.
     *
     * @return array of values to use for populating menu
     */
    public String[] getDetectionMenuValues() {
	String[] values = new String[] {
	    "P",
	    "A",
	    "M"
	};
	
	return values;
    }

    /**
     * Retrieves array of display values to use for populating "detection"
     * select menu. Implemented as a public method so javascript functions in
     * search form can use same values.
     *
     * @return array of display values to use for populating menu
     */
    public String[] getDetectionMenuDisplays() {
	String[] displays = new String[] {
	    "present (P)",
	    "absent (A)",
	    "marginal (M)"
	};
	
	return displays;
    }


   /**
     * Creates HTML for displaying the "experiment name type" select menu.  
     * Any option previously chosen will be pre-selected; "experiment name"
     * will be selected by default.
     *
     * @param fieldName Name of form element
     * @return HTML for displaying the "name type" select menu with previously
     * submitted value pre-selected.
     */
    public String createExperimentNameTypeSelect( String fieldName, String tag_class, String tag_id  ) {
        String previousValue = getFormValue( fieldName );

        // create arrays for name type options & display
        String[] values = new String[] {
            "name", 
	    "experimenter",
	    "description",
	    "submission_number",
            "organization"
        };

        String[] displays = new String[] {
            "Experiment name (e.g. cell death)",
	    "Experimenter's last name (e.g. Berleth)",
	    "Description (e.g. mutant)",
	    "Submission Number (e.g. 14)",
            "Organization (e.g. AtGenExpress)"
	};

        return HTMLFactoryWithCSS.createSelect( fieldName, 
                                         previousValue,
                                         values,
                                         displays,
                                         false, tag_class, tag_id  ); // don't show "Select One"
    }


    /**
     * Creates HTML for displaying search method select menus.  Any option
     * previously chosen will be pre-selected; submitted default value will
     * be selected if no previously selected value submitted.  This method
     * simply acts as a wrapper to the HTMLFactory.createSearchMethodSelect
     * method, but adds the additional step of determining which default
     * value to use by comparing.
     *
     * @param fieldName Name of form element
     * @param defaultValue Default search option to show selected
     * @return HTML for displaying the "name type" select menu with previously
     *  submitted value pre-selected.
     */
    public String createSearchMethodSelect( String fieldName, 
                                            String defaultValue, String tag_class, String tag_id  ) 
    {
        String previousValue = getFormValue( fieldName );

        if ( TextConverter.isEmpty( previousValue ) ) {
            previousValue = defaultValue;
        }
                                                       
        return HTMLFactoryWithCSS.createSearchMethodSelect( fieldName, 
                                                     previousValue, 
                                                     false, tag_class, tag_id  );
    }

    
    /**
     * Creates HTML for experiment category select menu.  Any options
     * previously chosen will be pre-selected; "Any" will be selected if no 
     * previously selected values submitted.  This method simply acts as a 
     * wrapper to the HTMLFactory.createExperimentCategorySelect method, but 
     * adds the additional step of determining if any values were submitted on
     * previous page.
     *
     * <p>
     * This method also hardcodes the "onChange" event handler for the select
     * menu which will call the javascript function "checkCategoryAny" (defined
     * in search form to ensure that Any and other options are mutually 
     * exclusive.
     *
     * @param fieldName Name of form element
     * @param size Number of entries to show in menu
     * @return HTML for displaying the "name type" select menu with previously
     * submitted value pre-selected.
     * @throws SQLException if a database error occurs while retrieving
     * experiment categories.
     */
    public String createExperimentCategorySelect( String fieldName, int size, String tag_class, String tag_id  ) 
        throws SQLException {

        // selected experiment categories are stored in searchParams
        // as Long array of keyword ids... retrieve as Long then convert
        // to String for showing correct categories pre-selected
        String[] previousValues = null;
        if ( searchParams != null ) {
            Long[] ids = (Long[]) searchParams.get( "experiment_category_id" );
            previousValues = TextConverter.toStringArray( ids );
        }
        
	String event = "onChange=\"checkCategoryAny()\"";
        return 
	    HTMLFactoryWithCSS.createExperimentCategorySelect( fieldName,
							"Any",
							previousValues,
							size,
							event, tag_class, tag_id  );
    }
    
    /**
     * Creates HTML for displaying the "array design" select menu.  Any option
     * previously chosen will be pre-selected; "any" will be selected by
     * default. Since options in array design menu are dynamically determined
     * by choice of array type (affymetrix vs. cDNA), returned menu will
     * only contain options relevant to selected array type.
     *
     * @param designFieldName Name of array design menu
     * @param typeFieldName Name of array type menu
     * @return HTML for displaying the "array design" select menu with 
     * previously submitted value pre-selected. Menu will only include
     * options relevant to selected array type.
     */
    public String createArrayDesignSelect( String designFieldName, 
					   String typeFieldName, String tag_class, String tag_id  ) 
    {
        
        // Array design input is retrieved and stored as array, even
        // though current version of menu does not allow multiple selections.
        // In keeping w/Handler & Searcher code, keep treating as if there
        // could be multiple values, but still create select menu as a
        // single-select menu.
        String[] previousValues = null;
        if ( searchParams != null ) {
            previousValues = (String[]) searchParams.get( designFieldName );
        }

	// get array design options specific to selected array type - same 
	// value for option values and display
	String[] values = null;

	String arrayType = getFormValue( typeFieldName );
	if ( arrayType.equals( "dual_channel" ) ) {
	    values = getDualChannelArrayDesignOptions();

	    // default to single channel
	} else { 
	    values = getSingleChannelArrayDesignOptions();

	}

        // create select menu using slightly different HTMLFactory method to 
        // allow for array of selected values, with option values & display 
	// elements being same value -- create menu as a non-multiple, single
	// item menu despite the fact that search code assumes that there 
	// could be multiple selections
        boolean multipleSelection = false;
        int size = 1;
        String eventHandler = null;
        String topOption = null;
        
        return HTMLFactoryWithCSS.createSelect( designFieldName,
                                         previousValues,
                                         values,
                                         size,
                                         multipleSelection,
                                         topOption,
                                         eventHandler, tag_class, tag_id  );
    }


    /**
     * Creates HTML for displaying the "array type" select menu.  Any option
     * previously chosen will be pre-selected; "Affymetrix GeneChips" will be
     * selected by default.
     *
     * <p>
     * This method also hardcodes the "onChange" event handler for the select
     * menu which will call the javascript function "updateArrayDesign" (defined
     * in search form to populate array design menu options dynamically in 
     * response to array type selection).
     *
     * @param fieldName Name of array type menu
     * @return HTML for displaying the "array type" select menu with 
     * previously submitted value pre-selected.
     */
    public String createArrayTypeSelect( String designFieldName, String tag_class, String tag_id  ) {

	// HTMLFactory method requires previous selections as array,
	// though it should always be a single value for this form
        String[] previousValue = new String[] { 
	    getFormValue( designFieldName ) 
	};
	
	String event = "onChange=\"updateArrayDesign( this )\"";

        // create map for array type display values and options
	Map values = new TreeMap();

	// include HTML char entity to display trademark symbol
	values.put( "Affymetrix GeneChips&#174;", "single_channel" );
	values.put( "cDNA microarrays", "dual_channel" );
	
	return
	    HTMLFactoryWithCSS.createSelect( designFieldName,
				      previousValue,
				      values,
				      1, // menu size
				      false, // don't allow multiple selection
				      null, // no top option
				      event, 
				      false,// use map keys as display options
				      tag_class, tag_id );
    }


    /**
     * Retrieves list of array design options to use if dual channel array
     * (cDNA, AFGC style) is selected as array type. This list is used both
     * by local createArrayDesignSelect method as well as by javascript in 
     * search form that populates menu with relevant options when array type
     * selection is changed.
     *
     * @return List of array design options for dual channel arrays.
     */
    public String[] getDualChannelArrayDesignOptions() {
        String[] values = new String[] {
            "any", 
	    "CIW-3_04-01",
	    "CIW-4_06-01",
	    "CIW-4_08-01",
	    "CIW-4_09-01",
	    "CIW-5_08-01",
	    "CIW-5_09-01", 
	    "CIW-5_10-01", 
	    "CIW2.5Kv4", 
	    "CIW:2400", 
	    "MSU-1", 
	    "MSU-2_03-00",
	    "MSU-4_10-01",
	    "MSU2_06-00",
	    "MSU2_12-00",
	    "MSU3_07-01",
	    "CIW-8_09-02a",
	    "CIW-7_02-02"
	};

	return values;
    }

    /**
     * Retrieves list of array design options to use if single channel array
     * (Affymetrix) is selected as array type. This list is used both
     * by local createArrayDesignSelect method as well as by javascript in 
     * search form that populates menu with relevant options when array type
     * selection is changed.
     *
     * @return List of array design options for single channel arrays.
     */
    public String[] getSingleChannelArrayDesignOptions() {
        String[] values = new String[] {
            "any", 
	    "Affymetrix 8k",
	    "Affymetrix 25k"
	};

	return values;
    }
}

    
