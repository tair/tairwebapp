//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.3 $
// $Date: 2005/05/03 21:35:17 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.excel;

import jxl.Sheet;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

import org.tair.bs.community.BsUrl;
import org.tair.bs.community.CommunityDelegateFactory;
import org.tair.bs.community.UrlDelegate;
import org.tair.processor.microarray.data.factory.AnalysisSoftwareFactory;
import org.tair.processor.microarray.data.factory.KeywordFactory;
import org.tair.processor.microarray.data.factory.ArrayDesignFactory;
import org.tair.processor.microarray.data.factory.MasterFactory;
import org.tair.processor.microarray.data.factory.ProtocolFactory;
import org.tair.processor.microarray.data.LoadableHybDescription;
import org.tair.processor.microarray.data.LoadableProtocol;
import org.tair.processor.microarray.data.LoadableReferenceKeyword; 
import org.tair.querytools.ReferenceURL;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAnalysisSoftware;
import org.tair.tfc.TfcArrayDesign;
import org.tair.utilities.TextConverter;

/**
 * ReplicateSetSheet is a concrete implementation of DataSheet that is used
 * to parse and validate data from the "ReplicateSets" sheet of the microarray
 * data loading Excel sheet.  ReplicateSetSheet parses data entered in this
 * sheet, transforms values from sheet into database objects, and populates
 * an instance of LoadableExpressionSet with data.
 */


public class ReplicateSetSheet extends DataSheet {

    // columns in ReplicateSet sheet
    private final int EXPRESSIONSET_EXTERNAL_ID = 0;
    private final int NAME = 1;
    private final int IS_MULTICHANNEL = 2;
    private final int IS_REVERSE_DYE = 3;
    private final int REVERSE_ID = 4;
    private final int CONTROLLER_ID = 5;
    private final int SCANNING_SOFTWARE_NAME = 6;
    private final int SCANNING_SOFWARE_VERSION = 7;
    private final int SCANNER = 8;
    private final int NORMALIZATION_DESCRIPTION = 9;
    private final int ARRAY_DESIGN_NAME = 10;
    private final int NUM_SLIDES = 11;

    // hybridization protocol
    private final int HYBRIDIZATION_PROTOCOL_NAME = 12;
    private final int HYBRIDIZATION_PROTOCOL_PUB_MED_ID = 13;
    private final int HYBRIDIZATION_PROTOCOL_DESCRIPTION = 14;
    private final int HYBRIDIZATION_PROTOCOL_AUTHORS = 15;
    private final int HYBRIDIZATION_PROTOCOL_URL = 16;

    /**
     * Creates an instance of ReplicateSetSheet that can be used to parse
     * the "ReplicateSets" data sheet of microarray Excel file.  
     *
     * @param sheetName Literal name of ReplicateSet sheet as it appears in 
     * Excel data file. This name is used to retrieve Sheet object that 
     * contains all data as it appears in Excel file.
     */
    public ReplicateSetSheet( String sheetName ) {
	super( sheetName );
    }



    /**
     * Parses ReplicateSet data sheet from Excel file and populates expression
     * set object with data from sheet.  As data is parsed, it is validated 
     * and transformed into database objects that can be used to store 
     * newly created expression set to the database.
     *
     * <p>
     * References to member variables in super class (such as Sheet and
     * expression set) must have already been set before this method is
     * called.
     *
     * @param conn An active connection to the database for translating
     * submitted sheet values to database values
     * @throws SQLException if a database error occurs
     */
    public void parseSheet( DBconnection conn ) throws SQLException{
	
	// Create data cell objects for retrieving data for this
	// sheet and doing basic validation for each cell.
	ExcelDataCell[] dataCells = createDataCells();
	
	// data retrieved for current row with field name referencing
	// submitted value
	Map rowData = null;

	// create hyb description object for each row of data in excel sheet
	LoadableHybDescription hybDescription = null;
	
	// ignore first row (index 0) - column headers
	for ( int i = 1; i < sheet.getRows(); i++ ) {
	    
	    // Set current row of data in superclass
	    setCurrentRow( i );

	    // retrieve and validate current row of data using
	    // validation method defined in superclas
	    rowData = validateDataCells( dataCells );

	    hybDescription = new LoadableHybDescription();
	    populateHybDescription( rowData, hybDescription );
	    populateAnalysisSoftware( conn, rowData, hybDescription );
	    populateArrayDesign( conn, rowData, hybDescription );
	    populateHybridizationProtocol( conn, rowData, hybDescription );

	    expressionSet.addHybDescription( hybDescription );

	    // add row this hyb description was submitted on for
	    // displaying data in order it was received
	    rowTracker.setReplicateSetRow( i, hybDescription.get_name() );

	}
    }

    /**
     * Creates list of data cell objects used for retrieving and
     * validating data from Replicate Sets Excel data sheet.  Each
     * cell object is populated with its field name, the column index
     * it exists at in the datasheet, and whether it is a required
     * field or not
     *
     * @return Array of ExcelDataCell objects that can be used to retrieve
     * and validate data from Replicate Sets data sheet
     */
    private ExcelDataCell[] createDataCells() {
	ExcelDataCell[] cells = new ExcelDataCell[ 17 ];	

	// not used currently
	cells[ 0 ] = new ExcelDataCell( "external id", 
					EXPRESSIONSET_EXTERNAL_ID, 
					true );

	cells[ 1 ] = new ExcelDataCell( "replicate set name", NAME, true );

	cells[ 2 ] = new BooleanDataCell( "is multichannel", 
					  IS_MULTICHANNEL, 
					  true );

	cells[ 3 ] = new BooleanDataCell( "is reverse dye", 
					  IS_REVERSE_DYE, 
					  false );

	cells[ 4 ] = new ExcelDataCell( "reverse id", REVERSE_ID, false );
	cells[ 5 ] = new ExcelDataCell( "controller", CONTROLLER_ID, false );

	cells[ 6 ] = new ExcelDataCell( "scanning software name", 
					SCANNING_SOFTWARE_NAME, 
					false );

	cells[ 7 ] = new ExcelDataCell( "scanning software version",
					SCANNING_SOFWARE_VERSION, 
					false );

	cells[ 8 ] = new ExcelDataCell( "scanner", SCANNER, false );

	cells[ 9 ] = new ExcelDataCell( "normalization description", 
					NORMALIZATION_DESCRIPTION, 
					false );

	cells[ 10 ] = new ExcelDataCell( "array design name", 
					 ARRAY_DESIGN_NAME, 
					 true );

	cells[ 11 ] = new IntegerDataCell( "number slides", NUM_SLIDES, false );

	cells[ 12 ] = new ExcelDataCell( "hybridization protocol name", 
					 HYBRIDIZATION_PROTOCOL_NAME,
					 false );

	cells[ 13 ] = new IntegerDataCell( "hybridization protocol pub med id", 
					   HYBRIDIZATION_PROTOCOL_PUB_MED_ID, 
					   false );

	cells[ 14 ] = new ExcelDataCell( "hybridization protocol description", 
					 HYBRIDIZATION_PROTOCOL_DESCRIPTION, 
					 false );

	cells[ 15 ] = new ExcelDataCell( "hybridization protocol authors", 
					 HYBRIDIZATION_PROTOCOL_AUTHORS, 
					 false );

	cells[ 16 ] = new ExcelDataCell( "hybridization protocol url", 
					 HYBRIDIZATION_PROTOCOL_URL, 
					 false );

	return cells;
    }


    /**
     * Populates hyb description (replicate set) set object with hyb description 
     * specific data from one row of replicate set data sheet
     *
     * @param rowData Map of column data for single row of Excel file
     * @param hybDescription Hyb description object to populate with contents of
     * rowData
     */
    private void populateHybDescription( Map rowData, 
					 LoadableHybDescription hybDescr )
    {
	
	hybDescr.set_name( (String) rowData.get( "replicate set name" ) );

	Boolean isMultiChannel = (Boolean) rowData.get( "is multichannel" );
	hybDescr.set_is_multichannel( isMultiChannel ); 


	Boolean isReverse = (Boolean) rowData.get( "is reverse dye" );
	hybDescr.set_is_reverse_dye( isReverse );

	// reverse id must be submitted if is reverse dye is true
	if ( isReverse != null && isReverse.booleanValue() ) {
	    String id = (String) rowData.get( "reverse id" );

	    if ( id == null ) {
		addError( "reverse id", 
			  "Reverse id must be provided if " +
			  "is reverse dye is true" );
	    } else {
		hybDescr.setReverseName( id );
	    }
	}
	
	hybDescr.setControllerName( (String) rowData.get( "controller" ) );
	hybDescr.set_scanner( (String) rowData.get( "scanner" ) );
	
	String descr = (String) rowData.get( "normalization description" );
	hybDescr.set_normalization_desc( descr ); 
	
	Integer numHybData = (Integer) rowData.get( "number slides" );
	if ( numHybData != null ) {
	    hybDescr.setDataSheetNumberHybData( numHybData.intValue() );
	}
    }


    /**
     * Populates scanning software data for hyb descripion using data
     * from submitted row of Excel sheet. Created object will reference an
     * existing row in the database if scanning software record was found
     * in database; if not, primary key of software object will be null 
     * and object will be populated with data from submitted row of
     * Excel sheet.  New AnalysisSoftware row will be inserted when store
     * is called on HybDescription object.
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @param hybDescription Hyb description object to populate with scanning
     * software data
     * @throws SQLException if a database error occurs
     */
    private void populateAnalysisSoftware( DBconnection conn,
					   Map rowData,
					   LoadableHybDescription hybDescription )
	throws SQLException {

	String name = (String) rowData.get( "scanning software name" );
	String version = (String) rowData.get( "scanning software version" );

	// need name as bare minimum to continue
	if ( name != null ) {
	    // get factory for creating analysis software objects from 
	    // masterFactory in super class
	    AnalysisSoftwareFactory softwareFactory = 
		masterFactory.getAnalysisSoftwareFactory();
	    
	    // lookup name/version combo. to see if row already exists -- 
	    // factory will return an object populated with db data or
	    // with software data from a previous row of excel sheet
	    TfcAnalysisSoftware software = 
		softwareFactory.getAnalysisSoftware( conn, name, version );
	    
	    // if not found, populate instance with submitted values --
	    // new record will be created when data is stored to db
	    if ( software == null ) {
		software = new TfcAnalysisSoftware();
		software.set_program_name( name );
		software.set_version( version );
		
		// default software function to "scanning" for new records 
		// per Marga
		software.set_sw_function( "scanning" );
		
		// add warning message to flag that new entry will be added
		// when storing data to db
		String message = name + " not found.  WILL BE ADDED";
		addWarning( "scanning software name", message );
		
		// add new software object to factory's cache for
		// reuse in all hyb descriptions that use new record
		softwareFactory.addNewAnalysisSoftware( software );
	    }

	    // set software data for hyb description
	    hybDescription.setScanningSoftware( software );
	}
    }


    /**
     * Translates array design name from submitted row of data into
     * a TfcArrayDesign object to join new HybDescription row to. If
     * no row found for array design name, an error message will be
     * added to hyb description for display.
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @param hybDescription Hyb description object to populate with scanning
     * software data
     * @throws SQLException if a database error occurs
     */
    private void populateArrayDesign( DBconnection conn,
				      Map rowData,
				      LoadableHybDescription hybDescription )
	throws SQLException {
	
	String name = (String) rowData.get( "array design name" );
	
	// get factory for creating array design objects from 
	// masterFactory in super class
	ArrayDesignFactory arrayDesignFactory = 
	    masterFactory.getArrayDesignFactory();

	TfcArrayDesign arrayDesign = 
	    arrayDesignFactory.getArrayDesign( conn, name );

	// if found, set reference in hyb description object
	if ( arrayDesign != null ) {
	    hybDescription.setArrayDesign( arrayDesign );

	    // else record error
	} else {
	    String errorMessage =  "Array design " + name + " not found";
	    addError( "array design name", errorMessage );
	}
    }

    /**
     * Populates hybridization protocol data for hyb description using
     * data from submitted row of Excel sheet. Created object will 
     * reference an existing row in the database if protocol name was
     * found in database; if not, primary key of object will be null 
     * and object will be populated with data from submitted row of
     * Excel sheet.  New protocol row will be inserted when store is 
     * called on HybDescription object.
     *
     * @param conn An active connection to the database
     * @param rowData Map of column data for single row of Excel file
     * @param hybDescription Hyb description object to populate with
     * hybridization protocol data
     * @throws SQLException if a database error occurs
     */
    private void 
	populateHybridizationProtocol( DBconnection conn,
				       Map rowData,
				       LoadableHybDescription hybDescription )
	throws SQLException {

	String name = (String) rowData.get( "hybridization protocol name" );
	Integer pubMedID = 
	    (Integer) rowData.get( "hybridization protocol pub med id" );

	String descr = 
	    (String) rowData.get( "hybridization protocol description" );

	String authors = 
	    (String) rowData.get( "hybridization protocol authors" );

	String url = (String) rowData.get( "hybridization protocol url" );


	if ( name != null ) {
	    if (descr == null){ descr=""; } 
	    // get factory for creating protocol objects from 
	    // masterFactory in super class
	    ProtocolFactory protocolFactory =
		masterFactory.getProtocolFactory();
	    
	    // get populated protocol object for submitted name -- factory will
	    // return an object populated with db data or with protocol data from
	    // a previous row of excel sheet
	    LoadableProtocol protocol = 
		protocolFactory.getProtocol( conn, name, descr );
	    
	    // if not found, populate instance with submitted values --
	    // new record will be created when data is stored to db
	    if ( protocol == null ) {
		protocol = new LoadableProtocol();
		protocol.set_title( name );
		protocol.set_description( descr );
		protocol.set_authors( authors );
		protocol.set_pubmed_id( pubMedID );

		// set status to active for all new protocols - per Marga
		protocol.set_status( "active" );
		
		// add warning message to flag that new entry will be added
		// when storing data to db
		String message = name + " not found.  WILL BE ADDED";
		addWarning( "hybridization protocol name", message );
		
                populateProtocolKeywords(conn,"hybridization protocol", protocol);
		// add new protocol object to factory's cache for
		// reuse in all hyb descriptions that use new record
		protocolFactory.addNewProtocol( protocol );
	    }
	    
	    // set URL for new and existing records if submitted
	    if ( !TextConverter.isEmpty( url ) ) {
		ReferenceURL refUrl = new ReferenceURL();
		// Query the BsUrl for the url.
		UrlDelegate delegate = CommunityDelegateFactory.getUrlDelegate();
		BsUrl urlObject = delegate.getUrlByUrl(url);
		if (urlObject == null) {
		  Timestamp dateLastVerified = new Timestamp(System.currentTimeMillis());
	      // Create URL using null to generate id.
          urlObject = delegate.createUrl(null, url, name, dateLastVerified);
		}
		refUrl.setUrl( urlObject );
		protocol.addURL( refUrl );
	    }

	    // set hybridization protocol data for hyb description
	    hybDescription.setProtocol( protocol );
	}
    }

    // populate keywords associated to protocol
    // for  hybridization protocol, the keyword are always "microarray" and "RNA hybridization"
     private void  populateProtocolKeywords( DBconnection conn,
                                            String protocol_type, 
                                            LoadableProtocol protocol )
      throws SQLException {
        // get factory for creating keyword objects from 
	// masterFactory in super class
     
	KeywordFactory keywordFactory = masterFactory.getKeywordFactory();
        List keywords =  new ArrayList();
        keywords.add ("microarray");
        keywords.add ("RNA hybridization");
    
        for (int i = 0; i <keywords.size(); i++ ){  
	    String this_keyword = (String)keywords.get(i); 
            LoadableReferenceKeyword keyword = keywordFactory.getReferenceKeyword( conn, this_keyword, "meth" );
	    if ( keyword != null ) {
                protocol.addKeyword( keyword );
        	// log error if not found
	    } else {
		String errorMessage = "keyword not found or multiple keywords found: " + this_keyword ;
		addError( "protocol", errorMessage );
	    }
	}
     }
}
