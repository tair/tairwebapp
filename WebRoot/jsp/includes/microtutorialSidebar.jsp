<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "TAIR's Microarray Tools Tutorial" );
titlesAndUrls.add( "/help/tutorials/micro_intro.jsp" );
titlesAndUrls.add( "TAIR-Microarray Elements Search" );
titlesAndUrls.add( "/tools/bulk/microarray/index.jsp" );
titlesAndUrls.add( "TAIR- Microarray Experiment Search" );
titlesAndUrls.add( "/servlets/Search?type=expr&amp;search_action=new_search" );
titlesAndUrls.add( "TAIR-Microarray Expression Search" );
titlesAndUrls.add( "/servlets/Search?action=new_search&amp;type=expression" );
titlesAndUrls.add( "TAIR Analyzed Datasets- Large Scale Analysis" );
titlesAndUrls.add( "/tools/bulk/microarray/analysis/index.jsp" );
titlesAndUrls.add( "TAIR-CisElement Motif Finder" );
titlesAndUrls.add( "/tools/bulk/motiffinder/index.jsp" );
titlesAndUrls.add( "Download Experiment Data from FTP" );
titlesAndUrls.add( "ftp://ftp.arabidopsis.org/home/tair/Microarrays\" onClick=\"javascript:urchinTracker('/outgoing/ftp/home/tair/Microarrays');");

java.util.Map subMenus = new java.util.HashMap();
java.util.Vector subTitlesAndUrls = new java.util.Vector();
subTitlesAndUrls.add( "Available data and tools" );
subTitlesAndUrls.add( "/help/tutorials/micro1.jsp" );
subTitlesAndUrls.add("How to find microarray experiments" );
subTitlesAndUrls.add("/help/tutorials/micro2.jsp" );
subTitlesAndUrls.add( "How to find information about the expression of specific genes" );
subTitlesAndUrls.add( "/help/tutorials/micro3.jsp" );
subTitlesAndUrls.add( "Finding arrays that contain a gene or set of genes" );
subTitlesAndUrls.add( "/help/tutorials/micro4.jsp" );
subTitlesAndUrls.add( "Finding genes that are similarly expressed in multiple experiments" );
subTitlesAndUrls.add( "/help/tutorials/micro5.jsp" );
subTitlesAndUrls.add( "Finding potential regulatory sequences in co-clustered genes" );
subTitlesAndUrls.add( "/help/tutorials/micro6.jsp" );
subTitlesAndUrls.add( "How to download and view microarray data" );
subTitlesAndUrls.add( "/help/tutorials/micro7.jsp" );
subMenus.put( "TAIR's Microarray Tools Tutorial", subTitlesAndUrls );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );

%>

