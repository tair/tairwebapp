/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.net.URLEncoder;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;
import java.util.List;
import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsCountry;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.CountryDelegate;

import org.tair.tfc.DBconnection;
import org.tair.tfc.DBReadManager;

/**
  * HTMLFactoryWithCSS is a utility class for creating commonly used HTML elements.  
  */

public class HTMLFactoryWithCSS {

    /**
     * Creates an HTML SELECT form field from the values submitted, optionally 
     * showing the supplied empty top value.  Select menu optionally uses Map 
     * keys as option values with Map values as option display values, or vice
     * versa depending on value of keysAsValues param.
     *
     * <p>
     * This generic method is mostly used by other type-specific public methods,
     * however is itself public to allow for client code to create generic select
     * menus without defining a wrapper method.
     * 
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value 
     * is null or empty, the top value of the menu will display
     * @param values A <code>Map</code> of the values to make options in the
     *  select field. 
     * @param showTop If <code>true</code>, an empty first option will be created 
     *  in addition to the supplied values; if <code>false</code> the select menu 
     *  will only contain the options in Map of values 
     * @param topDisplay <code>String</code> to use for top option's display. If 
     *  showTop is <code>true</code> and topDisplay is empty or null, the default 
     *  text "Select One" will be used for the first option
     * @param keysAsValues If true, Map keys are option values and Map values
     *  are display values; if false map values are option keys and map keys 
     *  are display values.
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     */
    public static String createSelect( String fieldName, 
                                       String selected, 
                                       Map values, 
                                       boolean showTop, 
                                       String topDisplay, 
                                       boolean keysAsValues,
                                       String tag_class,
                                       String tag_id) 
    {
        
        boolean testSelected = !TextConverter.isEmpty( selected );
        StringBuffer returnStr = new StringBuffer();
        String optionValue = null;
        String displayValue = null;

	String classAttr = "";
	if(tag_class != null && !tag_class.equals(""))
		classAttr = " class=\""+tag_class+"\"";

	String idAttr = "";
	if(tag_id != null && !tag_id.equals(""))
		idAttr = " id=\""+tag_id+"\"";

        returnStr.append( "<select name=\"" + fieldName + "\"" + classAttr + idAttr + ">\n" );

        // show default value as first option if desired
        if ( showTop ) {
            if ( !TextConverter.isEmpty( topDisplay ) ) {
                returnStr.append( "<option value=\"\">" + topDisplay + "</option>" );
            } else {
                returnStr.append( "<option value=\"\">Select One</option>" );
            }
        }

        Iterator iter = values.keySet().iterator();
        while ( iter.hasNext() ) {

            // determine how to render option values & display values of 
            // menu by keysAsValues
            if ( keysAsValues ) {
                optionValue = (String) iter.next();
                displayValue = (String) values.get( optionValue );
            } else {
                displayValue = (String) iter.next();
                optionValue = (String) values.get( displayValue );
            }
            returnStr.append( "<option value=\"" + optionValue + "\" " );
            if ( testSelected ) {
                if ( optionValue.equals( selected ) ) {
                    returnStr.append( "selected" );
                }
            }
            returnStr.append( ">" + displayValue + "</option>\n" );
        }
        returnStr.append( "</select>\n" );

        return returnStr.toString();
    }

  
    /**
     * Creates an HTML SELECT form field from the values submitted.  Form field 
     * is created to optionally allow multiple selections and to be of variable 
     * size.  If multiple selections are not allowed, but array of values to 
     * pre-select contains more than one option, top option will be selected
     *
     * <p>
     * This generic method is mostly used by other type-specific public methods,
     * however is itself public to allow for client code to create generic select
     * menus without defining a wrapper method.
     * 
     * @param fieldName The name to be given to the form field
     * @param selected The values that should show as pre-selected. If the array 
     *  is null or empty, no values will be pre-selected. If multiple selections 
     *  are not allowed, first value of this array will be selected
     * @param values A <code>Map</code> of the values to make options in the select 
     *  field.  Options are created using the Map's <code>String</code> key as the 
     *  option value, and the <code>String</code> value as the display value for the 
     *  HTML option
     * @param size The size of this menu. Size will determine how many elements 
     *  will be visible at one time.
     * @param multiple If <code>true</code> select box will allow multiple selections, 
     *  if <code>false</code> multiple selections will not be allowed.
     * @param topOption String value to use as top option in select menu
     * @param eventHandler Javascript event handler to insert into select menu opening 
     *  tag
     * @param keysAsValues If true, Map keys are option values and Map values are 
     *  display values; if false map values are option keys and map keys are display 
     *  values.
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createSelect( String fieldName, 
                                       String[] selected, 
                                       Map values, 
                                       int size, 
                                       boolean multiple, 
                                       String topOption, 
                                       String eventHandler, 
                                       boolean keysAsValues,
                                       String tag_class, 
                                       String tag_id) 
    {
	String classAttr = "";
	if(tag_class != null && !tag_class.equals(""))
		classAttr = " class=\""+tag_class+"\"";

	String idAttr = "";
	if(tag_id != null && !tag_id.equals(""))
		idAttr = " id=\""+tag_id+"\"";

        StringBuffer returnStr = new StringBuffer();
        returnStr.append( "<select name=\"" + fieldName + "\"" + classAttr + idAttr + " size=" + size );
        if ( multiple ) {
            returnStr.append( " multiple" );
        } 

        // append javascript event handler if submitted
        if ( !TextConverter.isEmpty( eventHandler ) ) {
            returnStr.append( " " + eventHandler );
        }

        returnStr.append( ">" );

        boolean testSelected = ( selected != null && selected.length > 0); 
        if ( !TextConverter.isEmpty( topOption ) ) {
            if ( !testSelected ) { // if nothing selected, select top option
                returnStr.append( "<option value=\"\" selected>" + topOption + "</option>" );
            } else {
                returnStr.append( "<option value=\"\">" + topOption + "</option>" );
            }
        }


        Iterator iter = values.keySet().iterator();
        String optionValue = null;
        String displayValue = null;

        while ( iter.hasNext() ) {

            // determine how to render option values & display values
            // of menu by keysAsValues
            if ( keysAsValues ) {
                optionValue = (String) iter.next();
                displayValue = (String) values.get( optionValue );
            } else {
                displayValue = (String) iter.next();
                optionValue = (String) values.get( displayValue );
            }

            returnStr.append( "<option value=\"" + optionValue + "\" " );
            if ( testSelected ) {
                if ( multiple ) {
                    for ( int i = 0; i < selected.length; i++ ) {
                        if ( optionValue.equals( selected[ i ] ) ) {
                            returnStr.append( "selected" );
                            break;
                        }
                    }
                } else if ( optionValue.equals( selected[ 0 ] ) ) {
                    returnStr.append( "selected" );
                }
            }
            returnStr.append( ">" + displayValue + "</option>\n" );
        }
        returnStr.append( "</select>\n" );
        return returnStr.toString();
    } 


    /**
     * Creates an HTML SELECT form field from the values submitted.  Form field is 
     * created to optionally allow multiple selections and to be of variable size. 
     * If multiple selections are not allowed, but array of values to pre-select 
     * contains more than one option, top option will be selected
     *
     * <p>
     * This generic method is mostly used by other type-specific public methods,
     * however is itself public to allow for client code to create generic select
     * menus without defining a wrapper method.
     *
     * @param fieldName The name to be given to the form field
     * @param selected The values that should show as pre-selected. If the array is 
     *  null or empty, no values will be pre-selected. If multiple selections are not 
     *  allowed, first value of this array will be selected
     * @param values An array of values to make options in the select field.  Options 
     *  are created using elements of values as both the option value and the display
     *  value for the HTML option
     * @param size The size of this menu. Size will determine how many elements will 
     *  be visible at one time.
     * @param multiple If <code>true</code> select box will allow multiple selections, 
     *  if <code>false</code> multiple selections will not be allowed.
     * @param eventHandler Javascript event handler to insert into select menu opening
     *  tag
     * @param topOption String value to use as top option in select menu
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createSelect( String fieldName, 
                                       String[] selected, 
                                       String[] values, 
                                       int size, 
                                       boolean multiple, 
                                       String topOption, 
                                       String eventHandler,
                                       String tag_class, 
                                       String tag_id) 
    {
	String classAttr = "";
	if(tag_class != null && !tag_class.equals(""))
		classAttr = " class=\""+tag_class+"\"";

	String idAttr = "";
	if(tag_id != null && !tag_id.equals(""))
		idAttr = " id=\""+tag_id+"\"";

        StringBuffer returnStr = new StringBuffer();
        returnStr.append( "<select name=\"" + fieldName + "\" size=\"" + size + "\"" + classAttr + idAttr );
        if ( multiple ) {
            returnStr.append( " multiple" );
        } 

        // append javascript event handler if submitted
        if ( !TextConverter.isEmpty( eventHandler ) ) {
            returnStr.append( " " + eventHandler );
        }

        returnStr.append( ">" );

        boolean testSelected = ( selected != null && selected.length > 0); 
        if ( !TextConverter.isEmpty( topOption ) ) {
            if ( !testSelected ) { // if nothing selected, select top option
                returnStr.append( "<option value=\"\" selected>" + topOption + "</option>\n" );
            } else {
                returnStr.append( "<option value=\"\">" + topOption + "</option>\n" );
            }
        }

        for ( int j = 0; j < values.length; j++ ) {
            returnStr.append( "<option value=\"" + values[ j ] + "\" " );

            if ( testSelected ) {
                if ( multiple ) {
                    for ( int i = 0; i < selected.length; i++ ) {
                        if ( values[ j ].equals( selected[ i ] ) ) {
                            returnStr.append( "selected" );
                            break;
                        }
                    }
                } else if ( values[ j ].equals( selected[ 0 ] ) ) {
                    returnStr.append( "selected" );
                }
            }
            returnStr.append( ">" + values[ j ] + "</option>\n" );
        }
        returnStr.append( "</select>\n" );
        return returnStr.toString();
    }


    /**
     * Creates an HTML SELECT form field from the values submitted
     *
     * <p>
     * This generic method is mostly used by other type-specific public methods,
     * however is itself public to allow for client code to create generic select
     * menus without defining a wrapper method.
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value 
     *  is null or empty, the top value of the menu will display
     * @param values An array of values to make options in the select field.  
     *  Options are created using elements of values as both the option value 
     *  and the display value for the HTML option
     * @param showTop If <code>true</code>, an empty first option will be created 
     *  in addition to the supplied values; if <code>false</code> the select menu 
     *  will only contain the options in Map of values
     * @param topDisplay <code>String</code> to use for top option's display. If 
     *  showTop is <code>true</code> and topDisplay is empty or null, the default 
     *  text "Select One" will  be used for the first option
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createSelect( String fieldName, 
                                       String selected, 
                                       String[] values, 
                                       boolean showTop, 
                                       String topDisplay,
                                       String tag_class, 
                                       String tag_id) 
    {
        boolean testSelected = ( selected == null ) ? false : true;

	String classAttr = "";
	if(tag_class != null && !tag_class.equals(""))
		classAttr = " class=\""+tag_class+"\"";

	String idAttr = "";
	if(tag_id != null && !tag_id.equals(""))
		idAttr = " id=\""+tag_id+"\"";

        StringBuffer returnStr = new StringBuffer();
        returnStr.append( "<select name=\"" + fieldName + "\"" + classAttr + idAttr + ">\n" );

        if ( showTop ) {
            if ( topDisplay != null && !topDisplay.trim().equals( "" ) ) {
                returnStr.append( "<option value=\"\">" + topDisplay + "</option>" );
            } else {
                returnStr.append( "<option value=\"\">Select One</option>" );
            }
        }

        for ( int i = 0; i < values.length; i++ ) {
            returnStr.append( "<option value=\"" + values[ i ] + "\" " );
            if ( testSelected ) {
                if ( values[ i ].equals( selected ) ) {
                    returnStr.append( "selected" );
                }
            }
            returnStr.append( ">" + values[ i ] + "</option>\n" );
        }
        returnStr.append( "</select>\n" );

        return returnStr.toString();
    }

    /**
     * Creates an HTML SELECT form field from the values submitted. 
     *
     * <p>
     * This generic method is mostly used by other type-specific public methods,
     * however is itself public to allow for client code to create generic select
     * menus without defining a wrapper method.
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value 
     *  is null or empty, the top value of the menu will display
     * @param values An array of values to make options in the select field. 
     *  Options are created using elements of values as the option value of the 
     *  HTML element.
     * @param keys An array of values to make options in the select field. 
     *  Options are created using elements of values as the option display value 
     *  of the HTML element.
     * @param showTop If <code>true</code>, an empty first option will be created
     *  in addition to the supplied values; if <code>false</code> the select menu 
     *  will only contain the options in Map of values
     * @param topDisplay <code>String</code> to use for top option's display. If 
     *  showTop is <code>true</code> and topDisplay is empty or null, the default 
     *  text "Select One" will be used for the first option
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createSelect( String fieldName, 
                                       String selected, 
                                       String[] values, 
                                       String[] keys,
                                       boolean showTop,
                                       String tag_class,
                                       String tag_id) 
    {
        boolean testSelected = ( selected == null ) ? false : true;

	String classAttr = "";
	if(tag_class != null && !tag_class.equals(""))
		classAttr = " class=\""+tag_class+"\"";

	String idAttr = "";
	if(tag_id != null && !tag_id.equals(""))
		idAttr = " id=\""+tag_id+"\"";

        StringBuffer returnStr = new StringBuffer();
        returnStr.append( "<select name=\"" + fieldName + "\"" + classAttr + idAttr + ">\n" );

        if ( showTop ) {
            returnStr.append( "<option value=\"\">Select One</option>" );
        }

        for ( int i = 0; i < values.length; i++ ) {
            returnStr.append( "<option value=\"" + values[ i ] + "\" " );
            if ( testSelected ) {
                if ( values[ i ].equals( selected ) ) {
                    returnStr.append( "selected" );
                }
            }
            returnStr.append( ">" + keys[ i ] + "</option>\n" );
        }
        returnStr.append( "</select>\n" );

        return returnStr.toString();
    }



    /**
     * Creates an HTML SELECT form field from the values submitted, optionally 
     * showing the supplied empty top value.  Select menu optionally uses Map 
     * keys as option values with Map values as option display values, or vice
     * versa depending on value of keysAsValues param.
     *
     * <p>
     * This generic method is mostly used by other type-specific public methods,
     * however is itself public to allow for client code to create generic select
     * menus without defining a wrapper method.
     * 
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value 
     * is null or empty, the top value of the menu will display
     * @param values An iterator that contains the values that should be used
     *  for each option. Should contain same number of entries as displays.
     * @param displays An iterator that contains the display values that should
     *  be sued for each option. Shoulc contain the same number of entries as
     *  the values param
     * @param breaks An iterator that contains the index of the select option that
     *  should have a blank field after it.
     * @param showTop If <code>true</code>, an empty first option will be created 
     *  in addition to the supplied values; if <code>false</code> the select menu 
     *  will only contain the options in Map of values 
     * @param topDisplay <code>String</code> to use for top option's display. If 
     *  showTop is <code>true</code> and topDisplay is empty or null, the default 
     *  text "Select One" will be used for the first option
     * @param keysAsValues If true, Map keys are option values and Map values
     *  are display values; if false map values are option keys and map keys 
     *  are display values.
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     */
    public static String createSelect( String fieldName,
                                       String selected,
                                       Iterator values,
				       Iterator displays,
				       Iterator breaks,
                                       boolean showTop,
                                       String topDisplay,
                                       String tag_class,
                                       String tag_id ) 
    {
        
        boolean testSelected = !TextConverter.isEmpty( selected );
        StringBuffer returnStr = new StringBuffer();
        String optionValue = null;
        String displayValue = null;

	String blank = "----------";
	Integer i = new Integer(0);
	Integer nextBreak = new Integer(-1);
	if (breaks.hasNext()) { nextBreak = (Integer) breaks.next(); }

	String classAttr = "";
	if(tag_class != null && !tag_class.equals(""))
		classAttr = " class=\""+tag_class+"\"";

	String idAttr = "";
	if(tag_id != null && !tag_id.equals(""))
		idAttr = " id=\""+tag_id+"\"";

        returnStr.append( "<select name=\"" + fieldName + "\"" + classAttr + idAttr + ">\n" );

        // show default value as first option if desired
        if ( showTop ) {
            if ( !TextConverter.isEmpty( topDisplay ) ) {
                returnStr.append( "<option value=\"\">" + topDisplay + "</option>" );
            } else {
                returnStr.append( "<option value=\"\">Select One</option>" );
            }
        }

        while ( values.hasNext() && displays.hasNext() ) {
	    boolean disabled = false;

	    if (i.equals(nextBreak)) {
		optionValue = blank;
		displayValue = blank;
		disabled = true;
		if (breaks.hasNext()) { 
		    nextBreak = (Integer) breaks.next(); 
		} else {
		    nextBreak = new Integer(-1);
		}
	    } else {
		optionValue = (String) values.next();
		displayValue = (String) displays.next();
		i = new Integer(i.intValue()+1);	    
	    }
		    
            returnStr.append( "<option value=\"" + optionValue + "\" " );
            if ( testSelected ) {
                if ( optionValue.equals( selected ) ) {
                    returnStr.append( " selected " );
                }
            }	    
	    if ( disabled ) {
		returnStr.append(" disabled ");
	    }

            returnStr.append( ">" + displayValue + "</option>\n" );
        }
        returnStr.append( "</select>\n" );

        return returnStr.toString();
    }
  
    /**
     * Creates an HTML SELECT form field of states in USA and Canada with requested
     * value pre-selected and optionally using default top option of "Select One".  
     * Menu options will have the state's abbreviation as their value, while display 
     * value will be full state name
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value is
     *  null or empty, the top value of the menu will display
     * @param showTop If <code>true</code>, an empty first option will be created in 
     *  addition to the supplied values; if <code>false</code> the select menu will
     *  only contain the options 
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createRegionSelect( String fieldName, 
                                             String selected, 
                                             boolean showTop,
                                             String tag_class, 
                                             String tag_id) 
    {
        // states stored as Display Value => Abbrev - make sure to render 
        // w/keys as display values, not option values
        boolean keysAsValues = false; 

        // force default top option
        String topOption = null;
        return createSelect( fieldName, 
                             selected, 
                             DataConstants.getMenuRegions(), 
                             showTop, 
                             topOption, 
                             keysAsValues,
                             tag_class,
                             tag_id);
    }


    /**
     * Creates an HTML SELECT form field of states in USA and Canada using supplied 
     * text as display for top option. Menu options will have the state's abbreviation
     * as their value, while display value will be full state name. State values are 
     * created using the REGIONS constant in <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value is
     *  null or empty, the top value of the menu will display
     * @param showTop If <code>true</code>, an empty first option will be created in 
     *  addition to the supplied values; if <code>false</code> the select menu will 
     *  only contain the options
     * @param topOption <code>String</code> to use for top option's display. If showTop 
     *  is <code>true</code> and topOption is empty or null, the default text "Select 
     *  One" will be used for the first option
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createRegionSelect( String fieldName, 
                                             String selected, 
                                             boolean showTop, 
                                             String topOption,
                                             String tag_class,
                                             String tag_id)
    {

        // states stored as Display Value => Abbrev - make sure to render 
        // w/keys as display values, not option values
        boolean keysAsValues = false; 

        return createSelect( fieldName, 
                             selected, 
                             DataConstants.getMenuRegions(), 
                             showTop, 
                             topOption, 
                             keysAsValues,
                             tag_class,
                             tag_id);
    }

    /**
     * Creates an HTML SELECT form field of states in USA and Canada with nothing 
     * pre-selected and optionally using default top option of "Select One" Menu 
     * options will have the state's abbreviation as their value, while display 
     * value will be full state name. State values are created using the REGIONS 
     * constant in <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param showTop If <code>true</code>, an empty first option will be created
     *  in addition to the supplied values; if <code>false</code> the select menu 
     *  will only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createRegionSelect( String fieldName, boolean showTop, String tag_class, String tag_id ) {
        String selected = null;

        // states stored as Display Value => Abbrev - make sure to render 
        // w/keys as display values, not option values
        boolean keysAsValues = false; 

        // force default top option
        String topOption = null;

        return createSelect( fieldName, 
                             selected, 
                             DataConstants.getMenuRegions(), 
                             showTop, 
                             topOption, 
                             keysAsValues,
                             tag_class,
                             tag_id);
    }

    /**
     * Creates an HTML SELECT form field of states in USA and Canada with nothing 
     * pre-selected, and using supplied text as display for top option. Menu options 
     * will have the state's abbreviation as their value, while display value will
     * be full state name. State values are created using the REGIONS constant 
     * in <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param showTop If <code>true</code>, an empty first option will be created in 
     *  addition to the supplied values; if <code>false</code> the select menu will 
     *  only contain the options
     * @param topOption <code>String</code> to use for top option's display. If 
     *  showTop is <code>true</code> and topOption is empty or null, the default 
     *  text "Select One" will be used for the first option
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createRegionSelect( String fieldName, 
                                             boolean showTop, 
                                             String topOption,
                                             String tag_class, 
                                             String tag_id) 
    {
        String selected = null;

        // states stored as Display Value => Abbrev - make sure to render w/keys 
        // as display values, not option values
        boolean keysAsValues = false; 

        return createSelect( fieldName, 
                             selected, 
                             DataConstants.getMenuRegions(), 
                             showTop, 
                             topOption, 
                             keysAsValues,
                             tag_class,
                             tag_id );
    }

    /**
     * Creates an HTML SELECT form field of countries with the requested value 
     * pre-selected and optionally  using default top option of "Select One".  
     * Menu options will have the country's name both as value and display.
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value
     *  is null or empty, the top value of the menu will display
     * @param showTop If <code>true</code>, an empty first option will be created in
     *  addition to the supplied values; if <code>false</code> the select menu will
     *  only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createCountrySelect( String fieldName, 
                                              String selected, 
                                              boolean showTop,
                                              String tag_class, 
                                              String tag_id) 
    {
      CountryDelegate delegate = CommunityDelegateFactory.getCountryDelegate();
      List<BsCountry> countries = delegate.getAllObjects(100);

        return createSelect( fieldName, 
                             selected, 
                             countries.toArray(new String[countries.size()]), 
                             showTop, 
                             "Select One",
                             tag_class,
                             tag_id);
    }


    /**
     * Creates an HTML SELECT form field of countries with nothing pre-selected and 
     * optionally using default top option of "Select One".  Menu options will have 
     * the country's name both as value and display. 
     *
     * @param fieldName The name to be given to the form field
     * @param showTop If <code>true</code>, an empty first option will be created in
     * addition to the supplied values; if <code>false</code> the select menu will 
     * only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createCountrySelect( String fieldName, boolean showTop, String tag_class, String tag_id ) {
        String selected = null;
        return createCountrySelect( fieldName, selected, showTop, tag_class, tag_id );
    }



    /**
     * Creates an HTML SELECT form field of countries with nothing pre-selected, 
     * and optionally using supplied text as display for top option. Menu 
     * options will have the country's name both as value and display.  
     *
     * @param fieldName The name to be given to the form field
     * @param showTop If <code>true</code>, an empty first option will be created 
     *  in addition to the supplied values; if <code>false</code> the select menu 
     *  will only contain the options
     * @param topOption <code>String</code> to use for top option's display. If 
     *  showTop is <code>true</code> and topOption is empty or null, the default 
     *  text "Select One" will be used for the first option
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createCountrySelect( String fieldName, 
                                              boolean showTop, 
                                              String topOption,
                                              String tag_class, 
                                              String tag_id) 
    {
        String selected = null;

        CountryDelegate delegate = CommunityDelegateFactory.getCountryDelegate();
        List<BsCountry> countries = delegate.getAllObjects(100);
        
        return createSelect( fieldName, 
                             selected, 
                             countries.toArray(new String[countries.size()]), 
                             showTop, 
                             topOption,
                             tag_class,
                             tag_id);
    }

  
    /**
     * Creates an HTML SELECT form field of organization types the requested value 
     * pre-selected, and optionally using the default top option of "Select One". Menu 
     * options will use the database value of the organization type as the option value, 
     * while using a formatted value as display. Organization type values are created 
     * using the ORG_TYPES constant in <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value is null
     *  or empty, the top value of the menu will display
     * @param showTop If <code>true</code>, an empty first option will be created in 
     *  addition to the supplied values; if <code>false</code> the select menu will 
     *  only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createOrgTypeSelect( String fieldName, 
                                              String selected, 
                                              boolean showTop,
                                              String tag_class, 
                                              String tag_id) 
    {
        return createSelect( fieldName, 
                             selected, 
                             DataConstants.getOrganizationTypes(), 
                             showTop, 
                             "Select One", 
                             true,
                             tag_class,
                             tag_id);
    } 


    /**
     * Creates an HTML SELECT form field of organization types with nothing pre-
     * selected, and optionally using the default top option of "Select One". Menu
     * options will use the database value of the organization type as the option 
     * value, while using a formatted value as display. Organization type values 
     * are created using the ORG_TYPES constant in <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param showTop If <code>true</code>, an empty first option will be created 
     *  in addition to the supplied values; if <code>false</code> the select menu 
     *  will only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createOrgTypeSelect( String fieldName, boolean showTop, String tag_class, String tag_id ) {
        String selected = null;
        return createOrgTypeSelect( fieldName, selected, showTop, tag_class, tag_id );
    }



    /**
     * Creates an HTML SELECT form field of organization types with nothing pre-selected,
     * and optionally using supplied text as display for top option. Menu options
     * will use the database value of the organization type as the option value,
     * while using a formatted value as display. Organization type values are created
     * using the ORG_TYPES constant in <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param showTop If <code>true</code>, an empty first option will be created 
     *  in addition to the supplied values; if <code>false</code> the select menu 
     *  will only contain the options
     * @param topOption <code>String</code> to use for top option's display. If showTop 
     *  is <code>true</code> and topOption is empty or null, the default text "Select 
     *  One" will be used for the first option
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createOrgTypeSelect( String fieldName, 
                                              boolean showTop, 
                                              String topOption,
                                              String tag_class, 
                                              String tag_id) 
    {
        String selected = null;
        return createSelect( fieldName, 
                             selected, 
                             DataConstants.getOrganizationTypes(), 
                             showTop, 
                             topOption, 
                             true,
                             tag_class,
                             tag_id);
    }


    /**
     * Creates an HTML SELECT form field of organization types with requested 
     * value pre-selected, optionally using default top option of "Select One", 
     * and optionally excluding the type "lab" from the list of organization 
     * types. Menu options will use the database value of the organization type
     * as the option value, while using a formatted value as display. Organization
     * type values are created using the ORG_TYPES constant in <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this 
     *  value is null or empty, the top value of the menu will display
     * @param showTop If <code>true</code>, an empty first option will be created
     *  in addition to the supplied values; if <code>false</code> the select menu
     *  will only contain the options
     * @param excludeLab If <code>true</code>, the menu will contain all 
     *  organization types except "lab"; if <code>false</code> menu will include 
     *  all organization types
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createOrgTypeSelect( String fieldName, 
                                              String selected, 
                                              boolean showTop, 
                                              boolean excludeLab,
                                              String tag_class, 
                                              String tag_id) 
    {
        if ( excludeLab ) {
            // make copy of static final constant & remove lab from list
            TreeMap noLab = new TreeMap( DataConstants.getOrganizationTypes() );
            noLab.remove( DataConstants.getLabType() );
            return createSelect( fieldName, 
                                 selected, 
                                 noLab, 
                                 showTop, 
                                 "Select One", 
                                 true,
                                 tag_class,
                                 tag_id);
        } else {
            return createSelect( fieldName, 
                                 selected, 
                                 DataConstants.getOrganizationTypes(), 
                                 showTop, 
                                 "Select One", 
                                 true,
                                 tag_class,
                                 tag_id);
        }
    }


    /**
     * Creates an HTML SELECT form field of organization types with nothing pre-selected, 
     * optionally using default top option of "Select One", and optionally excluding the 
     * type "lab" from the list of organization types. Menu options will use the database 
     * value of the organization type as the option value, while using a formatted value 
     * as display. Organization type values are created using the ORG_TYPES constant in 
     * <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value is null
     *  or empty, the top value of the menu will display
     * @param showTop If <code>true</code>, an empty first option will be created in 
     *  addition to the supplied values; if <code>false</code> the select menu will only
     *  contain the options
     * @param excludeLab If <code>true</code>, the menu will contain all organization 
     *  types except "lab"; if <code>false</code> menu will include all organization types
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createOrgTypeSelect( String fieldName, 
                                              boolean showTop, 
                                              boolean excludeLab,
                                              String tag_class, 
                                              String tag_id ) 
    {
        String selected = null;
        return createOrgTypeSelect( fieldName, selected, showTop, excludeLab, tag_class, tag_id);
    }



    /**
     * Creates an HTML SELECT form field of affiliation job titles with requested value 
     * pre-selected, optionally using default top option of "Select One". Menu options 
     * will use the job title as both the option value and display value. Job title values
     * are created using the AFFILIATION_TITLES constant in <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value is null
     *  or empty, the top value of the menu will display
     * @param showTop If <code>true</code>, an empty first option will be created in 
     *  addition to the supplied values; if <code>false</code> the select menu will only
     *  contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createTitleSelect( String fieldName, 
                                            String selected, 
                                            boolean showTop,
                                            String tag_class,
                                            String tag_id ) 
    {
        return createSelect( fieldName, 
                             selected, 
                             DataConstants.getAffiliationTitles(), 
                             showTop, 
                             "Select One",
                             tag_class,
                             tag_id);
    }


    /**
     * Creates an HTML SELECT form field of affiliation job titles with nothing 
     * pre-selected, and optionally using supplied text as display for top option. 
     * Menu options will use the value of job title as both option value and display
     * value. Job title values are created using the AFFILIATION_TITLES constant
     * in <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param showTop If <code>true</code>, an empty first option will be created 
     *  in addition to the supplied values; if <code>false</code> the select menu 
     *  will only contain the options
     * @param topOption <code>String</code> to use for top option's display. If 
     *  showTop is <code>true</code> and topOption is empty or null, the default 
     *  text "Select One" will be used for the first option
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createTitleSelect( String fieldName, 
                                            boolean showTop,
                                            String topOption,
                                            String tag_class, 
                                            String tag_id ) 
    {
        String selected = null;
        return createSelect( fieldName, 
                             selected, 
                             DataConstants.getAffiliationTitles(), 
                             showTop, 
                             topOption,
                             tag_class,
                             tag_id );
    }


    /**
     * Creates an HTML SELECT form field of community statuses with requested 
     * value pre-selected, optionally using default top option of "Select One". 
     * Menu options will use the status as both the option value and display 
     * value. Job title values are created using the STATUS_CODES constant in 
     * <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value
     *  is null or empty, the top value of the menu will display
     * @param showTop If <code>true</code>, an empty first option will be created
     *  in addition to the supplied values; if <code>false</code> the select menu
     *  will only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createStatusSelect( String fieldName, 
                                             String selected, 
                                             boolean showTop,
                                             String tag_class, 
                                             String tag_id ) 
    {
        return createSelect( fieldName, 
                             selected, 
                             DataConstants.getStatusCodes(), 
                             showTop, 
                             "Select One",
                             tag_class,
                             tag_id );
    }


    /**
     * Creates an HTML SELECT form field of community statuses with nothing 
     * pre-selected, optionally using supplied text display for top option. Menu 
     * options will use the status as both the option value and display value.
     * Job title values are created using the STATUS_CODES constant in 
     * <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param showTop If <code>true</code>, an empty first option will be 
     *  created in addition to the supplied values; if <code>false</code> the 
     *  select menu will only contain the options
     * @param topOption <code>String</code> to use for top option's display. If
     *  showTop is <code>true</code> and topOption
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createStatusSelect( String fieldName, 
                                             boolean showTop, 
                                             String topOption,
                                             String tag_class, 
                                             String tag_id ) 
    {
        String selected = null;
        return createSelect( fieldName, 
                             selected, 
                             DataConstants.getStatusCodes(), 
                             showTop, 
                             topOption,
                             tag_class,
                             tag_id );
    }


    /**
     * Creates an HTML SELECT form field of community statuses with requested value
     * pre-selected, optionally using supplied text display for top option. Menu 
     * options will use the status as both the option value and display value.
     * Job title values are created using the STATUS_CODES constant in 
     * <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value 
     *  is null or empty, the top value of the menu will display
     * @param showTop If <code>true</code>, an empty first option will be created 
     *  in addition to the supplied values; if <code>false</code> the select menu 
     *  will only contain the options
     * @param topOption <code>String</code> to use for top option's display. If 
     *  showTop is <code>true</code> and topOption
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createStatusSelect( String fieldName, 
                                             String selected,
                                             boolean showTop, 
                                             String topOption,
                                             String tag_class, 
                                             String tag_id ) 
    {
        return createSelect( fieldName, 
                             selected, 
                             DataConstants.getStatusCodes(), 
                             showTop, 
                             topOption,
                             tag_class,
                             tag_id );
    }


    /**
     * Creates an HTML SELECT form field of search methods (contains, starts with
     * etc.) with requested value pre-selected, optionally using default top option 
     * of "Select One". Menu options will use the status as both the option value 
     * and display value. Search methods are created using the SEARCH_METHODS constant
     * in <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value is
     *  null or empty, the top value of the menu will display
     * @param showTop If <code>true</code>, an empty first option will be created in 
     *  addition to the supplied values; if <code>false</code> the select menu will
     *  only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     * @see DataConstants#SEARCH_METHODS
     */
    public static String createSearchMethodSelect( String fieldName, 
                                                   String selected, 
                                                   boolean showTop,
                                                   String tag_class, 
                                                   String tag_id ) 
    {
        return createSelect( fieldName, 
                             selected, 
                             DataConstants.SEARCH_METHODS, 
                             showTop, 
                             "Select One", 
                             true,
                             tag_class,
                             tag_id );
    }

    /**
     * Creates an HTML SELECT form field of order status codes with requested value
     * pre-selected, optionally using supplied text for top option. Menu options
     * will use the status as both the option value and display value.Status values
     * are created using the ORDER_STATUS_CODES constant in <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value 
     *  is null or empty, the top value of the menu will display
     * @param showTop If <code>true</code>, an empty first option will be created in 
     *  addition to the supplied values; if <code>false</code> the select menu will 
     *  only contain the options
     * @param topOption <code>String</code> to use for top option's display. If 
     *  showTop is <code>true</code> and topOption is not <code>null</code>
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createOrderStatusSelect( String fieldName, 
                                                  String selected, 
                                                  boolean showTop, 
                                                  String topOption,
                                                  String tag_class, 
                                                  String tag_id ) 
    {
        return createSelect( fieldName, 
                             selected, 
                             DataConstants.getOrderStatusCodes(), 
                             showTop, 
                             topOption,
                             tag_class,
                             tag_id );
    }

    /**
     * Creates an HTML SELECT form field of stock item status codes with requested 
     * value pre-selected, optionally using supplied text for top option. Menu options
     * will use the status as both the option value and display value. Status values 
     * are created using the STOCK_STATUS_CODES constant in <code>DataConstants</code>
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value is 
     *  null or empty, the top value of the menu will display
     * @param showTop If <code>true</code>, an empty first option will be created in 
     *  addition to the supplied values; if <code>false</code> the select menu will 
     *  only contain the options
     * @param topOption <code>String</code> to use for top option's display. If 
     *  showTop is <code>true</code> and topOption is not <code>null</code>
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createStockStatusSelect( String fieldName, 
                                                  String selected, 
                                                  boolean showTop, 
                                                  String topOption,
                                                  String tag_class, 
                                                  String tag_id ) 
    {
        return createSelect( fieldName, 
                             selected, 
                             DataConstants.getStockStatusCodes(), 
                             showTop, 
                             topOption,
                             tag_class,
                             tag_id );
    }

    /**
     * Creates an HTML SELECT form field of stock charge waiver codes with 
     * requested value pre-selected, optionally using default top option of 
     * "Select One". Menu options values are created using "no charge" constants 
     * in <code>DataConstants</code> with a formatted string for display.
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value 
     *  is null or empty, the top value of the menu will display
     * @param showTop If <code>true</code>, an empty first option will be created 
     *  in addition to the supplied values; if <code>false</code> the select menu 
     *  will only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createWaiveChargeSelect( String fieldName, 
                                                  String selected, 
                                                  boolean showTop, 
                                                  boolean fullListing,
                                                  String tag_class, 
                                                  String tag_id) 
    {
        String[] keys = null;
        String [] values = null;
    
        if ( fullListing ) {
            keys = new String[] { "No Waiver","Follow Up", "Reship", "Curator" };
            values = new String[] { DataConstants.getNoWaiver(), 
                                        DataConstants.getFollowUpNoCharge(), 
                                        DataConstants.getReshipNoCharge(), 
                                        DataConstants.getCuratorNoCharge()
                                        };
        } else {
            keys = new String[] { "Follow Up", "Reship", "Curator" };
            values = new String[] { DataConstants.getFollowUpNoCharge(), 
                                        DataConstants.getReshipNoCharge(), 
                                        DataConstants.getCuratorNoCharge()
                                        };
        }

        return createSelect( fieldName, selected, values, keys, showTop, tag_class, tag_id );
    }



    /**
     * Creates an HTML SELECT form field of seed stock centers with requested value 
     * pre-selected, optionally using default top option of "Select One". 
     *
     * @param fieldName The name to be given to the form field
     * @param selected The value that should show as pre-selected. If this value
     *  is null or empty, the top value of the menu will display
     * @param showTop If <code>true</code>, an empty first option will be created in 
     *  addition to the supplied values; if <code>false</code> the select menu will 
     *  only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createStockCenterSelect( String fieldName, 
                                                  String selected, 
                                                  boolean showTop,
                                                  String tag_class,
                                                  String tag_id) 
    {
        String[] keys = new String[] { "ABRC", "NASC" };
        return createSelect( fieldName, selected, keys, showTop, "Select One", tag_class, tag_id );
    }


    /**
     * Creates an HTML SELECT form field of stock types with requested value 
     * pre-selected, optionally using default top option of "Select One". This 
     * method dynamically creates select from all values in the StockType table, 
     * using the stock type as display value and stock type id as option value, 
     * and assumes that DBReadManager connection pool has already been initialized 
     * (which should normally happen when any servlet initializes)
     *
     * @param fieldName The name to be given to the form field
     * @param selected The option value that should show as pre-selected. If this 
     *  value is null or empty, the top value of the menu will display. This value 
     *  corresponds to the stock_type_id in the database
     * @param showTop If <code>true</code>, an empty first option will be created in 
     *  addition to the supplied values; if <code>false</code> the select menu will
     *  only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createStockOrderTypeSelect( String fieldName, 
                                                     String selected, 
                                                     boolean showTop,
                                                     String tag_class,
                                                     String tag_id) 
        throws SQLException {

        String[] stockOrderTypes = DynamicData.getStockOrderTypes();
        return createSelect( fieldName, 
                             selected, 
                             stockOrderTypes, 
                             showTop, 
                             "Select One",
                             tag_class, tag_id );
    }

    /**
     * Creates an HTML SELECT form field of stock availability types with requested 
     * value pre-selected, optionally using default top option of "Select One". This 
     * method dynamically creates select from all values in the StockAvailabilityType
     * table, using the stock availability type as display value and stock availability
     * type id as option value, and assumes that DBReadManager connection pool has 
     * already been initialized (which should normally happen when any servlet initializes)
     *
     *
     * @param fieldName The name to be given to the form field
     * @param selected The option value that should show as pre-selected. If this 
     *  value is null or empty, the top value of the menu will display. This value 
     *  corresponds to the stock_availability_type_id in the database
     * @param showTop If <code>true</code>, an empty first option will be created in 
     *  addition to the supplied values; if <code>false</code> the select menu will
     *  only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createStockAvailabilitySelect( String fieldName, 
                                                        String selected, 
                                                        boolean showTop,
                                                        String tag_class,
                                                        String tag_id ) 
        throws SQLException {

        TreeMap stockTypes = null;
        DBconnection conn = null;
        DBReadManager connectionPool = null;
        ResultSet results = null;
        String query = null;
    
        try {
            query = 
                "SELECT stock_availability_type_id, stock_availability_type " +
                "FROM StockAvailabilityType";
            connectionPool = DBReadManager.getInstance();
            conn = connectionPool.get_connection();
            conn.setQuery( query );
            results = conn.getResultSet();
            while ( results.next() ) {
                if ( stockTypes == null ) {
                    stockTypes = new TreeMap();
                }
                stockTypes.put( results.getString( "stock_availability_type_id" ), 
                                results.getString( "stock_availability_type" ) );
            }
            conn.releaseResources();

        } finally {
            if ( conn != null ) {
                connectionPool.return_connection( conn );
            }
        }

        return createSelect( fieldName, 
                             selected, 
                             stockTypes, 
                             showTop, 
                             "Select One", 
                             true, tag_class, tag_id );
    }


    /**
     * Creates an HTML SELECT form field of stock types with requested value 
     * pre-selected, optionally using default top option of "Select One". This 
     * method dynamically creates select from all values in the StockType table, 
     * using the stock type as display value and stock type id as option value, 
     * and assumes that DBReadManager connection pool has already been initialized 
     * (which should normally happen  when any servlet initializes)
     *
     *
     * @param fieldName The name to be given to the form field
     * @param selected The option value that should show as pre-selected.
     *  If this value is null or empty, the top value of the menu will display. 
     *  This value corresponds to the stock_type_id in the database
     * @param showTop If <code>true</code>, an empty first option will be created 
     *  in addition to the supplied values; if <code>false</code> the select menu 
     *  will only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createStockTypeSelect( String fieldName, 
                                                String selected, 
                                                boolean showTop,
                                                String tag_class,
                                                String tag_id ) 
        throws SQLException {
        
        TreeMap stockTypes = null;
        DBconnection conn = null;
        DBReadManager connectionPool = null;
        ResultSet results = null;
        String query = null;
    
        try {
            query = 
                "SELECT stock_type_id, stock_type " +
                "FROM StockType " +
                "ORDER BY stock_type";
            connectionPool = DBReadManager.getInstance();
            conn = connectionPool.get_connection();
            conn.setQuery( query );
            results = conn.getResultSet();
            while ( results.next() ) {
                if ( stockTypes == null ) {
                    stockTypes = new TreeMap();
                }
                stockTypes.put( results.getString( "stock_type_id" ), 
                                results.getString( "stock_type" ) );
            }
            conn.releaseResources();

        } finally {
            if ( conn != null ) {
                connectionPool.return_connection( conn );
            }
        }

        return createSelect( fieldName, 
                             selected, 
                             stockTypes, 
                             showTop, 
                             "Select One", 
                             true, tag_class, tag_id );
    }




    /**
     * Creates an HTML SELECT form field of species variants that are associated
     * to at least one germplasm record. Select menu is created with requested 
     * value pre-selected, optionally using default top option of "Select One".
     * This method also allows client code to insert a javascript event handler
     * in the select menu's opening tag. This is useful for calling page-specific
     * js functions, such as ensuring that if "Any" is checked, no other options
     * are selected as well.
     *
     * <p>
     * Collection of species variants is retrieved from <code>DynamicData</code>
     * which uses <code>DataPopulatorThread</code> to periodically refresh the data.
     *
     * @param fieldName The name to be given to the form field
     * @param size Menu size (number of options to display)
     * @param topOption Display text to use for top option
     * @param eventHandler Javascript event handler string to insert in select 
     *  menu's opening tag
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     * @throws SQLException thrown if a database error occurs while retrieving
     *  menu values
     */
    public static String createGermplasmSpeciesVariantSelect( String fieldName, 
                                                              int size, 
                                                              String topOption, 
                                                              String eventHandler,
                                                              String tag_class,
                                                              String tag_id  ) 
        throws SQLException {

        String[] germplasmSpeciesVariants = DynamicData.getGermplasmSpeciesVariants();
        String[] selected = null;
        return createSelect( fieldName, 
                             selected, 
                             germplasmSpeciesVariants, 
                             size, 
                             true, 
                             topOption, 
                             eventHandler, tag_class, tag_id );
    }


    /**
     * Creates an HTML SELECT form field of distinct country names in the species
     * variant table. Select menu is created with requested value pre-selected, 
     * optionally using default top option of "Select One". This method gets the 
     * collection of countries from <code>DynamicData</code> which uses 
     * <code>DataPopulatorThread</code> to periodically refresh the data.
     *
     * @param fieldName The name to be given to the form field
     * @param selected The option value that should show as pre-selected. If this
     *  value is null or empty, the top value of the menu will display. This value
     *  corresponds to the stock_availability_type_id in the database
     * @param showTop If <code>true</code>, an empty first option will be created 
     *  in addition to the supplied values; if <code>false</code> the select menu 
     *  will only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     * @throws SQLException thrown if a database error occurs while retrieving countries.
     */
    public static String createSpeciesVariantCountrySelect( String fieldName, 
                                                            String selected, 
                                                            boolean showTop, 
                                                            String tag_class,
                                                            String tag_id)
        throws SQLException {

        String[] countries = DynamicData.getSpeciesVariantCountries();
        return createSelect( fieldName, selected, countries, showTop, "Select One", tag_class, tag_id );
    }

    /**
     * Creates an HTML SELECT form field of month names with requested month number
     * pre-selected, optionally using default top option of "Select One". Month 
     * select is created with month name as display value and calendar month number
     * as option value.
     *
     * @param fieldName The name to be given to the form field
     * @param selected The option value that should show as pre-selected. If this
     *  value is null or empty, the top value of the menu will display.
     * @param showTop If <code>true</code>, an empty first option will be created 
     *  in addition to the supplied values; if <code>false</code> the select menu 
     *  will only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     */
    public static String createMonthSelect( String fieldName,
                                            String selected,
                                            boolean showTop, 
                                            String tag_class,
                                            String tag_id ) {
        
        String[] numbers = new String[] { "1",
                                          "2",
                                          "3",
                                          "4",
                                          "5",
                                          "6",
                                          "7",
                                          "8",
                                          "9",
                                          "10",
                                          "11",
                                          "12" };
        String[] names = new String[] { "January",
                                        "February",
                                        "March",
                                        "April",
                                        "May",
                                        "June",
                                        "July",
                                        "August",
                                        "September",
                                        "October",
                                        "November",
                                        "December" };
        
        return createSelect( fieldName, selected, numbers, names, showTop, tag_class, tag_id );
    }
    
    /**
     * Creates an HTML SELECT form field of taxons that are associated to at least
     * one species variant record. Select menu is created with requested value 
     * pre-selected, optionally using default top option of "Select One". This 
     * method gets the collection of taxons from DynamicData which uses 
     * DataPopulatorThread to periodically refresh the data. 
     *
     * @param fieldName - The name to be given to the form field
     * @param selected - The option value that should show as pre-selected. If 
     *  this value is null or empty, the top value of the menu will display. This
     *  value corresponds to the taxon_id in the database
     * @param showTop - If true, an empty first option will be created in addition 
     *  to the supplied values; if false the select  menu will only contain the options
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return String containing HTML to create the select form field
     * @throws SQLException thrown if a database error occurs while retrieving taxons.
     */
    public static String createSpeciesVariantTaxonSelect( String fieldName,
                                                          String selected, 
                                                          boolean showTop, 
                                                          String tag_class,
                                                          String tag_id ) 
        throws SQLException {

        Map taxons = DynamicData.getSpeciesVariantTaxons();
        return createSelect( fieldName, 
                             selected, 
                             taxons, 
                             showTop, 
                             "Select One", 
                             false, tag_class, tag_id );
    }

    /**
     * Creates an HTML SELECT form field of experiment categories (keywords that 
     * are associated to at least one expression set with relationship type = 
     * 'experiment category'. Select menu is created to allow multiple selections,
     * using supplied top option. Menu size will be made to show all entries retrieved
     * from the database. This method also allows client code to insert a javascript 
     * event handler in the select menu's opening tag. This is useful for calling 
     * page-specific js functions, such as ensuring that if "Any" is checked, no 
     * other options are selected.
     *
     * <p>
     * This method gets the collection of keywords from DynamicData which uses 
     * DataPopulatorThread to periodically refresh the  data. Select menu will have 
     * keyword_id as option value, with keyword itself as display text for each option.
     *
     * @param fieldName The name to be given to the form field
     * @param topOption Display text to use for top option
     * @param eventHandler Javascript event handler string to insert in select menu's 
     *  opening tag
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     * @throws SQLException thrown if a database error occurs while retrieving menu values
     */
    public static String createExperimentCategorySelect( String fieldName, 
                                                         String topOption, 
                                                         String eventHandler, 
                                                         String tag_class,
                                                         String tag_id ) 
        throws SQLException {

        Map categories = DynamicData.getExperimentCategories();
        int size = categories.size() + 1; // # of entries plus topOption
        String[] selected = null;
        return createSelect( fieldName, 
                             selected, 
                             categories, 
                             size, 
                             true, 
                             topOption, 
                             eventHandler, 
                             false, tag_class, tag_id );
    }

    /**
     * Creates an HTML SELECT form field of experiment categories (keywords that 
     * are associated to at least one expression set with relationship type = 
     * 'experiment category.
     *
     * <p>
     * This method is identical to other createExperimentCategorySelect, except
     * that it allows the ability to submit an array of option values that should
     * appear pre-selected, and allows the size of select menu to be specified
     *
     * 
     * @param fieldName The name to be given to the form field
     * @param topOption Display text to use for top option
     * @param selected Array of options to display as pre-selected
     * @param size Number of entries to show in menu
     * @param eventHandler Javascript event handler string to insert in select menu's 
     *  opening tag
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create the select form field
     * @throws SQLException thrown if a database error occurs while retrieving menu values
     */
    public static String createExperimentCategorySelect( String fieldName, 
                                                         String topOption, 
                                                         String[] selected,
                                                         int size,
                                                         String eventHandler, 
                                                         String tag_class,
                                                         String tag_id ) 

        throws SQLException {

        Map categories = DynamicData.getExperimentCategories();
        return createSelect( fieldName, 
                             selected, 
                             categories, 
                             size, 
                             true, 
                             topOption, 
                             eventHandler, 
                             false, tag_class, tag_id );
    }

    /**
     * Creates an HTML SELECT form field of Protocol keywords 
     *
     * <p>
     * @param fieldName The name to be given to the form field
     * @param topOption Display text to use for top option
     * @param size Number of entries to show in menu
     * @param eventHandler Javascript event handler string to 
     * insert in select menu's opening tag
     * @param tag_class The string to use for the class attribute (if empty, no class attribute will be include)
     * @param tag_class The string to use for the id attribute (if empty, no id attribute will be include)
     * @return <code>String</code> containing HTML to create 
     *  the select form field
     * @throws SQLException thrown if a database error occurs 
     * while retrieving menu values
     */
    public static String createProtocolKeywordSelect( String fieldName, 
						      String topOption, 
						      int size, 
                                                      String tag_class,
                                                      String tag_id ) 

        throws SQLException {

        Map kws = DynamicData.getProtocolKeywords();
        return createSelect( fieldName, 
                             null, // no options pre-selected
                             kws, 
                             size, 
                             true, // allow multiple selection
                             topOption, 
                             null, // no javascript event handler 
                             true, // use map keys as option values
                             tag_class, tag_id );
    }

    /**
     * Creates an HTML SELECT form field based on info from the FASTA_META_CONF_FILE, 
     * that is set in ${HOME}/conf/SysProperties.prop. Select menu uses the name field
     * of the FASTA_META_CONF_FILE file as the option value with the description field 
     * as the display value.
     *


     * @see createSelect for argument meanings
     */
    public static String createFastaSelect( String fieldName,
					    String selected,
					    boolean showTop,
					    String topDisplay,
					    String tag_class,
					    String tag_id ) 

	throws InvalidParameterException {

	FastaMetaDataInfo info = new FastaMetaDataInfo();
	FastaMetaData data;

	Iterator dataSet = info.getDataIterator();
	List names = new LinkedList();
	List displays = new LinkedList();

	while (dataSet.hasNext()) {
	    data = (FastaMetaData) dataSet.next();
	    names.add(data.getName());
	    displays.add(data.getDescription());
	}

	return createSelect( fieldName,
			     selected,
			     names.iterator(),
			     displays.iterator(),
			     info.getBreakIterator(),
			     showTop,
			     topDisplay,
			     tag_class,
			     tag_id );

    }

}
