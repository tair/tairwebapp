/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;
import java.security.MessageDigest;

public class MD5
{
	public static String hexDigest(String data)
	{
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			StringBuilder sb = new StringBuilder();
			for(byte b : md5.digest(data.getBytes())) {
				sb.append(Character.forDigit((b & 0xf0) >> 4, 16));
				sb.append(Character.forDigit( b & 0x0f      , 16));
			}
			return sb.toString();
		} catch(Exception e) {
			return "";
		}
	}
}
