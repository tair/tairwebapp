<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "Data Repositories" );
titlesAndUrls.add( "/portals/proteome/proteome_data.jsp" );
titlesAndUrls.add( "Data Analysis Tools" );
titlesAndUrls.add( "/portals/proteome/proteome_tool.jsp" );
titlesAndUrls.add( "Proteome Facilities" );
titlesAndUrls.add( "/portals/proteome/proteome_facility.jsp" );
titlesAndUrls.add( "Proteomics Standards" );
titlesAndUrls.add( "/portals/proteome/proteome_standard.jsp" );

java.util.Map subMenus = new java.util.HashMap();
java.util.Vector subTitlesAndUrls = new java.util.Vector();
subTitlesAndUrls.add("Primary Sequence");
subTitlesAndUrls.add("/portals/proteome/proteinSeq.jsp");
subTitlesAndUrls.add("Protein Domain");
subTitlesAndUrls.add("/portals/proteome/domain.jsp");
subTitlesAndUrls.add("Protein Structure");
subTitlesAndUrls.add("/portals/proteome/proteinStructure.jsp");
subTitlesAndUrls.add("Protein Location");
subTitlesAndUrls.add("/portals/proteome/proteinLocation.jsp");
subTitlesAndUrls.add("Protein-protein Interaction");
subTitlesAndUrls.add("/portals/proteome/proteinInteract.jsp");
subTitlesAndUrls.add("Biochemical Properties");
subTitlesAndUrls.add("/portals/proteome/biochem.jsp");
subMenus.put( "Data Repositories", subTitlesAndUrls);

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );

%>

