/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAnnotationType;
import org.tair.utilities.Debugger;
import org.tair.utilities.TextConverter;

/**
 * KeywordSearchHelper is a utility class that allows external searches to integrate
 * with keyword searching.  KeywordSearchHelper provides methods that return SQL that
 * can be used as a sub-select in a larger search query to restrict items by keyword
 * criteria such as keyword, keyword type, relationship type and evidence code.  As input,
 * methods all take child_table as a parameter; this is the literal name of the database
 * table containing data objects that need to be retrieved using keyword criteria 
 * (i.e. Gene, ExpressionSet).  This value can be used to retrieve a single
 * AnnotationType entry that contains specific data that can be used to dynamically create
 * SQL to search for these data objects.  All SQL selects will return results as a list
 * of primary keys, the exact name of which is stored in AnnotationType along with
 * the name of the linking table to use when searching.
 */


public class KeywordSearchHelper {

  // track what tables are in query -- need to make sure to clear list
  // after creating every query to avoid problems when using same 
  // instance of KeywordSearchHelper to create multiple queries.
  private ArrayList tables = new ArrayList();
  


  /**
   * Creates SQL sub-select to retrieve data object primary keys using keyword, keyword type,
   * evidence codes and relationship type criteria.  Annotation type of search can be determined
   * from child table name. Given that information, the linking table to search, and the exact 
   * primary key column to retrieve (i.e. tair_object_id, reference_id etc.) can be determined 
   * from the annotation type data. This method can be used by other searches that have any 
   * variety of keyword searches embedded in them.  Any <code>null</code> values submitted for
   * search criteria will be ignored, allowing this method to be flexible for several types of
   * keyword searches.  If no criteria is submitted, or <code>null</code> child table name is
   * submitted, method will return <code>null</code>
   *
   * @param conn An active connection to the database
   * @param child_table Child table that is linked to keyword
   * @param keyword_term Keyword to find items with
   * @param keyword_method Search method (contains, exact etc.) to search for keyword_term by
   * @param keyword_type Keyword types to search keywords with
   * @param evidence Evidence codes to search for annotations by
   * @param relationship_type Relationship_types to find keywords with
   * @return SQL that will retrieve primary keys of type defined by annotation type associated 
   * with child_table name, that are joined to keyword, or synonyms or child terms of keyword
   * @exception SQLException thrown if a database error occurs.
   */
  public String getKeywordSql( DBconnection conn, String child_table, String keyword_term, 
  String keyword_method, String[] keyword_type, String[] evidence, String[] relationship_type ) throws SQLException {
    String searcher_sql = null;
    StringBuffer from_clause = null;
    StringBuffer where_clause = null;

    if ( child_table != null && ( ( keyword_term != null || 
					 ( keyword_type != null && !keyword_type[ 0 ].equalsIgnoreCase( "any" ) ) || 
					 ( evidence != null && !evidence[ 0 ].equalsIgnoreCase( "any" ) ) || 
					 ( relationship_type != null && !relationship_type[ 0 ].equalsIgnoreCase( "any" ) )
					 ) ) ) {
      
      from_clause = new StringBuffer();
      where_clause = new StringBuffer();
      appendAnnotationTypeInfo( conn, child_table, from_clause, where_clause );
      

      // if searching by both keyword term and keyword type, need to make
      // sure to always call appendKeywordTerm() first to properly join to
      // keyword using ShortestPath....yuk...
      if ( keyword_term != null ) {
	appendKeywordTerm( from_clause, where_clause, keyword_term, keyword_method );
      }
      
      if ( evidence != null && !evidence[ 0 ].equalsIgnoreCase( "any" ) ) {
	appendEvidence( where_clause, evidence );
      }
      
      if ( keyword_type != null && !keyword_type[ 0 ].equalsIgnoreCase( "any" ) ) {
	appendKeywordType( from_clause, where_clause, keyword_type );
      }
      
      if ( relationship_type != null && !relationship_type[ 0 ].equalsIgnoreCase( "any" ) ) {
	appendRelationshipType( from_clause, where_clause, relationship_type );
      }
      
      searcher_sql = " ( " + from_clause.toString() + where_clause.toString() + " ) ";
      
      Debugger.println( Debugger.logMsg( this, "searcher_sql = " + searcher_sql ) );

      // empty table list to make sure we don't conflict w/future queries
      tables.clear();
    }

    return searcher_sql;
  }
    
  public Map getKeywordSql( DBconnection conn, Map search_params, StringBuffer from_clause, StringBuffer where_clause) { 
    String keyword_term = null;
    String keyword_method = null;
    String extdb_id = null;
    String[] keyword_type = null;
    String[] evidence = null;
    String[] relationship_type = null;
    String query = null;
    Map return_query = new TreeMap();

    keyword_term = (String) search_params.get( "keyword_term" );
    keyword_method = (String) search_params.get( "keyword_method" );
    extdb_id = (String) search_params.get("extdb_id");
    keyword_type = (String[]) search_params.get( "keyword_type" );
    evidence = (String[]) search_params.get( "evidence" );
    relationship_type = (String[]) search_params.get( "relationship_type" );
      
    if ( keyword_term != null || 
	( keyword_type != null && !keyword_type[ 0 ].equalsIgnoreCase( "any" ) ) || 
	( extdb_id != null ) || 
    ( evidence != null && !evidence[ 0 ].equalsIgnoreCase( "any" ) ) || 
	( relationship_type != null && !relationship_type[ 0 ].equalsIgnoreCase( "any" ) ) ) {
        from_clause.append(", TairObject_Keyword lt ");
        where_clause.append(" AND ( g1.tair_object_id = lt.tair_object_id ");
        where_clause.append(" OR l.tair_object_id = lt.tair_object_id ) ");
      
        if ( keyword_term != null ) {
	        appendKeywordTerm( from_clause, where_clause, keyword_term, keyword_method );
        }
        
        if ( extdb_id != null ) {
            appendExtdb_id(from_clause, where_clause, extdb_id );
        }

        if ( evidence != null && !evidence[ 0 ].equalsIgnoreCase( "any" ) ) {
	        appendEvidence( where_clause, evidence );
        }
      
        if ( keyword_type != null && !keyword_type[ 0 ].equalsIgnoreCase( "any" ) ) {
	        appendKeywordType( from_clause, where_clause, keyword_type );
        }
      
        if ( relationship_type != null && !relationship_type[ 0 ].equalsIgnoreCase( "any" ) ) {
	        appendRelationshipType( from_clause, where_clause, relationship_type );
        }
      
    
    }
    return_query.put("from", from_clause);
    return_query.put("where", where_clause);
    return return_query;
  }
  
  public String getKeywordSql( DBconnection conn, String child_table, String keyword_term, String keyword_method, 
                            String extdb_id, String[] keyword_type, String[] evidence, String[] relationship_type ) 
                            throws SQLException {
    String searcher_sql = null;
    StringBuffer from_clause = null;
    StringBuffer where_clause = null;
    System.out.println("gets in here");
    if ( child_table != null && ( ( keyword_term != null || 
					 ( keyword_type != null && !keyword_type[ 0 ].equalsIgnoreCase( "any" ) ) || 
					 ( extdb_id != null ) ||
                     ( evidence != null && !evidence[ 0 ].equalsIgnoreCase( "any" ) ) || 
					 ( relationship_type != null && !relationship_type[ 0 ].equalsIgnoreCase( "any" ) )
					 ) ) ) {
      System.out.println("something is not null"); 
      from_clause = new StringBuffer();
      where_clause = new StringBuffer();
      appendAnnotationTypeInfo( conn, child_table, from_clause, where_clause );
      

      // if searching by both keyword term and keyword type, need to make
      // sure to always call appendKeywordTerm() first to properly join to
      // keyword using ShortestPath....yuk...
      if ( keyword_term != null ) {
	appendKeywordTerm( from_clause, where_clause, keyword_term, keyword_method );
      }
     
      if ( extdb_id != null ) {
    appendExtdb_id(from_clause, where_clause, extdb_id );
      }


      if ( evidence != null && !evidence[ 0 ].equalsIgnoreCase( "any" ) ) {
	appendEvidence( where_clause, evidence );
      }
      
      if ( keyword_type != null && !keyword_type[ 0 ].equalsIgnoreCase( "any" ) ) {
	appendKeywordType( from_clause, where_clause, keyword_type );
      }
      
      if ( relationship_type != null && !relationship_type[ 0 ].equalsIgnoreCase( "any" ) ) {
	appendRelationshipType( from_clause, where_clause, relationship_type );
      }
      
      searcher_sql = " ( " + from_clause.toString() + where_clause.toString() + " ) ";
      
      Debugger.println( Debugger.logMsg( this, "searcher_sql = " + searcher_sql ) );

      // empty table list to make sure we don't conflict w/future queries
      tables.clear();
    }

    return searcher_sql;
  }
  
  /**
   * Creates SQL sub-select to find object ids by keyword criteria. This method acts as
   * a convenience wrapper to the main getKeywordSql() method by retrieving all user-submitted
   * search criteria from the submitted map of search params.  When using embedded jsp includes
   * to add keyword searching to another search, this method can be used to retrieve params 
   * using known field names in the JSP include and create search SQL to find objects using
   * info in AnnotationType (retrieved using child_table).
   *
   * <p>
   * This method will look for the following search terms in the search_params map (field names
   * defined by JSP include):
   *
   * <ul>
   * <li>keyword_term - keyword value to search for</li>
   * <li>keyword_method - search method (starts with, contains etc.) to search for keyword_term by</li>
   * <li>keyword_type - Keyword type(s) to restrict keyword_term matches to</li>
   * <li>evidence - Evidence code(s) to restrict annotation matches to</li>
   * <li>relationship_type - Relationship type(s) to restrict annotation matches to</li>
   * </ul>
   *
   * @param conn An active connection to the database
   * @param child_table Child table name to retrieve keyword associations to
   * @param search_params User input from search form
   * @return SQL to find object ids by submitted keyword criteria
   * @exception SQLException thrown if a database error occurs
   */
  public String getIncludeSql( DBconnection conn, String child_table, Map search_params ) throws SQLException {
    // keyword type from the search params map will be keyword_type_id -- so no need to join to the KeywordType table
    // evidence code from the search params map will be evidence_code -- so will need to join to EvidenceDescription
    // if evidence code is provided -- also need to join to TairObjKeyEvidence table
    
    String keyword_term = null;
    String keyword_method = null;
    String extdb_id = null;
    String[] keyword_type = null;
    String[] evidence = null;
    String[] relationship_type = null;
    String query = null;

    if ( child_table != null ) {
      keyword_term = (String) search_params.get( "keyword_term" );
      keyword_method = (String) search_params.get( "keyword_method" );
      extdb_id = (String) search_params.get("extdb_id");
      keyword_type = (String[]) search_params.get( "keyword_type" );
      evidence = (String[]) search_params.get( "evidence" );
      relationship_type = (String[]) search_params.get( "relationship_type" );
      
      if ( keyword_term != null || 
	   ( keyword_type != null && !keyword_type[ 0 ].equalsIgnoreCase( "any" ) ) || 
	   ( extdb_id != null ) || 
       ( evidence != null && !evidence[ 0 ].equalsIgnoreCase( "any" ) ) || 
	   ( relationship_type != null && !relationship_type[ 0 ].equalsIgnoreCase( "any" ) ) ) {

	query = getKeywordSql( conn, 
			       child_table, 
			       keyword_term, 
			       keyword_method, 
			       extdb_id, 
                   keyword_type, 
			       evidence, 
			       relationship_type );
      }
    }
    System.out.println("query: " + query);
    return query;
  }
  
  /**
   * Creates SQL that retrieves of objects related to submitted keyword (or its synonyms and
   * child terms) without using any other qualification such as relationship type, keyword type
   * or evidence code. This method is a convenience method to getKeywordSql() that simply
   * feeds in <code>null</code> values for all other search criteria as arguments to that method.
   *
   * @param conn An active connectin to the database
   * @param child_table Child table that is linked to keyword
   * @param keyword_term Keyword to find items with
   * @param keyword_method Search method (contains, exact etc.) to search for keyword_term by
   * @return SQL that will retrieve primary keys of type defined by annotation type associated 
   * with child_table name, that are joined to keyword, or synonyms or child terms of keyword
   * @exception SQLException thrown if a database error occurs.
   */
  public String getUnqualifiedKeywordSql( DBconnection conn, String child_table, String keyword_term, String keyword_method ) throws SQLException {
    // null placeholders for getKeywordSql argument list
    String nullRelationshipType[] = null;
    String nullEvidence[] = null;
    String nullKeywordType[] = null;
    String query = null;


    if ( child_table != null && keyword_term != null ) {
      query = getKeywordSql( conn, 
			     child_table, 
			     keyword_term, 
			     keyword_method, 
			     nullKeywordType, 
			     nullEvidence,
			     nullRelationshipType );
    }

    return query;
  }


  /**
   * Creates SQL that retrieves of objects related to submitted keyword (or its synonyms and
   * child terms) using submitted literal value of relationship_type. This method is a convenience 
   * wrapper method to getKeywordSql() that simply feeds in <code>null</code> values for all other 
   * search criteria as arguments to that method.
   *
   * @param conn An active connection to the database
   * @param relationship_type Relationship_type to find keywords by
   * @param child_table Child table that is linked to keyword
   * @param keyword_term Keyword to find items with
   * @param keyword_method Search method (contains, exact etc.) to search for keyword_term by
   * @return SQL that will retrieve primary keys of type implied by relationship_type_id that are joined
   * to keyword with relationship_type_id
   * @exception SQLException thrown if a database error occurs.
   */
  public String getRelationshipTypeEmbeddedSql( DBconnection conn, String relationship_type,  
  String child_table, String keyword_term, String keyword_method ) throws SQLException {
    // null placeholders for getKeywordSql argument list
    String nullEvidence[] = null;
    String nullKeywordType[] = null;
    String query = null;

    // append relationship type as single element string array - ugly, but lets
    // us keep one method to handle all relationship type stuff
    String relationshipTypeArr[] = null;

    if ( relationship_type != null && child_table != null && keyword_term != null ) {
      relationshipTypeArr = new String[] { relationship_type };

      query = getKeywordSql( conn, 
			     child_table, 
			     keyword_term, 
			     keyword_method, 
			     nullKeywordType, 
			     nullEvidence,
			     relationshipTypeArr );
    }

    return query;
  }
  

  /**
   * Creates SQL that retrieves of objects related to submitted keyword (or its synonyms and
   * child terms) using submitted literal value of relationship_type. This method differs from
   * other methods in that allows searching using multiple keyword ids to find annotations. This
   * is helpful in situations where search form uses parameter lists generated by the database,
   * which allows searching by keyword id directly (as in searching by experiment category).
   *
   * @param conn An active connection to the database
   * @param relationship_type Relationship_type to find keywords by
   * @param child_table Child table that is linked to keyword
   * @param keyword_ids Keyword ids to find items with
   * @return SQL that will retrieve primary keys of type implied by relationship_type_id that are joined
   * to keyword with relationship_type_id
   * @exception SQLException thrown if a database error occurs.
   */
  public String getRelationshipTypeEmbeddedSql( DBconnection conn, String relationship_type,  String child_table, Long[] keyword_ids ) throws SQLException {
    StringBuffer from_clause = new StringBuffer();
    StringBuffer where_clause = new StringBuffer();
    
    if ( relationship_type != null && child_table != null && keyword_ids != null ) {
      appendAnnotationTypeInfo( conn, child_table, from_clause, where_clause );

      appendKeywordID( where_clause, keyword_ids );

      // append relationship type as single element string array - ugly, but lets
      // us keep one method to handle all relationship type stuff
      appendRelationshipType( from_clause, where_clause, new String[] { relationship_type } );
    }

    // empty table list to make sure we don't conflict w/future queries
    tables.clear();

    return "(" + from_clause.toString() + where_clause.toString() + ") ";
  }




  // creates basic select of type specific primary key from linking table using info. stored in AnnotationType (which
  // can be retrieved using child_table)
  private void appendAnnotationTypeInfo( DBconnection conn, String child_table, StringBuffer from_clause, StringBuffer where_clause ) throws SQLException {
    TfcAnnotationType annotationType = new TfcAnnotationType( conn, child_table );
    from_clause.append( "select lt." + annotationType.getColumnName() +
		 " from " + annotationType.getLinkingTableName() + " lt" 
		 ); 
    where_clause.append( " where lt.annotation_type_id = " + annotationType.getAnnotationTypeID().toString() + " " );
    //where_clause.append( " where (lt.annotation_type_id = 8 OR lt.annotation_type_id = 1) " );
  }
  


  // add search for keyword using synonym and child terms
  private void appendKeywordTerm( StringBuffer from_clause, StringBuffer where_clause, String term, String keyword_method ) {
    if ( term != null ) {
      checkForKeywordTermTables( from_clause, where_clause, true );
      where_clause.append( "AND ks.keyword LIKE " + 
			   TextConverter.dbQuote( TextConverter.convertEnds( term.toUpperCase(), keyword_method ) ) + 
			   " ESCAPE '\\\'"
			   );
    }
  }
 
  // do simple search for keyword in linking table
  private void appendExtdb_id( StringBuffer from_clause, StringBuffer where_clause, String term ) {
    if (term != null ) {
        checkForKeywordTermTables(from_clause, where_clause, true );
        where_clause.append(" AND ks.keyword_id = (select keyword_id FROM Keyword WHERE extdb_id = ").append(TextConverter.dbQuote(term)).append(") ");
    }
  }

  // do simple search for keyword in linking table using literal keyword ids
  private void appendKeywordID( StringBuffer where_clause, Long[] keyword_ids ) {
    if ( keyword_ids != null ) {
      where_clause.append( "AND lt.keyword_id " + getMultipleSelectorPredicate( keyword_ids ) );
    }
  }


  // add exists() sub-clause to search by evidence codes
  private void appendEvidence( StringBuffer where_clause, String[] evidence ) {
    if ( evidence != null ) {
      where_clause.append( " AND EXISTS ( " +
			   "select 'X' " +
			   "from TairObjKeyEvidence toke, EvidenceDescription ed " +
			   "where toke.evidence_description_id = ed.evidence_description_id " +
			   "and lt.tair_object_id = toke.tair_object_id " +
			   "and lt.keyword_id = toke.keyword_id " +
			   "and lt.relationship_type_id = toke.relationship_type_id " +
			   "and ed.evidence_code " +
			   getMultipleSelectorPredicate( evidence ) + " ) " );
      
    }
  }
  
  
  // add keyword type criteria
  private void appendKeywordType( StringBuffer from_clause, StringBuffer where_clause, String[] keywordType ) {
    if ( keywordType != null ) {
      checkForKeywordTermTables( from_clause, where_clause, false );
      where_clause.append( " AND ( ks.keyword_type_id " + getMultipleSelectorPredicate( keywordType ) + " ) ");
    }
  }
  
  
  // add relationship type criteria
  private void appendRelationshipType( StringBuffer from_clause, StringBuffer where_clause, String[] relationship_type ) {
    if ( relationship_type != null ) {
      checkForRelationshipTables( from_clause, where_clause );
      where_clause.append( "AND rt.relationshiptype_type " + getMultipleSelectorPredicate( relationship_type ) );
    }
  }




  // add table joins needed for searching keyword; optionally use child links in ShortestPath  - if searching
  // keyword term alone, this will be true, if searching by keyword type alone this will be false
  private void checkForKeywordTermTables( StringBuffer from_clause, StringBuffer where_clause, boolean addChildLinks) {
    if ( !this.tables.contains( "KeywordSynonym_wrk" ) ) {
      if ( addChildLinks ) {
	from_clause.append( ", KeywordSynonym_wrk ks, ShortestPath sp " );
	where_clause.append( " AND lt.keyword_id = sp.child_term_id "  );
	where_clause.append( " AND ks.keyword_id = sp.parent_term_id "  );
	where_clause.append( " AND ( ks.has_direct_links = 'T' "  );
	where_clause.append( " OR ks.has_child_links = 'T' ) "  );
      } else {
	from_clause.append( " , KeywordSynonym_wrk ks " );
	where_clause.append( " AND lt.keyword_id = ks.keyword_id " );
      }
      this.tables.add( "KeywordSynonym_wrk" );
    }
  }
  
  
  // check to see if the tables needed for searching on relationship are included in the "from" list
  private void checkForRelationshipTables( StringBuffer from_clause, StringBuffer where_clause ) {
    from_clause.append( " , RelationshipType rt " );
    where_clause.append( " AND lt.relationship_type_id = rt.relationship_type_id " );
  }
  
  
  
  // create "IN ( ... )" clause containing all submitted values
  private String getMultipleSelectorPredicate( String[] values ) {
    StringBuffer inClause = new StringBuffer();
    boolean first = true;
    
    if ( values != null && values.length > 0 && !values[ 0 ].equalsIgnoreCase( "any" ) ) {
      inClause.append( " IN (" );
      for ( int i = 0; i < values.length; i++ ) {
	if ( !first ) {
	  inClause.append( ", " );
	}
	inClause.append( TextConverter.dbQuote( values[ i ] ) );
	first = false;
      }
      inClause.append( ") " );
    }
    return inClause.toString();
  }
    
  // create "IN ( ... )" clause containing all submitted values - slightly different
  // version to handle Long array instead of Strings
  private String getMultipleSelectorPredicate( Long[] values ) {
    StringBuffer inClause = new StringBuffer();
    boolean first = true;
    
    if ( values != null && values.length > 0 ) {
      inClause.append( " IN (" );
      for ( int i = 0; i < values.length; i++ ) {
	if ( !first ) {
	  inClause.append( ", " );
	}
	inClause.append( TextConverter.dbQuote( values[ i ] ) );
	first = false;
      }
      inClause.append( ") " );
    }
    return inClause.toString();
  }

  /**
   * puts the parameters from the request that are keyword related into the parmeter map that the searcher will use
   * this way the key map will be consistent when using the include jsp that contains the keyword search paramters
   * available to the user on the search form
   * @param request the http request object that contains the user selected search criteria 
   * @param Map the map object that will include the appended keyword criteria that the searcher will use to create the search sql
   */
  public void putKeywordIncludeParams( HttpServletRequest request, Map search_params ) {
    // add in keyword search params here, param names taken from kw_type_evid.jsp as an include on the xxx_form.jsp 
    if ( !TextConverter.isEmpty( request.getParameter( "keyword_term" ) ) ) {
      search_params.put( "keyword_term", request.getParameter( "keyword_term" ) );
      search_params.put( "keyword_method", request.getParameter( "keyword_method" ) );
    }
    if ( !TextConverter.isEmpty( request.getParameter( "keyword_type" ) ) ) search_params.put( "keyword_type",( String[] )request.getParameterValues( "keyword_type" ) );
    if ( !TextConverter.isEmpty( request.getParameter( "evidence" ) ) ) search_params.put( "evidence",( String[] )request.getParameterValues( "evidence" ) );
    if ( !TextConverter.isEmpty( request.getParameter( "extdb_id" ) ) ) search_params.put("extdb_id", (String)request.getParameter( "extdb_id" ) );
  }

}
    
  
