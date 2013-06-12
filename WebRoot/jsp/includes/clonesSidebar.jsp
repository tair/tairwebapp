<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "Find DNA Resources" );
titlesAndUrls.add( "/portals/clones_DNA/find_dna.jsp" );
titlesAndUrls.add( "Full-length cDNA and ORF Collections" );
titlesAndUrls.add( "/portals/clones_DNA/clones.jsp" );
titlesAndUrls.add( "HaloTag&#174; ORF Clones" );
titlesAndUrls.add( "/abrc/halo_tagged_orf_clones.jsp" );
titlesAndUrls.add("Arabidopsis Expressed Sequence Tags" );
titlesAndUrls.add("/abrc/ests.jsp" ); 
titlesAndUrls.add("Radish Expressed Sequence Tags" );
titlesAndUrls.add("/abrc/radish_ests.jsp" ); 
titlesAndUrls.add( "Libraries" );
titlesAndUrls.add( "/abrc/libraries.jsp" );
titlesAndUrls.add("Pooled Genomic DNA");
titlesAndUrls.add("/abrc/pooled_dna.jsp");

java.util.Map subMenus = new java.util.HashMap();
java.util.Vector subTitlesAndUrls = new java.util.Vector();
subTitlesAndUrls.add( "Search ABRC Stocks" );
subTitlesAndUrls.add( "/servlets/Search?action=new_search&amp;type=dna" );
subTitlesAndUrls.add( "Browse ABRC Stocks" );
subTitlesAndUrls.add( "/servlets/Order?state=catalog#dna" );
subTitlesAndUrls.add( "Search Riken FL-cDNA" );
subTitlesAndUrls.add( "http://rarge.gsc.riken.jp/cdna/cdna_keyword.pl" );
subTitlesAndUrls.add( "Search SALK-SIGnAL/T-DNA Express" );
subTitlesAndUrls.add( "http://signal.salk.edu/cgi-bin/tdnaexpress\" onClick=\"javascript:urchinTracker('/outgoing/signal_salk_edu/cgi-bin/tdnaexpress');");
subMenus.put( "Find DNA Resources", subTitlesAndUrls );

java.util.Vector subTitlesAndUrls2 = new java.util.Vector();
subTitlesAndUrls2.add( "cDNA libraries" );
subTitlesAndUrls2.add( "/abrc/catalog/cdna_library_1.html" );
subTitlesAndUrls2.add( "Genomic libraries" );
subTitlesAndUrls2.add( "/abrc/catalog/genomic_library_1.html" );
subTitlesAndUrls2.add( "Arabidopsis YAC libraries" );
subTitlesAndUrls2.add( "/abrc/YACs.jsp" );
subTitlesAndUrls2.add( "Arabidopsis BAC libraries" );
subTitlesAndUrls2.add( "/abrc/BACs_At.jsp" );
subTitlesAndUrls2.add( "BAC libraries from other species" );
subTitlesAndUrls2.add( "/abrc/BACs_OtherSp.jsp" );
subMenus.put( "Libraries", subTitlesAndUrls2 );



String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );

%>

