//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.22 $
// $Date: 2006/02/15 00:50:57 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;


/**
 * PolymorphismObject is a composite class that extends <code>TfcPolymorphism</code>
 * to present detailed information about a polymorphism. In addition to basic
 * data for polymorphism, PolymorphismObject also contains collections of
 * associated restriction enzymes, species variants, flanking sequences and
 * aliases.
 */


public class PolymorphismObject extends TfcPolymorphism {

    // flag to track if polymorphism has attributions
    private boolean hasAttributions = false;

    // Restriction enzymes w/polymorphism specific info for polymorphism -
    // stored as PolymorphismRestrictionEnzyme objects
    private PolymorphismRestrictionEnzymeCollection restrEnzymes;

    // species variants for polymorphisms - stored as PolymorphismSpeciesVariant objects
    private SpeciesVariantCollection speciesVariants;
    private Map speciesVariant2Attributions;

    // flanking sequences associated with element - stored as TfcFlankingSequence objects
    private FlankingSequenceVector flankingSequences;

    // used by the locus_detail and gene_detail pages.
    private ElementCountCollection germplasmPhenotypeCounts;

    /**
     * Creates an empty instance of PolymorphismObject
     */
    public PolymorphismObject() {
        super();
        speciesVariant2Attributions=new HashMap();
    }


    /**
     * Creates an instance of PolymorphismObject to reflect data
     * referenced by submitted polymorphism id.
     *
     * @param conn An active connection to the database
     * @param polymorphism_id Polymorphism id to retrieve data for
     * @exception SQLException in the case of an invalid operation or database error
     */
    public PolymorphismObject( DBconnection conn, Long polymorphism_id ) throws SQLException {
        super( conn, polymorphism_id );

        this.germplasmPhenotypeCounts =
            new ElementCountCollection( conn,
                                        polymorphism_id,
                                        ElementCountCollection.kPolymorphismParentType );
        
        speciesVariant2Attributions=new HashMap();
    }

    /**
     * @return non-null (unless the constructor failed) but possibly
     * empty ElementCountCollection containing germplasm and phenotype counts.
     */
    public ElementCountCollection getGermplasmPhenotypeCounts()
    {
        return( this.germplasmPhenotypeCounts );
    }

    /**
     * Retrieves number sites values between polymorphism & restriction enzyme as
     * a delimited string
     *
     * @return Number sites values for polymorphism & restriction enzyme as
     * a space delimited string, or <code>null</code> if no number sites values
     */
    public String get_number_sites() {
        StringBuffer buffer = null;
        String number_site = null;
        boolean first = true;
        Iterator iter = null;
        PolymorphismRestrictionEnzyme poly_enz = null;

        if ( hasRestrictionEnzymes() ) {
            buffer = new StringBuffer();
            iter = get_restriction_enzymes();
            while ( iter.hasNext() ) {
                poly_enz = (PolymorphismRestrictionEnzyme) iter.next();
                if ( poly_enz != null && poly_enz.get_num_sites() != null ) {
                    if ( !first ) {
                        buffer.append( " " );
                    }
                    buffer.append( poly_enz.get_num_sites().toString() );
                    first = false;
                }
            }
            number_site = buffer.toString();
        }
        return number_site;
    }


    /**
     * Retrieve restriction enzyme names as a delimited string
     *
     * @return Restriction enzyme names for polymorphism as a space delimited string
     * or <code>null</code> if no restriction enzymes for polymorphism
     */
    public String get_enzyme_name() {
        StringBuffer buffer = null;
        String enzyme_name = null;
        Iterator iter = null;
        boolean first = true;

        if ( hasRestrictionEnzymes() ) {
            buffer = new StringBuffer();
            iter = get_restriction_enzymes();
            while ( iter.hasNext() ) {
                PolymorphismRestrictionEnzyme enzyme = (PolymorphismRestrictionEnzyme) iter.next();
                if ( enzyme != null && enzyme.get_name() != null ) {
                    if ( !first ) {
                        buffer.append( " " );
                    }
                    buffer.append( enzyme.get_name() );
                    first = false;
                }
            }
            enzyme_name = buffer.toString();
        }
        return enzyme_name;
    }
    /*
    public String getTairObjectIDsAsAString()
    {
    	int index = 0;
    	StringBuffer sb = new StringBuffer();
    	boolean first=true;
    	Map used = new HashMap();
    	while(index < this.speciesVariants.size())
    	{
    		PolymorphismSpeciesVariant psv = this.speciesVariants.getSpeciesVariantByIndex(index);
    		Long tairObjectID=this.speciesVariants.getSpeciesVariant2PolymorphismTairObjectID(index);
    		if(used.get(tairObjectID)!=null)
    			continue;
            if ( !first ) {
                sb.append( "; " );
            }
            sb.append( tairObjectID );
            first = false;
    		
            used.put(tairObjectID,new Integer(1));
    		index++;
    	}
    	Long tairObjectID = this.get_tair_object_id();
		if(used.get(tairObjectID)==null)
		{
			if ( !first ) {
				sb.append( "; " );
			}
			sb.append( tairObjectID );
		}
    	return sb.toString();	
    }
*/
    
    public Iterator getTairObjectIDsIterator()
    {
    	return this.speciesVariants.SpeciesVariant2PolymorphismTairObjectIDs().iterator();
    }

    /**
     * Utility method to return a semi colon delimited string
     * of species variant names or abbreviated names for all variants
     * in submitted iterator. Using iterator means we can generate
     * string of names for any of 3 sub sets of variants available
     * to client code here in a single method
     *
     * @param iter Iterator of PolymorphismSpeciesVariant objects
     * to join names from
     * @param abbrevName If <code>true</code> returned string will
     * contain abbreviated names for variants, if <code>false</code>
     * string will contain full names for variants
     * @return Single string containing all names from variants in
     * submitted iterator, or <code>null</code> if no variants in
     * iterator
     */
    private String getVariantNames( Iterator iter, boolean abbrevName ) {
        String name = null;
        StringBuffer buffer = null;
        boolean first = true;
        PolymorphismSpeciesVariant variant = null;
        String variantName = null;
        Long tairObjectID=null;
        	
        if ( iter != null ) {
        	int index = 0;
            buffer = new StringBuffer();
            while ( iter.hasNext() ) {
                variant = (PolymorphismSpeciesVariant) iter.next();

                // use abbrev name or full name depending on value of abbrevName param
                variantName = abbrevName ? variant.get_abbrev_name() : variant.get_name();

                if ( variantName != null ) {
                    if ( !first ) {
                        buffer.append( "; " );
                    }
                    buffer.append( variantName );
                    first = false;
                }

            }
            name = buffer.toString();
        }
        return name;
    }

    /**
     * Retrieve species variant names as a delimited string
     *
     * @return Species variant names associated with polymorphism
     * as a semi colon delimited string, or <code>null</code> if no species
     * variants associated with polymorphism
     */
    public String get_species_variant_name() {
        return getVariantNames( get_species_variants(), false );
    }


    /**
     * Retrieve abbreviated species variant names as a delimited string
     *
     * @return Abbreviated species variant names associated with polymorphism
     * as a semi colon delimited string, or <code>null</code> if no species
     * variants associated with polymorphism
     */
    public String get_abbrev_species_variant_name() {
        return getVariantNames( get_species_variants(), true );
    }

    public String get_abbrev_species_variant_name(String status) {
       return getVariantNames( getSpeciesVariants(status), true );
    }

    /**
     * Retrieve verified species variant names as a delimited string
     *
     * @return Species variant names associated with polymorphism
     * as a semi colon delimited string, or <code>null</code> if no species
     * variants associated with polymorphism
     */
    public String getVerifiedSpeciesVariantName() {
        return getVariantNames( getVerifiedSpeciesVariants(), false );
    }


    /**
     * Retrieve abbreviated verified species variant names as a delimited string
     *
     * @return Abbreviated species variant names associated with polymorphism
     * as a semi colon delimited string, or <code>null</code> if no species
     * variants associated with polymorphism
     */
    public String getVerifiedAbbrevSpeciesVariantName() {
        return getVariantNames( getVerifiedSpeciesVariants(), true );
    }


    /**
     * Retrieve sequenced species variant names as a delimited string
     *
     * @return Species variant names associated with polymorphism
     * as a semi colon delimited string, or <code>null</code> if no species
     * variants associated with polymorphism
     */
    public String getSequencedSpeciesVariantName() {
        return getVariantNames( getSequencedSpeciesVariants(), false );
    }

    /**
     * Retrieve abbreviated sequenced species variant names as a delimited string
     *
     * @return Abbreviated species variant names associated with polymorphism
     * as a semi colon delimited string, or <code>null</code> if no species
     * variants associated with polymorphism
     */
    public String getSequencedAbbrevSpeciesVariantName() {
        return getVariantNames( getSequencedSpeciesVariants(), true );
    }


    /**
     * Determines if polymorphism has associated attributions
     *
     * @return <code>true</code> if polymorphism has associated attributions,
     * or <code>false</code> if no attributions fo polymorphism
     */
    public boolean hasAttributions() {
        return hasAttributions;
    }

    /**
     * Populates flag to determine whether polymorphism has associated attributions.
     * This value can then be retrieved using the hasAttributions method
     *
     * @param conn An active connection to the database
     */
    public void populateHasAttributions( DBconnection conn ) throws SQLException {
        String query =
            "SELECT COUNT(*) AS attr_count " +
            "FROM Attribution " +
            "WHERE tair_object_id = " + get_tair_object_id().toString();
        conn.setQuery( query );

        ResultSet results = conn.getResultSet();
        if ( results.next() ) {
            this.hasAttributions = ( results.getInt( "attr_count" ) > 0 );
        }
        conn.releaseResources();

    }

    /**
     * Populates polymorphism's collection of associated restriction enzymes. This
     * method assumes basic polymorphism information has already been populated
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateRestrictionEnzymes( DBconnection conn ) throws SQLException {
        restrEnzymes = new PolymorphismRestrictionEnzymeCollection( conn, get_polymorphism_id() );
    }

    /**
     * Determines if polymorphism has associated restriction enzymes
     *
     * @return <code>true</code> if polymorphism has associated restriction enzymes
     * or <code>false</code> if no restriction enzymes associated to polymorphism
     */
    public boolean hasRestrictionEnzymes() {
        return ( restrEnzymes != null && !restrEnzymes.isEmpty() );
    }

    /**
     * Retrieves restriction enzymes for polymorphism
     *
     * @return Restriction enzymes associated to polymorphism as an
     * <code>Iterator</code> of <code>PolymorphismRestrictionEnzyme</code> objects,
     * or <code>null</code> if no enzymes for polymorphism
     */
    public Iterator get_restriction_enzymes() {
        return ( hasRestrictionEnzymes() ) ? restrEnzymes.iterator() : null;
    }


    /**
     * Populates polymorphism's collection of associated species variants. This
     * method assumes basic polymorphism information has already been populated
     *
     * @param conn An active connection to the database
     * @throws SQLException if a database error occurs
     */
    public void populateSpeciesVariants( DBconnection conn ) throws SQLException {
        speciesVariants = new SpeciesVariantCollection( conn, get_polymorphism_id() );
    }


    /**
     * Determines if polymorphism has associated species variants
     *
     * @return <code>true</code> if polymorphism has associated species variants
     * or <code>false</code> if no species variants associated to polymorphism
     */
    public boolean hasSpeciesVariants() {
        return ( speciesVariants != null && !speciesVariants.isEmpty() );
    }

    /**
     * Retrieves species variants for polymorphism
     *
     * @return species variants associated to polymorphism as an
     * <code>Iterator</code> of <code>PolymorphismSpeciesVariant</code> objects,
     * or <code>null</code> if no species variants for polymorphism
     */
    public Iterator get_species_variants() {
        return ( hasSpeciesVariants() ) ? speciesVariants.iterator() : null;
    }

    public Iterator getStatuses (){
        return speciesVariants.getStatuses ();
    }
    /**
     * Retrieves species variants for polymorphism of different  verification status
     *
     * @return species variants associated to polymorphism in the specified status as an
     * <code>Iterator</code> of <code>PolymorphismSpeciesVariant</code> objects,
     * or <code>null</code> if no species variants for polymorphism
     */
    public Iterator getSpeciesVariants( String status ) {
     if ( hasSpeciesVariants() ) {
         return  speciesVariants.getSpeciesVariantsOfStatus( status );
     }
        return null;
    }
    
    public Long getTairObjectIDForVariantAbbrevName(String abbrev_name)
    {
    	return speciesVariants.getTairObjectIDForVariantAbbrevName(abbrev_name);
    }
    
    /**
     * Retrieves verified species variants for polymorphism
     *
     * @return species variants associated to polymorphism as an
     * <code>Iterator</code> of <code>PolymorphismSpeciesVariant</code> objects,
     * or <code>null</code> if no species variants for polymorphism
     */
    public Iterator getVerifiedSpeciesVariants() {
        return getSpeciesVariants("yes");
    }

    /**
     * Retrieves sequenced species variants for polymorphism
     *
     * @return species variants associated to polymorphism as an
     * <code>Iterator</code> of <code>PolymorphismSpeciesVariant</code> objects,
     * or <code>null</code> if no species variants for polymorphism
     */
    public Iterator getSequencedSpeciesVariants() {
        ArrayList sequenced = null;
        Iterator iter = null;
        PolymorphismSpeciesVariant speciesVariant = null;

        if ( hasSpeciesVariants() ) {
            iter = get_species_variants();
            while ( iter.hasNext() ) {
                speciesVariant = (PolymorphismSpeciesVariant) iter.next();

                if ( speciesVariant.get_is_sequenced() != null &&
                     speciesVariant.get_is_sequenced().booleanValue() ) {

                    if ( sequenced == null ) {
                        sequenced = new ArrayList();
                    }
                    sequenced.add( speciesVariant );
                }
            }
        }

        return ( sequenced != null && !sequenced.isEmpty() ) ? sequenced.iterator() : null;
    }


    /**
     * Return lengths and units as formatted string
     *
     * @return lengths and units if both are not <code>null</code>, or
     * <code>null</code> if units is not null and lengths is; if lengths
     * has value and units does not, lengths alone will be returned
     */
    public String get_format_lengths() {
        String returnStr = null;

        if ( get_lengths() != null ) {
            if ( get_units() != null ) {
                returnStr = get_lengths() + " " + get_units();
            } else {
                returnStr = get_lengths();
            }
        }
        return returnStr;
    }



    /**
     * Determines if polymorphism has associated flanking sequences
     *
     * @return <code>true</code> if polymorphism has associated flanking sequences
     * or <code>false</code> if no flanking sequences associated to polymorphism
     */
    public boolean hasFlankingSequences() {
        return ( flankingSequences != null && !flankingSequences.isEmpty() );
    }


    /**
     * Populates collection of flanking sequences for polymorphism.
     *
     * @param conn An active connection to the database
     */
    public void populateFlankingSequences( DBconnection conn ) throws SQLException {
        flankingSequences = new FlankingSequenceVector( conn, get_map_element_id() );
    }


    /**
     * Returns the flanking sequences for this map element as an <code>Iterator</code>
     * of <code>TfcFlankingSequence</code> objects
     *
     * @return an <code>Iterator</code> of <code>TfcFlankingSequence</code> objects
     * value specifying the flanking_sequences for this map element, or <code>null</code>
     * if no flanking sequences
     * @see TfcFlankingSequence
     */
    public Iterator get_flanking_sequence() {
        return ( hasFlankingSequences() ) ? flankingSequences.iterator() : null;
    }

    /**
     * Returns an <code>Iterator</code> of <code>TfcFlankingSequence</code>s where
     * type equals the requested type.
     *
     * @param type Type of Flanking Sequence to return
     * @return <code>Iterator</code> of <code>TfcFlankingSequence</code>s with the
     * requested type, or <code>null</code> if no objects in collection have the requested
     * type. If submitted type is <code>null</code>, all flanking sequences in the collection
     * will be returned
     */
    public Iterator get_flanking_sequence( String type ) {
        return ( hasFlankingSequences() ) ? flankingSequences.get_flanking_sequences( type ) : null;
    }


    /**
     * For unit testing only
     */
    public void test() {
        super.test();
        System.out.println( "****** PolymorphismObject content test ******" );
        System.out.println( "species_variant_name is " + get_species_variant_name() );
        System.out.println( "number is "+ get_number_sites() );
        System.out.println( "enzyme_name is " + get_enzyme_name() );
        System.out.println( "has Attribution is "+ hasAttributions() );



        if ( hasRestrictionEnzymes() ) {
            restrEnzymes.test();
        }

        if ( hasSpeciesVariants() ) {
            speciesVariants.test();
        }


        if ( hasFlankingSequences() ) {
            flankingSequences.test();
        }

        System.out.println( "**** PolymorphismObject content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try{

            DBconnection conn = new DBconnection();
            Long id = new Long( 3709 );
            PolymorphismObject poly = new PolymorphismObject( conn, id );
            poly.test();

        } catch( Exception e ) {
            e.printStackTrace();
        }
    }

}









