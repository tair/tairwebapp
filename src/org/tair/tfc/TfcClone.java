//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.28 $
// $Date: 2004/07/06 20:24:54 $
//------------------------------------------------------------------------------ 
package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.tair.utilities.InvalidActionException;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * This class maps to the Clone table in the tair database. Each instance
 * maps one row of data in Clone table. Each data object maps to one field
 * of a row in the table.
 */

public class TfcClone extends TfcMapElement {  

    private Long clone_id;
    private Long taxon_id;
    private Long species_variant_id;
    private Long assembly_unit_id;
    private String name;
    private String chromosome;
    private Float length;
    private String units;
    private String insert_type;
    private Float insert_size;
    private String construct_type;
    private String promoter;
    private String reporter;
    private String vector_type;
    private Long vector_id;
    private Long library_id;
    private Boolean has_clone_end;
    private Boolean is_chimeric;
    private Long clone_chimerism_id;
    private String antibiotic_selection;
    private Long cloning_enzyme_1_id;
    private Long cloning_enzyme_2_id;
    private Long parent_clone_id;
    private Long host_strain_id;
    private Boolean has_flank_sequence;
    private Boolean is_sequenced;
    private java.util.Date date_last_modified;
    private Boolean is_arrayed;
    private Boolean is_obsolete;
    private String original_name;
    private java.util.Date date_entered;


    /**
     * Creates an empty instance of TfcClone
     */
    public TfcClone() { 
	super();
    }
  
    /**
     * Creates an instance of TfcClone that reflects the data referenced by
     * submitted clone id
     *
     * @param conn An active connection to the database
     * @param clone_id ID to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public TfcClone( DBconnection conn, Long clone_id ) 
	throws RecordNotFoundException, SQLException {   

        super( conn, clone_id );   
    }

    /**
     * Implements abstract method in superclass to return "Clone"
     * as name of database table this class represents.
     *
     * @return Name of database table this class represents
     */
    public final String getTableName() {
	return "Clone";
    }

    /**
     * Implements abstract method in superclass to return "clone_id" as 
     * name of primary key column to use when creating SQL statement 
     * for object population.
     *
     * @return Name of primary key column to use in SQL SELECT statement
     */
    public final String getKeyColumn() {
	return "clone_id";
    }

    /**
     * Implements abstract method in superclass to return full list of
     * all Clone specific columns to be included in SQL SELECT statement 
     * when populating object.
     *
     * @return String array of all Clone specific columns to include in 
     * SELECT statement when populating object.
     */
    public final String[] getColumns() {
	String[] localClassColumns = new String[] {
            "clone_id",
            "taxon_id",
            "species_variant_id",
            "assembly_unit_id",
            "name",
            "chromosome",
            "length",
            "units",
            "insert_type",
            "insert_size",
            "construct_type",
            "promoter",
            "reporter",
            "vector_type",
            "vector_id",
            "library_id",
            "has_clone_end",
            "is_chimeric",
            "clone_chimerism_id",
            "antibiotic_selection",
            "host_strain_id",
            "cloning_enzyme_1_id",
            "cloning_enzyme_2_id",
            "has_flank_sequence",
            "is_sequenced",
            "date_last_modified",
            "is_arrayed",
            "parent_clone_id",
	    "date_entered",
	    "original_name",
            "is_obsolete"
	};
	
	return localClassColumns;
    }


    /**
     * Retrieves Clone specific data from result set and stores in member 
     * variables.
     *
     * @param results ResultSet to populate member variables with
     * @throws SQLException if a database error occurs
     */
    public final void populate( ResultSet results ) throws SQLException {
	set_clone_id( new Long( results.getLong( "clone_id" ) ) );

	long id = results.getLong( "taxon_id" );
	if ( !results.wasNull() ) {
	   set_taxon_id( new Long( id ) );
	}
      
	id = results.getLong( "species_variant_id" );
	if ( !results.wasNull() ) {
	    set_species_variant_id( new Long( id ) );
	}
      
	id = results.getLong( "assembly_unit_id" );
	if ( !results.wasNull() ) {
	    set_assembly_unit_id( new Long( id ) );
	}

	set_name( results.getString( "name" ) );
	set_chromosome( results.getString( "chromosome" ) );

	float f = results.getFloat( "length" );
	if ( !results.wasNull() ) {
	    set_length( new Float( f ) );
	}
	
	set_units( results.getString( "units" ) );
	set_insert_type( results.getString( "insert_type" ) );      

	f = results.getFloat( "insert_size" );
	if ( !results.wasNull() ) {
	    set_insert_size( new Float( f ) );
	}
	
	set_construct_type( results.getString( "construct_type" ) );
	set_reporter( results.getString( "reporter" ) );
	set_promoter( results.getString( "promoter" ) );

	set_vector_type( results.getString( "vector_type" ) );

	id = results.getLong( "vector_id" );
	if ( !results.wasNull() ) {
	    set_vector_id( new Long( id ) );
	}

	id = results.getLong( "library_id" );
	if ( !results.wasNull() ) {
	    set_library_id( new Long( id ) );
	}
      
	set_has_clone_end( 
	    TextConverter.stringToBoolean( results.getString( "has_clone_end" ) ) );

	set_is_chimeric( 
	    TextConverter.stringToBoolean( results.getString( "is_chimeric" ) ) );

	id = results.getLong( "clone_chimerism_id" );
	if ( !results.wasNull() ) {
	    set_clone_chimerism_id( new Long( id ) );
	}
	
        set_antibiotic_selection( results.getString( "antibiotic_selection" ) );

	id = results.getLong( "host_strain_id" );
	if ( !results.wasNull() ) {
	    set_host_strain_id( new Long( id ) );
	}

	id = results.getLong( "cloning_enzyme_1_id" );
	if ( !results.wasNull() ) {
	    set_cloning_enzyme_1_id( new Long( id ) );
	}
      
	id = results.getLong( "cloning_enzyme_2_id" );
	if ( !results.wasNull() ) {
	    set_cloning_enzyme_2_id( new Long( id ) );
	}
	
	set_has_flank_sequence( 
	    TextConverter.stringToBoolean( 
		results.getString( "has_flank_sequence" ) ) );      

	set_is_sequenced( 
	    TextConverter.stringToBoolean(
		results.getString( "is_sequenced" ) ) );

	set_date_last_modified( results.getDate( "date_last_modified" ) );
	set_is_arrayed( 
	    TextConverter.stringToBoolean( results.getString( "is_arrayed" ) ) );

	set_is_obsolete( 
	    TextConverter.stringToBoolean( results.getString( "is_obsolete" ) ) );

	id = results.getLong( "parent_clone_id" );
	if ( !results.wasNull() ) {
	    set_parent_clone_id( new Long( id ) );
	}

	set_original_name( results.getString( "original_name" ) );
	set_date_entered( results.getDate( "date_entered" ) );
    }
  
    //
    // Get 'em and set 'em
    //


    public Long get_clone_id() {
        return clone_id;
    }

    public void set_clone_id( Long clone_id ) {
        this.clone_id = clone_id;
    }

    public Long get_taxon_id() {
        return taxon_id; 
    }

    public void set_taxon_id( Long taxon_id ) {
        this.taxon_id = taxon_id;
    }

    public Long get_species_variant_id() { 
        return species_variant_id; 
    } 

    public void set_species_variant_id( Long id ) {
        this.species_variant_id = id;
    } 

    public Long get_assembly_unit_id() {
        return assembly_unit_id;
    }

    public void set_assembly_unit_id( Long id ) {
        this.assembly_unit_id = id;
    }

    public String get_name() { 
        return name;
    }

    public void set_name( String name ) {
        this.name = name;
    }

    public String get_chromosome() {
        return chromosome;
    } 

    public void set_chromosome( String chromosome ) {
        this.chromosome = chromosome;
    } 

    public Float get_length() {
        return length;
    }

    public void set_length( Float length ) {
        this.length = length;
    }

    public String get_units() {
        return units; 
    }
    
    public void set_units( String units ) { 
        this.units = units;
    }

    public String get_insert_type() {
        return insert_type;
    }

    public void set_insert_type( String type ) { 
        this.insert_type = type;
    }
  
    public Float get_insert_size() { 
        return insert_size;
    }

    public void set_insert_size( Float size ) { 
        this.insert_size = size;
    }

    public String get_construct_type() { 
        return construct_type;
    }

    public void set_construct_type( String type ) {
        this.construct_type = type;
    }

    public String get_promoter() {
        return promoter;
    }

    public void set_promoter( String promoter ) { 
        this.promoter = promoter;
    }

    public String get_reporter() { 
        return reporter;
    }

    public void set_reporter( String reporter ) { 
        this.reporter = reporter;
    }

    public String get_vector_type() { 
        return vector_type;
    }

    public void set_vector_type( String type ) {
        this.vector_type = type;
    }

    public Long get_vector_id() { 
        return vector_id;
    }

    public void set_vector_id( Long vector_id ) { 
        this.vector_id = vector_id;
    }

    public Long get_library_id() {
        return library_id;
    }

    public void set_library_id( Long library_id ) { 
        this.library_id = library_id;
    }

    public Boolean get_has_clone_end() { 
        return has_clone_end;
    }

    public void set_has_clone_end( Boolean has_clone_end ) {
        this.has_clone_end = has_clone_end; 
    }

    public Boolean get_is_chimeric() { 
        return is_chimeric;
    }

    public void set_is_chimeric( Boolean is_chimeric ) { 
        this.is_chimeric = is_chimeric;
    }

    public Long get_clone_chimerism_id() {
        return clone_chimerism_id;
    }

    public void set_clone_chimerism_id( Long id ) { 
        this.clone_chimerism_id = id;
    }

    public String get_antibiotic_selection() {
        return antibiotic_selection;
    }

    public void set_antibiotic_selection( String selection ) { 
        this.antibiotic_selection = selection;
    }  

    public Long get_host_strain_id() {
        return host_strain_id;
    }

    public void set_host_strain_id( Long id ) {
        this.host_strain_id = id;
    }

    public Long get_cloning_enzyme_1_id() { 
        return cloning_enzyme_1_id;
    }

    public void set_cloning_enzyme_1_id( Long id ) { 
        this.cloning_enzyme_1_id = id;
    }

    public Long get_cloning_enzyme_2_id() { 
        return cloning_enzyme_2_id;
    }

    public void set_cloning_enzyme_2_id( Long id ) { 
        this.cloning_enzyme_2_id = id;
    }

    public Boolean get_has_flank_sequence() { 
        return has_flank_sequence;
    }

    public void set_has_flank_sequence( Boolean has_flank_sequence ) {
        this.has_flank_sequence = has_flank_sequence;
    }

    public Boolean get_is_sequenced() {
        return is_sequenced;
    }

    public void set_is_sequenced( Boolean is_sequenced ) { 
        this.is_sequenced = is_sequenced;
    }

    public java.util.Date get_date_last_modified() { 
        return date_last_modified;
    }

    public void set_date_last_modified( java.util.Date date ) {
        this.date_last_modified = date;
    }

    public Long get_parent_clone_id() {
        return parent_clone_id;
    }

    public void set_parent_clone_id( Long id ) {
        this.parent_clone_id = id;
    }

    public Boolean get_is_arrayed() { 
        return is_arrayed;
    }

    public void set_is_arrayed( Boolean is_arrayed ) { 
        this.is_arrayed = is_arrayed;
    }

    public Boolean get_is_obsolete() {
        return is_obsolete;
    }

    public void set_is_obsolete( Boolean is_obsolete ) { 
        this.is_obsolete = is_obsolete;
    }

    public void set_original_name( String name ) { 
	this.original_name = name; 
    }

    public String get_original_name() { 
	return original_name; 
    }

    public void set_date_entered( java.util.Date date ) { 
	this.date_entered = date;
    }

    public java.util.Date get_date_entered() { 
	return date_entered; 
    }


    /**
     * Retrieve clone id for submitted clone name
     *
     * @param conn An active connection to the database
     * @param name Name to retrieve clone id for
     * @return Clone id for submitted clone name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveCloneID( DBconnection conn, String name ) 
	throws SQLException {

        Long id = null;

        String query = 
            "SELECT c.clone_id " +
	    "FROM Clone c, " +
	    "     CloneNameAlias ca " +
	    "WHERE c.clone_id = ca.clone_id AND " +
	    "(c.name = " + TextConverter.dbQuote( name ) + " OR ca.name = " + TextConverter.dbQuote( name ) + ")";
	    

        conn.setQuery( query );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "clone_id" ) );
        }
        conn.releaseResources();

        return id;
    }

    /**
     * Retrieve clone id for submitted combination of clone name,
     * insert type and vector type
     *
     * @param conn An active connection to the database
     * @param name Name to retrieve clone id for
     * @param insertType Insert type to retrieve data for
     * @param vectorType Vector type to retrieve data for
     * @return Clone id for submitted combination of clone name, insert type
     * and vector type, or <code>null</code> if no row found for combination
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveCloneID( DBconnection conn, 
					String name,
					String insertType,
					String vectorType ) 
	throws SQLException {

        Long id = null;

        String query = 
            "SELECT clone_id " +
	    "FROM Clone " +
	    "WHERE name = " + 
	    TextConverter.dbQuote( name.toUpperCase() ) + " " +
	    "AND insert_type = " + 
	    TextConverter.dbQuote( insertType ) + " " +
	    "AND vector_type = " +
	    TextConverter.dbQuote( vectorType );

        conn.setQuery( query );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "clone_id" ) );
        }
        conn.releaseResources();

        return id;
    }



    /**
     * Stores contents of clone to the database as an INSERT or UPDATE 
     * depending on whether clone_id primary key is NULL or not.
     * 
     * <p>
     * Since storing TfcClone data results in storage to the MapElement and
     * TairObject tables through TfcMapElement and TfcTairObject super 
     * classes, this method should be called as part of an explicit database
     * transaction to properly handle committing or rolling back of 
     * transaction in case of errors
     *
     * @param conn An active connection to the database
     * @throws RecordNotFoundException if no row found for tair object id when
     * updating.
     * @throws SQLException if a database error occurs
     * @throws InvalidActionException if no tair object id has been set for
     * object when trying to UPDATE, or if required data for clone has not
     * be set before storing
     */
    public void store( DBconnection conn ) 
        throws RecordNotFoundException, SQLException, InvalidActionException {

	// ensure required values have been set
	validate();

	// store TairObject and MapElement values before Clone to ensure 
	// map element and tair_object_id is created for new entries
	super.store( conn );

	// if primary key null, do an insert and save newly 
	// created clone id in member variable
        if ( get_clone_id() == null ) {
	    insert( conn );
	    
	    // else do update
	} else {
	    update( conn );
	}	    
    }

    
    /**
     * Validates object to ensure that data required for INSERT to the 
     * database has been properly set.  
     *
     * @throws InvalidActionException if any data required for storing to db
     * have not been set
     */
    private void validate() throws InvalidActionException {
	// require clone name at a minimum
	if ( get_name() == null ) {
	    throw new InvalidActionException( "Cannot store clone with " +
					      "name NULL" );
	}

    }


   /** 
     * Inserts a new row into Clone containing contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    private void insert( DBconnection conn ) throws SQLException {

	// Get map of Clone specific column names and values to store
	Map columnValues = getLocalValuesMap();

	// use utility method in superclass to create INSERT 
	// statement using columnValues map. INSERT will automatically
	// include tair_object_id and map_element_id as well as a 
	// SELECT to get newly created clone_id.
	String insertQuery = createChildTableInsert( columnValues, "CLONE_ID", "CLONE_SEQ" );
	conn.setInsertQuery( insertQuery, "CLONE_ID" );
	Long id = conn.executeInsert();
	set_clone_id( id );
	conn.releaseResources();
	}

    /** 
     * Updates an existing row in Clone with contents of object
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws RecordNotFoundException if UPDATE does not affect any rows
     * @throws SQLException if a database error occurs
     */
    private void update( DBconnection conn ) 
	throws RecordNotFoundException, SQLException {

	// set now as date last modified for update
	set_date_last_modified( new java.util.Date() );
	
	// Get map of Clone specific column names and values to store
	Map columnValues = getLocalValuesMap();
	
	// use utility method in superclass to create UPDATE
	// statement using columnValues map -- UPDATE will always
	// be done using tair_object_id as primary key column in
	// WHERE clause
	String updateQuery = createChildTableUpdate( columnValues );
	conn.setQuery( updateQuery );
	
	int rowsAffected = conn.executeUpdate();
	conn.releaseResources();
	
	if ( rowsAffected <= 0 ) { 
	    throw new RecordNotFoundException( "Update on Clone " + 
					       "failed: No row found " +
					       "for tair object id: " + 
					       get_tair_object_id() );
	}
	
    }
    
    /**
     * Retrieves values to store for a Clone as a Map of column names
     * and values to store for each column using current values of member 
     * variables. This Map is used by utility methods defined in superclass
     * that create INSERT and UPDATE SQL statements
     *
     * <p>
     * Column names and values must be stored in Map as String. Values must be 
     * stored with any quotation marks around values included in String so
     * that they can be directly included in SQL created in super class
     * 
     * @return Map of column names for table as String keys referencing
     * values for each column name.  
     */
    private Map getLocalValuesMap() {
	Map localValues = new HashMap();

	localValues.put( "name", TextConverter.dbQuote( get_name() ) );

	localValues.put( "taxon_id", TextConverter.dbQuote( get_taxon_id() ) );

	localValues.put( "species_variant_id",
			 TextConverter.dbQuote( get_species_variant_id() ) );

	localValues.put( "assembly_unit_id", 
			 TextConverter.dbQuote( get_assembly_unit_id() ) );

	localValues.put( "chromosome", 
			 TextConverter.dbQuote( get_chromosome() ) );

	localValues.put( "length", TextConverter.dbQuote( get_length() ) );
	localValues.put( "units", TextConverter.dbQuote( get_units() ) );

	localValues.put( "insert_type", 
			 TextConverter.dbQuote( get_insert_type() ) );

	localValues.put( "insert_size", 
			 TextConverter.dbQuote( get_insert_size() ) );

	localValues.put( "construct_type",
			 TextConverter.dbQuote( get_construct_type() ) );
	
	localValues.put( "promoter", TextConverter.dbQuote( get_promoter() ) );
	localValues.put( "reporter", TextConverter.dbQuote( get_reporter() ) );

	localValues.put( "vector_type",
			 TextConverter.dbQuote( get_vector_type() ) );

	localValues.put( "vector_id", 
			 TextConverter.dbQuote( get_vector_id() ) );

	localValues.put( "library_id", 
			 TextConverter.dbQuote( get_library_id() ) );

	localValues.put( "has_clone_end", 
			 TextConverter.dbQuote( get_has_clone_end() ) );

	localValues.put( "is_chimeric", 
			 TextConverter.dbQuote( get_is_chimeric() ) );
	
	localValues.put( "clone_chimerism_id", 
			 TextConverter.dbQuote( get_clone_chimerism_id() ) );

	localValues.put( "antibiotic_selection", 
			 TextConverter.dbQuote( get_antibiotic_selection() ) );
	
	localValues.put( "cloning_enzyme_1_id", 
			 TextConverter.dbQuote( get_cloning_enzyme_1_id() ) );

	localValues.put( "cloning_enzyme_2_id", 
			 TextConverter.dbQuote( get_cloning_enzyme_2_id() ) );

	localValues.put( "parent_clone_id", 
			 TextConverter.dbQuote( get_parent_clone_id() ) );

	localValues.put( "host_strain_id", 
			 TextConverter.dbQuote( get_host_strain_id() ) );
	
	localValues.put( "has_flank_sequence", 
			 TextConverter.dbQuote( get_has_flank_sequence() ) );
	
	localValues.put( "is_sequenced", 
			 TextConverter.dbQuote( get_is_sequenced() ) );
	
	localValues.put( "is_arrayed", 
			 TextConverter.dbQuote( get_is_arrayed() ) );
    	
	localValues.put( "date_last_modified",  
			 TextConverter.dbQuote( 
			     get_date_last_modified(), "mm/dd/yyyy" ) );

	localValues.put( "is_obsolete", 
			 TextConverter.dbQuote( get_is_obsolete() ) );
	
	localValues.put( "date_entered",
			 TextConverter.dbQuote( get_date_entered(), "mm/dd/yyyy" ) );
	
	localValues.put( "original_name",
			 TextConverter.dbQuote( get_original_name() ) );


	
	// DB structure requires a value for is_agi_clone, though field is
	// obsolete and no longer used; default all values to false -- bury
	// here rather than creating member variable (and more confusion)
	localValues.put( "is_agi_clone",
			 TextConverter.dbQuote( new Boolean( false ) ) );


	return localValues;
	
    }


    /**
     * For unit testing only
     */
    public void test() {
        super.test();
        System.out.println( "clone_id: " + get_clone_id() );
        System.out.println( "taxon_id: " + get_taxon_id() );
        System.out.println( "species_variant_id: " + 
			    get_species_variant_id() ); 
        System.out.println( "assembly_unit_id: " + 
			    get_assembly_unit_id() );
        System.out.println( "name: " + get_name() );
        System.out.println( "chromosome: " + get_chromosome() ); 
        System.out.println( "length: " + get_length() );
        System.out.println( "units: " + get_units() );
        System.out.println( "insert_type: " + get_insert_type() );
        System.out.println( "insert_size: " + get_insert_size() );
        System.out.println( "construct_type: " + get_construct_type() );
        System.out.println( "promoter: " + get_promoter() );
        System.out.println( "reporter: " + get_reporter() );
        System.out.println( "vector_type: " + get_vector_type() );
        System.out.println( "vector_id: " + get_vector_id() );
        System.out.println( "library_id: " + get_library_id() );
        System.out.println( "has_clone_end: " + get_has_clone_end() );
        System.out.println( "is_chimeric: " + get_is_chimeric() );
        System.out.println( "clone_chimerism_id: " + get_clone_chimerism_id() );
        System.out.println( "host_strain_id: " + get_host_strain_id() );

        System.out.println( "antibiotic_selection: " + 
			    get_antibiotic_selection() );

        System.out.println( "cloning_enzyme_1_id: " + 
			    get_cloning_enzyme_1_id() );

        System.out.println( "cloning_enzyme_2_id: " + 
			    get_cloning_enzyme_2_id() );

        System.out.println( "has_flank_sequence: " + get_has_flank_sequence() );
        System.out.println( "is_sequenced: " + get_is_sequenced() );
        System.out.println( "date_last_modified: " + get_date_last_modified() );
        System.out.println( "is_arrayed: " + get_is_arrayed() );
        System.out.println( "parent_clone_id: " + get_parent_clone_id() );
        System.out.println( "original_name: " + get_original_name() );
        System.out.println( "date_entered " + get_date_entered() );
        System.out.println( "is_obsolete: " + get_is_obsolete() );
    }
  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {
            DBconnection conn = new DBconnection();
            Long id = new Long( 1001639381 );
            TfcClone clone = new TfcClone( conn, id );
	    clone.test();

        } catch ( Exception e ) {
            e.printStackTrace();

        }
    }


}
