//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.3 $
// $Date: 2004/11/18 20:35:44 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.HashSet;

import org.tair.tfc.DBconnection;
import org.tair.utilities.InvalidActionException;

/**
 * LoadableHybDescriptionCollection is a custom collection that stores as a 
 * collection of <code>LoadableHybDescription/code> objects.  Collection 
 * exists specifically for use in microarray data loading and curation tasks.
 */


public class LoadableHybDescriptionCollection  {   
    private ArrayList hybDescriptions ;

    // list of hyb descriptions that have been removed from collection since
    // it was created -- these are held until store() is called at which
    // point they will be deleted from the database
    private ArrayList removed;

    // expression set id for all hyb descriptions in collection
    private Long expressionSetID;

    // total number of hyb data slides contained by hyb descriptions in
    // collection
    private int hybDataCount;


    /**
     * Creates an empty instance of LoadableHybDescriptionCollection
     */
    public LoadableHybDescriptionCollection() { 
        hybDescriptions = new ArrayList();
    }

    /**
     * Creates an instance of LoadableHybDescriptionCollection that
     * represents a full collection of LoadableHybDescription objects for 
     * submitted expression_set_id
     *
     * @param conn An active connection to the database
     * @param expression_set_id Expression set id to retrieve data for
     * @throws SQLException if a database error occurs
     */
    public LoadableHybDescriptionCollection( DBconnection conn, 
					     Long expression_set_id ) 
	throws SQLException {

        hybDescriptions = new ArrayList();

	this.expressionSetID = expression_set_id;
	populate( conn );
    }

    /**
     * Retrieve associated hyb description ids & create LoadableHybDescriptions 
     * for each.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    private void populate( DBconnection conn ) throws SQLException {

        ArrayList ids = null;
        HashSet uniq_ids = new HashSet();

	String query =
	    "SELECT hyb_description_id, reverse_id "+
	    "from HybDescription "+
	    "where expression_set_id = ?";
            
	conn.setQuery( query );
          
	conn.setQueryVariable( expressionSetID );
	
	ResultSet results = conn.getResultSet();
	while( results.next() ) {
	    if ( ids == null ) {
		ids = new ArrayList();
	    }       
	    Long hyb_description_id = 
		new Long( results.getLong( "hyb_description_id" ) );

	    Long reverse_id = null;
	    if ( results.getLong("reverse_id") >0 ){
		reverse_id = new Long( results.getLong( "reverse_id" ) ); 
	    } 
	    if ( !uniq_ids.contains ( hyb_description_id ) ) {
		ids.add ( hyb_description_id );
		uniq_ids.add ( hyb_description_id);
	    }
	    if (reverse_id != null && ! uniq_ids.contains ( reverse_id) ){
		ids.add ( reverse_id );
		uniq_ids.add ( reverse_id);
	    }
               
	}
	conn.releaseResources();

	if ( ids != null && !ids.isEmpty() ) {
	    Iterator iter = ids.iterator();
	    while ( iter.hasNext() ) {
		add( new LoadableHybDescription( conn, (Long) iter.next() ) );
	    }
	}
	
	// get count of associated hyb data elements
	countHybData( conn );
    }
    
    /**
     * Determine total number of hyb data entries associated to expression set
     * counting entries for each associated hyb description.
     */
    private void countHybData( DBconnection conn )
        throws SQLException {

	LoadableHybDescription hybDescription = null;
	
	Iterator iter = iterator();
	while ( iter.hasNext() ) {
	    hybDescription = (LoadableHybDescription) iter.next();
	    this.hybDataCount += hybDescription.getNumberHybData();
	}
    }
    

    /**
     * Retrieves total number of hyb data entries associated to hyb descriptions
     * associated to expression set.
     *
     * @return Total number of hyb data entries associated to hyb descriptions 
     * that are associated to expression set
     */
    public int getNumberHybData() {
        return hybDataCount;
    }


    /**
     * Determines if array design info. of hybridizations in collection is 
     * common, and can therefore just be displayed once for all hybridizations,
     * rather than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in this collection have
     * the same array design id (even if that id is <code>null</code>), or
     * <code>false</code> if hybDescriptions do not share the same array design
     * id
     */
    public boolean hasCommonArrayDesign() {
        Iterator iter = null;
        Long firstID = null;
        Long currentID = null;
        LoadableHybDescription hybDescription = null;
        boolean hasCommon = true;
        boolean first = true;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() && 
		    (hasCommon = longValuesEqual( firstID, currentID )) ) {

                hybDescription = (LoadableHybDescription) iter.next();
                currentID = hybDescription.get_array_design_id();
                if ( first ) {
                    firstID = currentID;
                    first = false;
                } 
            }
        }
        return hasCommon;
    }

  
    /**
     * Determines if protocol info. of hybridizations in collection is common, 
     * and can therefore just be displayed once for all hybridizations, rather
     * than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in this collection have 
     * the same protocol reference id (even if that id is <code>null</code>), or 
     * <code>false</code> if hybDescriptions do not share the same protocol 
     * reference id
     */
    public boolean hasCommonProtocol() {
        Iterator iter = null;
        Long firstID = null;
        Long currentID = null;
        LoadableHybDescription hybDescription = null;
        boolean hasCommon = true;
        boolean first = true;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() && 
		    (hasCommon = longValuesEqual( firstID, currentID )) ) {

                hybDescription = (LoadableHybDescription) iter.next();
                currentID = hybDescription.get_hyb_protocol_ref_id();
                if ( first ) {
                    firstID = currentID;
                    first = false;
                } 
            }
        }
        return hasCommon;
    }


    /**
     * Determines if scanning software of hybridizations in collection is 
     * common, and can therefore just be displayed once for all hybridizations, 
     * rather than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in this collection have
     * the same scanning software id (even if that id is <code>null</code>), 
     * or <code>false</code> if hybDescriptions do not share the same scannning 
     * software id
     */
    public boolean hasCommonScanningSoftware() {
        Iterator iter = null;
        Long firstID = null;
        Long currentID = null;
        LoadableHybDescription hybDescription = null;
        boolean hasCommon = true;
        boolean first = true;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() &&
		    (hasCommon = longValuesEqual( firstID, currentID )) ) {

                hybDescription = (LoadableHybDescription) iter.next();
                currentID = hybDescription.get_scanning_software_id();
                if ( first ) {
                    firstID = currentID;
                    first = false;
                } 
            }
        }
        return hasCommon;
    }



    /**
     * Determines if scanning hardware of hybridizations in collection is 
     * common, and can therefore just be displayed once for all hybridizations, 
     * rather than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in this collection have
     * the same scanning hardware description, or <code>false</code> if 
     * hybDescriptions do not share the same scannning hardware description
     */
    public boolean hasCommonScanningHardware() {
        Iterator iter = null;
        String firstValue = null;
        String currentValue = null;
        LoadableHybDescription hybDescription = null;
        boolean hasCommon = true;
        boolean first = true;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() && 
		    (hasCommon = stringValuesEqual( firstValue, 
						    currentValue )) ) {
		
                hybDescription = (LoadableHybDescription) iter.next();
                currentValue = hybDescription.get_scanner();
                if ( first ) {
                    firstValue = currentValue;
                    first = false;
                } 
            }
        }
        return hasCommon;
    }
  

    /**
     * Determines if normalizing description of hybridizations in collection is 
     * common, and can therefore just be displayed once for all hybridizations, 
     * rather than repeating the same information for each one.
     *
     * @return <code>true</code> if all hybDescriptions in this collection have
     * the same normalizing description, or <code>false</code> if  
     * hybDescriptions do not share the same normalizing function
     */
    public boolean hasCommonNormalizationDesc() {
        Iterator iter = null;
        String firstValue = null;
        String currentValue = null;
        LoadableHybDescription hybDescription = null;
        boolean hasCommon = true;
        boolean first = true;

        if ( !isEmpty() ) {
            iter = iterator();
            while ( iter.hasNext() && 
		    (hasCommon = stringValuesEqual( firstValue, 
						    currentValue )) ) {

                hybDescription = (LoadableHybDescription) iter.next();
                currentValue = hybDescription.get_normalization_desc();
                if ( first ) {
                    firstValue = currentValue;
                    first = false;
                } 
            }
        }
        return hasCommon;
    }


    /**
     * Utility method to determine if two Long values are equal - return true 
     * even if that means both are null
     */
    private boolean longValuesEqual( Long firstValue, Long currentValue ) {
        boolean valuesEqual = false;
    
        if ( firstValue == null && currentValue == null ) {
            valuesEqual = true;
        } else if ( firstValue != null && firstValue.equals( currentValue ) ) {
            valuesEqual = true;
        }
        return valuesEqual;
    }
  
    /**
     * Utility method to determine if two String values are equal - return true 
     ** even if that means both are null
     */
    private boolean stringValuesEqual( String firstValue, 
				       String currentValue ) 
    {
        boolean stringsEqual = false;
    
        if ( firstValue == null && currentValue == null ) {
            stringsEqual = true;
        } else if ( firstValue != null && firstValue.equals( currentValue ) ) {
            stringsEqual = true;
        }
        return stringsEqual;
    }


    /**
     * Determines if collection has elements in it 
     *
     * @return <code>true</code> if collection has no elements in it, or 
     * <code>false</code> if collection has at least one element in it
     */
    public boolean isEmpty() { 
	return hybDescriptions.isEmpty();
    }

    /**
     * Determines number of elements in collection
     *
     * @return Number of elements in collection
     */
    public int size() { 
	return hybDescriptions.size();
    }

    
    /**
     * Retrieves all elements in collection
     *
     * @return Elements in collection as an <code>Iterator</code> of 
     * <code>LoadableHybDescription</code> objects, or <code>null</code> if no 
     * elements in collection
     */
    public Iterator iterator() { 
	return hybDescriptions.iterator();
    }


    /**
     * Adds supplied element to collection
     * 
     * @param hybDescription Element to add to collection
     */
    public void add( LoadableHybDescription hybDescription ) { 
	hybDescriptions.add( hybDescription ); 
    }
  
    /**
     * Removes supplied element from collection. This will delete the 
     * hyb description next time store is called.
     *
     * @param hybDescription HybDescription to remove from collection
     */
    public void remove( LoadableHybDescription hybDescription ) { 
	// If hyb description has a hyb description id, add to list of 
	// items to be deleted next time store is called.  If
	// id is null, no further action is necessary.
	if ( hybDescription.get_hyb_description_id() != null ) {
	    if ( removed == null ) {
		removed = new ArrayList();
	    }
	    removed.add( hybDescription );
	}
	hybDescriptions.remove( hybDescription ); 
    }

    /**
     * Determines if supplied element is in collection
     *
     * @return <code>true</code> if supplied element is in collection; 
     * <code>false</code>if element is not found
     */
    public boolean contains( LoadableHybDescription hybDescription ) { 
	return hybDescriptions.contains( hybDescription ); 
    }
  
    /**
     * Retrieves element at submitted index
     *
     * @param index Index of item to retrieve
     * @return Element at submitted index, or <code>null</code>
     * if no element at requested index
     */
    public LoadableHybDescription get( int index ) {
        return (LoadableHybDescription) hybDescriptions.get( index );
    }    

    /**
     * Retrieves hyb description with submitted name
     *
     * @return Hyb description with submitted name
     */
    public LoadableHybDescription get( String name ) {
	LoadableHybDescription hybDescription = null;
	
	if ( !isEmpty() ) {
	    LoadableHybDescription tmpHybDescr = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		tmpHybDescr = (LoadableHybDescription) iter.next();
		if ( name.equalsIgnoreCase( tmpHybDescr.get_name() ) ) {
		    hybDescription = tmpHybDescr;
		    break;
		}
	    }
	}
	return hybDescription;
    }
   

    /**
     * Determines index of submitted object
     *
     * @param hybDescription LoadableHybDescription of index to retrieve
     * @return index of LoadableHybDescription within Collection
     */
    public int indexOf( LoadableHybDescription hybDescription ) {
        return ( hybDescriptions.indexOf( hybDescription ) );
    }    

    /**
     * Sets expression set id for all hyb descriptions in collection. This is 
     * used when creating new hyb descriptions for a new expression set.
     *
     * @param expressionSetID Expression set id to set for all hyb descriptions
     * in collection
     */
    public void setExpressionSetID( Long expressionSetID ) {
	this.expressionSetID = expressionSetID;

	if ( !isEmpty() ) {
	    LoadableHybDescription hybDescription = null;
	    for ( Iterator iter = iterator(); iter.hasNext(); ) {
		hybDescription = (LoadableHybDescription) iter.next();
		hybDescription.set_expression_set_id( expressionSetID );
	    }
	}
    }


    /**
     * Stores collection of hyb descriptions for an expression set to the 
     * database. Any pre-existing hyb descriptions will be UPDATEd, any new hyb
     * descriptions will be inserted. Any hyb descriptions that were removed 
     * from collection since it was created will now be DELETEd.
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs

     * @throws InvalidActionException if required info has not been
     * set for any hyb descriptions in collection.
     */
    public void store( DBconnection conn ) 
	throws SQLException, InvalidActionException {

	Iterator iter = null;
	LoadableHybDescription hybDescription = null;

	// first delete any items removed since collection was created
	if ( removed != null ) {
	    for ( iter = removed.iterator(); iter.hasNext(); ) {
		hybDescription = (LoadableHybDescription) iter.next();
		hybDescription.delete( conn );
	    }
	}

	// now store all items in collection -- need to first store 
	// all hyb description items, then go through again and update
	// newly created items to resolve controller/reverse dependencies.
	// This is required to make sure that all FK dependencies between
	// hyb descriptions in collection can be resolved
	for ( iter = iterator(); iter.hasNext(); ) {
	    hybDescription = (LoadableHybDescription) iter.next();
	    hybDescription.store( conn );
	}

	// resolve controller/reverse dependencies
	for ( iter = iterator(); iter.hasNext(); ) {
	    hybDescription = (LoadableHybDescription) iter.next();
	    if ( hybDescription.getControllerName() != null ||
		 hybDescription.getReverseName() != null ) {
		
		// resolve names by looking up items within collection
		resolveControllerReverse( hybDescription );
		
		// store only dependencies
		hybDescription.storeControllerReverse( conn );
	    }
	}
    }
    

    /**
     * Resolves controller/reverse dependencies for submitted hyb description
     * by looking up controller/reverse names within collection and setting
     * hyb description ids for submitted object to handle foreign key 
     * relationships.  This lookup can only be done after all new items
     * in collection have been stored to the database (and have had new
     * primary keys set
     *
     * @param hybDesc hyb description to resolve dependencies for
     */
    private void resolveControllerReverse( LoadableHybDescription hybDesc ) {
	
	String controllerName = hybDesc.getControllerName();
	if ( controllerName != null ) {
	    LoadableHybDescription controller = get( controllerName );
            if ( controller ==  null ){
                System.out.println( "No HybDescription for this name " +controllerName );
            }
	    hybDesc.set_controller_id( controller.get_hyb_description_id() );
	}

	String reverseName = hybDesc.getReverseName();
	if ( reverseName != null ) {
	    LoadableHybDescription reverse = get( reverseName );
	    hybDesc.set_reverse_id( reverse.get_hyb_description_id() );
	}
    }

	
    

    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "** LoadableHybDescriptionCollection test **" );
        if ( hybDescriptions != null && !hybDescriptions.isEmpty() ) {
            Iterator iter = iterator();
            while ( iter.hasNext() ) {
                LoadableHybDescription hybDescription = 
		    (LoadableHybDescription) iter.next();
                hybDescription.test();
            }
        }
          System.out.println( "size: " + size() );
        System.out.println( "hyb data count: " + getNumberHybData() );
        System.out.println( "** LoadableHybDescriptionCollection test end **" );
    }
  
    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 88 );

            LoadableHybDescriptionCollection descriptions = 
		new LoadableHybDescriptionCollection( conn, id );
            descriptions.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }
    }

}
