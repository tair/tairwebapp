/*
 * $Id: MapCache.java,v 1.13 2005/12/06 00:28:23 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.mapviewer.imageserver;

import org.tair.mapviewer.shared.*;
import org.tair.utilities.WebApp;


import java.util.HashMap;
import java.util.ArrayList;
import java.util.Iterator;

import java.io.*;
import java.text.DecimalFormat;


public class MapCache {
    
    /*
     * key: MapDescriptor, value: Map
     */
    private HashMap maps;
    
    // singleton reference
    private static MapCache instance;
    


    /**
     *
     */
    public static synchronized MapCache getInstance() {
        if ( instance == null ) {
            try {
                instance = new MapCache();
            } 
            catch ( Exception e ) {
                e.printStackTrace();
            } 
        } 
        return instance;
    }  
    
    
    /**
     * constructor
     */
    protected MapCache() {
        maps = new HashMap();
        loadData( maps );
    }
    

    private void loadData( HashMap maps ) {

        Map[] mapArray = null;
        MapDBServer mapServer = null;

        try {
            mapServer = new MapDBServer();
            mapArray = mapServer.getMaps();

        } catch ( Exception e ) {
            e.printStackTrace();
            return;
        }
        
        for ( int i = 0; i < mapArray.length; i++ ) {

            // enclose try/catch within for loop, so that we cache as many maps
            // as possible; some is better than none, so we don't want to 
            // abort just because some maps could not be loaded
            try {
  
                Map map = mapArray[ i ];
                cacheMap( map );

            } catch ( Exception e ) {
                // FIXME: Should do more to inform admin that something is 
                // wrong
                e.printStackTrace();
            } 
        } 
    }



    private void cacheMap( Map map ) {

        if ( map == null ) {
            throw new IllegalArgumentException( "Attempting to cache a null map" );
        } 
        
        if ( map instanceof SequenceMap ) {
            
            // This is where MapDescriptor get created
            MapDescriptor md = new MapDescriptor( map.getChromosome(), 
                                                  MapType.fromLong( map.getType() ),
                                                  map.getMapType() ); // "AGI Map"
            
            
            if ( map != null ) {
                maps.put( md, map );
            } 

        } else if ( map instanceof PhysicalMap ) {
                
            MapDescriptor md = new MapDescriptor( map.getChromosome(),
                                                  MapType.fromLong( map.getType() ),
                                                  map.getName(), // Arabidopsis Physical Map
                                                  map.getMapType() ); //   Altmann                
            if ( map != null ) {
                maps.put( md, map );
            } 

        } else if ( map instanceof GeneticMap ) {
            MapDescriptor md = new MapDescriptor( map.getChromosome(),
                                                  MapType.fromLong( map.getType() ),
                                                  map.getMapType() );
            
            if ( map != null ) {
                maps.put( md, map );
            } 
        }
    } 
    
    
    public void reloadData() {
        // this assignment does not need to be synchronized; the Java
        // memory model ensures that the assignment of references is atomic;
        // it is acceptable that the updated value of 'maps' may not be visible
        // to other threads immediately ( since it's ok to use old data for a 
        // little while longer ); we do not want to synchronize accesses to the 
        // 'maps' reference for performance reasons.
        HashMap tmpMaps = new HashMap();
        loadData( tmpMaps );
        maps = tmpMaps;
    } 
    
    
    public MapDescriptor[] getAllMapDescriptors() {
        Iterator i = maps.keySet().iterator();
        MapDescriptor[] mds = new MapDescriptor[ maps.size() ];
        int j = 0;
        while ( i.hasNext() ) {
            mds[ j++ ] = (MapDescriptor) i.next();
        }
        return mds;
    }
    
    
    public Map getMap( MapDescriptor descriptor ) throws MapNotFoundException {
        Map map = (Map) maps.get( descriptor );
        if ( map == null ) {
            throw new MapNotFoundException();
        } 
        return map;
    }   
    
    

    /**
     * Used to create the tab-delimited files put in the ftp site:
     * ftp://ftp.arabidopsis.org/Maps/mapviewer_data/
     */
    public static void main( String[] args ) {
        
        DecimalFormat df = new DecimalFormat( "0.0" ); // used for RI.data and miRFLP.data
        
        String [][] geneticMapNames = 
        {
            //mapType, chromosome 
            { "Lister & Dean RI",  "1" }, //0
            { "Lister & Dean RI",  "2" }, 
            { "Lister & Dean RI",  "3" }, 
            { "Lister & Dean RI",  "4" }, 
            { "Lister & Dean RI",  "5" }, 
            
            { "Classical",  "1" }, //5
            { "Classical",  "2" }, 
            { "Classical",  "3" }, 
            { "Classical",  "4" }, 
            { "Classical",  "5" }, 
            
            { "mi-RFLP",  "1" },  //15
            { "mi-RFLP",  "2" }, 
            { "mi-RFLP",  "3" }, 
            { "mi-RFLP",  "4" }, 
            { "mi-RFLP",  "5" }
        }; 
        
        String [][] physicalMapNames = 
        {       
            // chromosome,    group
            { "1",  "Altmann" }, //20
            { "2",  "Goodman" }, 
            { "2",  "Altmann"}, 
            { "2",  "TIGR"}, 
            { "2",  "Finkelstein"}, 
            { "2",  "GoodmanBAC"}, 
            { "3",  "Kazusa"}, 
            { "3",  "Bouchez"}, 
            { "3",  "Altmann"}, 
            { "3",  "Century"}, 
            { "3",  "Sakai"}, 
            { "4",  "Schmidt_Dean"}, 
            { "4",  "Altmann"}, 
            { "4",  "CSHL"}, 
            { "4",  "ESSA"}, 
            { "5",  "Kazusa"}, 
            { "5",  "Altmann"}, 
            { "5",  "CSHL"}
        };
        
        String dataFilePath = WebApp.getMapDataDir();
        System.out.println( dataFilePath );

        PrintWriter rWriter = null;
        PrintWriter cWriter = null;
        PrintWriter mWriter = null;
        PrintWriter pWriter = null;

        try {
            String riFileName = dataFilePath + "RI.data";
            System.out.println( riFileName );
            FileOutputStream rf = new FileOutputStream( riFileName );
            rWriter = new PrintWriter( rf );
            
            String classicalFileName = dataFilePath + "ClassicalGenetic.data";
            System.out.println( classicalFileName );
            FileOutputStream cf = new FileOutputStream( classicalFileName );
            cWriter = new PrintWriter( cf );
            
            String miFileName = dataFilePath + "miRFLP.data";
            System.out.println( miFileName );
            FileOutputStream mf = new FileOutputStream( miFileName );
            mWriter = new PrintWriter( mf );
            
            String pFileName = dataFilePath + "Physical.data";
            System.out.println( pFileName );
            FileOutputStream pf = new FileOutputStream( pFileName );
            pWriter = new PrintWriter( pf );


            for ( int i = 0; i < geneticMapNames.length; i++ ) {
                
                String chr = geneticMapNames[ i ][ 1 ];
                String name = geneticMapNames[ i ][ 0 ];
                MapDescriptor desc = new MapDescriptor( chr, MapType.GENETIC, name );

                GeneticMap geneticMap = (GeneticMap) MapCache.getInstance().getMap( desc );
                ArrayList markers = new ArrayList();
                MapBandDBFactory.extractGeneticMapElements( geneticMap, markers );

                Iterator it = markers.iterator();
                while ( it.hasNext() ) {
                    CoordinateLocation location = (CoordinateLocation) it.next();
                    MappableEntity entity = location.getMappableEntity();
                    if ( name.equals( "Lister & Dean RI" ) ) {
                        rWriter.println( "GeneticMarker:" + entity.getID() + "\t" +
                                         entity.getName() + "\t" + 
                                         df.format( location.getPosition() ) + "\t" + 
                                         chr );

                    } else if ( name.equals( "Classical" ) ) {
                        cWriter.println( "GeneticMarker:" + entity.getID() + "\t" + 
                                         entity.getName() + "\t" + 
                                         location.getPosition() + "\t" 
                                         + chr );
                    
                    } else if ( name.equals( "mi-RFLP" ) ) {
                        mWriter.println( "GeneticMarker:" + entity.getID() + "\t" + 
                                         entity.getName() + "\t" + 
                                         df.format( location.getPosition() ) + "\t" + 
                                         chr );
                    
                    }
                }
                    
            }
            
            System.out.println( "dump physical map ................................" );
            
            for ( int i = 0; i < geneticMapNames.length; i++ ) {
                String chr = physicalMapNames[ i ][ 0 ];
                String group = physicalMapNames[ i ][ 1 ];
                
                MapDescriptor desc = new MapDescriptor( chr, 
                                                        MapType.PHYSICAL, 
                                                        "Arabidopsis Physical Map", 
                                                        group );

                PhysicalMap physicalMap = (PhysicalMap) MapCache.getInstance().getMap( desc );
                ArrayList clones = new ArrayList();
                ArrayList contigs = new ArrayList();
                ArrayList probes = new ArrayList();
                
                MapBandDBFactory.extractPhysicalMapElements( physicalMap, clones, contigs, probes );
                Iterator it = clones.iterator();
                while ( it.hasNext() ) {
                    IntervalLocation location = (IntervalLocation) it.next();
                    Clone clone = (Clone) location.getMappableEntity();
                    pWriter.println( "Clone:" + clone.getID() + "\t" + 
                                     clone.getName() + "\t" + 
                                     location.getLeftStart() + "\t" + 
                                     ( location.getLeftStart() + location.getRange() ) + "\t" + 
                                     chr + "\t" + 
                                     group );
                }

                it =  contigs.iterator();
                while ( it.hasNext() ) {
                    IntervalLocation location = (IntervalLocation) it.next();
                    Contig contig = (Contig) location.getMappableEntity();
                    pWriter.println( "Contig:" + 
                                     contig.getID() + "\t" + 
                                     contig.getName() + "\t" + 
                                     location.getLeftStart() + "\t" + 
                                     ( location.getLeftStart() + location.getRange() ) + "\t" +
                                     chr + "\t" + group );
                }
                
                it =  probes.iterator();
                while ( it.hasNext() ) {
                    CoordinateLocation location = ( CoordinateLocation ) it.next();
                    Probe probe = (Probe) location.getMappableEntity();
                        
                    String accession = null;
                    if ( probe.getFeatureType() == FeatureType.clone ) {
                        accession="Clone";
                    } else if ( probe.getFeatureType() == FeatureType.gene ) {
                        accession="Gene";
                    } else if ( probe.getFeatureType() == FeatureType.marker ) {
                        accession="GeneticMarker";
                    } else {

                        accession="MapElement";
                    }
                    
                    pWriter.println( accession + ":" + probe.getID() + "\t" + 
                                     probe.getName() + "\t" + 
                                     location.getPosition() + "\t" + 
                                     location.getPosition() + "\t" + 
                                     chr + "\t" +
                                     group );
                }
            }
            
        } catch ( Exception e ) {
            e.printStackTrace();
            
        } finally {
            rWriter.close();
            cWriter.close();
            mWriter.close();
            pWriter.close();
        }
    }

}
