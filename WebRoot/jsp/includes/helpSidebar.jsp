<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "Tutorials" );
titlesAndUrls.add( "/help/tutorials/index.jsp" );
titlesAndUrls.add( "Getting Started Guide" );
titlesAndUrls.add( "/help/quickstart.jsp" );
titlesAndUrls.add( "Database/Tool Help Pages" );
titlesAndUrls.add( "/help/helpcontents.jsp" );
titlesAndUrls.add( "FAQ" );
titlesAndUrls.add( "/help/faq.jsp" );
titlesAndUrls.add( "TAIR Glossary" );
titlesAndUrls.add( "/servlets/processor?type=definition&amp;update_action=glossary" );
titlesAndUrls.add( "TAIR User Guide" );
titlesAndUrls.add( "/about/TAIRUserGuideV1.0.pdf" );


java.util.Map subMenus = new java.util.HashMap();
java.util.Vector subTitlesAndUrls = new java.util.Vector();
subTitlesAndUrls.add( "AraCyc Tutorial" );
subTitlesAndUrls.add( "http://plantcyc.org/tutorials/tutorials_index.faces" );
subTitlesAndUrls.add( "TAIR Gene Ontology Tools" );
subTitlesAndUrls.add( "/help/tutorials/go_intro.jsp" );
subTitlesAndUrls.add( "TAIR Microarray Tools" );
subTitlesAndUrls.add( "/help/tutorials/micro_intro.jsp" );
subMenus.put( "Tutorials", subTitlesAndUrls );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );

%>

