<%@ include file="templateSidebar.jsp" %>

<%
String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "Microarrays" );
titlesAndUrls.add( "/portals/expression/microarray/index.jsp" );
titlesAndUrls.add( "Massively Parallel Signature Sequencing" );
titlesAndUrls.add( "http://mpss.udel.edu/at?/\" onClick=\"javascript:urchinTracker('/outgoing/mpss_udel_edu/at');" );
titlesAndUrls.add( "Protein/RNA Localization" );
titlesAndUrls.add( "/portals/expression/localization.jsp" );
titlesAndUrls.add( "Functional Genomics Expression Projects" );
titlesAndUrls.add( "/portals/expression/microarrayFunctionalV2.jsp" );


java.util.Map subMenus = new java.util.HashMap();
java.util.Vector subTitlesAndUrls = new java.util.Vector();
subTitlesAndUrls.add( "Datasets" );
subTitlesAndUrls.add( "/portals/expression/microarray/microarrayDatasetsV2.jsp" );
subTitlesAndUrls.add( "Data Mining Tools" );
subTitlesAndUrls.add( "/portals/expression/microarray/microarrayExpressionV2.jsp" );
subTitlesAndUrls.add( "Array Designs/Array Element Mapping" );
subTitlesAndUrls.add( "/portals/expression/microarray/microarrayElementsV2.jsp" );
subTitlesAndUrls.add( "Microarray Facilities" );
subTitlesAndUrls.add( "/portals/expression/microarray/microarrayFacilitiesV2.jsp" );
subTitlesAndUrls.add( "Data Analysis Tools" );
subTitlesAndUrls.add( "/portals/expression/microarray/microarraySoftwareV2.jsp" );
subTitlesAndUrls.add( "Microarray Standards and User Groups" );
subTitlesAndUrls.add( "/portals/expression/microarray/microarrayStandardsV2.jsp" );
subMenus.put( "Microarrays", subTitlesAndUrls );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );
%>

