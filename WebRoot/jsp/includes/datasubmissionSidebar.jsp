<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "Data Submission" );
titlesAndUrls.add( "/submit/index.jsp" );

java.util.Map subMenus = new java.util.HashMap();
java.util.Vector subTitlesAndUrls = new java.util.Vector();

subTitlesAndUrls.add( "ABRC Stock Donation" );
subTitlesAndUrls.add( "https://abrc.osu.edu/donate-stocks" );
subTitlesAndUrls.add( "External Links" );
subTitlesAndUrls.add( "/submit/ExternalLinkSubmission.jsp" );
subTitlesAndUrls.add( "Gene Class Symbol Registration" );
subTitlesAndUrls.add( "/portals/nomenclature/symbol_main.jsp" );
subTitlesAndUrls.add( "Gene Family Data" );
subTitlesAndUrls.add( "/submit/genefamily_submission.jsp" );
subTitlesAndUrls.add( "Online Submission for Authors and Others" );
subTitlesAndUrls.add( "/doc/submit/functional_annotation/123" );
subTitlesAndUrls.add( "Gene Structure Additions/Modifications" );
subTitlesAndUrls.add( "/submit/gene_annotation.submission.jsp" );
subTitlesAndUrls.add( "Locus Identifier Request" );
subTitlesAndUrls.add( "/submit/locus_identifier_request.jsp" );
subTitlesAndUrls.add( "Marker and Polymorphism Data" );
subTitlesAndUrls.add( "/submit/marker_submission.jsp" );
subTitlesAndUrls.add( "Metabolic Pathway Data" );
subTitlesAndUrls.add( "/submit/pathway_submission.jsp" );
subTitlesAndUrls.add( "Phenotypes");
subTitlesAndUrls.add( "/submit/phenotype_submission.jsp" );
subTitlesAndUrls.add( "Protocols" );
subTitlesAndUrls.add( "/submit/protocol_submission.jsp" );
subTitlesAndUrls.add( "2010 Functional Genomics Gene List" );
subTitlesAndUrls.add( "/submit/submit_2010.jsp" );

subMenus.put( "Data Submission", subTitlesAndUrls );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );

%>

