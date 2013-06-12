<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "Gene Descriptions" );
titlesAndUrls.add( "/tools/bulk/genes/index.jsp" );
titlesAndUrls.add( "GO Annotations" );
titlesAndUrls.add( "/tools/bulk/go/index.jsp" );
titlesAndUrls.add( "PO Annotations" );
titlesAndUrls.add( "/tools/bulk/po/index.jsp" );
titlesAndUrls.add( "Sequences" );
titlesAndUrls.add( "/tools/bulk/sequences/index.jsp" );
titlesAndUrls.add( "Proteins" );
titlesAndUrls.add( "/tools/bulk/protein/index.jsp" );
titlesAndUrls.add( "Locus History" );
titlesAndUrls.add( "/tools/bulk/locushistory/index.jsp" );
titlesAndUrls.add( "Microarray Elements" );
titlesAndUrls.add( "/tools/bulk/microarray/index.jsp" );


String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName );
out.println( sidebarHtml );

%>

