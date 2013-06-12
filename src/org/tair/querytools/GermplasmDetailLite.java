//------------------------------------------------------------------------------
// $Revision: 1.20 $
// $Date: 2006/01/26 23:49:28 $
//------------------------------------------------------------------------------

package org.tair.querytools;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAnalysisReference;
import org.tair.tfc.TfcCommunication;
import org.tair.tfc.TfcGermplasm;
import org.tair.tfc.TfcPublication;
import org.tair.tfc.TfcStock;
import org.tair.tfc.TfcStockAvailabilityType;
import org.tair.utilities.AccessionManager;
import org.tair.utilities.DataConstants;
import org.tair.utilities.EmptyTextConverter;
import org.tair.utilities.RecordNotFoundException;
import org.tair.utilities.TextConverter;

/**
 * GermplasmDetail is a composite class to represent all information
 * associated with an entry in the Germplasm table for display on the
 * germplasm detail page. GermplasmDetail contains germplasm info,
 * data on the germplasm's associated taxon, species variant, collections
 * of associated polymorphisms, clones, stocks and other germplasms
 * in addition to all information in the <code>TairObjectDetail</code>
 * superclass.
 */

public class GermplasmDetailLite extends TairObjectDetail {

  public static final int PARENT_LIMIT = 20;
  public static final int PROGENY_LIMIT = 10;
  public static final int SET_POOL_LIMIT = 10;
  public static final int POLY_LIMIT = 10;
  public static final int COMMENT_LIMIT = 10;

    public TfcGermplasm germplasm;

    public TfcStock stock;

    public String name;

    public Map stockInfo;

    public Map otherNameInfo;
    
    public Map taxonInfo;

    public Map accessionInfo;

    public Map parentInfo;

    public Map progenyInfo;

    public Map polymorphismInfo;

    public Map associatedConstructInfo;

    public Map phenotypeInfo;

    public Map imageInfo;
    
    public Map URLInfo;

    public Map publicationInfo;

    public Map typeInfo;

    public Map includedSetPoolInfo;

    public Map memberSetPoolInfo;

    public Map tairAccessionInfo;

    public Map attributionInfo;

    public Map externalLinkInfo;

    public Map annotationInfo;

    public Map commentInfo;

    public Map communicationInfo;

    /**
     * Creates an empty instance of GermplasmDetail
     */
    public GermplasmDetailLite() {
        germplasm = new TfcGermplasm();
    }



    /**
     * Creates an instance of GermplasmDetail that represents the data
     * associated to the submitted tair_object_id.
     *
     * @param conn An active connection to the database
     * @param tair_object_id Tair object id to retrieve data
     * @throws RecordNotFoundException if no entry found for tair_object_id.
     * @throws SQLException if a database error occurs
     */
    public GermplasmDetailLite( DBconnection conn, Long tair_object_id )
     throws SQLException {

     get_information( conn, tair_object_id );
    }


    /**
     * Creates an instance of GermplasmDetail that represents the data
     * associated to the submitted germplasm name.
     *
     * @param conn An active connection to the database
     * @param name Germplasm name to retrieve data for
     * @throws RecordNotFoundException if no entry found for name
     * @throws SQLException if a database error occurs
     */
    public GermplasmDetailLite( DBconnection conn, String name )
     throws RecordNotFoundException, SQLException {

     get_information( conn, name );
    }


    /**
     * Retrieves data for submitted germplasm name and stores in member objects
     *
     * @param conn An active connection to the database
     * @param name Name to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted name
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, String name )
     throws RecordNotFoundException, SQLException {

     Long id = TfcGermplasm.retrieveTairObjectID( conn, name );

     if ( id == null ) {
         throw new RecordNotFoundException( "No germplasm found " +
                                "with name: " + name );
     }

     get_information( conn, id );
    }

    /**
     * Retrieves data for submitted tair object id and stores in member objects
     *
     * @param conn An active connection to the database
     * @param tair_object_id ID to retrieve data for
     * @throws RecordNotFoundException if no row found for submitted id
     * @throws SQLException if a database error occurs
     */
    public void get_information( DBconnection conn, Long tair_object_id )
     throws RecordNotFoundException, SQLException {

	populateGermplasm(conn, tair_object_id);

	populateStock(conn, tair_object_id);

	populateName(conn);

	populateStockInfo(conn);

	populateOtherNames(conn);
	
	populateTaxonInfo(conn);

	populateAccessionInfo(conn);

	populateParentInfo(conn);

	populateProgenyInfo(conn);

	/* Chromosomal Constitution: get from germplasm object */

	populatePolymorphismInfo(conn);

	/* Mutagen Applied to Strain: get from germplasm object */

	populateAssociatedConstructInfo(conn);
	
	populatePhenotypeInfo(conn);

	populateImageInfo(conn);

    populateURLInfo(conn);

	/* Additional Information: get from germplasm.descirption & stock.description */

	/* ABRC Comments: get from stock.ABRC_comments */

	populatePublicationInfo(conn);

	/* Special Growth Conditions: get from germplasm.special_growth_conditions */

	/* For commercial price see TfcStock.get_format_commercial_price */
	/* Date Released: Fees: Restrictions: Format Shipped: should be in stock */

	populateTypeInfo(conn);

	populateIncludedSetPoolInfo(conn);

	populateMemberSetPoolInfo(conn);
	
	/* TAIR Accessions: get from the germplasm and stock object */
	populateTairAccessionInfo(conn);

	populateAttributionInfo(conn);

	/* Date Last Modified: get from germplasm object */

	populateExternalLinkInfo(conn);

	populateAnnotationInfo(conn);

	populateCommentInfo(conn);

	populateCommunicationInfo(conn);


    }


    private void populateCommunicationInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	communicationInfo = new HashMap();

	Boolean has_communications = Boolean.FALSE;

	String query = 
	    " SELECT * " +
	    " FROM TairObj_Ref t, Communication c " +
	    " WHERE t.reference_id = c.reference_id " +
	    " AND t.tair_object_id = " + germplasm.get_tair_object_id();


	List<Map<String,Object>> communications = executeQuery(conn,query);
	Map<String,Boolean> headerInfo = null;

	if (communications.size() > 0) {
	    has_communications = Boolean.TRUE;
	    communicationInfo.put("communications", communications);
	    headerInfo = getHeaderInfo(communications);
	    communicationInfo.put("header_info", headerInfo);
	}

	communicationInfo.put("has_communications", has_communications);
    }


    private void populateCommentInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	commentInfo = new HashMap();

	Boolean has_comments = Boolean.FALSE;

	String query = 
	    " SELECT * " +
	    " FROM Notepad n, Person p " +
	    " WHERE n.status = 'active' " + 
	    " AND n.person_id = p.person_id " +
	    " AND n.tair_object_id = " + germplasm.get_tair_object_id() + " " +
	    " ORDER BY n.date_entered DESC ";


	List<Map<String,Object>> comments = executeQuery(conn,query);
	Map<String,Boolean> headerInfo = null;

	if (comments.size() > 0) {
	    has_comments = Boolean.TRUE;
	    commentInfo.put("comments", comments);
	    headerInfo = getHeaderInfo(comments);
	    commentInfo.put("header_info", headerInfo);
	}

	commentInfo.put("has_comments", has_comments);
    }

    private void populateAnnotationInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	annotationInfo = new HashMap();

	Boolean has_annotations = Boolean.FALSE;

	String query = 
	    " SELECT * " +
	    " FROM Annotation a " + 
	    " WHERE a.tair_object_id = " + germplasm.get_tair_object_id() + " " +
	    " ORDER BY a.date_entered  desc ";

	List<Map<String,Object>> annotations = executeQuery(conn,query);
	Map<String,Boolean> headerInfo = null;

	if(annotations.size() > 0) {
	    has_annotations = Boolean.TRUE;
	    annotationInfo.put("annotations", annotations);
	    headerInfo = getHeaderInfo(annotations);
	    annotationInfo.put("header_info", headerInfo);
	}

	for ( Map<String,Object> annotation : annotations ) {
	    annotation.put("has_source", Boolean.FALSE);
	    if (!TextConverter.isEmpty((String) annotation.get("annotated_by_id"))) {
		annotation.put("has_source", Boolean.TRUE);
		annotation.put("source", getAnnotationSource(conn,annotation));
	    }
	}


	annotationInfo.put("has_annotations", has_annotations);
    }


    private Map<String,Object> getAnnotationSource(DBconnection conn, Map<String,Object> annotation) 
	throws RecordNotFoundException, SQLException {
	List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();

	String query =
	    " SELECT  p.community_id,  p.first_name + ' ' + p.last_name as name, c.community_type " + 
	    " FROM Person p, Community c " + 
	    " WHERE p.community_id = c.community_id " +
	    " AND p.community_id = " + annotation.get("annotated_by_id");
	    
	result = executeQuery(conn, query);
	
	if (result.size() > 0) {
	    return result.get(0);
	}

	query =
	    " SELECT o.community_id, o.name, c.community_type " +
	    " FROM   Organization o, Community c " + 
	    " WHERE o.community_id = c.community_id " +
	    " AND o.community_id = " + annotation.get("community_id"); 
	    
	result = executeQuery(conn, query);
	if (result.size() > 0) {
	    return result.get(0);
	}

	return new HashMap<String,Object>();
    }


    private void populateExternalLinkInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	externalLinkInfo = new HashMap();

	Boolean has_external_link = Boolean.FALSE;

	String query = 
	    " SELECT  toel.*, el.* " +
	    " FROM TairObject_ExternalLink toel, ExternalLink el " +
	    " WHERE toel.external_link_id = el.external_link_id " +
	    " AND toel.tair_object_id = " + germplasm.get_tair_object_id();

	List<Map<String,Object>> external_links = executeQuery(conn,query);
	Map<String,Boolean> headerInfo = null;

	if (external_links.size() > 0) {
	    has_external_link = Boolean.TRUE;
	    externalLinkInfo.put("external_links",external_links);
	    headerInfo = getHeaderInfo(external_links);
	}
	

	externalLinkInfo.put("has_external_link", has_external_link);
    }


    private void populateAttributionInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	attributionInfo = new HashMap();

	Boolean has_attribution = Boolean.FALSE;

	if (stock != null) {
	    String query = 
		" SELECT a.* " +
		" FROM Attribution a " +
		" WHERE a.tair_object_id = " + stock.get_tair_object_id(); 

	    List<Map<String,Object>> attributions = executeQuery(conn,query);
	    Map<String,Boolean> headerInfo = null;

	    if (attributions.size() > 0) {
		has_attribution = Boolean.TRUE;
		attributionInfo.put("attributions", attributions);
		headerInfo = getHeaderInfo(attributions);
		attributionInfo.put("header_info", headerInfo);
		headerInfo.put("has_type", headerInfo.get("has_attribution_type_id"));
        headerInfo.put("has_community", headerInfo.get("has_community_id"));
        headerInfo.put("has_date", headerInfo.get("has_date"));
	    }

	    for (Map<String,Object> attribution : attributions) {
		
		attribution.put("has_type", Boolean.FALSE);
		if (!TextConverter.isEmpty((String) attribution.get("attribution_type_id"))) {
		    attribution.put("type", getAttributionType(conn, attribution));
		    attribution.put("has_type", Boolean.TRUE);
		}

		attribution.put("has_community", Boolean.FALSE);
		if (!TextConverter.isEmpty((String) attribution.get("community_id"))) {
		    attribution.put("community", getAttributionCommunity(conn, attribution));
		    attribution.put("has_community", Boolean.TRUE);
		}


        attribution.put("has_attribution_date", Boolean.FALSE);
        if (!TextConverter.isEmpty((String) attribution.get("attribution_date"))) {
            attribution.put("attribution_date", attribution.get("attribution_date"));
            attribution.put("has_attribution_date", Boolean.TRUE); 
        }
	    }

	}


	attributionInfo.put("has_attribution", has_attribution);
    }



    private Map<String,Object> getAttributionType(DBconnection conn, Map<String,Object> attribution) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    " Select a.* " +
	    " FROM AttributionType a " +
	    " WHERE a.attribution_type_id = " + attribution.get("attribution_type_id");
	
	return executeQuery(conn, query).get(0);
    }

    
    private List<Map<String,Object>> getAttributionCommunity(DBconnection conn, Map<String,Object> attribution) 
	throws RecordNotFoundException, SQLException {
	List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();

	String query =
	    " SELECT  p.community_id,  p.first_name + ' ' + p.last_name as name, c.community_type " + 
	    " FROM Person p, Community c " + 
	    " WHERE p.community_id = c.community_id " +
	    " AND p.community_id = " + attribution.get("community_id");
	    
	result.addAll(executeQuery(conn, query));

	query =
	    " SELECT o.community_id, o.name, c.community_type " +
	    " FROM   Organization o, Community c " + 
	    " WHERE o.community_id = c.community_id " +
	    " AND o.community_id = " + attribution.get("community_id"); 
	    
	result.addAll(executeQuery(conn, query));

	return result;
    }


    private void populateTairAccessionInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	tairAccessionInfo = new HashMap();

	String germplasm_accession = 
	    AccessionManager.getAccession("germplasm", germplasm.get_tair_object_id() );

	tairAccessionInfo.put("germplasm_accession", germplasm_accession);

	if (stock != null) {
	    String stock_accession = 
		AccessionManager.getAccession( "stock", stock.get_tair_object_id() );
	    tairAccessionInfo.put("stock_accession", stock_accession);
	}


    }

    private void populateMemberSetPoolInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	memberSetPoolInfo = new HashMap();

	Boolean has_member_set_pool = Boolean.FALSE;

	if (stock != null) {
	    String query =
		" SELECT s.stock_id, s.name, ts.relationship_type, s.stock_type_id " +
		" FROM TairObject_Stock ts, Stock s " +
		" WHERE ts.tair_object_id = s.tair_object_id " +
		" AND ts.stock_id = " + stock.get_stock_id();

	    List<Map<String,Object>> member_set_pool = executeQuery(conn,query);
	    Map<String,Boolean> headerInfo = null;

	    if (member_set_pool.size() > 0) {
		has_member_set_pool = Boolean.TRUE;
		memberSetPoolInfo.put("member_set_pool", member_set_pool);
		headerInfo = getHeaderInfo(member_set_pool);
		memberSetPoolInfo.put("header_info", headerInfo);
		headerInfo.put("has_descriptions", Boolean.FALSE);
	    }

	    for (Map<String,Object> stock : member_set_pool) {

		stock.put("has_type", Boolean.FALSE);
		if (!TextConverter.isEmpty((String) stock.get("stock_type_id"))) {
		    stock.put("type", getStockType(conn, stock));
		    stock.put("has_type", Boolean.TRUE);
		}

		stock.put("has_descriptions", Boolean.FALSE);
		List<Map<String,Object>> descriptions = getStockGermplasmDescriptions(conn, stock);
		stock.put("descriptions", descriptions);
		if (descriptions.size() > 0) {
		    stock.put("has_descriptions", Boolean.TRUE);
		    headerInfo.put("has_descriptions", Boolean.TRUE);
		}
		
	    }

	}

	memberSetPoolInfo.put("has_member_set_pool", has_member_set_pool);
    }




    private void populateIncludedSetPoolInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	includedSetPoolInfo = new HashMap();

	Boolean has_included_set_pool = Boolean.FALSE;

	if (stock != null) {
	    String query =
		" SELECT s.stock_id, s.name, ts.relationship_type, s.stock_type_id " +
		" FROM TairObject_Stock ts, Stock s " +
		" WHERE ts.stock_id = s.stock_id " +
		" AND ts.tair_object_id = " + stock.get_tair_object_id();

	    List<Map<String,Object>> included_set_pool = executeQuery(conn,query,SET_POOL_LIMIT);
	    Map<String,Boolean> headerInfo = null;

	    if (included_set_pool.size() > 0) {
		has_included_set_pool = Boolean.TRUE;
		includedSetPoolInfo.put("included_set_pool", included_set_pool);
		headerInfo = getHeaderInfo(included_set_pool);
		includedSetPoolInfo.put("header_info", headerInfo);
		includedSetPoolInfo.put("count", getCount(conn, query));
		headerInfo.put("has_descriptions", Boolean.FALSE);
	    }

	    for (Map<String,Object> stock : included_set_pool) {

		stock.put("has_type", Boolean.FALSE);
		if (!TextConverter.isEmpty((String) stock.get("stock_type_id"))) {
		    stock.put("type", getStockType(conn, stock));
		    stock.put("has_type", Boolean.TRUE);
		}

		List<Map<String,Object>> descriptions = getStockGermplasmDescriptions(conn, stock);
		stock.put("descriptions", descriptions);
		stock.put("has_descriptions", Boolean.FALSE);
		if (descriptions.size() > 0) {
		    stock.put("has_descriptions", Boolean.TRUE);
		    headerInfo.put("has_descriptions", Boolean.TRUE);
		}
		
	    }

	}

	includedSetPoolInfo.put("has_included_set_pool", has_included_set_pool);
    }



    private List<Map<String,Object>> getStockGermplasmDescriptions(DBconnection conn, Map<String,Object> stock) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    " SELECT g.description " +
	    " FROM TairObject_Stock ts, Germplasm g " +
	    " WHERE ts.tair_object_id = g.tair_object_id " +
	    " AND g.is_obsolete = 'F' " +
	    " AND ts.stock_id  = " + stock.get("stock_id");
	
	return executeQuery(conn, query);
    }


    private Map<String,Object> getStockType(DBconnection conn, Map<String,Object> stock) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    " SELECT * " +
	    " FROM StockType st " +
	    " WHERE st.stock_type_id = " + stock.get("stock_type_id");
	
	return executeQuery(conn, query).get(0);
    }

    

    private void populateTypeInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	typeInfo = new HashMap();
	typeInfo.put("has_type", Boolean.FALSE);

	// type
	String type = germplasm.get_germplasm_type();
	if ( type != null ) {
	    typeInfo.put("has_type", Boolean.TRUE);
	}
	typeInfo.put("type", type);

	// display and meta data for stock types
	HashMap molecular_mapping = new HashMap();
	molecular_mapping.put("type", "is_molecular_mapping");
	molecular_mapping.put("display", "Molecular mapping line");

	HashMap classical_mapping = new HashMap();
	classical_mapping.put("type", "is_classical_mapping");
	classical_mapping.put("display", "Classical mapping line");

	// get the stock types
	Collection stockTypes = new TreeSet(new Comparator () {
		public int compare(Object o1, Object o2) { 
		    HashMap a1 = (HashMap) o1;
		    HashMap a2 = (HashMap) o2;
		    return ((String)a1.get("type")).compareTo((String)a2.get("type"));
		}
	    });

	if (stock != null) {
	    if ( stock.get_is_molecular_mapping() != null
		 && stock.get_is_molecular_mapping().booleanValue() ) {
		stockTypes.add(molecular_mapping);
	    }
	    if ( stock.get_is_classical_mapping() != null
		 && stock.get_is_classical_mapping().booleanValue() ) {
		stockTypes.add(classical_mapping);
	    }
	}
	typeInfo.put("stockTypes", stockTypes);

    }


    private void populatePublicationInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	publicationInfo = new HashMap();

	Boolean has_publications = Boolean.FALSE;

	String query =
	    " SELECT p.reference_id, p.publication_year, p.title, s.name " +
	    " FROM TairObj_Ref r, Publication p, PubSource s " +
	    " WHERE r.reference_id = p.reference_id " +
	    " AND p.pub_source_id = s.pub_source_id " +
	    " AND r.tair_object_id = " + germplasm.get_tair_object_id();

	if (stock != null) {
	    query = query + " UNION " +
		" SELECT p.reference_id, p.publication_year, p.title, s.name " +
		" FROM TairObj_Ref r, Publication p, PubSource s " +
		" WHERE r.reference_id = p.reference_id " +
		" AND p.pub_source_id = s.pub_source_id " +
		" AND r.tair_object_id = " + stock.get_tair_object_id() ;
	}
	 
	String orderBy = " ORDER BY publication_year DESC, title ";

	List<Map<String,Object>> publications = executeQuery(conn,query+orderBy);
	Map<String,Boolean> headerInfo = null;

	/* need to filter out duplicates */
	if (publications.size() > 0) {
	    has_publications = Boolean.TRUE;
	    publicationInfo.put("publications", publications);
	    headerInfo = getHeaderInfo(publications);
	    publicationInfo.put("header_info", headerInfo);
	}

	publicationInfo.put("has_publications", has_publications);
    }


    private void populateURLInfo(DBconnection conn)
    throws RecordNotFoundException, SQLException {

    URLInfo = new HashMap();

    Boolean has_URLs = Boolean.FALSE;

    String query = 
        " SELECT u.* From URL u, TairObject_URL tu " +
        " WHERE u.url_id= tu.url_id" + 
        " AND (tu.tair_object_id = " + germplasm.get_tair_object_id();
    if ( stock != null && stock.get_tair_object_id() != null){
        query = query + " OR tu.tair_object_id = " + stock.get_tair_object_id();
    }
    query = query + ")";
    List<Map<String,Object>> urls = executeQuery(conn,query);
    
    if (urls.size() > 0) {
        has_URLs = Boolean.TRUE;
        URLInfo.put("urls", urls);
        System.out.println("germplasm urls : " + urls.size() );
    }
    /* 
    if ( stock != null && stock.get_tair_object_id() != null){
        query = 
            " SELECT u.* from URL u, TairObject_URL tu " + 
            " WHERE u.url_id = tu.url_id" +
            " AND tu.tair_object_id = " + stock.get_tair_object_id();
        
        urls = executeQuery(conn,query);

        if (urls.size() > 0) {
            has_URLs = Boolean.TRUE;
            URLInfo.put("stock_urls", urls);
            System.out.println("stock urls : " + urls.size() );
        }
    }
    */
    URLInfo.put("has_urls", has_URLs);
    }

    private void populateImageInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	imageInfo = new HashMap();

	Boolean has_images = Boolean.FALSE;

	String query =
	    " SELECT i.image_id, i.file_format " +
	    " FROM TairObject_Image t, Image i " +
	    " WHERE t.image_id = i.image_id " +
	    " AND t.tair_object_id = " + germplasm.get_tair_object_id();

	List<Map<String,Object>> images = executeQuery(conn,query);
	
	if (images.size() > 0) {
	    has_images = Boolean.TRUE;
	    imageInfo.put("images", images);
	    
	}

	for (Map<String,Object> image : images) {
	    List<Map<String,Object>> thumbnails = getImageThumbnail(conn, image);
	    image.put("has_thumbnail", Boolean.FALSE);

	    if (thumbnails.size() > 0) {
		image.put("has_thumbnail", Boolean.TRUE);
		image.put("thumbnail", thumbnails.get(0));
	    }
	    
	}

	imageInfo.put("has_image", has_images);
    }


    private List<Map<String,Object>> getImageThumbnail(DBconnection conn, Map<String,Object> image) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    " SELECT tn.image_id " +
	    " FROM ImageThumbnail tn " +
	    " WHERE tn.image_id = " + image.get("image_id");
	
	return executeQuery(conn, query);
    }



    private void populatePhenotypeInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	phenotypeInfo = new HashMap();

	Boolean has_phenotypes = Boolean.FALSE;

	String query =
	    " SELECT pt.phenotype_id, pt.phenotype, gppt.reference_id, " +
        " etp.enhancer_trap_phenotype_id, etp.gfp_expression, etp.gfp_expression_level, etp.details " +
	    " FROM Germplasm g, Germplasm_Phenotype gppt, Phenotype pt " +
	    " LEFT JOIN EnhancerTrapPhenotype etp " + 
        " ON pt.enhancer_trap_phenotype_id = etp.enhancer_trap_phenotype_id " + 
        " WHERE gppt.germplasm_id = g.germplasm_id " +    
	    " AND gppt.phenotype_id = pt.phenotype_id " + 
	    " AND g.tair_object_id = " + germplasm.get_tair_object_id();

	List<Map<String,Object>> phenotypes = executeQuery(conn,query);
	Map<String,Boolean> headerInfo = null;

	if (phenotypes.size() > 0) {
	    has_phenotypes = Boolean.TRUE;
	    phenotypeInfo.put("phenotypes", phenotypes);
	    headerInfo = getHeaderInfo(phenotypes);
	    phenotypeInfo.put("header_info", headerInfo);
	    headerInfo.put("has_reference", headerInfo.get("reference_id"));
	}

	for (Map<String,Object> phenotype : phenotypes) {
	    phenotype.put("has_reference", Boolean.FALSE);

	    if (!TextConverter.isEmpty((String) phenotype.get("reference_id"))) {
	       	Map <String,Object> reference = getPhenotypeReference(conn, phenotype);
		phenotype.put("reference", reference);
		phenotype.put("has_reference", Boolean.TRUE);
	    }
	}

	phenotypeInfo.put("has_phenotypes", has_phenotypes);
    }

    private Map<String,Object> getPhenotypeReference(DBconnection conn, Map<String,Object> phenotype) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    " SELECT * " +
	    " FROM Reference r " + 
	    " WHERE r.reference_id = " + phenotype.get("reference_id");
	
	Map<String,Object> result = executeQuery(conn, query).get(0);

	String type = (String) result.get("reference_type");
	Long reference_id = new Long((String) result.get("reference_id"));

      // Based on the type, create the appropriate subclass data member.
      if (type.compareToIgnoreCase("publication") == 0) {
	  TfcPublication publication = new TfcPublication(conn, reference_id);
	  result.put("label", publication.getReferenceLabel());
      } else if (type.compareToIgnoreCase("communication") == 0) {
	  TfcCommunication communication = new TfcCommunication(conn, reference_id);
	  result.put("label", communication.getReferenceLabel());
      } else if (type.compareToIgnoreCase("analysis_reference") == 0) {
	  TfcAnalysisReference analysisReference = new TfcAnalysisReference(conn, reference_id);
	  result.put("label", analysisReference.getReferenceLabel());
      } else {
	  result.put("label", "");
      }

      return result;
    }


    private void populateAssociatedConstructInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	associatedConstructInfo = new HashMap();

	Boolean has_associated_constructs = Boolean.FALSE;

	String query = 
	    " SELECT c.clone_id, c.tair_object_id, c.name, c.original_name, c.construct_type, c.map_element_id, c.vector_id " +
	    " FROM Clone c, Germplasm_MapElement gm, Germplasm g " +
	    " WHERE c.map_element_id = gm.map_element_id " +
	    " AND c.is_obsolete = 'F' " +
	    " AND gm.germplasm_id = g.germplasm_id " +
	    " AND g.tair_object_id = " + germplasm.get_tair_object_id();

	List<Map<String,Object>> associated_constructs = executeQuery(conn,query);
	Map<String,Boolean> headerInfo = null;

	if (associated_constructs.size() > 0) {
	    has_associated_constructs = Boolean.TRUE;
	    associatedConstructInfo.put("associated_constructs", associated_constructs);
	    headerInfo = getHeaderInfo(associated_constructs);
	    associatedConstructInfo.put("header_info", headerInfo);
	    headerInfo.put("has_loci", Boolean.FALSE);
	    headerInfo.put("has_vector", headerInfo.get("has_vector_id"));
	}

	for (Map<String,Object> construct : associated_constructs) {
	    List<Map<String,Object>> loci = getCloneLocusAssociations(conn, construct);
	    construct.put("loci", loci);
	    if (loci.size() > 0) {
		headerInfo.put("has_loci", Boolean.TRUE);
	    }

	    construct.put("has_vector", Boolean.FALSE);
	    if (!TextConverter.isEmpty((String) construct.get("vector_id"))) {
		Map<String,Object> vector = getCloneVector(conn, construct);
		construct.put("vector", vector);
		construct.put("has_vector", Boolean.TRUE);
	    }
	}

	associatedConstructInfo.put("has_associated_constructs", has_associated_constructs);
    }

    private Map<String,Object> getCloneVector(DBconnection conn, Map<String,Object> clone) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    " SELECT v.tair_object_id, v.name, v.original_name " +
	    " FROM Vector v " +
	    " WHERE v.vector_id = " + clone.get("vector_id");
	
	return executeQuery(conn, query).get(0);
    }

    private List<Map<String,Object>> getCloneLocusAssociations(DBconnection conn, Map<String,Object> clone) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    " SELECT  l.locus_id, l.name " +
	    " FROM Gene_MapElement gm, Gene g, MapElement_Locus ml, Locus l " + 
	    " WHERE gm.gene_id = g.gene_id " + 
	    " AND g.map_element_id = ml.map_element_id " +
	    " AND ml.locus_id = l.locus_id " + 
	    " AND l.is_obsolete = 'F' " +
	    " AND g.is_obsolete = 'F' " +
	    " AND gm.map_element_id = " + clone.get("map_element_id");
	
	return executeQuery(conn, query);
    }

    private void populatePolymorphismInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	polymorphismInfo = new HashMap();

	Boolean has_polymorphisms = Boolean.FALSE;

	String query =
	    " SELECT p.polymorphism_id, p.tair_object_id, p.name, gm.genotype, p.mutagen, p.inheritance " +
	    " FROM Germplasm_MapElement gm, Polymorphism p, Germplasm g " +
	    " WHERE gm.map_element_id = p.map_element_id " +
	    " AND p.is_obsolete = 'F' " +
	    " AND gm.germplasm_id = g.germplasm_id " +
	    " AND g.tair_object_id = " + germplasm.get_tair_object_id();

	String orderBy = " ORDER BY name ";
	
	List<Map<String,Object>> polymorphisms = executeQuery(conn,query+orderBy,POLY_LIMIT);
	Map<String,Boolean> headerInfo = null;

	if (polymorphisms.size() > 0) {
	    has_polymorphisms = Boolean.TRUE;
	    polymorphismInfo.put("polymorphisms", polymorphisms);
	    polymorphismInfo.put("count", getCount(conn, query));
	    headerInfo = getHeaderInfo(polymorphisms);
	    polymorphismInfo.put("header_info", headerInfo);
	    headerInfo.put("has_loci", Boolean.FALSE);
	    headerInfo.put("has_genes", Boolean.FALSE);
	}
	  
  
	for (Map<String,Object> polymorphism : polymorphisms) {

	    List<Map<String,Object>> loci = getPolymorphismLocusAssociations(conn, polymorphism);
	    polymorphism.put("loci", loci);	    	    
	    if (loci.size() > 0) {
		headerInfo.put("has_loci", Boolean.TRUE);
	    }
	    
	    
	    List<Map<String,Object>> genes = getPolymorphismGeneAssociations(conn, polymorphism);
	    polymorphism.put("genes", genes);	    	    
	    if (genes.size() > 0) {
		headerInfo.put("has_genes", Boolean.TRUE);
	    }
	    
	    for (Map<String,Object> gene : genes) {
		Set<String> names = new TreeSet<String>();
		gene.put("names", names);
		if (!TextConverter.isEmpty((String) gene.get("name"))) {
		    names.add((String) gene.get("name"));
		}
		
		List<Map<String,Object>> symbols = getGeneSymbols(conn, gene);
		gene.put("symbols", symbols);
		for (Map<String,Object> symbol : symbols) {
		    if (!TextConverter.isEmpty((String) symbol.get("full_name"))) {
			names.add((String) symbol.get("full_name"));
		    }
		} // end for symbols
		
	    } // end for genes
	    
	} // end for polymorphisms

	polymorphismInfo.put("has_polymorphisms", has_polymorphisms);
    }

    private List<Map<String,Object>> getGeneSymbols(DBconnection conn, Map<String,Object> gene) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    " SELECT s.symbol, s.full_name " +
	    " FROM Gene g, Gene_Symbol_Reference gsr, Symbol_UC s " + 
	    " WHERE s.symbol_id = gsr.symbol_id " +
	    " AND g.gene_id = gsr.gene_id " +
	    " AND gsr.is_obsolete = 'F' " + 
        " AND g.gene_id = " + gene.get("gene_id");
	
	return executeQuery(conn, query);
    }

    private List<Map<String,Object>> getPolymorphismGeneAssociations(DBconnection conn, Map<String,Object> polymorphism) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    " SELECT p.polymorphism_id, g.name, g.tair_object_id, g.gene_id " +
	    " FROM Polymorphism p, Gene g, Gene_MapElement gm " +
	    " WHERE gm.map_element_id = p.map_element_id " + 
	    " AND  g.gene_id = gm.gene_id " +
	    " AND g.is_obsolete = 'F' " +
	    " AND p.is_obsolete = 'F' " +
	    " AND p.polymorphism_id = " + polymorphism.get("polymorphism_id");
	
	return executeQuery(conn, query);
    }

    private List<Map<String,Object>> getPolymorphismLocusAssociations(DBconnection conn, Map<String,Object> polymorphism) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    " SELECT p.polymorphism_id, l.name, l.tair_object_id, l.locus_id " +
	    " FROM Polymorphism p, Locus l, MapElement_Locus ml " +
	    " WHERE ml.map_element_id = p.map_element_id " +
	    " AND l.locus_id = ml.locus_id " +
	    " AND l.is_obsolete = 'F' " + 
	    " AND p.is_obsolete = 'F' " +
	    " AND p.polymorphism_id = " + polymorphism.get("polymorphism_id");
	
	return executeQuery(conn, query);
    }


    private void populateProgenyInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	progenyInfo = new HashMap();

	Boolean has_progeny = Boolean.FALSE;

	String query =
	    " SELECT pg.germplasm_id, pg.tair_object_id, pg.name, p.parent_gender, p.generation, p.generative_method " +
	    " FROM Pedigree p, Germplasm g, Germplasm pg " +
	    " WHERE p.parent_germplasm_id = g.germplasm_id " +
	    " AND p.child_germplasm_id = pg.germplasm_id " +
	    " AND g.tair_object_id = " + germplasm.get_tair_object_id();

	String orderBy = " ORDER BY pg.name ";
	
	List<Map<String,Object>> progeny = executeQuery(conn, query+orderBy, PROGENY_LIMIT);
	Map<String,Boolean> headerInfo = null;
	
	if (progeny.size() > 0) {
	    has_progeny = Boolean.TRUE;
	    progenyInfo.put("progeny", progeny);
	    progenyInfo.put("count", getCount(conn, query));
	    headerInfo = getHeaderInfo(progeny);
	    progenyInfo.put("header_info", headerInfo);
	    headerInfo.put("has_backgrounds", Boolean.FALSE);
	    headerInfo.put("has_locus_associations", Boolean.FALSE);
	}

	for (int i = 0, size = progeny.size(); i < PROGENY_LIMIT && i < size; i++) {
	    Map<String,Object> p = progeny.get(i);

	    List<Map<String,Object>> backgrounds = getGermplasmBackgrounds(conn, p);
	    p.put("backgrounds", backgrounds);	    	 
	    p.put("has_backgrounds", Boolean.FALSE);   
	    if (backgrounds.size() > 0) {
		headerInfo.put("has_backgrounds", Boolean.TRUE);
		p.put("has_backgrounds", Boolean.TRUE);   
	    }

	    List<Map<String,Object>> locus_associations = getGermplasmLocusAssociations(conn, p);
	    p.put("locus_associations", locus_associations);
	    p.put("has_locus_associations", Boolean.FALSE);
	    if (locus_associations.size() > 0) {
		headerInfo.put("has_locus_associations", Boolean.TRUE);
		p.put("has_locus_associations", Boolean.TRUE);
	    }
	}

	progenyInfo.put("has_progeny", has_progeny);
	
    }


    private void populateParentInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	parentInfo = new HashMap();

	Boolean has_parents = Boolean.FALSE;

	String query =
	    " SELECT pg.germplasm_id, pg.tair_object_id, pg.name, p.parent_gender, p.generation, p.generative_method " +
	    " FROM Pedigree p, Germplasm g, Germplasm pg " + 
	    " WHERE p.child_germplasm_id = g.germplasm_id " +
	    " AND p.parent_germplasm_id = pg.germplasm_id " +
	    " AND g.tair_object_id = " + germplasm.get_tair_object_id();

	String orderBy = " ORDER BY pg.name ";	

	List<Map<String,Object>> parents = executeQuery(conn, query+orderBy, PARENT_LIMIT);
	Map<String,Boolean> headerInfo = null;


	if (parents.size() > 0) {
	    has_parents = Boolean.TRUE;
	    parentInfo.put("parents", parents);
	    //	    headerInfo = getHeaderInfo(parents.subList(0,Math.min(LIMIT,parents.size())));
	    headerInfo = getHeaderInfo(parents);
	    parentInfo.put("header_info", headerInfo);
	    headerInfo.put("has_backgrounds", Boolean.FALSE);
	    headerInfo.put("has_locus_associations", Boolean.FALSE);
	}

	for (int i = 0, size = parents.size(); i < PARENT_LIMIT && i < size; i++) {
	    Map<String,Object> parent = parents.get(i);

	//	for (Map<String,Object> parent : parents) {

	    List<Map<String,Object>> backgrounds = getGermplasmBackgrounds(conn, parent);
	    parent.put("backgrounds", backgrounds);	    	    
	    parent.put("has_backgrounds", Boolean.FALSE);
	    if (backgrounds.size() > 0) {
		headerInfo.put("has_backgrounds", Boolean.TRUE);
		parent.put("has_backgrounds", Boolean.TRUE);
	    }
			       

	    List<Map<String,Object>> locus_associations = getGermplasmLocusAssociations(conn, parent);
	    parent.put("locus_associations", locus_associations);
	    parent.put("has_locus_associations", Boolean.FALSE);
	    if (locus_associations.size() > 0) {
		headerInfo.put("has_locus_associations", Boolean.TRUE);
		parent.put("has_locus_associations", Boolean.TRUE);
	    }
	}

	parentInfo.put("has_parents", has_parents);

    }


    private List<Map<String,Object>> getGermplasmBackgrounds(DBconnection conn, Map<String,Object> germplasm) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    " SELECT g.tair_object_id, g.name, wrk.abbrev_name, wrk.species_variant_id " +
	    " FROM  Germplasm g, Germplasm_Pedigree_wrk wrk " +
	    " WHERE  wrk.germplasm_id = g.germplasm_id " +
	    " AND wrk.species_variant_id IS NOT NULL  " +
	    " AND g.tair_object_id = " + germplasm.get("tair_object_id");
	return executeQuery(conn, query);
    }


    private List<Map<String,Object>> getGermplasmLocusAssociations(DBconnection conn, Map<String,Object> germplasm) 
	throws RecordNotFoundException, SQLException {

	String query = 
	    " SELECT l.name, l.tair_object_id, l.locus_id " +
	    " FROM Polymorphism p, Germplasm_MapElement gm, Germplasm g, Locus l, MapElement_Locus ml " +
	    " WHERE p.map_element_id = gm.map_element_id " + 
	    " AND p.is_obsolete = 'F' " +
	    " AND gm.germplasm_id = g.germplasm_id " +
	    " AND  l.locus_id = ml.locus_id " +
	    " AND l.is_obsolete = 'F' " +
	    " AND ml.map_element_id = p.map_element_id " +
	    " AND g.tair_object_id = " + germplasm.get("tair_object_id");
	return executeQuery(conn, query);
    }



    private void populateAccessionInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	accessionInfo = new HashMap();

	Boolean has_accession = Boolean.FALSE;

	String query =
	    " SELECT sv.species_variant_id, sv.original_name, sv.abbrev_name, sv.country, sv.location, sv.habitat " +
	    " FROM SpeciesVariant sv, Germplasm g " +
	    " WHERE g.species_variant_id = sv.species_variant_id " +
	    " AND g.tair_object_id = " + germplasm.get_tair_object_id();

	List<Map<String,Object>> accessions = executeQuery(conn, query);

	if (accessions.size() > 0) {
	    has_accession = Boolean.TRUE;
	    Map<String,Object> accession = accessions.get(0);
	    accessionInfo.put("accession", accession);
	    accessionInfo.put("header_info", getHeaderInfo(accessions));
	    
	}
	
	accessionInfo.put("has_accession", has_accession);
    }


    private void populateTaxonInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	taxonInfo = new HashMap();

	Boolean has_taxon = Boolean.FALSE;

	String query = 
	    " SELECT t.scientific_name " +
	    " FROM Taxon t, Germplasm g " +
	    " WHERE g.taxon_id = t.taxon_id " +
	    " AND g.tair_object_id = " + germplasm.get_tair_object_id();

	List<Map<String,Object>> taxons = executeQuery(conn, query);

	if (taxons.size() > 0) {
	    has_taxon = Boolean.TRUE;
	    taxonInfo.put("taxon", taxons.get(0));
	}

	taxonInfo.put("has_taxon", has_taxon);
    }



    private void populateOtherNames(DBconnection conn) 
	throws RecordNotFoundException, SQLException {

	List<Map<String,Object>> other_names = new ArrayList<Map<String,Object>>();
	Boolean has_other_names = Boolean.FALSE;

	String query =
	    " SELECT a.original_alias, a.note " +
	    " FROM Alias a " +
	    " WHERE a.tair_object_id = " + germplasm.get_tair_object_id();
	other_names.addAll(executeQuery(conn, query));

	if (stock != null) {
	    query = 
		" SELECT a.original_alias, a.note " +
		" FROM Alias a " +
		" WHERE a.tair_object_id = " + stock.get_tair_object_id();
	    other_names.addAll(executeQuery(conn, query));
	}

	if (other_names.size() > 0) {
	    has_other_names = Boolean.TRUE;
	}

	otherNameInfo = new HashMap();
	otherNameInfo.put("other_names", other_names);
	otherNameInfo.put("has_other_names", has_other_names);

    }


    private void populateStockInfo(DBconnection conn) 
	throws RecordNotFoundException, SQLException {
	stockInfo = new HashMap();

	Boolean has_stock = Boolean.FALSE;
	Boolean has_availability_type = Boolean.FALSE;
	Boolean has_availability_comment = Boolean.FALSE;
	Boolean has_donors = Boolean.FALSE;
	Boolean has_donor_stock_number = Boolean.FALSE;

	if (stock != null) {
	    has_stock = Boolean.TRUE;
	    stockInfo.put("stock", stock);
	}

	if (has_stock && stock.get_stock_availability_type_id() != null) {
	    has_availability_type = Boolean.TRUE;
	    TfcStockAvailabilityType  availability_type = 
		new TfcStockAvailabilityType(stock.get_stock_availability_type_id());
	    stockInfo.put("availability_type", availability_type);
	}

	if (has_stock && !TextConverter.isEmpty(EmptyTextConverter.convert( stock.get_stock_availability_comment() ))) {
	    has_availability_comment = Boolean.TRUE;
	    stockInfo.put("availability_comment", EmptyTextConverter.convert( stock.get_stock_availability_comment() ));
	}

	List donors = getStockDonors(conn, stock);
	if (donors.size() > 0) {
	    has_donors = Boolean.TRUE;
	    stockInfo.put("donors", donors);
	    Map<String,Boolean> headerInfo = getHeaderInfo(donors);
	    has_donor_stock_number = headerInfo.get("has_donor_stock_number");
	}

	stockInfo.put("has_stock", has_stock);
	stockInfo.put("has_availability_type", has_availability_type);
	stockInfo.put("has_availability_comment", has_availability_comment);
	stockInfo.put("has_donors", has_donors);
	stockInfo.put("has_donor_stock_number", has_donor_stock_number);
	
    }

    private List<Map<String,Object>> getStockDonors(DBconnection conn, TfcStock s) 
	throws RecordNotFoundException, SQLException {
	List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();

	if ( s != null ) {
	    String query =
		" SELECT c.community_id, c.community_type, d.donor_stock_number, p.first_name || ' ' || p.last_name as name  " +
		" FROM  Community c, Donor d, Person p  " + 
		" WHERE d.community_id = c.community_id " +
		" AND c.status = " +  TextConverter.dbQuote( DataConstants.getActiveStatus() ) + " " +
		" AND c.is_obsolete = 'F' " +
		" AND p.community_id = c.community_id " +
		" AND d.stock_id = " + s.get_stock_id();
			System.out.println("query : " + query);
	    result.addAll(executeQuery(conn, query));

	    query =
		" SELECT c.community_id, c.community_type, d.donor_stock_number, o.name " +
		" FROM  Community c, Donor d, Organization o " + 
		" WHERE d.community_id = c.community_id " +
		" AND c.status = " +  TextConverter.dbQuote( DataConstants.getActiveStatus() ) + " " +
		" AND c.is_obsolete = 'F' " +
		" AND o.community_id = c.community_id " +
		" AND d.stock_id = " + s.get_stock_id();
	   System.out.println("query : " + query ); 
	    result.addAll(executeQuery(conn, query));
	} else {
	    //throw new IllegalArgumentException("Invalid stock:" + s);
	}

	return result;
    }


    private void populateName(DBconnection conn) {
	String germplasmName = germplasm.get_original_name();
	name = "Germplasm: " + germplasmName;

	if ( stock != null && germplasmName.equalsIgnoreCase(stock.get_name()) ) {
	    name = "Germplasm / Stock: " + germplasmName;
	} else if ( stock != null ) {
	    name += " / Stock: " + stock.get_name();
	}

    }
    
    private void populateStock( DBconnection conn, Long tair_object_id) 
	throws RecordNotFoundException, SQLException {
	
	Long stock_id = null;

	if ( tair_object_id != null ) {
	    String query = 
		" SELECT s.stock_id " +
		" FROM TairObject_Stock ts, Stock s " +
		" WHERE ts.stock_id = s.stock_id " +
		" AND s.is_obsolete = 'F' " +
		" AND ts.tair_object_id = " + tair_object_id;
	    
	    List<Map<String,Object>> stocks = executeQuery(conn, query);
	    if (stocks.size() == 1) {
		Map<String,Object> obj = stocks.get(0);
		stock_id = new Long((String)obj.get("stock_id"));
	    } else {
		//throw new RuntimeException("Check query: " + query + "\n" + stocks);
	    }

	} else {
	    throw new IllegalArgumentException("Invalid tair_object_id:" + tair_object_id);
	}

	stock = null;
	if (stock_id != null) {
	    stock = new TfcStock(conn, stock_id);
	} 
    }


    private void populateGermplasm( DBconnection conn, Long tair_object_id) 
	throws RecordNotFoundException, SQLException {
	
	// will throw exception if invalid id
        germplasm = new TfcGermplasm( conn, tair_object_id );
	
    }


    public static List<Map<String,Object>> executeQuery( DBconnection conn, String query) 
	throws RecordNotFoundException, SQLException {
	return executeQuery(conn, query, -1);
    } 

    public static List<Map<String,Object>> executeQuery( DBconnection conn, String query, int limit ) 
	throws RecordNotFoundException, SQLException {
	List<Map<String,Object>> results = new ArrayList();

	try {
	    conn.setQuery( query );
	    
	    ResultSet rs = conn.getResultSet();
	    ResultSetMetaData rsmd = rs.getMetaData();
	    int numColumns = rsmd.getColumnCount();
	    while ( rs.next() && numColumns > 0 && (limit == -1 || limit > 0)) {
		Map<String,Object> obj = new HashMap<String,Object>();
		results.add(obj);
		if ( limit > 0 ) { limit--; }
		for (int i = 1; i <= numColumns; i++) {
		    String val = rs.getString( rsmd.getColumnName(i) );
		    if (val == null) { val = new String(); }

		    obj.put(rsmd.getColumnName(i).toLowerCase(), val);
		}
	    }
	    
	} finally {
	    conn.releaseResources();
	}

	return results;
    }


    public static int getCount( DBconnection conn, String query ) 
	throws RecordNotFoundException, SQLException {
	List<Map<String,Object>> results = new ArrayList();
	int result = 0;
	
	query = "SELECT COUNT(*) as c FROM ( " + query + " ) sq1";

	try {
	    conn.setQuery( query );
	    
	    ResultSet rs = conn.getResultSet();
	    while ( rs.next() ) {
		result = rs.getInt("c");
	    }
	    
	} finally {
	    conn.releaseResources();
	}

	return result;
    }



    /* assumes all List<Map<String,String>> */
    public static Map<String,Boolean> getHeaderInfo(List<Map<String,Object>> queryResults) {
	Map<String,Boolean> headerInfo = new HashMap<String,Boolean>();
	
	if (queryResults.size() == 0) {
	    throw new IllegalArgumentException("queryResult should have size > 0");
	}

	for (String key : queryResults.get(0).keySet()) {
	    headerInfo.put("has_"+key, Boolean.FALSE);
	}

	for (Map<String,Object> result : queryResults) {
	    for (String key : result.keySet()) {
		if (!headerInfo.get("has_"+key).booleanValue() 
		    && !TextConverter.isEmpty((String)result.get(key)) ) {
		    headerInfo.put("has_"+key, Boolean.TRUE);
		}
	    }   
	}

	return headerInfo;
    }

    public String toString() {

	String s =
	    germplasm + "\n" +
	    stock + "\n" +
	    name + "\n" +
	    stockInfo + "\n" +
	    otherNameInfo + "\n" +
	    taxonInfo + "\n" +
	    accessionInfo + "\n" +
	    parentInfo + "\n" +
	    progenyInfo + "\n" +
	    polymorphismInfo + "\n" +
	    associatedConstructInfo + "\n" +
	    phenotypeInfo + "\n" +
	    imageInfo + "\n" +
	    publicationInfo + "\n" +
	    typeInfo + "\n" +
	    includedSetPoolInfo + "\n" +
	    memberSetPoolInfo + "\n" +
	    attributionInfo + "\n" +
	    externalLinkInfo + "\n" +
	    annotationInfo + "\n" +
	    commentInfo + "\n" +
	    communicationInfo + "\n";


	return s;

    }

  /**
   * For unit testing only
   */
  public static void main( String[] args ) {
	
    try {

      DBconnection conn = new DBconnection();

      //GermplasmDetail d = new GermplasmDetail(conn, new Long("4514323401"));
      //GermplasmDetail d = new GermplasmDetail(conn, new Long("1005152521"));
      //GermplasmDetail d = new GermplasmDetail(conn, new Long("4671927"));      
      //GermplasmDetail d = new GermplasmDetail(conn, new Long("4472704"));      
      //GermplasmDetail d = new GermplasmDetail(conn, new Long("1009287035"));      
      //GermplasmDetail d = new GermplasmDetail(conn, new Long("1005164053"));      
      //GermplasmDetail d = new GermplasmDetail(conn, new Long("1007909327"));      
      //GermplasmDetail d = new GermplasmDetail(conn, new Long("4514323401"));      
      //GermplasmDetail d = new GermplasmDetail(conn, new Long("4514323268"));      
      //GermplasmDetail d = new GermplasmDetail(conn, new Long("5017854270"));      
      //GermplasmDetail d = new GermplasmDetail(conn, new Long("1005158943"));      
      GermplasmDetailLite d = new GermplasmDetailLite(conn, new Long("3510679735"));      

      System.out.println(d);
      System.out.println(d.germplasm.get_germplasm_id()); 
      System.out.println(d.germplasm.get_name());

      /*
      String query = 
	  " SELECT s.tair_object_id, s.stock_id, s.name, av.stock_availability_type  " +
	  " FROM TairObject_Stock ts, Stock s, StockAvailabilityType av " +
	  " WHERE ts.stock_id = s.stock_id " +
	  " AND s.is_obsolete = 'F' " +
	  " AND s.stock_availability_type_id = av.stock_availability_type_id " +
	  " AND ts.tair_object_id = 4514323401";

      System.out.println(query);

      List<Map<String,Object>> results = executeQuery(conn, query, -1);
      Map<String,Boolean> headerInfo = getHeaderInfo(results);


      for (String key : headerInfo.keySet()) {
	  System.out.println(key + " - " + headerInfo.get(key));
      }

      for (Map obj : results) {
	  for (Object o : obj.keySet()) {
	      System.out.println(o + " -  " + obj.get(o));
	  }
      }
      */

    } catch( Exception e ) {
	e.printStackTrace();
    }

  }



}
