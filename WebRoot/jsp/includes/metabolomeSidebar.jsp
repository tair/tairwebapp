<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "Pathway and Compound Databases" );
titlesAndUrls.add( "/portals/metabolome/metabolome_database.jsp" );
titlesAndUrls.add( "Metabolite Profiling Data" );
titlesAndUrls.add( "/portals/metabolome/metabolome_data.jsp" );
titlesAndUrls.add( "Data Analysis Tools" );
titlesAndUrls.add( "/portals/metabolome/metabolome_tool.jsp" );
titlesAndUrls.add( "Services and Facilities" );
titlesAndUrls.add( "/portals/metabolome/metabolome_facility.jsp" );
titlesAndUrls.add( "Metabolomics Standards" );
titlesAndUrls.add( "/portals/metabolome/metabolome_standard.jsp" );
titlesAndUrls.add( "Chemical Structure Tools" );
titlesAndUrls.add( "/portals/metabolome/metabolome_chemicals.jsp" );



String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName);
out.println( sidebarHtml );

%>

