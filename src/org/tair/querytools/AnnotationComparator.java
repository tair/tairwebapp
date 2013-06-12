/*
 * $Id: AnnotationComparator.java
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.querytools;

import org.tair.tfc.*;
import org.tair.utilities.*;
import java.util.*;

// this comparator is for compare annotations by date.
// the annotation here is annotation table , which appears in tair_object_detail 
// page as the band ...'s comment
// this has nothing todo with the annotation band on detail page
// The  "annotation" in tfcAnnotation, AnnotationObject ,AnnotationObjectCollection
// referes to the same thing as this  
// while KeywordAnnotations.java and TairObjectAnnotationDetail.java refers to 
// the annotation band in detail page
            
public class AnnotationComparator implements Comparator{
    public int compare(Object lh, Object rh) {
	if(lh !=null && rh !=null){
	    Date left_date =((AnnotationObject)lh).get_date_entered();
	    Date right_date =((AnnotationObject)rh).get_date_entered();
	    
            if (right_date.before(left_date)){ return -1 ; }  
	    if (right_date.after(left_date)) { return 1 ; }
	}
	
	return 0;
	
    }
    
}

