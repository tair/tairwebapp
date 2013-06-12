/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import org.tair.tfc.*;
import java.util.Comparator;

/**
 * For comparing the KeywordLite object , oder them alphabetically
 * according their type 
 */

public class KeywordComparator implements Comparator{

  public int compare( Object left_hand, Object right_hand ) {
    KeywordLite left_hand_kw = ( KeywordLite ) left_hand;  
    KeywordLite right_hand_kw = ( KeywordLite ) right_hand;  
    String left_hand_type = left_hand_kw.getKeywordType();
    String right_hand_type = right_hand_kw.getKeywordType();    
    int result = 0;    
    if ( left_hand_type != null && right_hand_type != null ) {
      result = left_hand_type.compareTo( right_hand_type );
    } else { // nulls
      result = -1;
    }
    return result;
  }

}

