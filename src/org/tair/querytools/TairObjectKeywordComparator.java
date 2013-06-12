/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
*/
package org.tair.querytools;

import org.tair.tfc.*;
import java.util.Comparator;

/**
 * For comparing the TairObjectKeyword object , order them by type, then alphabetically
 * according their tair_object_name 
 */

public class TairObjectKeywordComparator implements Comparator{

  public int compare( Object left_hand, Object right_hand ) {
    TairObjectKeyword left_hand_kw = ( TairObjectKeyword ) left_hand;  
    TairObjectKeyword right_hand_kw = ( TairObjectKeyword ) right_hand;  
    String left_hand_sort = left_hand_kw.getKeywordType() + left_hand_kw.getTairObjectName();
    String right_hand_sort = right_hand_kw.getKeywordType() + right_hand_kw.getTairObjectName(); 
    int result = 0;    
    if ( left_hand_sort != null && right_hand_sort != null ) {
      result = left_hand_sort.compareTo( right_hand_sort );
    } else { // nulls
      result = -1;
    }
    return result;
  }

}

