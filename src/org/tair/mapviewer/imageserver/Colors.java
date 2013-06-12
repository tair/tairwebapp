/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/

package org.tair.mapviewer.imageserver;

import java.awt.Color;

public interface Colors
{

  //basic colors which other things use
  static final Color lime       = new Color( 0x32 , 0xcd , 0x32 );
  static final Color fuschia    = new Color( 0xff , 0x00 , 0xff );
  static final Color cornflower = new Color( 0x00 , 0x00 , 0xcd );

  
  //map type colors
  static final Color GENETIC_MAP_COLOR = fuschia;
  static final Color SEQUENCE_MAP_COLOR = lime;
  static final Color PHYSICAL_MAP_COLOR = cornflower;

  static final Color ZoneBoxColor = Color.red;
  
  static final Color PROBE_COLOR = Color.blue;
  static final Color INVISIBLE_MARKER = Color.gray;
  static final Color HIGHLIGHTED = Color.yellow;

  static final Color ProbeLineColor = Color.black;
  
 
  static Color MarkerBandColor = Color.black;

  static final Color RULER_BAND_COLOR = Color.black;
  static final Color NUCLEOTIDE_SEQUENCE_COLOR = Color.red;

  static final Color SPECIAL_CLASSIC_MARKER_COLOR = 
  Color.blue.brighter().brighter();

  
  static final Color MARKER_COLOR = Color.black;
  static final Color SPECIAL_RI_MARKER_COLOR = Color.red;

 
  static final Color GhostlyMarker = Color.gray;

  static final Color HighlightedEntity = Color.yellow;

  //clones here
  static final Color BAC_COLOR = Color.green.brighter();
  static final Color P1_COLOR = Color.pink;
  static final Color TAC_COLOR = Color.cyan;
  static final Color YAC_COLOR = Color.blue;
  static final Color UNKNOWN_COLOR = Color.gray;
  static final Color INTENT_TO_SEQUENCE_COLOR = Color.lightGray;


 

}
