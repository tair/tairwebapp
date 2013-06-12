/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.util.*;
import java.io.*;
import java.util.regex.*;

/**
 *
 * Container class to hold Fasta meta data
 * @see FastaMetaDataInfo
 *
 */

public class FastaMetaData {

    /* Public Static Type Values */
    public static final String AA = "AA";
    public static final String DNA = "DNA";
    public static final String PROTEIN = "Protein";

    private static final Pattern group = Pattern.compile("^(\\S+)");

    /* Private variables */
    private String name;
    private String type;
    private String sumSeqs;
    private String residues;
    private String date;
    private String description;

    /* Constructor */
    public FastaMetaData ( String name,
			   String type,
			   String sumSeqs,
			   String residues,
			   String date,
			   String description ) {

	this.name = name;
	this.type = type;
	this.sumSeqs = sumSeqs;
	this.residues = residues;
	this.date = date;
	this.description = description;

    }

    /* Getters and Setters */
    public String getName() {
	return this.name;
    }

    public String getType() {
	return this.type;
    }

    public String getSumSeqs() {
	return this.sumSeqs;
    }

    public String getResidues() {
	return this.residues;
    }

    public String getDate() {
	return this.date;
    }

    public String getDescription() {
	
	if (this.type.equals(FastaMetaData.AA)) {
	    return this.description + " (" + FastaMetaData.PROTEIN + ")";
	} else {
	    return this.description + " (" + this.type + ")";
	}
    }

    public String getGroup() {
	Matcher m = group.matcher(this.getDescription());
	
	if (m.lookingAt()) {
	    return m.group();
	}

	return "";

    }


}
