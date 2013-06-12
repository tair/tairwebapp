<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "TAIR News" );
titlesAndUrls.add( "/news/index.jsp" );
titlesAndUrls.add( "Arabidopsis Newsgroup" );
titlesAndUrls.add( "/news/newsgroup.jsp" );
titlesAndUrls.add( "TAIR Newsletter Archive" );
titlesAndUrls.add( "/news/newsletter_archive.jsp" );
titlesAndUrls.add( "Conferences and Events" );
titlesAndUrls.add( "/news/events.jsp" );
titlesAndUrls.add( "Job Postings" );
titlesAndUrls.add( "/news/jobs.jsp" );
titlesAndUrls.add( "How to Post a Job" );
titlesAndUrls.add( "/help/faq.jsp#jobs" );

java.util.Map subMenus = new java.util.HashMap();
java.util.Vector subTitlesAndUrls = new java.util.Vector();
subTitlesAndUrls.add( "Breaking News" );
subTitlesAndUrls.add( "/doc/news/breaking_news/140" );
subTitlesAndUrls.add( "What was News" );
subTitlesAndUrls.add( "/news/oldnews.jsp" );
subMenus.put( "TAIR News", subTitlesAndUrls );

java.util.Vector subTitlesAndUrls2 = new java.util.Vector();
subTitlesAndUrls2.add( "Upcoming Events" );
subTitlesAndUrls2.add( "/news/events.jsp" );
subTitlesAndUrls2.add( "ICAR Abstracts" );
subTitlesAndUrls2.add( "/news/abstracts.jsp" );
subMenus.put( "Conferences and Events", subTitlesAndUrls2 );

java.util.Vector subTitlesAndUrls3 = new java.util.Vector();
subTitlesAndUrls3.add( "Archives" );
subTitlesAndUrls3.add( "http://www.bio.net/bionet/mm/arab-gen/\" onClick=\"javascript:urchinTracker('/outgoing/bio_net/bionet/mm/arab-gen/');" );
subTitlesAndUrls3.add( "About and How to Subscribe" );
subTitlesAndUrls3.add( "/news/newsgroup.jsp" );
subMenus.put( "Newsgroup", subTitlesAndUrls3 );


String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );

%>

