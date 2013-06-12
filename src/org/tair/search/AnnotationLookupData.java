/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import java.sql.*;
import java.util.*;

import org.tair.utilities.*;
import org.tair.tfc.*;
import org.tair.querytools.*;

/**
   * The purpose of this class is to provide a "get as needed" function for display of row data on summary pages
   * for a type specific search - in this case annotation search.  It retrieves the required data for a page's worth of rows
   * using ids for lookup of the data.  The ids are stored in the internal table which is populated by ResultsFetcher which  
   * retrieved the page's worth of data from the search's temp table. The lookup data is retrieved ( often multiple rows per 
   * id ) and stored as an array in the table's cell that corresponds to that lookup data. 
   *
   * AnnotationLookupData is used by <code>ResultsFetcher</code> through keyword as a <code>LookupDataModel</code> object.
   * AnnotationLookupData implements the methods defined by <code>LookupDataModel</code> in a search type specific manner.
   * AnnotationLookupData uses <code>SearchType</code> to identify columns for lookup for this particular search type.    
   **/

public class AnnotationLookupData implements LookupDataModel {

    private String[] lookupColumnNames;
    private String searchType = "annotation";  
    private String[][] resultsTable;
    private int resultsLength;
    private String[] lookupData;  
    private String[] tairObjectName;// only one entry per row
    private String[] tairObjectType;// only one entry per row
    private String[] relationshipType;// only one entry per row
    private String[] referenceType;// only one entry per row
    private String[] referenceLabel;// only one entry per row
    private String[] evidenceCode;// only one entry per row
    private String[] evidenceDescription;// only one entry per row
    private String[] evidenceWith;// only one entry per row
    private String[] annotatedBy;// only one entry per row
    private String[] dateLastModified;// only one entry per row
    private String[][] locusLinks;// possibly multiple loci per row
    private String[][] locusSymbolLinks;
    private DBReadManager connectionPool;

    public AnnotationLookupData() {
        setLookupColumnNames( SearchType.getLookupColumns( this.getType() ) );
    } 
    // gets a pooled connection to the database
    private DBconnection getConnection() throws SQLException {
        connectionPool = DBReadManager.getInstance();
        return connectionPool.get_connection();    
    }
    // releases a connection back to the database pool
    private void returnConnection( DBconnection conn ) throws SQLException { connectionPool.return_connection( conn ); }

    // sets the list of the lookup columns that contain ids for lookup 
    private void setLookupColumnNames( String[] lookupColumns ) { lookupColumnNames = lookupColumns; }

    // returns a list of the lookup columns that contain ids for lookup 
    private String[] getLookupColumnNames() { return lookupColumnNames; }

    // returns the correspnding index for a temp table column name -- to be used to access the lookup ID 
    // from the 'in memory' results table
    private int getIndex(String columnName) {
        int columnIndex = 0;
        for ( int i = 0; i < SearchType.getTempTableColumns( getType() ).length; i ++ ) {
            if ( SearchType.getTempTableColumns( getType() )[i].equals( columnName ) ) columnIndex = i;
        }
        return columnIndex;     
    }

    // returns length of results table
    private int getResultsLength() { return resultsTable.length; }

    // returns this search type 
    private String getType() { return searchType; }

    /**
     * provides to the object a subset (a page worth for display on the summary page) of the temp table results as a two 
     * dimensional string array.  The columns are the temp table columns and the rows are the result set rows - 
     * the rows for a particular pages display. Lookup keys can be accessed via the arrays contents for columns that 
     * have been identified as lookup columns.
     * @param summaryTable The table of one page of data from a summary page
     **/    
    public void setSummaryData( String[][] summaryTable ) throws SQLException {
        resultsTable = summaryTable;
        resultsLength = summaryTable.length;
        // set the data items that are for display to the summary page 
        DBconnection conn = null;
        try {
            conn = getConnection();
            setAnnotationInfo( conn ); 
        } finally {
            if ( conn != null ) returnConnection( conn ); 
        }
    }

    /**
     * provides to the object a subset (user-selected rows of data from the summary page) of the temp table results  
     * as a two dimensional string array.  The columns are the temp table columns and the rows are the user-selected 
     * rows from the summary page. Lookup keys can be accessed via the arrays contents for columns that 
     * have been identified as lookup columns.
     * @param downloadTable The table of user-selected rows from summary pages
     **/
    // currently no download page has been requested for this search -- default is the same as summary page   
    public void setDownloadData( String[][] downloadTable ) throws SQLException { 
        resultsTable = downloadTable;
        resultsLength = downloadTable.length;
        // set the data items that are needed for download page
        DBconnection conn = null;
        try {
            conn = getConnection();
            setAnnotationInfo( conn );  
        } finally {
            if ( conn != null ) returnConnection( conn ); 
        }    
    }

    // popultae AnnotationInfo from TairObjKeyEvidence objects  
    private void setAnnotationInfo( DBconnection conn ) throws SQLException {
        tairObjectName = new String[ getResultsLength() ];
        tairObjectType = new String[ getResultsLength() ];
        relationshipType = new String[ getResultsLength() ];
        referenceType = new String[ getResultsLength() ];
        referenceLabel = new String[ getResultsLength() ];
        evidenceCode = new String[ getResultsLength() ];
        evidenceDescription = new String[ getResultsLength() ];
        evidenceWith = new String[ getResultsLength() ];
        annotatedBy = new String[ getResultsLength() ];
        dateLastModified = new String[ getResultsLength() ];
        locusLinks = new String[resultsLength][];
        locusSymbolLinks = new String[resultsLength][];
        TairObjKeyEvidence toke = null;

        for ( int i = 0; i < getResultsLength(); i ++ ) {
            // check to see if this is a valid row for getting data for   
            if ( resultsTable[i][getIndex( "id" )] != null ) {
                toke = new TairObjKeyEvidence( conn, new Long( resultsTable[i][getIndex( "id" )] ) );
                tairObjectName[ i ] = toke.get_tair_object_name();
		        tairObjectType[ i ] = toke.get_tair_object_type();
                relationshipType[ i ] = toke.get_relationship_type();
                referenceType[ i ] = toke.getReferenceType();
                referenceLabel[ i ] = toke.getReferenceLabel();
                evidenceCode[ i ] = toke.get_evidence_code_full();
                if ( toke.get_evidence_description() != null ) {
                    evidenceDescription[ i ] = toke.get_evidence_description();
                } else {
                    evidenceDescription[ i ] = " ";
                }
                if ( toke.get_evidence_with() != null ) {
                    evidenceWith[ i ] = toke.get_evidence_with();
                } else {
                    evidenceWith[ i ] = "none";
                }

                // the annotated_by column stores the display_name and link to community_detail
                annotatedBy[ i ] ="<A href=\""+toke.get_annotated_by_link()+"\" target=\"_other\">"+ 
                                  toke.get_annotated_by_name() + "</a>" ;

                dateLastModified[ i ] = toke.get_date_last_modified().toString();
                // build the locus links for the annotated gene
                ArrayList links = new ArrayList();
                ArrayList slinks = new ArrayList(); 
                if ( toke.hasLocus() && toke.get_tair_object_type().equalsIgnoreCase("gene")) {
                    Iterator lociIter = toke.get_locus();
                    while ( lociIter.hasNext() ) { 
                        Locus locus = (Locus)lociIter.next();
                        String llink = "<a href=\"TairObject?type=locus&id=" + 
                            locus.get_locus_id().toString() + "\">" +
                            EmptyTextConverter.convert( locus.get_name() ) + "</a>/ ";
                        Long gene_id = AccessionManager.translateID(conn, "gene", toke.get_tair_object_id() );
                        TfcGene gene = new TfcGene(conn, gene_id);
                        llink = llink + "<a href=\"TairObject?type=gene&id=" +
                            gene.get_gene_id().toString() + "\">" + 
                            EmptyTextConverter.convert(gene.get_name() ) + "</a>";
                        links.add(llink);
                    
                        //get symbol links at the locus level.
                        String slink = "";
                        locus.populatePrimarySymbolData( conn );
                        Iterator symbolIter = locus.getPrimarySymbols();
                        while (symbolIter.hasNext() ){ 
                            Long symbol_id = (Long) symbolIter.next();
                            if (symbol_id != 0 ) { 
                                TfcSymbol sym = new TfcSymbol( conn, symbol_id );
                                slink = slink + sym.get_symbol() + "/ " + sym.get_full_name();
                            }
                        }
                        slinks.add(slink);
                    }                    
                } else if ( toke.get_tair_object_type().equalsIgnoreCase("locus") ) {
		            links.add( "<a href=\"TairObject?accession=locus:" + 
			        toke.get_tair_object_id().toString() + "\" target=\"_other\">" +
			        EmptyTextConverter.convert( toke.get_tair_object_name() ) + "</a>" );           
		            Long locus_id = AccessionManager.translateID(conn, "locus", toke.get_tair_object_id() );
                    Locus locus = new Locus(conn, locus_id);
                    
                    //get symbol links at the locus level.
                    String slink = "";
                    locus.populatePrimarySymbolData( conn );
                    Iterator symbolIter = locus.getPrimarySymbols();
                    while (symbolIter.hasNext() ){ 
                        Long symbol_id = (Long) symbolIter.next();
                        if ( symbol_id != 0 ) { 
                        TfcSymbol sym = new TfcSymbol( conn, symbol_id );
                        if (sym.get_symbol() != null){
                            slink = slink + sym.get_symbol();
                        }
                        if (sym.get_full_name() != null ) { 
                            slink = slink + "/ " + sym.get_full_name();
                        }
                        }
                    }
                    slinks.add(slink);
                }
                locusLinks[i] =  new String[ links.size() ];
                locusSymbolLinks[i] =  new String[ links.size() ];
                for ( int j = 0; j < links.size(); j ++ ) {
                    locusLinks[i][j] = ( String )links.get( j );
                    locusSymbolLinks[i][j] = ( String )slinks.get( j );
                } 

            }// null check on node_id
        } // looping through nodes
    }

    private String getTairObjectName( int row )  { return tairObjectName[row]; } 
    private String getTairObjectType( int row )  { return tairObjectType[row]; } 
    private String getRelationshipType( int row )  { return relationshipType[row]; } 
    private String getReferenceType( int row )  { return referenceType[row]; } 
    private String getReferenceLabel( int row )  { return referenceLabel[row]; } 
    private String getEvidenceCode( int row )  { return evidenceCode[row]; } 
    private String getEvidenceDescription( int row )  { return evidenceDescription[row]; } 
    private String getEvidenceWith( int row )  { return evidenceWith[row]; } 
    private String getAnnotatedBy( int row )  { return annotatedBy[row]; } 
    private String getDateLastModified( int row )  { return dateLastModified[row]; } 
    private String[] getLocusLinks( int row )  { return locusLinks[row]; }
    private String[] getLocusSymbolLinks( int row )  { return locusSymbolLinks[row]; }


    /**
     * @param columnName The column name of the temp table to be checked 
     * @return boolean representation of check for lookup column
     */
    public boolean isLookupColumn( String columnName ) {
        boolean isLookup = false;
        for ( int i = 0; i < getLookupColumnNames().length; i ++ ) {
            if ( columnName.equals( getLookupColumnNames()[i] ) ) isLookup = true;
        }
        return isLookup;
    }

    /**
     * @param row The integer representing the row of the table of data 
     * @param columnName The String representing the column name of the table of data
     * @param DBformat boolean representing whether we want data exactly how it is in the database
     * @return String representation of the compound data for the requested cell as a comma-delimited string
     */ 
    public String getDataAsString( int row, String columnName, boolean DBformat) {
        StringBuffer dataString = new StringBuffer();
        if ( columnName.equals( "tair_object_name" ) ) {
            dataString.append( getTairObjectName( row ) );
        }
        if ( columnName.equals( "tair_object_type" ) ) {
            dataString.append( getTairObjectType( row ) );
        }
        if ( columnName.equals( "relationship_type" ) ) {
            dataString.append( getRelationshipType( row ) );
        }
        if ( columnName.equals( "reference_type" ) ) {
            dataString.append( getReferenceType( row ) );
        }
        if ( columnName.equals( "reference_label" ) ) {
            dataString.append( getReferenceLabel( row ) );
        }
        if ( columnName.equals( "evidence_code" ) ) {
            dataString.append( getEvidenceCode( row ) );
        }
        if ( columnName.equals( "evidence_description" ) ) {
            dataString.append( getEvidenceDescription( row ) );
        }
        if ( columnName.equals( "evidence_with" ) ) {
            dataString.append( getEvidenceWith( row ) );
        }
        if ( columnName.equals( "annotated_by" ) ) {
            dataString.append( getAnnotatedBy( row ) );
        }
        if ( columnName.equals( "date_last_modified" ) ) {
            dataString.append( getDateLastModified( row ) );
        }
        if ( columnName.equals( "locus_links" ) ) {
            for ( int i = 0; i < getLocusLinks( row ).length; i ++ ) {
                if ( i > 0) dataString.append( ", " );
                dataString.append( getLocusLinks( row )[i] );
            }
        }
        if ( columnName.equals( "locus_symbol_links" ) ) {
            for ( int i = 0; i < getLocusSymbolLinks( row ).length; i ++ ) {
                if ( i > 0) dataString.append( ", " );
                dataString.append( getLocusSymbolLinks( row )[i] );
            }
        }
        return new String( dataString );
    }

    /**
     * @param row The integer representing the row of the table of data 
     * @param columnName The String representing the column name of the table of data
     * @return String array of the compound data for the requested cell, row in sub-result set  
     */
    public String[] getDataAsArray( int row, String columnName ) {
        if ( columnName.equals( "tair_object_name" ) ) {
            lookupData = new String[1];
            lookupData[0] = getTairObjectName( row ); 
        }
        if ( columnName.equals( "relationship_type" ) ) {
            lookupData = new String[1];
            lookupData[0] = getRelationshipType( row ); 
        }
        if ( columnName.equals( "reference_type" ) ) {
            lookupData = new String[1];
            lookupData[0] = getReferenceType( row ); 
        }
        if ( columnName.equals( "reference_label" ) ) {
            lookupData = new String[1];
            lookupData[0] = getReferenceLabel( row ); 
        }
        if ( columnName.equals( "evidence_code" ) ) {
            lookupData = new String[1];
            lookupData[0] = getEvidenceCode( row ); 
        }
        if ( columnName.equals( "evidence_description" ) ) {
            lookupData = new String[1];
            lookupData[0] = getEvidenceDescription( row ); 
        }
        if ( columnName.equals( "evidence_with" ) ) {
            lookupData = new String[1];
            lookupData[0] = getEvidenceWith( row ); 
        }
        if ( columnName.equals( "annotated_by" ) ) {
            lookupData = new String[1];
            lookupData[0] = getAnnotatedBy( row ); 
        }
        if ( columnName.equals( "date_last_modified" ) ) {
            lookupData = new String[1];
            lookupData[0] = getDateLastModified( row ); 
        }
        if ( columnName.equals( "locus_links" ) ) {
            lookupData = getLocusLinks( row );
        }
        if ( columnName.equals( "locus_symbol_links" ) ) {
            lookupData = getLocusSymbolLinks( row );
        }
        return lookupData;
    }

}
