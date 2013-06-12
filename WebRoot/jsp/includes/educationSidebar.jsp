<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "About Arabidopsis" );
titlesAndUrls.add( "/portals/education/aboutarabidopsis.jsp" );
titlesAndUrls.add(" Search Arabidopsis Protocols and Manuals" );
titlesAndUrls.add(" /servlets/Search?type=protocol&amp;action=new_search" );
titlesAndUrls.add( "Science Education and Outreach Programs" );
titlesAndUrls.add( "/portals/education/programs.jsp" );
titlesAndUrls.add( "Teaching Resources" );
titlesAndUrls.add( "/portals/education/teach.jsp" );
titlesAndUrls.add( "Funding for Education and Outreach" );
titlesAndUrls.add( "/portals/education/outreach.jsp" );
titlesAndUrls.add( "Plant Biology Education Newsgroups" );
titlesAndUrls.add( "/portals/education/email.jsp" );
titlesAndUrls.add( "TAIR Presentations(ppt)" );
titlesAndUrls.add( "/portals/education/presentations.jsp" );
titlesAndUrls.add( "TAIR Help" );
titlesAndUrls.add( "/help/index.jsp" );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName );
out.println( sidebarHtml );

%>

