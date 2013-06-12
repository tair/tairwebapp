//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.49 $
// $Date: 2006/03/15 19:42:15 $
//------------------------------------------------------------------------------

package org.tair.utilities;

import java.math.BigInteger;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.oro.text.regex.MalformedPatternException;
import org.apache.oro.text.regex.MatchResult;
import org.apache.oro.text.regex.Pattern;
import org.apache.oro.text.regex.PatternCompiler;
import org.apache.oro.text.regex.PatternMatcher;
import org.apache.oro.text.regex.PatternMatcherInput;
import org.apache.oro.text.regex.Perl5Compiler;
import org.apache.oro.text.regex.Perl5Matcher;
import org.apache.oro.text.regex.StringSubstitution;
import org.apache.oro.text.regex.Util;

/**
  * TextConverter contains utility functions for converting and formatting text
  */

public class TextConverter {

    private static final String kTemplateVariable = "__TEMPLATE_VAR__";

    /**
     * Converts <code>Boolean</code> value to a single char ( T or F )
     * for storage in the database
     *
     * @param b Boolean object to be converted
     * @return String containing single character representing value of b.
     * If b is <code>null</code> or <code>false</code> String will equal "F";
     * if b is not null and <code>true</code> String will equals "T"
     */
    public static String booleanToString( Boolean b ) {
        String converted = "F";

        if ( b != null && b.booleanValue() ) {
            converted = "T";
        }

        return converted;
    }

    /**
     * Converts <code>String</code> to <code>Boolean</code> value of
     * <code>true</code> or <code>false</code>.
     *
     * @param s String object to be converted
     * @return Boolean object with value of <code>true</code> or <code>false</code>.
     * If s is not <code>null</code> and equals "F" Boolean will be
     * <code>false</code>; if s is not null and equals "T", Boolean will be
     * <code>true</code>
     */
    public static Boolean stringToBoolean( String s ) {
        Boolean converted = null;

        if ( s != null && s.equals( "T" ) ) {
            converted = new Boolean( true );
        } else if ( s != null && s.equals( "F" ) ) {
            converted = new Boolean( false );

        }
        return converted;
    }

    /**
     * Converts <code>Boolean</code> value to a String ( "yes" or "no" )
     * for formatted display.
     *
     * @param b Boolean object to be converted
     * @return String containing word representing value of b.  If b is
     * <code>null</code> or <code>false</code> String will equal "no";
     * if b is not null and <code>true</code> String will equals "yes"
     */
    public static String booleanToWord( Boolean b ) {
        String converted = null;
        if ( b != null && b.booleanValue() ) {
            converted = "yes";
        } else {
            converted = "no";
        }
        return converted;
    }


    /**
     * Converts primitive <code>boolean</code> value to a String ( "yes" or "no" )
     * for formatted display.
     *
     * @param b primitive boolean value to be converted
     * @return String containing word representing value of b.  If b is <code>false</code>
     * String will equal "no";  if b is <code>true</code> String will equals "yes"
     */
    public static String booleanToWord( boolean b ) {
        String converted = null;
        if ( b ) {
            converted = "yes";
        } else {
            converted = "no";
        }
        return converted;
    }


    /**
     * Escapes single quote characters in submitted String for safe submission to
     * database.
     *
     * @param value String to be examined for characters that need escaping
     * @return String of submitted non null value with any single quotes escaped,
     * or <code>null</code> if submitted value is null
     */
    public static String escapeChars( String value ) {
        String converted = null;
        if ( value != null ) {
            if ( value.indexOf( '\'' ) > -1 ) {
                StringBuffer buffer = new StringBuffer();
                char[] tmp = value.trim().toCharArray();
                for ( int i = 0; i < tmp.length; i++ ) {
                    if ( tmp[ i ] == '\'' ) {
                        buffer.append( '\'' );
                        buffer.append( '\'' );
                    } else {
                        buffer.append( tmp[ i ] );
                    }
                }
                converted = buffer.toString();
            } else {
                converted = value;
            }
        }
        return converted;
    }


    /**
     * Adds quotes around submitted value for correct submission to the database.
     * String values will have any single quotes within them escaped, and will be
     * surrounded by single quotes so that the output may be directly included in
     * a SQL command
     *
     * @param value String to be quoted
     * @return Original String value with any single quotes escaped, and with single
     *  quotes around any non null value,  or <code>null</code> if submitted value
     *  is null
     * @see #escapeChars( String )
     */
    public static String dbQuote( String value ) {
        String quoted = null;
        if ( value != null ) {
            quoted = "'" + escapeChars( value.trim() ) + "'";
        }
        return quoted;
    }
    
    /**
     * Adds quotes around submitted value for correct submission to the database.
     * Long values are translated to String equivalent without single quotes so
     * that the output may be directly included in a SQL command
     *
     * @param value Long to be quoted
     * @return String equivalent of non null Long value or <code>null</code>
     * if submitted value is null
     */
    public static String dbQuote( Long value ) {
        String quoted = null;

        if ( value != null ) {
            quoted = value.toString();
        }

        return quoted;

    }

    /**
     * Adds quotes around submitted value for correct submission to the database.
     * BigInteger values are translated to String equivalent without single quotes so
     * that the output may be directly included in a SQL command
     *
     * @param value BigInteger to be quoted
     * @return String equivalent of non null BigInteger value or <code>null</code>
     * if submitted value is null
     */
    public static String dbQuote( BigInteger value ) {
        String quoted = null;

        if ( value != null ) {
            quoted = value.toString();
        }

        return quoted;

    }

    /**
     * Adds quotes around submitted value for correct submission to the database.
     * Float values are translated to String equivalent without single quotes so
     * that the output may be directly included in a SQL command
     *
     * @param value Float to be quoted
     * @return String equivalent of non null Float value or <code>null</code>
     * if submitted value is null
     */
    public static String dbQuote( Float value ) {
        String quoted = null;

        if ( value != null ) {
            quoted = value.toString();
        }

        return quoted;

    }


    /**
     * Adds quotes around submitted value for correct submission to the database.
     * Integer values are translated to String equivalent without single quotes so
     * that the output may be directly included in a SQL command
     *
     * @param value Integer to be quoted
     * @return String equivalent of non null Integer value or <code>null</code>
     * if submitted value is null
     */
    public static String dbQuote( Integer value ) {
        String quoted = null;

        if ( value != null ) {
            quoted = value.toString();
        }

        return quoted;

    }

    /**
     * Adds quotes around submitted value for correct submission to the database.
     * Date values are translated to mm/dd/yyyy String equivalent using dateToString()
     * and are returned enclosed in single quotes so that the output may be directly
     * included in a SQL command. This version translates the sumbitted date to the
     * simple date (mm/dd/yyyy) representation of the date. NOTE: this format is
     * interpreted by Sybase 12:00:00 on the day, which may not be desired. For
     * fine-grained representation of date, use dbQuote( java.util.Date, boolean )
     * version of method
     *
     * @param value Date to be quoted
     * @return Formatted String equivalent of non null Date value or <code>null</code>
     * if submitted value is null
     */
    /*
    public static String dbQuote( java.util.Date value ) {
        String quoted = null;
        if ( value != null ) {
            quoted = "'" + dateToString( value ) + "'";
        }
        return quoted;
    }
    */
    public static String dbQuote( java.util.Date value, String format ) {
        String quoted = null;
        if ( value != null ) {
            quoted = "TO_DATE('" + dateToString( value ) + "', '" + format + "')";
        }
        return quoted;
    }

    /**
     * Adds quotes around submitted value for correct submission to the database.
     * Date values are translated to mm/dd/yyyy String equivalent using dateToString()
     * and are returned enclosed in single quotes so that the output may be directly
     * included in a SQL command. This version optionally lists the date object as its
     * full value, with hours, minutes and seconds.
     *
     * @param value Date to be quoted
     * @param fullListing If <code>true</code> date is quoted using full date information
     * (i.e. hour/minutes/seconds timestamping); if <code>false</code>, simple date
     * formatting (mm/dd/yyyy) is used
     * @return Formatted String equivalent of non null Date value or <code>null</code>
     * if submitted value is null
     */
/*    
     public static String dbQuote( java.util.Date value, boolean fullListing ) {
        String quoted = null;
        if ( value != null ) {
            if ( fullListing ) {
                SimpleDateFormat formatter =
                    new SimpleDateFormat( "MM/dd/yyyy ' ' hh:mm:ssa" );
                quoted = "'" +  formatter.format( value ) + "'";

            } else {
                quoted = "'" + dateToString( value ) + "'";
            }
        }
        return quoted;
    }



    /**
     * Converts Boolean object into single character equivalent and adds single
     * quotes around converted value so that output may be directly included in
     * a SQL command
     *
     * @param value Long to be quoted
     * @return String equivalent of non null Long value or <code>null</code> if
     * submitted value is null
     * @see #booleanToString( Boolean )
     */
    public static String dbQuote( Boolean value ) {
        String quoted = null;
        if ( value != null ) {
            quoted = "'" + booleanToString( value ) + "'";
        }
        return quoted;
    }
    
    /**
     * Converts String from the database for display in an HTML textarea form field.
     * Multiple line Strings are stored in the database with a "\" where each hard
     * return originally was entered.  dbToText replaces all backslashes with new
     * line character so that String displays correctly.
     *
     * @param value String to be converted
     * @return Original value with all backslashes converted to new line characters,
     * or null if submitted value is null
     * @see #textToDB( String )
     */
    public static String dbToText( String value ) {
        String converted = null;
        if ( value != null && value.indexOf( '\\' ) > -1 ) {
            converted = value.trim().replace( '\\', '\n' );
        } else {
            converted = value;
        }
        return converted;
    }


    /**
     * Converts multiple line String for storage in the database while stripping out
     * any whitespace characters that ar not new lines (such as the vertical tab) from
     * the entry.  Multiple line Strings are stored in the  database with a "\" where
     * each hard return originally was entered.  textToDB replaces all new lines characters
     * with a backslash, so that text entered from an HTML textarea, for example, is
     * stored correctly and can be easily re-formatted for display.
     *
     * @param value String to be converted
     * @return Original value with all new line characters converted to backslashes and all
     * whitespace characters that are not new line characters removed, or null if submitted
     * value is null
     * @see #dbToText( String )
     */
    public static String textToDB( String value ) {
        String converted = null;
        if ( value != null ) {
            char[] temp = value.toCharArray();
            StringBuffer buffer = new StringBuffer();
            for ( int i = 0; i < temp.length; i++ ) {
                if ( Character.isWhitespace( temp[ i ] ) ) {
                    if ( temp[ i ] != ' ' ) {
                        if ( temp[ i ] == '\n' ) {
                            buffer.append( "\\" );
                        }
                    } else {
                        buffer.append( temp[ i ] );
                    }
                } else {
                    buffer.append( temp[ i ] );
                }
            }
            converted  = buffer.toString();
        }
        return converted;
    }


    /**
     * Converts String from the database for HTML display. Multiple line Strings
     * are stored in the database with a "\" where each hard return originally was
     * entered.  dbToHTML replaces all backslashes with HTML line breaks ("<BR>") so
     * that String displays correctly.
     *
     * @param value String to be converted
     * @return Original value with all backslashes converted to HTML line breaks, or
     * null if submitted value is null
     */
    public static String dbToHTML( String value ) {
        String converted = null;
        if ( value != null && value.indexOf( '\\' ) > -1 ) {
            char[] temp = value.toCharArray();
            StringBuffer buffer = new StringBuffer();
            for ( int i = 0; i < temp.length; i++ ) {
                if ( temp[ i ] == '\\' ) {
                    buffer.append( "<br>" );
                } else {
                    buffer.append( temp[ i ] );
                }
            }
            converted = buffer.toString();
        } else {
            converted = value;
        }
        return converted;
    }



    /**
     * Converts String from the database for email export to ABRC. Multiple line Strings
     * are stored in the database with a "\" where each hard return originally was entered.
     * dbToExportEmail replaces all backslashes with vertical tabs (\u000b) so that ABRC
     * can import and store multiple line addresses
     *
     * @param value String to be converted
     * @return Original value with all backslashes converted to vertical tabs, or null if
     * submitted value is null
     */
    public static String dbToExportEmail( String value ) {
        String converted = null;
        if ( value != null &&
             ( value.indexOf( '\\' ) > -1 || value.indexOf( "\n" ) > -1 ) ) {

            char[] temp = value.toCharArray();
            StringBuffer buffer = new StringBuffer();
            for ( int i = 0; i < temp.length; i++ ) {
                if ( temp[ i ] == '\\' || temp[ i ] == '\n' ) {
                    // use vertical tab for multiline address --
                    // good for ABRC's import process
                    char separator = '\u000b';
                    buffer.append( separator );
                } else {
                    buffer.append( temp[ i ] );
                }
            }
            converted = buffer.toString();
        } else {
            converted = value;
        }
        return converted;
    }


    /**
     * Converts String from the database for display in email messages. Multiple line
     * Strings are stored in the database with a "\" where each hard return originally
     * was entered.  dbToEmail replaces all backslashes with new line character so that
     * multiple line Strings display correctly in email.
     *
     * @param value String to be converted
     * @return Original value with all backslashes converted to new line characters, or
     * null if submitted value is null
     */
    public static String dbToEmail( String value ) {
        String converted = null;
        if ( value != null && value.indexOf( '\\' ) > -1 ) {
            char[] temp = value.toCharArray();
            StringBuffer buffer = new StringBuffer();
            for ( int i = 0; i < temp.length; i++ ) {
                if ( temp[ i ] == '\\' ) {
                    buffer.append( '\n' );
                } else {
                    buffer.append( temp[ i ] );
                }
            }
            converted = buffer.toString();
        } else {
            converted = value;
        }
        return converted;
    }


    /**
     * Converts Date object into String representation in "mm/dd/yyyy"" format,
     * or returns an empty string if the specified date is null
     *
     * @value Date to be converted
     * @return String representation of date in "mm/dd/yyyy" format, or
     * <code>""</code> if submitted value is null
     * @see java.text.SimpleDateFormat
     */
    public static String dateToString( java.util.Date value ) {
        String formatted = "";
        if ( value != null ) {
            SimpleDateFormat formatter = new SimpleDateFormat ("MM/dd/yyyy");
            formatted = formatter.format( value );
        }
        return formatted;
    }



    /**
     * Converts Unix-style wildcards into database wildcard values for searching.
     * "*" is converted to "%", and "?" is converted to "_".  If "%" or "?" are in
     * the String, they will be formatted with an escape "\" so that String
     * will search for those characters as literal values.  Additionally, any characters
     * in submitted value will optionally be translated so that both uppercase and
     * lowercase values are searched for.
     *
     * @param value String to be converted
     * @textField If <code>true</code> all characters in value will be translated into a
     * character class containing both upper and lower case values so that a case insensitive
     * search is executed. If <code>false</code> then characters will be returned as they
     * were submitted
     * @return Original value with wildcards converted
     */
    public static String convertWildcards( String value, boolean textField ) {
        String retVal = null;
        StringBuffer buffer = null;

        if ( value != null ) {
            buffer = new StringBuffer();
            char[] temp = value.toCharArray();

            for ( int i = 0; i < value.length(); i++ ) {

                // if current char is \, check next for wildcard & unescape for literal search
                if ( temp[ i ] == '\\' ) {
                    if ( temp[ i + 1 ] == '*' || temp[ i + 1 ] == '?' ) {
                        // increment i so we don't check this letter again
                        buffer.append( temp[ ++i ] );
                    } else {
                        // otherwise, add \ to string
                        buffer.append( temp[ i ] );
                    }

                } else if ( temp[ i ] == '*' ) {
                    buffer.append( '%' );

                } else if ( temp[ i ] == '?' ) {
                    buffer.append( '_' );

                } else if ( temp[ i ] == '%' || temp[ i ] == '_' ) {
                    buffer.append( '\\' );
                    buffer.append( temp[ i ] );
                } else if ( Character.isLetter( temp[ i ] ) && textField ) {
                    buffer.append( '[' );
                    buffer.append( Character.toUpperCase( temp[ i ] ) );
                    buffer.append( Character.toLowerCase( temp[ i ] ) );
                    buffer.append( ']' );

                } else {
                    buffer.append( temp[ i ] );
                }
            }
        }

        if ( buffer != null ) {
            retVal = buffer.toString();
        }
        return retVal;
    }


    /**
     * Converts Unix-style wildcards into database wildcard values for searching.
     * "*" is converted to "%", and "?" is converted to "_".  If "%" or "?" are in
     * the String, they will be formatted as a character class (with []) so that String
     * will search for those characters as literal values.
     *
     * @param value String to be converted
     * @return Original value with wildcards converted
     */
    public static String convertWildcards( String value ) {
        return convertWildcards( value, false );
    }


    /**
     * Removes Unix-style wildcard characters "*" and "?" from submitted value. Used to
     * ignore user input of wildcard characters in search fields. stripWildcards assumes
     * that any presence of these characters is undesirable and removes them.
     *
     * @param value String to be converted
     * @return Original value with wildcards removed
     */
    public static String stripWildcards( String value ) {
        String retValue = null;
        if ( value != null ) {
            StringBuffer buffer = new StringBuffer();
            char[] temp = value.toCharArray();
            for ( int i = 0; i < value.length(); i++ ) {
                if ( temp[ i ] == '*' || temp[ i ] == '?' ) {
                    continue;
                }
                buffer.append( temp[ i ] );
            }
            retValue = buffer.toString();
        }
        return retValue;
    }



    /**
     * Tests whether a String is empty by checking whether it is null, or contains an empty
     * String.  isEmpty is good for testing parameters in an <code>HttpServletRequest</code>
     * since form field parameters are often not null even if they are empty.
     *
     * @param value String to be tested
     * @return <code>true</code> if submitted value is null or contains an empty String;
     * <code>false</code> if value is not null and is not equal to the empty string.
     */
    public static boolean isEmpty( String value ) {
        boolean empty = true;
        if ( value != null && value.length() > 0 && !value.trim().equals( "" ) ) {
            empty = false;
        }
        return empty;
    }


    /**
     * Converts String IDs to their Long equivalents.  Useful for converting IDs received
     * from web forms into their more useful Long form, since all Tfc classes use Longs to
     * represent IDs and keys.
     *
     * @param tmpIDs Array of Strings to be translated to Longs
     * @return Array of Long values representing submitted String IDs, or null if submitted
     * Array is null. If submitted Array is not null, but individual elements are, those
     * elements will appear as null in the returned Long Array.
     * @throws NumberFormatException if submitted String is not convertable to Long
     */
    public static Long[] stringToLongArray( String[] tmpIDs )
        throws NumberFormatException {

        Long[] converted = null;
        if ( tmpIDs != null && tmpIDs.length > 0 ) {
            converted = new Long[ tmpIDs.length ];
            for ( int i = 0; i < tmpIDs.length; i++ ) {
                if ( tmpIDs[ i ].equalsIgnoreCase( "null" )  ) {
                    converted[ i ] = null;
                } else {
                    converted[ i ] = new Long( tmpIDs[ i ] );
                }
            }
        }
        return converted;
    }

	public static Long[] toLongArray(String[] strs) throws NumberFormatException {
		if(strs == null) return new Long[]{};
		Long lngs[] = new Long[strs.length];
		for(int i = 0; i < strs.length; ++i)
			lngs[i] = new Long(strs[i]);
		return lngs;
	}


    /**
     * Converts String IDs to their primitive int equivalents.  Useful for converting
     * numbers received from web forms into their more useful int form -- specifically
     * for receiving download requests from search summary pages where submitted number
     * is collection index of item requested for download.
     *
     * @param tmpIDs Array of Strings to be translated to Longs
     * @return Array of int values representing submitted String IDs, or null if submitted
     *  Array is null. If submitted Array is not null, but individual elements are, those
     *  elements will appear as 0 in the returned int array.
     * @throws NumberFormatException if submitted String is not convertable to int
     */
    public static int[] stringToIntArray( String[] tmpIDs )
        throws NumberFormatException {

        int[] converted = null;
        if ( tmpIDs != null && tmpIDs.length > 0 ) {
            converted = new int[ tmpIDs.length ];
            for ( int i = 0; i < tmpIDs.length; i++ ) {
                if ( tmpIDs[ i ].equalsIgnoreCase( "null" )  ) {
                    converted[ i ] = 0;
                } else {
                    converted[ i ] = Integer.parseInt( tmpIDs[ i ] );
                }
            }
        }
        return converted;
    }


  /**
   * Converts String IDs to their BigInteger equivalents. Useful for converting
   * IDs received from web forms into their more useful BigInteger form, since
   * all data access classes use BigIntegers to represent IDs and keys.
   * 
   * @param tmpIDs Array of Strings to be translated to BigIntegers
   * @return List of BigInteger values representing submitted String IDs, or
   *         null if submitted array is null. If submitted array is not null,
   *         but individual elements are, those elements will appear as null in
   *         the returned BigInteger List.
   * @throws NumberFormatException if submitted String is not convertible to
   *           BigInteger
   */
  public static List<BigInteger> stringToBigIntList(String[] tmpIDs)
      throws NumberFormatException {

    List<BigInteger> converted = null;
    if (tmpIDs != null && tmpIDs.length > 0) {
      converted = new ArrayList<BigInteger>(tmpIDs.length);
      for (int i = 0; i < tmpIDs.length; i++) {
        if (tmpIDs[i].equalsIgnoreCase("null")) {
          converted.add(i, null);
        } else {
          converted.add(i, new BigInteger(tmpIDs[i]));
        }
      }
    }
    return converted;
  }

    /**
     * Converts ends of search string to match selected search method. Search methods
     * are as following:
     * <ul>
     * <li>contains - will add wildcard character % to both ends of search string</li>
     * <li>starts with - will add wild card character % to end of search string</li>
     * <li>ends with - will add wild card character % to beginning of search string</li>
     * <li>exactly - does nothing to search string</li>
     * </ul>
     *
     * @param term <code>String</code> to search for
     * @param method <code>String</code> search method to alter term by
     * @return <code>String</code> containing term and appropriate wildcard characters
     */
    public static String convertEnds(String term, String method) {
        return convertEnds( term, method, false );
    }

    /**
     * Converts ends of search string to match selected search method. Search methods
     * are as following:
     * <ul>
     * <li>contains - will add wildcard character % to both ends of search string</li>
     * <li>starts with - will add wild card character % to end of search string</li>
     * <li>ends with - will add wild card character % to beginning of search string</li>
     * <li>exactly - does nothing to search string</li>
     * </ul>
     *
     * <p>
     * This version of the method allows for searching a text field for term in
     * a case insensytive manner by creating a character class containing upper
     * & lower case versions of each character.
     *
     * @param term <code>String</code> to search for
     * @param method <code>String</code> search method to alter term by
     * @isTextField If <code>true</code> all characters in value will be translated
     *  into a character class containing both upper and lower case values so that
     *  a case insensitive search is executed. If <code>false</code> then characters
     *  will be returned as they were submitted
     * @return <code>String</code> containing term and appropriate wildcard characters
     */
    public static String convertEnds( String term,
                                            String method,
                                            boolean isTextField )
    {

        String tmp_name = null;
        if ( term != null &&
             method != null &&
             DataConstants.SEARCH_METHODS.containsKey( method ) ) {

            term = convertWildcards( term, isTextField );

            if ( method.equals( DataConstants.SEARCH_CONTAINS ) ) {
                tmp_name = "%" + term + "%";
            } else if ( method.equals( DataConstants.SEARCH_STARTS ) ) {
                tmp_name = term + "%";

            } else if ( method.equals( DataConstants.SEARCH_ENDS ) ) {
                tmp_name = "%" + term;

            } else if( method.equals( DataConstants.SEARCH_EXACT ) ) {
                tmp_name = term;
            }

            // if method null or not a valid value return unaltered string
        } else {
            tmp_name = term;
        }
        return tmp_name;
    }

    // --- methods to assist in generating more "free text"-like queries.

    /**
     * Given a search string (usually the search string input by the user
     * via a web form), construct and return a new template string that
     * is appropriate SQL for a free text search. For example, "foo 'bar baz' zip"
     * will turn into "variableName LIKE '%foo%' AND variableName LIKE '%bar baz%' AND variableName LIKE '%zip%'.
     */

    public static String convertEndsFreeText( String method, String userQuery, String templateValue ) {

        // support unix-style wildcards.
        String convertedQuery = userQuery;

        // extract the sub-strings, respecting quoted regions.
        Collection<String> searchParts = parseParts( convertedQuery );

        // construct the new query fragment from all the sub-parts we just parsed out.
        String templatedQuery = partsToTemplate( method, searchParts );

        // finally, put in the caller's variable name so the query
        // fragment we return will search the desired column.
        String finalQuery = realizeTemplate( templatedQuery, templateValue );

        return( finalQuery );
    }

    /**
     * Convert a template query by replacing the template areas with
     * the given replacement string, which is generally a column name.
     */
    private static String realizeTemplate( String template, String replacement ) {
        String output = "";
        PatternCompiler compiler = new Perl5Compiler();
        PatternMatcher matcher = new Perl5Matcher();

        try {
            Pattern pattern = compiler.compile( kTemplateVariable );
            output = Util.substitute( matcher, pattern, new StringSubstitution(replacement), template, Util.SUBSTITUTE_ALL );
        }
        catch( MalformedPatternException mpe ) {
            System.err.println( "TextConverter.realizeTemplate(): " + mpe );
        }

        return( output );
    }

    /**
     * @return Collection of strings extracted from input 'term', respecting quoted regions.
     * Thus input = "foo 'bar baz' zip" will return "foo", "bar baz", "zip".
     */
    private static Collection<String> parseParts( String term )
    {
        // first, get all the quoted strings.
        Collection<String> searchParts = new ArrayList<String>();
        String reducedTerm = extractPattern( "'([^']*)'", term, searchParts );
        reducedTerm = extractPattern( "\"([^\"]*)\"", reducedTerm, searchParts );

        // second, get all remaining non-empty terms.
        if( false == reducedTerm.trim().equals( "" ) )
        {
            PatternCompiler compiler = new Perl5Compiler();
            PatternMatcher matcher = new Perl5Matcher();
            try {
                Pattern pattern = compiler.compile( "\\s+" );
                Util.split( searchParts, matcher, pattern, reducedTerm );
            }
            catch( MalformedPatternException mpe ) {
                System.err.println( "TextConverter.parseParts(): " + mpe );
            }
        }

        return( searchParts );
    }

    /**
     * Given a regular expression, remove matches from the input string and
     * store them in the given Collection. Note: it is assumed that the
     * regular expression has one parenthasized matching group which
     * is the text to be placed in the Collection. Text outside of that
     * group which still matches the regexp is deleted.
     * @return String that is 'input' with all 'regex' matches deleted.
     */
    private static String extractPattern(String regex, String input, Collection<String> found) {
        String output = "";
        PatternCompiler compiler = new Perl5Compiler();
        PatternMatcher matcher = new Perl5Matcher();

        try {
            Pattern pattern = compiler.compile(regex);

            PatternMatcherInput matcherInput = new PatternMatcherInput( input );
            while( matcher.contains( matcherInput, pattern ) ) {
                MatchResult result = matcher.getMatch();
                if( result.groups() > 0 ) {
                    String sub = result.group( 1 );
                    found.add( sub );
                }
            }

            output = Util.substitute( matcher, pattern, new StringSubstitution(), input, Util.SUBSTITUTE_ALL );
        }
        catch( MalformedPatternException mpe ) {
            System.err.println( "TextConverter.extractPattern(): " + mpe );
        }

        return (output);
    }

    /**
     * Given a Collection of Strings which are the sub-queries
     * of the original input search string, construct SQL
     * to do a text search. The returned string uses TextConverter.kTemplateVariable
     * which must be replaced with replaceTemplateTerm().
     * @see #replaceTemplateTerm( String, String )
     */
    private static String partsToTemplate( String method, Collection<String> parts ) {
        StringBuffer buf = new StringBuffer();

        Iterator<String> iter = parts.iterator();
        while (iter.hasNext()) {
            String part = iter.next();

            if (buf.length() > 0) {
                buf.append(" AND ");
            }

            buf.append(kTemplateVariable);
            buf.append(" LIKE ");

            buf.append( "'" );
            if( method != null && DataConstants.SEARCH_METHODS.containsKey( method ) ) {
                if ( method.equals( DataConstants.SEARCH_CONTAINS ) ) {
                    buf.append( "%" );
                    buf.append( part );
                    buf.append( "%" );
                } else if ( method.equals( DataConstants.SEARCH_STARTS ) ) {
                    buf.append( part );
                    buf.append( "%" );
                } else if ( method.equals( DataConstants.SEARCH_ENDS ) ) {
                    buf.append( "%" );
                    buf.append( part );
                } else if( method.equals( DataConstants.SEARCH_EXACT ) ) {
                    buf.append( part );
                }
            }
            else {
                // defaults to exact matching.
                buf.append( part );
            }
            buf.append( "' ESCAPE '\\\'" );
        }

        return (buf.toString());
    }

    // --- end of: methods to assist in generating more "free text"-like queries.

    /**
     * Converts methods from numeric number to a descriptive string
     * to describe the search method.  If submitted term is null,
     * it will be treated as an exact match - this is done to conform
     * with the convertEnds method, which will make the same kind
     * of default when adding wildcards to a search string
     *
     * @param term <code>String</code>
     * @return <code>String</code> containing term of method
     */
    public static String convertMethods(String term){
        String retval = null;

        if ( term == null || term.equals( DataConstants.SEARCH_EXACT ) ) {
            retval = "matches exactly";
        } else if ( term.equals( DataConstants.SEARCH_CONTAINS ) ) {
            retval = "contains";
        } else if ( term.equals( DataConstants.SEARCH_STARTS ) ) {
            retval = "starts with";
        } else if ( term.equals( DataConstants.SEARCH_ENDS ) ) {
            retval = "ends with";
        }

        return retval;
    }



    /**
     * Converts array of generic <code>Object</code>s to array of <code>String</code>
     * by calling toString() on any non-null object in values.
     *
     * @param values Array of Objects to be converted
     * @return String array of string value of all submitted values.
     */
    public static String[] toStringArray( Object[] values ) {
        String[] retValues = null;
        if ( values != null ) {
            retValues = new String[ values.length ];
            for ( int i = 0; i < values.length; i++ ) {
                if ( values[ i ] != null ) {
                    retValues[ i ] = values[ i ].toString();
                } else {
                    retValues[ i ] = null;
                }
            }
        }
        return retValues;
    }


    /**
     * Converts submitted Float object to a string with two decimal
     * places after it (0.00 or common money format).  If Float
     * is null or zero, the string "0.00" will be returned
     *
     * @param f Float to convert to a string
     * @return String containing value of Float to two decimal places,
     * or "0.00" if Float is null or zero.
     */
    public static String floatToString( Float f ) {
        String formatStr = null;
        DecimalFormat df = null;

        if ( f != null ) {
            df = new DecimalFormat( "0.00" );
            formatStr = df.format( f );
        } else {
            formatStr = "0.00";
        }
        return formatStr;
    }


    /**
     * Converts submitted primitive float to a string with two decimal
     * places after it (0.00 or common money format).  If float
     * is equal to zero, the string "0.00" will be returned
     *
     * @param f Primitive float to convert to a string
     * @return String containing value of float to two decimal places,
     * or "0.00" if float is zero
     */
    public static String floatToString( float f ) {
        String formatStr = null;
        DecimalFormat df = null;

        if ( f > 0 ) {
            df = new DecimalFormat( "0.00" );
            formatStr = df.format( f );
        } else {
            formatStr = "0.00";
        }
        return formatStr;
    }


    /**
     * Converts submitted Float object to a String in $US money format
     * ($0.00).
     *
     * @param f Float to convert
     * @return Submitted Float value in US money format; $0.00 returned
     * if submitted object is NULL
     */
    public static String floatToMoneyString( Float f ) {
     String formatStr = null;
        DecimalFormat df = new DecimalFormat( "$0.00" );

     if ( f == null ) {
         formatStr = "$0.00";
     } else {
            formatStr = df.format( f );
        }

        return formatStr;
    }

    /**
    * Converts submitted float primitive to a String in $US money format
    * ($0.00).
    *
    * @param f Float to convert
    * @return Submitted float value in US money format
    */
    public static String floatToMoneyString( float f ) {
     DecimalFormat df = new DecimalFormat( "$0.00" );

     return df.format( f );
    }

  /**
   * Convert a Double map position to a string value. A "bp" (base-pair) string
   * is always an Integer value, so convert it to an Integer by truncation.
   * Otherwise, just use toString() to convert the double to a string value. If
   * the position is null, return an empty string.
   * 
   * @param position the position to convert
   * @param units the unit of the position (bp, kb, cM)
   * @return a bp Integer string or a Double string or an empty string if
   *         position is null
   */
  public static String doublePositionToString(Double position, String units) {
    String positionString = "";

    if (position != null) {
      if (units == null || units.equalsIgnoreCase("bp")) {
        positionString = Integer.toString(position.intValue());
      } else {
        positionString = position.toString();
      }
    }

    return positionString;
  }

    /**
     * Truncates submitted string to whitespace nearest to character at index
     * submitted by length.  Returned string will then append "..." to show
     * that truncation has occurred. This is useful for gracefully abbreviating
     * a long string to the desired length (on summary pages, for instance).
     *
     * <p>
     * Method will return input string if input does not exceed submitted
     * length.
     *
     * <p>
     * If input exceeds submitted length, but does not have any whitespace that
     * can be used to gracefully abbreviate, string will be truncated directly at
     * desired length
     */
    public static String truncateString( String value, int length ) {
        String truncated = null;
        if ( value != null && value.length() > length ) {
            String tempStr = value.substring( 0, length );

            // find whitespace if possible, else rudely truncate string
            if ( tempStr.indexOf( " " ) > -1 ) {
                truncated = tempStr.substring( 0, tempStr.lastIndexOf( " " ) ) + "..." ;
            } else {
                truncated = tempStr;
            }

        } else {
            truncated = value;
        }
        return truncated;
    }


    /**
     * Given a arraylist of Strings, this method will return a big string
     * delimited by the given delim
     */
    public static String join(String delim, ArrayList v) {
        if (v.size() == 0)
            return "";
        if (v.size() == 1){
            return (String)v.get(0);
        }

        StringBuffer result = new StringBuffer("" + (String)v.get(0));
        for (int i = 1; i < v.size(); i++) {
            result.append(delim);
            result.append("" + (String)v.get(i) ) ;
        }
        return result.toString();
    }

    /**
     * Unlike normal String.substring(), this will bound stop to the
     * length of the string.
     */

    public static String safeSubstring(String s, int start, int len) {

        if (s == null) { s = ""; }

        return s.substring(start, Math.min(len,s.length() - start));
    }

    /**
     * SymbolLociCount to HTML
     * display  loci_count from GenenClassSymbol nicely
     * @param String the value in GeneClassSymbol
     * @return String remove "_" and Uppercase every first letter of each word
     */

    public static String  SymbolLociCountToHTML( String s){
        if (s.equalsIgnoreCase ("single_locus")) {
            return "Symbol Describes 1 Gene";
        }else if (s.equalsIgnoreCase ("multiple_loci")){
            return "Symbol Describes >1 Gene";
        }else {
            return "Number of Genes Unknown";
        }
    }

    /**
     * Converts all underscore characters in submitted string to a single
     * blank space.  This is done to easily convert database rule values, which
     * often use underscores instead of spaces, to display values on JSPs
     *
     * @param s String to convert
     * @return Submitted string with any underscores converted to white spaces
     */
    public static String uscoreToSpace( String s ) {
        String converted = null;

        if ( s != null && s.indexOf( '_' ) > -1 ) {
            converted = s.replace( '_', ' ' );
        } else {
            converted = s;
        }
        return converted;
    }

    /**
     * Combines two string arrays into one array that contains all values
     * from both arrays.  Arrays will be combined so that elements from
     * array1 are included in new array first, with first element of array2
     * immediately following the last element of array1.
     *
     * <p>
     * The combineStringArray methods are used primarily by the Tfc
     * classes to combine column names from the TairObject/MapElement
     * inheritance hierarchy.  This is done through these methods to
     * allow us to change the implementation of the combination if this
     * strategy doesn't work as well as expected.
     *
     * @return String array containing combined values of submitted
     * String arrays
     */
    public static String[] combineStringArrays( String[] array1,
                              String[] array2 )
    {

     String[] combined = new String[ array1.length + array2.length ];

     int combinedIndex = 0;

     // Combine arrays using System.arraycopy that should be
     // be faster than manually iterating through arrays
     System.arraycopy( array1, 0, combined, combinedIndex, array1.length );
     combinedIndex += array1.length;

     System.arraycopy( array2, 0, combined, combinedIndex, array2.length );

     return combined;
    }



    /**
     * Combines three string arrays into one array that contains all values
     * from both arrays.  Arrays will be combined so that elements from
     * array1 are included in new array first, with first element of array2
     * immediately following the last element of array1, and with first
     * element of array3 immediately following the last element of array2.
     *
     * <p>
     * The combineStringArray methods are used primarily by the Tfc
     * classes to combine column names from the TairObject/MapElement
     * inheritance hierarchy.  This is done through these methods to
     * allow us to change the implementation of the combination if this
     * strategy doesn't work as well as expected.
     *
     *
     * @return String array containing combined values of submitted
     * String arrays
     */
    public static String[] combineStringArrays( String[] array1,
                              String[] array2,
                              String[] array3 )
    {
     String[] combined = new String[ array1.length +
                         array2.length +
                         array3.length ];

     int combinedIndex = 0;

     // Combine arrays using System.arraycopy that should be
     // be faster than manually iterating through arrays
     System.arraycopy( array1, 0, combined, combinedIndex, array1.length );
     combinedIndex += array1.length;

     System.arraycopy( array2, 0, combined, combinedIndex, array2.length );
     combinedIndex += array2.length;

     System.arraycopy( array3, 0, combined, combinedIndex, array3.length );

     return combined;
    }


    /**
     * For a given string ,this function will seperate the string into a few fixed length lines
     * and for each line, it has fixed_length segments
     * this is for displaying in html page
     * @param String the input string
     * @param int the number of characters every line has
     * @param int the number of characters each segment has
     * @return a new String with <BR> in between for displaying as seperate lines, and each line has
     * fixed length segments, these segments are seperated by whitespaces
     */

    // this is used for displayig sequence content in sequence detail pages

    public static String breakStringIntoSegmentLines ( String inputString,
                                                       int lengthPerLine,
                                                       int lengthPerSegment){
     StringBuffer returnString = new StringBuffer ( );
        int length = inputString.length();
        int rowCount = (int) Math.ceil( ( (double) length)/ ( (double) lengthPerLine ) );
        for ( int i = 0; i < rowCount; i++ ) {
              String content = inputString.substring( lengthPerLine * i,
                                Math.min( lengthPerLine * ( i + 1 ), length ) );
           int index = i * lengthPerLine + 1;
              String alignedIndex = alignIndex (  length , index );
              String segmentString  =  segmentWithWhiteSpace ( content , lengthPerSegment );
           returnString.append ( alignedIndex + "&nbsp;"+ segmentString );
              if ( i < rowCount -1 ){
                  returnString.append ("<BR>" );
              }
        }
        return returnString.toString();
    }

    // make the index right aligned, -- left padding with whitespace
    // this is for displaying the index right alighed in jsp/html pahe
    private static String alignIndex ( int max , int number ){
        int maxLength  = Integer.toString( max ).length();
        String s = Integer.toString (number);
     if (s.length () > maxLength ) {
         s =  s.substring (0,maxLength) ;
        } else if (s .length() < maxLength ){
            StringBuffer buffer = new StringBuffer ( );
            for ( int i = 0; i < maxLength - s .length() ; i++  ){
             buffer.append ( "&nbsp;");
         }
         buffer.append (s);
         s = buffer.toString ();
     }
     return s;
    }

    /**
     * For a given string ,this function break it into fix_length segments
     * seperated with whitespace
     * this is for displaying in html page
     * @param String the input string
     * @param int the number of characters each segment has
     * @return a new String with whitespace in between each segments
     */
    public static String segmentWithWhiteSpace (String inputString, int lengthPerSegment) {
        StringBuffer returnString = new StringBuffer();
        int segmentCount =  (int) Math.ceil( ( (double) inputString.length() )/ ( (double) lengthPerSegment ) );

     for (int i = 0; i < segmentCount ; i++ ){
         String thisSegment  = inputString.substring ( i * lengthPerSegment ,
                                 Math.min( (i+1) * lengthPerSegment, inputString.length() ));
            returnString.append ( thisSegment  );
            // the last section doesn't need white space
            if ( i < segmentCount - 1 ){
              returnString.append ("&nbsp;");
            }
     }

     return returnString.toString();
    }


    /** Given exception e, tries to extract a string of its stack trace.
     * @param Throwable a Throwable object
     * @return a new String with the stack trace
     */
    public static String getStackTrace(Throwable e) {
     try {
         java.io.StringWriter swriter = new java.io.StringWriter();
         java.io.PrintWriter pwriter = new java.io.PrintWriter(swriter);
         e.printStackTrace(pwriter);
         pwriter.close();
         swriter.close();
         return swriter.toString();
     } catch (java.io.IOException e2) {
         return e.toString();
     }
    }

	public static Map scrub(Map params){
		if(params == null) return null;
		Map m = new HashMap();
		for(Object o : params.keySet()){
			Object val = params.get(o);
			m.put(o, (val instanceof String && val != null) ? ((String)val).replaceAll("<","&lt;").replace(">","&gt;") : val);
		}
		return m;
	}
}
