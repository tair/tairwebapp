/**
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.querytools;

import java.sql.*;
import java.util.*;
import org.tair.tfc.DBconnection;

/**
 * PolymorphismInfo is a light weight class used to store select information about a polymorphism and related data
 */

public class PolymorphismInfo {

	Long id;
	String name, type, site, mode;

	public static List getGenePolymorphisms(DBconnection conn, Long id, long limit) throws SQLException {
		return getPolymorphisms(conn, id, limit,
			"SELECT distinct p.polymorphism_id, p.original_name, p.polymorphism_type, p.allele_mode, gme.gene_feature_site " +
			" FROM Polymorphism p " +
			" JOIN MapElement_Locus pl ON p.map_element_id = pl.map_element_id AND p.is_obsolete = 'F' " +
			" LEFT OUTER JOIN Gene_MapElement gme ON gme.map_element_id = pl.map_element_id " +
			" JOIN Locus l ON pl.locus_id = l.locus_id AND l.is_obsolete = 'F' " +
			" JOIN MapElement_Locus gl ON l.locus_id = gl.locus_id " +
			" JOIN Gene g ON gl.map_element_id = g.map_element_id " +
			" WHERE g.gene_id = ? " +
			" ORDER BY lower(p.original_name)");
	}

	public static List getLocusPolymorphisms(DBconnection conn, Long id, long limit) throws SQLException {
		return getPolymorphisms(conn, id, limit,
			"SELECT distinct p.polymorphism_id, p.original_name, p.polymorphism_type, p.allele_mode, gme.gene_feature_site " +
			" FROM MapElement_Locus m " +
			" JOIN Polymorphism p ON m.map_element_id = p.map_element_id " +
			" LEFT OUTER JOIN Gene_MapElement gme ON gme.map_element_id = m.map_element_id " +
			" RIGHT JOIN Gene g ON g.gene_id = gme.gene_id and g.is_obsolete = 'F' " +
			" RIGHT JOIN MapElement_Locus l ON g.map_element_id = l.map_element_id AND l.locus_id = m.locus_id " +
			" WHERE m.locus_id = ? " +
			" AND p.is_obsolete = 'F' " +
			" ORDER BY lower(p.original_name)");
	};

	private static List getPolymorphisms(DBconnection conn, Long id, long limit, String query) throws SQLException {

		conn.setQuery(query);
		conn.setQueryVariable(1,id);
		System.out.println("poly query : " + query);
        ResultSet rs = conn.getResultSet();
		ArrayList polys = new ArrayList();
		long count = 0;

		while(rs.next())
			if(count ++ < limit)
				polys.add(new PolymorphismInfo(new Long(rs.getLong("polymorphism_id")),
				                                        rs.getString("original_name"),
				                                        rs.getString("polymorphism_type"),
				                                        rs.getString("allele_mode"),
				                                        rs.getString("gene_feature_site")));

		return Arrays.asList((Object)polys, (Object)new Long(count));
	}

	public PolymorphismInfo(Long id, String name, String type, String mode, String site) throws SQLException {
		this.id = id;
		this.name = name;
		this.type = type;
		this.site = site;
		this.mode = mode;
	}

	public Long getId(){
		return id;
	}

	public String getOriginalName(){
		return name;
	}

	public String getType(){
		return type;
	}

	public String getGeneFeatureSite(String def){
		return (site == null || "".equals(site)) ? def : site;
	}

	public String getAlleleMode(String def){
		return (mode == null || "".equals(mode)) ? def : mode;
	}
}
