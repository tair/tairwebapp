/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;

/**
 * Faces adapter for the WebApp properties file. Only represents those properties
 * actually used in Faces pages.
 * 
 * @author Robert J. Muller
 */
@ManagedBean(name="webapp")
@ApplicationScoped
public class WebAppBean
{
	/**
	 * Get the header message to display in the Faces header.
	 * @return the message
	 */
	public String getHeaderMessage(){
		return WebApp.getProperty("HEADER_MESSAGE");
	}
}
