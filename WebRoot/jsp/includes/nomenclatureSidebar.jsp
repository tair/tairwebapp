<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "Arabidopsis Nomenclature" );
titlesAndUrls.add( "/portals/nomenclature/guidelines.jsp" );
titlesAndUrls.add( "Nomenclature Resources" );
titlesAndUrls.add( "/portals/nomenclature/nomenclature.jsp" );
titlesAndUrls.add( "Browse Registered Arabidopsis Gene Symbols" );
titlesAndUrls.add( "/servlets/processor?type=genesymbol&amp;update_action=view_symbol" );
titlesAndUrls.add( "Register Arabidopsis Gene Class Symbols" );
titlesAndUrls.add( "/portals/nomenclature/symbol_main.jsp" );
titlesAndUrls.add( "Request Locus Identifier" );
titlesAndUrls.add( "/submit/locus_identifier_request.jsp" );


String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName );
out.println( sidebarHtml );

%>

