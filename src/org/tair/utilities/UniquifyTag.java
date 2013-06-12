/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import javax.servlet.http.*;
import java.text.*;
import java.util.*;
import java.io.*;

/**
 * UniquifyTag takes a file name as input and returns the file name with a unique
 * string appended to it, or the bare file name if the file is not found on disk.
 */
public class UniquifyTag extends TagSupport
{
	private String fname, fmt = "%s?%d";

	public void setFile(String fname){
		this.fname = fname;
	}

	public void setFormat(String fmt){
		this.fmt = fmt;
	}

	public int doStartTag() throws JspException
	{
		try {
			pageContext.getOut().print(getOutput());
		} catch(IOException ioe) {
			throw new JspException("I/O Error : " + ioe.getMessage());
		}
		return Tag.SKIP_BODY;
	}

	String getOutput()
	{
		try {
			return TairTagLibrary.getOutput(fname, fmt, pageContext.getServletContext(), (HttpServletRequest)pageContext.getRequest());
		} catch(Exception e) {
			return fname;
		}
	}
}
