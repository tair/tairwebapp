/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/

package org.tair.querytools;

import org.tair.tfc.*;
import org.tair.utilities.*;
import java.util.*;

// this comparator is to order AnnotationCount objects so they will 
// disply in the desired way.
            
public class AnnotationCountDisplayComparator implements Comparator{
    public int compare(Object o1, Object o2) {

	AnnotationCount ac1 = ( AnnotationCount ) o1;
	AnnotationCount ac2 = ( AnnotationCount ) o2;

	String table1 = ac1.getChildTableName();
	String table2 = ac2.getChildTableName();
	
	Integer i1 = translate(table1);
	Integer i2 = translate(table2);

	return i1.compareTo(i2);	
    }


    private Integer translate(String table) {

	if (table.equals("Locus")) {
	    return new Integer(1);
	} else if (table.equals("Gene")) {
	    return new Integer(2);
	} else if (table.equals("Publication")) {
	    return new Integer(3);
	} else if (table.equals("Annotation")) {
	    return new Integer(4);
	} else if (table.equals("ExpressionSet")) {
	    return new Integer(5);
	} else {
	    return new Integer(6);
	}

    }
    
}

