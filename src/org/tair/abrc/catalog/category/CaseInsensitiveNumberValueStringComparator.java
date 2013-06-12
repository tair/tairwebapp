// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// -----------------------------------------------------------------------
package org.tair.abrc.catalog.category;

import java.util.Comparator;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;


/**
 *
 * Compares two strings using Integers as delimiters for comparison.
 *
 */
public class CaseInsensitiveNumberValueStringComparator implements Comparator {

  private static final Logger logger = Logger.getLogger(CaseInsensitiveNumberValueStringComparator.class);

    private static final Pattern TYPE_1 = Pattern.compile("^(\\D+)(.*)$");
    private static final Pattern TYPE_2 = Pattern.compile("^(\\d+)(.*)$");

    /**
     * Compares two Strings
     *
     * @param o1 Object to compare against object 2
     * @param 02 Object to campare against object 1
     * @return -1 if o1 should sort before o2, 1 if o2 should
     * sort before o1, or 0 if items are equal
     */
    public int compare( Object o1, Object o2 ) {
	int result = 0;

	String s1 = (String) o1;
	String s2 = (String) o2;

	Matcher m1t1 = TYPE_1.matcher(s1);
	Matcher m2t1 = TYPE_1.matcher(s2);

	Matcher m1t2 = TYPE_2.matcher(s1);
	Matcher m2t2 = TYPE_2.matcher(s2);
	
	// both start with non-digit
	if (m1t1.matches() && m2t1.matches()) {
	    // compare non-digit portion
	    result = m1t1.group(1).compareToIgnoreCase(m2t1.group(1));

	    // sort by the rest if there is any
	    if (result == 0 && m1t1.group(2) != null && m2t1.group(2) != null) {
		result = this.compare(m1t1.group(2), m2t1.group(2));
	    } else if (result == 0 && m1t1.group(2) == null) {
		result = 1;
	    } else if (result == 0 && m2t1.group(2) == null) {
		result = -1;
	    }
	    
	    // both start with a digit value
	} else if (m1t2.matches() && m2t2.matches()) {
	    Integer number1 = Integer.valueOf(m1t2.group(1));
	    Integer number2 = Integer.valueOf(m2t2.group(1));

	    // compare digit portion
	    result = number1.compareTo(number2);

	    // sort by the rest if there is any
	    if (result == 0 && m1t2.group(2) != null && m2t2.group(2) != null) {
		result = this.compare(m1t2.group(2), m2t2.group(2));
	    } else if (result == 0 && m1t2.group(2) == null) {
		result = 1;
	    } else if (result == 0 && m2t2.group(2) == null) {
		result = -1;
	    }

	    // sort values that start with digits ahead of those who dont
	} else if (m1t1.matches() && m2t2.matches()) {	
	    result = 1;
  	} else if (m1t2.matches() && m2t1.matches()) {
	    result = -1;
	} else {
	    // this should never happen
	    result = s1.compareToIgnoreCase(s2);
	}


        return result;
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

        try{
	    CaseInsensitiveNumberValueStringComparator c = new CaseInsensitiveNumberValueStringComparator();
	    String s1, s2;

	    s1 = "E2 (W)";
	    s2 = "E12 (R)";

	    int result = c.compare(s1, s2);
	    logger.debug("compare(" +s1+ "," +s2+ ") = " + result);

	    TreeSet<String> t = new TreeSet<String>(c);

	    t.add("E2 (W)");
	    t.add("E12 (R)");
	    t.add("D9");
	    t.add("D9 (W)");
	    t.add("C81 (R) ");

	    logger.debug("treeSet:"+t);


        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
