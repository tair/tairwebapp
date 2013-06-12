<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "AraCyc" );
titlesAndUrls.add( "/biocyc/index.jsp" );
/*titlesAndUrls.add( "Tools" );
titlesAndUrls.add( "/biocyc/tools.jsp" );*/
titlesAndUrls.add( "AraCyc Tutorials" );
titlesAndUrls.add( "http://plantcyc.org/tutorials/tutorials_index.faces" );
titlesAndUrls.add( "Downloads/FTP" );
titlesAndUrls.add( "/biocyc/downloads.jsp" );
titlesAndUrls.add( "Other DataBases" );
titlesAndUrls.add( "/biocyc/databases.jsp" );
titlesAndUrls.add( "Contributors" );
titlesAndUrls.add( "/biocyc/contributors.jsp" );

java.util.Map subMenus = new java.util.HashMap();
java.util.Vector subTitlesAndUrlsAracyc = new java.util.Vector();
subTitlesAndUrlsAracyc.add( "Search AraCyc" );
subTitlesAndUrlsAracyc.add( "http://pmn.plantcyc.org/ARA/server.html" );
subTitlesAndUrlsAracyc.add( "OMICS Viewer for experimental data overlay" );
subTitlesAndUrlsAracyc.add( "http://pmn.plantcyc.org/ARA/expression.html" );
subTitlesAndUrlsAracyc.add( "Metabolic (Cellular) Overview" );
subTitlesAndUrlsAracyc.add( "http://pmn.plantcyc.org/overviewsWeb/celOv.shtml" );
subTitlesAndUrlsAracyc.add( "More information" );
subTitlesAndUrlsAracyc.add( "/biocyc/introduction.jsp" );
subTitlesAndUrlsAracyc.add( "Pathway Data Submission Forms" );
subTitlesAndUrlsAracyc.add( "http://www.plantcyc.org/feedback/data_submission.faces" );
subTitlesAndUrlsAracyc.add( "Release Notes" );
subTitlesAndUrlsAracyc.add( "http://www.plantcyc.org/release_notes/aracyc/aracyc_release_notes.faces" );
subTitlesAndUrlsAracyc.add( "Other AraCyc Tools" );
subTitlesAndUrlsAracyc.add( "/biocyc/tools.jsp" );
subMenus.put( "AraCyc", subTitlesAndUrlsAracyc );

/*java.util.Vector subTitlesAndUrlsTools = new java.util.Vector();
subTitlesAndUrlsTools.add( "Comparative Analysis" );
subTitlesAndUrlsTools.add( "http://www.plantcyc.org:1555/ARA/comp-genomics?" );

subMenus.put( "Tools", subTitlesAndUrlsTools );*/

java.util.Vector subTitlesAndUrlsDownloads = new java.util.Vector();
subTitlesAndUrlsDownloads.add( "AraCyc Pathways" );
subTitlesAndUrlsDownloads.add( "ftp://ftp.plantcyc.org/Pathways/\" onClick=\"javascript:urchinTracker('/outgoing/ftp/plantcyc/Pathways/');" );
subTitlesAndUrlsDownloads.add( "AraCyc Compounds" );
subTitlesAndUrlsDownloads.add( "ftp://ftp.plantcyc.org/Pathways/\" onClick=\"javascript:urchinTracker('/outgoing/ftp/plantcyc/Pathways/');");
subTitlesAndUrlsDownloads.add( "AraCyc Database" );
subTitlesAndUrlsDownloads.add( "http://www.plantcyc.org/downloads/license_agreement.faces" );
subTitlesAndUrlsDownloads.add( "PerlCyc" );
subTitlesAndUrlsDownloads.add( "/biocyc/perlcyc/index.jsp" );
subTitlesAndUrlsDownloads.add( "JavaCyc" );
subTitlesAndUrlsDownloads.add( "/biocyc/perlcyc/index.jsp" );
subMenus.put( "Downloads/FTP", subTitlesAndUrlsDownloads );

java.util.Vector subTitlesAndUrlsDatabases = new java.util.Vector();
subTitlesAndUrlsDatabases.add( "PlantCyc" );
subTitlesAndUrlsDatabases.add( "http://pmn.plantcyc.org/PLANT/server.html?\" onClick=\"javascript:urchinTracker('/outgoing/pmn.plantcyc.org/PLANT/server.html?/');" );
subTitlesAndUrlsDatabases.add( "Plant Metabolic Network (PMN)" );
subTitlesAndUrlsDatabases.add( "http://www.plantcyc.org/\" onClick=\"javascript:urchinTracker('/outgoing/plantcyc_org');" );
subTitlesAndUrlsDatabases.add( "MetaCyc" );
subTitlesAndUrlsDatabases.add( "http://www.metacyc.org/\" onClick=\"javascript:urchinTracker('/outgoing/metacyc_org');" );
subTitlesAndUrlsDatabases.add( "KEGG" );
subTitlesAndUrlsDatabases.add( "http://www.genome.jp/kegg/\" onClick=\"javascript:urchinTracker('/outgoing/genome_jp/kegg/');");
subTitlesAndUrlsDatabases.add( "Brenda" );
subTitlesAndUrlsDatabases.add( "http://www.brenda.uni-koeln.de/\" onClick=\"javascript:urchinTracker('/outgoing/brenda_uni-koeln_de');");
subTitlesAndUrlsDatabases.add( "UniProt" );
subTitlesAndUrlsDatabases.add( "http://www.expasy.uniprot.org/\" onClick=\"javascript:urchinTracker('/outgoing/expasy_uniprot_org');");
subTitlesAndUrlsDatabases.add( "Enzyme Nomenclature" );
subTitlesAndUrlsDatabases.add( "http://www.chem.qmul.ac.uk/iubmb/enzyme/\" onClick=\"javascript:urchinTracker('/outgoing/chem_qmul_ac_uk/iubmb/enzyme/');");
subMenus.put( "Other DataBases", subTitlesAndUrlsDatabases );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );

%>

