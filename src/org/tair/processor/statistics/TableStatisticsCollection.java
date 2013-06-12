/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
*/
package org.tair.processor.statistics;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;

/**
 * Statistics for all the requireds database tables
 */

public class TableStatisticsCollection {
    private ArrayList tables_statistics ;
    private String date_last_run;
    private ArrayList table_names;    
  
 /**
   * Creates an empty instance of TableStatisticsCollection
   */

    public  TableStatisticsCollection(){}
   /**
   * Creates an instance of TableStatisticsCollection that contains statistics for required tables
   *
   * @param conn An active connection to the database
   * @exception SQLException in the case of an invalid operation or database error
   */ 

    public  TableStatisticsCollection( DBconnection conn ) throws SQLException{
	set_table_names ();
        if (tables_statistics == null){
            tables_statistics = new ArrayList ();
        }
        for ( int i=0; i< table_names.size(); i++){
            String table_name = (String)(table_names.get(i));
            TableStatistics table_stats = new TableStatistics ( conn, table_name);
            tables_statistics. add (table_stats);     
        }
        set_date_last_run (conn);
    }

    public String get_date_last_run (){
        return date_last_run;
    }
    /**
     * get table_statistics as an Iterartor of TableStatistics
     * @return TableStatistics in collection as an <code>Iterator</code> of <code>TableStatistics</code>
     */
    public  Iterator get_tables_statistics (){
        if ( tables_statistics != null && tables_statistics.size()>0){
            return tables_statistics.iterator();
        }else {
            return null;
        }
    }

    // last date run of data base table TableStats
    private void set_date_last_run(DBconnection conn ) throws SQLException {
        if (date_last_run == null) { date_last_run = ""; }
	conn.setQuery("select EXTRACT(YEAR FROM tablestats_date), EXTRACT(MONTH FROM tablestats_date),"+
		      " EXTRACT(DAY FROM tablestats_date) from TableStats order by tablestats_date desc") ;

	ResultSet dates = conn.getResultSet( );

	while (dates.next()){  
	    if (!date_last_run.equals("")){ continue; }
	    date_last_run = dates.getString(1)+"-"+dates.getString(2)+"-"+dates.getString(3);
	}

    } 
    /**
     * The list of table names decided by tair curator
     */ 
    private void set_table_names (){
        if (table_names == null){ table_names = new ArrayList() ; }
	table_names.add("AASequence");
	table_names.add("Affiliation");
	table_names.add("Alias");
	table_names.add("AssemblyUnit");
	table_names.add("Assignment"); 
	table_names.add("Attribution");
 
	table_names.add("Clone");
	table_names.add("CloneEnd");
	table_names.add("Communication");
	table_names.add("Contig");
	table_names.add("DatabaseReference");
        table_names.add("DualChannelHybData");
        table_names.add("ExpressionSet");
	table_names.add("FeatureAssignment"); 
	table_names.add("FlankingSequence");
        table_names.add("Gene");
	table_names.add("GeneAlias"); 
	table_names.add("GeneticMarker");
	table_names.add("Germplasm");
        table_names.add("HybData"); 
	table_names.add("Hybridization");
       	table_names.add("Image");
	table_names.add("Keyword");
	table_names.add("Library");
	table_names.add("Locus");
	table_names.add("Map");
	table_names.add("NucleotideSequence");
	table_names.add("Orders");
	table_names.add("Organization");
	table_names.add("PcrProduct");
	table_names.add("Person");
	table_names.add("Polymorphism");
	table_names.add("ProteinDomain");
	table_names.add("PubSource");
	table_names.add("Publication");  
        table_names.add("Reference_Community");
	table_names.add("Repeat");
	table_names.add("RestrictionEnzyme");
	table_names.add("SpeciesVariant");
	table_names.add("Stock");
	table_names.add("TairObjKeyEvidence");
	table_names.add("Taxon");
	table_names.add("Vector");
       
    }
}
