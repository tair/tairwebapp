// -----------------------------------------------------------------------
// Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
// -----------------------------------------------------------------------
package org.tair.abrc.catalog;
import org.tair.utilities.WebApp;
import java.util.*;
import java.io.*;

public class CatalogPageHelper
{
	public static String getAnalytics() {
		try {
			String fname = WebApp.getWebRoot() + "/jsp/includes/analytics.html";
			FileInputStream r = new FileInputStream(fname);
			StringBuilder out = new StringBuilder();
			byte[] b = new byte[4096];
			for (int n; (n = r.read(b)) != -1;)
				out.append(new String(b, 0, n));
			return out.toString();
		} catch(Exception e) {
			return "";
		}
	}
}
