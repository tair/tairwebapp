/*
 *
 * $Id: MappableEntityType.java,v 1.3 2000/11/21 18:47:44 gc Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.mapviewer.shared;

import java.util.Hashtable;

public abstract class MappableEntityType
{
  
  /**
   * type: of MappableEntity
   */
  private static final String types[] = 
  {
    "",
    "BAC",
    "P1",
    "TAC",
    "YAC",

    "NULL",
    "\\NULL",
    "unknown",
    "SSLP",
    "RFLP/SSLP",
    "PCR",
    "CAPS",
    "RFLP/CAPS",
    "CAPS/RFLP",
    "RI/CAPS",
    "RFLP",
    "RI/RFLP/CAPS",
    "CAPSunk",
    "ARMS/RFLP",
    "CAPS/SSLP",
    "SSLP/RFLP/CAPS",
    "RI/RFLP",
    "AFLP",
    "Unique",
    "Framework",
    "Multiple",
    "Contig",
    "Clone"
  };
  
  private static Hashtable typesHT;
  
  // static initialization code
  static {
    typesHT = new Hashtable();
    for(int i=0; i<types.length; i++) {
      String type = types[i];
      typesHT.put(type, new Integer(i));
    } 
  } 

  public static final int TYPE_BAC = MappableEntityType.getType( "BAC" );
  public static final int TYPE_P1  = MappableEntityType.getType( "P1"  );
  public static final int TYPE_TAC = MappableEntityType.getType( "TAC" );
  public static final int TYPE_YAC = MappableEntityType.getType( "YAC" );
  
  /**
   *
   */
  public static int getType(String key) {
    if(typesHT.containsKey(key)) {
      return ((Integer)typesHT.get(key)).intValue();
    }
    return 0;  
  }
  /**
   *
   */
  public static String getType(int value) {
    if( (value > -1) && (value < types.length) ) {
      return types[value];
    }
    return null;
  }
  
}




