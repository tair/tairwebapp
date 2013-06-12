<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "Stock Centers" );
titlesAndUrls.add( "stockcenters.jsp" );
titlesAndUrls.add( "Worldwide Resources" );
titlesAndUrls.add( "worldwide.jsp" );
titlesAndUrls.add( "Find Mutants" );
titlesAndUrls.add( "findmutants.jsp" );
titlesAndUrls.add( "Analyze Mutants" );
titlesAndUrls.add( "analyze.jsp" );

java.util.Map subMenus = new java.util.HashMap();
java.util.Vector subTitlesAndUrls = new java.util.Vector();
subTitlesAndUrls.add( "ABRC/TAIR Germplasm and Stock Search" );
subTitlesAndUrls.add( "/servlets/Search?action=new_search&type=germplasm" );
subTitlesAndUrls.add( "ABRC Catalog" );
subTitlesAndUrls.add( "/servlets/Order?state=catalog" );
subTitlesAndUrls.add( "NASC Germplasm Search and Browse" );
subTitlesAndUrls.add( "http://www.arabidopsis.info/\" onClick=\"javascript:urchinTracker('/outgoing/arabidopsis_info');");
subTitlesAndUrls.add( "AtEnsembl - NASC Genome Browser" );
subTitlesAndUrls.add( "http://atensembl.arabidopsis.info/\" onClick=\"javascript:urchinTracker('/outgoing/atensembl_arabidopsis_info');" );
subTitlesAndUrls.add( "AtIDB - A. thaliana Integrated DB" );
subTitlesAndUrls.add( "http://atidb.org/\" onClick=\"javascript:urchinTracker('/outgoing/atidb_org');");
subTitlesAndUrls.add( "SeqViewer - TAIR Genome Browser" );
subTitlesAndUrls.add( "http://tairvm09.tacc.utexas.edu/servlets/sv" );
subTitlesAndUrls.add( "SIGnAL T-DNA Express" );
subTitlesAndUrls.add( "http://signal.salk.edu/cgi-bin/tdnaexpress\" onClick=\"javascript:urchinTracker('/outgoing/signal_salk_edu/cgi-bin/tdnaexpress');");
subTitlesAndUrls.add( "RARGE - RIKEN Arabidopsis Genome Encyclopedia" );
subTitlesAndUrls.add( "http://rarge.gsc.riken.jp/\" onClick=\"javascript:urchinTracker('/outgoing/rarge_gsc_riken_jp/');");
subTitlesAndUrls.add( "TAIR BLAST" );
subTitlesAndUrls.add( "/Blast/" );
subTitlesAndUrls.add( "NASC Insert Watch" );
subTitlesAndUrls.add( "http://arabidopsis.info/insertwatch/\" onClick=\"javascript:urchinTracker('/outgoing/arabidopsis_info/insertwatch/');");
subTitlesAndUrls.add( "Request TILLING (Col)" );
subTitlesAndUrls.add( "http://tilling.fhcrc.org/\" onClick=\"javascript:urchinTracker('/outgoing/tilling_fhcrc_org_9366/');");
subTitlesAndUrls.add( "Request TILL<i>er</i> (Ler)" );
subTitlesAndUrls.add( "http://www.cnb.csic.es/~tiller/\" onClick=\"javascript:urchinTracker('/outgoing/tilling_Ler/');");
subMenus.put( "Find Mutants", subTitlesAndUrls );

java.util.Vector subTitlesAndUrls2 = new java.util.Vector();
subTitlesAndUrls2.add( "Map-based Cloning" );
subTitlesAndUrls2.add( "mapping.jsp" );
subTitlesAndUrls2.add( "Mutation Identification and Confirmation" );
subTitlesAndUrls2.add( "identification.jsp" );
subMenus.put( "Analyze Mutants", subTitlesAndUrls2 );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );

%>

