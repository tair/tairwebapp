//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $RCSfile: SearchType.java,v $
// $Revision: 1.56 $
// $Date: 2006/07/26 21:43:29 $
//------------------------------------------------------------------------------

package org.tair.utilities;

import java.util.*;
import org.tair.search.table.*;

/**  SearchType is a class used to hold static information about different
 * search types; mostly about temp table
 *  column information that the summary display pages use.  For example,
 * a list of the column names in the temp table
 *  is maintained here, a list of display names for the columns,
 * a list of columns that are used for the download
 *  capability on the summary page, a list of the columns that
 * contain ids instead of display data - the id is used
 *  to lookthe corresponding data up and display it at the time the page
 *  is displayed either because the data contains
 *  many data items for the row, if the data is very large and it makes
 *  better sense to retreive it as the page is
 *  displayed or if special formatting is required.
 *  Classes that use SearchType include classes that
 * implement <code>LookupDataModel</code> such as
 *  <code>PolyAlleleLookupData</code> and the search summary
 *  results fetcher, <code>ResultsFetcher</code>
 */

public class SearchType {

    /** SearchType holds search type information in a hash map
     * the keys to the map are the different search types
     *
     * the value part of the map is the corresponding information
     * for the different search types
     * the information is represented by Vector that contains at element:
     *      0 : String array of display column names
     *              any element requested from the jsp must have an entry in this
     *              array even if only as a placeholder
     *      1 : String array of ui columns -- requested from ui
     *              any element requested from the jsp in a getCell call needs to be
     *              declared in this array with a corresponding element in the
     *              display name array
     *      2 : String array of download columns
     *              any element requested for download from the search results page
     *              needs to be declared here
     *      3 : String array of lookup columns
     *              any element that requires a database lookup or special formatting
     *              must be declared here
     *      4 : String array of temp table columns
     *              the temp table columns are made accessible to the lookup class via
     *              this array whic is a wrapper to the columns declared in the temp
     *              table definition class
     *      5 : Lookup Class name
     *              the class used for the type specific search to perform lookups and
     *              specialized formatting for the jsp
     * accessor methods for each piece of info for the specified
     * search type are provided
     */

    private static HashMap searchTypes = new HashMap( );

    private static Vector  searchInfo;

    // formatted UI column names used for display purposes
    private static String[] polyallele_display_names = new String[]
        { "ID",
          "Name",
          "Aliases",
          "Type",
          "Chrom",
          "Position",
          "Seq Viewer",
          "Locus",
          "Locus ID",
          "Description",
          "PCR Primer",
          "Allele Oligo",
          "Flank Sequences",
          "Sequence Variants",
          "Digest Patterns",
          "PCR Product Length",
          "Is Allele",
          "row_id"};
    // one for one match with polyallele_display names
    private static String[] polyallele_ui_columns = new String[]
        { "id",
          "original_name",
          "aliases",
          "type",
          "chromo_ui",
          "position",
          "seqviewer",
          "locus",
          "locus_id",
          "description",
          "pcr_primer",
          "allele_oligo",
          "flank_seq",
          "seq_variant",
          "dig_pattern",
          "pcr_prod_length",
          "is_allele",
          "row_id",
          "has_germplasms",
          "has_phenotypes"};

    private static String[] polyallele_download_columns = new String[]
        { "original_name",
          "aliases",
          "type",
          "chromo_ui",
          "is_allele",
          "position",
          "locus",
          "locus_id",
          "description",
          "pcr_primer",
          "allele_oligo",
          "flank_seq",
          "seq_variant",
          "dig_pattern",
          "pcr_prod_length"};

    private static String[] polyallele_lookup_columns = new String[]
        { "aliases",
          "seqviewer",
          "locus",
          "locus_id",
          "description",
          "original_name",
          "chromo_ui",
          "pcr_primer",
          "allele_oligo",
          "flank_seq",
          "seq_variant",
          "dig_pattern",
          "pcr_prod_length",
          "position",
          "has_germplasms",
          "has_phenotypes"};

    private static String[] polyallele_tt_columns;

    private static String polyallele_lookup_classname =
        "org.tair.search.PolyAlleleLookupData";

    private static String polyallele_table_name =
        "org.tair.search.table.PolyAlleleTableInfo";

    // formatted UI column names used for display purposes
    private static String[] keyword_display_names = new String[]
        { "ID",
          "Keyword",
          "Keyword Category",
          "Annotations",
          "Associated Data Types" };
    // one for one match with keyword_display names
    private static String[] keyword_ui_columns = new String[]
        { "id",
          "keyword",
          "keyword_type",
          "annotation_counts",
          "annotation_types" };

    private static String[] keyword_download_columns = new String[]
        { "id",
          "keyword",
          "keyword_type",
          "annotation_counts",
          "annotation_types" };

    private static String[] keyword_lookup_columns = new String[]
        { "annotation_counts",
          "annotation_types" };

    private static String[] keyword_tt_columns;

    private static String keyword_lookup_classname =
        "org.tair.search.KeywordLookupData";

    private static String keyword_table_name =
        "org.tair.search.table.KeywordTableInfo";

    // formatted UI column names used for display purposes
    private static String[] goslim_display_names = new String[]
        { "ID",
          "Keyword Category",
          "Functional Category",
          "Annotation Count",
          "Gene Count"};
    // one for one match with goslim_display names
    private static String[] goslim_ui_columns = new String[]
        { "id",
          "keyword_type",
          "slim_name",
          "annotation_count",
          "loci_count"};

    private static String[] goslim_download_columns = new String[]
        { "keyword_type",
          "slim_name",
          "annotation_count",
          "loci_count"};

    private static String[] goslim_lookup_columns = new String[]
        { "keyword_type" };

    private static String[] goslim_tt_columns;

    private static String goslim_lookup_classname =
        "org.tair.search.goslim.GOSlimLookupData";

    private static String goslim_table_name =
        "org.tair.search.table.GOSlimTableInfo";

    // formatted UI column names used for display purposes
    private static String[] expression_display_names = new String[]
        { "ID",
          "array_element_id",
          "Array Element",
          "Locus Identifier",
          "locus_id",
          "Experiment Name",
          "exp_tair_object_id",
          "Sample Variables (Cy5 vs Cy3)",
          "Replicate Set id",
          "name",
          "Replicate Set Fold Change" ,
          "Rep Fold Change STDERR",
          "Slide Fold Change",
          "std error",
          "Slide",
          "hyb_data_id",
          "Slide External ID",
          "Ch2 Signal",
          "Ch1 Signal",
          "row_id"
        };


    // one for one match with expression_display names
    private static String[] expression_ui_columns = new String[]
        { "id",
          "array_element_id",
          "name",
          "locus",
          "locus_id",
          "experiment_name",
          "exp_tair_object_id",
          "environmental_variables",
          "hyb_desc_id",
          "hyb_desc_name",
          "repl_fold_change",
          "repl_fold_change_stderr",
          "fold_change",
          "fold_change_stderr",
          "hyb_data_name",
          "hyb_data_id",
          "external_id" ,
          "ch2_signal",
          "ch1_signal",
          "row_id"
     };

    private static String[] expression_download_columns = new String[]
        { "name",
          "locus",
          "experiment_name",
          "environmental_variables",
          "hyb_desc_id",
          "hyb_desc_name",
          "repl_fold_change",
          "repl_fold_change_stderr" ,
          "fold_change",
          "fold_change_stderr",
          "hyb_data_name",
          "hyb_data_id",
          "external_id" ,
          "ch2_signal",
          "ch1_signal",
        };

    private static String[] expression_lookup_columns = new String[]
        {
         "hyb_data_name",
            "hyb_data_id",
            "fold_change",
            "fold_change_stderr",
            "ch1_signal",
            "ch2_signal",
            "environmental_variables",
            "external_id",
        };

    private static String[] expression_tt_columns;

    private static String expression_lookup_classname =
        "org.tair.search.ExpressionLookupData";

    private static String expression_table_name =
        "org.tair.search.table.ExpressionTableInfo";
    // formatted UI column names used for display purposes
    private static String[] singleChannelDisplayNames = new String[]
        { "ID",
          "array_element_id",
          "Array Element",
          "Locus Identifier",
          "locus_id",
          "Experiment Name",
          "exp_tair_object_id",
          "Sample Variables",
          "RepSet",
          "hyb_desc_name",
          "RepSet", // repset detection
          "p-value",
          "std err",
          "RepSet Signal",
          "std err",
          "RepSet Percentile",
          "std err",
          "Slide",
          "hyb_data_id",
          "Slide",// slide detection
          "p-value" ,
          "Slide Signal",
          "Slide Percentile",
          "row_id"
        };

    // one for one match with singleChannelDisplay names
    private static String[] singleChannelUIColumns = new String[]
        { "id",
          "array_element_id",
          "name",
          "locus",
          "locus_id",
          "experiment_name",
          "exp_tair_object_id",
          "environmental_variables",
          "hyb_desc_id",
          "hyb_desc_name",
          "repl_detection",
          "repl_detection_pvalue",
          "repl_detection_pvalue_stderr",
          "repl_signal",
          "repl_signal_stderr",
          "repl_signal_percentile",
          "repl_signal_percentile_stderr",
          "hyb_data_name",
          "hyb_data_id",
          "detection",
          "detection_pvalue",
          "signal",
          "signal_percentile",
          "row_id"
        };

    private static String[] singleChannelDownloadColumns = new String[]
        { "name",
          "locus",
          "experiment_name",
          "hyb_desc_id",
          "hyb_desc_name",
          "environmental_variables",
          "repl_detection",
          "repl_detection_pvalue",
          "repl_detection_pvalue_stderr",
          "repl_signal",
          "repl_signal_stderr",
          "repl_signal_percentile",
          "repl_signal_percentile_stderr",
          "hyb_data_name",
          "hyb_data_id",
          "detection",
          "detection_pvalue",
          "signal",
          "signal_percentile",
        };

    private static String[] singleChannelLookupColumns = new String[]
        {
            "aliases",
            "gen_bank_accessions",
            "hyb_data_name",
            "hyb_data_id",
            "detection",
            "detection_pvalue",
            "signal",
            "signal_percentile",
            "environmental_variables" };

    private static String[] singleChannelTTColumns;

    private static String singleChannelLookupClassname =
        "org.tair.search.SingleChannelLookupData";

    private static String singleChannelTableName =
        "org.tair.search.table.SingleChannelTableInfo";

    // formatted UI column names used for display purposes
    private static String[] annotationDisplayNames = new String[]
        { "id",
          "Keyword Category",
          "keyword_id",
          "Keyword",
          "tair_object_id",
          "Annotated Gene or Locus",
          "relationship_type_id",
          "Relationship Type",
          "evidence_description_id",
          "Evidence Description",
          "Evidence Code",
          "Evidence With",
          "reference_id",
          "reference_type",
          "Reference",
          "Annotated By",
          "Date Last Modified",
          "Locus",
          "Is Parent",
          "sort_row_id",
          "row_id"};
    // one for one match with annotationDisplayNames names
    private static String[] annotationUIColumns = new String[]
        { "id",
          "keyword_category",
          "keyword_id",
          "keyword",
          "tair_object_id",
          "tair_object_name",
          "relationship_type_id",
          "relationship_type",
          "evidence_description_id",
          "evidence_description",
          "evidence_code",
          "evidence_with",
          "reference_id",
          "reference_type",
          "reference_label",
          "annotated_by",
          "date_last_modified",
          "locus_links",
          "locus_gene_links",
          "locus_symbol_links",
          "is_parent_keyword",
          "sort_row_id",
          "row_id"};

    private static String[] annotationDownloadColumns = new String[]
        { "id",
          "keyword_category",
          "keyword_id",
          "keyword",
          "tair_object_id",
          "tair_object_name",
          "relationship_type_id",
          "relationship_type",
          "evidence_description_id",
          "evidence_description",
          "evidence_code",
          "evidence_with",
          "reference_id",
          "reference_type",
          "reference_label",
          "annotated_by",
          "date_last_modified",
          "sort_row_id",
          "row_id"};
    private static String[] annotationLookupColumns = new String[]
        { "tair_object_name",
	  "tair_object_type",
          "relationship_type",
          "reference_type",
          "reference_label",
          "evidence_code",
          "evidence_description",
          "evidence_with",
          "annotated_by",
          "date_last_modified",
          "locus_links",
          "locus_gene_links",
          "locus_symbol_links"};

    private static String[] annotationTTColumns;

    private static String annotationLookupClassname =
        "org.tair.search.AnnotationLookupData";

    private static String annotationTableName =
        "org.tair.search.table.AnnotationTableInfo";

    // formatted UI column names used for display purposes
    private static String[] invoiceDisplayNames = new String[]
        { "Invoice Number",
          "Lab",
          "organization_id",
          "Date Invoice Created",
          "Invoice Date",
          "Status",
          "Order Number",
          "orders_id",
          "Last Notified Date",
          "Last Ship Date",
          "Invoice Total",
          "Balance Due",
          "Eligible For Payment",
          "Invoice Type",
          "Line Items",
          "Orderer Name", 
          "sort_row_id",
          "auth_amount",
          "payment_ref_id",
          "verification_code",
          "date_last_modified",
          "row_id"};
    // one for one match with invoiceDisplayNames names
    private static String[] invoiceUIColumns = new String[]
        { "id",
       "lab",
          "organization_id",
          "date_invoice_created",
          "invoice_date",
          "invoice_status",
          "order_number",
          "orders_id",
          "last_notified_date",
          "last_shipped_date",
          "invoice_total",
          "balance_due",
          "eligible_amount",
          "invoice_type",
          "line_items",
          "person_name",
          "sort_row_id",
          "auth_amount",
          "payment_ref_id",
          "verification_code",
          "date_last_modified",
          "row_id"};

    private static String[] invoiceDownloadColumns = new String[]
        { "id",
          "lab",
          "organization_id",
          "invoice_date",
          "invoice_status",
          "order_number",
          "last_notified_date",
          "last_shipped_date",
          "invoice_total",
          "balance_due",
          "eligible_amount",
          "invoice_type",
          "sort_row_id",
          "row_id",
          "orders_id",
          "auth_amount",
          "payment_ref_id",
          "verification_code",
          "date_last_modified", 
          "date_invoice_created"};

    private static String[] invoiceLookupColumns = new String[]
        { "lab",
          "invoice_date",
          "person_name", 
          "balance_due",
          "eligible_amount",
          "auth_amount",
          "payment_ref_id",
          "verification_code",
          "date_last_modified",
          "last_notified_date",
          "last_shipped_date",
          "invoice_status",
          "invoice_type",
          "line_items"};

    private static String[] invoiceTTColumns;

    private static String invoiceLookupClassname =
        "org.tair.abrc.payment.InvoiceLookupData";

    private static String invoiceTableName =
        "org.tair.search.table.InvoiceTableInfo";

//  formatted UI column names used for display purposes
    private static String[] paymentDisplayNames = new String[]
        { "Payment Date",
          "Payment Amount",
          "Invoice ID",
          "Payment Type",
          "verification_code",
          "name_on_check",
          "check_number",
          "check_date",
          "payment_ref_id",
          "Order Number",
          "sort_row_id",
          "row_id",
          "payment_id"};
    // one for one match with paymentDisplayNames names
    private static String[] paymentUIColumns = new String[]
        { "payment_date",
       "payment_amount",
          "invoice_id",
          "type",
          "verification_code",
          "name_on_check",
          "check_number",
          "check_date",
          "payment_ref_id",
          "order_number",
          "sort_row_id",
          "row_id",
          "payment_id"};

    private static String[] paymentDownloadColumns = new String[]
        { "payment_date",
          "payment_amount",
          "invoice_id",
          "type",
          "verification_code",
          "name_on_check",
          "check_number",
          "check_date",
          "payment_ref_id",
          "order_number", 
          "sort_row_id",
          "row_id",
          "payment_id"};


    private static String[] paymentLookupColumns = new String[]
     { };



    private static String[] paymentTTColumns;

    private static String paymentLookupClassname =
       "org.tair.abrc.payment.PaymentLookupData";

    private static String paymentTableName =
        "org.tair.search.table.PaymentTableInfo";




    static {
         // use ObjectInfoCollection, which reads search.conf
        // to determine if a search type used here has a defined
        // temp table - if it does get the temp table column names
        // from the temp table class associated with the
        // search type otherwise populate the column names with a
        // default value in the string array
        ObjectInfoCollection oic = new ObjectInfoCollection();
        try {
            oic.loadSearchFile();
        } catch ( Exception ex ) {
            ex.printStackTrace();
        }
        // check to see if the search type that we're defining
        // column names for here - which are used by
        // ResultsFetcher and LookupData classes, actually have a
        // TableInfo class registered for it
        // if it doesn't load in some default values, otherwise get
        // the column names from the TableInfo class

        // PolyAllele search
        searchInfo = new Vector();
        searchInfo.add( polyallele_display_names );
        searchInfo.add( polyallele_ui_columns );
        searchInfo.add( polyallele_download_columns );
        searchInfo.add( polyallele_lookup_columns );
        if ( oic.getTableInfoClasses().containsValue( polyallele_table_name ) ) {
            PolyAlleleTableInfo pati = new PolyAlleleTableInfo();
            polyallele_tt_columns = pati.getColumnNames();
        } else {
            polyallele_tt_columns = new String[] { "undefined" };
        }
        searchInfo.add( polyallele_tt_columns );
        searchInfo.add( polyallele_lookup_classname );
        searchTypes.put( "polyallele", searchInfo );

        // Keyword search
        searchInfo = new Vector();
        searchInfo.add( keyword_display_names );
        searchInfo.add( keyword_ui_columns );
        searchInfo.add( keyword_download_columns );
        searchInfo.add( keyword_lookup_columns );
        if ( oic.getTableInfoClasses().containsValue( keyword_table_name ) ) {
            KeywordTableInfo kti = new KeywordTableInfo();
            keyword_tt_columns = kti.getColumnNames();
        } else {
            keyword_tt_columns = new String[] { "undefined" };
        }
        searchInfo.add( keyword_tt_columns );
        searchInfo.add( keyword_lookup_classname );
        searchTypes.put( "keyword", searchInfo );

        // goslim
        searchInfo = new Vector();
        searchInfo.add( goslim_display_names );
        searchInfo.add( goslim_ui_columns );
        searchInfo.add( goslim_download_columns );
        searchInfo.add( goslim_lookup_columns );
        if ( oic.getTableInfoClasses().containsValue( goslim_table_name ) ) {
            GOSlimTableInfo gti = new GOSlimTableInfo();
            goslim_tt_columns = gti.getColumnNames();
        } else {
            goslim_tt_columns = new String[] { "undefined" };
        }
        searchInfo.add( goslim_tt_columns );
        searchInfo.add( goslim_lookup_classname );
        searchTypes.put( "goslim", searchInfo );

        // expression
        searchInfo = new Vector();
        searchInfo.add( expression_display_names );
        searchInfo.add( expression_ui_columns );
        searchInfo.add( expression_download_columns );
        searchInfo.add( expression_lookup_columns );
        if ( oic.getTableInfoClasses().containsValue( expression_table_name ) ) {
            ExpressionTableInfo eti = new ExpressionTableInfo();
            expression_tt_columns = eti.getColumnNames();
        } else {
            expression_tt_columns = new String[] { "undefined" };
        }
        searchInfo.add( expression_tt_columns );
        searchInfo.add( expression_lookup_classname );
        searchTypes.put( "expression", searchInfo );

        // single channel
        searchInfo = new Vector();
        searchInfo.add( singleChannelDisplayNames );
        searchInfo.add( singleChannelUIColumns );
        searchInfo.add( singleChannelDownloadColumns );
        searchInfo.add( singleChannelLookupColumns );
        if ( oic.getTableInfoClasses().
             containsValue( singleChannelTableName ) ) {
            SingleChannelTableInfo scti = new SingleChannelTableInfo();
            singleChannelTTColumns = scti.getColumnNames();
        } else {
            singleChannelTTColumns = new String[] { "undefined" };
        }
        searchInfo.add( singleChannelTTColumns );
        searchInfo.add( singleChannelLookupClassname );
        searchTypes.put( "single_channel", searchInfo );
        // annotation
        searchInfo = new Vector();
        searchInfo.add( annotationDisplayNames );
        searchInfo.add( annotationUIColumns );
        searchInfo.add( annotationDownloadColumns );
        searchInfo.add( annotationLookupColumns );
        if ( oic.getTableInfoClasses().containsValue( annotationTableName ) ) {
            AnnotationTableInfo ati = new AnnotationTableInfo();
            annotationTTColumns = ati.getColumnNames();
        } else {
            annotationTTColumns = new String[] { "undefined" };
        }
        searchInfo.add( annotationTTColumns );
        searchInfo.add( annotationLookupClassname );
        searchTypes.put( "annotation", searchInfo );

        // invoice
        searchInfo = new Vector();
        searchInfo.add( invoiceDisplayNames );
        searchInfo.add( invoiceUIColumns );
        searchInfo.add( invoiceDownloadColumns );
        searchInfo.add( invoiceLookupColumns );
        if ( oic.getTableInfoClasses().containsValue( invoiceTableName ) ) {
            InvoiceTableInfo ti = new InvoiceTableInfo();
            invoiceTTColumns = ti.getColumnNames();
        } else {
            invoiceTTColumns = new String[] { "undefined" };
        }
        searchInfo.add( invoiceTTColumns );
        searchInfo.add( invoiceLookupClassname );
        searchTypes.put( "invoice", searchInfo );




//      payment
        searchInfo = new Vector();
        searchInfo.add( paymentDisplayNames );
        searchInfo.add( paymentUIColumns );
        searchInfo.add( paymentDownloadColumns );
        searchInfo.add( paymentLookupColumns );
        if ( oic.getTableInfoClasses().containsValue( paymentTableName ) ) {
            PaymentTableInfo pi = new PaymentTableInfo();
            paymentTTColumns = pi.getColumnNames();
        } else {
            paymentTTColumns = new String[] { "undefined" };
        }
        searchInfo.add( paymentTTColumns );
        searchInfo.add( paymentLookupClassname );
        searchTypes.put( "payment", searchInfo );
    }

    /**
     * @return String array of the variuos search types that are
     * maintained here
     */
    public static String[] getSearchTypes() {
        // get all the keys to the map and put into a string array
        String[] types = new String[ searchTypes.size() ];
        Iterator iter = searchTypes.keySet().iterator();
        int i = 0;
        while ( iter.hasNext() ) {
            types[i]  = ( String ) iter.next();
            i ++;
        }
        return types;
    }

    /**
     * @param searchType The search type to get information about
     * @return String array of the display names for the temp table columns
     */
    public static String[] getDisplayNames(String searchType) {
        // pulls out the information part associated with this type and
        // extracts the display column names
        return ( ( String[] )( ( Vector )searchTypes.get( searchType ) ).
                 elementAt( 0 ) );
    }

    /**
     * @param searchType The search type to get information about
     * @return String array of the temp table columns for this search type
     */
    // returns the String array of column names in the temp table for this
    // search type
    public static String[] getUIColumns(String searchType) {
        // pulls out the information part associated with this type and
        // extracts the column names
        return((String[])((Vector)searchTypes.get(searchType)).elementAt(1));
    }

    /**
     * @param searchType The search type to get information about
     * @return String array of the columns that will be used for the download
     * option for this search type
     */
    public static String[] getDownloadColumns(String searchType) {
        // pulls out the information part associated with this type and
        // extracts the download column names
        return((String[])((Vector)searchTypes.get(searchType)).elementAt(2));
    }

    /**
     * @param searchType The search type to get information about
     * @return String array of the columns that will contain lookup keys for
     * display at the time of a page request
     */
    public static String[] getLookupColumns(String searchType) {
        // pulls out the information part associated with this type and
        // extracts the lookup column names
        return((String[])((Vector)searchTypes.get(searchType)).elementAt(3));
    }

    /**
     * @param searchType The search type to get information about
     * @return String array of the temp table column names used in this search
     */
    public static String[] getTempTableColumns(String searchType) {
        // pulls out the information part associated with this type and
        // extracts the lookup column names
        return((String[])((Vector)searchTypes.get(searchType)).elementAt(4));
    }

    /**
     * @param searchType The search type to get information about
     * @return String representation of the class name that implements the
     * lookup logic for this search type
     */
    public static String getLookupClassname(String searchType) {
        // pulls out the information part associated with this type and
        //extracts the lookup classname
        return((String)((Vector)searchTypes.get(searchType)).elementAt(5));
    }

    public static void main(String[] args){

        for ( int i = 0; i < SearchType.getSearchTypes().length; i ++ ) {
            System.out.println(" getSearchTypes(), i =  " + i + SearchType.getSearchTypes()[i] );

            for ( int j = 0; j < SearchType.getDisplayNames( SearchType.getSearchTypes()[i] ).length; j ++ ) System.out.println(" getDisplayNames(), j =  " + j + SearchType.getDisplayNames( SearchType.getSearchTypes()[i] )[j] );

            for ( int j = 0; j < SearchType.getUIColumns
                      ( SearchType.getSearchTypes()[i] ).length; j ++ )
                System.out.println(" getUIColumns(), j =  " + j +
                                   SearchType.getUIColumns
                                   ( SearchType.getSearchTypes()[i] )[j] );

            for ( int j = 0; j < SearchType.getDownloadColumns
                      ( SearchType.getSearchTypes()[i] ).length; j ++ )
                System.out.println(" getDownloadColumns(), j =  " + j +
                                   SearchType.getDownloadColumns
                                   ( SearchType.getSearchTypes()[i] )[j] );

            for ( int j = 0; j < SearchType.getLookupColumns
                      ( SearchType.getSearchTypes()[i] ).length; j ++ )
                System.out.println(" getLookupColumns(), j =  " + j +
                                   SearchType.getLookupColumns
                                   ( SearchType.getSearchTypes()[i] )[j] );

            for ( int j = 0; j < SearchType.getTempTableColumns
                      ( SearchType.getSearchTypes()[i] ).length; j ++ )
                System.out.println(" getTempTableColumns(), j =  " + j +
                                   SearchType.getTempTableColumns
                                   ( SearchType.getSearchTypes()[i] )[j] );

            System.out.println(" getLookupClassname(), i =  " + i +
                               SearchType.getLookupClassname
                               ( SearchType.getSearchTypes()[i] ) );
        }
    }
}
