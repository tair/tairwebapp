/*
 * $Id: MapPickerHtml.java,v 1.29 2005/12/06 00:27:43 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved.  
*/



package org.tair.html;

import java.util.*;
import java.io.*;

/**
 * Map viewer's home page.
 */
public class MapPickerHtml extends Html
{
 
    private int whichMap;
    private String error;

    public MapPickerHtml()
    {
	
    }


    public void setError(String error){
	this.error = error;
	if (error !=null && error.equals("search"))
	    setPopup(true);
    }

    public void setChromosome (int chr){
	this.whichMap = (chr-1);
    }


    PrintWriter pWriter;
    
    private void p( String s )
    {
	pWriter.println( s );
    }
    
    
    void showHeader()
    {
	p( "<p><b>Try our <a href=\"http://tairvm09.tacc.utexas.edu/servlets/sv\">SeqViewer</a> for a more in-depth view of the AGI map</b>." + 
	   "<p>This display combines the <a href=\"javascript:showHelp('/mapViewer/help/tairmapa.jsp')\"> " + 

	   "<font color=\"#32cd32\">sequence</font>"+
	   "</a>, <a href=\"javascript:showHelp('/mapViewer/help/tairmapa.jsp')\"> " +

	   "<font color=\"#ff00ff\">genetic</font>"+
	   "</a> and, <a href=\"javascript:showHelp('/mapViewer/help/tairmapa.jsp')\">"+ 

	   "<font color=\"#0000cd\">physical</font>"+
	   "</a> maps for each " +
	   "of the 5 chromosomes of Arabidopsis.  Red circles on the maps indicate " +
	   "the centromeric region." + 
	   "<p>To browse, choose a chromosome and check the boxes for maps you want to " +
	   "visualize.  Then move your mouse over the colored bars " +
	   "(chromosomes) to find a region (highlighted in yellow) you want to see in detail.  " +
	   "Click the mouse to examine the selected region. <b>The initial map alignment is ONLY APPROXIMATE.</b>  To improve the alignment, center the maps on a shared marker using the <a href=\"javascript:showHelp('/mapViewer/help/mapnavh3.jsp#446787')\">search box</a> or the <a href=\"javascript:showHelp('/mapViewer/help/mapnavh3.jsp#448359')\">scroll left/right arrows</a>.  Remember that marker order and spacing often differ between genetic and physical/sequence maps.  Please use caution in interpreting alignments between different <a href=\"javascript:showHelp('/mapViewer/help/tairmapa.jsp')\">map types</a>. "+
	   " <p>To find a known site on any " +
	   "chromosome, enter the mapped element (e.g. marker, clone, gene) in the search box.  " +
	   "You will then see the corresponding region of all maps containing that element. " +
	   "<p><b><font color=\"#FF0000\">Note</font></b><font color=\"#FF0000\">: Please report defects to </font><a href=\"javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)\" onClick=\"javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');\">curator@arabidopsis.org</a>. <font color=\"#FF0000\">See the <a href=\"/search/map_rel_01beta.html\">release notes</a> for more details.</font>"	   
	   );
    }
    
    void printSpacer()
    {
	p( "<tr>" + 
	   "<td colspan=3></td>" +
	   "<td><img src=\""+imgPath+"/cleargif.gif\" name=\"bottom\" border=0 width=375 height=5></td>" + // gc
	   "</tr>" +
	   "<tr><td colspan=5><br><br></td></tr>" +
	   "<tr><td colspan=5>" );
    }
    
    void showBands()
    {

	Vector[] chromosomes = MapMetaData.getInstance().getMaps();

	Vector chromosome = chromosomes[ whichMap ];
	
	for (int i=0;i<chromosome.size();i++) 
	    {
		MapGeneralInfo mi = (MapGeneralInfo) chromosome.elementAt( i );
		if (mi != null) 
		    {
			p( "<tr>" +
			   "<td width=150 align=right><small><em>" + 
			   mi.getName() + "</em></small></td>" +
			   "<td width=40 align=center><input type=\"checkbox\" name=\"map" + i + "\" ");
			
			if (mi.isOn()) 
			    { 
				p("checked"); 
			    }
			p("></td>");

			p("<td width=20>&nbsp;</td>");
			String mapImg = "";
			
			if (mi.getType().equals(TYPE_SEQUENCE)) 
			    { 
				mapImg = "AGI_" + whichMap + ".gif"; 
			    }
			else if (mi.getType().equals(TYPE_GENETIC))
			    { 
				if (mi.getName().equals(LISTER_AND_DEAN_RI)) 
				    { 
					mapImg = "RI_" + whichMap + ".gif"; 
				    }
				if (mi.getName().equals(CLASSIC)) 
				    { 
					mapImg = "Classical_" + whichMap + ".gif"; 
				    }
				if (mi.getName().equals(MI_RFLP))
				    { 
					mapImg = "miRFLP_" + whichMap + ".gif"; 
				    }
			    }
			else if (mi.getType().equals(TYPE_FRAMEWORK)) 
			    { 
				mapImg = "framework_" + whichMap + ".gif"; 
			    }
			else 
			    { 
				mapImg = "phy_bar.gif"; 
			    }
			p("<td width=380><img src=\"" + imgPath + mapImg + "\" name=\"chromo\" border=0 usemap=\"#mapsMap\" width=375></td>");
			p("<td width=75>");
			if ( mi.getLength().equals("") == false ) 
			    {
				p("<span class=\"unitsF\">" + mi.getLength() + " " + mi.getUnit() + "</span></td>");
			    }
			p("</tr>");
		    }
	    }
    }
    
    void printChromosomeChooser()
    {
	p("<select name=\"chromosomes\" onchange='cSwap()'>");
	for (int i =0;i<5;i++) 
	    {
		pWriter.print("<option value=\"" + (i+1) + "\"");
		if (i == whichMap) 
		    { 
			pWriter.print(" selected"); 
		    }
		p(">Chromosome " + (i+1) + "  ");
	    }
	p("</select></form></td>");
    }
    
    void printSearcher()
    {
	p("<td width=380 align=\"right\">");
	p("<form name=\"searchIt\" action=\"" + servletPath + "\" method=\"GET\">");
	p("<input type=\"text\" name=\"value\" size=10>");
	p("<input type=\"submit\" value=\"Search\">");
	p("<input type=\"hidden\" name=\"action\" value=\"search\">");
	p("</form>");
	p("</td>");
    }
    
    void printScript()
    { 
	p("<script language=\"JavaScript\">");
	p("<!--");
	p("var n = (document.layers) ? 1:0;");
	p("var imageDB = new Array(8);");
	p("for (var i = 0; i < imageDB.length; i++) {");
	p("  imageDB[i] = new Image(375,5);");
	p("  imageDB[i].src = \""+imgPath+"/p_\"+i+\".gif\";");
	p("}");

	p("function popup(url) {");
	p("  popup = window.open(url,'Popup','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=500,height=300,screenX=200,screenY=200,left=200,top=200');");
	p("  popup.focus();");
	p("}");
	
	p("function isOn(x) {");
	p("  document.images[\"top\"].src = imageDB[x].src;");
	p("  document.images[\"bottom\"].src = imageDB[x].src;");
	p("}");

	p("function isOff() {");
	p("  document.images[\"top\"].src = \""+imgPath+"/cleargif.gif\";");
	p("  document.images[\"bottom\"].src = \""+imgPath+"/cleargif.gif\";");
	p("}");

	p("function cSwap() {");
	p("  window.location.href='/servlets/mapper?chr='+(1+document.dropdown.chromosomes.selectedIndex);");
	p("}");
	
	p("function send(pos) {");
	p("  document.picker.pos.value = pos;");
	p("  document.picker.submit();");
	p("}");

	p("function showHelp(url) {");
	p("  help = window.open(url,'_help'," + popupStyle + ")");
	p("  help.focus();");
	p("}");
	
	p("//-->");
	p("</script>");
    }
    
    

    void printMap()
    {
	p("<map name=\"mapsMap\">");
	p("<area shape=\"rect\" coords=\"0,0,50,30\" href=\"javascript:send(0)\" onMouseOver='isOn(0); window.status=\"\"; return true' onMouseOut='isOff(); window.status=\"\"; return true'>");
	p("<area shape=\"rect\" coords=\"50,0,96,30\" href=\"javascript:send(30)\" onMouseOver='isOn(1); window.status=\"\"; return true' onMouseOut='isOff(); window.status=\"\"; return true'>");
	p("<area shape=\"rect\" coords=\"96,0,142,30\" href=\"javascript:send(60)\" onMouseOver='isOn(2); window.status=\"\"; return true' onMouseOut='isOff(); window.status=\"\"; return true'>");
	p("<area shape=\"rect\" coords=\"142,0,188,30\" href=\"javascript:send(90)\" onMouseOver='isOn(3); window.status=\"\"; return true' onMouseOut='isOff(); window.status=\"\"; return true'>");
	p("<area shape=\"rect\" coords=\"188,0,234,30\" href=\"javascript:send(120)\" onMouseOver='isOn(4); window.status=\"\"; return true' onMouseOut='isOff(); window.status=\"\"; return true'>");
	p("<area shape=\"rect\" coords=\"234,0,280,30\" href=\"javascript:send(150)\" onMouseOver='isOn(5); window.status=\"\"; return true' onMouseOut='isOff(); window.status=\"\"; return true'>");
	p("<area shape=\"rect\" coords=\"280,0,326,30\" href=\"javascript:send(180)\" onMouseOver='isOn(6); window.status=\"\"; return true' onMouseOut='isOff(); window.status=\"\"; return true'>");
	p("<area shape=\"rect\" coords=\"326,0,376,30\" href=\"javascript:send(210)\" onMouseOver='isOn(7); window.status=\"\"; return true' onMouseOut='isOff(); window.status=\"\"; return true'>");
	p("</map>");
    }
    
    
    public void output (PrintWriter ps) 
    {
	this.pWriter = ps;
	p("<html><head><title>TAIR- Map Viewer</title>");
	
	printScript();


	/***
	p("<style type=\"text/css\">");
	p("<!--");
	p(".unitsF	{	font-size: 9pt; font-style: italic;");
	p("				color: #999999;	}");
	p(".title	{	font-size: 16pt; font-weight: bold;");
	p("				color: #003366;	}");
	p("td	{	font-family: helvetica,arial,sans-serif;");
	p("				font-size: 10pt; }");
	p(".info	{	font-size: 10pt; color: #666666;	}");
	p("//-->");

	p("</style>");

	***/

	p("<LINK REL=StyleSheet HREF=\"/css/browse.css\" TYPE=\"text/css\" >");


	p("</head>");
	
	makeBodyTag( pWriter , error , false );


	p("<form name=\"dropdown\" action=\"" + servletPath + "\" method=\"GET\">");
	p("<table width=700 align=center border=0 cellpadding=2 cellspacing=0>");
	p("<tr>");
	p("<td colspan=3><a href=\"/\"><img src=\"/images/logosmall.gif\" border=0\"></a> &nbsp; <span class=\"title\">MapViewer</span></td>");
	p("<td colspan=2 align=right><a href=\"javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)\" onClick=\"javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');\"><img src=\"/images/contact.gif\" width=\"25\" height=\"25\" border=\"0\" alt=\"Contact TAIR\"></a> &nbsp;");
	p("<a href=\"javascript:showHelp('/mapViewer/help/tairmapa.jsp')\"><img src=\"/images/help.gif\" width=\"25\" height=\"25\" border=\"0\" alt=\"Help\"></a></td>");
	
	p("</tr>");
	p("<tr>");
	p("<td colspan=5><hr>");
	
	
	p("<br></td></tr>");

	if (error != null && error.equals("session")){

	    p("	<tr><td colspan=5 align=center><FONT color = red>Your session has expired. Please start again. </FONT></td></tr>");
	}
	if (error != null && !error.equals("session") && !error.equals("search") ){

	    p("	<tr><td colspan=5 align=center><FONT color = red>"+error+". </FONT></td></tr>");
	}	

	p("<tr>");
	p("<td width=210 colspan=3 valign=bottom align=right>");
	p("<b><i>Display: </i></b>&nbsp;&nbsp;");
	
	printChromosomeChooser();
	
	printSearcher();
	
	p("</tr>");
	p("<tr>");
	p("<td colspan=3>");
	p("<form name=\"picker\" action=\"" + servletPath + "\" method=\"GET\">");
	p("<input type=\"hidden\" name=\"chromosomes\" value=\"" + (whichMap+1) + "\">");
	p("</td>");
	p("<td width=380 valign=bottom><img src=\""+imgPath+"/cleargif.gif\" name=\"top\" border=0 width=375 height=5></td>");
	p("</tr>");
	
	
	showBands();
	
	printSpacer();
	
	showHeader();
	
	p( "<hr>");
	p("<br><br></td></tr>");
	p("<tr>");
	p("<td colspan=2 valign=middle><a href=\"http://www.biosci.ohio-state.edu/~plantbio/Facilities/abrc/abrchome.htm\"><img src=\"/i/abrc.gif\" border=0></a></td>");
	p("<td colspan=3 align=right valign=middle><a href=\"http://carnegiedpb.stanford.edu/\"><img src=\"/i/cis_logo_large.jpg\" border=0></a></td>");
	p("</tr>");
	p("</table>");
	p("<input type=\"hidden\" name=\"pos\" value=\"0\">");
	p("</form>");
	p("<br><br>");
	
	printMap();
	
    //Javscript for Google Analytics
    p ("<script src=\"https://ssl.google-analytics.com/urchin.js\" type=\"text/javascript\"></script>");
    p ("<script type=\"text/javascript\">");
    p ("_uacct = \"UA-1945230-1\";");
    p ("urchinTracker();");
    p ("</script>");
    
	p("</body>");
	p("</html>");
	this.pWriter.close();
    }
   
}
