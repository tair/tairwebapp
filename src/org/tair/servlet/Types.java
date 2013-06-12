/*
 * $Id: Types.java,v 1.11 2001/11/09 21:52:05 gc Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.servlet;

import org.tair.mapviewer.shared.*;

/**
 * This a good place to keep the different map type information.
 * Because it just keeps constants, why it is a class instead of interface?
 * you need to ask David Hanley, a interface hater.
 */
public class Types
{

    

    static final int I_LISTER_AND_DEAN = 0;
    static final int I_CLASSICAL = 1;
    static final int I_AFLP = 2;
    static final int I_MI_RFLP = 3;
    static final int I_PHYSICAL_ALTMANN = 4;
    static final int I_PHYSICAL_GOODMAN = 5;
    static final int I_PHYSICAL_TIGR = 6;
    static final int I_PHYSICAL_FINKLSTIEN = 7;
    static final int I_PHYSICAL_GOODMANBAC = 8;
    static final int I_PHYSICAL_KAZUSA = 9;
    static final int I_PHYSICAL_BOUCHEZ = 10;
    static final int I_PHYSICAL_CENTURY = 11;
    static final int I_PHYSICAL_SAKAI = 12;
    static final int I_PHYSICAL_SCHMIDT_DEAN = 13;
    static final int I_PHYSICAL_CSHL = 14;
    static final int I_PHYSICAL_ESSA = 15;
    static final int I_AGI_MAP = 16;
    static final int I_SEQUENCE_MAP = 17;
    
    static final boolean is_physical( int type )
    {
	switch( type ){
	case I_PHYSICAL_ALTMANN :
	case I_PHYSICAL_GOODMAN :
	case I_PHYSICAL_TIGR :
	case I_PHYSICAL_FINKLSTIEN :
	case I_PHYSICAL_GOODMANBAC :
	case I_PHYSICAL_KAZUSA :
	case I_PHYSICAL_BOUCHEZ :
	case I_PHYSICAL_CENTURY :
	case I_PHYSICAL_SAKAI :
	case I_PHYSICAL_SCHMIDT_DEAN :
	case I_PHYSICAL_CSHL :
	case I_PHYSICAL_ESSA :
	    return true;
	default :
	    return false;
	}
    }
    
    
    /**
     * Seems not used anywhere. should be readed from somewhere instead of 
     * hard coded here
     */
    static final int [] chromosome_lengths =
    {
	30699655,	
	19819362,	
	24434146,	
	17792108,	
	27653444
    };
    
    static final int [] types1 = 
    {
	I_AGI_MAP , 
	I_LISTER_AND_DEAN , 
	I_CLASSICAL , 
	I_MI_RFLP , 
	I_PHYSICAL_ALTMANN 
    };
    
    
    static final int [] types2 =
    {
	//I_SEQUENCE_MAP , // 12/08/2000 
	I_AGI_MAP , 
	I_LISTER_AND_DEAN , 
	I_CLASSICAL , 
	I_MI_RFLP , 
	I_PHYSICAL_GOODMAN , 
	I_PHYSICAL_GOODMANBAC , 
	I_PHYSICAL_TIGR, // new 10/19/2001
	I_PHYSICAL_FINKLSTIEN , 
	I_PHYSICAL_ALTMANN
    };
    
    
    static final int [] types3 =
    {
	I_AGI_MAP , 
	I_LISTER_AND_DEAN , 
	I_CLASSICAL , 
	I_MI_RFLP , 
	I_PHYSICAL_KAZUSA , 
	I_PHYSICAL_BOUCHEZ , 
	I_PHYSICAL_CENTURY , 
	I_PHYSICAL_SAKAI , 
	I_PHYSICAL_ALTMANN 
    };
    
    
    static final int [] types4 =
    {
	//I_SEQUENCE_MAP , // 12/08/2000 
	I_AGI_MAP , 
	I_LISTER_AND_DEAN , 
	I_CLASSICAL , 
	I_MI_RFLP , 
	I_PHYSICAL_SCHMIDT_DEAN ,
	I_PHYSICAL_ALTMANN, 
	I_PHYSICAL_CSHL, // new 10/19/2001
	I_PHYSICAL_ESSA // new 10/19/2001
    };
    
    
    static final int [] types5 =
    {
	I_AGI_MAP , 
	I_LISTER_AND_DEAN , 
	I_CLASSICAL , 
	I_MI_RFLP , 
	I_PHYSICAL_KAZUSA ,
	I_PHYSICAL_ALTMANN ,
	I_PHYSICAL_CSHL // new 10/19/2001
	
    };
    
    
    static final int [][] chromoTypes  = 
    {
	types1 , types2 , types3 , types4 , types5 
    };
    
    
    static int translateType( int chromo , int type )
    {
	return chromoTypes[ chromo ][ type ];
    }
    
    
    
    static int StringTypeToInt( String s )
    {
	for( int a = 0 ; a < typeNames.length ; ++ a )
	    {
		if ( typeNames[ a ].equals( s ) )
		    {
			return a;
		    }
	    }
	return -1;
    }
    
    public final static MapType genType = MapType.GENETIC;
    public final static MapType physType = MapType.PHYSICAL;
    public final static MapType agiType = MapType.AGI;
    public final static MapType refseqType = MapType.REFSEQ; 
    
    static final int highestTypeIndex = I_SEQUENCE_MAP;
    
    public static String AGI_MAP = "AGI Map";
    public static String LISTER_AND_DEAN_RI = "Lister & Dean RI";
    public static String CLASSIC = "Classical"; 
    public static String MI_RFLP = "mi-RFLP";
    public static String ALTMANN = "Altmann";
    //public static String REFERENCE = "Ref. Sequence";
    public static String GOODMAN = "Goodman";
    public static String GOODMAN_BAC = "GoodmanBAC";
    public static String FINKELSTEIN = "Finkelstein";
    public static String KAZUSA = "Kazusa";
    public static String BOUCHEZ = "Bouchez";
    public static String CENTURY = "Century";
    public static String SAKAI = "Sakai";
    public static String SCHMIDT = "Schmidt_Dean";

    public static String TIGR = "TIGR";
    public static String CSHL = "CSHL";
    public static String ESSA = "ESSA";
    
    // length = 18
    static final String [] typeNames = 
    {
	LISTER_AND_DEAN_RI ,
	CLASSIC ,
	"AFLP" ,
	MI_RFLP ,
	ALTMANN ,
	GOODMAN ,
	TIGR ,
	FINKELSTEIN ,
	GOODMAN_BAC ,
	KAZUSA ,
	BOUCHEZ ,
	CENTURY ,
	SAKAI ,
	SCHMIDT ,
	CSHL ,
	ESSA ,
	AGI_MAP //, 
	//REFERENCE
    };
    
    public static String TYPE_SEQUENCE = "sequence";
    public static String TYPE_GENETIC = "genetic";
    public static String TYPE_FRAMEWORK = "framework";
    public static String TYPE_PHYSICAL_MAP = "physical map";
    public static String TYPE_TILING_PATH = "tiling path";
    public static String TYPE_CS_TILING_PATH = "clone-sized tiling path";
    public static String TYPE_PHYSICAL_SEQUENCE_BASED = "physical_sequence_based";
    
    public static String cM = "cM";
    public static String kb = "kb";
    
}
