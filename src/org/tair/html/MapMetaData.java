/*
 * $Id: MapMetaData.java,v 1.3 2003/09/17 17:13:09 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/



package org.tair.html;

import java.util.*;




/**
 * A singleton is used to ensure only one copy of these data is used.
 * This map information will decide which kinds of map will be displayed.
 */
public class MapMetaData extends Html
{
    final static int numberOfChromosomes = 5;
    
    private static MapMetaData maps;
    private Vector [] chromosomes;
    private Hashtable mapToHelp = new Hashtable();

    public static MapMetaData getInstance(){

	if (maps == null){
	    maps = new MapMetaData();
	}
	return maps;

    }
    
    
    protected MapMetaData()
    {
	chromosomes = new Vector[ numberOfChromosomes ];
	for( int i = 0 ; i < numberOfChromosomes ; i++  )
	    {
		chromosomes[ i ] = new Vector();
	    }
	updateMaps();


	mapToHelp.put( AGI_MAP , "mapkey2.jsp");
	mapToHelp.put( CLASSIC , "mapkey22.jsp");
	mapToHelp.put( LISTER_AND_DEAN_RI , "mapkey23.jsp");
	mapToHelp.put( MI_RFLP , "mapkey24.jsp");
	mapToHelp.put( ALTMANN , "mapkey33.jsp");
	mapToHelp.put( GOODMAN, "mapkey34.jsp");
	mapToHelp.put( GOODMAN_BAC , "mapkey35.jsp");
	mapToHelp.put( FINKELSTEIN , "mapkey36.jsp");
	mapToHelp.put( KAZUSA , "mapkey12.jsp");
	mapToHelp.put( BOUCHEZ , "mapkey38.jsp");
	mapToHelp.put( CENTURY , "mapkey39.jsp");
	mapToHelp.put( SAKAI , "mapkey10.jsp");
	mapToHelp.put( SCHMIDT , "mapkey11.jsp");


	mapToHelp.put( TIGR, "mapkey40.jsp#TIGR");
	mapToHelp.put( CSHL, "mapkey42.jsp#CSHL");
	mapToHelp.put( ESSA, "mapkey41.jsp#ESSA");


    }
    

    public Hashtable getHelpLinks(){
	return mapToHelp;
    }
    
    public Vector[] getMaps(){
	return chromosomes;
    }

    private void add( Vector map , 
		      String name , 
		      String type , 
		      String units , 
		      String unitType ,
		      boolean visible )
    {
	map.addElement( new MapGeneralInfo( name , type , units , unitType , visible ) );
    }
    
    private void updateMaps() 
    {
	Vector m0 = chromosomes[ 0 ];
	Vector m1 = chromosomes[ 1 ];
	Vector m2 = chromosomes[ 2 ];
	Vector m3 = chromosomes[ 3 ];
	Vector m4 = chromosomes[ 4 ];
	
	add(m0,AGI_MAP,TYPE_SEQUENCE,"135",cM,true);  
	add(m0,LISTER_AND_DEAN_RI,TYPE_GENETIC,"135",cM,true);
	add(m0,CLASSIC,TYPE_GENETIC,"122",cM,true);
	add(m0,MI_RFLP,TYPE_GENETIC,"153",cM,false);
	add(m0,ALTMANN,TYPE_FRAMEWORK,"29205",kb,false);
	
	//temp shut down ref seq map according to sue

	//add(m1,REFERENCE,TYPE_SEQUENCE,"19510",kb,true);
	add(m1,AGI_MAP,TYPE_SEQUENCE,"97",cM,true);  
	add(m1,LISTER_AND_DEAN_RI ,TYPE_GENETIC,"97",cM,true);
	add(m1,CLASSIC,TYPE_GENETIC,"77",cM,true);
	add(m1,MI_RFLP,TYPE_GENETIC,"84",cM,false);

	add(m1,GOODMAN,TYPE_FRAMEWORK,"17463",kb,false);  
	add(m1,GOODMAN_BAC,TYPE_PHYSICAL_MAP,"",cM,false);
	add(m1,TIGR,TYPE_PHYSICAL_SEQUENCE_BASED,"",cM,false); //new 
	add(m1,FINKELSTEIN,TYPE_CS_TILING_PATH,"",cM,false);    
	add(m1,ALTMANN,TYPE_TILING_PATH,"",cM,false); 
	
	
	
	add(m2,AGI_MAP,TYPE_SEQUENCE,"101",cM,true);  
	add(m2,LISTER_AND_DEAN_RI,TYPE_GENETIC,"101",cM,true);
	add(m2,CLASSIC,TYPE_GENETIC,"96",cM,true);
	add(m2,MI_RFLP,TYPE_GENETIC,"101",cM,false);
	add(m2,KAZUSA,TYPE_FRAMEWORK,"23560",kb,false);
	add(m2,BOUCHEZ,TYPE_CS_TILING_PATH,"",cM,false);  
	add(m2,CENTURY,TYPE_PHYSICAL_MAP,"",cM,false);  
	add(m2,SAKAI,TYPE_TILING_PATH,"",cM,false);  
	add(m2,ALTMANN,TYPE_TILING_PATH,"",cM,false);
	
	
	//add(m3,REFERENCE, TYPE_SEQUENCE , "17550" , kb , true );
	add(m3,AGI_MAP,TYPE_SEQUENCE,"125",cM,true);  
	add(m3,LISTER_AND_DEAN_RI,TYPE_GENETIC,"125",cM,true);
	add(m3,CLASSIC,TYPE_GENETIC,"76",cM,true);
	add(m3,MI_RFLP,TYPE_GENETIC,"139",cM,false);
	
	add(m3,SCHMIDT,TYPE_FRAMEWORK,"22140",kb,false);
	add(m3,ALTMANN,TYPE_TILING_PATH,"",cM,false);
	add(m3,CSHL,TYPE_PHYSICAL_SEQUENCE_BASED,"",cM,false); //new 
	add(m3,ESSA,TYPE_PHYSICAL_SEQUENCE_BASED,"",cM,false); //new 
	
	add(m4,AGI_MAP,TYPE_SEQUENCE,"139",cM,true);  
	add(m4,LISTER_AND_DEAN_RI,TYPE_GENETIC,"139",cM,true);
	add(m4,CLASSIC,TYPE_GENETIC,"98",cM,true);
	add(m4,MI_RFLP,TYPE_GENETIC,"144",cM,false);
	add(m4,KAZUSA,TYPE_FRAMEWORK,"26170",kb,false);
	add(m4,ALTMANN,TYPE_TILING_PATH,"",cM,false); 
	add(m4,CSHL,TYPE_PHYSICAL_SEQUENCE_BASED,"",cM,false);  //new 

    }
    

}
