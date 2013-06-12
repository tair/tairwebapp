<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "AraCyc Tutorial" );
titlesAndUrls.add( "/help/tutorials/aracyc_intro.jsp" );
titlesAndUrls.add( "Aracyc Home" );
titlesAndUrls.add( "/biocyc/index.jsp" );

java.util.Map subMenus = new java.util.HashMap();
java.util.Vector subTitlesAndUrls = new java.util.Vector();
subTitlesAndUrls.add( "Searching AraCyc: Pathways, Reactions, Genes and Compounds" );
subTitlesAndUrls.add( "/help/tutorials/aracyc1.jsp" );
subTitlesAndUrls.add("Understanding the AraCyc Detail Pages" );
subTitlesAndUrls.add("/help/tutorials/aracyc2.jsp" );
subTitlesAndUrls.add( "Browsing AraCyc: Pathways, Reactions, Genes and Compounds" );
subTitlesAndUrls.add( "/help/tutorials/aracyc3.jsp" );
subTitlesAndUrls.add( "Using the Metabolic Map Overview" );
subTitlesAndUrls.add( "/help/tutorials/aracyc4.jsp" );
subTitlesAndUrls.add( "Displaying Gene Expression, Proteomic, Metabolomic and other Data in the Omics Viewer" );
subTitlesAndUrls.add( "/help/tutorials/aracyc5.jsp" );
subTitlesAndUrls.add( "Evidence Codes and Their Usage in AraCyc" );
subTitlesAndUrls.add( "/help/tutorials/aracyc6.jsp" );
subTitlesAndUrls.add( "Demos-Quicktime Movies" );
subTitlesAndUrls.add( "/help/tutorials/aracyc7.jsp" );
subMenus.put( "AraCyc Tutorial", subTitlesAndUrls );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );

%>

