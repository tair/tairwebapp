/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.io.Serializable;
import java.sql.SQLException;
import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcRestrictionEnzyme;
import org.tair.tfc.TfcPolymorphismRestrictionEnzyme;

/**
 * PolymorphismRestrictionEnzyme represents data for a restriction enzyme in
 * terms of its relationship to a polymorphism. PolymorphismRestrictionEnzyme
 * contains all data for the restriction enzyme in an instance of
 * <code>TfcRestrictionEnzyme</code> as well as association-specific
 * information in an instance of <code>TfcPolymorphismRestrictionEnzyme</code> 
 * 
 * <p>
 * Implements Serializable so object data can be written to file for stock
 * catalog data files
 */
 
public class PolymorphismRestrictionEnzyme implements Serializable {
  private TfcRestrictionEnzyme enzyme;
  private TfcPolymorphismRestrictionEnzyme polyEnzyme;

  /**
     * Creates an empty instance of PolymorphismRestrictionEnzyme
     */
  public PolymorphismRestrictionEnzyme() { 
    enzyme = new TfcRestrictionEnzyme();
    polyEnzyme = new TfcPolymorphismRestrictionEnzyme();
  }
  
  /**
     * Creates an empty instance of PolymorphismRestrictionEnzyme that reflects
     * restriction enzyme data for submitted restriction_enzyme_id and its
     * association to polymorphism_id
     * 
     * @param conn
     *            An active connection to the database
     * @param polymorphism_id
     *            Polymorphism id to retrieve data for
     * @param restriction_enzyme_id
     *            Restriction enzyme id to retrieve data for
     */
  public PolymorphismRestrictionEnzyme( DBconnection conn, Long polymorphism_id, Long restriction_enzyme_id ) throws SQLException {
    if ( polymorphism_id != null && restriction_enzyme_id != null ) {
      enzyme = new TfcRestrictionEnzyme( conn, restriction_enzyme_id );
      polyEnzyme = new TfcPolymorphismRestrictionEnzyme( conn, polymorphism_id, restriction_enzyme_id );
    }
  }


  // TfcRestrictionEnzyme wrappers
  public void set_restriction_enzyme_id ( Long value ) { enzyme.set_restriction_enzyme_id( value ); }
  public void set_name ( String value ) { enzyme.set_name( value ); }
  public void set_site ( String value ) { enzyme.set_site( value ); }
  public void set_offset ( Integer value ) { enzyme.set_offset( value ); }
  public void set_overhang ( Integer value ) { enzyme.set_overhang( value ); }
  public void set_cleavage ( String value ) { enzyme.set_cleavage( value ); }
  public void set_isoschizomer ( String value ) { enzyme.set_isoschizomer( value ); }
  public void set_date_last_modified ( java.util.Date value ) { enzyme.set_date_last_modified( value ); }

  public Long get_restriction_enzyme_id() { return enzyme.get_restriction_enzyme_id(); }
  public String get_name() { return enzyme.get_name(); }
  public String get_site() { return enzyme.get_site(); }
  public Integer get_offset() { return enzyme.get_offset(); }
  public Integer get_overhang() { return enzyme.get_overhang(); }
  public String get_cleavage() { return enzyme.get_cleavage(); }
  public String get_isoschizomer() { return enzyme.get_isoschizomer(); }
  public java.util.Date get_date_last_modified() { return enzyme.get_date_last_modified(); }


  // TfcPolymorphismRestrictionEnzyme wrappers
  public void set_num_sites( Integer sites ) { this.polyEnzyme.set_num_sites( sites ); }
  public Integer get_num_sites() { return polyEnzyme.get_num_sites(); }

  /**
     * For unit testing only
     */
  public void test() {
    if ( enzyme != null ) {
      enzyme.test();
    }
    
    if ( polyEnzyme != null ) {
      polyEnzyme.test();
    }
  }

  /**
     * For unit testing only
     */
  public static void main( String[] args ) {
    try {
      DBconnection conn = new DBconnection();
      Long polyID = new Long( 465 );
      Long enzymeID = new Long( 492 );
      PolymorphismRestrictionEnzyme poly = new PolymorphismRestrictionEnzyme( conn, polyID, enzymeID );
      poly.test();
    } catch ( Exception e ) {
      e.printStackTrace();
    }
   
  }


}
