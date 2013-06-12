//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.4 $
// $Date: 2004/04/26 19:27:34 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.HashMap;
import java.util.TreeMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

import org.tair.tfc.DBconnection;

/**
 * Collection of references to handle specific logic for LocusDetail. 
 * The locus detail page display all publications and communication references
 * that are associated to the locus as well as to any associated gene models 
 * for the locus.  Internally, each reference is stored along with a list of 
 * which genes it is associated to; this list will be <code>null</code> if 
 * reference is associated directly to the locus. References can be retrieved 
 * through getPublications and getCommunicationReferences; the returned 
 * reference objects can then be used to retrieve the list of associated 
 * genes through the getPublicationGenes() and getCommunicationGenes() 
 * methods.
 *
 * <p>
 * Due to the large number of publications that can be associated to a locus,
 * the internal collection of publications will be limited to the maximum
 * number allowed for display on the detail page (currently 10).  The total
 * number of publications associated to the locus can be determined through
 * the getPublicationTotalCount method.  Locus detail page should link to
 * the publication search for displaying the full list of associated 
 * publications as search results.
 */


public class LocusReferenceCollection {

    // publications for gene models associated w/locus - stored
    // as PublicationObject key referencing List of gene models 
    // for that reference
    private TreeMap publications;

    // communications for gene models associated w/locus - stored
    // as CommunicationObject key referencing List of gene models 
    // for that reference
    private TreeMap communications;

    // maximum number of publications to hold in collection; this number 
    // is limited since the total number may sometimes be too many to display
    // on a detail page
    private static final int MAX_PUBLICATIONS = 10;
    
    
    // flag to record whether collection only contains abbreviated list of 
    // publications. This will only be true when locus is associated to more
    // publications than allowed by MAX_PUBLICATIONS constant
    private boolean publicationsAbbreviated = false;
    
    // total number of publications that *would* be in collection if list hadn't
    // been abbreviated by MAX_PUBLICATIONS;
    private int publicationTotalCount = 0;


    /**
     * Creates an instance of LocusReferenceCollection for locus with submitted
     * tair object id.  Publications and communications will be retrieved
     * for locus as well as for all associated gene models in the submitted
     * collection.
     *
     * <p>
     * Publications will be limited to the maximum allowed for display on
     * the locus detail page (currently 10).
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id of locus to retrieve references for
     * @param geneModels Collection of all gene models associated to locus
     * @throws SQLException if a database error occurs
     */
    public LocusReferenceCollection( DBconnection conn,
				     Long tair_object_id,
				     GeneModelCollection geneModels )
	throws SQLException {

	// create Map of all genes associated to locus for looking
	// up genes by tair object id while processing reference
	// query results
	Map geneTairObjectIDs = getGeneTairObjectIDMap( geneModels );

	// get publications first, then communications
	populatePublications( conn, tair_object_id, geneTairObjectIDs );
	
	populateCommunications( conn, tair_object_id, geneTairObjectIDs );

    }



    /**
     * Creates map that stores gene models of locus with gene's
     * tair object id as Long key referencing GeneModel object.
     * This is needed for easily looking up genes by tair object
     * ID while processing results of reference query
     *
     * @return Map containing genes associated to locus with gene's
     * tair object id as Long key referencing GeneModel object or
     * <code>null</code> if no genes in submitted collection
     */
    private Map getGeneTairObjectIDMap( GeneModelCollection geneModels ) {
	Map geneTairObjectIDs = null;

	if ( geneModels != null && !geneModels.isEmpty() ) {
	    geneTairObjectIDs = new TreeMap();


	    GeneModel gene = null;
	    Long tairObjectID = null;
	    
	    Iterator iter = geneModels.iterator();
	    while ( iter.hasNext() ) {
		gene = (GeneModel) iter.next();
		tairObjectID = gene.get_tair_object_id();
		geneTairObjectIDs.put( tairObjectID, gene );
	    }
	}

	return geneTairObjectIDs;
    }

    /**
     * Retrieves publications for locus and all associated gene models & stores
     * in a map where publication key references a list of associated gene 
     * models. This list will be null if publication associated directly to the
     * locus itself only.
     *
     * <p>
     * Since some loci may have a large number of publications associated,
     * only the maximum number of pubs allowed for display on the detail page
     * will get objects created for them. Total number of publications is
     * stored in the totalPubsCount member variable
     */
    private void populatePublications( DBconnection conn, 
				       Long tair_object_id,
				       Map geneTairObjectIDs )
	throws SQLException {

	String query = getPublicationQuery( tair_object_id,
					    geneTairObjectIDs );
	
	// Get map of reference ids referencing List of genes 
	// associated to reference. Collection will be abbreviated
	// so that maximum of 10 pub objects are actually created
	Map referenceGenes = getPublicationGenes( conn, 
						  query, 
						  geneTairObjectIDs );

	// populate publications collection with fully populated 
	// objects referencing list of associated genes
	if ( referenceGenes != null && !referenceGenes.isEmpty() ) {

	    // create publications map using comparator to sort
	    // pubs by year so that most recent pubs display first
	    this.publications = new TreeMap( new PublicationComparator() );

	    Iterator iter = referenceGenes.keySet().iterator();
	    Long referenceID = null;
	    while ( iter.hasNext() ) {
		referenceID = (Long) iter.next();
		publications.put( new PublicationObject( conn, referenceID ),
				  referenceGenes.get( referenceID ) );
	    }
	}
    }

    /**
     * Retrieves comunications for locus and all associated gene models & stores
     * in a map where communication key references a list of associated gene 
     * models. This list will be null if communication is associated directly to 
     * the locus itself only.
     */
    private void populateCommunications( DBconnection conn, 
					 Long tair_object_id,
					 Map geneTairObjectIDs )
	throws SQLException {
	
	String query = getCommunicationQuery( tair_object_id,
					      geneTairObjectIDs );
	
	// Get map of reference ids referencing List of genes 
	// associated to communication - communications should never
	// be abbreviated (no need).
	Map referenceGenes = getCommunicationGenes( conn, 
						    query, 
						    geneTairObjectIDs );
	
	// populate communications collection with fully populated 
	// objects referencing list of associated genes
	if ( referenceGenes != null && !referenceGenes.isEmpty() ) {
	    this.communications = new TreeMap();

	    Iterator iter = referenceGenes.keySet().iterator();
	    Long referenceID = null;
	    while ( iter.hasNext() ) {
		referenceID = (Long) iter.next();
		communications.put( new CommunicationObject( conn, 
							     referenceID ),
				    referenceGenes.get( referenceID ) );
	    }
	}
    }

    /**
     * Create SELECT statement that will retrieve reference ids of publications
     * associated to locus's tair object id or tair object ids of locus's 
     * associated gene models.  Result set returned by query will include
     * reference id of publication. along with tair object id of element
     * it was associated to.  Tair object ids can then be collected for each
     * publication to record that multiple genes were associated to that
     * publication.
     *
     * <p>
     * Publications will be sorted by year so that most recent publications
     * are listed first.
     *
     * @param tair_object_id Tair object id of locus 
     * @param geneTairObjectIDs Map of genes associated to locus with
     * gene's tair object id referencing GeneModel object.  
     * @return SQL statement to get reference ids for publications
     * associated to locus or any of its gene models
     */
    private String getPublicationQuery( Long tair_object_id,
					Map geneTairObjectIDs ) 
    {
	StringBuffer query = new StringBuffer();
	query.append( "SELECT p.reference_id, t.tair_object_id, p.publication_year " +
		      "FROM TairObj_Ref t, Publication p " +
		      "WHERE t.reference_id = p.reference_id " +
		      "AND t.tair_object_id IN ( " +
		      tair_object_id.toString() + " " 
		      );
	
	appendGeneTairObjectIDs( query, geneTairObjectIDs );

	query.append( " ) ORDER BY p.publication_year DESC " );

	return query.toString();
    }
    

    /**
     * Create SELECT statement that will retrieve reference ids of 
     * communications associated to locus's tair object id or tair object
     * ids of locus's associated gene models.  Result set returned by query
     * will include reference id of communication. along with tair object id 
     * of element it was associated to.  Tair object ids can then be collected
     * for each communication to record that multiple genes were associated to
     * that reference.
     *
     * @param tair_object_id Tair object id of locus 
     * @param geneTairObjectIDs Map of genes associated to locus with
     * gene's tair object id referencing GeneModel object.  
     * @return SQL statement to get reference ids for communications
     * associated to locus or any of its gene models
     */
    private String getCommunicationQuery( Long tair_object_id,
					  Map geneTairObjectIDs ) 
    {
	StringBuffer query = new StringBuffer();
	query.append( "SELECT c.reference_id, t.tair_object_id " +
		      "FROM TairObj_Ref t, Communication c " +
		      "WHERE t.reference_id = c.reference_id " +
		      "AND t.tair_object_id IN (" +
		      tair_object_id.toString() + " " 
		      );
	
	appendGeneTairObjectIDs( query, geneTairObjectIDs );

	query.append( ")" );

	return query.toString();
    }
    
    
    /**
     * Utility method to append tair object ids of locus's associated
     * gene models to submitted query. 
     *
     * @param query SQL query buffer to append ids to
     * @param geneTairObjectIDs Map of genes associated to locus with
     * each gene's tair object id stored as a Long key referencing
     * GeneModel object
     */
    private void appendGeneTairObjectIDs( StringBuffer query,
					  Map geneTairObjectIDs ) 
    {
	if ( geneTairObjectIDs != null && !geneTairObjectIDs.isEmpty() ) {
	    Long geneTairObjectID = null;
	    
	    Iterator iter = geneTairObjectIDs.keySet().iterator();
	    while ( iter.hasNext() ) {
		query.append( ", " );
		geneTairObjectID = (Long) iter.next();
		query.append( geneTairObjectID.toString() );
	    }
	}
    }
    
    /**
     * Executes submitted SQL query and retrieves reference IDs of
     * publications along with the tair object id of gene or locus 
     * publication is associated to.  Tair object ids are translated 
     * into GeneModel objects through geneTairObjectIDs map.  Returns 
     * Map of reference ids of publications with ids as Long keys 
     * referencing List of all genes associated to that publication
     * as GeneModel objects.
     *
     * <p>
     * Returned Map will be abbreviated so that it will not contain more
     * reference ids for publications than can be displayed on the locus
     * detail page (currently 10). This is done due to the large number 
     * of pubs that can be associated to a locus. If number of publications
     * retrieved exceeds this number, the abbreviatePubs flag will be set 
     * to true, and the total number of publications associated to the 
     * locus will be recorded in the locusTotalCount member variable.
     *
     * @param conn An active connection to the database
     * @param query SQL query to execute
     * @param geneTairObjectIDs Map of tair object ids of genes associated
     * to locus with id as Long key referencing GeneModel object for gene
     * with that tair object id.
     * @return Map of publications and the genes they are associated to with
     * reference id as Long key referencing List of GeneModel objects
     * @throws SQLException if a database error occurs
     */
    private Map getPublicationGenes( DBconnection conn, 
				     String query,
				     Map geneTairObjectIDs )
	throws SQLException {


	Map referenceGenes = new HashMap();

	Long referenceID = null;
	Long geneTairObjectID = null;
	List genes = null;
	GeneModel gene = null;

	// keep track of unique reference ids for recording total
	// number regardless of how many end up in referenceGenes
	// map
	List uniqueIDs = new ArrayList();

	// save each reference id in map as key referencing all genes
	// associated to that publication as a List of GeneModels.  
	conn.setQuery( query );
	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    
	    referenceID = new Long( results.getLong( "reference_id" ) );
	    
	    // get list of genes already saved for this id
	    if ( referenceGenes.containsKey( referenceID ) ) {
		genes = (List) referenceGenes.get( referenceID );
		
		// else if this is first entry for reference id 
	    } else {
		
		// save each unique id for getting accurate count
		// of distinct pubs
		if ( !uniqueIDs.contains( referenceID ) ) {
		    uniqueIDs.add( referenceID );
		}

		// set flag if we've already already retrieved maximum pubs 
		// for display, then skip to next row
		if ( uniqueIDs.size() > MAX_PUBLICATIONS ) {
		    this.publicationsAbbreviated = true;
		    continue;

		    // otherwise, create new list to hold associated 
		    // genes
		} else {
		    genes = new ArrayList();
		    referenceGenes.put( referenceID, genes );
		}
	    }
	    
	    // get gene with tair object id and store in list of
	    // genes associated to reference
	    geneTairObjectID = new Long( results.getLong( "tair_object_id" ) );
	    gene = (GeneModel) geneTairObjectIDs.get( geneTairObjectID );
	    
	    // if no gene found for tair object id, reference must be
	    // associated to locus directly 
	    if ( gene != null ) {
		genes.add( gene );
	    }
	}
        conn.releaseResources();

	// record total number of publications associated to locus/gene models
	// for future reference
	this.publicationTotalCount = uniqueIDs.size();

	return referenceGenes;
    }


    /**
     * Executes submitted SQL query and retrieves reference IDs for 
     * communications along with the tair object id of gene or locus 
     * communication is associated to.  Tair object ids are translated into
     * GeneModel objects through geneTairObjectIDs map.  Returns Map of 
     * reference ids with ids as Long keys referencing List of all genes 
     * associated to that communication as GeneModel objects.
     *
     * <p>
     * Communications collection will never be abbreviated
     *
     * @param conn An active connection to the database
     * @param query SQL query to execute
     * @param geneTairObjectIDs Map of tair object ids of genes associated
     * to locus with id as Long key referencing GeneModel object for gene
     * with that tair object id.
     * @return Map of communications and the genes they are associated to with
     * reference id as Long key referencing List of GeneModel objects
     * @throws SQLException if a database error occurs
     */
    private Map getCommunicationGenes( DBconnection conn, 
				       String query,
				       Map geneTairObjectIDs )
	throws SQLException {

	Map referenceGenes = new HashMap();

	Long referenceID = null;
	Long geneTairObjectID = null;
	List genes = null;
	GeneModel gene = null;

	// save each reference id in map as key referencing all genes
	// associated to that reference as a List of GeneModels.  
	conn.setQuery( query );
	ResultSet results = conn.getResultSet();
	while ( results.next() ) {
	    
	    referenceID = new Long( results.getLong( "reference_id" ) );
	    
	    // get list of genes already saved for this id
	    if ( referenceGenes.containsKey( referenceID ) ) {
		genes = (List) referenceGenes.get( referenceID );
		
		// else if this is first entry for reference id 
		// create new list to hold associated genes
	    } else {
		genes = new ArrayList();
		referenceGenes.put( referenceID, genes );
	    }
	    
	    // get gene with tair object id and store in list of
	    // genes associated to reference
	    geneTairObjectID = new Long( results.getLong( "tair_object_id" ) );
	    gene = (GeneModel) geneTairObjectIDs.get( geneTairObjectID );
	    
	    // if no gene found for tair object id, reference must be
	    // associated to locus directly 
	    if ( gene != null ) {
		genes.add( gene );
	    }
	}
        conn.releaseResources();

	return referenceGenes;
    }




    /**
     * Determines if collection contains any publications associated to locus
     * or its gene models
     * 
     * @return <code>true</code> if collection contains publications for locus;
     * <code>false</code> if collection contains no publications for locus
     */
    public boolean hasPublications() {
	return ( publications != null && !publications.isEmpty() );
    }

    /**
     * Returns all publications associated to either locus or its gene models.
     * List of gene models for publications can be retrieved by submitting
     * publication as an argument to the getPublicationGenes method.
     *
     * @return Publications for locus as an <code>Iterator</code> of
     * <code>PublicationObject</code> objects, or <code>null</code> if no 
     * publications for locus
     */
    public Iterator getPublications() {
	return hasPublications() ? publications.keySet().iterator() : null;
    }

    /**
     * Determines if collection contains any communications associated to locus
     * or its gene models
     * 
     * @return <code>true</code> if collection contains publications for locus;
     * <code>false</code> if collection contains no publications for locus
     */
    public boolean hasCommunicationReferences() {
	return ( communications != null && !communications.isEmpty() );
    }


    /**
     * Returns all communications associated to either locus or its gene models. 
     * List of gene models for communications can be retrieved by submitting
     * communication as an argument to the getCommunicationGenes method.
     *
     * @return Communications for locus as an <code>Iterator</code> of 
     * <code>CommunicationObject</code> objects, or <code>null</code> if no 
     * communications for locus
     */
    public Iterator getCommunicationReferences() {
	return hasCommunicationReferences() ?
	    communications.keySet().iterator() : null;
    }

    /**
     * Retrieves genes associated to submitted publication. This method may 
     * return <code>null</code> if publication is associated directly to locus,
     * and not to any associated gene models.
     *
     * @param publication Publication to retrieve associated genes for
     * @return Genes associated to submitted publication as an 
     * <code>Iterator</code> of <code>GeneModel</code> objects, or 
     * <code>null</code> if submitted publication is not contained in internal
     * collection, or if publication has no associated gene models.
     */
    public Iterator getPublicationGenes( PublicationObject publication ) {
	Iterator iter = null;

	List genes = (List) publications.get( publication );
	if ( genes != null && !genes.isEmpty() ) {
	    iter = genes.iterator();
	}

        return iter;
    }

    /**
     * Determines if submitted publication has genes associated to it. If
     * not, publication must be linked to locus directly.
     *
     * @return <code>true</code> if publication is associated to gene models;
     * <code>false</code> if publication not associated to gene models
     */
    public boolean hasPublicationGenes( PublicationObject publication ) {
	List genes = (List) publications.get( publication );
	
	return ( genes != null && !genes.isEmpty() );
    }


    /**
     * Retrieves genes associated to submitted communication reference. This
     * method may return <code>null</code> if reference is directly associated
     * to locus and not to any associated gene models
     *
     * @param communication Communication reference to retrieve associated 
     * genes for
     * @return Genes associated to submitted communication as an 
     * <code>Iterator</code> of <code>GeneModel</code> objects, or
     * <code>null</code> if submitted communication is not contained in internal
     * collection, or if communication has no associated gene models.
     */
    public Iterator getCommunicationGenes( CommunicationObject communication ) {
        Iterator iter = null;

	List genes = (List) communications.get( communication );
	if ( genes != null && !genes.isEmpty() ) {
	    iter = genes.iterator();
	}

        return iter;
    }



    /**
     * Determines if submitted communication has genes associated to it. If
     * not, communication must be linked to locus directly.
     *
     * @return <code>true</code> if communication is associated to gene models;
     * <code>false</code> if communication not associated to gene models
     */
    public boolean hasCommunicationGenes( CommunicationObject communication ) {
	List genes = (List) communications.get( communication );

	return ( genes != null && !genes.isEmpty() );
    }

    
    /**
     * Determines whether collection contains only a partial list of 
     * publications for locus.  This will be true if locus is associated to
     * more publications than allowed in the collection by MAX_PUBLICATIONS 
     * constant (currently 10). This is done since some loci have so many
     * associated publications that displaying them all is unwieldly on the
     * detail page; this method can then be used to determine whether a 
     * "show all" link should be provided
     *
     * @return <code>true</code> if collection only contains a partial list
     * of all publications for locus, or <code>false</code> if collection is 
     * a full list of all publications retrieved by population methods
     */
    public boolean publicationsAbbreviated() {
	return publicationsAbbreviated;
    }
    
    /**
     * Retrieve total number of publications associated to locus.  If collection
     * was abbreviated during population, this method can be used to to 
     * determine the total number of publications associated to the locus even
     * though publication objects were not created for all results.  This is
     * useful for showing helpful display info. when displaying an 
     * abbreviated list like "showing 10 of 43 publications".
     *
     * <p>
     * NOTE: if publicationsAbbreviated() returns <code>false</code> (i.e. 
     * collection is not an abbreviated collection), this method will return the
     * same number as if getPublicationCurrentSize() were called.
     *
     * @return Total number of publications associated to locus
     */
    public int getPublicationTotalCount() {
	return publicationTotalCount;
    }

    
    /**
     * Retrieves number of publications currently in collection. If 
     * publicationsAbbreviated() returns <code>true</code>, this value should 
     * not be used to determine how many publications are associated to locus, 
     * since it only records how many publications are actually in the 
     * collection. In this case, the total number of associated publications can
     * be determined using the getPublicationTotalCount method.
     *
     * @return Number of elements in collection
     */
    public int getPublicationCurrentSize() {
	return hasPublications() ? publications.size() : 0;
    }


    /**
     * For unit testing only
     */
    public void test() {
	System.out.println( "***** LocusReferenceCollection test ****" );
        System.out.println( "\nretrieving publications & assoc. genes..." );

	Iterator iter = null;
	if ( hasPublications() ) {
	    iter = getPublications();
            while ( iter.hasNext() ) {
                PublicationObject pub = (PublicationObject) iter.next();
                System.out.println( pub.get_title() + " assoc. to genes: " );
                Iterator subIter = getPublicationGenes( pub );
                if ( subIter != null ) {
                    while ( subIter.hasNext() ) {
                        GeneModel gene = (GeneModel) subIter.next();
                        System.out.println( gene.get_name() );
                    }
                }
            }
        }
	
        System.out.println( "\nretrieving communications & assoc. genes..." );
	if ( hasCommunicationReferences() ) {
	    iter = getCommunicationReferences();
            while ( iter.hasNext() ) {
                CommunicationObject communication = 
		    (CommunicationObject) iter.next();
		
                System.out.println( communication.get_name() +
				    " assoc. to genes: " );
		
                Iterator subIter = getCommunicationGenes( communication );
                if ( subIter != null ) {
                    while ( subIter.hasNext() ) {
                        GeneModel gene = (GeneModel) subIter.next();
                        System.out.println( gene.get_name() );
                    }
                }
            }
        }
	System.out.println( "***** LocusReferenceCollection end ****" );
    }
}
    
