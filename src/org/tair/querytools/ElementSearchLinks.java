/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.net.*;

/**
 * ElementSearchLinks is a utility class to encapsulate the creation
 * of URLs for use in ElementCountCollection.  ElementCountCollection
 * is used by detail pages to show associated elements as simple counts
 * rather than itemized lists. Associated element counts are displayed
 * as hyperlinks that allow user to view full list of elements.  Usually,
 * these links point to one of the main top level searches to do the
 * work of displaying elements.  ElementSearchLinks is responsible for
 * creating those links for the different elements and contexts
 * that ElementCounts are used in.  Ultimately, these URLs are hardcoded
 * values, but at least they're all localized here.
 */

public class ElementSearchLinks {

    // base URL for all searches
    private static String baseSearchURL = "/servlets/Search?action=search&type=";


    /**
     * Retrieves a URL string that can be used to for viewing complete list of
     * elements of submitted searchType that are associated to submitted parentElement.
     * This URL is usually used in a hyperlink on parentElement's detail page to allow
     * users to view full list of associated elements by linking to the main
     * advanced search for elements of that type.
     *
     * <p>
     * The exact parameters of each link is dependent on the submitted value of
     * searchType and parentElement.  Current valid values of parentElement are:
     *
     * <ul>
     * <li>assembly_unit - valid searchType values are:
     *     <ul>
     *        <li>clone</li>
     *        <li>EST</li>
     *        <li>genetic_marker</li>
     *     </ul>
     * </li>
     *
     * <li>locus - valid searchType values are:
     *      <ul>
     *         <li>cDNA clone</li>
     *         <li>genomic clone</li>
     *         <li>EST</li>
     *         <li>genetic_marker</li>
     *      </ul>
     * </li>
     *
     * <li>polymorphism - valid searchType values are:
     *      <ul>
     *         <li>germplasm</li>
     *      </ul>
     * </li>
     * </ul>
     *
     * @param searchType Type of element to list
     * @param parentElement Element type of detail page being linked from
     * @param parentID Type specific ID of parent element - used by type specific
     * search to restrict list of searchType elements
     * @return String containing URL that can be used to link to search for searchType
     * from parentElement's detail page
     */
    public static String getSearchLink( String searchType,
                                        String parentElement,
                                        Long parentID )
    {
        String link = null;

        if ( searchType != null && parentElement != null &&  parentID != null ) {

            if ( parentElement.equals( "assembly_unit" ) ) {
                link = getAssemblyUnit( searchType, parentID );
            } else if ( parentElement.equals( "locus" ) ) {
                link = getLocus( searchType, parentID );
            } else if ( parentElement.equals( ElementCountCollection.kPolymorphismParentType ) ) {
                link = getPolymorphism( searchType, parentID );
            }
        }
        return link;
    }


    /**
     * Get links for assembly unit page using assembly unit's map element id.
     * Valid values of searchType are clone, EST and genetic_marker
     */
    private static String getAssemblyUnit( String searchType, Long map_element_id ) {
        String link = null;

        if ( searchType.equals( "clone" ) ) {
            link =
                baseSearchURL +
                "dna&dna_type=clone&assembly_map_element_id=" +
                map_element_id.toString();

        } else if ( searchType.equals( "EST" ) ) {
            link =
                baseSearchURL +
                "dna&dna_type=clone_end&clone_end_type=EST&assembly_map_element_id=" +
                map_element_id.toString();

        } else if ( searchType.equals( "genetic_marker" ) ) {
            link =
                baseSearchURL +
                "marker&assembly_map_element_id=" +
                map_element_id.toString();
        }
        return link;
    }


    /**
     * Get links for locus page using locus's locus id.
     * Valid values of searchType are cDNA clone, genomic clone
     * EST and genetic_marker
     */
    private static String getLocus( String searchType, Long locus_id ) {
        String link = null;


        // restrict all clones & ESTs to have NT sequence by
        // requesting for "is_sequenced"
        if ( searchType.equals( "cDNA" ) ) {
            link =
                baseSearchURL +
                "dna&dna_type=clone&insert_type=cDNA&other_features=is_sequenced&locus_id=" +
                locus_id.toString();

        } else if ( searchType.equals( "genomic clone" ) ) {
            link =
                baseSearchURL +
                "dna&dna_type=clone&insert_type=genomic&other_features=is_sequenced&locus_id=" +
                locus_id.toString();

        } else if ( searchType.equals( "EST" ) ) {
            link =
                baseSearchURL +
                "dna&dna_type=clone_end&clone_end_type=EST&other_features=is_sequenced&locus_id=" +
                locus_id.toString();

        } else if ( searchType.equals( "genetic_marker" ) ) {
            link =
                baseSearchURL +
                "marker&locus_id=" +
                locus_id.toString();
        }
        return link;
    }

    private static String getPolymorphism( String searchType, Long polymorphism_id ) {

        StringBuffer link = new StringBuffer( baseSearchURL );

        if( searchType.equals( ElementCountCollection.kGermplasmSearchType ) )
        {
            link.append( "germplasm" );
            link.append( "&search_action=search" );
            link.append( "&pageNum=1" );
            link.append( "&search=submit+query" );
            link.append( "&germplasm_type=any" );
            link.append( "&taxon=a_thaliana" );
            link.append( "&size=25" );
            link.append( "&order=germplasm_name" );
            link.append( "&allele_id_1=" );
            link.append( polymorphism_id.toString() );
        }
        else if( searchType.equals( ElementCountCollection.kPhenotypeSearchType ) )
        {
            link.append( "germplasm" );
            link.append( "&search_action=search" );
            link.append( "&pageNum=1" );
            link.append( "&search=submit+query" );
            link.append( "&germplasm_type=any" );
            link.append( "&taxon=a_thaliana" );
            link.append( "&size=25" );
            link.append( "&order=germplasm_name" );
            link.append( "&has_phenotype=true" );
            link.append( "&allele_id_1=" );
            link.append( polymorphism_id.toString() );
        }
        else
        {
            System.err.println( "ERROR (but not stopping): ElementSearchLinks: unsupported search type " + searchType );
        }

        return( link.toString() );
    }
}
