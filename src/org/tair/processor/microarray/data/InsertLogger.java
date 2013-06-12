//------------------------------------------------------------------------------
//Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.5 $
// $Date: 2006/02/16 00:21:31 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data;

import java.util.ArrayList;
import java.util.List;
import java.util.Iterator;

import org.tair.utilities.WebApp;
import org.tair.utilities.WebApp;
import org.tair.utilities.EMail;

/**
 * Quick and dirty class to log data elements that were inserted during
 * microarray data loading from an Excel file.  This is done for auditing
 * purposes while loading.  Logging is implemented through a static method
 * and list to allow global access while storing data. THIS IS NOT THREAD
 * SAFE!!! IF MULTIPLE DATA LOADS ARE GOING ON AT THE SAME TIME, MESSAGES
 * WILL BE LOGGED FOR ALL LOADS CONCURRENTLY AND MAY CAUSE CONFUSION!
 *
 * <p>
 * At the end of loading, InsertLogger will be used to send an email
 * containing all logged messages. When this email is sent, messages list
 * will be cleared and reset for next data load.
 */

public class InsertLogger {

    private static List messages = new ArrayList();

    /**
     * Adds submitted message to list of messages
     *
     * @param message Message to add to list
     */
    public static void log( String message ) {
	messages.add( message );
    }

    /**
     * Sends email containing all logged messages
     *
     * @param id Tair object id of expression set that was just loaded.
     * Used for creating a hyperlink that allows email recipient to easily
     * review data load using website expression set display
     */
    public static void sendLoadMessage( Long id ) {
	StringBuffer msg = new StringBuffer();

	msg.append( "Microarray loading has completed.  Results of loading " +
		    "can be viewed at:\n\n" );


	msg.append( WebApp.getServerURL() +
		    "/servlets/TairObject?type=expression_set&id=" + id +
		    "\n\n");

	if ( !messages.isEmpty() ) {
	    msg.append( getLoadMessages( "\n" ) );
	}


	// hardcode mail to Marga and Neil for now (needs to be changed 
	// eventually)
	String subject = "Microarray Data Load Complete";
	send( "garcia@acoma.stanford.edu", msg.toString(), subject );
	send( "nam@ncgr.org", msg.toString(), subject );
    }


    /**
     * Retrieves all logged messages as a single string with HTML "<BR>" breaks
     * between each entry.  This method can be used on a JSP following data 
     * loading to display all messages encountered while loading
     *
     * @return All messages as a single HTML string or <code>null</code> if no
     * messages logged while loading.
     */
    public static String getHTMLLoadMessages() {
	return !messages.isEmpty() ? getLoadMessages( "<br>" ) : null;
    }

    /**
     * Utility method to get all messages as a single string with messages
     * separated by submitted delimiter. This allows us to use same method
     * for both email and web page by using "\n" or "<br>" as delimiters.
     *
     * @param delimiter Delimiter to use between messages
     * @return All messages as a single string with submitted delimiter 
     * between individual messages
     */
    private static String getLoadMessages( String delimiter ) {
	StringBuffer msg = new StringBuffer();
	
	msg.append( "The following messages were logged:" + 
		    delimiter + delimiter );
     
	String logMsg = null;
	for ( Iterator iter = messages.iterator(); iter.hasNext(); ) {
	    logMsg = (String) iter.next();
	    msg.append( logMsg + delimiter );
	}

	return msg.toString();
    }

    

    /**
     * Convenience method to send all mails through Email object
     */
    private static void send( String address, String msg, String subj ) {
        try {
            if ( address != null && msg != null ) {
                EMail.send( WebApp.getProperty( "MAIL_HOST" ),
			    WebApp.getProperty( "FROM_ADDRESS" ),
                           address,
                           subj, 
                           msg
                           );
            }    
        } catch ( Exception e ) { // swallow mail exceptions - print to STDERR
            System.err.println( "Could not send order email to: " + address );
            System.err.println( "Message: " + msg );
            e.printStackTrace();
        }
    }

    /**
     * Clears log of all messages and resets it for use in another expression
     * set load.
     */
    public static void reset() {
	messages.clear();
    }

}
