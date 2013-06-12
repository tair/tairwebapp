/*
 * $Id: UserSession.java,v 1.30 2005/12/06 00:28:00 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.servlet;

import java.io.*;
import java.util.*;

import org.ncgr.util.*;
import org.tair.html.*;
import org.tair.mapviewer.imageserver.*;

import org.tair.utilities.InvalidDisplayRangeException;


/**
 * UserSession keep track of all the information about one user. 
 * When user click the chooser page, search, zoom in, zoom out, ...,
 * BioServlet just ask UserSession to handle them.
 */
public class UserSession implements Serializable, NotifiedByCompletion, Cloneable {


    /**
     * this is the session ID
     */
    private String id; 
    
    /**
     * the summary of the search results, if any
     */
    private boolean [] searchSummary = new boolean[ 0 ];
    
    /**
     *
     */
    private boolean [] chromosomeHit = new boolean[ 5 ];
    
    /**
     * This is the zoom-band-controller list. It only contain the bands 
     * of current display.
     */
    private BandMaster [] allBands;

    /**
     *
     */
    private BandMaster bandMasters[][] = new BandMaster[5][];

    /**
     *
     */
    private boolean chromosomeBandsHit[][] = new boolean[5][];
    
    
    /**
     * this is how many images we need to draw;
     * it is used to determine when all the band
     * drawing threads have completed their jobs
     */
    private int imagesToDraw;
    
    /**
     * this is referenced by the band drawers to generate
     * HTML. 
     */ 
    private MapHtml htmlMaker;

    /**
     * chooser page, home page of mapviewer
     */
    private MapPickerHtml homeHtml;
    

    /**
     * this is the URL of a separate page indicating that 
     * the last action was an error
     */
    private String error = null;

    /**
     *
     */
    private boolean isPopup = false;

    /**
     *
     */
    private Logger logger;
    
    
    /**
     * the consrtuctor merely accepts the ID for the session. 
     */
    public UserSession( Logger logger, String id ) {
        this.logger = logger;
        this.id = id;
    }
    
 

    /**
     * if there are no arguments, the user is starting up; 
     * give them the "picker or chooser screen."
     */
    private void startUp( PrintWriter ps, int chr, String error ) {
        
        if ( homeHtml == null ) {
            homeHtml = new MapPickerHtml();
        }

        homeHtml.setChromosome( chr );
        homeHtml.setError( error );
        homeHtml.output( ps );
    }
    


    /**
     * since the ID sometimes has text in there, trim it
     * out if there is any
     */
    private String trimOutText( String s ) {
        if ( s.length() > 0 ) {
            char c = s.charAt( 0 );
            if ( Character.isDigit( c ) == false ) {
                return trimOutText( s.substring( 1 ) );
            }
        }
        return s;
        
    }
    

    /**
     * get the band= data out of the parsed hashtable,
     * and return it as an int.  If there is no band=
     * return -1 singaling an error
     */
    private int getBandNumber( Hashtable queries ) {
        try {
            String sbid = (String) queries.get( "band" );
            sbid = trimOutText( sbid );
            return Integer.parseInt( sbid );

        } catch ( Exception e ) {
            return -1;
        }   
    } 
    
    
    
    /**
     * given an action, carrit it out, potentlly differentiating it
     * to a group or single band activity.
     */
    public void invoke( PrintWriter outputWriter, Hashtable queries ) {
        
        if ( queries.size() == 0 ) {
            startUp(  outputWriter, 1, null );
            return;
        }
        
        if ( queries.size() == 1 ) {
            String ts = (String) queries.get( "chr" );
            if ( ts != null ) {
                int i = Integer.parseInt( ts );
                startUp( outputWriter, i, null );
                
                return;
            }
        }

        String action = null;

        if ( queries.get( "action" ) == null ) {
            action = "picked";
        } else {
            action = (String) queries.get( "action" );
        }
        
       
        int band = getBandNumber( queries );
        
        try {
            if ( action.equals( "picked" ) ) {
                pickerUsed( outputWriter, queries );
                return;
                // search from chooser page for all chromosomes
            } else if ( ( queries.size() == 2 ) && 
                        ( queries.get( "action" ).equals( "search" ) ) &&
                        ( queries.get( "value" ) != null ) ) {

                searchAllChromosomes( outputWriter, 
                                      (String) queries.get( "value" ), 
                                      true );
                return;

                // this happens after user session expired
            } else if ( allBands == null ) {
                startUp(  outputWriter, 1, "session" );
                return;

            } else if ( action.equals( "show" ) ) {
                setSelectedBandsVisible( outputWriter, queries );
                return;

            } else if ( action.equals( "forward" ) ) {
                int chr = Integer.parseInt( (String)queries.get( "chr" ) ) - 1;
                showSearchResultForChromosome( outputWriter, chr );           
                return;
            }

            
            if ( band == -1 ) {

                if ( action.equals( "print" ) ) {
                    printVer( outputWriter );

                } else if ( action.equals( "reload" ) ) {
                    reload( outputWriter );         

                } else if ( action.equals( "search" ) ) {
                    search( outputWriter, queries );

                } else if ( action.equals( "left" ) ) {
                    scrollLeft(  outputWriter );

                } else if ( action.equals( "right" ) ) {
                    scrollRight(  outputWriter );

                } else if ( action.equals( "zoomin" ) ) {
                    zoomIn( outputWriter );

                } else if ( action.equals( "zoomout" ) ) {
                    zoomOut( outputWriter );

                } else if ( action.equals( "rows" ) ) {
                    setDisplayRows( outputWriter, queries );

                } else if ( action.equals( "accession" ) ) {
                    searchByAccession( outputWriter, queries );

                } else {
                    startUp(  outputWriter, 1, "Unknown directive: " + action );
                    logger.logError( "Unknown directive: " + action );
                }

            } else {

                if ( action.equals( "search" ) ) {
                    search( outputWriter, band, queries );

                } else if ( action.equals( "zoneto" ) ) {
                    zoneTo( outputWriter, band, queries );

                } else if ( action.equals( "zoomto" ) ) {
                    zoomTo( outputWriter, band, queries );

                } else if ( action.equals( "left" ) ) {
                    scrollLeft(  outputWriter, band );

                } else if ( action.equals( "right" ) ) {
                    scrollRight(  outputWriter, band );

                } else if ( action.equals( "zoomin" ) ) {
                    zoomIn( outputWriter, band );

                } else if ( action.equals( "zoomout" ) ) {
                    zoomOut( outputWriter, band );

                } else if ( action.equals( "yugo" ) ) {
                    yugo( outputWriter, band, queries );

                } else {
                    startUp(  outputWriter, 1, "Unknown directive: " + action );
                    logger.logError( "Unknown directive: " + action );
                }
            }
        } catch ( Exception e ) {
            startUp(  outputWriter, 1, "Error:<BR>" + e );
            logger.logException( e );
        }
    }
    
    
    /**
     * The user has chosen a numeric zone from the chooser
     * jump directly to that zone.
     * Do not collect $200; do not pass go.
     * Should only between 0 and 
     */
    private void zoneTo( PrintWriter ps, int band, Hashtable queries )
        throws MapNotFoundException, InvalidDisplayRangeException {
        
        int zone = 0;
        int zoomIndex = 0;
        
        try {

            zone = Integer.parseInt( (String) queries.get( "zone" ) );
            zoomIndex = Integer.parseInt( (String) queries.get( "zoomto" ) );

        } catch ( NumberFormatException e ) {
            e.printStackTrace();
        }

        allBands[ band ].setZoomIndex( zoomIndex );
        allBands[ band ].setZone( zone );
        genImages( ps, band );
    }
    
    
    /**
     * Update the visible bands based on the 
     * band on/off strings passed in by wen.
     * This can be done from a number of locales, 
     * so it's abstracted.
     */
    private void setSelectedBandsVisible( Hashtable queries ) {
        for ( int a = 0; a < allBands.length; ++a ) {
            String s = (String) queries.get( "map" + a );
            BandMaster bm = allBands[ a ];
            bm.setVisible( s != null && s.equals( "on" ) );
        }
    }
    
    
    /**
     * The user is viewing for the first time.  Update the 
     * active bands and generate the page
     */
    private void setSelectedBandsVisible( PrintWriter ps, Hashtable queries )
        throws MapNotFoundException, InvalidDisplayRangeException {
        setSelectedBandsVisible( queries );
        genImages( ps, -1 );
    }
    
    

    /**
     * Gets the BandMasters of this chromosome
     *
     * @param chromosome the chromosome of interest
     * @return a array of BandMaster objects associated with the chromosome.
     * @see org.tair.DescriptorWrapper#getWrappersForChromo( int, Logger )
     */
    private BandMaster [] getBandsFor( int chromosome ) {
        DescriptorWrapper [] dws = 
            DescriptorWrapper.getWrappersForChromo( chromosome, logger );

        int nBands = dws.length;
        BandMaster [] bands = new BandMaster[ nBands ];

        for ( int a = 0; a < nBands; ++ a ) {
            try {
                BandMaster band = new BandMaster( dws[ a ] );
                bands[ a ] = band;

            } catch ( Exception e ) {
                logger.logException( "Error constructing band : ", e );
            }
        }
        return bands;
    }
    
    /**
     *
     */
    private void setTheZone( Hashtable queries ) {
        int pos = 0;
        try {
            pos = Integer.parseInt( (String) queries.get( "pos" ) );

        } catch ( NumberFormatException e ) {
            e.printStackTrace();
        }
        
        double posFrac = ( pos / 240.0 );
        
        for ( int a = 0; a < allBands.length; ++a ) {
            if ( allBands[ a ].isVisible() ) {
                allBands[ a ].setZone( posFrac );
            }
        }
    }
    

    
    /**
     * when user click the html map from chooser page
     */
    private void pickerUsed( PrintWriter ps, Hashtable queries )
        throws MapNotFoundException, InvalidDisplayRangeException {

        int chromoViewing = Integer.parseInt( (String) queries.get( "chromosomes" ) );
        --chromoViewing;
        
        allBands = getBandsFor( chromoViewing );
        setSelectedBandsVisible( queries );
        
        setTheZone( queries );
        useDefaultRows( true );   // make sure it display the default 3 rows, 
        genImages( ps, -1 );
    }
    
    /**
     * set an arbitrary start and end point. 
     */
    private void yugo( PrintWriter ps, int band, Hashtable queries )
        throws MapNotFoundException, InvalidDisplayRangeException {

        BandMaster bm = allBands[ band ];
       
        double left = new Double( (String) queries.get( "from" ) ).doubleValue();
        double right = new Double( (String) queries.get( "to" ) ).doubleValue();
        
        if ( left > right ) {
            double temp = left;
            left = right;
            right = temp;
        }
        
        bm.setLeftRight( left, right );
        
        genImages( ps, -1 );
    }
    

    
    private void searchByAccession( PrintWriter ps, Hashtable queries )
        throws MapNotFoundException, InvalidDisplayRangeException {

        boolean found = false;  
        int chr = Integer.parseInt( (String) queries.get( "chr" ) );
        String accession =  (String) queries.get( "accession" );
        
        bandMasters[chr - 1] = getBandsFor( chr - 1 );
        // make sure not affected by previous search
        chromosomeHit[ chr - 1 ] = false;
        
        chromosomeBandsHit[ chr - 1 ] = new boolean[ bandMasters[chr - 1].length ];

        // for all bands of that chromsome
        for ( int band = 0; band < bandMasters[ chr - 1 ].length; ++ band ) {

            if ( bandMasters[ chr - 1 ][ band ].searchByAccession( accession ) ) { 
                bandMasters[ chr - 1 ][ band ].setVisible( true );
                chromosomeBandsHit[ chr -1 ][ band ] = true;
                if ( !found ) {
                    found = true;                   
                }
                if ( !chromosomeHit[ chr - 1 ] ) {
                    chromosomeHit[ chr - 1 ] = true;
                }
            }
        }                            

        // some hits for the first chromosome, display that chromosome
        if ( found )  {
            showSearchResultForChromosome( ps, chr - 1 );
            return;
        } else {
            startUp( ps, 1, "search" );
        }
    }

    /**
     * searching for a feature of a given name for all chromosomes from chooser
     * or from individual MapHtml page.
     * Store the all the search information and display the very first chromosome
     * with the hyperlinks to other chromosomes having hits.
     */
    private void searchAllChromosomes( PrintWriter ps, String target, boolean fromChooser )
        throws MapNotFoundException, InvalidDisplayRangeException {

        boolean found = false;  
        int firstChromosome = 0;

        // for all 5 chromosomes
        for ( int a = 0; a < 5; ++ a ) {

            bandMasters[ a ] = getBandsFor( a );

            // make sure not affected by previous search
            chromosomeHit[ a ] = false;
            chromosomeBandsHit[ a ] = new boolean[ bandMasters[a].length ];

            // for all bands of that chromsome
            for ( int band = 0; band < bandMasters[ a ].length; ++ band ) {
                if ( bandMasters[ a ][ band ].search( target ) ) { 
                    bandMasters[ a ][ band ].setVisible( true );
                    chromosomeBandsHit[ a ][ band ] = true;
                    if ( !found ) {
                        found = true;
                        firstChromosome = a;
                    }

                    if ( !chromosomeHit[ a ] ) {
                        chromosomeHit[ a ] = true;
                    }
                }
            }
        }

        // some hits for the first chromosome, display that chromosome
        if ( found )  {
            showSearchResultForChromosome( ps, firstChromosome );
            return;
        }

        // not found in any chromosome, popup window to say no hit.
        
        if ( !fromChooser ) {
            isPopup = true;
            genImages( ps, -1 );

        } else {
            startUp( ps, 1, "search" );
        }
    }
    
    /**
     * This method depend on the result of method searchAllChromosomes()
     */
    private void showSearchResultForChromosome( PrintWriter ps, int chromosome )
        throws MapNotFoundException, InvalidDisplayRangeException {
        allBands = bandMasters[chromosome];
        searchSummary = chromosomeBandsHit[chromosome];
        useDefaultRows( false ); // display all rows
        genImages( ps, -2 );   
    }
    
    /**
     * whenever a search, make sure the result is default or all?
     * this global control thing will likely be replaced by individual map control
     */
    private void useDefaultRows( boolean defaultRows ) {
        for ( int a = 0; a < allBands.length; ++a ) {
            allBands[ a ].displayAllRows( !defaultRows );
        }   
    }


    /**
     *
     */
    private void reload( PrintWriter ps ) {
        startUp( ps, 1, null );
        MapCache.getInstance().reloadData();
    }


    /**
     *
     */
    private boolean search( BandMaster bm, Hashtable queries )
        throws MapNotFoundException, InvalidDisplayRangeException {

        String ss = (String) queries.get( "field" );
        
        if ( bm.search( ss ) == false ) {
            return false; 
        }
        return true;
    }

    
    /**
     * search on a single band
     */
    private void search( PrintWriter outputWriter, int band, Hashtable queries )
        throws MapNotFoundException, InvalidDisplayRangeException {

        if ( !search( allBands[ band ], queries ) ) { // not found anything
            isPopup = true;
        } else {
            useDefaultRows( false );
        }

        genImages( outputWriter, band );
    }
    
    /**
     * global search
     */
    private void search( PrintWriter outputWriter, Hashtable queries )
        throws MapNotFoundException, InvalidDisplayRangeException {

        String s = (String) queries.get( "option" );
        int hits = 0;

        searchSummary = new boolean[ allBands.length ];
        
        // in case of selected band search
        if ( "selected".equals( s ) ) {

            setSelectedBandsVisible( queries );
            
            for ( int a = 0; a < allBands.length; ++a ) {
                if ( allBands[ a ].isVisible() ) {
                                                                        
                    if ( search( allBands[ a ], queries ) ) {
                        searchSummary[ a ] = true;
                        hits++;
                    }
                }
            }

            if ( hits == 0 ) {// no hit at all, bring up the popup window
                isPopup = true;
            } else { // questionable ??????????????
                useDefaultRows( false );
            }

            genImages( outputWriter, -1 );

            // in case of all bands search
        } else if ( "all".equals( s ) ) {
                
            for ( int a = 0; a < allBands.length; ++ a ) {
                if ( search( allBands[ a ], queries ) == true ) {
                    allBands[ a ].setVisible( true );
                    searchSummary[ a ] = true;
                    hits++;
                }
            }

            if ( hits == 0 ) { // no hit at all, bring up the popup window
                isPopup = true;
            } else {
                useDefaultRows( false ); // display all rows
            }
            genImages( outputWriter, -1 );

        } else {
            // search for all chromosomes from individual MapHtml page.
            searchAllChromosomes( outputWriter, 
                                  (String) queries.get( "field" ), 
                                  false );
        }
    }
    
    
    /**
     * Zooming to a level selected by users
     */
    private void zoomTo( PrintWriter outputWriter, int band, Hashtable queries )
        throws MapNotFoundException, InvalidDisplayRangeException {

        int zoomIndex = Integer.parseInt( (String) queries.get( "zoomto" ) );
        allBands[ band ].setZoomIndex( zoomIndex );
        genImages( outputWriter, band );
    }
    
    
    /**
     * Scrolling left
     */
    
    private void scrollLeft( PrintWriter outputWriter, int band )
        throws MapNotFoundException, InvalidDisplayRangeException {

        allBands[ band ].left();
        genImages( outputWriter, band );
    }
    
    /**
     *
     */
    private void scrollLeft( PrintWriter outputWriter )
        throws MapNotFoundException, InvalidDisplayRangeException {

        for ( int a = 0; a < allBands.length; ++a ) {
            if ( allBands[ a ].isVisible() ) {
                allBands[ a ].left();
            }
        }
        genImages( outputWriter, -1 );
    }
    

    /**
     * Scrolling right 
     */     
    private void scrollRight( PrintWriter outputWriter, int band )
        throws MapNotFoundException, InvalidDisplayRangeException {
        
        allBands[ band ].right();
        genImages( outputWriter, band );
    }
    
    /**
     *
     */
    private void scrollRight(  PrintWriter outputWriter )
        throws MapNotFoundException, InvalidDisplayRangeException {

        for ( int a = 0; a < allBands.length; ++ a ) {
            if ( allBands[ a ].isVisible() ) {
                allBands[ a ].right();
            }
        }
        genImages( outputWriter, -1  );
    }
    
    /**
     * Zooming in
     */       
    private void zoomIn( PrintWriter outputWriter, int band )
        throws MapNotFoundException, InvalidDisplayRangeException {

        allBands[band].zoomIn();
        genImages( outputWriter, band );
    }
    
    /**
     *
     */
    private void zoomIn( PrintWriter outputWriter )
        throws MapNotFoundException, InvalidDisplayRangeException {

        for ( int a = 0; a < allBands.length; ++ a ) {
            if ( allBands[ a ].isVisible() ) {
                allBands[ a ].zoomIn();
            }
        }
        genImages( outputWriter, -1 );
    }
    
    /**
     * zooming out 
     */ 
    private void zoomOut( PrintWriter outputWriter, int band )
        throws MapNotFoundException, InvalidDisplayRangeException {

        allBands[ band ].zoomOut();
        genImages( outputWriter, band );
    }
  
    /**
     *
     */
    private void zoomOut( PrintWriter outputWriter )
        throws MapNotFoundException, InvalidDisplayRangeException {

        for ( int a = 0; a < allBands.length; ++a ) {
            if ( allBands[ a ].isVisible() ) {
                allBands[ a ].zoomOut();
            }
        }
        genImages( outputWriter, -1 );
    }

   
     /**
     * once the user makes selection, make it to every BandMasters, 
     * no matter the MapBand is visible or not.
     *
     */
    private void setDisplayRows( PrintWriter outputWriter, Hashtable queries )
        throws MapNotFoundException, InvalidDisplayRangeException {
        
        int rows = Integer.parseInt( (String) queries.get( "rows" ) );
        
        boolean displayAllRows = false;

        if ( rows == 1 ) {
            displayAllRows = true;
        }
        
        for ( int a = 0; a < allBands.length; ++a ) {
            allBands[ a ].displayAllRows( displayAllRows );
        }
        genImages( outputWriter, -1 );
    }
     

    /**
     * generate the print version of the page 
     */
    private void printVer( PrintWriter ps ) {
        htmlMaker.print( allBands, ps );
    }
    
    
    /**
     * as images are completed, the imagesToDraw is decremented, and 
     * notify() is called.  This function then decided to terminate 
     * or not.  This is called after all the drawing threads have been
     * launched to wait until they finish.
     */
    private synchronized void waitForCompletion() {
        while ( imagesToDraw > 0 ) {
            try {
                wait();

            } catch ( Exception e ) {
                e.printStackTrace();
            }
        }
    }
    
    
    /**
     * Draw a specific band.  Don't actually draw it in here, but 
     * rather launch the thread.  
     */
    private void drawBand( int bandNum )
        throws MapNotFoundException, InvalidDisplayRangeException {

        BandMaster bm = allBands[ bandNum ];
        if ( bm.isVisible() == true ) {      
            ++imagesToDraw;
                
            BandDrawer bd =
                new BandDrawer( bm,  
                                BioServlet.BandWidth, 
                                htmlMaker, 
                                bandNum, 
                                this, 
                                true, 
                                id, 
                                logger );
                
            bm.resetMapInfo();
                
            bd.makeBand();
        }
    }
    
    
    /**
     * generate the images to the output stream. 
     */
    private void genImages( PrintWriter ps, int bn )
        throws MapNotFoundException, InvalidDisplayRangeException { 

        if ( htmlMaker == null ) {
            htmlMaker = new MapHtml(  getChromosomeString( 0 ) );
        } else {
            htmlMaker.setChromosome( getChromosomeString( 0 ) );
        }
        
        imagesToDraw = 0;
        
        for ( int a = 0; a < allBands.length; ++ a ) {
            drawBand( a );
        }
        
        waitForCompletion();
            
        htmlMaker.setPopup( isPopup ); // added by gc
        if ( bn == -2 ) {
            htmlMaker.output( allBands, searchSummary, chromosomeHit, ps, error );
        } else { 
            htmlMaker.output( allBands, searchSummary, null, ps, error );
        }
        error = null;
        isPopup = false; // added by gc 
            
        searchSummary = new boolean[ 0 ];
    
    }


    /**
     * When a band has finished drawing, this function
     * is called to report it, potentally terminating the 
     * while loop above.
     */
    public synchronized void completionNotification() {
        --imagesToDraw;
        notify();
    }
    
    
    private String getChromosomeString( int band ) {
        return " " + ( 1 + allBands[ band ].getChromosome() );
    }


}
