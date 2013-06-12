//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.11 $
// $Date: 2005/10/11 23:18:17 $
//-----------------------------------------------------------------------------

package org.tair.tfc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;


/**
 * This class maps to the ArrayElement table. Each instance represents
 * one row of data; each member variable maps to a column of a row in the table.
 */

public class TfcArrayElement {   

    private Long array_element_id;
    private String name;
    private String table_name;
    private Long table_id;
    private Float avg_log_ratio;
    private Float std_error;
    private Float avg_intensity;
    private Float avg_intensity_std_err;
    private Float avg_signal_percentile;
    private Float avg_signal_percentile_std_err;
    private Long map_element_id;
    private Long tair_object_id;
    private Boolean is_control ;
    private String external_id;
    private String manufacturer;

    /**
     * Creates an empty instance of TfcArrayElement
     */
    public TfcArrayElement() {  }

    /**
     * Creates an instance of TfcArrayElement that reflects the data referenced 
     * by submitted array_element_id
     *
     * @param conn An active connection to the database
     * @param array_element_id Array element id to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException thrown if a database error occurs
     */
    public  TfcArrayElement( DBconnection conn, Long array_element_id ) 
        throws RecordNotFoundException, SQLException {

        String query = 
            getBaseQuery() + 
            "WHERE array_element_id = " + array_element_id.toString();
        
        boolean found = processResults( conn, query );

        if ( !found ) {
            throw new RecordNotFoundException( "No array element found for " +
                                               "array_element_id: " 
                                               + array_element_id );
        }
    }
  
  
    /**
     * Retrieve data from result set and store in member variables
     */
    private boolean processResults( DBconnection conn, String query ) 
	throws SQLException {

        conn.setQuery( query );
        ResultSet results = conn.getResultSet();

        boolean found = results.next();

        if ( found ) {
            set_array_element_id( 
		new Long( results.getLong( "array_element_id" ) ) );

            set_name( results.getString( "name" ) );
            set_table_name( results.getString( "table_name" ) );
            set_table_id( new Long( results.getLong( "table_id" ) ) );

            set_map_element_id( 
		new Long( results.getLong( "map_element_id" ) ) );

            set_tair_object_id( 
		new Long( results.getLong( "tair_object_id" ) ) );

            set_is_control( 
               TextConverter.stringToBoolean( 
                results.getString( "is_control" ) ) );

            float f = results.getFloat( "avg_log_ratio" );
            if ( !results.wasNull() ) {
                set_avg_log_ratio( new Float( f ) );
            }

            f = results.getFloat( "std_error" );
            if ( !results.wasNull() ) {
                set_std_error( new Float( f ) );
            }

            f = results.getFloat( "avg_intensity" );
            if ( !results.wasNull() ) {
                set_avg_intensity( new Float( f ) );
            } 

            f = results.getFloat( "avg_intensity_std_error" );
            if ( !results.wasNull() ) {
                set_avg_intensity_std_err( new Float( f ) );
            }
            
            f = results.getFloat( "avg_signal_percentile" );
            if ( !results.wasNull() ) {
                set_avg_signal_percentile( new Float( f ) );
            } 

            f = results.getFloat( "avg_signal_percentile_std_err" );
            if ( !results.wasNull() ) {
                set_avg_signal_percentile_std_err( new Float( f ) );
            }
      
	    set_manufacturer( results.getString( "manufacturer" ) );
	    set_external_id( results.getString( "external_id" ) );

        }
        conn.releaseResources();
    
        return found;
    }

    /**
     * Return basic select statement to populate object
     */
    private String getBaseQuery() {
        StringBuffer query = new StringBuffer();

        query.append( "SELECT array_element_id, " +
                      "name, " +
                      "table_name, " +
                      "table_id, " +
                      "is_control, " +
                      "avg_log_ratio, " +
                      "std_error, " +
                      "avg_intensity, " +
                      "avg_intensity_std_error, " +
                      "avg_signal_percentile, " +
                      "avg_signal_percentile_std_err, " +
                      "map_element_id, " +
                      "tair_object_id, " +
                      "manufacturer, " +
                      "external_id " +
                      "FROM ArrayElement " );

        return query.toString();
    } 


    public void set_array_element_id( Long id ) { 
        this.array_element_id = id;
    }

    public Long get_array_element_id() {
        return array_element_id;
    }

    public void set_name( String name ) { 
        this.name = name; 
    }

    public String get_name() {
        return name;  
    }

    public void set_table_name( String name ) {
        this.table_name = name;
    }

    public String get_table_name() {
        return table_name;
    }

    public void set_table_id( Long id ) {
        this.table_id = id;
    }

    public Long get_table_id() {
        return table_id;
    }

    public void set_is_control( Boolean is_control ) {
        this.is_control = is_control; 
    }

    public Boolean get_is_control() { 
        return is_control; 
    }

    public void set_avg_log_ratio( Float ratio ) {
        this.avg_log_ratio = ratio;
    }

    public Float get_avg_log_ratio() {
        return avg_log_ratio;
    }

    public void set_std_error( Float std_error ) {
        this.std_error = std_error;
    }

    public Float get_std_error() {
        return std_error;
    }

    public void set_avg_intensity( Float avg_intensity ) {
        this.avg_intensity = avg_intensity;
    }

    public Float get_avg_intensity() {
        return avg_intensity;
    }    

    public void set_avg_intensity_std_err( Float avg_intensity_std_err ) {
        this.avg_intensity_std_err = avg_intensity_std_err;
    }

    public Float get_avg_intensity_std_err() {
        return avg_intensity_std_err;
    }
    
    public void set_avg_signal_percentile( Float avg_signal_percentile ) {
        this.avg_signal_percentile = avg_signal_percentile;
    }

    public Float get_avg_signal_percentile() {
        return avg_signal_percentile;
    }    

    public void set_avg_signal_percentile_std_err
    	( Float avg_signal_percentile_std_err ) {
        this.avg_signal_percentile_std_err = avg_signal_percentile_std_err;
    }

    public Float get_avg_signal_percentile_std_err() {
        return avg_signal_percentile_std_err;
    }

    public void set_map_element_id( Long id ) {
        this.map_element_id = id;
    }

    public Long get_map_element_id() {
        return map_element_id;
    }

    public void set_tair_object_id( Long id ) {
        this.tair_object_id = id;
    }

    public Long get_tair_object_id() {
        return tair_object_id;
    }

    public void set_manufacturer( String manufacturer ) {
	this.manufacturer = manufacturer;
    }

    public String get_manufacturer() {
	return manufacturer;
    }

    public void set_external_id( String external_id ) {
	this.external_id = external_id;
    }

    public String get_external_id() {
	return external_id;
    }
    


    /**
     * Retrieves arrayelement id for submitted arrayelement name
     *
     * @param conn An active connection to the database
     * @param name ArrayElement name to retrieve id for
     * @return Arrayelement id for submitted name
     * @throws SQLException if a database error occurs
     */
    public static Long retrieveArrayElementID( DBconnection conn, String name )
        throws SQLException {

        Long id = null;

        String query = 
            "SELECT array_element_id " +
            "FROM ArrayElement " +
            "WHERE name = " +
	    TextConverter.dbQuote( name );
    
        conn.setQuery( query );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            id = new Long( results.getLong( "array_element_id" ) );
        }
        conn.releaseResources();

        return id;
    }
     

    /**
     * Convenience method to determine if array element is an AFGC element. This
     * will be true if array element's manufacturer is "AFGC".
     *
     * @return <code>true</code> if array element manufacturer is AFGC, 
     * <code>false</code> if manufacturer is not AFGC
     */
    public boolean isAfgcElement() {
	return ( get_manufacturer() != null && get_manufacturer().equals( "AFGC" ) );
    }
                            
    /**
     * Determines if element has data in expression viewer. This is determined
     * by checking for element's array_element_id in DualChannelHybData table where
     * ch1_signal and ch2_signal both >= 350. Logic supplied by Nick at Carnegie.
     */
    public static boolean hasViewerData( DBconnection conn, 
					 Long array_element_id )
        throws SQLException{
	
        boolean hasViewerData = false ;
        String query =
            "SELECT count(*) as data_count " +
            "FROM DualChannelHybData " +
            "WHERE ch1_signal >= 350 " +
            "AND ch2_signal >= 350 " +
            "AND array_element_id = " + array_element_id ;

        conn.setQuery( query );
        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            int count = results.getInt( "data_count" );
            if ( count > 0 ) {
                hasViewerData = true;
            }
        }
        conn.releaseResources();
        return hasViewerData;
    }

    /** to determine the array desing platform type for an array element.
     * @param conn An active connection to the database
     * @param array_element_id ArrayElement id to retrieve platform type for
     * @return String either as "single" or "dual" as arraydesing platform type
     * @throws SQLException if a database error occurs   
     */
    public static String arrayDesignPlatformType( DBconnection conn, Long  array_element_id )
    throws SQLException{

        String arrayDesignPlatform = null;
        String platformReturn = "single";
        String query = "select DISTINCT platform_type " +
            "FROM ArrayDesign, Spot  " +
            "WHERE ArrayDesign.array_design_id = Spot.array_design_id " +
            "AND Spot.array_element_id = " + array_element_id.toString() ;
        
        conn.setQuery( query ); 
        ResultSet results = conn.getResultSet();
        while ( results.next() ) {
            arrayDesignPlatform = results.getString( "platform_type") ;
            if(arrayDesignPlatform.equalsIgnoreCase ("spotted")){ 
                platformReturn = "dual";
            }else {
                platformReturn = "single";
            }
        }
        conn.releaseResources();
        return platformReturn;
    }
    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "****** TfcArrayElement content test ******" );
        System.out.println( "array element id: " + get_array_element_id() );
        System.out.println( "name: " + get_name() );
        System.out.println( "table_name: " + get_table_name() );
        System.out.println( "table_id: " + get_table_id() );
        System.out.println( "avg log ratio: " + get_avg_log_ratio() );
        System.out.println( "std error: " + get_std_error() );
        System.out.println( "map element id: " + get_map_element_id() );
        System.out.println( "tair object id: " + get_tair_object_id() );
	System.out.println( "avg_intensity: " + get_avg_intensity() );
	System.out.println( "avg_intensity_std_err: " + 
			    get_avg_intensity_std_err() );
	System.out.println( "avg_signal_percentile: " + get_avg_signal_percentile() );
	System.out.println( "avg_signal_percentile_std_err: " + 
			    get_avg_signal_percentile_std_err() );

	System.out.println( "is_control: " + get_is_control() );
	System.out.println( "external_id: " + get_external_id() );
	System.out.println( "manufacturer: " + get_manufacturer() );
        System.out.println( "**** TfcArrayElement content test end ****" );
        
    }

    /**
     * For unit testing only
     */
    public static void main( String[] args ) {

        try{
            DBconnection conn = new DBconnection();
            Long id = new Long( 53 );
            TfcArrayElement element = new TfcArrayElement( conn, id );
            element.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }  
}
