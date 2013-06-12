/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/

package org.tair.mapviewer.imageserver;

import org.ncgr.util.Tileable;

public class TileableFeature implements Tileable
{
  private MapFeature feature;
  private double pixelsPerUnit;
  
  public TileableFeature( MapFeature mf , double ppu )
    {
      this.feature = mf;
      this.pixelsPerUnit = ppu;
    }

  public MapFeature getFeature()
    {
      return feature;
    }

  public int getRowsOccupied()
    {
      return 1;
    }

  public double getLeft()
    {
      return feature.getStart() * pixelsPerUnit;
    }

  public void setOffset( int i )
    {
    }

  public double getRight()
    {
      return Math.max( feature.getEnd() * pixelsPerUnit , 
		       getLeft() +  feature.getNameLengthInPixels() );
    }
}
