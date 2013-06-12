/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;
import org.tair.tfc.DBconnection;
import org.tair.utilities.DataConstants;
/**
 * GermplasmInfo is a light weight class used to store select information about a germplasm and related data
 */

public class GermplasmInfo {

	Map info, polys;
	Collection stocks, phenos;
    ImageCollection images;

	public GermplasmInfo(DBconnection conn, Long id) throws SQLException {
		info = new HashMap();
		polys = new HashMap();
		stocks = new ArrayList();
		phenos = new ArrayList();
        images = new ImageCollection(conn, id);

		String query =
		    "SELECT g.tair_object_id, g.original_name,  sv.abbrev_name, p.polymorphism_id, p.original_name as poly_original_name, s.name, s.stock_id, " + 
                " (SELECT stock_availability_type " + 
                " FROM StockAvailabilityType " + 
                " WHERE stock_availability_type_id = s.stock_availability_type_id) AS stock_availability_type, " + 
            " ph.phenotype, gp.reference_id, r.reference_type as reference_type, " + 
            " CASE " + 
                " WHEN UPPER(r.reference_type) = 'PUBLICATION' " + 
                " THEN (SELECT CASE " + 
                " WHEN authors IS NULL " + 
                " THEN NULL " + 
                " ELSE CASE " + 
                    " WHEN instr(',',authors) > 0 " + 
                    " THEN substr(authors, 1, instr(',',authors)) || ' et al.' " + 
                    " ELSE substr(authors, 1, 100) " + 
                    " END " + 
                " END || '(' || cast(publication_year AS varchar(20)) || ')' " + 
            " FROM Publication " + 
            " WHERE reference_id = gp.reference_id) " + 
            " WHEN UPPER(r.reference_type) = 'COMMUNICATION' " + 
            " THEN (SELECT name || '(' || cast(communication_date AS varchar(20)) || ')' " + 
            " FROM Communication " + 
            " WHERE reference_id = gp.reference_id) " + 
            " WHEN UPPER(r.reference_type) = 'ANALYSIS_REFERENCE' " + 
            " THEN (SELECT name || '(' || cast(date_run AS varchar(20)) || ')' " + 
            " FROM AnalysisReference " + 
            " WHERE reference_id = gp.reference_id) " + 
            " ELSE NULL " + 
            " END AS label " + 
            " FROM Germplasm g " + 
            " LEFT OUTER JOIN SpeciesVariant sv ON g.species_variant_id = sv.species_variant_id " + 
            " LEFT OUTER JOIN Germplasm_MapElement gme ON g.germplasm_id = gme.germplasm_id " + 
            " LEFT OUTER JOIN MapElement me ON gme.map_element_id = me.map_element_id " + 
            " LEFT OUTER JOIN Polymorphism p ON gme.map_element_id = p.map_element_id " + 
            " LEFT OUTER JOIN TairObject_Stock tos ON g.tair_object_id = tos.tair_object_id " + 
            " LEFT OUTER JOIN Stock s ON tos.stock_id = s.stock_id " + 
            " AND s.is_obsolete = 'F' " + 
            " LEFT OUTER JOIN Germplasm_Phenotype gp ON g.germplasm_id = gp.germplasm_id " + 
            " LEFT OUTER JOIN Phenotype ph ON gp.phenotype_id = ph.phenotype_id " + 
            " LEFT OUTER JOIN Reference r ON gp.reference_id = r.reference_id " + 
            " WHERE g.tair_object_id = ? " + 
            " ORDER BY g.tair_object_id, p.polymorphism_id, s.stock_id, ph.phenotype "; 

		conn.setQuery(query);
		conn.setQueryVariable(1,id);
		ResultSet rs = conn.getResultSet();

		if(!rs.next())
			return;

		Map stockMap = new HashMap();
		Map phenoMap = new HashMap();

		info.put("id",new Long(rs.getLong("tair_object_id")));
		info.put("original_name", rs.getString("original_name"));
		info.put("sv_abbrev", rs.getString("abbrev_name"));
		if(info.get("original_name") == null) info.put("original_name", "");
		if(info.get("sv_abbrev") == null) info.put("sv_abbrev", "");

		do {
			long pid = rs.getLong("polymorphism_id");
			String pname = rs.getString("poly_original_name");
			if(pid != 0 && pname != null)
				polys.put(new Long(pid), pname);

			Long stock = new Long(rs.getLong("stock_id"));
            if(stock != null && !stockMap.containsKey(stock) && stock != 0)
				stockMap.put(stock, new StockInfo(stock,rs.getString("name"), rs.getString("stock_availability_type")));

			String phenotype = rs.getString("phenotype");
			if(phenotype != null && !phenoMap.containsKey(phenotype))
				phenoMap.put(phenotype, new PhenotypeInfo(phenotype, new Long(rs.getLong("reference_id")), rs.getString("reference_type"), rs.getString("label")));

		} while(rs.next());

		phenos = phenoMap.values();
		stocks = stockMap.values();
	}

	public boolean hasImages(){
        return images.isEmpty();
    }
    
    public ImageCollection getImages() {
        return images;
    }

    public Long getId(){
		return (Long)info.get("id");
	}

	public String getOriginalName(){
		return (String)info.get("original_name");
	}

	public String getSpeciesVariantAbbrevName(){
		return (String)info.get("sv_abbrev");
	}

	public Map getPolymorphisms(){
		return polys;
	}

	public Collection getStocks(){
		return stocks;
	}

	public Collection getPhenotypes(){
		return phenos;
	}
    
}
