<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "Genes" );
titlesAndUrls.add( "ftp://ftp.arabidopsis.org/home/tair/Genes/\" onClick=\"javascript:urchinTracker('/outgoing/ftp/home/tair/Genes/\');" );
titlesAndUrls.add( "GO and PO Annotations" );
titlesAndUrls.add( "ftp://ftp.arabidopsis.org/home/tair/Ontologies/\" onClick=\"javascript:urchinTracker('/outgoing/\');" );
titlesAndUrls.add( "Maps" );
titlesAndUrls.add( "ftp://ftp.arabidopsis.org/home/tair/Maps/\" onClick=\"javascript:urchinTracker('/outgoing/ftp/home/tair/Maps/\');");
titlesAndUrls.add( "Microarray Data" );
titlesAndUrls.add( "ftp://ftp.arabidopsis.org/home/tair/Microarrays/\" onClick=\"javascript:urchinTracker('/outgoing/ftp/home/tair/Microarrays/\');" );
titlesAndUrls.add( "Pathways" );
titlesAndUrls.add( "ftp://ftp.plantcyc.org/Pathways/\" onClick=\"javascript:urchinTracker('/outgoing/ftp/plantcyc/Pathways/\');");
titlesAndUrls.add( "Polymorphisms" );
titlesAndUrls.add( "ftp://ftp.arabidopsis.org/Polymorphisms/\" onClick=\"javascript:urchinTracker('/outgoing/ftp/home/tair/Polymorphisms/\');");
titlesAndUrls.add( "Proteins" );
titlesAndUrls.add( "ftp://ftp.arabidopsis.org/home/tair/Proteins/\" onClick=\"javascript:urchinTracker('/outgoing/ftp/home/tair/Proteins/');" );
titlesAndUrls.add( "Protocols" );
titlesAndUrls.add( "ftp://ftp.arabidopsis.org/home/tair/Protocols/\" onClick=\"javascript:urchinTracker('/outgoing/ftp/home/tair/Microarrays/\"');");
titlesAndUrls.add( "Sequences" );
titlesAndUrls.add( "ftp://ftp.arabidopsis.org/home/tair/Sequences/\" onClick=\"javascript:urchinTracker('/outgoing/ftp/home/tair/Sequences/');");
titlesAndUrls.add( "Software" );
titlesAndUrls.add( "ftp://ftp.arabidopsis.org/home/tair/Software/\" onClick=\"javascript:urchinTracker('/outgoing/ftp/home/tair/Software/');");
titlesAndUrls.add( "User Requests" );
titlesAndUrls.add( "ftp://ftp.arabidopsis.org/home/tair/User_Requests/\" onClick=\"javascript:urchinTracker('/outgoing/ftp/home/tair/User_Requests/\');");

java.util.Map subMenus = new java.util.HashMap();


String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName );
out.println( sidebarHtml );

%>

