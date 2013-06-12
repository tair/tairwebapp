/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

import java.awt.*;
import java.io.*;
import Acme.JPM.Encoders.GifEncoder;

/**
 * This class can be used to get and re-use images in java.
 */

public class GifFactory
{
	public static void createGIF(Image image, String imageFileName, int width, int height){
		try {
			OutputStream out = new FileOutputStream(imageFileName);
			GifEncoder encoder = new GifEncoder(image, out);
			encoder.setDimensions(width, height);
			encoder.encode();
			out.close();
		} catch(IOException ioe) {
			WebApp.log("Error creating GIF: \""+imageFileName+"\"",ioe);
		}
	}
}
