// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FindGenes.java

package org.tair.genefamily;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;

import org.tair.utilities.TextConverter;


public class FindGenes
{
    // cache of genes and locations already looked up
    private HashMap<String, GeneInfo> genelocs;
    
    public FindGenes()
    {
        genelocs = new HashMap<String, GeneInfo>();
    }

    public GeneInfo getRecord(String name)
    {
        name = name + ".1";
        if(genelocs.containsKey(name)) {
            return (GeneInfo)genelocs.get(name);
        }
        
        DBReadManager connectionPool = null;
        DBconnection conn = null;
        try
        {
            connectionPool = DBReadManager.getInstance();
            conn = connectionPool.get_connection();
            String query = 
                "SELECT g.name, " +
                "ga.start_position, " +
                "ga.end_position " +
                "FROM Gene g, " +
                "GlobalAssignment ga, " +
                "Map m " +
                "where g.map_element_id = ga.map_element_id " +
                "and ga.map_id = m.map_id " +
                "and m.name='AGI' " +
                "and g.is_obsolete = 'F' " +
                "and g.name = " + TextConverter.dbQuote( name.toUpperCase() );
            
            conn.setQuery(query);
            long startLong;
            long endLong;
            for(ResultSet results = conn.getResultSet(); 
                results.next(); 
                genelocs.put(name, new GeneInfo(name, startLong, endLong)))
            {
                name = results.getString("name");
                startLong = results.getLong("start_position");
                endLong = results.getLong("end_position");
            }

            conn.releaseResources();
            if(genelocs.get(name) == null)
            {
                GeneInfo geneinfo = new GeneInfo(name, -1L, -1L);
                return geneinfo;
            }
            GeneInfo geneinfo1 = (GeneInfo)genelocs.get(name);
            return geneinfo1;
        }
        catch(SQLException sqlexception)
        {
            sqlexception.printStackTrace();
            throw new RuntimeException();
        }
        finally
        {
            if(conn != null)
                connectionPool.return_connection(conn);
        }
    }

    public long getStart(String locus)
    {
        locus = locus.toUpperCase();
        return getRecord(locus).getStart();
    }

    long getEnd(String locus)
    {
        locus = locus.toUpperCase();
        return getRecord(locus).getEnd();
    }


}
