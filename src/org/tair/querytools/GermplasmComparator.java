/*
 *
 * $Id: GermplasmComparator.java,v 1.1 2003/03/04 21:11:02 iris Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.querytools;

import org.tair.tfc.*;
import org.tair.utilities.*;
import java.util.Comparator;

public class GermplasmComparator implements Comparator{
    public int compare(Object obj1, Object obj2) {
	if(obj1 !=null && obj2 !=null){
	    Germplasm germ1 = (Germplasm)obj1;
	    Germplasm germ2 = (Germplasm)obj2;
	    if (germ1.getPolymorphismSize() < germ2.getPolymorphismSize()) 
		return -1;
	    if (germ1.getPolymorphismSize() > germ2.getPolymorphismSize())
		return 1;
	  
        }
      return 0;
    }
}
