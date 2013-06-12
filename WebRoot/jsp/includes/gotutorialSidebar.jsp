<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "TAIR's Gene Ontology Tools" );
titlesAndUrls.add( "/help/tutorials/go_intro.jsp" );
titlesAndUrls.add( "GO Annotation Bulk Download" );
titlesAndUrls.add( "/tools/bulk/go/index.jsp" );
titlesAndUrls.add( "TAIR Keyword Browser" );
titlesAndUrls.add( "/servlets/Search?action=new_search&amp;type=keyword" );
titlesAndUrls.add( "GO Website/Database" );
titlesAndUrls.add( "http://www.geneontology.org" );

java.util.Map subMenus = new java.util.HashMap();
java.util.Vector subTitlesAndUrls = new java.util.Vector();
subTitlesAndUrls.add( "What is the Gene Ontology" );
subTitlesAndUrls.add( "/help/tutorials/go1.jsp" );
subTitlesAndUrls.add("Anatomy of a GO Annotation" );
subTitlesAndUrls.add("/help/tutorials/go2.jsp" );
subTitlesAndUrls.add( "Where to find GO Annotations/GO tools" );
subTitlesAndUrls.add( "/help/tutorials/go3.jsp" );
subTitlesAndUrls.add( "Finding genes using GO terms" );
subTitlesAndUrls.add( "/help/tutorials/go4.jsp" );
subTitlesAndUrls.add( "How to find similarly annotated genes" );
subTitlesAndUrls.add( "/help/tutorials/go5.jsp" );
subTitlesAndUrls.add( "How to classify sets of genes by function, location and biological role" );
subTitlesAndUrls.add( "/help/tutorials/go6.jsp" );
subTitlesAndUrls.add( "Demos-Quicktime Movies" );
subTitlesAndUrls.add( "/help/tutorials/go7.jsp" );
subMenus.put( "TAIR's Gene Ontology Tools", subTitlesAndUrls );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );

%>

