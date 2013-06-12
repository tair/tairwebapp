/*
 *
 * $Id: MutantGene.java,v 1.3 2003/10/01 19:34:51 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

import java.util.*;


/**
 * Data class to hold information on mutant genes (genes with visible
 * phenotypes), which appear as separate sub-band from other genes on
 * Sequence/AGI map.
 */


public class MutantGene extends MappableEntity {

    private Direction direction;

    // mutant gene display name is combo. of all non-TIGR
    // gene symbols associated to same locus as rep. gene model
    // that assignment data comes from
    private ArrayList names = new ArrayList();

    // gene symbol aliases for genes associated to locus of 
    // rep. gene model; used for searching
    private ArrayList aliases = new ArrayList();

    
    // mutant gene features will link to locus detail page --
    // need locus's tair object id for creating links using
    // TAIR accession syntax
    private long locusTairObjectID;

    

    /**
     * Creates an instance of MutantGene by copying all needed info.
     * from submitted GeneFeature object.  Since MutantGenes are
     * always created from existing GeneFeature objects, this
     * should be correct way to populate base info. for
     * MutantGene
     *
     * <p>
     * Submitted gene will be passed to MappableEntity superclass
     * for populating data there. NOTE: Name field in superclass
     * will be replaced with combo. of non-TIGR gene symbols
     * in a separate step from object creation
     */
    public MutantGene( GeneFeature gene ) {
        // pass gene as MappableEntity to super class constructor
        super( gene );

        // copy gene specific data to local vars
        this.direction = gene.getDirection();
    }
    
    /**
     * Creates an instance of MutantGene by copying all needed info.
     * from submitted MappableEntity object. This version of constructor
     * is here to enforce typing of constructor in superclass.  If submitted
     * MappableEntity is not a GeneFeature, a ClassCastException will be
     * thrown.  This is done to ensure that MutantGene is only created
     * as a copy of a GeneFeature object
     */
    public MutantGene( MappableEntity me) {
        this( (GeneFeature) me );// will explode if wrong type of object
    }


    /**
     * Get direction object representing orientation of gene
     */
    public Direction getDirection() {
        return this.direction;
    }
    
    /**
     * Set direction object representing orientation of gene 
     */
    public void setDirection( Direction direction ) {
        this.direction = direction;
    }


    
    /**
     * Adds a gene name to mutant gene's collection of names for display
     *
     * @param name Gene symbol name to add 
     */
    public void addGeneName( String name ) {
        if ( !names.contains( name ) ) {
            names.add( name );
        }
    }

    /**
     * Overrides the setName method in superclass to add submitted
     * name to collection of names that are used for mutant genes.
     * This means that the single value of name in superclass is no
     * longer visible.
     * 
     * @param name Gene name to add to collection of names
     */
    public void setName( String name ) {
        if ( !names.contains( name ) ) {
            names.add( name );
        }
    }

    /**
     * Overrides the getName method in superclass to return a combined
     * String that contains all gene symbol names stored for mutant gene.
     * This is done so that mutant gene displays using all non-TIGR gene
     * symbol names associated to the same locus as rep. gene model used
     * for creating object initially. Overriding this method means
     * that single value of name in superclass (rep. gene's name) is no
     * longer visible.
     *
     * <p>
     * If for some reason list of non-TIGR symbol names is empty, 
     * super class name (TIGR rep. gene name) will be returned
     */
    public String getName() {

        String returnName = null;

        if ( !names.isEmpty() ) {
            StringBuffer combinedName = new StringBuffer();
            Iterator iter = getNames().iterator();
            boolean firstName = true;
            while ( iter.hasNext() ) {
                if ( !firstName ) {
                    combinedName.append( "/" );
                }
                firstName = false;
            combinedName.append( (String) iter.next() );
            }
            returnName = combinedName.toString();

        } else {
            returnName = super.getName();
        }

        return  returnName;
    }



    /**
     * Retrieves all names for mutant gene
     *
     * @return All names for mutant gene as an <code>ArrayList</code> of
     * <code>String</code> objects
     */
    public ArrayList getNames() {
        return names;
    }


    /**
     * Determines if mutant gene has any names stored for it (besides
     * TIGR name of rep. gene model stored in superclass).
     *
     * @return <code>true</code> if mutant gene has names stored in
     * addition to TIGR name in superclass, or <code>false</code> if no 
     * additional names stored for gene 
     */
    public boolean hasNames() {
        return ( names != null && !names.isEmpty() );
    }
    

    /**
     * Adds submitted gene symbol alias to mutant gene's list of
     * aliases. These names are not displayed, but are used for searching
     *
     * @param alias Alias to add to collection of aliases
     */
    public void addAlias( String alias ) {
        aliases.add( alias );
    }


    /**
     * Retrieves all aliases for mutant gene
     *
     * @return Aliases for mutant gene as a list containing String objects
     */
    public ArrayList getAliases() {
        return aliases;
    }
        
    
    /** 
     * Sets the value of tair object id for gene's locus. This value is
     * used for creating links to locus's detail page for gene feature in Band image
     * 
     * @param id Tair object id of gene's locus
     */
    public void setLocusTairObjectID( long id ) {
        this.locusTairObjectID = id;
    }
    
    
    /**
     * Retrieves value of tair object id for gene's locus. This value is used for creating
     * links to locus detail page for gene feature in Band image
     *
     * @return Tair object id of gene's locus
     */
    public long getLocusTairObjectID() {
        return locusTairObjectID;
    }
    


}





 
