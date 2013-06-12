//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.8 $
// $Date: 2005/02/10 21:22:43 $
//------------------------------------------------------------------------------

package org.tair.search;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Debugger;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.TextConverter;

/**
 * SingleChannelSearcher retrieves single channel hyb data rows according to 
 * submitted search parameters. Search results are stored in a temp 
 * table <code>SingleChannelTableInfo</code> which is created for a 
 * particular user based on query id and search type (single_channel).
 * For temp table definition see <code>SingleChannelTableInfo</code>.
 * SingleChannelSearcher only inserts into temp table; creating, deleting
 * and dropping table is done by <code>SearchSession</code>. Selecting 
 * from temp table is done by <code>ResultsFetcher</code> via the 
 * summary jsp for search results. SingleChannelSearcher retrieves the
 * relevant table name to use by querying <code>MasterTableInfo</code>.
 */

public class SingleChannelSearcher {
  
    private String tempTblName;
    private String auxTempTblName;
    private final String searchType = "single_channel";
    private Map params;
    private DBWriteManager connectionPool;
    private String queryID;
    private String analysisLevel;
    private String detection;
    private String signal;
    private String signalPercentile;
    private StringBuffer whereBuffer;
    private StringBuffer fromBuffer;
    private boolean poundTblExists;
    private String poundTblName;
    private String nameTypeQualifier;
    private String nameType;
    private ArrayList nameListArray;

    /**
     * Creates SQL query using submitted search parameters and stores rows that
     * match criteria in temp table.  Each row in the temp table represents a 
     * unique single_channel_hyb_data row  used for display on the summary page.
     * Temp table columns represent Single_channel_hyb data attributes
     * Where compound information is required a unique id is stored to be used 
     * for lookup into 
     * the appropriate table at the time the complete row's data is requested for 
     * display via <code>ResultsFetcher</code>. 
     *
     * @param searchParams Search criteria submitted through the web search form, 
     *  stored as field name as a <code>String</code> key referencing the search 
     *  value.
     * @param queryID User's query id. Used to access temp table for user's 
     *  individual results.
     * @throws SQLException thrown if a database error occurs.
     * @throws InvalidFormException thrown if invalid or conflicting search parameters
     *  are received
     */  
    public void search( Map searchParams, boolean firstSearch )
        throws SQLException, InvalidFormException {
        setParams( searchParams );
        String queryID = (String) searchParams.get( "query_id" );
        setQueryID( queryID );
        
        if (firstSearch) {
            processSearch();
        }
    }


    /**
    * get the unique identifier query line of this earch. quick
    * search will never have multiple parameters, so instead of 
    * generating the query, we can just return an unique identifier 
    * based on the thing searched
    */
    public String generateInsertLine( DBconnection conn, Map searchParams, String type )
    throws InvalidFormException, SQLException {
        String insert_query = "";
        setParams( (HashMap) searchParams );
        if (type.equalsIgnoreCase( "form" )){
            insert_query = createSearchSQL( conn );
        }else if (type.equalsIgnoreCase( "general" )){
            String searchTerm = (String) getParams().get("searchTerm");
            insert_query = "SINGLE_CHANNEL_QUICKSEARCH_" + searchTerm.toUpperCase();
        }else{
            insert_query = createSearchSQL( conn );
        }
        return insert_query;
    }
    
    /**
     * returns the search type
     */
    private final String getSearchType() { 
        return searchType; 
    }
    
    private final String getTableColumns() {
        return 
        "id, " + 
        "map_element_id, " + 
        "array_element_id, " +
        "tair_object_id, " +
        "name, " +
        "locus, " +
        "locus_id, " +
        "rep_genemodel_id, " +
        "exp_tair_object_id, " +
        "experiment_name, " +
        "hyb_desc_id, " +
        "hyb_desc_name, " +
        "repl_detection, " +
        "repl_detection_pvalue, " +
        "repl_detection_pvalue_stderr, " +
        "repl_signal_percentile, " +
        "repl_signal, " +
        "repl_signal_percentile_stderr, " +
        "repl_signal_stderr, " +
        "query_id, " +
        "date_last_queried ";
    }
    /**
     * returns the select clause used for general and single channel search
     */
    private final String getSelectClause() { 
        String queryID = getQueryID();
        String select = 
            " SELECT DISTINCT " + 
            " hdes.hyb_desc_id AS id, " + 
            " aen.map_element_id AS map_element_id, " + 
            " aen.array_element_id AS array_element_id, " +  
            " aen.tair_object_id AS tair_object_id, " +
            " aen.display_name AS name, " +  
            " aen.locus AS locus, " + 
            " aen.locus_id AS locus_id, " + 
            " aen.rep_genemodel_id AS rep_genemodel_id, " + 
            " hdes.tair_object_id AS exp_tair_object_id, " + 
            " hdes.original_experiment_name AS experiment_name, " + 
            " hdes.hyb_desc_id AS hyb_desc_id, " + 
            " hdes.hyb_desc_name AS hyb_desc_name, " + 			
            " shd.repl_detection AS repl_detection, " + 
            " shd.repl_detection_pvalue AS repl_detection_pvalue, " +  
            " shd.repl_detection_pvalue_stderr AS" + 
            " repl_detection_pvalue_stderr, " + 
            " shd.repl_signal_percentile AS repl_signal_percentile, " + 
            " shd.repl_signal AS repl_signal, " + 
            " shd.repl_signal_percentile_stderr AS" + 
            " repl_signal_percentile_stderr, " + 
            " shd.repl_signal_stderr AS repl_signal_stderr";
        if ( queryID != null && queryID != ""){
            select = select +
            ", '" + queryID + "', CURRENT_DATE ";
        }else{
            select = select +
            ", '', '' ";
        }
        return select;
    }
    
    /**
     * sets the base from clause used for search
     */
    private void setBaseFromClause() {
        fromBuffer = new StringBuffer( " FROM SingleChannelHybData shd," + 
                                       "ArrayElementNameAlias aen ");
        fromBuffer.append( ", HybDataDescExprSet_wrk hdes ");  
    }

    /**
     * sets the base where clause used for search
     */
    private void setBaseWhereClause() {
        whereBuffer = new StringBuffer( " WHERE shd.array_element_id = " +
                                        "aen.array_element_id " );
        whereBuffer.append( " AND shd.hyb_data_id = hdes.hyb_data_id" );
    }

    // returns the customized from clause for the search
    private String getFromClause() { 
        return fromBuffer.toString(); 
    }

    // returns the customized where clause for the search
    private String getWhereClause() {
        return whereBuffer.toString();
    }

    // returns the insert clause used for search
    private final String getInsertClause() {
        return "INSERT /*+ APPEND */ INTO RESULT_SINGLE_CHANNEL "; 
    } 
    
    // returns delete clause used for search, in case there is data in result table that
    // shouldn't be there
    private final String getDelete() { 
        String del_query = 
            " DELETE FROM RESULT_SINGLE_CHANNEL WHERE QUERY_ID = '" + getQueryID() + "' ";
        return del_query;
    }

    // sets the orderBy clause used for search
    private void setOrderByClause() {
        if ( getParams().get("order") != null ) { 
            if ( ( ( String )getParams().get("order") ).
                 equalsIgnoreCase( "name" ) ) { 
            } else if ( ( ( String )getParams().get("order") ).
            		equalsIgnoreCase( "locus" ) ) { 
            } else if ( ( ( String )getParams().get("order") ).
            	equalsIgnoreCase( "experiment_name" ) ) { 
            }
        } else { 
        }
    } 

    /**
     * returns the create SQL used to create a pound table used to 
     * store the loci or element names 
     * from a textarea or a file
     */
    private final String getCreateSQL() {
        return " CREATE GLOBAL TEMPORARY TABLE " + getPoundTblName() +  
            " ( name varchar(20) ) ON COMMIT PRESERVE ROWS ";
    } 
 
    /**
     * Returns the insert clause used to populate element names or loci
     * into a pound temp table from a textarea or a file
     */
    private final String getInsertSQL() { 
        return " INSERT INTO " + getPoundTblName() +  
            " VALUES ";
    }
 
    // returns the drop SQL used to drop a pound table used to store 
    // the loci or element names 
    // from a textarea or a file
    private final String getDropSQL() { return " DROP TABLE " + 
                                            getPoundTblName(); 
    }   

    // gets a pooled connection to the database
    private DBconnection getConnection() throws SQLException {
        connectionPool = DBWriteManager.getInstance();
        return connectionPool.getSearchConnection();    
    }
    // releases a connection back to the database pool
    private void returnConnection( DBconnection conn ) throws SQLException {
        connectionPool.return_connection( conn ); 
    }

    /*
    // sets the auxillary temp table name -- temp table from another 
    // searcher to be used here
    private void setAuxTempTblName( String searchType ) { 
        if ( getQueryID() != null && searchType != null ) {   
            auxTempTblName = MasterTableInfo.getFullTableName
                ( searchType, getQueryID() );
        }
    } 

    // returns the auxillary temp table name
    private String getAuxTempTblName() {
        return auxTempTblName;
    } 
    */

    // sets the pound table name
    /*
    private void setPoundTblName() { 
        Integer id = null;
        Random generator = new Random( System.currentTimeMillis() ); 
        id = new Integer( generator.nextInt( 999 ) ); 
        poundTblName = "NL" + id.toString();
    }
    */
    // returns the pound table name
    private String getPoundTblName() { 
        return "ExpressionNames";
        //return poundTblName;
    }  

    // sets the parameters that user specified on search form 
    private void setParams( Map searchParams  ) {
        params = searchParams;
    }

    // returns the map of search params the user entered
    private Map getParams() {
        return params;
    } 

    // adds an element to the param map that is a camma delimted list of 
    // elements or loci that did not contribute to the result set 
    @SuppressWarnings("unchecked")
    private void setNTFListParam( DBconnection conn ) throws SQLException { 
        String query = null;

        // notExists query against temp table and pound table to set this
        // param - need to know name type, name or locus
        if ( getNameType() != null ) {
            if ( getNameType().equalsIgnoreCase( "element" ) ) { 

                // check for aliases also -- join to ArrayElementNameAlias 
                // to check if the name was found
                query = 
                    "SELECT pt.name AS name " +
                    "FROM " + getPoundTblName() + " pt " +
                    "WHERE NOT EXISTS (" +
                    "SELECT 'X' " +
                    "FROM RESULT_SINGLE_CHANNEL tt, ArrayElementNameAlias aen " +  
                    "WHERE tt.QUERY_ID = '" + getQueryID() + "' " + 
                    "AND tt.name = aen.display_name " +
                    "AND aen.name  = pt.name " +
                    ")" ;

            } else if ( getNameType().equalsIgnoreCase( "locus" ) ) { 
            	// straight up
                query = "SELECT pt.name AS name FROM " + 
                    getPoundTblName() + 
                    " pt WHERE NOT EXISTS ( SELECT 'X' FROM RESULT_SINGLE_CHANNEL " + 
                    " tt WHERE tt.QUERY_ID = '" + getQueryID() + "' " + 
                    " AND tt.locus  = pt.name )" ;
            } 
            Debugger.println( Debugger.logMsg( this, "ntf SQL = " + query ) ); 
            conn.setQuery( query );
            ResultSet results = conn.getResultSet();
            if ( results.next() ) { 
                getParams().put( "hasNTFs", new Boolean( true ) );
            } else { 
                getParams().put( "hasNTFs", new Boolean( false ) );
            }
        } 
    }

    // sets the query id
    private void setQueryID( String queryID ) {
        this.queryID = queryID;
    }

    // returns the query id
    private String getQueryID() {
        return queryID;
    } 

    // sets the signal qualifier
    private void setSignal( String min, String max ) {
        if ( getAnalysisLevel() != null && min != null 
             && max != null ) {
            if ( getAnalysisLevel().equalsIgnoreCase( "element" ) ) {
            	signal = " AND shd.signal BETWEEN " + min + 
                    " AND " + max;
            } else if ( getAnalysisLevel().equalsIgnoreCase( "replicate" ) ) {
            	signal = " AND shd.repl_signal BETWEEN " + min + 
                    " AND " + max;
            }
        }
    } 
 
    // returns the signal qualifier
    private String getSignal() { 
        return signal; 
    }  

    // sets the detection qualifier
    private void setDetection( String detection_value ) {
        if ( getAnalysisLevel() != null && detection_value != null ) {
            if ( getAnalysisLevel().equalsIgnoreCase( "element" ) ) {
            	detection = " AND shd.detection = " +
					TextConverter.dbQuote( detection_value );
            } else if ( getAnalysisLevel().
                        equalsIgnoreCase( "replicate" ) ) {
             	detection = " AND shd.repl_detection = " + 
                    TextConverter.dbQuote( detection_value );
            }
        }
    } 
 
    // returns the detection qualifier
    private String getDetection() {
        return detection;
    }  

    // sets the signal percentile qualifier 
    private void setPercentile( String min, String max ) {
        if ( getAnalysisLevel() != null && min != null 
             && max != null ) {
            if ( getAnalysisLevel().equalsIgnoreCase( "element" ) ) {
            	signalPercentile = " AND shd.signal_percentile BETWEEN " + min + 
                    " AND " + max;
            } else if ( getAnalysisLevel().equalsIgnoreCase( "replicate" ) ) {
            	signalPercentile = " AND shd.repl_signal_percentile BETWEEN " + min + 
                    " AND " + max;
            }
        }
    } 
 
    // returns the signal percentile qualifier
    private String getPercentile() { 
        return signalPercentile; 
    }  

    // sets the selected analysis level 
    private void setAnalysisLevel( String analysisLevel ) {
        this.analysisLevel = analysisLevel;
    } 
 
    // returns the selected analysis level
    private String getAnalysisLevel() { 
    	return analysisLevel; 
    }  
 
    /**
     * turns the search parameter entries into a sql search string that will 
     * be used for the search
     */
    private String createSearchSQL( DBconnection conn ) 
        throws InvalidFormException, SQLException { 

        setBaseFromClause();
        setBaseWhereClause();
        // append from and where clauses based on params from expression_form 
        applyExpressionValueOptions();// will provide some defaults at a minimum
        applyArrayDesignOption();
        applyNameSearch( conn );
        applyAuxillarySearch();
        setOrderByClause();
        return ( getSelectClause() + getFromClause() + getWhereClause() );
        //+ 
        //getOrderByClause() );
    }

    /**
     * convert user designated options (parameters from expression_form jsp) 
     * into additions to  the 'where' clause in the search sql
     */
    private void applyNameSearch( DBconnection conn ) 
        throws InvalidFormException, SQLException {

        // for name searching, check the radiobutton option 
        if ( getParams().get("input") != null ) { 
            // name input option equals "wild"
            String nameInput = ( String )getParams().get("input");
            if ( nameInput.equalsIgnoreCase( "wild" ) ) {
                if ( getParams().get("expression_term") != null ) { 
                    generateNameSql
                        ( ( String )getParams().get("expression_name_type"), 
                          ( String )getParams().get("expression_term") );
                }
            } else { // name input option equals "list"
                if ( ( getParams().get("names") != null ) || 
                     ( getParams().get( "file" ) != null ) ) {

                    if ( getParams().get("listNameType") != null ) {
                        // set name type qualifier - 
                    	// same for textbox and file
                        setNameTypeQualifier( ( String )getParams().
                                              get("listNameType") ); 
                        // get delimited list of names from 
                        // textarea or file
                        String delimitedNames = null;
                        // textarea contents preferred 
                        // if both supplied
                        if ( getParams().get( "names" ) != null ) { 
                            delimitedNames = (String) getParams().
                                get( "names" );
                            // else get list of names from a 
                            // file -- exception
                            // will be thrown if any errors 
                            // occur while reading file
                        } else if ( getParams().get( "file" ) != null ) {
                            delimitedNames = 
                            	readNameFile( (File) getParams().get( "file" ) );
                        }
                        // parse delimited list of names into  array list and
                        // set internal reference to name array  - exception will
                        // be thrown if invalid number of names received (i.e. too
                        // many or not enough)
                        setNameListArray( parseNameList( delimitedNames ) );
                        // create pound table to hold the list of names and insert
                        // all names received from either textbox or file.
                        insertNames( conn );
                        fromBuffer.append( "," + getPoundTblName() );
                        whereBuffer.append( " AND " + getNameTypeQualifier() );
                        whereBuffer.append( " = " + getPoundTblName() + ".name " );                       
                    }
                }
            }
        } 
    }

    /**
     * do not include thetable prefix here since this is uses to build the 
     * main query sql, which uses aen prefix and also in building the not 
     * found sql which uses the temp table prefix  
     */
    private void setNameTypeQualifier( String nameType ) { 
        if ( nameType != null ) {
            this.nameType = nameType;
            if ( nameType.equals( "element" ) ) {
                nameTypeQualifier = "aen.name";
            } else if ( nameType.equals( "locus" ) ) {
                nameTypeQualifier = "aen.locus";
            }
        }
    }

    private String getNameTypeQualifier() {
        return nameTypeQualifier;
    }

    private String getNameType() {
        return nameType;
    }

    // creates the pound table needed to hold the names from 
    // the textarea or file
    private void createPoundTbl( DBconnection conn ) throws SQLException { 
        //if ( !poundTblExists ) {
            //setPoundTblName();
            //conn.setQuery( getCreateSQL() );
            //conn.executeUpdate();
            //conn.releaseResources();
            poundTblExists = true;
        //}
    }

    /**
     * Create pound table to hold names and insert names from nameListArray
     */
    private void insertNames( DBconnection conn ) throws SQLException { 
        createPoundTbl( conn );
        // insert names
        String nameValue = null;
        for ( int i = 0; i < getNameListArray().size(); i ++ ) {
            if ( getNameListArray().get( i ) != null ) {
                nameValue = 
                    " ( " + 
                    TextConverter.dbQuote
                    ( ( String )getNameListArray().get( i ) ) + 
                    " ) ";
                conn.setQuery( getInsertSQL() + nameValue );
                System.out.println("INSERT QUERY : " + getInsertSQL() + nameValue );
                conn.executeUpdate();
                conn.releaseResources();
            }
        } 

    }

    // drops the pound table needed to hold the names from 
    // the textarea or file
    /*
    private void dropPoundTbl( DBconnection conn ) throws SQLException { 
        if ( poundTblExists ) {
            conn.setQuery( getDropSQL() );
            conn.executeUpdate();
            conn.releaseResources();
            poundTblExists = false;
        } 
    } 
    */
    /**
     * Set value of array element/locus name list 
     */
    private void setNameListArray( ArrayList nameList ) {
        this.nameListArray = nameList;
    }
 
    /**
     * Writes contents of file uploaded through expression search form and 
     * creates a single string containing all lines of file.  This string 
     * can then be used as input to the parseNameList method for parsing out 
     * element names individually.  This is done in two steps so the parsing
     * code can be written to handle input both from file as well as from 
     * textarea on web form.  Additionally, since there are multiple delimiters 
     * that are acceptable for separating element names, it's best to just join
     * all lines together here and pass string along. 
     * 
     * <p>
     * Method is offered as a static method that returns String so that it
     * can be used for validating the file upload submitted when search form
     * is being updated (without executing search) as well as by Searcher
     * when search is being performed.
     */
    public static String readNameFile( File uploadedFile ) 
        throws InvalidFormException { 
        
        String nameStr = null;

        if ( uploadedFile != null ) {
            StringBuffer nameBuffer = new StringBuffer();

            try { 
                FileReader fs = new FileReader( uploadedFile );
                BufferedReader in = new BufferedReader( fs );

                String s = null;
                while ( ( s = in.readLine() ) != null ) {
                    nameBuffer.append( s + "\n" );
                }
                in.close();
            } catch ( FileNotFoundException fnfe ) {
                throw new InvalidFormException
                    ( "Uploaded file not found error: " + 
                      uploadedFile.toString() );
            } catch ( IOException ioe ) {
                throw new InvalidFormException
                    ( "Uploaded file error: " + uploadedFile.toString() +
                      "uploadedFile.exists(): " + uploadedFile.exists() + 
                      "uploadedFile.length(): " + uploadedFile.length() );
            }
            nameStr = nameBuffer.toString();
        }
        return nameStr;
    }

    /**
     * Parses submitted string into a list of element names for searching. 
     * Submitted string is assumed to contain element names delimited by
     * whitespace, commas, tabs or hard returns ( ,\t\n).  InvalidFormException
     * will be thrown number of submitted names is greater than maximum allowed
     * (currently 10), as well as if submitted name string contains no names.
     *
     * <p>
     * This method is offered as a static method that returns the list so
     * it can be used by ExpressionSearchHandler for validating submissions
     * when updating the form view (without executing search) as well as by
     * searcher itself for parsing values and actually doing search.
     *
     * @param nameListStr String containing element names for searching 
     *  separated by valid delimites
     * @return List containing all names parsed from submitted string
     * @throws InvalidFormException if zero or more than 100 names are contained
     *  within nameListStr
     */
    public static ArrayList parseNameList( String nameListStr ) 
        throws InvalidFormException { 

        ArrayList<String> nameList = new ArrayList<String>();

        if ( nameListStr != null ) {            
            StringTokenizer st = new StringTokenizer( nameListStr, " ,\t\n" );

            int maxNum = 10;

            int numNames = st.countTokens();
            if ( numNames > maxNum ) {
                throw new InvalidFormException
                    ( "Exceeded maximum number of elements " +
                      "or loci which is set to : " + maxNum );
            }
            
            if ( numNames == 0 ) {
                throw new InvalidFormException
                    ( "No data provided in the file " );
            }
            String name = null;
            while ( st.hasMoreTokens() ) {
                name = st.nextToken().toUpperCase();
                if ( !nameList.contains( name ) ) {
                    nameList.add( name );
                }
            }
        }
        return nameList;
    }

    // returns the list of names parsed from the textarea or a file
    private ArrayList getNameListArray() { 
        return nameListArray;
    }  

    private void generateNameSql( String nameType, String term ) { 
        if ( term != null ) {
            if ( nameType.equals( "name" ) ) {
                whereBuffer.append
                    ( " AND aen.name = " );
                whereBuffer.append
                    ( TextConverter.dbQuote( term.toUpperCase() ) ); 
            } else if ( nameType.equals( "locus" ) ) {
                whereBuffer.append
                    ( " AND aen.locus = " );
                whereBuffer.append
                    ( TextConverter.dbQuote( term.toUpperCase() ) ); 
            } else if ( nameType.equals( "genbank" ) ) {
                whereBuffer.append
                    ( " AND EXISTS ( SELECT 'X' FROM ArrayElementGenBankAcc_wrk aegb" );
                whereBuffer.append
                    ( " WHERE aen.array_element_id = aegb.array_element_id " );   
                whereBuffer.append
                    ( " AND aegb.gen_bank_accession = " ); 
                whereBuffer.append
                    ( TextConverter.dbQuote( term.toUpperCase() ) ); 
                whereBuffer.append
                    ( " ) " );
            } else if ( nameType.equals( "gene" ) ) {
                whereBuffer.append
                    ( " AND EXISTS ( SELECT 'X' FROM Locus l " );
                whereBuffer.append
                    ( " , MapElement_Locus mel " );
                whereBuffer.append
                    ( " , GeneNameAlias gna " );
                whereBuffer.append
                    ( " WHERE aen.locus_id = l.locus_id " );   
                whereBuffer.append
                    ( " AND mel.locus_id = l.locus_id " );   
                whereBuffer.append
                    ( " AND gna.map_element_id = mel.map_element_id " );
                whereBuffer.append
                    ( " AND gna.name = " );
                whereBuffer.append
                    ( TextConverter.dbQuote( term.toUpperCase() ) ); 
                whereBuffer.append
                    ( " ) " );
            }
        } 
    } 

    /**
     * convert user designated options (parameters from form jsp) into 
     * additions to the 'from' and 'where' clauses in the search sql --
     * this is for a single select drop down menus
     */
    private void applyExpressionValueOptions() {
        if ( getParams().get("analysis_level") != null ) {
            setAnalysisLevel( ( String )getParams().get( "analysis_level" ) );
        }
        if ( getParams().get("detection") != null ) {
            setDetection( ( String )getParams().get( "detection" ) );
        }
        if ( getParams().get("signal_min") != null && 
             getParams().get("signal_max") != null	) {
            setSignal( ( String )getParams().get( "signal_min" ), 
                       ( String )getParams().get( "signal_max" ) );
        }
        if ( getParams().get("percentile_min") != null && 
             getParams().get("percentile_max") != null ) {
            setPercentile( ( String )getParams().
                           get( "percentile_min" ),
                           ( String )getParams().
                           get( "percentile_max") );
        }
        whereBuffer.append( getExpressionValueQualification() );            
    }

    /**
     * based on user input build the expression value qualification
     * for the where clause
     */
    private String getExpressionValueQualification() {
        StringBuffer qualBuffer = new StringBuffer(" ");
        if ( getSignal() != null ) {
            qualBuffer.append( getSignal() );
        }
        if ( getPercentile() != null ) {
            qualBuffer.append( getPercentile() );
        }
        if ( getDetection() != null ) {
            qualBuffer.append( getDetection() );
        }        
        if ( qualBuffer.equals( " " ) ) {
            // provide minimum qualification here
        }
        return ( qualBuffer.toString() );
    }

    /**
     * convert user designated options (parameters from form jsp) into 
     * additions to the 'from' and 'where' clauses in the search sql -- 
     * this is for a multi select drop down menu
     */
    private void applyArrayDesignOption() {
	String[] selected = (String[]) getParams().get( "design" );
        if ( selected != null && 
             selected.length > 0 && 
             !selected[ 0 ].equalsIgnoreCase( "any" ) ) {
	    String predicate = getMultiSelectorPredicate( selected );
	    
	    setOptionQualifier( "design" );
	    whereBuffer.append( predicate );
        }
    }

    /**
     * build the sql for the predicate part of the 'where' clause 
     * based on selected options   
     */
    private String getMultiSelectorPredicate( String[] options ) {      
        StringBuffer in_buffer = new StringBuffer(" IN (  ");
        for ( int i = 0; i < options.length; i ++ ) {
            if ( i > 0 ) {
            	in_buffer.append( " , " );
            }
            in_buffer.append(TextConverter.dbQuote( options[i] ) );
        }   
        in_buffer.append( " ) " );
        return in_buffer.toString();
    }
    
    /**
     * build the sql for the 'from' and 'where' clauses based on a 
     * particular option type   
     */
    private void setOptionQualifier( String optionType ) {
        if ( optionType.equals( "design" ) ) {
            whereBuffer.append
                ( " AND hdes.array_design_name " );                
        }
    }

    /**
     * check to see if auxillary search results need to be incorporated into
     * the search sql in this specific case - is experiment search criteria 
     * were specified then an auxSearchType parameter will have been provided --
     * the temp table can then be derived( search type + query id ) and joined 
     * to the main query 
     */
    private void applyAuxillarySearch() {
        if ( getParams().get("auxSearchType") != null ) {
            String auxQueryID = ( String )getParams().get("aux_query_id");
            whereBuffer.append
                ( " AND EXISTS ( SELECT 'X' FROM RESULT_EXPR att " );
            whereBuffer.append
                ( "WHERE att.QUERY_ID = '" + auxQueryID + "' ");
            whereBuffer.append
                ( " AND att.tair_object_id = hdes.tair_object_id ) " );                 
        }
    }

    // invokes a method to write the results of the 
    // search sql to the temp table  
    private void processSearch() throws 
	SQLException, InvalidFormException {
        DBconnection conn = null;
        try {
            conn = getConnection();
            String stmt = createSearchSQL( conn );
            writeToTempTbl( conn, stmt );
            if ( poundTblExists ) {
                setNTFListParam( conn );
                //dropPoundTbl( conn );
            }
        } finally {
            if ( conn != null ) returnConnection( conn ); 
        }  
    }

    // writes search results to temp table 
    private void writeToTempTbl( DBconnection conn, String stmt ) throws 
	SQLException {
        Debugger.println
            ( Debugger.logMsg( this, "writeToTempTbl, SQL = " + stmt ) ); 
        
        //do preliminary drops first. should never get here butjust in case
        String del_query = getDelete();
        conn.setQuery( del_query );
        conn.executeUpdate();
        conn.releaseResources();
       
        String insert_query = getInsertClause() + "( " + getTableColumns() + ") " + stmt;
        System.out.println("insert query : " + insert_query );
        conn.setQuery( insert_query );
        conn.executeUpdate();
        
        conn.releaseResources();
    }   

}
    
  
