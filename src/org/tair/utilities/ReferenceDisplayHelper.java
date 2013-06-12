/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.util.*;

/**
 * Help group the Reference strings (generally of the form "Li, et al. (2005)").
 * Counts can be obtained of the number of times a given string occurs.
 * This is used by germplasm_detail.jsp. Note that this is only valid
 * for phenotypes that have references; those that do not are specially
 * handled by the JSP code and show "Obtained from ABRC" and no bullet.
 */

public class ReferenceDisplayHelper
{
    private HashMap addedCounts;
    boolean anyBullets;
    private HashSet seen;

    public ReferenceDisplayHelper( Collection references )
    {
        this.addedCounts = new HashMap();
        this.anyBullets = false;
        this.seen = new HashSet();

        Iterator iter = references.iterator();
        while( iter.hasNext() )
        {
            String reference = (String)iter.next();
            update( reference );
        }
    }

    private void update( String reference )
    {
        if( reference != null )
        {
            int newCount = 1;

            if( this.addedCounts.containsKey( reference ) )
            {
                Integer count = (Integer)this.addedCounts.get( reference );
                newCount = count.intValue() + 1;

                // since we've incremented past 1,
                // we know that we'll have to show
                // some bullets.
                this.anyBullets = true;
            }
            // else already set to 1.

            Integer count = new Integer( newCount );
            this.addedCounts.put( reference, count );
        }
    }

    private int getCount( String reference )
    {
        int count = 0;

        if( this.addedCounts.containsKey( reference ) )
        {
            count = ((Integer)this.addedCounts.get(reference)).intValue();
        }

        return( count );
    }

    /**
     * Warning: this is stateful! Every time you call it,
     * it updates internal counters. Thus, you must only
     * call it once per phenotype from the JSP code.
     */
    public boolean getShouldDisplayReference( String reference )
    {
        boolean display = true; // avoid worse buggy case of never showing anything.

        if( reference != null )
        {
            if( this.seen.contains( reference ) )
            {
                display = false;
            }
            else
            {
                this.seen.add( reference );
            }
        }

        return( display );
    }

    /** if this returns false, the JSP code should avoid
     * writing out any <ul>'s at all to maximize space usage.
     */
    public boolean getShouldDisplayAnyBullets()
    {
        // if we only have single entries all the way along,
        // we don't show any bullets.
        return( this.anyBullets );
    }

    public boolean getShouldDisplayBullet( String reference )
    {
        boolean display = false; // avoid most unattractive buggy situation of too many bullets.

        if( reference != null )
        {
            if( getCount( reference ) > 1 )
            {
                display = true;
            }
        }

        return( display );
    }
}
