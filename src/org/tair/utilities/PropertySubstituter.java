/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.io.*;
import java.util.*;
import java.util.regex.*;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.BuildException;

/**
  * PropertySubstituter is an Ant task that takes a file as input,
  * and outputs a file substituting any variables (such as ${build})
  * with the corresponding ant property values.
  */
public class PropertySubstituter extends Task
{
	String finName;
	String foutName;

	public void execute() throws BuildException {
		if(finName == null || "".equals(finName)){
			System.out.println("No input, skipping.");
			return;
		}
		if(foutName == null || "".equals(foutName)){
			System.out.println("No output, skipping.");
			return;
		}
		try {
			BufferedReader in = getReader();
			Writer out = getWriter();
			doSubstitution(in,out,getProjectProperties());
			out.close();
			in.close();
		}
		catch(IOException ioe){throw new BuildException(ioe);}
	}

	public static void doSubstitution(BufferedReader in, Writer out, Hashtable props) throws IOException {
		String line, propName;
		StringBuffer sb;
		Matcher m;
		Pattern p = Pattern.compile("\\$\\{([^\\}]+)\\}");
		while((line = in.readLine()) != null) {
			sb = new StringBuffer();
			m = p.matcher(line);
			while(m.find()){
				propName = m.group(1);
				if(props.containsKey(propName))
					m.appendReplacement(sb,(String)props.get(propName));
			}
			m.appendTail(sb);
			out.write(sb + "\n");
		}
	}

	private BufferedReader getReader() throws IOException {
		return new BufferedReader(new FileReader(finName));
	}

	private Writer getWriter() throws IOException {
		File f = new File(foutName);
		File p = f.getParentFile();
		if(p != null)
			p.mkdirs();
		f.createNewFile();
		return new FileWriter(f);
	}

	private Hashtable getProjectProperties() {
		return this.getOwningTarget().getProject().getProperties();
	}

	public void setInput(String in) {
		finName = in;
	}

	public void setOutput(String out) {
		foutName = out;
	}
}
