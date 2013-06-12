<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "Clones and DNA Resources" );
titlesAndUrls.add( "/portals/clones_DNA/index.jsp" );
titlesAndUrls.add( "Education and Outreach" );
titlesAndUrls.add( "/portals/education/index.jsp" );
titlesAndUrls.add( "Gene Expression Resources" );
titlesAndUrls.add( "/portals/expression/index.jsp" );
titlesAndUrls.add( "Genome Annotation" );
titlesAndUrls.add( "/portals/genAnnotation/index.jsp" );
titlesAndUrls.add( "MASC/Functional Genomics" );
titlesAndUrls.add( "/portals/masc/index.jsp" );
titlesAndUrls.add( "Metabolomics Resources" );
titlesAndUrls.add( "/portals/metabolome/index.jsp" );
titlesAndUrls.add( "Mutant and Mapping Resources" );
titlesAndUrls.add( "/portals/mutants/index.jsp" );
titlesAndUrls.add( "Nomenclature" );
titlesAndUrls.add( "/portals/nomenclature/index.jsp" );
titlesAndUrls.add( "Proteome Resources" );
titlesAndUrls.add( "/portals/proteome/index.jsp" );


String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName );
out.println( sidebarHtml );

%>

