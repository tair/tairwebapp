/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.math.BigInteger;
import java.sql.*;
import java.util.*;

import org.tair.tfc.*;
import org.tair.utilities.*;


/**
 * DefinitionsDetail is a composite class that represents all
 * information associated with an Definition entry.  It contains bot
 * the TfcDefinition as well as the definitions that are related to
 * this one. */
public class DefinitionsDetail implements Detail, Accessible {
    private Long id;
    private TfcDefinitions defn;
    private DefinitionsCollection related_defns;

    public DefinitionsDetail() {}


    public void get_information(DBconnection conn, String name) throws SQLException {
	// does nothing
    }
    

    /** 
     * Fills the member variables with the information associated to a
     * given definition id.
     *
     * @param conn An active connection to the database
     * @param id A valid definition_id.
     */
    public void get_information(DBconnection conn, Long id) throws SQLException {
	this.id = id;
	this.defn = new TfcDefinitions(conn, id);
	if (mayHaveChildDefinitions()){
	    related_defns = new DefinitionsCollection(conn, 
						      getTableName(),
						      getFieldName());
	}
	else {
	    related_defns = new DefinitionsCollection();
	}
    }
    
    /** 
     * Returns true if this is a definition that might have multiple
     * field values. */
    private boolean mayHaveChildDefinitions() {
	return ((!TextConverter.isEmpty(getFieldName()))
		&& TextConverter.isEmpty(getFieldValue())) ;
    }


    /**
     * Returns the id of this definition.
     */
    public Long get_id() {
	return id;
    }
    

    /**
     * Returns the id of this definition.
     */
    public Long getSuperID() {
	return get_id();
    }
    
    /**
     * Returns the literal string 'Definition'
     */
    public String getElementType() {
	return "Definition";
    }


    /**
     * Returns the accession of this definition.
     */
    public String getAccession() {
	return getElementType() + ":" + get_id();
    }

    /**
     * Returns a DefinitionCollection of "related" definitions.  We
     * define relatedness if a definition shared the same table_name
     * and field_name.
     */
    public DefinitionsCollection getRelatedDefinitions() {
	return related_defns;
    }


    // Wrapper methods over TfcDefinitions
    // wrapper method around TfcDefnitions.get_table_name()
    public String getTableName() { return defn.get_table_name(); }
    // wrapper method around TfcDefnitions.get_field_name()
    public String getFieldName() { return defn.get_field_name(); }
    // wrapper method around TfcDefnitions.get_field_value()
    public String getFieldValue() { return defn.get_field_value(); }
    // wrapper method around TfcDefnitions.get_display_value()
    public String getDisplayValue() { return defn.get_display_value(); }
    // wrapper method around TfcDefnitions.get_definition()
    public String getDefinition() { return defn.get_definition(); }
    // wrapper method around TfcDefnitions.get_date_last_modified()
    public java.util.Date getDateLastModified() { return defn.get_date_last_modified(); }
    // wrapper method around TfcDefnitions.get_community_id()
    public BigInteger getCommunityId() { return defn.get_community_id(); }
    // wrapper method around TfcDefnitions.get_reference()
    public String getReference() { return defn.get_reference(); }
    // wrapper method around TfcDefnitions.get_do_stats()
    public Boolean getDoStats() { return defn.get_do_stats(); }
    // wrapper method around TfcDefnitions.get_is_glossary()
    public Boolean getIsGlossary() { return defn.get_is_glossary(); }
}
