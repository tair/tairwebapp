//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:27:45 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.excel;

import java.util.HashMap;
import java.util.Map;


/**
 * ExcelRowTracker is used to record data objects and the row they were 
 * submitted in on various Excel data sheets used to populate expression set
 * object.  ExcelRowTracker does this by recording an identifying name for
 * each data object created for each row in each data sheet. Individual
 * data sheets will determine what is the best way to identify a row of data
 * in each sheet.
 *
 * <p>
 * This tracking is necessary for enabling the display of parsing results
 * back to curator in the order data was submitted.  Parsing each sheet 
 * results in transformation of row data into the expression set data object
 * model, which does not easily allow us to display data back to the user.
 * Curator will want to see results presented back as close to the order
 * data was submitted in for validating the results of parsing.
 *
 * <p>
 * Data object tracking here also facilitates the logging mechanism used
 * for recording error and warning messages encountered for each row (as
 * recorded by ExcelLogger), logger also records data using row number
 * of each data sheet.  Used in combination, row tracker and logger allow
 * results page to display parsing results and error messages in the order
 * data was submitted in Excel sheet.
 */


public class ExcelRowTracker {

    //
    // Experiment sheet doesn't need row tracking since only one
    // row of data should be submitted (at least in current version)
    //

    // replicate sets (hyb descriptions) data rows - stored with row
    // number as Integer referencing hyb description name as String
    private Map replicateSetRows;

    // environmental conditions data rows - stored with row number as
    // Integer referencing a two element String array containing environmental
    // condition name and bio sample name (in that order). This compound
    // value is helpful since environmental conditions are stored within
    // bio samples; including bio sample name simplifies getting condition
    // from expression set
    private Map envCondRows;

    // hyb data slide rows - stored with row number as Integer 
    // referencing a two element String array containing hyb data slide
    // name and hyb description name (in that order). This compound
    // value is helpful since hyb data objects are stored within hyb
    // descriptions; including hyb description name simplifies getting 
    // slide from expression set
    private Map slideRows;

    // germplasm data rows - stored with row number as Integer 
    // referencing a two element String array containing germplasm name
    // and bio sample name (in that order). This compound value is helpful
    // since germplasm data is stored within bio sample; including bio 
    // sample name simplifies getting germplasm from expression set
    private Map germplasmRows;

    // bio sample data rows - stored with row number as Integer 
    // referencing a two element String array containing bio sample
    // name and labeled sample name (in that order). This compound
    // value is necessary since each row in samples sheet ultimately
    // becomes two distinct data objects (LoadableBioSample for bio
    // sample data and LoadableLabeledSample for bio sample in its
    // relation to a hyb description
    private Map sampleRows;


    /**
     * Creates an instance of ExcelRowTracker and initializes all rows
     * collections for data sheets
     */
    public ExcelRowTracker() {
	replicateSetRows = new HashMap();
	envCondRows = new HashMap();
	slideRows = new HashMap();
	germplasmRows = new HashMap();
	sampleRows = new HashMap();
    }


    /**
     * Adds name of replicate set stored on submitted row of replicate
     * sets sheet
     *
     * @param row Row of data in ReplicateSets data sheet name was submitted on.
     * @param name Name submitted for row
     */
    public void setReplicateSetRow( int row, String name ) {
	// transform row into Integer object for use as key in Map
	Integer rowObj = new Integer( row );

	replicateSetRows.put( rowObj, name );
    }


    /**
     * Retrieves name of replicate set submitted for requested row of replicate
     * sets sheet
     *
     * @param row Row of data to retrieve replicate set name for
     * @return name Name submitted for row, or <code>null</code> if no data
     * set for requested row
     */
    public String getReplicateSetRow( int row ) {
	// transform row into Integer object for use as key in Map
	Integer rowObj = new Integer( row );

	String name = (String) replicateSetRows.get( rowObj );

	return name;
    }
    
    /**
     * Retrieves total number of replicate set rows recorded by row tracker.
     *
     * @return Number of rows recorded for replicate set sheet by row tracker.
     */
    public int getNumberReplicateSetRows() {
	return replicateSetRows.size();
    }

    /**
     * Adds name of environmental condition stored on submitted row of 
     * environmental conditions sheet along with name of bio sample condition
     * was used in
     *
     * @param row Row of data in EnvConds data sheet name was submitted on.
     * @param conditionName Condition name submitted for row
     * @param bioSampleName Bio sample name submitted for row
     */
    public void setEnvCondRow( int row, 
			       String conditionName, 
			       String bioSampleName ) 
    {

	// transform row into Integer object for use as key in Map
	Integer rowObj = new Integer( row );

	// create String array to hold two data elements
	String[] rowData = new String[]{ conditionName, bioSampleName };

	envCondRows.put( rowObj, rowData );
    }


    /**
     * Retrieves name of environmental condition submitted for requested row 
     * of environmental conditions sheet
     *
     * @param row Row of data to retrieve environmental condition name for
     * @return Environmental condition name submitted for row, or 
     * <code>null</code> if no data set for requested row
     */
    public String getEnvCondRow( int row ) {
	// transform row into Integer object for use as key in Map
	Integer rowObj = new Integer( row );

	// condition name stored as first element of String
	// array held as env. condition row data
	String[] rowData = (String[]) envCondRows.get( rowObj );
	String name = rowData[ 0 ];

	return name;
    }
    
    /**
     * Retrieves name of bio sample name submitted for environmental 
     * condition on requested row of environmental conditions sheet
     *
     * @param row Row of data to retrieve environmental condition name for
     * @return Bio sample name submitted for row, or <code>null</code> if no
     * data set for requested row
     */
    public String getBioSampleEnvCondRow( int row ) {
	// transform row into Integer object for use as key in Map
	Integer rowObj = new Integer( row );

	// bio sample name stored as second element of String
	// array held as env. condition row data
	String[] rowData = (String[]) envCondRows.get( rowObj );
	String name = rowData[ 1 ];

	return name;
    }
    

    /**
     * Retrieves total number of environmental condition rows recorded by row
     * tracker.
     *
     * @return Number of rows recorded for environmental condition sheet by 
     * row tracker.
     */
    public int getNumberEnvCondRows() {
	return envCondRows.size();
    }


    /**
     * Adds name of hyb data slide stored on submitted row of hyb 
     * data slides sheet along with name of replicate set (hyb description)
     * hyb data slide was added to
     *
     * @param row Row of data in Slides data sheet name was submitted on.
     * @param slideName Name of slide submitted for row
     * @param setName Name of replicate set submitted for row
     */
    public void setSlideRow( int row, String slideName, String setName ) {
	// transform row into Integer object for use as key in Map
	Integer rowObj = new Integer( row );

	// create String array to hold two data elements
	String[] rowData = new String[]{ slideName, setName };

	slideRows.put( rowObj, rowData );
    }


    /**
     * Retrieves name of hyb data slide submitted for requested row of
     * hyb data slides sheet
     *
     * @param row Row of data to retrieve hyb data slide name for
     * @return name Slide name submitted for row, or <code>null</code> if
     * no data set for requested row
     */
    public String getSlideRow( int row ) {
	// transform row into Integer object for use as key in Map
	Integer rowObj = new Integer( row );

	// slide name stored as first element of String
	// array held as slides row data
	String[] rowData = (String[]) slideRows.get( rowObj );
	String name = rowData[ 0 ];

	return name;
    }


    /**
     * Retrieves name of replicate set (hyb description) submitted for a 
     * data slide in requested row of hyb data slides sheet.
     *
     * @param row Row of data to retrieve hyb data slide name for
     * @return name Replicate set name submitted for row, or <code>null</code>
     * if no data set for requested row
     */
    public String getReplicateSetSlideRow( int row ) {
	// transform row into Integer object for use as key in Map
	Integer rowObj = new Integer( row );

	// set name stored as second element of String
	// array held as slides row data
	String[] rowData = (String[]) slideRows.get( rowObj );
	String name = rowData[ 1 ];

	return name;
    }
    

    /**
     * Retrieves total number of hyb data slide rows recorded by row
     * tracker.
     *
     * @return Number of rows recorded for hyb data slide sheet by 
     * row tracker.
     */
    public int getNumberSlideRows() {
	return slideRows.size();
    }


    /**
     * Adds name of germplasm stored on submitted row of germplasm sheet along
     * with name of bio sample germplasm used in.
     *
     * @param row Row of data in Germplasm data sheet name was submitted on.
     * @param germplasmName Germplasm name submitted for row
     * @param bioSampleName Bio sample name submitted for row
     */
    public void setGermplasmRow( int row, 
				 String germplasmName, 
				 String bioSampleName ) 
    {
	// transform row into Integer object for use as key in Map
	Integer rowObj = new Integer( row );

	// create String array to hold two data elements
	String[] rowData = new String[]{ germplasmName, bioSampleName };

	germplasmRows.put( rowObj, rowData );

    }

    /**
     * Retrieves name of germplasm submitted for requested row of
     * germplasms sheet
     *
     * @param row Row of data to retrieve germplasm name for
     * @return Germplasm name submitted for row, or <code>null</code> if no data
     * set for requested row
     */
    public String getGermplasmRow( int row ) {
	// transform row into Integer object for use as key in Map
	Integer rowObj = new Integer( row );

	// germplasm name stored as first element of String
	// array held as germplasm row data
	String[] rowData = (String[]) germplasmRows.get( rowObj );
	String name = rowData[ 0 ];

	return name;
    }
    
    /**
     * Retrieves name of bio sample submitted for requested row of
     * germplasms sheet
     *
     * @param row Row of data to retrieve germplasm name for
     * @return Germplasm name submitted for row, or <code>null</code> if no data
     * set for requested row
     */
    public String getBioSampleGermplasmRow( int row ) {
	// transform row into Integer object for use as key in Map
	Integer rowObj = new Integer( row );

	// bio sample name stored as second element of String
	// array held as germplasm row data
	String[] rowData = (String[]) germplasmRows.get( rowObj );
	String name = rowData[ 1 ];

	return name;
    }


    /**
     * Retrieves total number of germplasm rows recorded by row
     * tracker.
     *
     * @return Number of rows recorded for germplasm sheet by 
     * row tracker.
     */
    public int getNumberGermplasmRows() {
	return germplasmRows.size();
    }

    /**
     * Adds bio sample name and labeled sample name for submitted row
     * of samples sheet
     *
     * @param row Row of data in Samples data sheet sample names were 
     * submitted on.
     * @param bioSampleName Bio sample name submitted for row
     * @param labeledSampleName Labeled sample name submitted for row
     */
    public void setSampleRow( int row, 
			      String bioSampleName, 
			      String labeledSampleName ) 
    {
	// transform row into Integer object for use as key in Map
	Integer rowObj = new Integer( row );

	// create String array to hold two data elements
	String[] rowData = new String[]{ bioSampleName, labeledSampleName };

	sampleRows.put( rowObj, rowData );
    }


    /**
     * Retrieves name of bio sample submitted for requested row of
     * samples sheet
     *
     * @param row Row of data to retrieve bio sample name for
     * @return name Name of bio sample submitted for row, or <code>null</code>
     * if no data set for requested row
     */
    public String getBioSampleRow( int row ) {
	// transform row into Integer object for use as key in Map
	Integer rowObj = new Integer( row );

	// bio sample name stored as first element of String
	// array held as samples row data

	String[] rowData = (String[]) sampleRows.get( rowObj );
	String name = rowData[ 0 ];
	
	return name;
    }
    
    /**
     * Retrieves name of labeled sample submitted for requested row of
     * samples sheet
     *
     * @param row Row of data to retrieve labeled sample name for
     * @return name Name of labeled sample submitted for row, or 
     * <code>null</code> if no data set for requested row
     */
    public String getLabeledSampleRow( int row ) {
	// transform row into Integer object for use as key in Map
	Integer rowObj = new Integer( row );

	// labeled sample name stored as second element of String
	// array held as samples row data

	String[] rowData = (String[]) sampleRows.get( rowObj );
	String name = rowData[ 1 ];
	
	return name;
    }


    /**
     * Retrieves total number of sample rows recorded by row
     * tracker.
     *
     * @return Number of rows recorded for samples sheet by 
     * row tracker.
     */
    public int getNumberSampleRows() {
	return sampleRows.size();
    }



}
