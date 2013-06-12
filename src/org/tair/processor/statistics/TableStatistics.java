/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
*/
package org.tair.processor.statistics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;
import org.tair.utilities.TextConverter;

/**
 * Statistics for a specific database table
 */

public class TableStatistics {

    private String table_name;
    // the fields and it's statistics for this table 
    private ArrayList fields_stats ;
    // the statistics for this table
    private String  table_statistics = null ;
    // field names list for this table
    private ArrayList field_names ;

    public TableStatistics(){}
  /**
   * Creates an instance of TableSatatistics for a given table
   *
   * @param conn An active connection to the database
   * @param String table_name
   * @exception SQLException in the case of an invalid operation or database error
   */
    public TableStatistics( DBconnection conn, String table_name )  throws SQLException {
       	this.table_name = table_name;
	get_statistics( conn  );
    }

    // to init the statistics for this table. that includes the statistics for this table and the statistics for 
    // every field for this table in  TableStats 

    private void  get_statistics( DBconnection conn)  throws SQLException {
        if ( fields_stats == null){
            fields_stats = new ArrayList() ;
        }
        ArrayList fields = new ArrayList ();
        field_names = new ArrayList(); 
	String query = "select field_name , display_value, row_count from Definitions, TableStats"+
	    " WHERE Definitions.definitions_id =TableStats.definitions_id " + 
	    " and table_name="+ TextConverter.dbQuote( table_name) + " order by tablestats_date desc, display_value " ;

        conn.setQuery(query);

	ResultSet rows= conn.getResultSet( ); 
	// we only get one set of stats for each table field
        // the method used here is order by date, and only insert the first entry 
	while (rows.next()){ 
            String row_stats = rows.getString("row_count");
            // the statistics for this table
            String display_value =  rows.getString("display_value") ;
            String field_name =  rows.getString("field_name") ;
            
            if (( field_name != null &&  field_name.equalsIgnoreCase("class") )
                 ||  display_value.equalsIgnoreCase (table_name)  ){
                // only use the first row of table_statistics
                if (table_statistics == null){
                    table_statistics = row_stats ;
                } 
                continue;
            }
            
            // we only care about the non-zero stats for table's fields
            if ( row_stats == null || row_stats.equals("")  || row_stats.equals("0") ){
		continue; 
            }

            if (field_names == null ){ 
              field_names = new ArrayList(); 
            }else if (! field_names.contains ( field_name)){
                field_names .add (field_name); 
            }

	    if ( fields.contains( display_value) ) {
		continue;
	    }

            FieldStatistics fieldStats =  new  FieldStatistics( display_value, field_name, row_stats );
	    fields.add ( display_value);
            fields_stats.add (fieldStats); 
	 }
    }

    /**
     * Get the statistics of this table as a string 
     */
    public String get_table_statistics () {
        return table_statistics != null ? table_statistics:"0" ;
    }
    /**
     * Get every field  of this table and this filed's statistics as an Iterator of FieldStatistics
     * @return Iterator of <code>FieldStatistics</code>
     */
    public Iterator getFieldAndStats (){
        if ( fields_stats != null && fields_stats.size()>0 ){
	    return  fields_stats.iterator() ;
        }else { 
            return null; 
        }
    } 
    /**
     * Get every field  of this table and this filed's statistics as an Iterator of FieldStatistics
     * for a given field name
     * @return Iterator of <code>FieldStatistics</code>
     */
    public Iterator getFieldAndStats (String field_name){
        ArrayList return_fields = new ArrayList();
       
	Iterator field_statses = getFieldAndStats ();
	if (field_statses != null ){
	    while ( field_statses.hasNext() ){
		FieldStatistics  field_stats =(FieldStatistics )field_statses.next();
		if (field_stats.get_field_name().equals (field_name)){
		    return_fields.add( field_stats);
		} 
	    }// end while
	}
        
        return  (return_fields != null&& return_fields.size()>0) ? return_fields.iterator(): null;
    } 
    /**
     * Get field_names of this table  as an Iterator of String
     * @return Iterator of <code>String</code>
     */
    public Iterator getFieldNames (){
        if ( field_names != null && field_names.size()>0 ){
	    return  field_names.iterator() ;
        }else { 
            return null; 
        }
    } 

    /**
     * the count of field  names this table has 
     * @return int of field_names count
     */

    public int field_names_count (){
	return field_names.size();
    }

    /**
     * the count of individual field this table has 
     * @return int of field count
     */
    public int fileds_count (){
	return fields_stats.size();
    }
    /**
     * the count of individual field this table has for a given field name  
     * @return int of field count
     */
    public int fileds_count (String field_name){
	ArrayList return_fields = new ArrayList();
       
	Iterator field_statses = getFieldAndStats ();
	if (field_statses != null ){
	    while ( field_statses.hasNext() ){
		FieldStatistics  field_stats =(FieldStatistics )field_statses.next();
		if (field_stats.get_field_name().equals (field_name)){
		    return_fields.add( field_stats);
		} 
	    }// end while
	}
        
        return  (return_fields != null&& return_fields.size()>0) ? return_fields.size(): 0;
    }
    /**
     * name of this table
     */
    public String get_table_name(){
        return table_name ; 
    } 

}
