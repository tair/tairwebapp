/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/

package org.tair.mapviewer.shared;

/**
 * This is the pattern for an enumeration in java.
 * Makes me wish for a real enumeration, frankly.
 */

public class FeatureType 
{
    private String name;
    
    private FeatureType( String name )
    {
	this.name = name;
    }
    
    public String typeString()
    {
	return name;
    }
    
    public static FeatureType contig = new FeatureType( "Contig" );
    public static FeatureType gene = new FeatureType( "Gene" );
    public static FeatureType marker = new FeatureType( "GeneticMarker" );
    public static FeatureType clone = new FeatureType( "Clone" );
    public static FeatureType cloneEnd = new FeatureType( "CloneEnd" );
    public static FeatureType assemblyUnit = new FeatureType( "AssemblyUnit" );

    //public static FeatureType mapelement = new FeatureType( "MapElement" );

    public static FeatureType unknown = new FeatureType( "Unknown" );
    public static FeatureType dnaFragment = new FeatureType( "DnaFragment" );


    // used by MutantGeneStub for creating links to locus detail page
    public static FeatureType locus = new FeatureType( "Locus" ); 
   
}


