/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.util.*;
import java.io.*;
import java.lang.*;

/**
 *
 * A collection of Fasta Meta Data derived from a centralized data source 
 *
 */

public class FastaMetaDataInfo {

    /* Pivate member variables */
    private List dataSet;

    /**
     * Constructor 
     *
     * Loads Fasta Meta Data from from the file specified by 
     * the system property: FASTA_META_CONF_FILE
     * @see ${HOME}/data/FASTA/fastaMetaData
     *
     */
    public FastaMetaDataInfo() throws InvalidParameterException{
	
	dataSet = new LinkedList();

	try {
            load(getClass().getClassLoader().getResourceAsStream(WebApp.getProperty( "FASTA_META_CONF_FILE" )));
        } catch ( IOException ioe ) {
            throw new InvalidParameterException( ioe.getMessage() );
        }                                           
    }


    /**
     * Loads Fasta Meta Data from input stream.
     * Assumes the first line does not contain valid Fata Meta Data information.
     * Line should be tab delimited and contain the following fields:
     *      Name Type NumSeqs Residues Date Description
     */
    private void load(InputStream metaDataFile) throws IOException {

	BufferedReader in = null;

	try {
	    in = new BufferedReader(new InputStreamReader(metaDataFile, "UTF8"));
	    
	    String str;

	    in.readLine();

	    while ((str = in.readLine()) != null) {

		String[] lineInfo = str.split("\\t");

		if (lineInfo.length == 6) {
		    FastaMetaData data = 
			new FastaMetaData( lineInfo[0],
					   lineInfo[1],
					   lineInfo[2],
					   lineInfo[3],
					   lineInfo[4],
					   lineInfo[5] );

		    dataSet.add(data);
		} else {
		    throw new RuntimeException("Invalid FastaMetaData");
		}
	    }

	} catch (UnsupportedEncodingException e) {
	    throw new RuntimeException(e);
	} finally {
	    if (in != null) {
		in.close();
	    }
	}

    }

    /* Returns a map of Fasta Meta Data name to its description */
    public Map getNameDescriptionMap () {
	
	Iterator itr = dataSet.iterator();
	Map dataMap = new HashMap();
	
	while(itr.hasNext()) {
	    FastaMetaData data = (FastaMetaData) itr.next();
	    dataMap.put(data.getName(), data.getDescription());
	}

	return dataMap;

    }

    public Iterator getDataIterator() {
	return dataSet.iterator();
    }

    public Iterator getBreakIterator() {
	
	List breaks = new LinkedList();
	
	Iterator itr = dataSet.iterator();

	FastaMetaData last = null;
	FastaMetaData next = null;

	for (int i = 0; itr.hasNext(); i++) {
	    next = (FastaMetaData) itr.next();
	    if (last != null && !next.getGroup().equals(last.getGroup())) {
		breaks.add(new Integer(i));
	    }
	    last = next;
	}

	return breaks.iterator();
    }

}


