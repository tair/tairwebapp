/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.mapviewer.imageserver;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import org.tair.mapviewer.shared.AssemblyUnit;
import org.tair.mapviewer.shared.ClassicMarker;
import org.tair.mapviewer.shared.Clone;
import org.tair.mapviewer.shared.Contig;
import org.tair.mapviewer.shared.CoordinateLocation;
import org.tair.mapviewer.shared.Direction;
import org.tair.mapviewer.shared.FeatureType;
import org.tair.mapviewer.shared.GeneFeature;
import org.tair.mapviewer.shared.GeneticMap;
import org.tair.mapviewer.shared.IntervalLocation;
import org.tair.mapviewer.shared.Location;
import org.tair.mapviewer.shared.Map;
import org.tair.mapviewer.shared.MappableEntity;
import org.tair.mapviewer.shared.MappableEntityType;
import org.tair.mapviewer.shared.Marker;
import org.tair.mapviewer.shared.MutantGene;
import org.tair.mapviewer.shared.PhysicalMap;
import org.tair.mapviewer.shared.Probe;
import org.tair.mapviewer.shared.RiMarker;
import org.tair.mapviewer.shared.SequenceMap;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;



/**
 * Database server for the mapviewer.
 *
 * NOTE: This class was originally org.tair.mapviewer.server.db.MapDBServer2.
 * After replacing interfaces in org.tair.mapviewer.shared w/classes formerly
 * known as Impl classes, org.tair.mapviewer.server package is completely empty.
 * This class has therefore been relocated to this package so the empty
 * one can be complete done away with. Since MapCache also lives here, it
 * seems like the right place for it.
 */

public final class MapDBServer {
    
    // final product of all loading -- array of Map subclass objects
    // containing all features assigned onto them as Location sub-class
    // objects
    private Map [] maps;

    // map_element_type_id literal values -- used to avoid table joins
    // populated by loadMapElementTypeIds method
    private long assembly_unit_type_id;
    private long genetic_marker_type_id;
    private long gene_type_id;
    

    // # of chromosomes for Arabidopsis
    private int numberOfChrs = 5;

    /**
     * this data is come from XML data file that old map viewer used. 
     * this should go to database. 
     *
     * Group data used to create Physical maps.  Data stored in 2d 
     * String array.  Array elements are used as follows:
     *
     * index   value
     *   0     chromosome
     *   1     group number
     *   2     group name
     *   3     start position
     *   4     end position
     */
    private String[][] groups = {
        { "1",  "1",  "Altmann", "14", "29237" }, 
        { "1",  "2",  "Goodman",  "1", "10000" }, 
        
        { "2",  "1",  "Goodman", "3500", "17463" }, 
        { "2",  "2",  "Altmann", "4258", "17460" }, 
        { "2",  "3",  "TIGR", "4411", "17491" }, 
        { "2",  "4",  "Finkelstein", "13329", "14218" }, 
        { "2",  "5",  "GoodmanBAC", "14598", "16681" }, 
        
        { "3",  "1",  "Kazusa", "50", "23560" }, 
        { "3",  "2",  "Bouchez", "170", "22592" }, 
        { "3",  "3",  "Altmann", "85", "23074"  }, 
        { "3",  "4",  "Century", "6694", "8444" }, 
        { "3",  "5",  "Sakai", "10525", "11125" }, 
        
        { "4",  "1",  "Schmidt_Dean", "3491", "22140" }, 
        { "4",  "2",  "Altmann", "3580", "20615" }, 
        { "4",  "3",  "CSHL", "3814", "9373" }, 
        { "4",  "4",  "ESSA", "9447", "21115" },
        
        { "5",  "1",  "Kazusa", "30", "26178" }, 
        { "5",  "2",  "Altmann", "265", "26146" }, 
        { "5",  "3",  "CSHL", "8944", "11576" }
    };
    


    // Map containing chromosome values as
    // String keys referencing SequenceMap objects
    // for that chromosome
    private HashMap sequenceHashMap;

    // Map containing contig name as String key
    // referencing list of Locations on that map
    private HashMap cloneProbeHashMap;

    // Map containing combining PhysicalMaps with map's chromosome and 
    // group name as String key referencing PhysicalMap object
    private HashMap groupHashMap;


    // Map containing GeneticMaps with maps' map_element_ids
    // as Integer keys referencing GeneticMap objects
   private HashMap geneticHashMap;

    // Map containing contig names as String keys referencing
    // corresponding Contig map object
    private HashMap contigHashMap;

    // Map containing tair object id of AssemblyUnit/clone referencing
    // seq status value
    private HashMap agiCloneSeqStatus;

    // int arrays holding map element ids for classical and RI maps
    long[] classicalMapElementIds;
    long[] riMapElementIds; 


    /**
     * Creates an instance of MapDBServer by populating all data
     * from database.
     *
     * @throws SQLException if a database error occurs while retrieving data
     * @throws InstantiationException if a problem occurs while initializing 
     * db connection pool
     * @throws ClassNotFoundException if a problem occurs while initializing 
     * db connection pool
     * @throws IllegalAccessException if a problem occurs while initializing 
     * db connection pool
     */
    public MapDBServer() 
        throws SQLException, InstantiationException, ClassNotFoundException, IllegalAccessException {

        DBReadManager connectionPool = null;
        DBconnection conn =  null;

        try {

            DBReadManager.init();
            connectionPool = DBReadManager.getInstance();
            conn = connectionPool.get_connection();

            createGroupMaps();

            loadFromDB( conn );

            maps = createAllMapArray();

        } finally {
            if ( conn != null ) {
                connectionPool.return_connection( conn );
            }
        }
    }

    /**
     * Retrieve all map objects from HashMaps and store sequentially
     * in single array that contains all maps
     */
    private Map[] createAllMapArray() {

        System.out.println( "map: creating all maps" );
        
        Map[] maps = new Map[ groupHashMap.size() + sequenceHashMap.size() + geneticHashMap.size() ];
        int i = 0;

        
        for ( Iterator e = groupHashMap.keySet().iterator(); e.hasNext(); ) {
            String map_id = (String) e.next();
            PhysicalMap pMap = (PhysicalMap) groupHashMap.get( map_id );
            maps[ i ] = pMap;
            i++;
        }

        for ( Iterator e = sequenceHashMap.keySet().iterator(); e.hasNext(); ) {
            String map_id = (String) e.next();
            SequenceMap sMap = (SequenceMap) sequenceHashMap.get( map_id );
            maps[ i ] = sMap;
            i++;
        }

        for ( Iterator e = geneticHashMap.keySet().iterator(); e.hasNext(); ) {
            Long map_id = (Long) e.next();
            GeneticMap gMap = (GeneticMap) geneticHashMap.get( map_id );
            maps[ i ] = gMap;
            i++;
        }

        return maps;
    }

    /**
     * Retrieves all maps w/map data as an array of Map objects
     */
    public Map[] getMaps() {
        return maps;
    }
    
    /**
     * Create PhysicalMap for each group without knowing it map id and Locations( Contigs ).
     * Data stored in groupHashMap with chromosome + groupName as String key referencing
     * PhysicalMap object
     */
    private void createGroupMaps() {
        groupHashMap = new HashMap();

        int size = groups.length;
        for ( int i = 0; i < size; i++ ) {
            
            String chromosome = groups[ i ][ 0 ];
            String groupNumber = groups[ i ][ 1 ];
            String groupName = groups[ i ][ 2 ];
            double start = Double.parseDouble( groups[ i ][ 3 ] );
            double end  = Double.parseDouble( groups[ i ][ 4 ] );
            
            String stringId = chromosome + groupNumber + "000";
            int id = Integer.parseInt( stringId );
            
            int type = Map.getMapType( "PHYSICAL" ).getTypeIndex();
            
            PhysicalMap physicalMap = new PhysicalMap( new MappableEntity( id, 
                                                                           type, 
                                                                           "Arabidopsis Physical Map", 
                                                                           "AtIR" ),
                                                       "kb", 
                                                       start, 
                                                       end, 
                                                       null, 
                                                       chromosome );
            
            physicalMap.setMapType( groupName );
            
            groupHashMap.put( chromosome + groupName.toUpperCase(), physicalMap );
        }
    }
   

    /**
     * Gateway method to retrieve all map data from the database
     */
    private void loadFromDB( DBconnection conn ) throws SQLException {

        System.out.println( "map: Loading map data from database..." );

        loadAGICloneSeqStatus( conn );
        loadMapElementTypeIds( conn );

        loadAGIMapInformation( conn );
        loadGeneticMapInformation( conn );

        loadSequenceMapData( conn );
        loadGeneticMapData( conn );
        loadContig( conn );
        loadPhysicalMapData( conn );


        //
        // Skip loading of mutant genes for now - band cannot be
        // displayed until we straighten out assignment/global
        // assignment issues. Might as well not waste time getting
        // mutant info from db...
        //
        // NM 2.6.2004
        //
	// If this gets used again make sure to update the
	// the methods that use GeneAliases as that table no longer
	// contains any aliases of type 'symbol'
        // loadMutantGenes( conn );
    }


    /**
     * Retrieves all map element type ids and type values for use in later queries
     */
    private void loadMapElementTypeIds( DBconnection conn ) throws SQLException {
        String query = "SELECT map_element_type, map_element_type_id FROM MapElementType";

        conn.setQuery( query );
        ResultSet rs = conn.getResultSet();
        while ( rs.next() ) {
            String mapElementType =  rs.getString( "map_element_type" );
            long  mapElementTypeId =  rs.getLong( "map_element_type_id" );
            
            if ( mapElementType.equals( "assembly_unit" ) ) {
                assembly_unit_type_id = mapElementTypeId;
                
            } else if ( mapElementType.equals( "gene" ) ) {
                gene_type_id = mapElementTypeId;
                
            } else if ( mapElementType.equals( "genetic_marker" ) ) {
                genetic_marker_type_id = mapElementTypeId;

	    }
        }
        conn.releaseResources();
    }

  

    /**
     * Populates sequenceHashMap by loading AGI (sequence) map data for 
     * chromosomes 1-5 and storing in map with chromosome number as String
     * key referencing SequenceMap object for that chromosome
     */
    private void loadAGIMapInformation( DBconnection conn ) throws SQLException {
        sequenceHashMap = new HashMap();

        // exclude chloroplast/mitochondria chromos from AGI query
        String sequenceMapIdQuery = 
            "SELECT map_element_id, " +
            "name, " +
            "chromosome, " +
            "length, " +
            "units " +
            "FROM Map " +
            "WHERE name = 'AGI' " +
            "AND chromosome != 'C' " +
            "AND chromosome != 'M'";
        
        int type = Map.getMapType( "AGI" ).getTypeIndex();
        conn.setQuery( sequenceMapIdQuery );
        ResultSet rs = conn.getResultSet();
        while ( rs.next() ) {
            long map_element_id = rs.getLong( "map_element_id" );
            String chromosome = rs.getString( "chromosome" );
            double length = rs.getDouble( "length" );
            String units = rs.getString( "units" ); 
            
            //  Create the SequenceMap
            SequenceMap sMap = new SequenceMap( new MappableEntity( map_element_id, 
                                                                    type, 
                                                                    "AGI Map",
                                                                    "AtIR" ), 
                                                units,
                                                1,
                                                length,
                                                null,
                                                chromosome );
            sMap.setMapType( "AGI Map" );
            sequenceHashMap.put( chromosome, sMap );
        }
        conn.releaseResources();
    }


    /**
     * Populates geneticHashMap by loading Genetic map data for chromosomes 1-5
     * and storing in map with map's map_element_id as Integer referencing GeneticMap
     * object
     */
    private void loadGeneticMapInformation( DBconnection conn ) throws SQLException {
        geneticHashMap = new HashMap();

        String geneticMapIdQuery = 
            "SELECT map_element_id, " +
            "name, " +
            "chromosome, " +
            "length, " +
            "units " +
            "FROM Map " +
            "WHERE map_type = 'genetic'";

        conn.setQuery( geneticMapIdQuery );

        int type = Map.getMapType( "GENETIC" ).getTypeIndex();
        classicalMapElementIds = new long[ numberOfChrs ];
        riMapElementIds = new long[ numberOfChrs ];

        int i = 0;
        int j = 0;
        ResultSet rs = conn.getResultSet();
        while ( rs.next() ) {
            long map_element_id = rs.getLong( "map_element_id" );
            String name = rs.getString( "name" );
            String chromosome = rs.getString( "chromosome" );
            double length = (double) rs.getFloat( "length" );
            String units = rs.getString( "units" ); 
                  
            if ( name.equals( "CLASSICAL" ) ) {
                classicalMapElementIds[ i ] = map_element_id;
                i++;
                name = "Classical";
                
            } else if ( name.equals( "RI" ) ) {
                riMapElementIds[ j ] = map_element_id;
                j++;
                name = "Lister & Dean RI";
                
            } else if ( name.equals( "MIRFLP" ) ) {
                name = "mi-RFLP";
            }
            
            // Create the GeneticMap without knowing its Locations ( GeneticMakers )
            GeneticMap gMap = new GeneticMap( new MappableEntity( map_element_id, 
                                                                  type, 
                                                                  "GENETIC", 
                                                                  "AtIR" ), 
                                              units,
                                              0.00,
                                              length,
                                              null,
                                              chromosome );
            gMap.setMapType( name );
            
            geneticHashMap.put( new Long( map_element_id ), gMap );
        }
        conn.releaseResources();
    }


    /**
     * Determines if submitted map element id is in array of
     * classical map map element ids
     */
    private boolean isCLASSICAL( long map_element_id ) {
        boolean isClassical = false;

        for ( int i = 0; i < classicalMapElementIds.length; i++ ) {
            if ( map_element_id == classicalMapElementIds[ i ] ) {
                isClassical = true;
                break;
            }
        }
        return isClassical; 
    }


    /**
     * Determines if submitted map element id is in array of
     * RI map map element ids
     */
    private boolean isRI( long map_element_id ) {
        boolean isRI = false;

        for ( int i = 0; i < riMapElementIds.length; i++ ) {
            if ( map_element_id == riMapElementIds[ i ] ) {
                isRI = true;
                break;
            }
        }
        return isRI; 
    }


    /**
     * load the data used by both AGI Sequence Map and Physical Map, so must be called
     * before the loadAGIMapInfo and loadGeneticMapInfo methods
     */ 
    private void loadAGICloneSeqStatus( DBconnection conn ) throws SQLException {

        // get all the AGI clone sequence status
        
        // key as tair_object_id of clone, and value as the seq_status
        agiCloneSeqStatus = new HashMap();
        
        String AGICloneStatusQuery = "SELECT tair_object_id, seq_status FROM AssemblyUnit";
        conn.setQuery( AGICloneStatusQuery );
        ResultSet rs = conn.getResultSet();
        while ( rs.next() ) {
            long tair_object_id =  rs.getLong( "tair_object_id" );
            String seq_status = rs.getString( "seq_status" );
            if ( seq_status == null ) {
                seq_status = "60";
            }
            agiCloneSeqStatus.put( new Long( tair_object_id ),  seq_status );
        }
        conn.releaseResources();
    }
    
    /**
     * Retrieves all element data for AGI/Sequence map. First, all aliases are
     * retrieved for genetic markers and clones, then all elements mapped onto
     * AGI map are retrieved. As results are read from query, data objects are
     * created for each type of data (marker, gene etc.) and any aliases found
     * previously for that object name are stored as aliases with the new data 
     * object.  Data objects are stored as Location (superclass) objects in 
     * an array of ArrayLists, where each list represents a chromosome.  After
     * all data has been retrieved, ArrayLists are transformed to type-specific
     * Location arrays and associated with SequenceMap object (through 
     * assignLocationsToSequenceMaps method)
     */
    private void loadSequenceMapData( DBconnection conn ) throws SQLException {

        // create lists for each chromosome to store data elements 
        // as they're created
        ArrayList[] locations = new ArrayList[ numberOfChrs ];
        for ( int i = 0; i < numberOfChrs; i++ ) {
            locations[ i ] = new ArrayList();
        }
        
        // get aliases for markers
        HashMap markerAliases = loadAGIGeneticMarkerAliases( conn );
 
        
        // get locus names for genes
        HashMap locusAlias = loadLocusAliases( conn );
        
        
        // get gene aliases for genes
        HashMap geneAliases = loadGeneAliases( conn );
                                  
        
        // get all the clones, markers and genes infomation from 
	// AgiAssignment_wrk work table (created by 
	// org.tair.seqviewer.server.AgiAssignment)
        String sequenceMapQuery = 
            "SELECT DISTINCT tair_object_id, " +
            "map_element_type_id, " +
            "name, " +
            "start_position, " +
            "end_position, " +
            "orientation, " +
            "chromosome, " +
            "table_id " +
            "FROM AgiAssignment_wrk";
        
        // retrieve data & create IntervalLocation objects for each object type
        conn.setQuery( sequenceMapQuery );
        ResultSet rs = conn.getResultSet();
         
        while ( rs.next() ) {
            long tair_object_id = rs.getLong( "tair_object_id" );
            long map_element_type_id = rs.getLong( "map_element_type_id" );
            String name = rs.getString( "name" );                     
            double start = rs.getDouble( "start_position" );
            double end = rs.getDouble( "end_position" );
            String orientation = rs.getString( "orientation" );
            String chromosome = rs.getString( "chromosome" );
            int dir = getDirection( orientation );
            int type = MappableEntityType.getType( "unknown" );
            
            Location loc = null;
            
            if ( map_element_type_id == assembly_unit_type_id ) {
                
                // non-agi clones, status = 0, need to find out the vector type
                // agi clones, need to find out the seq_status; 
                int status = 0;
                
                String seqStatus = (String) agiCloneSeqStatus.get( new Long( tair_object_id ) );
                if ( seqStatus != null ) { // agi clones
                    status = Integer.parseInt( seqStatus );
                }
                
                // Create CLONE
                AssemblyUnit clone = new AssemblyUnit( new MappableEntity( tair_object_id, 
                                                                           type, 
                                                                           name, 
                                                                           "AtIR" ), 
                                                       "kb",
                                                       start,
                                                       end,
                                                       null,
                                                       chromosome );
                
                
                clone.setStatus( status );
                clone.setDirection( dir );
                
                String[] acc = { String.valueOf( tair_object_id ) };
                clone.setAccessionNumber( acc );
                
                loc = new IntervalLocation( clone,                            // ME
                                            true,                             // isAbsolute
                                            null,                             // relativeTo
                                            start,                            // leftStart
                                            end - start + 1.0                 // range
                                            ); 
                
            } else if ( map_element_type_id == gene_type_id ) {
                long gene_id = rs.getLong( "table_id" );
                // Create Gene
                GeneFeature gene = new GeneFeature( new MappableEntity( tair_object_id, 
                                                                        type, 
                                                                        name, 
                                                                        "AtIR" ) );                     
                gene.setDirection( Direction.fromInt( dir ) );        
                
                ArrayList aliases = (ArrayList) geneAliases.get( new Long( gene_id ) );
                String locus = (String) locusAlias.get( name );
                
                if ( locus != null ) {
                    if ( aliases == null ) {
                        aliases = new ArrayList();  
                    }
                    aliases.add( locus );
                }
                gene.setAliases( aliases );
                
                
                loc = new IntervalLocation( gene,                             // ME
                                            true,                             // isAbsolute
                                            null,                             // relativeTo
                                            start,                            // leftStart
                                            end - start + 1.0                 // length
                                            ); 
                
                loc.setPriority( 200 );     // 200 x and about to show the gene
                
            } else if ( map_element_type_id == genetic_marker_type_id ) {
                double conf = 0.0;
                
                Marker marker = new Marker( tair_object_id, type, name, "AtIR" );
                marker.isGenetic( true );
                
                String alias = (String) markerAliases.get( name );
                if ( alias != null ) {                  
                    ArrayList aliases = new ArrayList();                          
                    aliases.add( alias );
                    marker.setAliases( aliases );
                }
                
                loc = new CoordinateLocation( marker,
                                              true,   // isAbsolute
                                              null,   // relativeTo
                                              start,  // position
                                              conf    // confidence
                                              );
            }
            
            if ( loc != null ) {
                if ( chromosome.equals( "1" ) ) {
                    locations[ 0 ].add( loc );
                    
                } else if ( chromosome.equals( "2" ) ) {
                    locations[ 1 ].add( loc );
                    
                } else if ( chromosome.equals( "3" ) ) {
                    locations[ 2 ].add( loc );
                    
                } else if ( chromosome.equals( "4" ) ) {
                    locations[ 3 ].add( loc );
                    
                } else {
                    locations[ 4 ].add( loc );
                }
            }
        }
        conn.releaseResources();
        
        assignLocationsToSequenceMaps( locations );
    }
    

    /**
     * Transforms submitted locations array (where each element is a list
     * containing Location objects for a single chromosome on SequenceMap)
     * into type specific arrays, then add arrays to SequenceMap object
     */
    private void assignLocationsToSequenceMaps( ArrayList[] locations ) {
        
        System.out.println( "map: Assembling Sequence Map ..." );
        for ( int i = 0; i < locations.length; i++ ) {

            Location[] locationArr = new Location[ locations[ i ].size() ];
            locations[ i ].toArray( locationArr );
        
            SequenceMap sMap = (SequenceMap) sequenceHashMap.get( String.valueOf( i + 1 ) );
            sMap.setLocations( locationArr );
        }
    }

    /**
     * Get AGI locus names and non-TIGR gene names associated to locus - locus names
     * will be stored  as gene aliases.
     * 
     * @return Map with locus name as key referencing gene name
     */
    private HashMap loadLocusAliases( DBconnection conn ) throws SQLException {
        HashMap locusAlias = new HashMap();
        String geneAliasesbyLocusQuery = 
            "SELECT l.name as locus_name, g.name as gene_name " +
            "FROM Gene g, Locus l, MapElement_Locus m " +
            "WHERE g.name NOT LIKE 'AT_G%' " +
            "AND g.map_element_id = m.map_element_id " +
            "AND m.locus_id = l.locus_id " +
            "AND l.name like 'AT_G%' ESCAPE '\\\'";
        
        conn.setQuery( geneAliasesbyLocusQuery );
        ResultSet rs = conn.getResultSet();
         while ( rs.next() ) {
             String chromosome_base_name =  rs.getString( "locus_name" );
             String non_chromosome_base_name =  rs.getString( "gene_name" );
             locusAlias.put( chromosome_base_name,  non_chromosome_base_name );
         }
         conn.releaseResources();
         
         return locusAlias;
    }

    /**
     * Retrieves aliases for genetic markers assigned to AGI map
     *
     * @return Map with genetic marker name as key referencing alias
     */
    private HashMap loadAGIGeneticMarkerAliases( DBconnection conn ) throws SQLException {
        System.out.println( "map: Loading genetic marker aliases from GeneticMarkerNameAlias table ..." );

        HashMap markerAliases = new HashMap();

        String markerAliasQuery =
            "SELECT DISTINCT ag.name AS marker_name, a.name AS alias " +
            "FROM GeneticMarkerNameAlias a, AgiAssignment_wrk ag " +
            "WHERE ag.tair_object_id = a.tair_object_id " +
            "AND ag.map_element_type_id = " + genetic_marker_type_id;
            
        conn.setQuery( markerAliasQuery );
        ResultSet rs = conn.getResultSet();
        while ( rs.next() ) {
            String marker_name =  rs.getString( "marker_name" );
            String alias =  rs.getString( "alias" );
            markerAliases.put( marker_name,  alias );
        }
        conn.releaseResources();
        
        return markerAliases;
    }
    
    /**
     * Get all the gene alias information from GeneAlias table
     *
     * @return Map with gene id as key referencing ArrayList of aliases
     */
    private HashMap loadGeneAliases( DBconnection conn ) throws SQLException {
        HashMap geneAliases = new HashMap();         
        String geneAliasesQuery = 
            "SELECT ga.gene_id, ga.name " +
            "FROM GeneNameAlias ga, Gene g " +
            "WHERE ga.gene_id = g.gene_id " +
            "AND g.is_obsolete = 'F' " + 
            "ORDER BY ga.gene_id";
        
        long tmp_gene_id = -1;
        int j = 1;
        int k = 1;
        
        conn.setQuery( geneAliasesQuery );
        conn.setQueryTimeout( 0 ); // unlimited timeout

        ResultSet rs = conn.getResultSet();
        while ( rs.next() ) {
            
            // gene_id
            long gene_id = rs.getLong( "gene_id" );
            String alias = rs.getString( "name" );
            
            // make sure only get the first occurrence of the same gene
            if ( gene_id != tmp_gene_id ) {
                tmp_gene_id = gene_id;
                
                Long key = new Long( gene_id );
                ArrayList aliases = new ArrayList();
                aliases.add( alias );
                geneAliases.put( key, aliases );
                k++;
                
            } else {
                Long key = new Long( gene_id );
                ArrayList aliases = (ArrayList) geneAliases.get( key );
                aliases.add( alias );
            }
            
            j++;
        }
        conn.releaseResources();

        return geneAliases;
    }

    
    /**
     * Populates GeneticMap object by retrieving Genetic Markers assigned
     * onto either classical or RI maps (where map type is genetic) and 
     * creating type specific Marker objects for each depending on which
     * map assignment is on.  Data objects are stored in geneticMarkerHashMap
     * with map's map_element_id as key referencing list of elements found on
     * that map.  ArrayLists are transformed to type-specific Location arrays 
     * and associated with GeneticMap objects (through assignLocationsToGeneticMaps method)
     */
    private void loadGeneticMapData( DBconnection conn ) throws SQLException{
        // will hold genetic map's map element id as key referencing
        // features on that map as Location objects
        HashMap geneticMarkerHashMap = new HashMap();

        double conf = 0.0;
        
        // Genetic Markers
        String geneticMapQuery = 
            "SELECT g.name, " +
            "g.tair_object_id, " +
            "m.map_element_id AS map_id, " +
            "g.chromosome, " +
            "g.is_sequenced, " +
            "ga.is_derived, " +
            "ga.start_position, " +
            "ga.end_position " +
            "FROM GeneticMarker g, GlobalAssignment ga, Map m " +
            "WHERE g.map_element_id = ga.map_element_id " +
            "AND ga.map_id = m.map_id " +
            "AND m.map_type = 'genetic'";
        
        conn.setQuery( geneticMapQuery );
        ResultSet rs = conn.getResultSet();
        while ( rs.next() ) {
            String name = rs.getString( "name" );
            long tair_object_id = rs.getLong( "tair_object_id" );
            long map_id = rs.getLong( "map_id" );
            String is_sequenced = rs.getString( "is_sequenced" );
            String is_derived = rs.getString( "is_derived" );                    
            double start = rs.getDouble( "start_position" );

            // fake this to reduce to query speed, so don't have to join three tables
            // MapElement, Assignment and GeneticMarker;
            int type = Map.getMapType( "AFLP" ).getTypeIndex();
            
            CoordinateLocation cloc;
            if ( isCLASSICAL( map_id ) ) {
                ClassicMarker cmarker = new ClassicMarker( tair_object_id, type, name,"AtIR" );
                cmarker.setCloned_Marker( isTrue( is_sequenced ) ); 
                cmarker.setPosFromRI_Marker( isTrue( is_derived ) ); 
                cmarker.isGenetic( true );
                cloc  = new CoordinateLocation( cmarker,
                                                true,   // isAbsolute
                                                null,   // relativeTo
                                                start,  // position
                                                conf    // confidence
                                                );

            } else if ( isRI( map_id ) ) {
                RiMarker rmarker = new RiMarker( tair_object_id, type, name, "AtIR" );
                rmarker.setCloned_Marker( isTrue( is_sequenced ) );
                rmarker.isGenetic( true );
                cloc = new CoordinateLocation( rmarker,
                                               true,   // isAbsolute
                                               null,   // relativeTo
                                               start,  // position
                                               conf    // confidence
                                               );
                
            } else {
                Marker marker = new Marker( tair_object_id, type, name, "AtIR" );
                marker.isGenetic( true );
                cloc = new CoordinateLocation( marker,
                                               true,   // isAbsolute
                                               null,   // relativeTo
                                               start,  // position
                                               conf    // confidence
                                               );
            }
            
            ArrayList locationList  = (ArrayList) geneticMarkerHashMap.get( new Long( map_id ) );
            if ( locationList == null ) {
                locationList = new ArrayList();
                geneticMarkerHashMap.put( new Long( map_id ), locationList );
            }
          
            locationList.add( cloc );
        }
        conn.releaseResources();
        
        assignLocationsToGeneticMaps( geneticMarkerHashMap );
    }
    
    
    /**
     * Transforms submitted locations data in geneticMarkerHashMap (where genetic
     * map's map element id is key referencing list containing Location objects 
     * for that map) into type specific arrays, then add arrays to appropriate
     * GeneticMap objects
     */
    private void assignLocationsToGeneticMaps( HashMap geneticMarkerHashMap ) {
        System.out.println( "map: Assembling Genetic Map ..." );

        for ( Iterator e = geneticHashMap.keySet().iterator(); e.hasNext(); ) {
            
            Long map_id = (Long) e.next();
            GeneticMap gMap = (GeneticMap) geneticHashMap.get( map_id );
            ArrayList list = (ArrayList) geneticMarkerHashMap.get( map_id );                              
                  
            // transfer map Vector to map array ( return array )
            Location[] locationArr = new Location[ list.size() ];
            list.toArray( locationArr );
            
            gMap.setLocations( locationArr );
        }
    }
  

    /**
     * Populates Contig map by retrieving all contigs and storing in
     * contigHashMap with contig name as String key referencing Contig
     * object -- after method completes, only Contig objects will
     * be created. Locations (Clones & Probes) will be retrieved for
     * each Contig in some other method
     */
    private void loadContig( DBconnection conn ) throws SQLException {

        int type = MappableEntityType.getType( "Contig" );

        contigHashMap = new HashMap();
        
        // will hold chromosome and group name as key referencing
        // ArrayList of locations for that group 
        HashMap groupLocationHashMap = new HashMap();
        
        // get all the Contig/Probes, Clones information
        String contigQuery = 
            "SELECT c.name, " +
            "c.tair_object_id, " +
            "c.chromosome, " +
            "c.group_name, " +
            "ga.start_position, " +
            "ga.end_position " +
            "FROM Contig c, GlobalAssignment ga " +
            "WHERE c.map_element_id = ga.map_element_id";
        
        conn.setQuery( contigQuery );
        ResultSet rs = conn.getResultSet();
        while ( rs.next() ) {
            String contig = rs.getString( "name" ); 
            long tair_object_id = rs.getLong( "tair_object_id" );
            String chr = rs.getString( "chromosome" );
            String groupName = rs.getString( "group_name" );
            double start = rs.getDouble( "start_position" );
            double end = rs.getDouble( "end_position" );
                    
            // Create Contig, without knowing Locations ( probes and clones ) yet.
            Contig cont = new Contig( new MappableEntity( tair_object_id, 
                                                          type, 
                                                          contig, 
                                                          "AtIR" ), 
                                      "kb",
                                      start,
                                      end,
                                      null,
                                      chr );
            
            contigHashMap.put( contig, cont );
            
            ArrayList locations = (ArrayList) groupLocationHashMap.get( chr + groupName );
            if ( locations == null ) {
                locations = new ArrayList();
                groupLocationHashMap.put( chr + groupName, locations );
            }
            
            
            locations.add( new IntervalLocation( cont,                           // ME
                                                 true,                           // isAbsolute
                                                 null,                           // relativeTo
                                                 cont.getStart(),                // leftStart
                                                 cont.getEnd()-cont.getStart()   // range
                                                 ) ); 
            
            
            
        }
        conn.releaseResources();
        
        assignLocationsToPhysicalMaps( groupLocationHashMap );
    }
    
    
    /**
     * Translates ArrayLists of Location objects for each Contig and 
     * transforms to Location arrays, then sets list of locations for
     * each Physical Map object that shares Contig's combination
     * of chromosome and group name
     */
    private void assignLocationsToPhysicalMaps( HashMap groupLocationHashMap ) {
        System.out.println( "map: Assembling Physical Map ..." );

        for ( Iterator e = groupHashMap.keySet().iterator() ; e.hasNext() ; ) {
            String map_id = (String) e.next();
            PhysicalMap pMap = (PhysicalMap) groupHashMap.get( map_id );
            
            ArrayList list = (ArrayList) groupLocationHashMap.get( map_id );                              
            if ( list != null ) {
                Location[] locationArr = new Location[ list.size() ];
                list.toArray( locationArr );
                pMap.setLocations( locationArr );
            }
        }
    }
    

    /**
     * Retrieves vector types for every non-AGI clone mapped onto a Contig. 
     *
     * @return HashMap containing Clone's tair_object_id as Integer key referencing
     * String value for clone's vector type
     */
    private HashMap loadNonAGICloneVectorTypes( DBconnection conn ) throws SQLException {
        HashMap nonAGICloneVectorTypes = new HashMap();
       
        String query =
            "SELECT c.tair_object_id, c.vector_type " +
            "FROM Clone c, LocalAssignment la, Contig co " +
            "WHERE co.map_element_id = la.super_map_element_id " +
	    //c.is_agi_clone = 'F' " +
	    "AND c.assembly_unit_id IS NULL " +
            "AND c.map_element_id = la.sub_map_element_id ";

        conn.setQuery( query );
        ResultSet rs = conn.getResultSet();
        while ( rs.next() ) {
            long tair_object_id =  rs.getLong( "tair_object_id" );
            String vector_type =  rs.getString( "vector_type" );
          
            if ( vector_type == null ) {
                vector_type = "NULL";
            }
            
            nonAGICloneVectorTypes.put( new Long( tair_object_id ),  vector_type );
            
        }
        conn.releaseResources();

        return nonAGICloneVectorTypes;
    }

    
    /**
     * Retrieves map element names that are used as probes.  Query all
     * MapElement child tables specified in physicalMapElementTables
     * for different map element types used as probes.
     *
     * @return HashMap containing map element/probe name as both
     * key and value (???)
     */
    private HashMap loadProbeNames( DBconnection conn, 
				    String[] physicalMapElementTables ) 
	throws SQLException {
        // using Hybridization table to find out if a map element 
        // which is mapped to a contig is a probe.
        HashMap probeNames = new HashMap();

	// for each table, get query that uses table name for SELECTing
	// data from and save name in probeNames map
	for ( int i = 0; i < physicalMapElementTables.length; i++ ) {
	    String mapElementAsProbeQuery =
		getMapElementAsProbeQuery( physicalMapElementTables[ i ] );

	    conn.setQuery( mapElementAsProbeQuery );
	    ResultSet rs = conn.getResultSet();
	    while ( rs.next() ) {
		String probe_name =  rs.getString( "name" );
		probeNames.put( probe_name, probe_name );
		
	    }
	    conn.releaseResources();
	}
        
        return probeNames;
    }

    
    /**
     * Create query to get probe name from one of multiple MapElement child
     * tables that may hold data. Probe is defined as element that is mapped
     * onto a Contig that has an entry in Hybridization as probe id
     */
    private String getMapElementAsProbeQuery( String table ) {
	String query = 
	    "SELECT DISTINCT ( m.name ) " +
            "FROM " + table + " m, " +
	    "Contig c, " +
	    "LocalAssignment la, " +
	    "Hybridization h " +
            "WHERE m.map_element_id = la.sub_map_element_id " +
            "AND la.super_map_element_id = c.map_element_id " +
            "AND h.probe_id = m.map_element_id ";
	return query;
    }


    /**
     * Create query to get name, id and assignment info. for element mapped
     * onto Physical Map (contig) from one of multiple MapElement child
     * tables that may hold data.
     */
    private String getPhysicalMapElementQuery( String table ) {
	String query =  
	    "SELECT m.name, " +
            "m.tair_object_id, " +
            "c.chromosome, " +
            "la.start_position, " +
            "la.end_position, " +
            "c.name AS contig_name " +
            "FROM " + table + " m, Contig c, LocalAssignment la " +
            "WHERE m.map_element_id = la.sub_map_element_id " +
            "AND la.super_map_element_id = c.map_element_id ";

	return query;
    }
	


    /**
     * Loads all map elements mapped onto Contigs
     *
     */
    private void loadPhysicalMapData( DBconnection conn ) throws SQLException {
        
        // contig name referencing list of Locations on that map
        cloneProbeHashMap = new HashMap();

        HashMap markersHT = new HashMap();
        double conf = 0.0;

        // get tair object ids and vector types for non-AGI clones
        HashMap nonAGICloneVectorTypes = loadNonAGICloneVectorTypes( conn );      
        
	
	// Elements mapped onto the Physical Map may come from 
	// any of MapElement child tables defined below.  Create
	// array of table names to use for querying each table 
	// directly (can no longer generically query MapElement 
	// without knowing concrete type of element since all
	// data has been pushed down to child tables)
	String[] physicalMapElementTables = new String[] {
	    "Gene",
	    "Clone",
	    "CloneEnd",
	    "GeneticMarker",
	    "Unknown",
	    "DnaFragment"
	};


        // get names of map elements used as probes from each of
	// possible MapElement child tables
        HashMap probeNames = loadProbeNames( conn, physicalMapElementTables );


        // get elements mapped onto Contig from each of possible tables
	for ( int i = 0; i < physicalMapElementTables.length; i++ ) {
	    String physicalMapQuery = 
		getPhysicalMapElementQuery( physicalMapElementTables[ i ] );
	    
	    conn.setQuery( physicalMapQuery );

	    ResultSet rs = conn.getResultSet();
	    while ( rs.next() ) {
		String name = rs.getString( "name" );
		long tair_object_id = rs.getLong( "tair_object_id" );
		String chromosome = rs.getString( "chromosome" );                    
		double start = rs.getDouble( "start_position" );
		double end = rs.getDouble( "end_position" );
		String contig_name = rs.getString( "contig_name" );
                  
		// fake this to reduce to query speed, so don't have to join three tables
		// MapElement, Assignment and GeneticMarker to find the type of marker;
		int  type = MappableEntityType.getType( "unknown" );

		double contigStart = 0.0;
            
		// get Contig map object for contig w/this row's contig name and
		// determine Contig's start position
		Contig contig = (Contig) contigHashMap.get( contig_name );
		if ( contig != null ) {
		    contigStart = contig.getStart();
		}
            

		// get any Locations already found for this contig -- initialize
		// list if not created yet
		ArrayList locationList  = (ArrayList) cloneProbeHashMap.get( contig_name );
		if ( locationList == null ) {
		    locationList = new ArrayList();
		    cloneProbeHashMap.put( contig_name, locationList );
		}
            

		// for probes, need to adjust the position
		if ( probeNames.get( name ) != null ) {       
		    Location loc = null;
		    // Get reference to, or create the MARKER.
		    if ( markersHT.containsKey( name ) ) {
			loc = (CoordinateLocation) markersHT.get( name );
                    
		    } else {
			conf = 0.0;
			Probe probe = new Probe( tair_object_id, type, name, "AtIR" );

			if ( physicalMapElementTables[ i ].equals(  "Clone" ) ) {
			    probe.setFeatureType( FeatureType.clone );
			    
			} else if ( physicalMapElementTables[ i ].equals( "CloneEnd" ) ) {
			    probe.setFeatureType( FeatureType.cloneEnd );
			    
			} else if ( physicalMapElementTables[ i ].equals( "Gene" ) ) {
			    probe.setFeatureType( FeatureType.gene );
			    
			} else if ( physicalMapElementTables[ i ].equals( "GeneticMarker" ) ) {
			    probe.setFeatureType( FeatureType.marker );
			    
			    
			} else if ( physicalMapElementTables[ i ].equals( "Unknown" ) ) {
			    probe.setFeatureType( FeatureType.unknown );
			    
			} else if ( physicalMapElementTables[ i ].equals(  "DnaFragment" ) ) {
			    probe.setFeatureType( FeatureType.dnaFragment ); 
			    
			}
			
			loc   = new CoordinateLocation( probe, 
							true, 
							null, 
							start + contigStart, 
							conf );
			locationList.add( loc );
			
			markersHT.put( name, loc ); // Keep HT of MARKERS for obtaining references.
		    }
		    
		} 
		
		// for clone
		if ( physicalMapElementTables[ i ].equals(  "Clone" ) ) {
		    
		    // non-AGI clones, status = 0, need to find out the vector type
		    // agi clones, need to find out the seq_status;
		    int status = 0;
		    
		    String seqStatus = (String) agiCloneSeqStatus.get( new Long( tair_object_id ) );
		    

		    // for non-AGI clone, assign this status to 0;
		    
		    if ( seqStatus != null ) { // it is an AGI clone
			status = Integer.parseInt( seqStatus );
                    
		    } else { // non AGI clones
                    
			String vector_type = (String) nonAGICloneVectorTypes.get( new Long( tair_object_id ) );
			if ( vector_type == null ) {
			    vector_type = "NULL";
			}
                    
			type = MappableEntityType.getType( vector_type.trim() );
                    
		    }
                        

             
		    // Create PhysicalMap for the CLONE
		    Clone clone = new Clone( new MappableEntity( tair_object_id, 
								 type, 
								 name, 
								 "AtIR" ), 
					     "kb",
					     start + contigStart,
					     end + contigStart,
					     null,
					     chromosome );
                


		    clone.setStatus( status );
                
		    // don't care the direction
		    clone.setDirection( 0 );
                
		    String[] acc = { "" + tair_object_id };
		    clone.setAccessionNumber( acc );
                
		    Location loc = new IntervalLocation( clone,                            // ME
							 true,                             // isAbsolute
							 null,                             // relativeTo
							 start + contigStart,              // leftStart
							 end - start                       // range
							 ); 
                
		    locationList.add( loc );
                
		}
	    }
	    conn.releaseResources();
	}
                
        for ( Iterator e = contigHashMap.keySet().iterator(); e.hasNext(); ) {
            String contig_name = (String) e.next();
            Contig contig = (Contig) contigHashMap.get( contig_name );
            ArrayList list = (ArrayList) cloneProbeHashMap.get( contig_name );                                

            // transfer map Vector to map array ( return array )
            if ( list != null ) {
                Location[] locationArr = new Location[ list.size() ];
                list.toArray( locationArr );
                contig.setLocations( locationArr );
            }
        }
    }
    

    // translates submitted orientation into int values where
    // forward becomes 1, reverse becomes 2 and a NULL/other 
    // value is returned as 0
    private int getDirection( String orientation ) {
        if ( orientation != null ) {
            if  ( orientation.equals( "F" ) ) {
                return 1;
            } else if ( orientation.equals( "R" ) ) {
                return 2;
            } else {
                return 0;
            }
        } else {
            return 0;
        }
    }
    /**
     * Translates character value of submitted question into
     * boolean true/false.  Will return true if question equals "T",
     * false for null or other values
     */
    private boolean isTrue( String question ) {
        return ( question != null && question.equals( "T" ) );
    }


    /**
     * Loads data for genes associated to mutant polymorphisms (where 
     * has_observable_phenotype flag is true) for sequence/AGI map.  These
     * genes are displayed using the assignment data for rep. gene model
     * for a single locus. All non-TIGR gene symbol names associated to that
     * same locus will be displayed in viewer.  Since gene data has already
     * been retrieved from the database, population of mutant genes is done
     * by copying as much information from rep. gene model's GeneFeature object
     * already contained w/in SequenceMap to each new MutantGene object that
     * is created.
     *
     * <p>
     * Once all data has been retrieved for mutant genes, new genes are added
     * to SequenceMaps' collections of Location objects
     */
    private void loadMutantGenes( DBconnection conn ) throws SQLException {

        System.out.println( "map: Loading mutant genes..." );


        // get ids of representative gene models that are associated to mutant
        // phenotype along with their corresponding locus ids. Map will contain
        // rep. gene model's tair object id as Integer referencing Integer value 
        // of locus tair object id
        HashMap geneLocusIDs = getMutantIDs( conn );

        // get IntervalLocation objects for all found gene ids
        // Map will contain string value of chromosome referencing
        // array of IntervalLocation objects for each rep. gene model
        Set geneIDs = geneLocusIDs.keySet();
        HashMap repGenes = getGeneObjects( geneIDs );

        // create new IntervalLocation objects containing new MutantGene objects
        HashMap mutantGenes = createMutantGenes( repGenes );

        // associate locus ids to mutant gene objects (needed for making
        // links to locus detail page from Band image
        associateLocusIDs( geneLocusIDs, mutantGenes );

        // get all non-TIGR gene models for rep gene's locus and
        // combine to create mutant gene's display name
        getMutantGeneCombinedNames( conn, mutantGenes );

        // get symbol aliases for any TIGR/rep. genes that don't
        // have other associated symbols through locus to avoid
        // displaying TIGR gene name if possible
        getRepGeneAliases( conn, mutantGenes );

        // get all non-TIGR symbol aliases for searching
        getMutantGeneAliases( conn, mutantGenes );
        


        // add mutant genes to maps
        addSequenceMapLocations( mutantGenes );

    }

    /**
     * Retrieves ids gene models that are associated to a mutant phenotype and 
     * are also the representative gene model for a locus.  All genes 
     * associated to locus will also be associated to mutant phenotype, but map
     * viewer will display the mutant gene using rep. gene model's assignments. 
     *
     * @param conn An active connection to the database
     * @return Map containing gene tair object ids as Integer keys referencing
     * their corresponding locus tair object id as Integer
     */
    private HashMap getMutantIDs( DBconnection conn ) throws SQLException {

        // Get tair object ids of rep. gene models that are linked to visible 
	// polymorphisms from AgiAssignment work table that contains AGI 
	// assignments; don't need to restrict to non-obsolete genes since 
	// that's all that should be in work table (see 
	// org.tair.seqviewer.server.AgiAssignment for details).
        String query =
            "SELECT DISTINCT a.tair_object_id as gene_id, " +
	    "l.tair_object_id AS locus_id " +
            "FROM AgiAssignment_wrk a, " +
	    "Locus l, " +
	    "Gene_MapElement gm, " +
	    "Polymorphism p " +
            "WHERE a.map_element_id = l.rep_genemodel_id " +
            "AND a.table_id = gm.gene_id " +
            "AND gm.map_element_id = p.map_element_id " +
            "AND p.has_observable_phenotype = 'T' " +
            "AND l.is_obsolete = 'F' " +
            "AND p.is_obsolete = 'F' "; 

        Long geneTairObjID = null;
        Long locusTairObjID = null;
        HashMap geneLocusIDs = new HashMap();
        conn.setQuery( query );
        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            geneTairObjID = new Long( results.getLong( "gene_id" ) );
            locusTairObjID = new Long( results.getLong( "locus_id" ) );
            geneLocusIDs.put( geneTairObjID, locusTairObjID );
        }
        conn.releaseResources();

        return geneLocusIDs;
    }

    
    /**
     * Retrieve IntervalLocation objects for each gene id is repGeneIDs by 
     * getting matches from each chromosome's instance of SequenceMap.
     * IntervalLocation & GeneFeature objects for rep. genes  on AGI map 
     * should have been already created when SequenceMap data was loaded 
     * above.  This method gets those data objects from SequenceMaps so that data 
     * can be used for showing mutant genes. This should be quicker than going back 
     * to db for data we already have.
     * 
     * @param repGeneIDs Tair object ids of gene objects to retrieve; Set must
     * contain ids as Integer values
     *
     * @return Mutant genes for each chromosome as map with string version
     * of chromosome referencing referencing array of IntervalLocation objects 
     * for that chromosome
     */
    private HashMap getGeneObjects( Set repGeneIDs ) {
        HashMap repGeneModels = new HashMap();
        for ( int i = 1; i <= numberOfChrs; i++ ) {
            SequenceMap sMap = (SequenceMap) sequenceHashMap.get( String.valueOf( i ) );
            IntervalLocation[] repGenes = sMap.getMatchingGenes( repGeneIDs );
            repGeneModels.put( String.valueOf( i ), repGenes );
        }

        return repGeneModels;
    }


    /**
     * Creates IntervalLocation objects that contain MutantGene objects as 
     * Location's MappableEntity. These IntervalLocations will be used to 
     * represent mutant genes from here on out.  Copy assignment and relevant
     * gene data submitted existing IntervalLocation and GeneFeature objects 
     * to new IntervalLocation and MutantGene objects
     *
     * @param repGenes Map of representative gene models w/mutant phenotypes stored
     * as string version of chromosome referencing array of IntervalLocation objects
     * for genes on that chromosome
     * @return Map of genes as IntervalLocation objects (containing MutantGene as 
     * MappableEntity) stored w/chromosome referencing array of IntervalLocation 
     * objects
     */
    private HashMap createMutantGenes( HashMap repGenes ) {

        HashMap mutants = new HashMap();
        for ( int i = 1; i <= numberOfChrs; i++ ) {
            String chromosome = String.valueOf( i );

            IntervalLocation[] geneLocations = 
		(IntervalLocation[]) repGenes.get( chromosome );

            ArrayList tmpMutants = new ArrayList();
            for ( int j = 0; j < geneLocations.length; j++ ) {
                
                // create mutant gene using info. from GeneFeature
                MutantGene mutant = 
		    new MutantGene( geneLocations[ j ].getMappableEntity() );

                // create IntervalLocation for mutant using new MutantGene
                // and assignment data from rep. gene model
                IntervalLocation mutantLocation = 
		    new IntervalLocation( mutant, geneLocations[ j ] );

                tmpMutants.add( mutantLocation );
            }
            
            // translate to typed array and save mutants for this chromosome
            IntervalLocation[] mutantArr = 
		new IntervalLocation[ tmpMutants.size() ];

            mutantArr = (IntervalLocation[]) tmpMutants.toArray( mutantArr );
            mutants.put( chromosome, mutantArr );
        }

        return mutants;
    }



    /**
     * Associates locus ids for each gene represented by in mutantGenes map by
     * setting locus id as member variable of gene's MutantGene data object.
     *
     * @param geneLocusIDs Gene tair object ids as Integer values referencing 
     * Integer value of tair object id for gene's locus
     * @param mutantGenes Mutant gene objects for each chromosome stored w/string
     * value of chromosome as key referencing array of IntervalLocations containing
     * MutantGene as MappableEntity
     */
    private void associateLocusIDs( HashMap geneLocusIDs, HashMap mutantGenes ) {
        
        // get array for each chromosome, then get corresponding
        // locus id for each gene id from geneLocusIDs
        for ( int i = 1; i <= numberOfChrs; i++ ) {
            String chromosome = String.valueOf( i );
            IntervalLocation[] genes = 
		(IntervalLocation[]) mutantGenes.get( chromosome );

            for ( int j = 0; j < genes.length; j++ ) {
                MutantGene gene = (MutantGene) genes[ j ].getMappableEntity();
                Long geneID = new Long( gene.getID() );
                Long locusID = (Long) geneLocusIDs.get( geneID );
                gene.setLocusTairObjectID( locusID.longValue() );
            }
        }
    }
        


    /**
     * Retrieves all non-TIGR (!At*G**** names) gene symbols associated
     * to locus of mutant gene and stores with mutant gene. These names
     * will be combined to form a single display name for mutant gene entity
     * that uses rep. gene model's assignment data for display
     * 
     * @param conn An active connection to the database
     * @param mutantGenes Mutant genes for each chromosome stored w/string
     * value of chromosome referencing an array of IntervalLocation objects
     */
    private void getMutantGeneCombinedNames( DBconnection conn, 
					     HashMap mutantGenes) 
        throws SQLException {

        // set prepared statement and execute once for each gene model to
        // simplify retrieval
        String query = 
            "SELECT mg.name " +
            "FROM Gene mg, MapElement_Locus ml, Locus l, Gene g " +
            "WHERE mg.map_element_id = ml.map_element_id " +
            "AND ml.locus_id = l.locus_id " +
            "AND l.is_obsolete = 'F' " +
            "AND mg.name NOT LIKE 'AT_G%' " + // allow for splice variant
            "AND mg.name_type = 'symbol' " +
            "AND l.rep_genemodel_id = g.map_element_id " +
            "AND g.tair_object_id = ?";

        conn.setQuery( query );

        IntervalLocation[] locations = null;
        MutantGene mutant = null;
        ResultSet results = null;

        Iterator iter = mutantGenes.values().iterator();
        while ( iter.hasNext() ) {
            locations = (IntervalLocation[]) iter.next();

            for ( int i = 0; i < locations.length; i++ ) {
                mutant = (MutantGene) locations[ i ].getMappableEntity();
                conn.setQueryVariable( 1, new Long( mutant.getID() ) );
                results = conn.getResultSet();
                while ( results.next() ) {
                    mutant.addGeneName( results.getString( "name" ) );
                }
                results.close();
            }
        }
        conn.releaseResources();

    }

    /**
     * Gets symbol aliases for rep. gene model (TIGR gene) and stores as name.
     * This is done only if rep. gene model has no other symbol names 
     * associated to it through locus (i.e. if getMutantGeneCombinedName
     * method didn't retrieve any results for this gene).
     *
     * @param conn An active connection to the database
     * @param mutantGenes Mutant genes for each chromosome stored w/string
     * value of chromosome referencing an array of IntervalLocation objects
     */
    private void getRepGeneAliases( DBconnection conn, HashMap mutantGenes ) 
        throws SQLException {

        // set prepared statement and execute once for each gene model to
        // simplify retrieval
        String query = 
            "SELECT ga.alias " +
            "FROM GeneAlias ga, Gene g " +
            "WHERE ga.gene_id = g.gene_id " +
            "AND ga.is_obsolete = 'F' " +
            "AND ga.alias_type = 'symbol' " +
            "AND ga.alias NOT LIKE 'AT_G%' " +
            "AND g.tair_object_id = ?";

        conn.setQuery( query );

        IntervalLocation[] locations = null;
        MutantGene mutant = null;
        ResultSet results = null;

        Iterator iter = mutantGenes.values().iterator();
        while ( iter.hasNext() ) {
            locations = (IntervalLocation[]) iter.next();

            for ( int i = 0; i < locations.length; i++ ) {
                mutant = (MutantGene) locations[ i ].getMappableEntity();

                // only get aliases if mutant has no symbol names through
                // genes on same locus
                if ( !mutant.hasNames() ) {
                    conn.setQueryVariable( 1, new Long( mutant.getID() ) );
                    results = conn.getResultSet();
                    while ( results.next() ) {
                        mutant.addGeneName( results.getString( "alias" ) );
                    }
                    results.close();
                }
            }
        }
        conn.releaseResources();
        
    }
        


    /**
     * Retrieves all non-TIGR (!At*G**** names) gene symbol aliases associated
     * to locus of mutant gene and stores with mutant gene. These names
     * are not displayed, but are needed for searching genes
     * 
     * @param conn An active connection to the database
     * @param mutantGenes Mutant genes for each chromosome stored w/string
     * value of chromosome referencing an array of IntervalLocation objects
     */
    private void getMutantGeneAliases( DBconnection conn, HashMap mutantGenes) 
        throws SQLException {

        // set prepared statement and execute once for each gene model to
        // simplify retrieval
        String query = 
            "SELECT ga.alias " +
            "FROM GeneAlias ga, " +
	    "Gene mg, " +
	    "MapElement_Locus ml, " +
	    "Locus l, " +
	    "Gene g " +
            "WHERE ga.gene_id = mg.gene_id " +
            "AND mg.map_element_id = ml.map_element_id " +
            "AND ml.locus_id = l.locus_id " +
            "AND l.is_obsolete = 'F' " +
            "AND ga.alias NOT LIKE 'AT_G%' " +
            "AND ga.alias_type = 'symbol' " +
            "AND ga.is_obsolete = 'F' " +
            "AND l.rep_genemodel_id = g.map_element_id " +
            "AND g.tair_object_id = ?";

        conn.setQuery( query );

        IntervalLocation[] locations = null;
        MutantGene mutant = null;
        ResultSet results = null;

        Iterator iter = mutantGenes.values().iterator();
        while ( iter.hasNext() ) {
            locations = (IntervalLocation[]) iter.next();

            for ( int i = 0; i < locations.length; i++ ) {
                mutant = (MutantGene) locations[ i ].getMappableEntity();
                conn.setQueryVariable( 1, new Long( mutant.getID() ) );
                results = conn.getResultSet();
                while ( results.next() ) {
                    mutant.addAlias( results.getString( "alias" ) );
                }
                results.close();
            }
        }
        conn.releaseResources();

    }



    /**
     * Adds submitted Locations to sequence maps.  This is different than
     * assignLocationsToSequenceMaps (only partially because of param list)
     * in that submitted locations are added to list of locations already
     * sequence map, rather than overwriting any that are already there.
     *
     * @param locationsMap Map of locations stored with chromosome string
     * value referencing array of Location objects for that chromosome
     */
    private void addSequenceMapLocations( HashMap locationsMap ) {
        
        System.out.println( "map: Adding locations to Sequence Map ..." );
        for ( int i = 1; i <= numberOfChrs; i++ ) {
            String chromosome = String.valueOf( i );
            SequenceMap sMap = (SequenceMap) sequenceHashMap.get( chromosome );
            Location[] locations = (Location[]) locationsMap.get( chromosome );
            sMap.addLocations( locations );
        }
    }
        

    public static void main( String[] args ) {
        try {
            MapDBServer server = new MapDBServer();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }
  
}
