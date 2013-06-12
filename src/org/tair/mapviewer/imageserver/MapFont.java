/*
 * $Id: MapFont.java,v 1.7 2005/12/06 00:28:24 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.mapviewer.imageserver;

import java.awt.*;
import java.awt.geom.*;

public class MapFont
{
    private int verticalFontSize;
    private String verticalFontName;
    private Font verticalFont;
    private Font unitsFont;
    private Font labelFont;
    private Font bpFont;

    private FontMetrics verticalFontMetrics;
    private FontMetrics unitsFontMetrics;
    private FontMetrics labelFontMetrics;

    // Swing doesn't seem able to calculate text heights and widths very accurately;
    // in fact in seems to be off by a constant factor; these variable lets us
    // decide what that factor should be; they can be set at runtime by specifying
    // the 'FontHeightFactor' and 'VerticalFontWidthFactor' system properties, 
    // since these value seems to change between platforms
    private double fontHgtFactor;
    private double vertFontWidthFactor;

    static MapFont mf = new MapFont();
    public static MapFont get()
    {
      return mf;
    }

    MapFont()
    {
	// "0.8" works very well on porfidio!
	fontHgtFactor = 
	    Double.parseDouble( System.getProperty( "FontHeightFactor", "0.8" ) );
	// "0.9" works very well on porfidio!
	vertFontWidthFactor = 
	    Double.parseDouble( System.getProperty( "VerticalFontWidthFactor", "0.9" ) );

	String unitsFontName = System.getProperty( "UnitsFontName", "Monospaced" );
	int unitsFontSize = Integer.getInteger( "UnitsFontSize", 14 ).intValue();

	String labelFontName = System.getProperty( "LabelFontName", "Monospaced" );
	int labelFontSize = Integer.getInteger( "LabelFontSize", 12 ).intValue();

	// vertical font size should normally be same as label font size, but 
	// rotation causes vertical font to look a little worse, so a separate 
	// (hopefully larger) font can be independently specified
	verticalFontName = labelFontName;
	verticalFontSize = Integer.getInteger( "VerticalFontSize", 14 ).intValue();

	unitsFont = new Font( unitsFontName, Font.PLAIN, unitsFontSize );
	labelFont = new Font( labelFontName, Font.PLAIN, labelFontSize );
	bpFont = new Font("Monospaced", Font.PLAIN, 13);

	//warning: getFontMetrics(java.awt.Font) in java.awt.Toolkit has been deprecated
	unitsFontMetrics = Toolkit.getDefaultToolkit().getFontMetrics( unitsFont );
	labelFontMetrics = Toolkit.getDefaultToolkit().getFontMetrics( labelFont ); 
    } 
	

    private void initVerticalFont() 
    {
	// Create a transformation for the font.
	AffineTransform fontAT = new AffineTransform();
	fontAT.setToRotation( -Math.PI / 2 );
	// Create a Font Object.
	Font tmpFont = new Font( verticalFontName, Font.PLAIN, verticalFontSize );
	// Derive a new font using the rotation transform
	verticalFont = tmpFont.deriveFont( fontAT );

	verticalFontMetrics = //new FontMetrics( tmpFont );

 	    Toolkit.getDefaultToolkit().getFontMetrics( tmpFont );
    } 

    public Font getVerticalFont()
    {
	if ( verticalFont == null ) {
	    initVerticalFont();
	} 
	return verticalFont;
    }

    public int getVerticalFontAscent()
    {
	if ( verticalFontMetrics == null ) {
	    initVerticalFont();
	}
	// fontHgtFactor is a magic number that makes the value
	// more correct; the returned value is too big
	return (int) ( verticalFontMetrics.getAscent() * fontHgtFactor );
	// 	    verticalFontMetrics.getLeading();
    } 

    public int getVerticalFontHeight()
    {
	if ( verticalFontMetrics == null ) {
	    initVerticalFont();
	}
	// fontHgtFactor is a magic number that makes the value
	// more correct; the returned value is too big
	return (int) ( verticalFontMetrics.getHeight() * fontHgtFactor );
    }

    public int getVerticalFontTextWidth( String s ) 
    {
	if ( verticalFontMetrics == null ) {
	    initVerticalFont();
	}
	return (int) ( verticalFontMetrics.stringWidth( s ) * vertFontWidthFactor + 6); 
	// + 6 added by gc for temp. fix of incorrect width returned by this method.
    } 
    public Font getUnitsFont()
    {
	return unitsFont;
    } 

    public FontMetrics getUnitsFontMetrics()
    {
	return unitsFontMetrics;
    } 

    public int getUnitsFontHeight()
    {
	return unitsFontMetrics.getHeight();
    } 
	
    public int getUnitsFontAscent()
    {
	return (int) (unitsFontMetrics.getAscent() * fontHgtFactor );
    } 

    public Font getLabelFont()
    {
	return labelFont;
    }

    public Font getBpFont()
    {
	return bpFont;
    }

    public FontMetrics getLabelFontMetrics()
    {
	return labelFontMetrics;
    } 

    public int getLabelFontHeight()
    {
	return labelFontMetrics.getHeight();
    } 

    public int getLabelFontAscent()
    {
	return labelFontMetrics.getAscent();
    }

    public int getLabelFontTextWidth( String s ) 
    {
	return labelFontMetrics.stringWidth( s );
    } 
}
