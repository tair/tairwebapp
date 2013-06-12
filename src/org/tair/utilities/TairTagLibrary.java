/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;
import java.io.File;

import javax.faces.context.FacesContext;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.sun.faces.facelets.tag.AbstractTagLibrary;

public final class TairTagLibrary extends AbstractTagLibrary
{
	public static final String NAMESPACE = "http://www.arabidopsis.org/jsf/tair";
	public static final TairTagLibrary INSTANCE = new TairTagLibrary();

	public TairTagLibrary(){
		super(NAMESPACE);
		try {
			this.addFunction("unique", TairTagLibrary.class.getMethod("unique", String.class, FacesContext.class, HttpServletRequest.class));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static String unique(final String fname, FacesContext ctx, HttpServletRequest req)
	{
		try {
			return getOutput(fname, (ServletContext) ctx.getExternalContext().getContext(), req);
		} catch(Exception e) {
			return fname;
		}
	}

	public static String getOutput(String fname, ServletContext ctx, HttpServletRequest req) {
		return getOutput(fname, "%s?%d", ctx, req);
	}

	public static String getOutput(String fname, String fmt, ServletContext ctx, HttpServletRequest req)
	{
		File f = new File(ctx.getRealPath(getAbsolutePath(fname, req)));
		if(f.exists())
			return String.format(fmt, fname, f.lastModified());
		return fname;
	}

	/**
	  * Return the absolute path of fname (relative to the root of the web site). Although
	  * File methods are used to find the path, the File objects don't correspond to actual
	  * files on the file system, since all paths are relative to the DOCUMENT_ROOT of the site.
	  */
	private static String getAbsolutePath(String fname, HttpServletRequest req)
	{
		File f = new File(fname);
		if(f.isAbsolute())
			return f.toString();
		f = new File(req.getRequestURI() + " "); // Append a char so that getParent() returns "/foo/bar" when request is like "/foo/bar/"
		return new File(f.getParent(), fname).toString();
	}
}
