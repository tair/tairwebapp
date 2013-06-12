/*
 *
 * $Id: MapType.java,v 1.4 2000/11/21 18:47:43 gc Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */
package org.tair.mapviewer.shared;


public class MapType 
{
  private static int index_roller = 0;
  private int typeIndex;

   private MapType()
   {
     typeIndex = index_roller++;
   }

  public int getTypeIndex()
    {
      return typeIndex;
    }

  public static final MapType UNDEFINED  = new MapType();
  public static final MapType GENETIC = new MapType();
  public static final MapType PHYSICAL = new MapType();
  public static final MapType AGI = new MapType();
  public static final MapType REFSEQ = new MapType();

  static MapType [] types =
  {
    UNDEFINED ,
    GENETIC , 
    PHYSICAL ,
    AGI , 
    REFSEQ
  };

  public static MapType fromLong( int i )
    {
      return types[ i ];
    }
}
