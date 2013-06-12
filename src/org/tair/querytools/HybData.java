//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.23 $
// $Date: 2005/09/14 15:42:57 $
//------------------------------------------------------------------------------ 

package org.tair.querytools;

import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.Iterator;

import org.tair.community.ListCommunity;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcAffyMetrics;
import org.tair.tfc.TfcHybData;
import org.tair.utilities.InvalidActionException;

/**
 * HybData extends <code>TfcHybData</code> to present more detailed
 * information about a hyb data entry.  In addition to the data stored in
 * the superclass, HybData also contains AffyMetrics data, as well as data
 * on the ExpressionSet that ultimately contains the HybData object.  This
 * is needed so that each HybData object has the info. needed to create
 * hyperlinks to the raw data stored on the FTP site with a known naming
 * convention.
 */

public class HybData extends TfcHybData {

    // base URL for FTP links
    private static final String baseURL = 
        "ftp://ftp.arabidopsis.org/home/tair/Microarrays/Datasets/";


    // associated AffyMetrics data 
    private TfcAffyMetrics affyMetrics;

    // expression set accession - needed for creating FTP URL for downloading 
    // raw data file for hyb data object. Property should be set manually
    // and is probably done by HybDataCollection that contains this object
    private String expressionSubmissionNumber;

    // community record for experimenter_id
    private ListCommunity experimenter;


    /**
     * Creates an empty instance of HybData
     */
    public HybData() {
        super();
    }


    /**
     * Creates an instance of HybData that reflects the data referenced by 
     * submitted hyb_data_id.
     *
     * @param conn An active connection to the database
     * @param hyb_data_id Hyb data id to retrieve data for
     * @throws SQLException thrown if a database error occurs
     */
    public HybData( DBconnection conn, Long tair_object_id ) throws SQLException {
        super( conn, tair_object_id );

        // create using constructor that skips exception if no row found - this
        // lets us simultaneously search for data & retrieve it in one query 
	// instead of two. If no row found, set object to null to avoid 
	// confusion
        if( get_hyb_data_id() != null ){
           affyMetrics = new TfcAffyMetrics( conn, get_hyb_data_id(), true ); 
        }
        if ( affyMetrics.get_hyb_data_id() == null ) {
            affyMetrics = null;
        }

        if ( get_experimenter_id() != null ) {
            this.experimenter = new ListCommunity(get_experimenter_id() );
        }
    }


    /**
     * Determines whether hybData is a technical or biological replicate by checking
     * the is_tech_replicate and is_bio_replicate flags in the superclass. Method
     * returns the display string to use based on these flags (technical/biological).
     *
     * <p>
     * NOTE: if somehow both flags are true (shouldn't happen, but ya never know), this
     * method will return "technical" since it examines that flag first.
     *
     * @return "technical" if hybData is a technical replicate, or "biological" if hybdata is
     * a biological replicate; returns <code>null</code> if both boolean fields are 
     * <code>null</code> or <code>false</code>
     */
    public String getReplicateType() {
        String type = null;
    
        if ( get_is_tech_replicate() != null && get_is_tech_replicate().booleanValue() ) {
            type = "technical";
        } else if ( get_is_bio_replicate() != null && get_is_bio_replicate().booleanValue() ) {
            type= "biological";
        }
        return type;
    }
    


    /**
     * Determines if HybData object has associated AffyMetrics data. 
     *
     * @return <code>true</code> if HybData object has AffyMetrics data, or
     * <code>false</code> if no AffyMetrics data for HybData object
     */
    public boolean hasAffyMetrics() {
        return ( affyMetrics != null );
    }

    /**
     * Sets affymetrics data wholesale for HybData slide.  This is useful
     * when populating object from data file during microarray data loading.
     *
     * @param affyMetrics Affymetrics data to set for slide
     */
    public void setAffyMetrics( TfcAffyMetrics affyMetrics ) {
	this.affyMetrics = affyMetrics;
    }
     
     
    
    //
    // TfcAffyMetrics wrappers
    //

    public Integer get_central_minus_count() {
	return hasAffyMetrics() ? affyMetrics.get_central_minus_count() : null;
    }

    public Integer get_corner_minus_count() {
	return hasAffyMetrics() ? affyMetrics.get_corner_minus_count() : null; 
    }

    public Integer get_corner_plus_count() { 
	return hasAffyMetrics() ? affyMetrics.get_corner_plus_count() : null;
    }

    public Integer get_SDTm() { 
	return hasAffyMetrics() ? affyMetrics.get_SDTm() : null;
    }

    public Float get_central_minus_avg() {
	return hasAffyMetrics() ? affyMetrics.get_central_minus_avg() : null;
    }

    public Float get_corner_minus_avg() {
	return hasAffyMetrics() ? affyMetrics.get_corner_minus_avg() : null; 
    }

    public Float get_corner_plus_avr() {
	return hasAffyMetrics() ? affyMetrics.get_corner_plus_avr() : null; 
    }

    public Float get_SRT() {
	return hasAffyMetrics() ? affyMetrics.get_SRT() : null;
    }

    public Float get_FC_intensity_threshold() {
	return hasAffyMetrics() ? 
	    affyMetrics.get_FC_intensity_threshold() : null;
    }

    public Float get_background_stdev() {
	return hasAffyMetrics() ? affyMetrics.get_background_stdev() : null;
    }

    public Float get_background_avg() { 
	return hasAffyMetrics() ? affyMetrics.get_background_avg() : null;
    }

    public Float get_noise() {
	return hasAffyMetrics() ? affyMetrics.get_noise() : null;
    }

    public String get_abs_dec_matrix() { 
	return hasAffyMetrics() ? affyMetrics.get_abs_dec_matrix() : null;
    }

    public Float get_alpha1() {
	return hasAffyMetrics() ? affyMetrics.get_alpha1() : null;
    }

    public Float get_alpha2() {
	return hasAffyMetrics() ? affyMetrics.get_alpha2() : null;
    }

    public Float get_tau() {
	return hasAffyMetrics() ? affyMetrics.get_tau() : null;
    }

    public Float get_TGT_value() {
	return hasAffyMetrics() ? affyMetrics.get_TGT_value() : null;
    }

    public Float get_gamma1h() {
	return hasAffyMetrics() ? affyMetrics.get_gamma1h() : null;
    }

    public Float get_gamma1l() {
	return hasAffyMetrics() ? affyMetrics.get_gamma1l() : null;
    }

    public Float get_gamma2h() {
	return hasAffyMetrics() ? affyMetrics.get_gamma2h() : null;
    }
					
    public Float get_gamma2l() {
	return hasAffyMetrics() ? affyMetrics.get_gamma2l() : null;
    }

    public Float get_perturbation() {
	return hasAffyMetrics() ? affyMetrics.get_perturbation() : null;
    }

    public Float get_baseline_noise() {
	return hasAffyMetrics() ? affyMetrics.get_baseline_noise() : null;
    }

    public Float get_baseline_sf() {
	return hasAffyMetrics() ? affyMetrics.get_baseline_sf() : null;
    }



    /**
     * Sets submission number of expression set that ultimately contains 
     * this data object. This value is needed for creating FTP URL to download
     * raw hyb data file.  This number is not retrieved automatically by 
     * constructor, but must be populated externally; this population is usually
     * done through HybDataCollection that contains this object and others. This
     * is done so that the work to retrieve the submission number is not 
     * duplicated for each object in the collection, though for simplicity's 
     * sake at the JSP level, it helps to have each HybData object be aware of
     * this value and be able to create its own FTP URL
     *
     * @param number Expression Set submission number of expression set that 
     * contains this hyb data object
     */
    public void setExpressionSubmissionNumber( String number ) {
        this.expressionSubmissionNumber = number;
    }

    /**
     * Retrieves submission number of expression set that contains this hyb data
     * object (through expression set's associated hyb descriptions)
     */
    public String getExpressionSubmissionNumber() {
        return expressionSubmissionNumber;
    }


    /**
     * Returns Tair Normalization FTP URL that can be used to download hyb data
     * file. 
     *
     * [ baseURL for FTP site ]/Microarrays/Datasets/ExpressionSet_[ submission_number ]/[ hyb data name ].
     * _tair.zip
     *
     * @return Tair Normalization FTP URL to use to download raw data file for 
     * this HybData object, or <code>null</code> if object doesn't have data 
     * needed (such as expression set accession) to create URL
     */
   
    public String getTairNormFtpURL() {
        String base_url = getBaseUrl ();
        return 	base_url == null ? null : base_url+"_tair.zip";
    }

    /**
     * Returns base FTP URL that can be used to download hyb data file.  This 
     * data is stored on the production FTP site using the naming convention:
     * <br><br>
     *
     * [ baseURL for FTP site ]/Microarrays/Datasets/ExpressionSet_[ submission_number ]/[ hyb data name ].

     * <p>
     * Data file names automatically have parentheses and whitespaces removed 
     * before being stored on the FTP site.  This method will automatically 
     * convert names according to these conventions to return valid FTP URLs
     *
     * @return base FTP URL to use to download raw data file for this HybData 
     * object, or <code>null</code> if object doesn't have data needed (such as
     * expression set accession) to create URL
     */
    private String getBaseUrl (){
	String url = null ; 
        if ( getExpressionSubmissionNumber() != null && get_name() != null ) {
            url = 
                baseURL + "ExpressionSet_" + 
                URLEncoder.encode( getExpressionSubmissionNumber() ) + "/" + 
                URLEncoder.encode( cleanName( get_name() ) ) ;
        }
	return url;
    }
    /**
     * Returns Normalization FTP URL that can be used to download hyb data
     * file. 
     *
     * [ baseURL for FTP site ]/Microarrays/Datasets/ExpressionSet_[ submission_number ]/[ hyb data name ].
     * zip
     *
     * @return Normalization FTP URL to use to download raw data file for 
     * this HybData object, or <code>null</code> if object doesn't have data 
     * needed (such as expression set accession) to create URL
     */
     public String getNormFtpURL() {
       
	String base_url = getBaseUrl ();
	return base_url == null ? null : base_url+".zip";
     }
   
    /**
     * Returns User Normalization FTP URL that can be used to download hyb data
     * file. 
     *
     * [ baseURL for FTP site ]/Microarrays/Datasets/ExpressionSet_[ submission_number ]/[ hyb data name ].
     * _user.zip
     *
     * @return User Normalization FTP URL to use to download raw data file for 
     * this HybData object, or <code>null</code> if object doesn't have data 
     * needed (such as expression set accession) to create URL
     */
     public String getUserNormFtpURL() {
       
	String base_url = getBaseUrl ();
	return base_url == null ? null : base_url+"_user.zip";
     }
   
    
    // remove \W 
    // clean up that happens when files are loaded
    private String cleanName( String name ) {
        String converted = null;
        StringBuffer buffer = new StringBuffer();
	char[] tmp = name.toCharArray();

	for ( int i = 0; i < tmp.length; i++ ) {
	    if ( Character.isLetterOrDigit( tmp[ i ] ) || tmp[ i ] == '_' ){
		buffer.append( tmp[ i ] );
	    }else {
		continue ;
	    }
	}
	converted = buffer.toString();
        return converted;
    }


    /**
     * Determines if HybData object has a community object for experimenter
     *
     * @return <code>true</code> if HybData has an experimenter, 
     * <code>false</code> if no experimenter for HybData
     */
    public boolean hasExperimenter() {
        return ( experimenter != null );
    }

    /**
     * Retrieves experimenter community object
     * 
     * @return Experimenter as a <code>ListCommunity</code> object
     */
    public ListCommunity getExperimenter() {
        return experimenter;
    }

    /**
     * Retrieves experimenter display name.
     *
     * @return Display name for experimenter
     */
    public String getExperimenterDisplayName() {
        return hasExperimenter() ? experimenter.getDisplayName() : null;
    }
    
    /**
     * Retrieves abbreviated name for experimenter.  For organizations this
     * will be the value of Organization.abbrev_name, or organization name 
     * if abbrev name is null; for persons, this will be first initial 
     * followed by last name
     *
     * @return Abbreviated name for experimenter, or full name if no 
     * abbreviation available
     */
    public String getExperimenterFormatAbbrevName() {
        return hasExperimenter() ? experimenter.getFormatAbbrevName() : null;
    }

    /**
     * Stores hyb data to the database. Affymetrics data will be stored 
     * for slide as well.
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws InvalidActionException if required data has not been set for
     * any data element
     * @throws SQLException if a database error occurs
     */
    public void store( DBconnection conn ) 
	throws InvalidActionException, SQLException {

	super.store( conn );

	// if slide has affymetrics data, set link to hyb data 
	// record and store
	if ( hasAffyMetrics() ) {
	    affyMetrics.set_hyb_data_id( get_hyb_data_id() );
	    affyMetrics.store( conn );
	}
    }

    /**
     * Deletes hyb data record and any accompanying affymetrics data
     *
     * @param conn A database connection with UPDATE/INSERT/DELETE privileges
     * @throws SQLException if a database error occurs
     */
    public void delete( DBconnection conn ) throws SQLException{
	if ( hasAffyMetrics() ) {
            affyMetrics.delete( conn );
        }

	// If really deleting HybData records, need to get rid of results
	// rows as well as any TairObject meta data
        // right now don't need to per marga
       	super.delete( conn );
    }


    /**
     * For unit testing only
     */
    public void test() {
        System.out.println( "**** HybData content test ****" );
        super.test();

        if ( hasAffyMetrics() ) {
            affyMetrics.test();
        }

        if ( hasExperimenter() ) {
           // experimenter.test();
        }
                                  

        System.out.println( "expression set submission number: " + 
			    getExpressionSubmissionNumber() );
        System.out.println( "ftp url: " + getUserNormFtpURL() );
        System.out.println ( "**** HybData content test end ****" );
    }


    /**
     * For unit testing only
     */
    public static void main( String[] args ) {
        try {

            DBconnection conn = new DBconnection();
            Long id = new Long( 1005823610 );
            HybData hybData = new HybData( conn, id );
            hybData.setExpressionSubmissionNumber( "TEST_NUMBER" );
            hybData.test();

        } catch ( Exception e ) {
            e.printStackTrace();
        }

    }

}
