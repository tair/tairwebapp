/*
 * $Id: DescriptorWrapper.java,v 1.20 2005/12/06 00:27:59 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/
package org.tair.servlet;

import java.util.Hashtable;
import java.awt.*;

import org.tair.mapviewer.imageserver.*;
import org.tair.mapviewer.shared.*;
import org.ncgr.util.*;
import org.tair.utilities.InvalidDisplayRangeException;

/**
 *
 *
 */
public class DescriptorWrapper extends Types {
 
    
    /**
     * Used to created MapDescriptors, which are abstraction of different maps
     * all the MapDescriptors created will be cached. 
     * The reason of some using I, II, .. , some using 1,2, ... is because of the 
     * flat data files mess up. 
     * After move to database, could unify them to 1, 2, 3, 4, 5
     */



    private static Object [][] descriptorNames =  {

        //MapType.GENETIC, mapType, chromosome 
        { genType,  "Lister & Dean RI",  "1" }, //0
        { genType,  "Lister & Dean RI",  "2" }, 
        { genType,  "Lister & Dean RI",  "3" }, 
        { genType,  "Lister & Dean RI",  "4" }, 
        { genType,  "Lister & Dean RI",  "5" }, 
        
        { genType,  "Classical",  "1" }, //5
        { genType,  "Classical",  "2" }, 
        { genType,  "Classical",  "3" }, 
        { genType,  "Classical",  "4" }, 
        { genType,  "Classical",  "5" }, 
        
        { genType,  "AFLP",  "1" }, //10
        { genType,  "AFLP",  "2" }, 
        { genType,  "AFLP",  "3" }, 
        { genType,  "AFLP",  "4" }, 
        { genType,  "AFLP",  "5" }, 
        
        { genType,  "mi-RFLP",  "1" },  //15
        { genType,  "mi-RFLP",  "2" }, 
        { genType,  "mi-RFLP",  "3" }, 
        { genType,  "mi-RFLP",  "4" }, 
        { genType,  "mi-RFLP",  "5" }, 
        
        //MapType.PHYSICAL,   mapType,        chromosome,    group
        { physType,  "Arabidopsis Physical Map",  "1",  "Altmann" }, //20
        { physType,  "Arabidopsis Physical Map",  "2",  "Goodman" }, 
        { physType,  "Arabidopsis Physical Map",  "2",  "Altmann"}, 
        { physType,  "Arabidopsis Physical Map",  "2",  "TIGR"}, 
        { physType,  "Arabidopsis Physical Map",  "2",  "Finkelstein"}, 
        { physType,  "Arabidopsis Physical Map",  "2",  "GoodmanBAC"}, 
        { physType,  "Arabidopsis Physical Map",  "3",  "Kazusa"}, 
        { physType,  "Arabidopsis Physical Map",  "3",  "Bouchez"}, 
        { physType,  "Arabidopsis Physical Map",  "3",  "Altmann"}, 
        { physType,  "Arabidopsis Physical Map",  "3",  "Century"}, 
        { physType,  "Arabidopsis Physical Map",  "3",  "Sakai"}, 
        { physType,  "Arabidopsis Physical Map",  "4",  "Schmidt_Dean"}, 
        { physType,  "Arabidopsis Physical Map",  "4",  "Altmann"}, 
        { physType,  "Arabidopsis Physical Map",  "4",  "CSHL"}, 
        { physType,  "Arabidopsis Physical Map",  "4",  "ESSA"}, 
        { physType,  "Arabidopsis Physical Map",  "5",  "Kazusa"}, 
        { physType,  "Arabidopsis Physical Map",  "5",  "Altmann"}, 
        { physType,  "Arabidopsis Physical Map",  "5",  "CSHL"}, 

        //MapType.AGI, mapType, chromosome
        { agiType,  "AGI Map",  "1"}, //38
        { agiType,  "AGI Map",  "2"}, 
        { agiType,  "AGI Map",  "3"}, 
        { agiType,  "AGI Map",  "4"}, 
        { agiType,  "AGI Map",  "5" } //,
        
    };
    
   

    final static int groupIndex  = 0;
    final static int typeIndex = 1;
    
    
    private static String [] romans =  { 
        "I" , 
        "II" , 
        "III" , 
        "IV" , 
        "V" 
    };
    

    /**
     * Caches the DescriptorWrapper list for each chromosome
     */
    static DescriptorWrapper[][] cachedDescriptorWrappers = new DescriptorWrapper[5][];
    
    MapBand mapBand;
    private int chromosome; 
    private int type;
    
    /**
     * Who is using this method?
     */
    static void debugRow( String [] sa ) {
        String row = sa[ 0 ];
        for ( int a = 1 ; a < sa.length ; ++a ) {
            row += " , " + sa[ a ];
        }
    }
    
    int getChromosome() {
        return chromosome;
    }
    
    
    /**
     * Constructor used for reference sequence maps.
     */
    public DescriptorWrapper( int chr, int type, Logger logger ) {
        this.chromosome = chr;
        this.type = type;
        MapDescriptor descriptor1 = null;
        
        // AGI Map, Lister & Dean RI... 
        String typeOfThis = getTypeName();
        
        //ok, this is the first time through.  Try to create
        //it fresh.  
        String chrAr = "" + ( chromosome + 1 );
        String chrRm = romans[ chromosome ]; 
        
        for( int a = 0 ; a < descriptorNames.length ; ++ a ) {
            Object [] desc = descriptorNames[ a ];
            
            String chromoStringNumber = (String) desc[ 2 ];
            String chromoStringType = (String) desc[ typeIndex ]; //typeIndex = 1
            
            
            if ( chromoStringNumber.equals( chrAr ) ||
                 chromoStringNumber.equals( chrRm ) )   {
                MapType category = (MapType) desc[ 0 ];
                
                if ( desc.length == 3 ){
                    // genetic map and sequence map (AGI)
                    if ( chromoStringType.equals( typeOfThis ) )       {

                        descriptor1 = 
                            new MapDescriptor( chromoStringNumber , // String
                                               category ,           // MapType
                                               chromoStringType );  // mapType, such as AFLP, RI, Classical
                    }
                }
                else { // physical map
                    if ( desc[ 3 ].equals( typeOfThis ) )       {
                        descriptor1 = 
                            new MapDescriptor( chromoStringNumber , 
                                               category , 
                                               chromoStringType , 
                                               (String) desc[ 3 ] ); // group
                    }
                }
            }
        }
        
        if ( descriptor1 != null ){
            mapBand = descriptor1.getMapBand( logger );
        }

        if ( mapBand == null ) {
            logger.logError( "Unable to create DescriptionWrapper for " + chr + " , " + 
                             type );
        }
        
    }
    
    
    public static final int GeneticCategory = 0;
    public static final int SequenceCategory = 1;
    public static final int PhysicalCategory = 2;
    

    /**
     *
     */
    int getCategory()
    {
        if ( type <= I_MI_RFLP )
            return GeneticCategory;
        if ( type == I_AGI_MAP || type == I_SEQUENCE_MAP )
            return SequenceCategory;
        else
            return PhysicalCategory;
    }
    
    /**
     *
     */
    boolean isAGI()
    {
        return type == I_AGI_MAP;
    }
    
    /**
     *
     */
    int [] getLevels()
    {
        return mapBand.getLevels();
    }


    /**
     *
     */    
    int getNumberOfLevels()
    {
        return getLevels().length;
    }
    

    /**
     *
     */
    public Dimension generateMapImage( Hashtable highlighted  ,
                                       double mapStart , 
                                       double mapEnd ,
                                       double ppu, 
                                       int fl , 
                                       Graphics g ,
                                       Dimension d ,
                                       FeatureDescriptorCallback fdc )
        throws MapNotFoundException, InvalidDisplayRangeException
    {
        return mapBand.draw(g, d , mapStart , mapEnd , ppu , fl , fdc , highlighted );
    }
    
    /**
     *
     */
    public void displayAllRows(boolean displayAllRows){
        mapBand.displayAllRows(displayAllRows);
    }
    
    /**
     * Displayed in the MapHtml page for the different zoom levels, such
     * as 1x, 2x, .... 800x etc.
     */
    String [] getLevelNames()
    {
        int [] lvs = getLevels();
        String [] s = new String[ lvs.length ];
        for( int a = 0 ; a < lvs.length ; ++ a )
            {
                s[ a ] = "" + lvs[ a ] + "x";
            }
        return s;
    }
    
    /**
     *
     */
    static DescriptorWrapper [] getWrappersForChromo( int chromosome , 
                                                      Logger logger )
    {
        int [] typesFor = chromoTypes[ chromosome ];
        int typesLen = typesFor.length;
        

        DescriptorWrapper [] typesOut = cachedDescriptorWrappers[chromosome];

        if (typesOut == null){
            typesOut = new DescriptorWrapper[ typesLen ];
        
            for( int a = 0 ; a < typesLen ; ++ a )
                {
                    int type = typesFor[ a ];
                    typesOut[ a ] = new DescriptorWrapper( chromosome , type , logger );
                }
        }
        return typesOut;
    }
    
    /**
     *
     */
    int getTypeNumber()
    {
        return type;
    }
    
    /**
     * AGI Map, Lister & Dean RI, Classical, .... from Types.java 
     */
    String getTypeName()
    {
        return typeNames[ type ];
    }
    

    /**
     *
     */
    Hashtable searchByAccession( String accession )
    {
        return mapBand.findByAccession( accession );
    }

    /**
     *
     */
    Hashtable search( String featureName )
    {
        return mapBand.find( featureName );
    }
  
    /**
     * intercept the real length and returned length is little bit larger
     * than the real one so that when pan to the rightmost, allow extra space
     * draw more information. Otherwise, some markers and others will be 
     * truncated.
     */
    public double getLength() throws Exception
    {
        //return chromosome_lengths[chromosome-1];
        return mapBand.getLength();
    }
    
    /**
     *
     */
    public String toString()
    {
        return romans[ chromosome ] + " - " + getTypeName();
    }
    

    /**
     *
     */
    public int hashCode()
    {
        return ( chromosome * 512 ) + type;
    }
    
    /**
     *
     */
    public boolean equals( Object o )
    {
        if ( o instanceof DescriptorWrapper )
            {
                DescriptorWrapper dw = (DescriptorWrapper) o;
                if ( ( dw.chromosome == chromosome ) &&
                     ( dw.type == type ) )
                    return true;
            }
        return false;
    }
}
