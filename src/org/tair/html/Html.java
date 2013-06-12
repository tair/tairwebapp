/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.html;

import java.awt.Color;
import java.io.PrintWriter;
import java.util.StringTokenizer;

import org.tair.servlet.Types;
import org.tair.utilities.WebApp;

/**
 *
 */
class Html extends Types
{
    protected static String servlet_Path = "mapper?";
    protected static String servletPath = "mapper";   
    protected static String helpPath = "/mapViewer/help/";
    protected static String infoCGI= "TairObject?";
    protected static String imgPath = WebApp.getImageDir();
    
    protected static int zoneWidth = 150;
    protected String popupStyle = "'toolbar=yes,menubar=yes,scrollbars=yes,resizable=yes,location=yes,status=yes'";

    private boolean isPopup;
    
    String colorSnippet( String word , Color color )
    {
	return "<font color=\"" + toWebColor(color) +"\">"+word+"</font>";
    }
    
    String toHex( int i )
    {
	String s = Integer.toString( i , 16 );
	if ( s.length() == 1 )
	    s = "0" + s;
	return s;
    }
    
    static String makeServletURL( int id , String extra )
    {
	return servlet_Path + "id=" + id + "&" + extra;
    }

    static String makeServletURL( String extra )
    {
	return servlet_Path + extra;
    }
    
    String toWebColor( Color c )
    {
	return "#" +
	    toHex( c.getRed() ) + 
	    toHex( c.getGreen() ) + 
	    toHex( c.getBlue() );
    }
    

    /**
     *
     */
    public void setPopup(boolean popup){
	this.isPopup = popup;
    }
    
    
    /**
     * lots of problems, need to fix
     */
    void makeBodyTag( PrintWriter ps , 
		      String errorTarget , 
		      boolean reset )
    {
	
	ps.print("<body bgcolor=#ffffff ");
	
	if ( isPopup || reset || ( errorTarget != null ) )
	    {
		ps.print( "onload=\"javascript:" );
		
		
		// try some thing new by gc
		if (isPopup){
		    ps.print( "popup('" + helpPath +"search.jsp"+"')");
		}else {//	if ( reset )
		    //System.err.println("It is not popup!");
		    ps.print( "document.mapForm.reset()");
		}
		
		if ( errorTarget != null )
		    {
			if ( reset )
			    {
				ps.print( ";" );
			    }
			// TO DO: need to fix this logic
			// ps.print( errorTarget );
			
		    }
		ps.println( "\"" );
	    }
	ps.println( ">" );

	isPopup = false;
    }


    /**
     *
     */
    protected String stripPathFromName( String name )
    {
	StringTokenizer st = new StringTokenizer( name , "/" );
	String ts = "";
	
	while( st.hasMoreElements() )
	    {
		ts = st.nextToken();
	    }
	return ts;
    }
    
  /**
   * Construct an &lt;img&gt; tag from a file name, path, and map name.
   * @param name the file name
   * @param path the relative path to the file
   * @param map the map name
   * 
   * @return an &lt;img&gt; tag
   */
  String makeImageTag(String name, String path, String map) {
    name = stripPathFromName(name);
    name = "<img src=\"" + path + name + "\"";

    if (map != null && map.equals("") == false) {
      name += " usemap=\"#" + stripPathFromName(map) + "\" ";
      name += " border=0 ";
    }
    name += ">";

    return name;
  }

  /**
   * Get the relative path to the generated image file.
   * 
   * @return a relative path
   */
  String getGenPath() {
    return WebApp.getDynImageDir();
  }
    
}
