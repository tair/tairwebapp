//------------------------------------------------------------------------------
//Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.5 $
// $Date: 2006/03/02 19:54:28 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Arrays;

import org.tair.querytools.BioSamEnvConObject;
import org.tair.querytools.BioSamEnvConObjectCollection;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAnnotationType;
import org.tair.tfc.TfcBioSample;
import org.tair.tfc.TfcGermplasm;
import org.tair.tfc.TfcRelationshipType;
import org.tair.tfc.TfcTaxon;
import org.tair.utilities.InvalidActionException;

/**
 * LoadableBioSample is a composite class that extends <code>TfcBioSample</code>
 * to present detailed information about a biosample. This class is created
 * specifically for handling bio sample data during microarray data loading and
 * curation.
 */

public class LoadableBioSample extends TfcBioSample {

    private LoadableProtocol protocol;

    private TfcTaxon taxon;

    // germplasm used for bio sample
    private LoadableGermplasm germplasm;

    // associated environmental condition data - stored as BioSamEnvConObject
    // objects
    private BioSamEnvConObjectCollection envConds;

    // structure keywords for bio sample
    private LoadableBioSampleKeywordCollection structureKeywords;

    // developmental stage keywords for bio sample
    private LoadableBioSampleKeywordCollection developmentalStages;

    /**
     * Creates an empty instance of LoadableBioSample
     */
    public LoadableBioSample() {
        super();
    }

    /**
     * Creates an instance of LoadableBioSample to reflect data referenced by
     * submitted bio_sample id.
     * 
     * @param conn
     *            An active connection to the database
     * @param bio_sample_id
     *            BioSample id to retrieve data for
     * @throws SQLException
     *             if a database error occurs
     */
    public LoadableBioSample( DBconnection conn, Long bio_sample_id ) 
        throws SQLException {

        super( conn, bio_sample_id );

        envConds = new BioSamEnvConObjectCollection( conn, bio_sample_id );

        if ( get_taxon_id() != null ) {
            taxon = new TfcTaxon( conn, get_taxon_id() );
        }

        if ( super.get_germplasm_id() != null ) {
            Long tairObjID = 
                TfcGermplasm.retrieveTairObjectID( conn, get_germplasm_id() );

            germplasm = new LoadableGermplasm( conn, tairObjID );
        }

        if ( get_extraction_protocol_ref_id() != null ) {
            protocol = 
                new LoadableProtocol( conn, get_extraction_protocol_ref_id() );
        }

        populateKeywords( conn );
    }

    /**
     * Gateway method to populate keyword collections for existing bio sample.
     * Each collection must be created with a specific relationship type and
     * keyword type that defines the set keywords in collection
     * 
     * @param conn
     *            An active connection to the database
     * @throws SQLException
     *             if a database error occurs
     */
    private void populateKeywords( DBconnection conn ) throws SQLException {

        // create relationship type object to get id literals needed
        // for creating keyword collections
        TfcRelationshipType relType = getBioSampleRelType( conn );
        Long relTypeID = relType.get_relationship_type_id();
        String[] types = { "stru", "grow", "user" };
        List possibleKeywordTypes = Arrays.asList( types );
        structureKeywords = new LoadableBioSampleKeywordCollection( conn,
                                                                    get_bio_sample_id(),
                                                                    relTypeID,
                                                                    possibleKeywordTypes );

        developmentalStages = new LoadableBioSampleKeywordCollection( conn,
                                                                      get_bio_sample_id(),
                                                                      relTypeID,
                                                                      possibleKeywordTypes );
    }

    //
    // LoadableProtocol wrappers
    //
    public String get_protocol_title() {
        return hasExtractionProtocol() ? protocol.get_title() : null;
    }

    public Integer get_protocol_pubmed_id() {
        return hasExtractionProtocol() ? protocol.get_pubmed_id() : null;
    }

    public String get_protocol_description() {
        return hasExtractionProtocol() ? protocol.get_description() : null;
    }

    public String get_protocol_authors() {
        return hasExtractionProtocol() ? protocol.get_authors() : null;
    }

    public String get_protocol_usage() {
        return hasExtractionProtocol() ? protocol.get_usage() : null;
    }

    public String get_protocol_methods() {
        return hasExtractionProtocol() ? protocol.get_methods() : null;
    }

    public String get_protocol_status() {
        return hasExtractionProtocol() ? protocol.get_status() : null;
    }

    /**
     * Determines if biosample has associated extraction protocol data
     * 
     * @return <code>true</code> if bio sample has protocol data,
     *         <code>false</code> if no protocol data for bio sample
     */
    public boolean hasExtractionProtocol() {
        return ( protocol != null );
    }

    /**
     * Sets extraction protocol for this object. When loading from external data
     * file, this object is assembled externally and then set with bio sample.
     * 
     * @param protocol
     *            Extraction protocol for biosample
     */
    public void setExtractionProtocol( LoadableProtocol protocol ) {
        this.protocol = protocol;

        // set foreign key in superclass -- new protocols will have id set
        // after protocol has been stored to db
        super.set_extraction_protocol_ref_id( protocol.get_reference_id() );
    }

    /**
     * Retrieves URLs for extraction protocol associated to bio sample
     * 
     * @return URLs for protocol for bio sample as an <code>Iterator</code> of
     *         <code>ReferenceURL</code> objects or <code>null</code> if no
     *         URLs for protocol
     */
    public Iterator getExtractionProtocolURLs() {
        return hasExtractionProtocol() ? protocol.getURLs() : null;
    }

    //
    // TfcTaxon wrappers
    //
    public String get_taxon_original_name() {
        return hasTaxon() ? taxon.get_original_name() : null;
    }

    public String get_genus() {
        return hasTaxon() ? taxon.get_genus() : null;
    }

    public String get_species() {
        return hasTaxon() ? taxon.get_species() : null;
    }

    public String get_division_code() {
        return hasTaxon() ? taxon.get_division_code() : null;
    }

    public String get_scientific_name() {
        return hasTaxon() ? taxon.get_scientific_name() : null;
    }

    public String get_common_name() {
        return hasTaxon() ? taxon.get_common_name() : null;
    }

    public String get_taxonomy() {
        return hasTaxon() ? taxon.get_taxonomy() : null;
    }

    public String get_genbank_taxonomy_id() {
        return hasTaxon() ? taxon.get_genbank_taxonomy_id() : null;
    }

    /**
     * Determines if bio sample has associated taxon data
     * 
     * @return <code>true</code> if bio sample has taxon data,
     *         <code>false</code> if no taxon data for bio sample
     */
    public boolean hasTaxon() {
        return ( taxon != null );
    }

    /**
     * Sets taxon object. When loading from external data file, this object & is
     * assembled externally and then set with bio sample.
     * 
     * @param taxon
     *            Taxon for biosample
     */
    public void setTaxon( TfcTaxon taxon ) {
        this.taxon = taxon;

        // set foreign key in superclass
        super.set_taxon_id( taxon.get_taxon_id() );
    }

    //
    // Germplasm wrappers
    //
    public Long get_germplasm_tair_object_id() {
        return hasGermplasm() ? germplasm.get_tair_object_id() : null;
    }

    public String get_germplasm_original_name() {
        return hasGermplasm() ? germplasm.get_original_name() : null;
    }

    public Long get_germplasm_species_variant_id() {
        return hasGermplasm() ? germplasm.get_species_variant_id() : null;
    }

    public String get_germplasm_name() {
        return hasGermplasm() ? germplasm.get_name() : null;
    }

    public String get_germplasm_type() {
        return hasGermplasm() ? germplasm.get_germplasm_type() : null;
    }

    public Boolean get_foreign_dna() {
        return hasGermplasm() ? germplasm.get_has_foreign_dna() : null;
    }

    public Boolean get_is_mutant() {
        return hasGermplasm() ? germplasm.get_is_mutant() : null;
    }

    public Boolean get_has_polymorphisms() {
        return hasGermplasm() ? germplasm.get_has_polymorphisms() : null;
    }

    public Boolean get_is_natural_variant() {
        return hasGermplasm() ? germplasm.get_is_natural_variant() : null;
    }

    public Boolean get_is_mapping_strain() {
        return hasGermplasm() ? germplasm.get_is_mapping_strain() : null;
    }

    public String get_special_growth_conditions() {
        return hasGermplasm() ? germplasm.get_special_growth_conditions()
                             : null;
    }

    public String get_ploidy() {
        return hasGermplasm() ? germplasm.get_ploidy() : null;
    }

    public String get_mutagen() {
        return hasGermplasm() ? germplasm.get_mutagen() : null;
    }

    public String get_germplasm_description() {
        return hasGermplasm() ? germplasm.get_description() : null;
    }

    public Boolean get_is_aneuploid() {
        return hasGermplasm() ? germplasm.get_is_aneuploid() : null;
    }

    public Integer get_aneuploid_chromosome() {
        return hasGermplasm() ? germplasm.get_aneuploid_chromosome() : null;
    }

    /**
     * Retrieves ABRC stock number used to identify germplasm from data sheet.
     * This value is not included in Germplasm table itself, but is recorded for
     * display purposes
     * 
     * @return ABRC stock number used to identify germplasm
     */
    public String getStockNumber() {
        return hasGermplasm() ? germplasm.getStockNumber() : null;
    }

    /**
     * Determines if bio sample has associated germplasm data
     * 
     * @return <code>true</code> if bio sample has associated germplasm data;
     *         <code>false</code> if no germplasm asssociated to bio sample
     */
    public boolean hasGermplasm() {
        return ( germplasm != null );
    }

    /**
     * Sets germplasm data wholesale for bio sample
     * 
     * @param germplasm
     *            Germplasm data to set for bio sample
     */
    public void setGermplasm( LoadableGermplasm germplasm ) {
        this.germplasm = germplasm;

        // set foreign key in superclass -- new germplasms will have id set
        // after germplasm has been stored to db
        super.set_germplasm_id( germplasm.get_germplasm_id() );
    }

    /**
     * Retrieves germplasm data wholesale for bio sample
     * 
     * @return Germplasm data for bio sample as a LoadableGermplasm object
     */
    public LoadableGermplasm getGermplasm() {
        return germplasm;
    }

    /**
     * Add submitted environmental condition to bio sample's collection of
     * associated conditions
     * 
     * @param envCond
     *            Environmental condition to add to bio sample
     */
    public void addEnvironmentalCondition( BioSamEnvConObject envCond ) {
        if ( envConds == null ) {
            envConds = new BioSamEnvConObjectCollection();
        }
        envConds.add( envCond );
    }

    /**
     * Removes submitted environmental condition from bio sample
     * 
     * @param envCond
     *            Environmental condition to remove from bio sample
     */
    public void removeEnvironmentalCondition( BioSamEnvConObject envCond ) {
        if ( hasEnvironmentalConditions() ) {
            envConds.remove( envCond );
        }
    }

    /**
     * Determines if bio sample has associated environmental condition data
     * 
     * @return <code>true</code> if bio sample has env condition data, or
     *         <code>false</code> if no env condition data for biosample
     */
    public boolean hasEnvironmentalConditions() {
        return ( envConds != null && !envConds.isEmpty() );
    }

    /**
     * Retrieves environmental conditions for this bio sample
     * 
     * @returns <code>Iterator</code> of <code>BioSamEnvConObject</code>
     *          objects for this BioSample
     */
    public Iterator getEnvironmentalConditions() {
        return hasEnvironmentalConditions() ? envConds.iterator() : null;
    }

    /**
     * Retrieves environmental condition with submitted name
     * 
     * @param name
     *            Name of condition to retrieve
     * @return Environmental condition with submitted name or <code>null</code>
     *         if no condition found with name
     */
    public BioSamEnvConObject getEnvironmentalCondition( String name ) {
        return hasEnvironmentalConditions() ? envConds
                                                      .getEnvironmentalCondition( name )
                                           : null;
    }

    /**
     * Determines if at least one environmental condition of bio sample has data
     * for the condition value field. This is useful at the JSP level for
     * determining whether this data column can be excluded or not when
     * displaying the collection
     * 
     * @return <code>true</code> if at least one object has data for this
     *         field, or <code>false</code> if this field is <code>null</code>
     *         for all environmental conditions
     */
    public boolean hasConditionValue() {
        return hasEnvironmentalConditions() ? envConds.hasConditionValue()
                                           : false;
    }

    /**
     * Determines if at least one environmental condition of bio sample has data
     * for the condition duration field. This is useful at the JSP level for
     * determining whether this data column can be excluded or not when
     * displaying the collection
     * 
     * @return <code>true</code> if at least one object has data for this
     *         field, or <code>false</code> if this field is <code>null</code>
     *         for all environmental conditions
     */
    public boolean hasConditionDuration() {
        return hasEnvironmentalConditions() ? envConds.hasConditionDuration()
                                           : false;
    }

    /**
     * Determines if at least one environmental condition of bio sample has data
     * for the application frequency field. This is useful at the JSP level for
     * determining whether this data column can be excluded or not when
     * displaying the collection
     * 
     * @return <code>true</code> if at least one object has data for this
     *         field, or <code>false</code> if this field is <code>null</code>
     *         for all environmental conditions
     */
    public boolean hasApplicationFrequency() {
        return hasEnvironmentalConditions() ? envConds
                                                      .hasApplicationFrequency()
                                           : false;
    }

    /**
     * Determines if at least one environmental condition of bio sample has data
     * for the order number field. This is useful at the JSP level for
     * determining whether this data column can be excluded or not when
     * displaying the collection
     * 
     * @return <code>true</code> if at least one object has data for this
     *         field, or <code>false</code> if this field is <code>null</code>
     *         for all environmental conditions
     */
    public boolean hasOrderNumber() {
        return hasEnvironmentalConditions() ? envConds.hasOrderNumber() : false;
    }

    /**
     * Determines if bio sample has structure keywords
     * 
     * @return <code>true</code> if bio sample has structure keywords,
     *         <code>false</code> if no strcuture keywords for bio sample
     */
    public boolean hasStructureKeywords() {
        return ( structureKeywords != null && !structureKeywords.isEmpty() );
    }

    /**
     * Retrieves all strcuture keyword for bio sample
     * 
     * @return Structure keywords as an <code>Iterator</code> of
     *         <code>LoadableBioSampleKeyword</code> objects, or
     *         <code>null</code> & if bio sample has no strcuture keywords
     */
    public Iterator getStructureKeywords() {
        return hasStructureKeywords() ? structureKeywords.iterator() : null;
    }

    /**
     * Adds submitted structure keyword for bio sample.
     * 
     * @param keyword
     *            Structure keyword to add
     */
    // the structure keywords was called anatomy
    public void addStructureKeyword( LoadableBioSampleKeyword keyword ) {

        // if first keyword, initialize collection using keyword
        // type id of submitted keyword to define collection
        if ( structureKeywords == null ) {
            String type[] = { keyword.get_keyword_type_id() };
            structureKeywords = new LoadableBioSampleKeywordCollection( Arrays
                                                                              .asList( type ) );
        }
        structureKeywords.add( keyword );
    }

    /**
     * Removes submitted structure keyword from bio sample's collection of
     * keywords
     * 
     * @param keyword
     *            Structure keyword to remove
     */
    public void removeStructureKeyword( LoadableBioSampleKeyword keyword ) {
        if ( hasStructureKeywords() ) {
            structureKeywords.remove( keyword );
        }
    }

    /**
     * Determines if bio sample has developmental stage keywords
     * 
     * @return <code>true</code> if bio sample has developmental stage
     *         keywords, <code>false</code> if no developmental stage keywords
     *         for bio sample
     */
    public boolean hasDevelopmentalStages() {
        return ( developmentalStages != null && !developmentalStages.isEmpty() );
    }

    /**
     * Retrieves all developmental stage keywords for bio sample.
     * 
     * @return Developmental stage keywords as an <code>Iterator</code> of
     *         <code>BioSampleKeyword</code> objects, or <code>null</code>
     *         if bio sample has no developmental stage keywords
     */
    public Iterator getDevelopmentalStages() {
        return hasDevelopmentalStages() ? developmentalStages.iterator() : null;
    }

    /**
     * Adds submitted developmental stage keyword for bio sample
     * 
     * @param stage
     *            Developmental stage keyword to add
     */
    public void addDevelopmentalStage( LoadableBioSampleKeyword stage ) {

        // if first keyword, initialize collection using keyword
        // type id of submitted keyword to define collection
        if ( developmentalStages == null ) {
            String[] type = { stage.get_keyword_type_id() };
            developmentalStages = new LoadableBioSampleKeywordCollection( Arrays
                                                                                .asList( type ) );
        }
        developmentalStages.add( stage );
    }

    /**
     * Removes submitted developmental stage keyword from bio sample's
     * collection of keywords
     * 
     * @param stage
     *            Developmental stage keyword to remove
     */
    public void removeDevelopmentalStage( LoadableBioSampleKeyword stage ) {
        if ( hasDevelopmentalStages() ) {
            developmentalStages.remove( stage );
        }
    }

    /**
     * Stores bio sample and all associated data to the database. Associated
     * data will include any environmental conditions for bio sample as well as
     * links to germplasm, protocol and keywords. New records will be stored for
     * protocol and germplasm if necessary. New germplasm storing may result in
     * new Clone record as well as associations to gene and polymorphism.
     * 
     * <p>
     * NOTE: protocol and germplasm will NOT be UPDATEd if they already exist
     * (MAY NEED TO CHANGE THIS DEPENDING ON REQUIREMENTS OF ONLINE CURATION
     * TOOL).
     * 
     * @param conn
     *            A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException
     *             if required data has not been set for any element to be
     *             stored
     * @throws SQLException
     *             if a database error occurs
     */
    public void store( DBconnection conn )
    throws SQLException, InvalidActionException {

        storeExtractionProtocol( conn );

        storeGermplasm( conn );

        // store bio sample and get newly created ids
        super.store( conn );

        // store keyword associations
        storeKeywords( conn );

        // store environmental conditions for bio sample
        storeEnvironmentalConditions( conn );

    }

    /**
     * Stores germplasm data to the database. Storing here will only be done
     * when creating a new germplasm; UPDATEs will not occur here. This is done
     * to avoid saving data over and over for each bio sample that uses
     * germplasm --- WILL NEED TO CHANGE THIS IF GERMPLASM DATA CAN BE UPDATED
     * BY ONLINE CURATION TOOL
     * 
     * @param conn
     *            A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException
     *             if required data has not been set for any element to be
     *             stored
     * @throws SQLException
     *             if a database error occurs
     */
    private void storeGermplasm( DBconnection conn )
        throws InvalidActionException, SQLException {

        if ( hasGermplasm() ) {

            if ( germplasm.get_germplasm_id() == null ) {

                // stores germplasm along with clone data and links to
                // gene and polymorphism if necessary
                germplasm.store( conn );

                // add log message that germplasm was inserted
                InsertLogger.log( "Inserted germplasm "
                                  + germplasm.get_name()
                                  + " [germplasm id: "
                                  + germplasm.get_germplasm_id()
                                  + "] " );

            }

            // set link to germplasm in bio sample
            super.set_germplasm_id( germplasm.get_germplasm_id() );
        }

    }

    /**
     * Store extraction protocol data to the database. this will store the
     * protocol into database if protocol doesn't exist and protocol's
     * association data if not exist.
     * 
     * @param conn
     *            A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException
     *             if required data has not been set for any element to be
     *             stored
     * @throws SQLException
     *             if a database error occurs
     */
    private void storeExtractionProtocol( DBconnection conn )
        throws InvalidActionException, SQLException {

        if ( hasExtractionProtocol() ) {
            // if ( protocol.get_reference_id() == null ) {
            // stores new protocol along with any URLs submitted for it
            protocol.store( conn );

            // set link to protocol in bio sample
            super.set_extraction_protocol_ref_id( protocol.get_reference_id() );
        }
    }

    /**
     * Sets relationship and annotation types for all keywords along with bio
     * sample id for object and stores associations
     * 
     * @param conn
     *            A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException
     *             if any data has not been properly set for storing
     * @throws SQLException
     *             if a database error occurs
     */
    private void storeKeywords( DBconnection conn )
        throws InvalidActionException, SQLException {

        // all keyword associations to bio sample should
        // have same annotation type
        TfcAnnotationType annotationType = new TfcAnnotationType( conn,
                                                                  "BioSample" );

        // all keyword associations to bio sample should have the
        // same relationship type of "is a"
        TfcRelationshipType relationshipType = getBioSampleRelType( conn );

        if ( hasStructureKeywords() ) {
            structureKeywords.setBioSampleID( get_bio_sample_id() );
            structureKeywords.setRelationshipType( relationshipType );
            structureKeywords.setAnnotationType( annotationType );
            structureKeywords.store( conn );
        }

        if ( hasDevelopmentalStages() ) {
            developmentalStages.setBioSampleID( get_bio_sample_id() );
            developmentalStages.setRelationshipType( relationshipType );
            developmentalStages.setAnnotationType( annotationType );
            developmentalStages.store( conn );
        }
    }

    /**
     * Creates TfcRelationshipType object for all keywords associated to
     * BioSample. This data is needed for creating keyword collections for new
     * and existing bio samples.
     * 
     * @param conn
     *            An active connection to the database
     * @return TfcRelationshipType object for all bio sample keywords; maps to
     *         "is a" relationship type
     * @throws SQLException
     *             if a database error occurs
     */
    private TfcRelationshipType getBioSampleRelType( DBconnection conn )
        throws SQLException {

        TfcRelationshipType relationshipType = new TfcRelationshipType( conn,
                                                                        "is a",
                                                                        "BioSample" );

        return relationshipType;
    }

    /**
     * Sets bio sample id for all environmental conditions associated to bio
     * sample and stores conditions and associations to the database.
     * 
     * @param conn
     *            A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException
     *             if any data has not been properly set for storing
     * @throws SQLException
     *             if a database error occurs
     */
    private void storeEnvironmentalConditions( DBconnection conn )
        throws InvalidActionException, SQLException {

        if ( hasEnvironmentalConditions() ) {
            envConds.setBioSampleID( get_bio_sample_id() );
            envConds.store( conn );
        }
    }

    /**
     * Deletes bio sample and all associated data from the database. Associated
     * data will include any environmental conditions for bio sample as well as
     * links to keywords.
     * 
     * @param conn
     *            A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException
     *             if a database error occurs
     */
    // this method override the delete method from TfcBioSample, since it needs
    // to delete from BioSample_EnvCon,
    // BioSample_Keyword
    public void delete( DBconnection conn ) throws SQLException {

        if ( hasEnvironmentalConditions() ) {
            for ( Iterator iter = getEnvironmentalConditions(); iter.hasNext(); ) {
                BioSamEnvConObject envcon = (BioSamEnvConObject) iter.next();
                envcon.delete( conn );
            }
        }

        if ( hasStructureKeywords() ) {
            structureKeywords.delete( conn );
        }

        if ( hasDevelopmentalStages() ) {

            developmentalStages.delete( conn );
        }
        super.delete( conn );
    }

}
