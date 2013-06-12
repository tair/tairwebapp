/*
 *
 * $Id: GeneFeature.java,v 1.6 2003/09/29 15:36:41 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

import java.util.ArrayList;

public class GeneFeature extends MappableEntity {

    private Direction direction;
    private ArrayList aliases;
    private int gene_id;
    
    /**
     *  Constructors
     */
    public GeneFeature( MappableEntity ME ) {
        super( ME );
    }
    
    public GeneFeature( int id,
                        int type,
                        String name,
                        String source ) {
        super( id, type, name, source );
    }
    
    /**
     *  
     */
    public Direction getDirection() {
        return this.direction;
    }
    
    /**
     *  
     */
    public void setDirection( Direction direction ) {
        this.direction = direction;
    }

    public ArrayList getAliases() {
        return aliases;
    }

    public void setAliases( ArrayList aliases ) {
        this.aliases = aliases;
    }

    /**
     *
     */
    public void setGeneId( int gene_id ) {
        this.gene_id = gene_id;
    }
    
    public int getGeneId() {
        return gene_id;
    }
    
}





 
