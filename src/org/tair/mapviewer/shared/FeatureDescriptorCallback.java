
/*
 * $Id: FeatureDescriptorCallback.java,v 1.6 2005/12/06 00:28:39 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
 */

package org.tair.mapviewer.shared;

import java.awt.Rectangle;

public interface FeatureDescriptorCallback
{
    

    
    public void featureDescription( long elementId, 
                                    FeatureType ft , 
                                    Rectangle rect, 
                                    String detailText,
                                    FeatureDescriptorCallback parent);
    
    
    public void arrowExtents( int arrow,
                              Rectangle rect,
                              FeatureDescriptorCallback parent);
    
    /**
     * The extents of the vertically-oriented labels that are used to specify
     * the height of each sub band.
     */
    public void labelExtents( String label, 
		       Rectangle rect,
		       FeatureDescriptorCallback parent);

} 
