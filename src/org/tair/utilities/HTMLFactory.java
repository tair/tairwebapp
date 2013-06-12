// ------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.
// $Revision: 1.71 $
// $Date: 2006/03/08 16:27:57 $
// ------------------------------------------------------------------------------

package org.tair.utilities;


import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.tair.bs.community.BsCountry;
import org.tair.bs.community.BsUrl;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.CountryDelegate;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;


/**
 * HTMLFactory is a utility class for creating commonly used HTML elements.
 * HTMLFactory offers a consistent interface for creating an HTML SELECT menu of
 * countries for instance. Many elements are created using constant values
 * stored in <code>DataConstants</code> to ensure consistency across the
 * application.
 * 
 * @see DataConstants
 */

public class HTMLFactory {

  /**
   * Creates an HTML SELECT form field from the values submitted, optionally
   * showing the supplied empty top value. Select menu optionally uses Map keys
   * as option values with Map values as option display values, or vice versa
   * depending on value of keysAsValues param.
   * 
   * <p>
   * This generic method is mostly used by other type-specific public methods,
   * however is itself public to allow for client code to create generic select
   * menus without defining a wrapper method.
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu will display
   * @param values A <code>Map</code> of the values to make options in the
   *          select field.
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options in Map of values
   * @param topDisplay <code>String</code> to use for top option's display. If
   *          showTop is <code>true</code> and topDisplay is empty or null, the
   *          default text "Select One" will be used for the first option
   * @param keysAsValues If true, Map keys are option values and Map values are
   *          display values; if false map values are option keys and map keys
   *          are display values.
   */
  public static String createSelect( String fieldName, 
                                     String selected, 
                                     Map<String, String> values, 
                                     boolean showTop, 
                                     String topDisplay, 
                                     boolean keysAsValues ) 
  {
    boolean testSelected = !TextConverter.isEmpty(selected);
    StringBuffer returnStr = new StringBuffer();
    String optionValue = null;
    String displayValue = null;

    returnStr.append("<select name=\"" + fieldName + "\">\n");

    // show default value as first option if desired
    if (showTop) {
      if (!TextConverter.isEmpty(topDisplay)) {
        returnStr.append("<option value=\"\">" + topDisplay + "</option>");
      } else {
        returnStr.append("<option value=\"\">Select One</option>");
      }
    }

    Iterator<String> iter = values.keySet().iterator();
    while (iter.hasNext()) {

      // determine how to render option values & display values of
      // menu by keysAsValues
      if (keysAsValues) {
        optionValue = iter.next();
        displayValue = values.get(optionValue);
      } else {
        displayValue = iter.next();
        optionValue = values.get(displayValue);
      }
      returnStr.append("<option value=\"" + optionValue + "\" ");
      if (testSelected) {
        if (optionValue.equals(selected)) {
          returnStr.append("selected");
        }
      }
      returnStr.append(">" + displayValue + "</option>\n");
    }
    returnStr.append("</select>\n");

    return returnStr.toString();
  }

  /**
   * <p>
   * Create an HTML &lt;select&gt; tag from the values submitted, optionally
   * showing the supplied empty top value. The displayed value is the scientific
   * name for the taxon; the code value is the taxon id.
   * </p>
   * <p>
   * This specific method works for the Germplasm search page. It includes two
   * lines after the selected entry, one for "not" Arabidopsis, and one for
   * "Hybrid."
   * </p>
   * 
   * @param fieldName The name for the form &lt;select&gt; control
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu displays
   * @param values A <code>List</code> of the taxons for the &lt;select&gt;
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options in the <code>List</code>
   * @param topDisplay <code>String</code> to use for top option's display. If
   *          showTop is <code>true</code> and topDisplay is empty or null, the
   *          default text "Select One" will be used for the first option
   * @return a <code>String</code> containing the entire &lt;select&gt; tag
   */
  public static String createGermplasmTaxonSelect(
                                                  String fieldName,
                                                  String selected,
                                                  List<DataPopulatorThread.Taxon> values,
                                                  boolean showTop,
                                                  String topDisplay) {

    boolean testSelected = !TextConverter.isEmpty(selected);

    StringBuilder returnStr = new StringBuilder("<select name=\"");
    returnStr.append(fieldName);
    returnStr.append("\">\n");

    // show default value as first option if desired
    if (showTop) {
      if (!TextConverter.isEmpty(topDisplay)) {
        returnStr.append("<option value=\"\">");
        returnStr.append(topDisplay);
        returnStr.append("</option>");
      } else {
        returnStr.append("<option value=\"\">Select One</option>");
      }
    }

    for (DataPopulatorThread.Taxon taxon : values) {
      returnStr.append("<option value=\"");
      returnStr.append(taxon.getTaxonId());
      returnStr.append("\"");
      if (testSelected && taxon.getTaxonId().equals(selected)) {
        returnStr.append(" selected");
      }
      returnStr.append(">");
      returnStr.append(taxon.getScientificName());
      returnStr.append("</option>\n");
      if (testSelected && taxon.getTaxonId().equals(selected)) {
        // Add the two non-taxon options right after the selected one
        returnStr.append("<option value=\"not_a_thaliana\">not Arabidopsis thaliana</option>\n");
        returnStr.append("<option value=\"hybrid\">Hybrid</option>\n");
      }
    }
    returnStr.append("</select>\n");

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
   */
  public static String createSpeciesSelect( String fieldName, 
                                     String selected, 
                                     Map<String, String> values, 
                                     boolean showTop, 
                                     String topDisplay, 
                                     boolean keysAsValues ) 
  {
      
      boolean testSelected = !TextConverter.isEmpty( selected );
      StringBuffer returnStr = new StringBuffer();
      String optionValue = null;
      String displayValue = null;

      returnStr.append( "<select name=\"" + fieldName + "\">\n" );

      // show default value as first option if desired
      if ( showTop ) {
          if ( !TextConverter.isEmpty( topDisplay ) ) {
              returnStr.append( "<option value=\"\">" + topDisplay + "</option>" );
          } else {
              returnStr.append( "<option value=\"\">Select One</option>" );
          }
      }

      Iterator<String> iter = values.keySet().iterator();
      while ( iter.hasNext() ) {

          // determine how to render option values & display values of 
          // menu by keysAsValues
          if ( keysAsValues ) {
              optionValue = iter.next();
              displayValue = values.get( optionValue );
          } else {
              displayValue = iter.next();
              optionValue = values.get( displayValue );
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
   * Creates an HTML SELECT form field from the values submitted. Form field is
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
   * @param selected The values that should show as pre-selected. If the array
   *          is null or empty, no values will be pre-selected. If multiple
   *          selections are not allowed, first value of this array will be
   *          selected
   * @param values A <code>Map</code> of the values to make options in the
   *          select field. Options are created using the Map's
   *          <code>String</code> key as the option value, and the
   *          <code>String</code> value as the display value for the HTML option
   * @param size The size of this menu. Size will determine how many elements
   *          will be visible at one time.
   * @param multiple If <code>true</code> select box will allow multiple
   *          selections, if <code>false</code> multiple selections will not be
   *          allowed.
   * @param topOption String value to use as top option in select menu
   * @param eventHandler Javascript event handler to insert into select menu
   *          opening tag
   * @param keysAsValues If true, Map keys are option values and Map values are
   *          display values; if false map values are option keys and map keys
   *          are display values.
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createSelect(String fieldName, List<String> selected,
                                    Map values, int size, boolean multiple,
                                    String topOption, String eventHandler,
                                    boolean keysAsValues) {
    StringBuffer returnStr = new StringBuffer();
    returnStr.append("<select name=\"" + fieldName + "\" size=" + size);
    if (multiple) {
      returnStr.append(" multiple");
    }

    // append javascript event handler if submitted
    if (!TextConverter.isEmpty(eventHandler)) {
      returnStr.append(" " + eventHandler);
    }

    returnStr.append(">");

    boolean testSelected = (selected != null && selected.size() > 0);
    if (!TextConverter.isEmpty(topOption)) {
      if (!testSelected) { // if nothing selected, select top option
        returnStr.append("<option value=\"\" selected>" + topOption
                         + "</option>");
      } else {
        returnStr.append("<option value=\"\">" + topOption + "</option>");
      }
    }

    Iterator iter = values.keySet().iterator();
    String optionValue = null;
    String displayValue = null;

    while (iter.hasNext()) {

      // determine how to render option values & display values
      // of menu by keysAsValues
      if (keysAsValues) {
        optionValue = (String)iter.next();
        displayValue = (String)values.get(optionValue);
      } else {
        displayValue = (String)iter.next();
        optionValue = (String)values.get(displayValue);
      }

      returnStr.append("<option value=\"" + optionValue + "\" ");
      if (testSelected) {
        if (multiple) {
          for (String s : selected) {
            if (optionValue.equals(s)) {
              returnStr.append("selected");
              break;
            }
          }
        } else if (optionValue.equals(selected.get(0))) {
          returnStr.append("selected");
        }
      }
      returnStr.append(">" + displayValue + "</option>\n");
    }
    returnStr.append("</select>\n");
    return returnStr.toString();
  }

  /**
   * Creates an HTML SELECT form field from the values submitted. Form field is
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
   * @param selected The values that should show as pre-selected. If the array
   *          is null or empty, no values will be pre-selected. If multiple
   *          selections are not allowed, first value of this array will be
   *          selected
   * @param values An array of values to make options in the select field.
   *          Options are created using elements of values as both the option
   *          value and the display value for the HTML option
   * @param size The size of this menu. Size will determine how many elements
   *          will be visible at one time.
   * @param multiple If <code>true</code> select box will allow multiple
   *          selections, if <code>false</code> multiple selections will not be
   *          allowed.
   * @param eventHandler Javascript event handler to insert into select menu
   *          opening tag
   * @param topOption String value to use as top option in select menu
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createSelect(String fieldName, String[] selected,
                                    String[] values, int size,
                                    boolean multiple, String topOption,
                                    String eventHandler) {
    StringBuffer returnStr = new StringBuffer();
    returnStr.append("<select name=\"" + fieldName + "\" size=\"" + size + "\"");
    if (multiple) {
      returnStr.append(" multiple");
    }

    // append javascript event handler if submitted
    if (!TextConverter.isEmpty(eventHandler)) {
      returnStr.append(" " + eventHandler);
    }

    returnStr.append(">");

    boolean testSelected = (selected != null && selected.length > 0);
    if (!TextConverter.isEmpty(topOption)) {
      if (!testSelected) { // if nothing selected, select top option
        returnStr.append("<option value=\"\" selected>" + topOption
                         + "</option>\n");
      } else {
        returnStr.append("<option value=\"\">" + topOption + "</option>\n");
      }
    }

    for (int j = 0; j < values.length; j++) {
      returnStr.append("<option value=\"" + values[j] + "\" ");

      if (testSelected) {
        if (multiple) {
          for (int i = 0; i < selected.length; i++) {
            if (values[j].equals(selected[i])) {
              returnStr.append("selected");
              break;
            }
          }
        } else if (values[j].equals(selected[0])) {
          returnStr.append("selected");
        }
      }
      returnStr.append(">" + values[j] + "</option>\n");
    }
    returnStr.append("</select>\n");
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
   *          is null or empty, the top value of the menu will display
   * @param values An array of values to make options in the select field.
   *          Options are created using elements of values as both the option
   *          value and the display value for the HTML option
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options in Map of values
   * @param topDisplay <code>String</code> to use for top option's display. If
   *          showTop is <code>true</code> and topDisplay is empty or null, the
   *          default text "Select One" will be used for the first option
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createSelect(String fieldName, String selected,
                                    String[] values, boolean showTop,
                                    String topDisplay) {
    boolean testSelected = (selected == null) ? false : true;

    StringBuffer returnStr = new StringBuffer();
    returnStr.append("<select name=\"" + fieldName + "\">\n");

    if (showTop) {
      if (topDisplay != null && !topDisplay.trim().equals("")) {
        returnStr.append("<option value=\"\">" + topDisplay + "</option>");
      } else {
        returnStr.append("<option value=\"\">Select One</option>");
      }
    }

    for (int i = 0; i < values.length; i++) {
      returnStr.append("<option value=\"" + values[i] + "\" ");
      if (testSelected) {
        if (values[i].equals(selected)) {
          returnStr.append("selected");
        }
      }
      returnStr.append(">" + values[i] + "</option>\n");
    }
    returnStr.append("</select>\n");

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
   *          is null or empty, the top value of the menu will display
   * @param values An array of values to make options in the select field.
   *          Options are created using elements of values as the option value
   *          of the HTML element.
   * @param keys An array of values to make options in the select field. Options
   *          are created using elements of values as the option display value
   *          of the HTML element.
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options in Map of values
   * @param topDisplay <code>String</code> to use for top option's display. If
   *          showTop is <code>true</code> and topDisplay is empty or null, the
   *          default text "Select One" will be used for the first option
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createSelect(String fieldName, String selected,
                                    String[] values, String[] keys,
                                    boolean showTop) {
    boolean testSelected = (selected == null) ? false : true;

    StringBuffer returnStr = new StringBuffer();
    returnStr.append("<select name=\"" + fieldName + "\">\n");

    if (showTop) {
      returnStr.append("<option value=\"\">Select One</option>");
    }

    for (int i = 0; i < values.length; i++) {
      returnStr.append("<option value=\"" + values[i] + "\" ");
      if (testSelected) {
        if (values[i].equals(selected)) {
          returnStr.append("selected");
        }
      }
      returnStr.append(">" + keys[i] + "</option>\n");
    }
    returnStr.append("</select>\n");

    return returnStr.toString();
  }

  /**
   * Creates an HTML SELECT form field of states in USA and Canada with
   * requested value pre-selected and optionally using default top option of
   * "Select One". Menu options will have the state's abbreviation as their
   * value, while display value will be full state name
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu will display
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createRegionSelect(String fieldName, String selected,
                                          boolean showTop) {
    // states stored as Display Value => Abbrev - make sure to render
    // w/keys as display values, not option values
    boolean keysAsValues = false;

    // force default top option
    String topOption = null;
    return createSelect(fieldName,
                        selected,
                        DataConstants.getMenuRegions(),
                        showTop,
                        topOption,
                        keysAsValues);
  }

  /**
   * Creates an HTML SELECT form field of states in USA and Canada using
   * supplied text as display for top option. Menu options will have the state's
   * abbreviation as their value, while display value will be full state name.
   * State values are created using the REGIONS constant in
   * <code>DataConstants</code>
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu will display
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @param topOption <code>String</code> to use for top option's display. If
   *          showTop is <code>true</code> and topOption is empty or null, the
   *          default text "Select One" will be used for the first option
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createRegionSelect(String fieldName, String selected,
                                          boolean showTop, String topOption) {

    // states stored as Display Value => Abbrev - make sure to render
    // w/keys as display values, not option values
    boolean keysAsValues = false;

    return createSelect(fieldName,
                        selected,
                        DataConstants.getMenuRegions(),
                        showTop,
                        topOption,
                        keysAsValues);
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
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createRegionSelect(String fieldName, boolean showTop) {
    String selected = null;

    // states stored as Display Value => Abbrev - make sure to render
    // w/keys as display values, not option values
    boolean keysAsValues = false;

    // force default top option
    String topOption = null;

    return createSelect(fieldName,
                        selected,
                        DataConstants.getMenuRegions(),
                        showTop,
                        topOption,
                        keysAsValues);
  }

  /**
   * Creates an HTML SELECT form field of states in USA and Canada with nothing
   * pre-selected, and using supplied text as display for top option. Menu
   * options will have the state's abbreviation as their value, while display
   * value will be full state name. State values are created using the REGIONS
   * constant in <code>DataConstants</code>
   * 
   * @param fieldName The name to be given to the form field
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @param topOption <code>String</code> to use for top option's display. If
   *          showTop is <code>true</code> and topOption is empty or null, the
   *          default text "Select One" will be used for the first option
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createRegionSelect(String fieldName, boolean showTop,
                                          String topOption) {
    String selected = null;

    // states stored as Display Value => Abbrev - make sure to render w/keys
    // as display values, not option values
    boolean keysAsValues = false;

    return createSelect(fieldName,
                        selected,
                        DataConstants.getMenuRegions(),
                        showTop,
                        topOption,
                        keysAsValues);
  }

  /**
   * Creates an HTML SELECT form field of countries with the requested value
   * pre-selected and optionally using default top option of "Select One". Menu
   * options will have the country's name both as value and display.
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu will display
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createCountrySelect(String fieldName, String selected,
                                           boolean showTop) {
    CountryDelegate delegate =
      CommunityDelegateFactory.getCountryDelegate();
    // getAllObjects returns countries ordered by name alphabetically.
    List<BsCountry> countries = delegate.getAllObjects(100);

    // Create a String array of all the country names.
    String[] strings = new String[countries.size()];
    int i = 0;
    for (BsCountry country : countries) {
      strings[i] = country.getName();
      i++;
    }

    return createSelect(fieldName, selected, strings, showTop, "Select One");
  }

  /**
   * Creates an HTML SELECT form field of countries with nothing pre-selected
   * and optionally using default top option of "Select One". Menu options will
   * have the country's name both as value and display.
   * 
   * @param fieldName The name to be given to the form field
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createCountrySelect(String fieldName, boolean showTop) {
    String selected = null;
    return createCountrySelect(fieldName, selected, showTop);
  }

  /**
   * Creates an HTML SELECT form field of countries with nothing pre-selected,
   * and optionally using supplied text as display for top option. Menu options
   * will have the country's name both as value and display.
   * 
   * @param fieldName The name to be given to the form field
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @param topOption <code>String</code> to use for top option's display. If
   *          showTop is <code>true</code> and topOption is empty or null, the
   *          default text "Select One" will be used for the first option
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createCountrySelect(String fieldName, boolean showTop,
                                           String topOption) {
    String selected = null;
    CountryDelegate delegate =
      CommunityDelegateFactory.getCountryDelegate();
    List<BsCountry> countries = delegate.getAllObjects(100);
    ArrayList<String> countryArrayList =
      new ArrayList<String>(countries.size());
    for (BsCountry country : countries) {
      countryArrayList.add(country.getName());
    }

    return createSelect(fieldName,
                        selected,
                        countryArrayList.toArray(new String[countries.size()]),
                        showTop,
                        topOption);
  }

  /**
   * Creates an HTML SELECT form field of organization types the requested value
   * pre-selected, and optionally using the default top option of "Select One".
   * Menu options will use the database value of the organization type as the
   * option value, while using a formatted value as display. Organization type
   * values are created using the ORG_TYPES constant in
   * <code>DataConstants</code>
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu will display
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createOrgTypeSelect(String fieldName, String selected,
                                           boolean showTop) {
    return createSelect(fieldName,
                        selected,
                        DataConstants.getOrganizationTypes(),
                        showTop,
                        "Select One",
                        true);
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
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createOrgTypeSelect(String fieldName, boolean showTop) {
    String selected = null;
    return createOrgTypeSelect(fieldName, selected, showTop);
  }

  /**
   * Creates an HTML SELECT form field of organization types with nothing
   * pre-selected, and optionally using supplied text as display for top option.
   * Menu options will use the database value of the organization type as the
   * option value, while using a formatted value as display. Organization type
   * values are created using the ORG_TYPES constant in
   * <code>DataConstants</code>
   * 
   * @param fieldName The name to be given to the form field
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @param topOption <code>String</code> to use for top option's display. If
   *          showTop is <code>true</code> and topOption is empty or null, the
   *          default text "Select One" will be used for the first option
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createOrgTypeSelect(String fieldName, boolean showTop,
                                           String topOption) {
    String selected = null;
    return createSelect(fieldName,
                        selected,
                        DataConstants.getOrganizationTypes(),
                        showTop,
                        topOption,
                        true);
  }

  /**
   * Creates an HTML SELECT form field of organization types with requested
   * value pre-selected, optionally using default top option of "Select One",
   * and optionally excluding the type "lab" from the list of organization
   * types. Menu options will use the database value of the organization type as
   * the option value, while using a formatted value as display. Organization
   * type values are created using the ORG_TYPES constant in
   * <code>DataConstants</code>
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu will display
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @param excludeLab If <code>true</code>, the menu will contain all
   *          organization types except "lab"; if <code>false</code> menu will
   *          include all organization types
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createOrgTypeSelect(String fieldName, String selected,
                                           boolean showTop, boolean excludeLab) {
    if (excludeLab) {
      // make copy of static final constant & remove lab from list
      TreeMap noLab = new TreeMap(DataConstants.getOrganizationTypes());
      noLab.remove(DataConstants.getLabType());
      return createSelect(fieldName,
                          selected,
                          noLab,
                          showTop,
                          "Select One",
                          true);
    } else {
      return createSelect(fieldName,
                          selected,
                          DataConstants.getOrganizationTypes(),
                          showTop,
                          "Select One",
                          true);
    }
  }

  /**
   * Creates an HTML SELECT form field of organization types with nothing
   * pre-selected, optionally using default top option of "Select One", and
   * optionally excluding the type "lab" from the list of organization types.
   * Menu options will use the database value of the organization type as the
   * option value, while using a formatted value as display. Organization type
   * values are created using the ORG_TYPES constant in
   * <code>DataConstants</code>
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu will display
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @param excludeLab If <code>true</code>, the menu will contain all
   *          organization types except "lab"; if <code>false</code> menu will
   *          include all organization types
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createOrgTypeSelect(String fieldName, boolean showTop,
                                           boolean excludeLab) {
    String selected = null;
    return createOrgTypeSelect(fieldName, selected, showTop, excludeLab);
  }

  /**
   * Creates an HTML SELECT form field of affiliation job titles with requested
   * value pre-selected, optionally using default top option of "Select One".
   * Menu options will use the job title as both the option value and display
   * value. Job title values are created using the AFFILIATION_TITLES constant
   * in <code>DataConstants</code>
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu will display
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createTitleSelect(String fieldName, String selected,
                                         boolean showTop) {
    return createSelect(fieldName,
                        selected,
                        DataConstants.getAffiliationTitles(),
                        showTop,
                        "Select One");
  }

  /**
   * Creates an HTML SELECT form field of affiliation job titles with nothing
   * pre-selected, and optionally using supplied text as display for top option.
   * Menu options will use the value of job title as both option value and
   * display value. Job title values are created using the AFFILIATION_TITLES
   * constant in <code>DataConstants</code>
   * 
   * @param fieldName The name to be given to the form field
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @param topOption <code>String</code> to use for top option's display. If
   *          showTop is <code>true</code> and topOption is empty or null, the
   *          default text "Select One" will be used for the first option
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createTitleSelect(String fieldName, boolean showTop,
                                         String topOption) {
    String selected = null;
    return createSelect(fieldName,
                        selected,
                        DataConstants.getAffiliationTitles(),
                        showTop,
                        topOption);
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
   *          is null or empty, the top value of the menu will display
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createStatusSelect(String fieldName, String selected,
                                          boolean showTop) {
    return createSelect(fieldName,
                        selected,
                        DataConstants.getStatusCodes(),
                        showTop,
                        "Select One");
  }

  /**
   * Creates an HTML SELECT form field of community statuses with nothing
   * pre-selected, optionally using supplied text display for top option. Menu
   * options will use the status as both the option value and display value. Job
   * title values are created using the STATUS_CODES constant in
   * <code>DataConstants</code>
   * 
   * @param fieldName The name to be given to the form field
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @param topOption <code>String</code> to use for top option's display. If
   *          showTop is <code>true</code> and topOption
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createStatusSelect(String fieldName, boolean showTop,
                                          String topOption) {
    String selected = null;
    return createSelect(fieldName,
                        selected,
                        DataConstants.getStatusCodes(),
                        showTop,
                        topOption);
  }

  /**
   * Creates an HTML SELECT form field of community statuses with requested
   * value pre-selected, optionally using supplied text display for top option.
   * Menu options will use the status as both the option value and display
   * value. Job title values are created using the STATUS_CODES constant in
   * <code>DataConstants</code>
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu will display
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @param topOption <code>String</code> to use for top option's display. If
   *          showTop is <code>true</code> and topOption
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createStatusSelect(String fieldName, String selected,
                                          boolean showTop, String topOption) {
    return createSelect(fieldName,
                        selected,
                        DataConstants.getStatusCodes(),
                        showTop,
                        topOption);
  }

  /**
   * Creates an HTML SELECT form field of search methods (contains, starts with
   * etc.) with requested value pre-selected, optionally using default top
   * option of "Select One". Menu options will use the status as both the option
   * value and display value. Search methods are created using the
   * SEARCH_METHODS constant in <code>DataConstants</code>
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu will display
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   * @see DataConstants#SEARCH_METHODS
   */
  public static String createSearchMethodSelect(String fieldName,
                                                String selected, boolean showTop) {
    return createSelect(fieldName,
                        selected,
                        DataConstants.SEARCH_METHODS,
                        showTop,
                        "Select One",
                        true);
  }

  /**
   * Creates an HTML SELECT form field of order status codes with requested
   * value pre-selected, optionally using supplied text for top option. Menu
   * options will use the status as both the option value and display
   * value.Status values are created using the ORDER_STATUS_CODES constant in
   * <code>DataConstants</code>
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu will display
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @param topOption <code>String</code> to use for top option's display. If
   *          showTop is <code>true</code> and topOption is not
   *          <code>null</code>
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createOrderStatusSelect(String fieldName,
                                               String selected,
                                               boolean showTop, String topOption) {
    return createSelect(fieldName,
                        selected,
                        DataConstants.getOrderStatusCodes(),
                        showTop,
                        topOption);
  }

  /**
   * Creates an HTML SELECT form field of stock item status codes with requested
   * value pre-selected, optionally using supplied text for top option. Menu
   * options will use the status as both the option value and display value.
   * Status values are created using the STOCK_STATUS_CODES constant in
   * <code>DataConstants</code>
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu will display
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @param topOption <code>String</code> to use for top option's display. If
   *          showTop is <code>true</code> and topOption is not
   *          <code>null</code>
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createStockStatusSelect(String fieldName,
                                               String selected,
                                               boolean showTop, String topOption) {
    return createSelect(fieldName,
                        selected,
                        DataConstants.getStockStatusCodes(),
                        showTop,
                        topOption);
  }

  /**
   * Creates an HTML SELECT form field of stock charge waiver codes with
   * requested value pre-selected, optionally using default top option of
   * "Select One". Menu options values are created using "no charge" constants
   * in <code>DataConstants</code> with a formatted string for display.
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu will display
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createWaiveChargeSelect(String fieldName,
                                               String selected,
                                               boolean showTop,
                                               boolean fullListing) {
    String[] keys = null;
    String[] values = null;

    if (fullListing) {
      keys = new String[] { "No Waiver", "Follow Up", "Reship", "Curator" };
      values =
        new String[] { DataConstants.getNoWaiver(),
                      DataConstants.getFollowUpNoCharge(),
                      DataConstants.getReshipNoCharge(),
                      DataConstants.getCuratorNoCharge() };
    } else {
      keys = new String[] { "Follow Up", "Reship", "Curator" };
      values =
        new String[] { DataConstants.getFollowUpNoCharge(),
                      DataConstants.getReshipNoCharge(),
                      DataConstants.getCuratorNoCharge() };
    }

    return createSelect(fieldName, selected, values, keys, showTop);
  }

  /**
   * Creates an HTML SELECT form field of seed stock centers with requested
   * value pre-selected, optionally using default top option of "Select One".
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The value that should show as pre-selected. If this value
   *          is null or empty, the top value of the menu will display
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createStockCenterSelect(String fieldName,
                                               String selected, boolean showTop) {
    String[] keys = new String[] { "ABRC", "NASC" };
    return createSelect(fieldName, selected, keys, showTop, "Select One");
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
   *          value is null or empty, the top value of the menu will display.
   *          This value corresponds to the stock_type_id in the database
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createStockOrderTypeSelect(String fieldName,
                                                  String selected,
                                                  boolean showTop)
      throws SQLException {

    String[] stockOrderTypes = DynamicData.getStockOrderTypes();
    return createSelect(fieldName,
                        selected,
                        stockOrderTypes,
                        showTop,
                        "Select One");
  }

  /**
   * Creates an HTML SELECT form field of stock availability types with
   * requested value pre-selected, optionally using default top option of
   * "Select One". This method dynamically creates select from all values in the
   * StockAvailabilityType table, using the stock availability type as display
   * value and stock availability type id as option value, and assumes that
   * DBReadManager connection pool has already been initialized (which should
   * normally happen when any servlet initializes)
   * 
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The option value that should show as pre-selected. If this
   *          value is null or empty, the top value of the menu will display.
   *          This value corresponds to the stock_availability_type_id in the
   *          database
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createStockAvailabilitySelect(String fieldName,
                                                     String selected,
                                                     boolean showTop)
      throws SQLException {

    TreeMap stockTypes = null;
    DBconnection conn = null;
    DBReadManager connectionPool = null;
    ResultSet results = null;
    String query = null;

    try {
      query =
        "SELECT stock_availability_type_id, stock_availability_type "
            + "FROM StockAvailabilityType";
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();
      conn.setQuery(query);
      results = conn.getResultSet();
      while (results.next()) {
        if (stockTypes == null) {
          stockTypes = new TreeMap();
        }
        stockTypes.put(results.getString("stock_availability_type_id"),
                       results.getString("stock_availability_type"));
      }
      conn.releaseResources();

    } finally {
      if (conn != null) {
        connectionPool.return_connection(conn);
      }
    }

    return createSelect(fieldName,
                        selected,
                        stockTypes,
                        showTop,
                        "Select One",
                        true);
  }

  /**
   * Creates an HTML SELECT form field of stock types with requested value
   * pre-selected, optionally using default top option of "Select One". This
   * method dynamically creates select from all values in the StockType table,
   * using the stock type as display value and stock type id as option value,
   * and assumes that DBReadManager connection pool has already been initialized
   * (which should normally happen when any servlet initializes)
   * 
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The option value that should show as pre-selected. If this
   *          value is null or empty, the top value of the menu will display.
   *          This value corresponds to the stock_type_id in the database
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createStockTypeSelect(String fieldName, String selected,
                                             boolean showTop)
      throws SQLException {

    TreeMap stockTypes = null;
    DBconnection conn = null;
    DBReadManager connectionPool = null;
    ResultSet results = null;
    String query = null;

    try {
      query =
        "SELECT stock_type_id, stock_type " + "FROM StockType "
            + "ORDER BY stock_type";
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();
      conn.setQuery(query);
      results = conn.getResultSet();
      while (results.next()) {
        if (stockTypes == null) {
          stockTypes = new TreeMap();
        }
        stockTypes.put(results.getString("stock_type_id"),
                       results.getString("stock_type"));
      }
      conn.releaseResources();

    } finally {
      if (conn != null) {
        connectionPool.return_connection(conn);
      }
    }

    return createSelect(fieldName,
                        selected,
                        stockTypes,
                        showTop,
                        "Select One",
                        true);
  }

  /**
   * Creates an HTML SELECT form field of species variants that are associated
   * to at least one germplasm record. Select menu is created with requested
   * value pre-selected, optionally using default top option of "Select One".
   * This method also allows client code to insert a javascript event handler in
   * the select menu's opening tag. This is useful for calling page-specific js
   * functions, such as ensuring that if "Any" is checked, no other options are
   * selected as well.
   * 
   * <p>
   * Collection of species variants is retrieved from <code>DynamicData</code>
   * which uses <code>DataPopulatorThread</code> to periodically refresh the
   * data.
   * 
   * @param fieldName The name to be given to the form field
   * @param size Menu size (number of options to display)
   * @param topOption Display text to use for top option
   * @param eventHandler Javascript event handler string to insert in select
   *          menu's opening tag
   * @return <code>String</code> containing HTML to create the select form field
   * @throws SQLException thrown if a database error occurs while retrieving
   *           menu values
   */
  public static String createGermplasmSpeciesVariantSelect(String fieldName,
                                                           int size,
                                                           String topOption,
                                                           String eventHandler)
      throws SQLException {

    String[] germplasmSpeciesVariants =
      DynamicData.getGermplasmSpeciesVariants();
    String[] selected = null;
    return createSelect(fieldName,
                        selected,
                        germplasmSpeciesVariants,
                        size,
                        true,
                        topOption,
                        eventHandler);
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
   *          value is null or empty, the top value of the menu will display.
   *          This value corresponds to the stock_availability_type_id in the
   *          database
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   * @throws SQLException thrown if a database error occurs while retrieving
   *           countries.
   */
  public static String createSpeciesVariantCountrySelect(String fieldName,
                                                         String selected,
                                                         boolean showTop)
      throws SQLException {

    String[] countries = DynamicData.getSpeciesVariantCountries();
    return createSelect(fieldName, selected, countries, showTop, "Select One");
  }

  /**
   * Creates an HTML SELECT form field of month names with requested month
   * number pre-selected, optionally using default top option of "Select One".
   * Month select is created with month name as display value and calendar month
   * number as option value.
   * 
   * @param fieldName The name to be given to the form field
   * @param selected The option value that should show as pre-selected. If this
   *          value is null or empty, the top value of the menu will display.
   * @param showTop If <code>true</code>, an empty first option will be created
   *          in addition to the supplied values; if <code>false</code> the
   *          select menu will only contain the options
   * @return <code>String</code> containing HTML to create the select form field
   */
  public static String createMonthSelect(String fieldName, String selected,
                                         boolean showTop) {

    String[] numbers =
      new String[] { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11",
                    "12" };
    String[] names =
      new String[] { "January", "February", "March", "April", "May", "June",
                    "July", "August", "September", "October", "November",
                    "December" };

    return createSelect(fieldName, selected, numbers, names, showTop);
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
   *          this value is null or empty, the top value of the menu will
   *          display. This value corresponds to the taxon_id in the database
   * @param showTop - If true, an empty first option will be created in addition
   *          to the supplied values; if false the select menu will only contain
   *          the options
   * @return String containing HTML to create the select form field
   * @throws SQLException thrown if a database error occurs while retrieving
   *           taxons.
   */
  public static String createSpeciesVariantTaxonSelect(String fieldName,
                                                       String selected,
                                                       boolean showTop)
      throws SQLException {

    Map<String, String> taxons = DynamicData.getSpeciesVariantTaxons();
    return createSelect(fieldName,
                        selected,
                        taxons,
                        showTop,
                        "Select One",
                        false);
  }

  /**
   * Creates an HTML SELECT form field of taxons that are associated to at least
   * one species variant record for use in searching for germplasms. This method
   * creates the select menu with a requested value pre-selected, optionally
   * using the default top option of "Select One". This method gets the
   * collection of taxons from DynamicData, which uses DataPopulatorThread to
   * periodically refresh the data.
   * 
   * @param fieldName - The name to be given to the form field
   * @param selected - The option value that should show as pre-selected. If
   *          this value is null or empty, the top value of the menu will
   *          display. This value corresponds to the taxon_id in the database
   * @param showTop - If true, an empty first option will be created in addition
   *          to the supplied values; if false the select menu will only contain
   *          the options
   * @return String containing HTML to create the select form field
   * @throws SQLException thrown if a database error occurs while retrieving
   *           taxons.
   */
  public static String createGermplasmTaxonSelect(String fieldName,
                                                  String selected,
                                                  boolean showTop)
      throws SQLException {

    List<DataPopulatorThread.Taxon> taxons = DynamicData.getGermplasmTaxons();
    return createGermplasmTaxonSelect(fieldName,
                        selected,
                        taxons,
                        showTop,
                        "Select One");
  }

  public static String createCloneTaxonSelect(String fieldName,
                                              String selected, boolean showTop)
      throws SQLException {

    Map taxons = DynamicData.getCloneTaxons();
    return createSelect(fieldName, selected, taxons, showTop, "any", false);
  }

  /**
   * Creates an HTML SELECT form field of experiment categories (keywords that
   * are associated to at least one expression set with relationship type =
   * 'experiment category'. Select menu is created to allow multiple selections,
   * using supplied top option. Menu size will be made to show all entries
   * retrieved from the database. This method also allows client code to insert
   * a javascript event handler in the select menu's opening tag. This is useful
   * for calling page-specific js functions, such as ensuring that if "Any" is
   * checked, no other options are selected.
   * 
   * <p>
   * This method gets the collection of keywords from DynamicData which uses
   * DataPopulatorThread to periodically refresh the data. Select menu will have
   * keyword_id as option value, with keyword itself as display text for each
   * option.
   * 
   * @param fieldName The name to be given to the form field
   * @param topOption Display text to use for top option
   * @param eventHandler Javascript event handler string to insert in select
   *          menu's opening tag
   * @return <code>String</code> containing HTML to create the select form field
   * @throws SQLException thrown if a database error occurs while retrieving
   *           menu values
   */
  public static String createExperimentCategorySelect(String fieldName,
                                                      String topOption,
                                                      String eventHandler)
      throws SQLException {

    Map categories = DynamicData.getExperimentCategories();
    int size = categories.size() + 1; // # of entries plus topOption
    List<String> selected = null;
    return createSelect(fieldName,
                        selected,
                        categories,
                        size,
                        true,
                        topOption,
                        eventHandler,
                        false);
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
   * @param eventHandler Javascript event handler string to insert in select
   *          menu's opening tag
   * @return <code>String</code> containing HTML to create the select form field
   * @throws SQLException thrown if a database error occurs while retrieving
   *           menu values
   */
  public static String createExperimentCategorySelect(String fieldName,
                                                      String topOption,
                                                      List<String> selected,
                                                      int size,
                                                      String eventHandler)

  throws SQLException {

    Map categories = DynamicData.getExperimentCategories();
    return createSelect(fieldName,
                        selected,
                        categories,
                        size,
                        true,
                        topOption,
                        eventHandler,
                        false);
  }

  /**
   * Creates an HTML SELECT form field of Protocol keywords
   * 
   * <p>
   * 
   * @param fieldName The name to be given to the form field
   * @param topOption Display text to use for top option
   * @param size Number of entries to show in menu
   * @param eventHandler Javascript event handler string to insert in select
   *          menu's opening tag
   * @return <code>String</code> containing HTML to create the select form field
   * @throws SQLException thrown if a database error occurs while retrieving
   *           menu values
   */
  public static String createProtocolKeywordSelect(String fieldName,
                                                   String topOption, int size)

  throws SQLException {

    Map kws = DynamicData.getProtocolKeywords();
    return createSelect(fieldName, null, // no options pre-selected
                        kws,
                        size,
                        true, // allow multiple selection
                        topOption,
                        null, // no javascript event handler
                        true); // use map keys as option values
  }

  /**
   * Converts array of <code>String</code> values into delimited string using
   * supplied delimiter
   * 
   * @param values Array of <code>String</code>s to make delimited string from
   * @param delimiter Delimiter to use when creating string
   * @return Delimited <code>String</code> of all values, or null if values is
   *         null or empty
   */
  public static String arrayToString(String[] values, String delimiter) {
    String returnStr = null;
    if (values != null && delimiter != null) {
      StringBuffer buffer = new StringBuffer();
      for (int i = 0; i < values.length; i++) {
        buffer.append(values[i]);
        if (i + 1 < values.length) {
          buffer.append(delimiter);
        }
      }
      returnStr = buffer.toString();
    }

    return returnStr;
  }

  /**
   * Converts array of <code>String</code> values into querystring format, with
   * each value being assigned to field name to create a multiple value
   * submission (fieldName=value1&fieldName=value2 etc.).
   * 
   * @param values Array of <code>String</code>s to make delimited string from
   * @param fieldName Name of field to assign each value to
   * @return Delimited <code>String</code> of all values, or null if values is
   *         null or empty
   */
  public static String arrayToQueryString(String[] values, String fieldName) {
    String returnStr = null;
    StringBuffer buffer = null;
    if (values != null && values.length > 0 && fieldName != null) {
      buffer = new StringBuffer();
      for (int i = 0; i < values.length; i++) {
        buffer.append(fieldName + "=" + URLEncoder.encode(values[i]));
        if (i + 1 < values.length) {
          buffer.append("&");
        }
      }
      returnStr = buffer.toString();
    }
    return returnStr;
  }

  /**
   * Converts <code>Map</code> into a delimited <code>String</code> using
   * supplied delimiter between key/value pairs and spacer between keys and
   * values. Since contents of Map are stored as <code>Object</code>, this is
   * done by calling the toString() method of each Object found. Explicit tests
   * are made to see if the stored object is a <code>java.util.Date</code>, in
   * which case the date is converted to a <code>String</code> using
   * dateToString(), or if the object is an array of objects, in which case the
   * array is iterated through so that each value is appended separately with a
   * repeating key (i.e. key=value1 key=value2 key=value3 etc.)
   * 
   * @param values Map of values to create string from
   * @param delimiter String to use as delimiter between key/value pairs
   * @param spacer String to use as spacer between keys and values
   * @return String containing all elements of values with supplied delimiters &
   *         spacers, or null if values or delimiter are null
   */
  public static String mapToString(Map values, String delimiter, String spacer) {
    String returnStr = null;
    if (values != null && delimiter != null) {
      StringBuffer buffer = new StringBuffer();
      Iterator iter = values.keySet().iterator();
      int i = 0;
      while (iter.hasNext()) {
        Object next = iter.next();
        if (next != null) {
          buffer.append(next.toString());
        } else {
          buffer.append(next);
        }
        if (values.get(next) != null) {
          if (values.get(next) instanceof java.util.Date) {
            buffer.append(TextConverter.dateToString((java.util.Date)values.get(next)));
          } else if (values.get(next) instanceof Object[]) {
            Object[] tmpArray = (Object[])values.get(next);
            for (int j = 0; j < tmpArray.length; j++) {
              if (j > 0) {
                buffer.append(next);
              }
              buffer.append(spacer + tmpArray[j].toString());
              if (j + 1 < tmpArray.length) {
                buffer.append(delimiter);
              }
            }
          } else {
            buffer.append(spacer + (values.get(next)).toString());
          }
        } else {
          buffer.append("");
        }

        if (i + 1 < values.size()) {
          buffer.append(delimiter);
        }
        i++;
      }
      returnStr = buffer.toString();
    }
    return returnStr;
  }

  /**
   * Converts <code>Map</code> into a delimited <code>String</code> that is
   * optionally URL encoded to String safe as a querystring. Delimited string is
   * created using supplied delimiter between key/value pairs and spacer between
   * keys and values. Since contents of Map are stored as <code>Object</code>,
   * this is done by calling the toString() method of each Object found.
   * Explicit tests are made to see if the stored object is a
   * <code>java.util.Date</code>, in which case the date is converted to a
   * <code>String</code> using dateToString(), or if the object is an array of
   * objects, in which case the array is iterated through so that each value is
   * appended separately with a repeating key (i.e. key=value1 key=value2
   * key=value3 etc.)
   * 
   * @param values Map of values to create string from
   * @param delimiter String to use as delimiter between key/value pairs
   * @param spacer String to use as spacer between keys and values
   * @param encode If <code>true</code> returned String will be URL encoded; if
   *          <code>false</code> returned value will not be encoded.
   * @return String containing all elements of values with supplied delimiters &
   *         spacers, or null if values or delimiter are null
   * @see URLEncoder#encode(String )
   */
  public static String mapToString(Map values, String delimiter, String spacer,
                                   boolean encode) {
    String returnStr = null;

    if (values != null && delimiter != null) {
      StringBuffer buffer = new StringBuffer();
      Iterator iter = values.keySet().iterator();
      int i = 0;
      while (iter.hasNext()) {
        Object next = iter.next();
        if (next != null) {
          buffer.append(next.toString());
        } else {
          buffer.append(next);
        }

        Object nextValue = values.get(next);
        if (nextValue != null) {
          if (nextValue instanceof Object[]) {
            Object[] tmpArray = (Object[])nextValue;
            for (int j = 0; j < tmpArray.length; j++) {
              if (j > 0) {
                buffer.append(next);
              }
              buffer.append(spacer);
              if (encode) {
                buffer.append(URLEncoder.encode(tmpArray[j].toString()));
              } else {
                buffer.append(tmpArray[j].toString());
              }
              if (j + 1 < tmpArray.length) {
                buffer.append(delimiter);
              }
            }
          } else {
            String appendValue = null;
            if (nextValue instanceof java.util.Date) {
              appendValue =
                TextConverter.dateToString((java.util.Date)nextValue);
            } else {
              appendValue = nextValue.toString();
            }

            if (encode) {
              buffer.append(spacer + URLEncoder.encode(appendValue));
            } else {
              buffer.append(spacer + appendValue);
            }
          }
        } else {
          buffer.append("");
        }

        if (i + 1 < values.size()) {
          buffer.append(delimiter);
        }
        i++;
      }
      returnStr = buffer.toString();
    }
    return returnStr;
  }

  /**
   * Converts parameters in <code>HttpServletRequest</code> into a delimited
   * String of key value pairs, using supplied delimiter between key/value
   * pairs, spacer between keys and values, and optionally URL encoding to make
   * String safe as a querystring.
   * 
   * @param request HttpServletRequest containing parameters to be translated
   * @param delimiter String to use as delimiter between key/value pairs
   * @param spacer String to use as spacer between keys and values
   * @param encode If <code>true</code> returned String will be URL encoded; if
   *          <code>false</code> returned value will not be encoded.
   * @return String containing all elements of values with supplied delimiters &
   *         spacers, or null if no values in request, or delimiter is null
   * @see URLEncoder#encode(String )
   */
  public static String requestToString(HttpServletRequest request,
                                       String delimiter, String spacer,
                                       boolean encode) {

    String returnStr = null;
    if (request.getParameterNames() != null && delimiter != null) {
      StringBuffer buffer = new StringBuffer();
      Enumeration itr = request.getParameterNames();
      int i = 0;
      while (itr.hasMoreElements()) {
        if (i > 0) {
          buffer.append(delimiter);
        }
        String next = (String)itr.nextElement();
        buffer.append(next);
        if (request.getParameter(next) != null) {
          if (encode) {
            buffer.append(spacer
                          + URLEncoder.encode(request.getParameter(next)));
          } else {
            buffer.append(spacer + request.getParameter(next));
          }
        } else {
          buffer.append("");
        }
        i++;
      }
      returnStr = buffer.toString();
    }
    return returnStr;
  }

  /**
   * Creates HTML checkbox form fields for "organism of interest" Community
   * Keywords. Requested values will have their checkbox shown as "checked".
   * List of organisms is created from ORGANISMS constant in
   * <code>DataConstants</code>.
   * 
   * @param selected Array of values to show as checked
   * @return String array with each element being the HTML to create one
   *         checkbox
   */
  public static String[] getOrganismCheckboxes(String[] selected) {
    String[] organisms = DataConstants.getOrganismsOfInterest();
    String[] checkboxes = new String[organisms.length];
    for (int i = 0; i < organisms.length; i++) {
      if (selected != null) {
        for (int j = 0; j < selected.length; j++) {
          if (organisms[i].equals(selected[j])) {
            checkboxes[i] =
              "<input type=\"checkbox\" name=\"organism\" value=\""
                  + organisms[i] + "\" checked> " + organisms[i];
            break;
          } else {
            checkboxes[i] =
              "<input type=\"checkbox\" name=\"organism\" value=\""
                  + organisms[i] + "\"> " + organisms[i];
          }
        }
      } else {
        checkboxes[i] =
          "<input type=\"checkbox\" name=\"organism\" value=\"" + organisms[i]
              + "\"> " + organisms[i];
      }
    }
    return checkboxes;
  }

  /**
   * Creates HTML checkbox form fields for "organism of interest" Community
   * Keywords with no boxes pre-selected. List of organisms is created from
   * ORGANISMS constant in <code>DataConstants</code>.
   * 
   * @return String array with each element being the HTML to create one
   *         checkbox
   */
  public static String[] getOrganismCheckboxes() {
    String[] organisms = DataConstants.getOrganismsOfInterest();
    String[] checkboxes = new String[organisms.length];
    for (int i = 0; i < organisms.length; i++) {
      checkboxes[i] =
        "<input type=\"checkbox\" name=\"organism\" value=\"" + organisms[i]
            + "\"> " + organisms[i];
    }
    return checkboxes;
  }

  /**
   * Separates out any organisms that are not in ORGANISMS constant in
   * <code>DataConstants</code> so that they can be displayed separately from
   * checkboxes used to show organisms in list
   * 
   * @param selected Array of organisms of interest from which organisms not in
   *          constant should be extracted
   * @return String containing any entries not in constants list
   */
  public static String getOtherOrganisms(String[] selected) {
    String[] organisms = DataConstants.getOrganismsOfInterest();
    String otherOrganisms = null;
    if (selected != null) {
      for (int i = 0; i < selected.length; i++) {
        boolean found = false;
        for (int j = 0; j < organisms.length; j++) {
          if (organisms[j].equals(selected[i])) {
            found = true;
            break;
          }
        }
        if (!found) {
          otherOrganisms = selected[i];
          break;
        }
      }
    }
    return otherOrganisms;
  }

  /**
   * Creates HTML text input form fields for CommunityKeywords that are
   * populated with selected values
   * 
   * @param keywords List of keywords to show as values of form fields
   * @return String Array with each element containing the HTML to create one
   *         keyword field
   */
  public static String[] getKeywordTextFields(String[] keywords) {
    String[] textFields = new String[6];
    for (int i = 0; i < textFields.length; i++) {
      if (keywords != null && i < keywords.length && keywords[i] != null) {

        textFields[i] = createTextField("keyword", 20, 200, keywords[i]);
      } else {
        textFields[i] = createTextField("keyword", 20, 200, "");
      }
    }
    return textFields;
  }

  /**
   * Creates HTML text for a simple text input box having supplied name, size,
   * maxlength and value. Value will be translated to an empty string if NULL is
   * submitted.
   * 
   * @param fieldName Name of HTML field
   * @param size Size of text input box
   * @param maxlength Max number of characters to allow in input box
   * @param value Value to set for field
   * @return String containing HTML to render requested text input field.
   */
  public static String createTextField(String fieldName, int size,
                                       int maxlength, String value) {

    StringBuffer buffer = new StringBuffer();
    buffer.append("<input type=\"text\" name=\"" + fieldName + "\"");
    buffer.append("size=\"" + size + "\"");
    buffer.append("maxlength=\"" + maxlength + "\"");
    buffer.append("value=\"" + EmptyTextConverter.convert(value) + "\">\n");

    return buffer.toString();
  }

  /**
   * Creates HTML for a single checkbox form field having supplied name and
   * value. If checkbox value matches the requested value of selected, the
   * checkbox will show as pre-selected (checked).
   * 
   * @param fieldName The name to be given to the form field
   * @param value Value given to form field
   * @param selected The value that should show as pre-selected. If this matches
   *          supplied value for the checkbox, checkbox will display as checked
   * @return String of HTML to create single checkbox
   */
  public static String createCheckBox(String fieldName, String value,
                                      String selected) {
    String checkBox = null;
    if (selected != null && selected.equals(value)) {
      checkBox =
        "<input type=\"checkbox\" name=\"" + fieldName + "\" value=\"" + value
            + "\" checked>\n";
    } else {
      checkBox =
        "<input type=\"checkbox\" name=\"" + fieldName + "\" value=\"" + value
            + "\">\n";
    }
    return checkBox;
  }

  /**
   * Creates HTML for a single checkbox form field having supplied name and
   * value, and optionally shown as pre-selected (checked). Overloaded version
   * allows using simple boolean value instead of Boolean wrapper
   * 
   * @param fieldName The name to be given to the form field
   * @param value Value given to form field
   * @param selected If <code>true</code>, checkbox will display as checked; if
   *          <code>false</code> or <code>null</code> checkbox will display as
   *          unchecked
   * @return String of HTML to create single checkbox
   */
  public static String createCheckBox(String fieldName, String value,
                                      boolean selected) {
    String checkBox = null;
    if (selected) {
      checkBox =
        "<input type=\"checkbox\" name=\"" + fieldName + "\" value=\"" + value
            + "\" checked>\n";
    } else {
      checkBox =
        "<input type=\"checkbox\" name=\"" + fieldName + "\" value=\"" + value
            + "\">\n";
    }
    return checkBox;
  }

  /**
   * Creates HTML for a single checkbox form field having supplied name and
   * value, and optionally shown as pre-selected (checked).
   * 
   * @param fieldName The name to be given to the form field
   * @param value Value given to form field
   * @param selected If <code>true</code>, checkbox will display as checked; if
   *          <code>false</code> or <code>null</code> checkbox will display as
   *          unchecked
   * @return String of HTML to create single checkbox
   */
  public static String createCheckBox(String fieldName, String value,
                                      Boolean selected) {
    String checkBox = null;
    if (selected != null && selected.booleanValue()) {
      checkBox =
        "<input type=\"checkbox\" name=\"" + fieldName + "\" value=\"" + value
            + "\" checked>\n";
    } else {
      checkBox =
        "<input type=\"checkbox\" name=\"" + fieldName + "\" value=\"" + value
            + "\">\n";
    }
    return checkBox;
  }

  /**
   * Creates HTML for a single radio button form field having supplied name and
   * value, and optionally shown as pre-selected (checked).
   * 
   * @param fieldName The name to be given to the form field
   * @param value Value given to form field
   * @param selected If <code>true</code>, radio button will display as checked;
   *          if <code>false</code> or <code>null</code> checkbox will display
   *          as unchecked
   * @return String of HTML to create single radio button
   */
  public static String createRadio(String fieldName, String value,
                                   Boolean selected) {
    String radio = null;

    if (selected != null && selected.booleanValue()) {
      radio =
        "<input type=\"radio\" name=\"" + fieldName + "\" value=\"" + value
            + "\" checked>\n";
    } else {
      radio =
        "<input type=\"radio\" name=\"" + fieldName + "\" value=\"" + value
            + "\">\n";
    }
    return radio;
  }

  /**
   * Creates HTML for a single hidden form field with supplied name and value.
   * 
   * @param fieldName The name to be given to the form field
   * @param value Value given to form field.
   * @return String of HTML to create single hidden form field
   */
  public static String createHiddenField(String fieldName, String value) {
    String retString = null;
    if (fieldName != null) {
      if (value != null) {
        retString =
          "<input type=\"hidden\" name=\"" + fieldName + "\" value=\"" + value
              + "\">\n";
      } else {
        retString =
          "<input type=\"hidden\" name=\"" + fieldName + "\" value=\"\">\n";
      }
    }
    return retString;
  }

  /**
   * Creates HTML for multiple hidden form fields, all with the supplied name
   * and with submitted values. One form field will be created for each element
   * in values.
   * 
   * @param fieldName The name to be given to the form field
   * @param values Array of values to to create hidden fields for.
   * @return String of HTML to create multiple hidden form fields
   */
  public static String createHiddenField(String fieldName, String[] values) {
    StringBuffer fields = null;
    String returnStr = null;

    if (fieldName != null && values != null && values.length > 0) {
      fields = new StringBuffer();
      for (int i = 0; i < values.length; i++) {
        fields.append(createHiddenField(fieldName, values[i]));
      }
      returnStr = fields.toString();
    }
    return returnStr;
  }

  /**
   * Translates Collection of urls with display names to HTML hyperlinks
   * pointing to URL, using display name as text value of link. If display name
   * is null or empty, URL itself will be used as display value of hyperlink. If
   * URL does not have "http://" in it, value will be added to create valid HTTP
   * URL
   * 
   * @param urls Map of URLs with URL itself as a <code>String</code> key
   *          referencing the <code>String</code> display value
   * @return String containing HTML to create hyperlinks from supplied values
   *         with HTML break between multiple values or null if there are none
   */
  public static String urlsToHTML(Collection<BsUrl> urls) {
    String retString = null;
    if (urls != null && !urls.isEmpty()) {
      StringBuilder urlStr = new StringBuilder();
      String sep = "";
      for (BsUrl url : urls) {
        urlStr.append(sep);
        urlStr.append(urlToHTML(url.getUrl(), url.getWebSiteName()));
        sep = "<br>";
      }
      retString = urlStr.toString();
    }
    return retString;
  }

  /**
   * Creates HTML string to display submitted url as a valid hyperlink. Link
   * display text will be value of displayName; if displayName is
   * <code>null</code>, url itself will be used as display text. If URL does not
   * start with "http://", "ftp://" or "https://", default value of "http://"
   * will be prepended to string. NOTE: This does not cover the full range of
   * valid URI schemes, but checks for the 3 values which probably make up 99.9%
   * of the URLs out there...given that, it is possible that strange bugs might
   * appear if user submits a nntp:// URL or something.
   * 
   * @param url URL value for hyperlink
   * @param displayName Display text to use for hyperlink; if <code>null</code>
   *          url will be used
   * @return HTML to create hyperlink using url and displayName
   */
  public static String urlToHTML(String url, String displayName) {
    String urlStr = null;

    if (url != null) {
      String tmpURL =
        (url.startsWith("http://") || url.startsWith("ftp://") || url.startsWith("https://")) ? url
            : "http://" + url;

      String displayStr = (displayName != null) ? displayName : tmpURL;
      urlStr = "<a href=\"" + tmpURL + "\">" + displayStr + "</a>";
    }
    return urlStr;
  }

  /**
   * Creates HTML string to display submitted url as a valid hyperlink. Link
   * display text will be value of displayName; if displayName is
   * <code>null</code>, url itself will be used as display text. If URL does not
   * start with "http://", "ftp://" or "https://", default value of "http://"
   * will be prepended to string. NOTE: This does not cover the full range of
   * valid URI schemes, but checks for the 3 values which probably make up 99.9%
   * of the URLs out there...given that, it is possible that strange bugs might
   * appear if user submits a nntp:// URL or something.
   * 
   * @param url URL value for hyperlink
   * @param displayName Display text to use for hyperlink; if <code>null</code>
   *          url will be used
   * @param map to be used in case we want to include action items (such as
   *          onClick, etc
   * @return HTML to create hyperlink using url and displayName
   */
  public static String urlToHTML(String url, String displayName, String actions) {
    String urlStr = null;

    if (url != null) {
      String tmpURL =
        (url.startsWith("http://") || url.startsWith("ftp://") || url.startsWith("https://")) ? url
            : "http://" + url;

      String displayStr = (displayName != null) ? displayName : tmpURL;
      urlStr = "<a href=\"" + tmpURL + "\"";
      urlStr = urlStr + " " + actions + " ";
      urlStr = urlStr + ">" + displayStr + "</a>";
    }
    return urlStr;
  }

  /**
   * Convenience method for building an onClick event Google Apps urchinTracker
   * call for an input URL.
   * 
   * @param url the input URL to wrap in a Google tracker call
   * @return the onClick attribute for an anchor tag
   */
  public static String urlToGoogleAppsAction(String url) {
    String action_link = url;
    action_link = action_link.replaceAll("http://", "");
    action_link = action_link.replaceAll("https://", "");
    action_link = action_link.replaceAll("ftp://", "");
    String[] parts = action_link.split("/");
    action_link = parts[0];
    return "onClick=\"javascript:urchinTracker('/outgoing/" + action_link
           + "');\"";
  }

  /**
   * Convenience method to extract request URL from
   * <code>HttpServletRequest</code> along with submitted parameters. This
   * method examines the request method (almost always "GET" or "POST") and
   * creates a querystring from submitted parameters that is then added to
   * requested servlet path to create full URL representing request. This is
   * especially useful if user must be redirected before seeing requested
   * resource (if not logged in for example). This method can be used to capture
   * requested URL & params so that value can be passed along through multiple
   * pages before finally redirecting user to page originally requested.
   * 
   * @param request HttpServletRequest of original request.
   * @return Request parameters as a single querystring
   */
  public static String getRequestURL(HttpServletRequest request) {

    String requestURL = null;
    if (request.getMethod().equals("GET")) {
      requestURL = request.getServletPath() + "?" + request.getQueryString();

    } else if (request.getMethod().equals("POST")) {
      requestURL =
        request.getServletPath() + "?"
            + HTMLFactory.requestToString(request, "&", "=", true);

    } else {
      requestURL = request.getRequestURI();
    }

    return requestURL;
  }

  /**
   * Method to create HTML needed for displaying hyperlinks to seq viewer. This
   * method allows multiple links to be created to handle cases where map
   * element to display in viewer is assigned onto multiple chromosomes (all on
   * AGI map). Seq viewer interface can only handle single chromosome values -
   * using this method in JSPs to create links allows us to keep looping logic
   * centralized here and out of the JSP.
   * 
   * <p>
   * This method assumes that all chromosome values in submitted chromosome
   * array are from valid assignments onto the AGI map - no further validation
   * of chromosome values occurs here. Most likely, this array of chromosome
   * values was retrieved using the TfcMapElement.getAGIChromosomes() utility
   * method.
   * 
   * <p>
   * This version of method assumes standard syntax of creating seq viewer link
   * should be used; overloaded version can be used to append additional params
   * to querystring if needed.
   * 
   * @param display Display text to use for hyperlink (i.e. Sequence Viewer)
   * @param type Object type param to pass to seq viewer
   * @param id Object id (usually tair_object_id)_ to pass to seq viewer
   * @param chromosomes List of chromosome values from map element's assignments
   *          onto AGI map
   * @param delimiter Delimiter to use between multiple links, if created
   *          (&nbsp; for example)
   * @return HTML string to create as many hyperlinks to seq viewer as
   *         necessary; multiple links will be separated by submitted delimiter;
   *         empty string will be returned if type, id or chromosome values are
   *         submitted as <code>null</code>
   */
  public static String createSeqViewerLinks(String display, String type,
                                            Long id, String[] chromosomes,
                                            String delimiter) {

    // manually sub in empty string for extra params - this lets us keep all
    // code
    // to parse chromosome in single method that both versions of public method
    // use
    return buildSeqViewerLinks(display, type, id, chromosomes, delimiter, "");
  }

  /**
   * Method to create HTML needed for displaying hyperlinks to seq viewer. This
   * method allows multiple links to be created to handle cases where map
   * element to display in viewer is assigned onto multiple chromosomes (all on
   * AGI map). Seq viewer interface can only handle single chromosome values -
   * using this method in JSPs to create links allows us to keep looping logic
   * centralized here and out of the JSP.
   * 
   * <p>
   * This method assumes that all chromosome values in submitted chromosome
   * array are from valid assignments onto the AGI map - no further validation
   * of chromosome values occurs here. Most likely, this array of chromosome
   * values was retrieved using the TfcMapElement.getAGIChromosomes() utility
   * method.
   * 
   * <p>
   * This method is overloaded to allow option of appending any additional
   * criteria into hyperlink's querystring that may be needed in specific
   * situations (such as on clone end detail page where a certain zoom level is
   * requested from seq viewer)
   * 
   * @param display Display text to use for hyperlink (i.e. Sequence Viewer)
   * @param type Object type param to pass to seq viewer
   * @param id Object id (usually tair_object_id)_ to pass to seq viewer
   * @param chromosomes List of chromosome values from map element's assignments
   *          onto AGI map
   * @param delimiter Delimiter to use between multiple links, if created
   *          (&nbsp; for example)
   * @param extraParams Additional params to add to hyperlink's querystring;
   *          params must be in key=value format with multiple params separated
   *          by "&". Extra params should not include the leading "&" preceding
   *          additional params - this will be included as necessary by me
   * @return HTML string to create as many hyperlinks to seq viewer as
   *         necessary; multiple links will be separated by submitted delimiter;
   *         empty string will be returned if type, id or chromosome values are
   *         submitted as <code>null</code>
   */
  public static String createSeqViewerLinks(String display, String type,
                                            Long id, String[] chromosomes,
                                            String delimiter, String extraParams) {
    // return output from utility method that both versions of public method use
    return buildSeqViewerLinks(display,
                               type,
                               id,
                               chromosomes,
                               delimiter,
                               extraParams);
  }

  /**
   * Utility method to create HTMl string containing as many hyperlinks as
   * needed; public methods act as wrappers to this method. Method will create
   * one hyperlink for each element in chromosome array unless chromosome value
   * is chloroplast or mitochondria (C/M)
   */
  private static String buildSeqViewerLinks(String display, String type,
                                            Long id, String[] chromosomes,
                                            String delimiter, String extraParams) {

    // initialize to return empty string no matter what
    StringBuffer links = new StringBuffer();

    if (type != null && id != null
        && (chromosomes != null && chromosomes.length > 0)) {

      // create one link for each chromosome
      for (int i = 0; i < chromosomes.length; i++) {

        // skip chloroplast or mitochondria entries for now -
        // since chromosome values should be coming from assignments onto
        // AGI map, and since C/M do not have assignments yet, this should
        // "never happen", but ya never know...
        if (!chromosomes[i].equals("C") && !chromosomes[i].equals("M")) {

          links.append("<a href=\"http://tairvm09.tacc.utexas.edu/servlets/sv?action=accession&type=" + type
                       + "&id=" + id.toString() + "&chr=" + chromosomes[i]);

          // add extra params to querystring if received
          // non-null/non-empty value
          if (!TextConverter.isEmpty(extraParams)) {
            links.append("&" + extraParams);
          }

          links.append("\" target=_other>" + display);

          // if creating multiple links, show chromosome in display text
          // to differentiate between them
          if (chromosomes.length > 1) {
            links.append("(" + chromosomes[i] + ")");
          }
          links.append("</a>");
          if (i + 1 < chromosomes.length) {
            links.append(delimiter);
          }
        }
      }

    }
    return links.toString();
  }
}
