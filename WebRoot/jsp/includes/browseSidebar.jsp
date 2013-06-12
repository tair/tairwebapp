<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();

titlesAndUrls.add( "ABRC Catalog" );
titlesAndUrls.add( "/servlets/Order?state=catalog" );
titlesAndUrls.add( "2010 Projects" );
titlesAndUrls.add( "/portals/masc/projects.jsp" );
titlesAndUrls.add( "Monsanto SNP and Ler Collections" );
titlesAndUrls.add( "/browse/Cereon/index.jsp" );
titlesAndUrls.add( "Gene Families" );
titlesAndUrls.add( "/browse/genefamily/index.jsp" );
titlesAndUrls.add( "Transposon Families" );
titlesAndUrls.add( "/servlets/processor?type=transposonfamily&update_action=browse" );
titlesAndUrls.add( "Gene Symbols" );
titlesAndUrls.add( "/servlets/processor?type=genesymbol&update_action=view_symbol" );
titlesAndUrls.add( "Ontologies/Keywords" );
titlesAndUrls.add( "/servlets/Search?action=new_search&type=keyword" );
titlesAndUrls.add( "Archived e-Journals" );
titlesAndUrls.add( "/browse/electricarab.jsp" );
titlesAndUrls.add( "The Arabidopsis Book (TAB)" );
titlesAndUrls.add( "http://www.aspb.org/publications/arabidopsis/" );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName );
out.println( sidebarHtml );

%>

