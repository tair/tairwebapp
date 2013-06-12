<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "ABRC Home" );
titlesAndUrls.add( "https://abrc.osu.edu/\"  onClick=\"javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');" );
titlesAndUrls.add( "Browse ABRC Catalog" );
titlesAndUrls.add( "/servlets/Order?state=catalog" );
titlesAndUrls.add( "Supplement to ABRC Catalog" );
titlesAndUrls.add( "/abrc/major_stocks.jsp" );
titlesAndUrls.add( "Search ABRC DNA/Clone Stocks" );
titlesAndUrls.add( "/servlets/Search?action=new_search&amp;type=dna" );
titlesAndUrls.add( "Search ABRC Seed/Germplasm Stocks" );
titlesAndUrls.add( "/servlets/Search?action=new_search&amp;type=germplasm" );
titlesAndUrls.add( "ABRC Stock Order History" );
titlesAndUrls.add( "/servlets/Order?state=search&amp;mode=stock_number" );
titlesAndUrls.add( "ABRC Fee Structure" );
titlesAndUrls.add( "https://abrc.osu.edu/fee-structure" );
titlesAndUrls.add( "Place ABRC Order" );
titlesAndUrls.add( "/servlets/Order?state=view" );
titlesAndUrls.add( "Search My ABRC Orders" );
titlesAndUrls.add( "/servlets/Order?state=search&amp;mode=user" );
titlesAndUrls.add( "Search ABRC Invoices" );
titlesAndUrls.add( "/user_invoice_form.jsp" );
titlesAndUrls.add( "How to Make Payments to ABRC" );
titlesAndUrls.add( "https://abrc.osu.edu/how-make-payments" );
titlesAndUrls.add( "ABRC Stock Donation" );
titlesAndUrls.add( "https://abrc.osu.edu/donate-stocks" );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName );
out.println( sidebarHtml );

%>
