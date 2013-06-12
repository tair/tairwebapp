// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// -----------------------------------------------------------------------
package org.tair.abrc.catalog;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.tair.abrc.catalog.category.CatalogCategory;

// A class to generate a generator.  Takes in a jsp file, and outputs a java
// file that, when compiled and executed, will generate an html page.
public class PageGeneratorGenerator
{

    private static Logger logger = Logger.getLogger(PageGeneratorGenerator.class);
    
	public static void main(String[] args) throws Exception
	{
		if(args.length != 4){
			System.out.println("USAGE: java PageGeneratorGenerator CATALOG_PROPERTIES_FILE INPUT_DIR OUTPUT_DIR CATEGORY");
			return;
		}

		File input = new File(args[1]);
		if(!input.exists()){
			logger.error("Input directory does not exist: " + input);
			return;
		}

		File output = new File(args[2]);
		if(!output.exists()){
		  logger.error("Output directory does not exist: " + output);
			return;
		}

		List<CatalogCategory> cats = new ArrayList<CatalogCategory>();
		Map<String, CatalogCategory> all_cats = CatalogManager.getCatalogCategories(args[0]);
		if("all".equals(args[3]))
			cats.addAll(all_cats.values());
		else if(all_cats.containsKey(args[3]))
			cats.add(all_cats.get(args[3]));
		else
		  logger.error("Unknown category");

		makeGenerators(cats, input, output);
	}

	public static void makeGenerators(List<CatalogCategory> categories, File input, File output) throws Exception {
		String name;
		InputStream is;
		OutputStream os;
		for(CatalogCategory cat: categories){
			try{
				name = cat.getClass().getSimpleName()+"Generator";
				is = new FileInputStream(new File(input, cat.getCategoryName()+".template"));
				os = new FileOutputStream(new File(output, name+".java"));
				logger.info("writing " + new File(output, name+".java"));
				makejava(name, is, new PrintStream(os));
			} catch (Exception e) {
			  logger.error("Error generating category: " + e);
			}
		}
	}

	static StringBuffer exsb;

	public static void makejava(String className, InputStream is, PrintStream os) throws Exception
	{
		exsb = new StringBuffer();
		printHead(className, os);
		String out;
		while((out = parse(is, new StringBuffer())) != null)
			os.println(out);
		os.println("\t}\n");
		os.println(exsb.toString());
		os.println("}\n");
	}

	public static String parse(InputStream is, StringBuffer sb) throws Exception
	{
		int c = is.read();
		switch(c){
		case '<':
			return parse_bracket(is,sb);
		case '\n':
			return "\t\tout.print(\""+sb.toString()+"\\n\");";
		case -1:
			return sb.length() > 0 ? "\t\tout.print(\""+sb.toString()+"\\n\");" : null;
		case '"':
			sb.append("\\\"");
			return parse(is,sb);
		default:
			sb.append((char)c);
			return parse(is,sb);
		}
	}

	public static String parse_bracket(InputStream is, StringBuffer sb) throws Exception
	{
		int c = is.read();
		switch(c){
		case '%':
			return "\t\tout.print(\""+sb.toString()+"\");\n"+parse_java(is,new StringBuffer());
		case '\n':
			return "\t\tout.print(\""+sb.toString()+"<\\n\");\n"+parse(is,new StringBuffer());
		case -1:
			return parse(is,sb);
		default:
			sb.append('<');
			sb.append((char)c);
			return parse(is,sb);
		}
	}

	public static String parse_java(InputStream is, StringBuffer sb) throws Exception
	{
		int c = is.read();
		switch(c){
		case '=':
			return parse_java_exp(is,sb);
		case '@':
			return parse_java_page(is,sb);
		case '!':
			return parse_java_extern(is,sb);
		case -1:
			return parse(is,sb);
		default:
			sb.append((char)c);
			return parse_java_statement(is,sb);
		}
	}

	public static String parse_java_exp(InputStream is, StringBuffer sb) throws Exception
	{
		int c = is.read();
		switch(c){
		case '%':
			c  = is.read();
			if(c == '>') return "\t\tout.print("+sb.toString()+");\n" + parse(is,new StringBuffer());
			sb.append('%');
			sb.append((char)c);
			return parse_java_exp(is,sb);
		default:
			sb.append((char)c);
			return parse_java_exp(is,sb);
		}
	}

	public static String parse_java_statement(InputStream is, StringBuffer sb) throws Exception
	{
		int c = is.read();
		switch(c){
		case '%':
			c  = is.read();
			if(c == '>') return sb.toString()+"\n"+parse(is,new StringBuffer());
			sb.append('%');
			sb.append((char)c);
			return parse_java_statement(is,sb);
		default:
			sb.append((char)c);
			return parse_java_statement(is,sb);
		}
	}

	public static String parse_java_page(InputStream is, StringBuffer sb) throws Exception
	{
		int c = is.read();
		switch(c){
		case '%':
			c  = is.read();
			if(c == '>') return parse(is,new StringBuffer());
		default:
			return parse_java_page(is,sb);
		}
	}

	public static String parse_java_extern(InputStream is, StringBuffer sb) throws Exception
	{
		int c = is.read();
		switch(c){
		case '%':
			c  = is.read();
			if(c == '>') return parse(is,new StringBuffer());
			exsb.append('%');
			exsb.append((char)c);
			return parse_java_extern(is,sb);
		default:
			exsb.append((char)c);
			return parse_java_extern(is,sb);
		}
	}

	public static void printHead(String className, PrintStream os)
	{
		os.println("// This crufty java class was generated by some crufty software: PageGeneratorGenerator");
		os.println("import java.io.*;");
		os.println("import java.util.*;");
		os.println("import org.tair.utilities.*;");
		os.println("import org.tair.abrc.catalog.*;");
		os.println("import org.tair.querytools.*;");
		os.println("import org.tair.search.*;");
		os.println("import org.tair.community.*;");
		os.println("import org.tair.tfc.*;");
		os.println("public class "+className+" extends PageGenerator {");
		os.println("\tpublic void generate(PrintWriter out, SearchResultsCollection pageObj){");
	}
}
