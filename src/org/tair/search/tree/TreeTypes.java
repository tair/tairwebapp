/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.search.tree;

import java.util.*;

/**  TreeTypes is a class used to hold static information about different tree types;
 *   currently, the only tree type we have is the Keyword tree type 
*/

public class TreeTypes {

    /** TreeTypes holds tree type information in a hash map
     * the keys to the map are the different tree types  
     *
     * the value part of the map is the corresponding information for the different tree types
     * the information is represented by ArrayList that contains at element:
     *                                                             0 : Display name
     *                                                             1 : Tree Data Model classname 
     *                                                             2 : Node classname 
     *                                                             3 : Display classname 
     *                                                             4 : Node Info types
     *                                                             5 : Tree jsp url
     * accessor methods for each piece of info for the specified tree types are provided
     */

    private static Map treeTypes = new HashMap( );
    // display name 
    private static String keywordDisplayName = "Keyword Hierarchy";
    // tree data model classname - in this case MultiParentDataModel which handles trees with nodes that 
    // can have multiple parents and their tree data is held in a db table
    private static String keywordDataModel = "org.tair.search.tree.MultiParentDataModel";
    // node classname - in this casse KeywordNode is a MultiParentNode -- logic for nodes with multiple parents 
    private static String keywordNode = "org.tair.search.tree.KeywordNode";
    // display classname - the class that handles type specific display data for the nodes in a tree structure
    private static String keywordDisplay = "org.tair.search.tree.KeywordDisplay";
    // node info = type specific information about a node, handled via KeywordDisplay class 
    // generic info about a node is maintained in the TreeTableInfo temp table using KeywordNode class which 
    // is an instance of MultiParentNode 
    private static String[] keywordNodeInfo = new String[] { "name","state" };
    // tree jsp url - the url that displays the tree
    private static String keywordJSP = "/jsp/tree/tree_viewer_kw.jsp";

    private static ArrayList treeInfo; 
  
    static {
        treeInfo = new ArrayList();    
        treeInfo.add( keywordDisplayName );
        treeInfo.add( keywordDataModel );  
        treeInfo.add( keywordNode );
        treeInfo.add( keywordDisplay );  
        treeInfo.add( keywordNodeInfo );
        treeInfo.add( keywordJSP );      
        treeTypes.put( "keyword", treeInfo );     
    }

    /**
     * @return String array of the variuos tree types that are maintained here  
     */  
    public static String[] getTreeTypes() {
        // get all the keys to the map and put into a string array 
        String[] types = new String[ treeTypes.size() ];
        Iterator iter = treeTypes.keySet().iterator();
        int i = 0;
        while ( iter.hasNext() ) {
            types[i]  = ( String ) iter.next();
            i ++;
        }    
        return types;    
    }

    /**
     * @param treeType The tree type to get information about
     * @return String of the display name for the tree type
     */   
    public static String getDisplayName( String treeType ) {
        // pulls out the information part associated with this type and extracts the display name
        return ( ( String )( ( ArrayList )treeTypes.get( treeType ) ).get(0) );      
    }

    /**
     * @param treeType The tree type to get information about
     * @return String of the data model classname for this tree type 
     */  
    public static String getDataModelClassname( String treeType ) {
        // pulls out the information part associated with this type and extracts the data model classname          
        return ( ( String )( ( ArrayList )treeTypes.get( treeType ) ).get(1) );      
    }

    /**
     * @param treeType The tree type to get information about
     * @return String of the node classname for this tree type 
     */  
    public static String getNodeClassname( String treeType ) {
        // pulls out the information part associated with this type and extracts the node classname          
        return ( ( String )( ( ArrayList )treeTypes.get( treeType ) ).get(2) );      
    }

    /**
     * @param treeType The tree type to get information about
     * @return String of the display classname for this tree type 
     */  
    public static String getDisplayClassname( String treeType ) {
        // pulls out the information part associated with this type and extracts the display classname          
        return ( ( String )( ( ArrayList )treeTypes.get( treeType ) ).get(3) );      
    }

    /**
     * @param treeType The tree type to get information about
     * @return String Array of the node info available for this tree type 
     */ 
    public static String[] getInfoTypes( String treeType ) {
        // pulls out the information part associated with this type and extracts the info types          
        return ( ( String[] )( ( ArrayList )treeTypes.get( treeType ) ).get(4) ); 
    }

    /**
     * @param tree_type The tree type to get information about
     * @return String of the tree jsp url for this tree type 
     */  
    public static String getTreeJsp( String treeType ) {
        // pulls out the information part associated with this type and extracts the tree jsp          
        return ( ( String )( ( ArrayList )treeTypes.get( treeType ) ).get(5) );      
    }

    public static void main(String[] args){

        for ( int i = 0; i < TreeTypes.getTreeTypes().length; i ++ ) { 
            System.out.println( " for tree type number " + i );  
            String treeType = TreeTypes.getTreeTypes()[ i ];
            System.out.println("*** getDisplayName = " + TreeTypes.getDisplayName( treeType ) ); 
            System.out.println("*** getDataModelClassname = " + TreeTypes.getDataModelClassname( treeType) ); 
            System.out.println("*** getNodeClassname = " + TreeTypes.getNodeClassname( treeType ) ); 
            System.out.println("*** getDisplayClassname = " + TreeTypes.getDisplayClassname( treeType ) );
            for ( int j = 0; j < TreeTypes.getInfoTypes( treeType ).length; j ++ ) {
                System.out.println("*** getInfoTypes, j = " + j + " " + TreeTypes.getInfoTypes( treeType )[j] );
            }
            System.out.println("*** getTreeJsp = " + TreeTypes.getTreeJsp( treeType ) ); 
        }
    }
}
