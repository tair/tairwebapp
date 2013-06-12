<%@ include file="templateSidebar.jsp" %>
<%@ page import = "org.tair.community.*" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "About MASC" );
titlesAndUrls.add( "/portals/masc/MASC_Info.jsp" );
titlesAndUrls.add( "Coordinator's Journal" );
titlesAndUrls.add( "/portals/masc/journal.jsp" );
titlesAndUrls.add( "MASC Members" );
titlesAndUrls.add( "/portals/masc/MASC_members.jsp" );
titlesAndUrls.add( "MASC by Country" );
titlesAndUrls.add( "/portals/masc/countries/index.jsp" );
titlesAndUrls.add( "MASC Subcommittees" );
titlesAndUrls.add( "/portals/masc/Subcommittees.jsp" );
titlesAndUrls.add( "MASC Documents" );
titlesAndUrls.add( "/portals/masc/masc_docs/index.jsp" );
titlesAndUrls.add( "Major Genomics Projects" );
titlesAndUrls.add( "/portals/masc/genomics_projects.jsp");
titlesAndUrls.add( "International Arabidopsis Informatics Consortium" );
titlesAndUrls.add( "/portals/masc/IAIC.jsp" );
titlesAndUrls.add( "International Conferences on Arabidopsis Research" );
titlesAndUrls.add( "/news/abstracts.jsp" );

titlesAndUrls.add( "Funding and Educational Opportunities" );
titlesAndUrls.add( "/portals/masc/funding.jsp" );
titlesAndUrls.add( "Arabidopsis Resource Portals" );
titlesAndUrls.add( "/portals/index.jsp" );

java.util.Map subMenus = new java.util.HashMap();


java.util.Vector subTitlesAndUrls1 = new java.util.Vector();



subMenus.put( "2010 Projects", subTitlesAndUrls1 );


java.util.Vector subTitlesAndUrls2 = new java.util.Vector();
subTitlesAndUrls2.add( "MASC Annual Reports" );
subTitlesAndUrls2.add( "/portals/masc/masc_docs/masc_reports.jsp" );
subTitlesAndUrls2.add( "Subcommittee Reports" );
subTitlesAndUrls2.add( "/portals/masc/masc_docs/masc_sub_rep.jsp" );
subTitlesAndUrls2.add( "Workshop Reports" );
subTitlesAndUrls2.add( "/portals/masc/masc_docs/masc_wk_rep.jsp" );
subMenus.put( "MASC Documents", subTitlesAndUrls2 );

java.util.Vector subTitlesAndUrls3 = new java.util.Vector();
subTitlesAndUrls3.add( "Asia/Pacific" );
subTitlesAndUrls3.add( "/portals/masc/countries/asia.jsp" );
subTitlesAndUrls3.add( "Europe" );
subTitlesAndUrls3.add( "/portals/masc/countries/europe.jsp" );
subTitlesAndUrls3.add( "Middle East" );
subTitlesAndUrls3.add( "/portals/masc/countries/Mideast.jsp" );
subTitlesAndUrls3.add( "North America" );
subTitlesAndUrls3.add( "/portals/masc/countries/northamerica.jsp" );
subTitlesAndUrls3.add( "South America" );
subTitlesAndUrls3.add( "/portals/masc/countries/southamerica.jsp" );

subMenus.put( "MASC by Country", subTitlesAndUrls3 );

java.util.Vector subTitlesAndUrls4 = new java.util.Vector();
subTitlesAndUrls4.add( "AFGN- Germany" );
subTitlesAndUrls4.add( "/portals/masc/AFGN.jsp" );
subTitlesAndUrls4.add( "AT2010- U.S." );
subTitlesAndUrls4.add( "/portals/masc/FG_projects.jsp" );
subTitlesAndUrls4.add( "AT2010-Resources" );
subTitlesAndUrls4.add( "/portals/masc/2010_resources.jsp" );
subTitlesAndUrls4.add( "GARNet- U.K." );
subTitlesAndUrls4.add( "http://garnet.arabidopsis.org.uk/" );

subMenus.put( "Major Genomics Projects", subTitlesAndUrls4 );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );

%>

