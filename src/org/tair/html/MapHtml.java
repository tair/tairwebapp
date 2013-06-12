/*
 * $Id: MapHtml.java,v 1.28 2005/12/06 00:27:43 nam Exp $
 *
 * Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
 */

package org.tair.html;

import java.util.*;
import java.io.*;
import java.awt.*;

import org.tair.servlet.*;

/**
 * used to generate the map viewer pages after the main chooser page.
 *
 */
public class MapHtml extends Html
{
    
    /**
     * Used to indicate which is chromosome current page is shown
     */
    private String chromosome;
     
    /**
     * after chooser page search, if more than one chromosome have hits, show them
     */
    private final static String[] CHROMOSOMES= {"I", "II", "III", "IV", "V"};
    
    /**
     *
     */
    private PrintWriter pWriter;

    /**
     *
     */
    public MapHtml( String chromo) 
    {
	chromosome = chromo;	
    }

 

    /**
     *
     */
    private void p( String s ) 
    { 
	pWriter.println( s ); 
    }
    
    /**
     *
     */
    public void setChromosome(String chr){
	chromosome = chr;
    }
    
    /**
     * 
     */
    public void print(  BandMaster [] bandMaster,  PrintWriter pWriter ) 
    {
	this.pWriter = pWriter;
	
	p("<html>\n<head>\n<title>Maps for Chromosome" + chromosome + "</title>" +
	  "</head><body bgcolor=#ffffff>" + 
	  "<table width=600 border=0 cellpadding=0 cellspacing=0 align=center>" +
	  "<tr><td>");
	
	for (int i=0;i<bandMaster.length;i++)  {
	    BandMaster bm = bandMaster[ i ];
	    if ( bm.isVisible() ) 	{
		p( makeImageTag( bandMaster[i].getImageName() , getGenPath() , 
				 "" ) );
	    }
	}
	
	p( "</td></tr></table>" +
	   "<body>" +
	   "<html>" );
    }
    
    
    /**
     *
     */
    String bandNameFor( int i )
    {
	return "navigator" + i;
    } 
    
    /**
     *
     */
    void generateZoneMap( StringBuffer mapString , 
			int numberOfZones ,
			  Dimension zoneDim ,
			  int bandNumber ) 
			  
    {
	mapString.append( "<map name=\"" + 
			  bandNameFor( bandNumber ) + "\">\n" );
	
	double zoneWidth = ((double)zoneDim.width) / ((double)numberOfZones);
	double leftEdge = 0.0;
	
	for (int m=0; m < numberOfZones ; m++) 
	    {
		int left = (int) leftEdge;
		leftEdge += zoneWidth;
		int right = (int) leftEdge;
		if ( left != right ) 
		    {
			mapString.append( "<area shape=\"rect\" coords=\"" + 
					  left + ",0," );
			mapString.append( "" + right + "," + zoneDim.height + 
					  "\" href=\"javascript:zoneto('" + 
					  bandNumber + ":" + m + "')\">\n" );
		    }
	    }
	mapString.append( "</map>\n" );
    }
    
    /**
     *
     */
    void showZoomLevels( BandMaster bm )
    {
	String [] zoomLevelNames = bm.getLevelNames();
	
	String nameOfThisLevel = bm.getNameOfZoomLevel();
	
	boolean found = false;
	
	for( int a = 0 ; a < zoomLevelNames.length ; ++ a ){
	    p("<option value=\""+a+"\"");
	    if (zoomLevelNames[a].equals( nameOfThisLevel ) ){ 
		found = true;
		p(" selected "); 
	    }
	    p(">" + " -- " + zoomLevelNames[a] + " -- ");
	}
	
	if ( found == false ) {
	    p( "<option value = \"BoB\" selected> -- " + 
	       nameOfThisLevel + " -- " );
	}
	
	p("</select>");
    }
    
    /**
     * control display default(3) rows or all rows.
     */
    void showDisplayedRows(BandMaster bm){
	boolean displayAllRows = bm.getDisplayAllRows();
	p("<option value=\"default\" ");
	if (!displayAllRows)
	    p(" selected ");
	p(">Display 3 Rows");
	
	p("<option value=\"all\"");
	if (displayAllRows)
	    p(" selected ");
	
	p(">Display All Rows</select>");
	
    }
    
    
    /**
     * print out the javascript part. Some parts could use a javascript file later
     */
    void outputScript( int numberOfBands )
    {
	p("<script language=\"javascript\">");
	p("<!--");
	
	p("function popup(url) {");
	p("  popup = window.open(url,'Popup','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,width=500,height=300,screenX=200,screenY=200,left=200,top=200');");
	p("  popup.focus();");
	p("}");
	
	p("function showFeature(fid,type) {");

	p(
	  "  cgiString = \"" + infoCGI + 
	  "name=\" + fid" + "+\"&" +
	  "type=\" + type" + 
	  ";" 
	  );
	
	p("  wName = \"_\" ;");
	p("  fWindow = window.open(cgiString,wName,"+popupStyle+")");
	p("  fWindow.focus();");
	p("}");
	
	p("function showHelp(url) {");
	p("  help = window.open(url,'_help'," + popupStyle + ")");
	p("  help.focus();");
	p("}");
	
	
	p("function rSwap() {");      
	p("  rows = document.mapForm.displayRows.selectedIndex;");
	p("  myhref = \""+makeServletURL("action=rows\";"));
	p("  myhref += \"&band=all&rows=\" + rows;");
	p("  parent.location.href = myhref;");
	p("}");
	
	p("function showFeatureID(fid,type) {");
	p(
	  "  cgiString = \"" + infoCGI + 
	  "accession=\" + type" + "+\":\"" +
	  " + fid" + 
	  ";" 
	  );

	p("  wName = \"_\" ;");
	p("  fWindow = window.open(cgiString,wName,"+popupStyle+")");
	p("  fWindow.focus();");
	p("}");
	
	p("function update(bandNum) {");
	p("  fname = \"document.mapForm.sband\" + bandNum;");
	p("  field = eval(fname);");
	p("  zoomIndex = field.options[field.options.selectedIndex].value;");
	p("  myhref = \""+makeServletURL("action=zoomto\";"));
	p("  myhref += \"&band=\" + bandNum + \"&zoomto=\" + zoomIndex;");
	p("  parent.location.href = myhref;");
	p("}");
	
	
	p("function zoneto(send) {");
	p("  band = send.substring(0,send.indexOf(\":\"));");
	p("  zone = send.substring(send.indexOf(\":\")+1);");
	p("  fname = \"document.mapForm.sband\" + band;");
	p("  field = eval(fname);");
	p("  zoomIndex = field.options[field.options.selectedIndex].value;");
	p("  myhref = \""+makeServletURL("action=zoneto\";"));
	p("  myhref += \"&band=\" + band + \"&zone=\" + zone + \"&zoomto=\" + zoomIndex;");
	p("  parent.location.href = myhref;");
	p("}");
	
	
	p("function find(what) {");
	p("  band = eval(\"document.mapForm.band\" + what);");
	p("  info = band.value;");
	p("  if (info) {");
	p("    searchOptions = document.mapForm.searchTypes.options[document.mapForm.searchTypes.options.selectedIndex].value;");
	p("    myhref = \""+makeServletURL( "action=search\";"));
	p("    myhref += \"&band=\" + what + \"&field=\" + info;");
	p("      if (searchOptions == \"selected\") {"); 
	p("        for (i=0;i<" + numberOfBands + ";i++) {");
	p("        myMap = eval(\"document.mapss.map\" + i);");
	p("        myhref += \"&map\" + i + \"=\";");
	p("          if (myMap.checked) { myhref += \"on\"; }");
	p("         else { myhref += \"off\"; }");
	p("      }");
	p("    }");
	p("    myhref += \"&option=\" + searchOptions;");
	p("    parent.location.href = myhref;");
	p("  }");
	p("  else {");
	p("  alert(\"Please fill in a value to find\");");
	p("  }");
	p("}");	

	p("function yugo(what) {");
	p("  var re = /(\\d+)\\s*-\\s*(\\d+)/;");
	p("  var range = eval(\"document.mapForm.range\" + what);");
	p("  var isMatch = re.exec(range.value);");
	p("  if (isMatch && isMatch[1] && isMatch[2]) {");
	p("    myhref = \""+makeServletURL("action=yugo\";"));
	p("    myhref += \"&band=\" + what + \"&from=\" + isMatch[1];");
	p("    myhref += \"&to=\" + isMatch[2];");
	p("    parent.location.href = myhref;");
	p("  }");
	p("  else {");
	p("    alert(\"You have submitted an improper range.  Your request must be of the form 12345-12345\");");
	p("  }");		
	p("}");
	
	p("//-->");
	p("</script>");
    }
    
    
    /**
     * print out the style sheet
     */
    void outputStyle()
    {
	p("<style type=\"text/css\">");
	p("<!--");
	p("td	{ font-family: helvetica, arial, sans-serif; font-size: 10pt; }");
	p(".found { color:#cc0000; }");
	p(".info { font-size:9pt; font-style:italics; }");
	p("//-->");
	p("</style>");
    }
    
    
    /**
     * The top left corner of the page, control which map will be displayed.
     * If is a result of a search, highlights the map entries with hit. 
     */
    void showAllBandsList( BandMaster [] bandMaster , boolean [] searchSummary )
    {
	p("<form action=\"" + servlet_Path + "\" name=\"mapss\">");
	if ( searchSummary.length != 0 ) 
	    { 
		p("<i>Search matches in </i><span class=\"found\">Red</span><br>"); 
	    }
	
	for (int bandNumber=0;
	     bandNumber<bandMaster.length;
	     bandNumber++)
	    {
		BandMaster bm = bandMaster[ bandNumber ];
		String isChecked = "";
		String trailer = "<br>";
		if (bandNumber == (bandMaster.length-1))   { 
		    trailer = "&nbsp;&nbsp;"; 
		}
		if ( bm.isVisible() )  { 
		    isChecked = " checked";
		}
		p("<input type=\"checkbox\" name=\"map" + bandNumber +"\"" + isChecked + ">");
		if ( ( bandNumber < searchSummary.length ) && 
		     ( searchSummary.length > 0 ) && 
		     ( searchSummary[ bandNumber ] == true ) ) 
		    {
			p(" &nbsp; <span class=\"found\">" + bm.getDisplayName() + "</span>" + trailer); 
		    }
		else 
		    { 
			p(" &nbsp; <i>" + bm.getDisplayName() + "</i>" + trailer); 
		    }
	    }
	
	
	//p("<input type=\"hidden\" name=\"id\" value=\"" + id + "\">");
	p("<input type=\"hidden\" name=\"action\" value=\"show\">");
	p("<input type=\"submit\" value=\"update\">");
	p("</form>");
    }
    
    /**
     * this function is used for global search, meaning search all 5 chromosomes.
     */
    void showOtherChromosomeLink(boolean[] chromosomeHit){
	if (chromosomeHit == null)
	    return;
	int otherChrs = 0;
	int chr = Integer.parseInt(chromosome.trim()) - 1;
	for (int i = 0; i <chromosomeHit.length; i++){
	    if (i != chr){
		if(chromosomeHit[i]){
		    otherChrs++; 
     	 	}
	    }
	} 
	if (otherChrs > 0){
	    p("<i>Additional<br> matches:<br>");
	    for (int i = 0; i <chromosomeHit.length; i++){
                if (i != chr){
                    if(chromosomeHit[i])
                        p("<a href=\"" + makeServletURL("action=forward&chr="+(i+1))+ "\">" +
			  "<font color=\"#cc0000\">&nbsp;"+CHROMOSOMES[i]+"</font></a><br>");
            	}
	    }
	    p("</i>");
	}
    } 
    
   
    /**
     * print out help link
     */ 
    void outputSpecialLinks( BandMaster bm , int bandNumber  )    {
	if ( bm.isAGI() == true )    {
	    p("<br>");

	    p("<a href=\"javascript:showHelp('" + helpPath + "mapkey3a.jsp')\"><span class=\"info\">AGI Map color key</span></a>");
	    p("<br><br>");
	}
	
	if ( bm.isPhysical() == true ) {
	    p("<br>");
	    p("<a href=\"javascript:showHelp('" + helpPath + "mapkey32.jsp')\"><span class=\"info\">Physical Map color key</span></a>");
	    p("<br><br>");
	}
    }

    /**
     *
     */
    void drawBand( int bandNumber ,
		   StringBuffer mapString ,
		   BandMaster bm )
    {
	
	MapInfo tempInfo = bm.getMapInfo();

	if ( bm.isVisible() == false )
	    return;
	
	p("<tr>");
	p("<td width=150 valign=top>");
	p("<table width=148 border=0 align=center valign=top cellpadding=2 cellspacing=0>");
	p("<tr>");
	p("<td width=60><img src=\"" + imgPath + "/cleargif.gif\" width=60 height=1></td>");
	p("<td width=45><img src=\"" + imgPath + "/cleargif.gif\" width=45 height=1></td>");
	p("<td width=40><img src=\"" + imgPath + "/cleargif.gif\" width=40 height=1></td>");
	p("</tr>");
	p("<tr>");
	p("<td colspan=3><a href=\"javascript:showHelp('" + helpPath + /*mapToHelp*/MapMetaData.getInstance().getHelpLinks().get(bm.getDisplayName()) +  "')\"><b>" + bm.getDisplayName() + "</b></a>");
	p("</td></tr>");
	p("<tr>");
	p("<td colspan=3>" );

	p( makeImageTag(  bm.getZoneImageName() , getGenPath() , bandNameFor( bandNumber ) ) );
	
	generateZoneMap( mapString ,
			 bm.getNumberOfZones() ,
			 BandMaster.getZoneSize() , 
			 bandNumber );
	
	p("</td></tr>");
	p("<tr>");			
	p("<td align=left><a href=\"javascript:showHelp('" + helpPath + "mapnav12.jsp')\">Zoom to:</a></td>");
	p("<td colspan=2 align=right>");
	p("<select name=\"sband" + bandNumber + "\" onchange='update(\"" + bandNumber + "\")'>");
	
	showZoomLevels( bm );
	
	p("</td>");
	p("</tr>");

	if (bm.getDisplayName().indexOf("AGI") != -1)
	    p("<tr><td colspan=3 align=left>Zoom up to 200x to see genes!</td></tr>");

	p("<tr>");
	p("<td colspan=2><input type=\"text\" name=\"" + "band" + bandNumber + "\" size=6></td>");
	p("<td align=right><input type=\"button\" value=\"Find\" onclick='find(\"" + bandNumber + "\")'></td>");
	p("</tr>");			
	p("<tr><td colspan=3><span class=\"info\">Search by name (e.g. UFO)</span></td></tr>");
	p("<tr>");
	p("<td colspan=2><input type=\"text\" name=\"range" + bandNumber + "\" size=8></td>");
	
	p("<td align=right><input type=\"button\" value=\"Go\" onclick='yugo(\"" + bandNumber + "\")'></td>");
	p("</tr>");			
	p("<tr><td colspan=3><span class=\"info\">Select range (e.g. 1500-2000)</span></td></tr>");
	p("</table>");
	
	outputSpecialLinks( bm , bandNumber );
	
	p("</td>");
	p("<td width=10><img src=\"" + imgPath + "/cleargif.gif\" width=10 height=1></td>");
	p("<td width=602 align=center>");
	if (bandNumber==0) 
	    {
		p("<img src=\"" + imgPath + "/cleargif.gif\" height=1><br>");
	    }
	
	p( makeImageTag( tempInfo.getImageName() , getGenPath() ,  
			 tempInfo.getImageName() + "Map" ) );
	
	p("</td></tr>");
	p( "<br>" );
    }
    
    /**
     * Used by UserSession, insides the UserSession.genImage() code which it is called
     */ 
    public void output( BandMaster [] bandMaster , 
			boolean [] searchSummary , 
			boolean [] chromosomeHit ,
			PrintWriter pWriter , 
			String errorTarget ) 
    {
	
	this.pWriter = pWriter;
	
	p("<html>\n<head>\n<title>Maps for Chromosome" + chromosome + "</title>");
	
	outputScript( bandMaster.length );
	outputStyle();
	
	
	p("</head>");
	
	makeBodyTag( pWriter , errorTarget , true );
	
	p("<table width=775 border=0 align=center cellpadding=2 cellspacing=0>");
	p("<tr>");
	p("<td width=160><img src=\"" + imgPath + "/cleargif.gif\" width=160 height=1></td>");
	p("<td width=60><img src=\"" + imgPath + "/cleargif.gif\" width=60 height=1></td>");

	// need to check the total width of the table
	p("<td width=615 colspan=2><img src=\"" + imgPath + "/cleargif.gif\" width=565 height=1></td>");
	p("</tr>");
	p("<tr>");
	p("<td width=150 valign=top rowspan=2 bgcolor=\"#ffffee\">");
	
	showAllBandsList( bandMaster , searchSummary );      
	
	p("</td>");
	/////////// if global search match more than one chromosome, do this
	p("<td width=80 valign=top rowspan=2 bgcolor=\"#ffffff\">");
	
	showOtherChromosomeLink(chromosomeHit);      
	
	p("</td>");
	///////////
	p("<td colspan=2>");
	p("<b>Maps for Chromosome " + chromosome + "</b>");
	p("</td>");
	p("</tr>");
	p("<tr>");	
	p("<td width=400 valign=top>");
	p("<form action=\"" + servlet_Path + "\" name=\"mapForm\">");
	p("<table width=300 border=0 align=left cellpadding=2 cellspacing=0>");
	p("<tr>");
	p("<td colspan=2><i>for all Maps:</i></td>");
	p("<td width=300 valign=middle><a href=\"javascript:showHelp('" + helpPath + "mapnav6.jsp')\"><i>Search Options:</i></a></td>");
	p("</tr>");
	p("<tr>");
	p("<td align=center valign=top><a href=\"" + makeServletURL( "action=left&band=all" ) + "\"><img src=\""+imgPath+"/left.gif\" alt=\"Scroll left\" border=0></a></td>");
	p("<td valign=top><a href=\"" + makeServletURL( "action=right&band=all" ) + "\"><img src=\""+imgPath+"/right.gif\" alt=\"Scroll right\" border=0></a></td>");
	p("<td><select name=\"searchTypes\"><option value=\"selected\">Selected Maps");
	p("<option value=\"all\">All Maps<option value=\"all_chromosomes\">All Chromosomes</select><br>");
	p("</td>");
	p("</tr>");
	p("<tr>");
	p("<td width=40 align=center><a href=\"" + makeServletURL( "action=zoomout&band=all" ) + "\"><img src=\""+imgPath+"/zoomout.gif\" alt=\"Zoom out\" border=0></a></td>");
	p("<td width=60><a href=\"" + makeServletURL( "action=zoomin&band=all" ) + "\"><img src=\""+imgPath+"/zoomin.gif\" alt=\"Zoom in\" border=0></a></td>");
	p("<td><input type=\"text\" name=\"bandall\" size=10>");
	p("<input type=\"button\" value=\"Find\" onclick='find(\"all\")'>");
	p("</td></tr>");
	// newly added to allow user to select the rows to display
	p("<tr><td colspan=2>&nbsp;</td><td>");
	p("<select name=\"displayRows\" onchange = 'rSwap()'>");
	
	// which BandMaster? could be a bug!!!!!!!!!!
	
	showDisplayedRows(bandMaster[0]);
	p("<br></td></tr>");
	//     p("<tr><td colspan=3>&nbsp;</td></tr>");
	p("</table></td>");
	p("<td width=215 valign=top>");
	
	p("<a href=\"/\"><img src=\"/images/logosmall.gif\" width=\"61\" height=\"25\" border=\"0\" alt=\"TAIR Home\"></a>");
	p("<a href=\"javascript:showHelp('" + helpPath + "mapnavhe.jsp')\"><img src=\"/images/help.gif\" width=\"25\" height=\"25\" border=\"0\" alt=\"MapViewer Help\"></a><br><br>");

	p("<a href=\"" + servletPath + "\">MapViewer Home</a><br><br>");
	// the release notes will be moved to configuration file, jserv.properties 
	p("<a href=\"/search/map_rel_01beta.html\">Release Note</a><br><br>");
	
	p("<a href=\"javascript:{}\" onclick=\"window.open('" + makeServletURL( "action=print" ) + "','_printable','width=700,height=580,resizable,toolbar,menubar,scrollbars')\">View Print-Version</a>");
	p("</td>");
	p("</tr></table>");
	//  p("<br>");
	//p("<input type=\"hidden\" name=\"id\" value=\"" + id + "\">");
	p("<input type=\"hidden\" name=\"action\" value=\"zoomto\">");
	p("<input type=\"hidden\" name=\"band\" value=\"0\">");
	p("<input type=\"hidden\" name=\"zoomto\" value=\"0\">");
	p("<table width=762 align=center border=0 cellpadding=0 cellspacing=0>");
	
	
	StringBuffer mapString = new StringBuffer( 1000 );
	
	for (int bandNumber=0; bandNumber<bandMaster.length; bandNumber++) 
	    {
		drawBand( bandNumber , mapString , bandMaster[bandNumber] );
	    }
	
	p("</table>");

	for( int a = 0 ; a < bandMaster.length ; ++ a )	    {
	    if ( bandMaster[ a ].isVisible() ){
		MapInfo map = bandMaster[ a ].getMapInfo();
		    //MapInfo map = bandInfo[ a ];
		Enumeration p = map.elements();
		p ( "<map name=\"" + 
		    stripPathFromName(map.getImageName()) + 
		    "Map\">" );
		while (p.hasMoreElements())
		    {
			p((String)p.nextElement());
		    }
		p("</map>");
	    }
	}
	p(mapString.toString());
	p("</body>");
	p("</html>");
	pWriter.close();
	
    }  
    
}

