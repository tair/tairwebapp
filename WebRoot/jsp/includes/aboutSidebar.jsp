<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "About TAIR" );
titlesAndUrls.add( "/about/index.jsp" );
titlesAndUrls.add( "About ABRC" );
titlesAndUrls.add( "http://abrc.osu.edu/" );


java.util.Map subMenus = new java.util.HashMap();
java.util.Vector subTitlesAndUrls = new java.util.Vector();
subTitlesAndUrls.add( "TAIR Staff" );
subTitlesAndUrls.add( "/about/staff.jsp" );
subTitlesAndUrls.add( "TAIR Board" );
subTitlesAndUrls.add( "/about/board.jsp" );
subTitlesAndUrls.add( "TAIR data sources" );
subTitlesAndUrls.add( "/about/datasources.jsp" );
subTitlesAndUrls.add( "Hyperlinking to TAIR" );
subTitlesAndUrls.add( "/about/linktotair.jsp" );
subTitlesAndUrls.add( "Citing TAIR" );
subTitlesAndUrls.add( "/about/citingtair.jsp" );
subTitlesAndUrls.add( "TAIR Database Schema" );
subTitlesAndUrls.add( "/search/ERwin/Tair.htm" );
subTitlesAndUrls.add( "PLAIN Project" );
subTitlesAndUrls.add( "/about/plain.jsp" );
subTitlesAndUrls.add( "PLAIN Data Warehouse" );
subTitlesAndUrls.add( "/about/data_warehouse.jsp" );
subTitlesAndUrls.add( "Publications" );
subTitlesAndUrls.add( "/about/tairpubs.jsp" );
subTitlesAndUrls.add( "TAIR Software" );
subTitlesAndUrls.add( "/about/software.jsp" );
subTitlesAndUrls.add( "TAIR Database Statistics" );
subTitlesAndUrls.add( "/jsp/tairjsp/pubDbStats.jsp" );
subTitlesAndUrls.add( "TAIR Usage Statistics" );
subTitlesAndUrls.add( "/tairusage/index.jsp" );
subTitlesAndUrls.add( "TAIR Presentations(ppt)" );
subTitlesAndUrls.add( "/portals/education/presentations.jsp" );
subTitlesAndUrls.add( "Users Guide(pdf)" );
subTitlesAndUrls.add( "TAIRUserGuideV1.0.pdf" );
subTitlesAndUrls.add( "TAIR Survey" );
subTitlesAndUrls.add( "/doc/about/tair_survey/411" );
subTitlesAndUrls.add( "TAIR Funding" );
subTitlesAndUrls.add( "/doc/about/tair_funding/410" );
subTitlesAndUrls.add( "TAIR Sponsorship" );
subTitlesAndUrls.add( "/doc/about/tair_sponsorship/412" );
subTitlesAndUrls.add( "TAIR Sponsors" );
subTitlesAndUrls.add( "/doc/about/tair_sponsors/413" );
subMenus.put( "About TAIR", subTitlesAndUrls );

java.util.Vector subTitlesAndUrls2 = new java.util.Vector();
subTitlesAndUrls2.add( "ABRC Staff" );
subTitlesAndUrls2.add( "https://abrc.osu.edu/directory\" onClick=\"javascript:urchinTracker('/outgoing/www_biosci_ohio-state_edu/abrchome_htm');"  );
subMenus.put( "About ABRC", subTitlesAndUrls2 );
subTitlesAndUrls2.add( "ABRC Fee Structure" );
subTitlesAndUrls2.add( "https://abrc.osu.edu/fee-structure" );
subTitlesAndUrls2.add( "How to Make Payments to ABRC" );
subTitlesAndUrls2.add( "https://abrc.osu.edu/how-make-payments" );
subTitlesAndUrls2.add( "Stock Donation Forms" );
subTitlesAndUrls2.add( "https://abrc.osu.edu/donate-stocks"  );
subTitlesAndUrls2.add( "ABRC Stock Acquisition and Deacquisition Policy" );
subTitlesAndUrls2.add( "https://abrc.osu.edu/stock-acquisition-and-deaquisition-policy" );
subTitlesAndUrls2.add( "ABRC Advisory Committee" );
subTitlesAndUrls2.add( "https://abrc.osu.edu/advisory-committee" );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );

%>

