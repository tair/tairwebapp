/*
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.utilities;

/**
   A utility class used by JSP pages that include dyn_header.jsp with the 
   include directive.  This class provides methods to get, set and toggle
   the background color used by the JSP page.  These are methods that used to
   be in gen_header.jsp.
*/
public class BgColorBean
{
    /**
       Constructor for the BgColorBean class.
       The background color is set to nothing.
    */
    public BgColorBean()
    {
	bg_color = " ";
    }

    /**
       Toggles the background color used by the JSP page.  If the background
       color is currently #F1EFEC, it is changed to nothing.  If the background
       color is currently nothing, it is changed to #F1EFEC.
       @return the toggled background color
    */
    public String toggleBgColor()
    {
	if (bg_color.equals(" bgcolor=#F1EFEC "))
	{
	    bg_color = "";
	}
	else
	{
	    bg_color = " bgcolor=#F1EFEC ";
	}
	return bg_color;
    }

    /**
       Makes no changes to the background color used by the JSP page.
       @return the current background color
    */
    public String sameBgColor()
    {
	return bg_color;
    }

    /**
       Get the current background color.
       @return the current background color
    */
    public String get_color()
    {
	return bg_color;
    }

    /**
       Set the background color to be used by the JSP page.
       @param value the background color that the JSP page should use
    */
    public void set_color(String value)
    {
	bg_color = value;
    }

    private String bg_color = " "; // the background color
}




