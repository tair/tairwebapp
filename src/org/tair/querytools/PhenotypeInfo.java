/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;

/**
 * PhenotypeInfo is a light weight class used to store select information about a phenotype and related data
 */

public class PhenotypeInfo {

	String phenotype, label, refType;
	Long refId;

	public PhenotypeInfo(String phenotype, Long refId, String refType, String label){
		this.phenotype = phenotype != null ? phenotype : "";
		this.refId = refId;
		this.refType = refType != null ? refType : "";
		this.label = label != null ? label : "";
	}

	public String getPhenotype(){
		return phenotype;
	}

	public Long getReferenceId(){
		return refId;
	}

	public String getReferenceType(){
		return refType;
	}

	public String getLabel(){
		return label;
	}
}
