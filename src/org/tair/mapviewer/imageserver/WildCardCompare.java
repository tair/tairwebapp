
/*
 * <application> - <description>
 * Copyright (c) 1999 Jere E. McDevitt
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 * Jere E. McDevitt <jemcdevitt@mindspring.com>
 *
 * $Header: /gjt/cvsroot/java/org/gjt/jem/utils/string/WildCardCompare.java,v 1.2 1999/02/10 22:17:51
 jem Exp $
*/

package org.tair.mapviewer.imageserver;

//Import Statements


/**
 * WildCardCompare.java
 * <p>
 * This class implements a simple wild card string
 * comparison routine.
 * <p>
 * Created: Fri Feb  5 18:50:08 1999
 *
 * @author    Jere McDevitt
 * @version   $Revision: 1.2 $    Last Update: $Date: 2001/02/15 21:39:48 $
 */

public class WildCardCompare  {
    
    
    ////Class (static) variables 
    static public final String REVISION="$Revision: 1.2 $"; 
    
    ////Instance variables 
    
    public static void main( String sPar[] ) {
        if ( sPar.length >= 2 )
            System.err.println( "" + isMatch(sPar[0].trim(),
					     sPar[1].trim() ) );
        else
            System.err.println( "missing param.");
    }
    
    
    
    /**
     * This method does a wildcard match on pattern with the given string.
     * It returns true if the given string is represented by the given
     * pattern.
     *
     * @param    pattern the regexp pattern to use
     * @param    string  the string to check against pattern
     * @return   true if string represented by pattern, false else
     **/
    static public boolean isMatch(String pattern, String string) {
	int pi;
	int si;
	
	int slen = string.length();
	int plen = pattern.length();
	
	pi = 0;
	si = 0;
	while ( pi < plen ) {
	    if ( pattern.charAt(pi) == '?' ) {
		/* Match exactly one arbitrary character */
		if ( si == slen )
		    return false;
		pi++;
		si++;
	    }
	    else if ( pattern.charAt(pi) != '*' ) {
		/* Match one specific character */
		if ( si == slen || string.charAt(si) != pattern.charAt(pi) )
		    return false;
		pi++;
		si++;
	    }
	    else {
		/* Match arbitrary number of arbitrary characters... */
		/* All sub-patterns of "*" and "%" are equivalent to */
		/* a simpler pattern of a single * and the right number of %'s */
		/* That is, it matches an arbitrary sequence of _at least_ */
		/* some number of characters.  Skip that many characters. */
		while (pi < plen &&
		       (pattern.charAt(pi) == '*' ||
			pattern.charAt(pi) == '?' )) {
		    if ( pattern.charAt(pi) == '?' ) {
			if ( si == slen )
			    return false;
			si++;
		    }
		    pi++;
		}
		/* The next character in the pattern is either a text character */
		/* or end-of-string */
		if ( pi == plen )    
		    return true;   /* Match remainder of string */
		
		/* If it's text, test all possible matches recursively */
		while ( si < slen) {
		    if ( string.charAt(si) == pattern.charAt(pi) ) {
			if ( isMatch(pattern.substring(pi+1),string.substring(si+1)) )
			    return true;
		    }
		    si++;
		}
		/* None of them matched */
		return false;
	    }
	} /* End while */
	/* If we get here, the pattern ran out without encountering a "*" wildcard */
	/* If the string has also run out, it matches.  If not, it doesn't match */
	return ( si == slen);
    }
    
} // WildCardCompare
