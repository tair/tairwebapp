//------------------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// $Revision: 1.39 $
// $Date: 2005/08/15 22:03:40 $
//------------------------------------------------------------------------------
package org.tair.search;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.tair.tfc.DBconnection;
import org.tair.tfc.TfcGlobalAssignment;
import org.tair.utilities.DataConstants;
import org.tair.utilities.InvalidFormException;
import org.tair.utilities.TextConverter;


/**
 * Units is an all purpose class for translating search by assignment values 
 * received from search form input into values that can be used as part of a 
 * larger search (i.e. for clone, marker & gene searches). Units is used 
 * especially for determining what start and end position values to use when 
 * user enters a map element name as the high or low range, and for adding
 * in standard variance when searching "around" elements. Map element positions
 * are stored as the elements position directly on the chromosome, or top map. 
 * Once values are determined, Units stores positions in member variables for
 * use in the larger search.
 */


public class Units implements java.io.Serializable {   

    // translated start position

    private Double startPosition;

    // translated end position

    private Double endPosition ;

    // units for start position

    private String highUnits;

    // units for end position

    private String lowUnits;

    // assignment for low range

    private TfcGlobalAssignment lowAssignment;

    // assignment for high range

    private TfcGlobalAssignment highAssignment;

    // chromosome of low range assignment - from top map

    private String lowChromosome;

    // chromosome of high range assignment - from top map

    private String highChromosome;
  
    // Flags for whether to use chromosome values found by 
    // searching assignments in full search -- if searching by
    // element name (i.e. clone, gene name etc.), need to use these
    // for restricting elements in full search to chromosome elements
    // were found on; if searching by raw kb values, not necessary 
    // to use chromosome values for assignment.  These two values are
    // both examined to determine an overall value of 
    // "useAssignmentChromosome()"

    private boolean useHighChromosome = false;
    private boolean useLowChromosome = false;

    /**
     * Creates an instance of Units that contains position data for the 
     * search-by-assignment values contained in search params
     * 
     * @param conn An active connection to the database
     * @param searchParams GlobalAssignment search parameters received from 
     * search form
     * @throws SQLException in the case of an invalid operation or database 
     * error
     * @throws InvalidFormException thrown if invalid map data entered, or 
     * if submitted map element has multiple assignments, making it 
     * impossible to search by
     */

    public Units( DBconnection conn, Map searchParams ) 
        throws SQLException, InvalidFormException {

        String highUnit = (String) searchParams.get( "high_unit" );
        String highRange = (String) searchParams.get( "high_range" );
        String lowUnit = (String) searchParams.get( "low_unit" );
        String lowRange = (String) searchParams.get( "low_range" );

        // only continue to do searches if we have params

        if ( ( highUnit != null && highRange != null ) || 
             ( lowUnit != null && lowRange != null ) ) {
            checkRange( searchParams );
            retrieveAssignments( conn, searchParams );
            setRanges( conn, searchParams );
        }
    }

    /*
     * determine whether submitted units is a valid object type (will fail if 
     * submitting cM or bp/kb) - this check is done a number of times so it's 
     * useful to centralize here
     */

    private boolean validObjectType( String unitType ) {

        boolean valid = false;

        if ( unitType != null ) {
            if ( unitType.equalsIgnoreCase( "gene" ) ||
                 unitType.equalsIgnoreCase( "clone" ) || 
                 unitType.equalsIgnoreCase( "marker" ) ||

                 // AGI gene searching is listed as locus - input will be 
                 // trimmed to remove the splice variant suffix (.#) if 
                 // present, before searching gene

                 unitType.equalsIgnoreCase( "locus" ) ||

                 // Assembly Unit units is submitted as "AGI clone" 
                 // to differentiate it from other clones in Clone table

                 unitType.equalsIgnoreCase( "AGI clone" ) ) {

                valid = true;
            }
        }

        return valid;
    }

    /*
     * If range type is "around", only use a single value for doing 
     * assignment translation.  Check both high & low entries - if value 
     * found in high, but not low, switch values around since a fair amount 
     * of code in this object and the Searchers assumes that the "around" 
     * search value will be in the low_range position.  Kinda yucky, but an 
     * easy change that can be done here w/out impacting other code at all
     */

    private void checkRange( Map searchParams ) 
        throws InvalidFormException {

        String highUnit = (String) searchParams.get( "high_unit" );
        String highRange = (String) searchParams.get( "high_range" );
        String lowUnit = (String) searchParams.get( "low_unit" );
        String lowRange = (String) searchParams.get( "low_range" );
        String rangeType = (String) searchParams.get( "range_type" );

        if ( rangeType != null && rangeType.equals( "around" ) ) {
            if ( lowRange == null ) {
                lowRange = highRange;
                lowUnit = highUnit;
                highRange = null;
                highUnit = null;
            }
        }

        searchParams.put( "high_unit", highUnit );
        searchParams.put( "high_range", highRange );
        searchParams.put( "low_unit", lowUnit );
        searchParams.put( "low_range", lowRange );
    }

    /**
     * Ensures that map type input is of proper type to create a Units object
     * This method allows us to check whether Units object can be created and
     * leave it null if missing or invalid map type -- this is helpful because
     * searches that use this info rely on being able to check for Units being
     * null or not, and it's easiest to preserve this behaviour.
     *
     * @return <code>true</code> if submitted map type is valid; 
     * <code>false</code>
     * if submitted map type is not valid
     */

    public static boolean validMapType( String map_type) {

        boolean canCreate = false;

        if ( map_type == null ) {
            canCreate = false;
        } else if ( map_type.equals( "RI" ) ) {
            canCreate = true;
        } else if ( map_type.equals( "AGI" ) ) {
            canCreate = true;
        } else if ( map_type.equalsIgnoreCase( "classical" ) ) {
            canCreate = true;
        } else if ( map_type.equalsIgnoreCase( "physical" ) ) {
            canCreate = true;
        } else {
            canCreate = false;
        }

        return canCreate;
    }

    /*
     * Generic processing of Assignment query. Assignment data is stored as 
     * TfcGlobalAsssignment, and reference is set to highAssignment or 
     * lowAssignment based on the value of isLowAssignment. Returns count 
     * of assignments found for this query. If map element entered for range 
     * has  more one assignment for this map/chromosome combo, calling method 
     * should throw exception since range can't be used because we can't 
     * know  which assignment values to use to anchor larger search.
     */

    private int processResults( DBconnection conn, String query, 
                                boolean isLowAssignment ) 
        throws SQLException {

        int counter = 0;
        ResultSet results = null;
        TfcGlobalAssignment assignment = new TfcGlobalAssignment();
    
        conn.setQuery( query );    
        results = conn.getResultSet();	
	    
        while ( results.next() ) {
            long id = results.getLong( "tair_object_id" );
            if ( !results.wasNull() ) {
                assignment.set_tair_object_id( new Long( id ) );
            }
      
            id = results.getLong( "global_assignment_id" );
            if ( !results.wasNull() ) {
                assignment.setGlobalAssignmentId( new Long( id ) );
            }
      
            id = results.getLong( "map_id" );
            if ( !results.wasNull() ) {
                assignment.setMapId( new Long( id ) );
            }
      
            id = results.getLong( "map_element_id" );
            if ( !results.wasNull() ) {
                assignment.setMapElementId( new Long( id ) );
            }
      
            float f = results.getFloat( "globalassignment_range" );
            if ( !results.wasNull() ) {
                assignment.setRange( new Float( f ) );
            }
      
            String s = results.getString( "orientation" );
            if ( s != null ) {
                assignment.setOrientation( new Character( s.charAt( 0 ) ) );
            }
      
            double d = results.getDouble( "start_position" );
            if ( !results.wasNull() ) {
		if ( assignment.getStartPosition() == null ) {
		    assignment.setStartPosition( new Double( d ) );
		}
		
		// it looks like "start_position" is always less even when the orientation is reversed
		if ( assignment.getStartPosition() > d ) {
		    assignment.setStartPosition( new Double( d ) );
		}
            }
      
            d = results.getDouble( "end_position" );
            if ( !results.wasNull() ) {
		if ( assignment.getEndPosition() == null) { 
		    assignment.setEndPosition( new Double( d ) );
		}

		// it looks like "end_position" is always greater even when the orientation is reversed
		if ( assignment.getEndPosition() < d ) {
		    assignment.setEndPosition( new Double( d ) );
		}
            }

            assignment.setAssignmentBasis( results.
                                           getString( "assignment_basis" ) );

            assignment.
                setIsDerived( TextConverter.
                              stringToBoolean( results.
                                               getString( "is_derived" ) ) );

            assignment.setUnits( results.getString( "units" ) );

            // Save chromosome value for assignment

            if ( isLowAssignment ) {
                this.lowChromosome = results.getString( "chromosome" );
            } else {
                this.highChromosome = results.getString( "chromosome" );
            }
      
            counter++;
        } 

        conn.releaseResources();

        // Set internal reference to assignment to save value

        if ( isLowAssignment ) {
            this.lowAssignment = assignment;
        } else {
            this.highAssignment = assignment;
        }

        return counter;
    }

    /*
     * translate search units if necessary -- get assignments for elements 
     * (gene, marker, clone) directly onto chromosome
     */

    private void retrieveAssignments( DBconnection conn, Map searchParams ) 
        throws SQLException, InvalidFormException {

        String chromosome = (String) searchParams.get( "chromosome" );
        String map_type = (String) searchParams.get( "map_type" );
        String query = null;
        String highUnit = null;
        String lowUnit = null;
        String highRange = null;
        String lowRange = null;
        int counter = 0;
    
        highUnit = (String) searchParams.get( "high_unit" );
        highRange = (String) searchParams.get( "high_range" );
        lowUnit = (String) searchParams.get( "low_unit" );
        lowRange = (String) searchParams.get( "low_range" );

        if ( highUnit != null ) {
            highUnit = highUnit.trim();
        }

        if ( lowUnit != null ) {
            lowUnit = lowUnit.trim();
        }
			    
        if ( highRange != null ) {

            // If searching "around" instead of "between", high range may 
            // get submitted as "--unused--". This should get caught by 
            // Handler that retrieves search params, but double check here 
            // just in case & set high range to null if unused value is 
            // submitted

            if ( highRange.equals( "--unused--" ) ) {
                highRange = null;
            } 
            else {
                highRange = highRange.trim();
                highRange = highRange.toUpperCase();
            }
        }

        if ( lowRange != null ) {
            lowRange = lowRange.trim();
            lowRange = lowRange.toUpperCase();
        }
    
        // Search high assignments if search params entered as map elements, 
        // not as raw kb or cm values

        boolean isLowAssignment = false;
        if ( !TextConverter.isEmpty( highRange ) && 
             validObjectType( highUnit ) ) {
            query = getQuery( conn, highUnit, highRange, chromosome, 
                              map_type );

            // will set reference to highAssignment if found
            counter = processResults( conn, query, isLowAssignment ); 
            if ( !"locus".equals(highUnit) && counter > 1 ) {
                throw new InvalidFormException( highUnit + " " + highRange + 
                                                " has multiple assignments " +
                                                "and cannot be used for " +
                                                "this type of search" );
            }
      
            // if no assignments found, throw input exception

            if ( this.highAssignment == null || 
                 this.highAssignment.getGlobalAssignmentId() == null ) {
                StringBuffer errMsg = new StringBuffer();
                errMsg.append( "The " + highUnit + " " + highRange + 
                               " you specified is not on<br>the " );

                if ( map_type != null && chromosome != null ) {
                    errMsg.append( " map and chromosome specified (" + 
                                   map_type + " chr " + chromosome +")" );

                } 
                else if ( map_type != null ) {
                    errMsg.append( " map specified (" + map_type + ")" );
                } 
                else if ( chromosome != null ) {
                    errMsg.append( " chromosome specified (chr " + 
                                   chromosome + ")" );
                }

                throw new InvalidFormException( errMsg.toString() );
            }

            // set flag to use high element's chromosome value in full search 
            // if user didn't enter one, and since we're trying to restrict 
            // by element's position

            this.useHighChromosome = ( chromosome == null );
        }
    
        // Search low assignments if search params entered as map elements, 
        // not as raw kb or cm values

        isLowAssignment = true;
        if ( !TextConverter.isEmpty( lowRange ) && 
             validObjectType( lowUnit ) ) {
            query = getQuery( conn, lowUnit, lowRange, chromosome, map_type );

            // will set reference to lowAssignment if found
            counter = processResults( conn, query, isLowAssignment ); 
            if ( !"locus".equals(lowUnit) && counter > 1 ) {
                throw new InvalidFormException( lowUnit + " " + lowRange + 
                                                " has multiple assignments " +
                                                "and cannot be used for " +
                                                "this type of search" );
            }
      
            // if  no assignments found, throw input exception

            if ( lowAssignment == null || 
                 lowAssignment.getGlobalAssignmentId() == null ) {
                StringBuffer errMsg = new StringBuffer();
                errMsg.append( "The " + lowUnit + " " + lowRange + 
                               " you specified is not on<br>the " );

                if ( map_type != null && chromosome != null ) {
                    errMsg.append( " map and chromosome specified (" + 
                                   map_type + " chr " + chromosome +")" );

                } 
                else if ( map_type != null ) {
                    errMsg.append( " map specified (" + map_type + ")" );
                } 
                else if ( chromosome != null ) {
                    errMsg.append( " chromosome specified (chr " + 
                                   chromosome + ")" );
                }

                throw new InvalidFormException( errMsg.toString() );
            }

            // set flag to use high element's chromosome value in full search 
            // if user didn't enter one, and since we're trying to restrict 
            // by element's position

            this.useLowChromosome = ( chromosome == null );
        }

        // can't search using entered element ranges if high & low chromosome 
        // have different values

        if ( this.highChromosome != null && 
             this.lowChromosome != null && 
             !highChromosome.equals( lowChromosome ) ) {
            throw new InvalidFormException( lowRange + " and " + highRange + 
                                            " are mapped onto different " +
                                            "chromosomes (" + lowChromosome + 
                                            " and " + highChromosome + 
                                            ") and cannot be used for this " +
                                            "type of search" );
        }
    }

    /*
     * Create query to select assignments based on criteria in searchParams. 
     * Localized here w/method params offering options - this makes it easier 
     * to maintain, even if query gets create 4x in the process of running 
     * through retrieveAssignments. If input units are kb or cM, no 
     * translation necessary, so return null query.
     */

    private String getQuery( DBconnection conn, String unit, String range, 
                             String chromosome, String map_type ) 
        throws SQLException, InvalidFormException {

        String query = null;
        StringBuffer from = new StringBuffer();
        StringBuffer where = new StringBuffer();
    
        String what = 
            "SELECT DISTINCT a.tair_object_id, " +
            "a.global_assignment_id, " +
            "a.map_id, " + 
            "a.map_element_id, " + 
            "a.globalassignment_range, " +
            "a.orientation, " +
            "a.start_position, " +
            "a.end_position, " +
            "a.assignment_basis, " +
            "a.is_derived, " +
            "a.units, " +
            "m.chromosome "; // get chromosome for assignment & store in 
                             // case user didn't enter one
    
        from.append( "FROM GlobalAssignment a, Map m " );
        where.append( "WHERE a.map_id = m.map_id " +
                      "AND a.map_element_id = g.map_element_id " +
                      "AND a.is_obsolete = 'F' " +
                      "AND g.is_obsolete = 'F' "
                      );

        // Determine table name to search -- all tables will 
        // be generically aliased as "g" in larger query

        String tableName = null;
        if ( unit.equalsIgnoreCase( "gene" ) ) {
            tableName = "Gene";

            // If AGI map is selected, gene name is listed as locus - trim 
            // input to remove the splice variant suffix (.#) if present, 
            // before searching gene names & aliases

        } 
        else if ( unit.equalsIgnoreCase( "locus" ) ) {
            tableName = "Gene";

            int dotPos = range.indexOf( "." );
            if ( dotPos > -1 ) {
                range = range.substring( 0, dotPos );
            } 
        } 
        else if ( unit.equalsIgnoreCase( "marker" ) ) {
            tableName = "GeneticMarker";
        } 
        else if ( unit.equalsIgnoreCase( "clone" ) ) {
            tableName = "Clone";
        }

        // Assembly Unit units is submitted as "AGI clone" to differentiate 
        // it from other clones in Clone table - because value submitted is 
        // used to display search criteria, just easiest to submit what we 
        // want to display to avoid having to write a translation method & 
        // embedding it in all searches

        else if ( unit.equalsIgnoreCase( "AGI clone" ) ) {
            tableName = "AssemblyUnit";
        }

        // Use combo. NameAlias tables for searching - return 
        // map_element_id to be generic

        NameFinder nameFinder = new NameFinder();
	if ( unit.equalsIgnoreCase( "locus" ) ) {
	    nameFinder.setNameFinder( tableName, "map_element_id", range, 
				      DataConstants.SEARCH_STARTS );
	} else {
	    nameFinder.setNameFinder( tableName, "map_element_id", range, 
				      DataConstants.SEARCH_EXACT );
	}

        from.append( ", " + tableName + " g " );
        where.append( "AND g.map_element_id IN " + nameFinder.getNameSql() + 
                      " " );
    
        if ( chromosome != null ) {
            where.append( " AND g.chromosome like " + 
                          TextConverter.dbQuote( "%" + chromosome + "%" ) + 
                          " " );
        }
    
        if ( map_type != null ) {
            where.append( " AND m.name LIKE " + 
                          TextConverter.dbQuote( "%" + 
                                                 map_type.toUpperCase() + 
                                                 "%" ) + " ESCAPE '\\\' " );
        }
    
        query = what + from.toString() + where.toString();

        return query;
    }
  
    /*
     * Set high & low range for entire object -- if we had to search 
     * assignments, use high & low positions retrieved for submitted map 
     * elements
     */

    private void setRanges( DBconnection conn, Map searchParams ) 
        throws SQLException, InvalidFormException {

        String method = (String) searchParams.get( "range_type" );
        this.highUnits = (String) searchParams.get( "high_unit" );
        String high_range = (String) searchParams.get( "high_range" );
        this.lowUnits = (String) searchParams.get( "low_unit" );
        String low_range = (String) searchParams.get( "low_range" );
        Double high_start = null;
        Double high_end = null;
        Double low_start = null;
        Double low_end = null;
    
        try {
            if ( !TextConverter.isEmpty( high_range ) ) {

                // if searched for map element assignments, get assignment 
                // values directly on map

                if ( validObjectType( highUnits ) ) {
                    highUnits = highAssignment.getUnits();
                    high_start = highAssignment.getStartPosition();
                    high_end = highAssignment.getEndPosition();
                }

                // else, if unit is cm, kb or bp use entered value

                else if ( highUnits.equalsIgnoreCase( "cm" ) ) {
                    highUnits = highUnits.toLowerCase();
                    high_end = new Double( Double.parseDouble( high_range ) );
                    high_start = new Double( high_end.doubleValue() );
                } 

                else if ( highUnits.equalsIgnoreCase( "kb" ) ) {
                    highUnits = highUnits.toLowerCase();
                    high_end = new Double( Double.parseDouble( high_range ) );
                    high_start = new Double( high_end.doubleValue() );
                }
	
                // if entered in bp, translate to kb
                if ( highUnits != null && 
                     highUnits.equalsIgnoreCase( "bp" ) ) {
                    highUnits = "kb";
                    high_end = new Double( high_end.doubleValue()/1000 );

                    if ( high_start != null ) {
                        high_start = new Double( high_start.doubleValue() / 
                                                 1000 );
                    }
                }
            }
      
        } 
        catch ( NumberFormatException nfe ) {
            throw new InvalidFormException( "Invalid input for high range " +
                                            "field entered: " + high_range + 
                                            ". Errors could arise from " +
                                            "using a name that does not " +
                                            "exist in our " + "database or " +
                                            "the combination of the name " +
                                            "and the unit is not correct. " );
        }

        try {
            // repeat for low range
            if ( !TextConverter.isEmpty( low_range ) ) {
                if ( validObjectType( lowUnits ) ) {
                    lowUnits = lowAssignment.getUnits();
                    low_start = lowAssignment.getStartPosition();
                    low_end = lowAssignment.getEndPosition();
                } 
                else if ( lowUnits.equalsIgnoreCase( "cm" ) && 
                          low_range != null ) {
                    lowUnits = lowUnits.toLowerCase();
                    low_start = new Double( Double.parseDouble( low_range ) );
                    low_end = new Double( low_start.doubleValue() );
                } 
                else if ( lowUnits.equalsIgnoreCase( "kb" ) && 
                          low_range!= null ) {
                    lowUnits = lowUnits.toLowerCase();
                    low_start = new Double( Double.parseDouble( low_range ) );
                    low_end = new Double( low_start.doubleValue() );	   
                }
	
                if ( lowUnits != null && lowUnits.equalsIgnoreCase( "bp" ) ) {
                    lowUnits = new String( "kb" );
                    low_start = new Double( low_start.doubleValue() / 1000 );
                    low_end = new Double( low_end.doubleValue() / 1000 );
                }
            }
      
        } 

        catch ( NumberFormatException nfe ) {
            throw new InvalidFormException( "Invalid input for low range " +
                                            "field entered: " + low_range + 
                                            ". Errors could arise from " +
                                            "using a name that does not " +
                                            "exist in our " + "database or " +
                                            "the combination of the name " +
                                            "and the unit is not correct. ");
        }
    
        if ( method != null && method.equalsIgnoreCase( "between" ) ) {
            // set start as lowest low, end as highest high
            if ( ( low_start != null && 
                   high_start != null && 
                   low_start.compareTo( high_start ) <= 0 ) || 
                 ( low_start != null && high_start == null ) ) {
                this.startPosition = low_start;
	
            } 
            else if ( ( low_start != null && 
                        high_start != null && 
                        low_start.compareTo( high_start ) > 0 ) || 
		      ( low_start == null && high_start != null ) ) {
                this.startPosition = high_start;
            }
      
            if ( ( high_end != null && 
                   low_end != null && 
                   high_end.compareTo( low_end ) > 0 ) ||
                 ( low_end == null && high_end != null ) ) {
                this.endPosition = high_end;
            } 
            else if ( ( high_end != null && 
                        low_end != null && 
                        high_end.compareTo( low_end ) <= 0 ) || 
                      ( low_end != null && high_end == null ) ) {
                this.endPosition = low_end;
            }
        } 
        else if ( method != null && method.equalsIgnoreCase( "around" ) ) {

            // if around, just add standard variance (based on units) to 
            // low_start & low_end positions set high_range value to top end 
            // of low range, rather than high of high range....

            this.highUnits = lowUnits;
            int variance = getVariance( lowUnits );
            this.startPosition = new Double( low_start.doubleValue() - 
                                             variance );
            this.endPosition = new Double( low_end.doubleValue() + variance );
        }
    }
  
    /**
     * Amount of variance to add to either end of assignment values when 
     * searching by "around" range type instead of "between".  This value is 
     * determined by submitted units (cM or kb) and is used for calculation
     * of overall start and end position to use while searching, as well
     * as for creating formatted version of search parameters for display.
     *
     * @return Variance to add or subtract from assignment positions to 
     * execute an "around" range type search
     */

    public int getVariance( String units ) {

        int variance = 0;

        if ( units != null ) {
            if ( units.equalsIgnoreCase( "cm" ) ) {
                variance = 10;
            } 
            else if ( units.equalsIgnoreCase( "kb" ) ) {
                variance = 100;
            }
        }

        return variance;
    }

    /**
     * Amount of variance to add to either end of assignment values when 
     * searching by "around" range type instead of "between".  This value is 
     * determined by units (cM or kb) and is used for calculation
     * of overall start and end position to use while searching, as well
     * as for creating formatted version of search parameters for display.
     * This version will use the value stored within the object for lowUnits,
     * which is assumed to have already been determined/translated from form
     * values
     *
     * @return Variance to add or subtract from assignment positions to 
     * execute an "around" range type search
     */

    public int getVariance() {
    
        int variance = 0;
        String units = get_low_unit();

        if ( units != null ) {
            if ( units.equalsIgnoreCase( "cm" ) ) {
                variance = 10;
            } 
            else if ( units.equalsIgnoreCase( "kb" ) ) {
                variance = 100;
            }
        }

        return variance;
    }

    /**
     * Retrieves the start position to use for searching by map location. 
     * This may either be the numeric value entered by user in search form, or 
     * the start position of an assignment for an entered element 
     * (clone gene etc.)
     *
     * @return Start position to use when searching by map location
     */

    public Double get_start() { 
        return startPosition; }

    /**
     * Retrieves the end position to use for searching by map location. 
     * This may either be the numeric value entered by user in search form, or 
     * the end position of an assignment for an entered element 
     * (clone gene etc.)
     *
     * @return End position to use when searching by map location
     */

    public Double get_end() { 
        return endPosition; }

    /**
     * Retrieves the units of measurement used for the start position 
     * (i.e. cM, bp etc.)
     *
     * @return Units of measurement for start position
     */

    public String get_low_unit() { 
        return lowUnits; }

    /**
     * Retrieves the units of measurement used for the end position (i.e. cM, bp etc.)
     *
     * @return Units of measurement for end position
     */

    public String get_high_unit() { 
        return highUnits; }

    /*
     * return stored value for whether to use high assignment's chromosome in 
     * full search or not; flag is set when assignments are searched
     */

    private boolean useHighChromosome() {
        return useHighChromosome;
    }

    /*
     * return stored value for whether to use low assignment's chromosome in 
     * full search or not; flag is set when assignments are searched
     */

    private boolean useLowChromosome() {
        return useLowChromosome;
    }

    /**
     * Determines whether an external full search should use the assignment
     * chromosome value for this object (accessible through the 
     * getAssignmentChromosome() method.  A single value is determined by 
     * examining both the high and low assignments that are found.  If 
     * chromosome value for both does not agree, an exception should be 
     * thrown before this method gets called.  
     *
     * @return <code>true</code> if full search should use the assignment 
     * chromosome value contained by this object, or <code>false</code> if 
     * full search should not the assignment chromosome value.
     */

    public boolean useAssignmentChromosome() {

        boolean useChromosome = false;

        // if both values are set to be used, return true -- assignment 
        // retrieval code should have already checked to make sure chromosome 
        // values agree

        if ( useLowChromosome() && useHighChromosome() ) {
            useChromosome = true;
        }

        // if only low chromosome value is populated, okay to use 

        else if ( useLowChromosome && highChromosome == null ) {
            useChromosome = true;
        }

        // if only high chromosome value is populated, okay to use

        else if ( useHighChromosome && lowChromosome == null ) {
            useChromosome = true;
        }

        return useChromosome;
    }

    /*
     * Retrieves chromosome the high position assignment was found on.  This 
     * value will only be populated if user is searching by map location 
     * using map element (clone, gene etc.) names instead of numeric values
     */

    private String getHighChromosome() {
        return highChromosome;
    }

    /**
     * Retrieves chromosome the low position assignment was found on.  This  
     * value will only be populated if user is searching by map location  
     * using map element (clone, gene etc.) names instead of numeric values
     */

    private String getLowChromosome() {
        return lowChromosome;
    }
		
    /**
     * Retrieves chromosome value to use in full searches if user didnt' 
     * enter a chromosome value in the search form, but is searching by map 
     * location using map element names. This single value is determined by 
     * examining the chromosome value(s) that the high and low range elements 
     * were found to be mapped onto after searching assignments. This value 
     * should never disagree; if two submitted elements are found on 
     * different chromosomes, an exception should be thrown when object is 
     * created.
     *
     * @return Chromosome value to use for in full searches if user didn't 
     * enter a chromosome value in the search form but is searching by map 
     * location using map element names.
     */

    public String getAssignmentChromosome() {

        String chromosome = null;

        if ( useLowChromosome() && useHighChromosome() ) {
            // both low & high should be same value in this case
            chromosome = getLowChromosome(); 
        }

        // else return single value that matches flag
        else if ( useLowChromosome && !useHighChromosome() ) { 
            chromosome = getLowChromosome();
        } 

        else if ( !useLowChromosome() && useHighChromosome() ) {
            chromosome = getHighChromosome();
        }
		    
        return chromosome;
    }

    /**
     * Utility method to translate search form/db values of chromosome into
     * version more useful for including in format version of search criteria
     * and on search results pages. This is useful for chloroplast & 
     * mitochondrial genome entries, where db value is "C" or "M", which is 
     * value used for searching but which isn't descriptive enough for user.  
     * Encapsulate simple logic for formatting here since it's used by all 
     * searches that use map location search band as well as any search 
     * results pages that include chromosome data and detail pages.
     *
     * <p>
     * Since chromosome field in the database may contain multiple chromosome 
     * values ( like 1,2,C etc.), returned string will contain all values in 
     * input chromosome with C or M translated to format value
     *
     * <p>
     * NULL values will be returned as "unknown"
     *
     * @param chromosome Form field value of chromosome to translate
     * @return Formatted version of chromosome value - C or M will be 
     * translated to "chloroplast genome" and "mitochondrial genome" 
     * respectively.
     */

    public static String translateChromosome( String chromosome ) {

        String translated = null;
        StringBuffer translatedBuff = null;
        char[] chromChars;

        if ( chromosome == null ) {
	    translated = "unknown";
	} else {
            int cIndex = chromosome.indexOf( "C" ); 
            int mIndex = chromosome.indexOf( "M" );

            // if C or M found in string, iterate through chars
            // manually and replace with formatted version
            if ( cIndex >-1 || mIndex > -1 ) { 
                translatedBuff = new StringBuffer();
                chromChars = chromosome.toCharArray();

                for ( int i = 0; i < chromChars.length; i++ ) {
                    if ( i == cIndex ) {
                        translatedBuff.append( "chloroplast genome" );
                    } 
                    else if ( i == mIndex ) {
                        translatedBuff.append( "mitochondrial genome" );
                    } 
                    else {
                        translatedBuff.append( chromChars[ i ] );
                    }
                }

                translated = translatedBuff.toString();
            }
 
            else { // else return input value - assumedly 1,2,3,4 or 5
                translated = chromosome;
            }
        }

        return translated;
    }

    /**
     * For unit testing only
     */

    public void test() {

        System.out.println( "end position: " + get_end() );
        System.out.println( "start position: " + get_start() );
        System.out.println( "low_unit: " + get_low_unit() );
        System.out.println( "high_unit: " + get_high_unit() );
        System.out.println( "high chromosome: " + getHighChromosome() );
        System.out.println( "use high chromosome: " + useHighChromosome() );
        System.out.println( "low chromosome: " + getLowChromosome() );
        System.out.println( "use low chromosome: " + useLowChromosome() );
        System.out.println( "**** Units content test end ****" );
    }

    /**
     * For unit testing only
     */

    public static void main( String[] args ) {
    
        try {
            DBconnection conn = new DBconnection();
            Map params = new HashMap();
            params.put( "low_unit", "gene" );
            params.put( "high_unit", "gene" );
            params.put( "range_type", "between" );
            //params.put( "low_range", "AT1G16190" );
            //params.put( "high_range", "AT1G16270" );
            params.put( "low_range", "ABI3" );
            params.put( "high_range", "ACP" );
            params.put( "map_type", "PHYSICAL" );

            Units unit = new Units( conn, params );
            unit.test();
        } 
        catch( Exception e ) {
            e.printStackTrace();
        }
    }
 
}
