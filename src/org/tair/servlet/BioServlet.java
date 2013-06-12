/*
 * $Id: BioServlet.java,v 1.23 2006/04/26 22:02:00 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/

package org.tair.servlet;

import java.io.*;
import java.util.*;

import org.ncgr.util.*;

import org.tair.utilities.ServletLogger;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 * The map viewer servlet. 
 */

public class BioServlet extends HttpServlet implements Logger {
    
    
    /**
   * 
   */
    private static final long serialVersionUID = -992589468055817076L;
    final static int BandWidth = 600;
    
    
    
    /**
     * Right, now the constructor is null, but it stays for sake of 
     * completeness.
     */  
    public BioServlet() {  }
    
    
    /**
     * Implements Logger interface
     */
    public void logMessage( String s ) {   
        log( s );
    }
    
    public void logError( String s ) {   
        log( s );
    }
    
    public void logException( String s , Exception e ) {
        log( s, e );
    }
    
    public void logException( Exception e ) {
        logException ( "" , e );
    }
    
    
    
    
    /**
     * This takes the servlet GET argument string, and parses it into
     * a hastable, such that each "foo=bar" name value pair is an
     * entry in the hashtable, with foo being the key, and bar being
     * the value
     */
    private Hashtable<String, String> parseNameValuePair( String argString ) {
        Hashtable<String, String> ht = new Hashtable<String, String>();
        if ( argString != null ) {
            StringTokenizer ost = new StringTokenizer( argString , "&" );
            while ( ost.hasMoreElements() )     {
                String ot = (String)  ost.nextToken();
                
                StringTokenizer ist = new StringTokenizer( ot , "=" );
                String key = ist.nextToken();
                
                String value = ist.nextToken();
                ht.put( key , value );
            }
            
        }
        return ht;
    }    

	public static Map<String,UserSession> sessions = Collections.synchronizedMap(new HashMap<String,UserSession>());
	public static Map<String,Date> expiry = Collections.synchronizedMap(new HashMap<String,Date>());

	public static UserSession getUserSession(Logger logger, String id){
		UserSession s = sessions.get(id);
		if(s == null){
			s = new UserSession(logger, id);
			sessions.put(id, s);
		}
		expiry.put(id, getExpiry());
		purgeSessions();
		return s;
	}

	public static Date getExpiry(){
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.MINUTE, 40);
		return cal.getTime();
	}

	synchronized public static void purgeSessions(){
		Date now = new Date();
		List<String> toRemove = new ArrayList<String>();
		for(String id: sessions.keySet())
			if(now.after(expiry.get(id)))
				toRemove.add(id);
		for(String id: toRemove)
			sessions.remove(id);
	}

    public void doGet( HttpServletRequest request, HttpServletResponse response)   
    throws ServletException, IOException {
        
        ServletLogger.start(getClass().getName(), request, response);
        
        response.setContentType("text/html");
        
        try { 
            
            PrintWriter out = response.getWriter();
            String s = request.getQueryString();
            
            Hashtable<String, String> ht = parseNameValuePair( s );
            
            HttpSession session = request.getSession(true);
            String id = session.getId();
            UserSession manager = getUserSession(this, id);

            try {
                
                manager.invoke( out, ht );
                return;
                
            } catch ( Exception e ) {
                logException( "EXCEPTION:" , e );
            }               
            
        } catch ( Exception e ) {
            logException( "Servlet exception" , e );
        } finally {
          ServletLogger.end(getClass().getName(), request, response);
        }
    }
    
}
