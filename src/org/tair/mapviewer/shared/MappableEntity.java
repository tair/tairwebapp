/*
 *
 * $Id: MappableEntity.java,v 1.5 2003/09/29 15:36:41 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;

/**
 * MappableEntity is a superclass for representing all types of elements
 * that can be mapped including, at the highest level, Maps, as well as
 * entities such as clones, genes etc. that are mapped onto Maps.
 * MappableEntity contains basic info. for displaying the entity. Type
 * specific data is handled by each of the sub-classes.
 */

 
public class MappableEntity implements Cloneable {

    private long id;
    private int type;
    private String name;
    private String source;
    private String[] accessionNumber;

    // don't seem to be used anywhere, but keep around for now just in case
    // NM 9.25.2003
    private String fullName;
    private String description;



    /**
     * Creates an empty instance of MappableEntity
     */  
    public MappableEntity() {  }



    /**
     * Creates an instance of MappableEntity by copying data from
     * submitted MappableEntity and storing in local variables. This
     * results in a new instance that essentially clones the submitted
     * instance
     *
     * @param ME MappableEntity to clone data from
     */
    public MappableEntity( MappableEntity ME ) {
        this.id = ME.getID();
        this.type = ME.getType();
        this.name = ME.getName();
        this.fullName = ME.getFullName();
        this.description = ME.getDescription();
        this.source = ME.getSource();
    }
  

    /**
     * Creates an instance of MappableEntity by populating
     * member variables with submitted values
     *
     * @param id Id of object (may be tair_object_id, map_element_id
     * or custom id depending on sub-class)
     *
     * @param type A constant type value defining object; value may come
     * from MapType or MappableEntityType

     * @param name Name to refer to object by
     *
     * @param source Attribution source of object (hardcoded in MapDBServer)
     */
    public MappableEntity( long id,
                           int type,
                           String name,
                           String source ) {
        this.id = id;
        this.type = type;
        this.name = name;
        this.source = source;
    }

    public long getID() {
        return this.id;
    }
  
    public int getType() {
        return this.type;
    }
    
    public String getName() {
        return this.name;
    }

    public String getFullName() {
        return this.fullName;
    }
        
    public String getDescription() {
        return this.description;
    }
  
    public String getSource() {
        return this.source;
    }
  

    // Set methods
    public void setID( long id ) {
        this.id = id;
    }

    public void setType( int type ) {
        this.type = type;
    }

    public void setName( String name ) {
        this.name = name;
    }

    public void setFullName( String fullName ) {
        this.fullName = fullName;
    }

    public void setSource( String source ) {
        this.source = source;
    }

    public void setDescription( String description ) {
        this.description = description;
    }

    public void setAccessionNumber( String[] accessionNumber ) {
        this.accessionNumber = accessionNumber;
    }

    public String[] getAccessionNumber() {
        return this.accessionNumber;
    }
}



