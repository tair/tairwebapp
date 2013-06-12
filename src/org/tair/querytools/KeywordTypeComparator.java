/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import org.tair.tfc.*;
import java.util.Comparator;

/**
 * For comparing KeywordType object 
 */

public class KeywordTypeComparator implements Comparator{

  public int compare( Object left_hand, Object right_hand ) {
    KeywordType left_hand_kw = ( KeywordType ) left_hand;  
    KeywordType right_hand_kw = ( KeywordType ) right_hand;  
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

