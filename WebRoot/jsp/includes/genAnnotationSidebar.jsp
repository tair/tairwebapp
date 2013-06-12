<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "Genome Snapshot" );
titlesAndUrls.add( "/portals/genAnnotation/genome_snapshot.jsp" );
titlesAndUrls.add( "Gene Structural Annotation" );
titlesAndUrls.add( "/portals/genAnnotation/gene_structural_annotation/index.jsp" );
titlesAndUrls.add( "Gene Functional Annotation" );
titlesAndUrls.add( "/portals/genAnnotation/functional_annotation/index.jsp" );
titlesAndUrls.add( "Genome Annotation Tools" );
titlesAndUrls.add( "/portals/genAnnotation/genome_annotation_tools/index.jsp" );
titlesAndUrls.add( "Other Genomes" );
titlesAndUrls.add( "/portals/genAnnotation/other_genomes/index.jsp" );

java.util.Map subMenus = new java.util.HashMap();
java.util.Vector subTitlesAndUrls = new java.util.Vector();
subTitlesAndUrls.add( "Genome Assembly" );
subTitlesAndUrls.add( "/portals/genAnnotation/gene_structural_annotation/agicomplete.jsp" );
subTitlesAndUrls.add( "Genome Annotation" );
subTitlesAndUrls.add( "/portals/genAnnotation/gene_structural_annotation/genome_annotation.jsp" );
subTitlesAndUrls.add( "Genome Publications and Documents" );
subTitlesAndUrls.add( "/portals/genAnnotation/gene_structural_annotation/genome_release.jsp" );
subTitlesAndUrls.add( "Submit Structural Annotation to TAIR" );
subTitlesAndUrls.add( "/submit/gene_annotation.submission.jsp" );
subTitlesAndUrls.add( "Reference Genome Sequence" );
subTitlesAndUrls.add( "/doc/portals/genAnnotation/gene_structural_annotation/ref_genome_sequence/11413" );
subMenus.put( "Gene Structural Annotation", subTitlesAndUrls );

java.util.Vector subTitlesAndUrls2 = new java.util.Vector();
subTitlesAndUrls2.add( "Ontologies" );
subTitlesAndUrls2.add( "/portals/genAnnotation/functional_annotation/ontologies.jsp" );
subTitlesAndUrls2.add( "TAIR Gene Search" );
subTitlesAndUrls2.add( "/servlets/Search?action=new_search&amp;type=gene" );
subTitlesAndUrls2.add( "Search/Browse TAIR Keywords" );
subTitlesAndUrls2.add( "/servlets/Search?action=new_search&amp;type=keyword" );
subTitlesAndUrls2.add( "TAIR GO Annotation Download" );
subTitlesAndUrls2.add( "/tools/bulk/go/" );
subTitlesAndUrls2.add( "TAIR and the GO Reference Genome Project" );
subTitlesAndUrls2.add( "/portals/genAnnotation/functional_annotation/reference.jsp" );
subTitlesAndUrls2.add( "Search/Browse Gene Ontology Database" );
subTitlesAndUrls2.add( "http://www.geneontology.org\" onClick=\"javascript:urchinTracker('/outgoing/geneontology_org');" );
subTitlesAndUrls2.add( "Search/Browse Plant Ontology Database" );
subTitlesAndUrls2.add( "http://plantontology.org\" onClick=\"javascript:urchinTracker('/outgoing/plantontology_org');");
subTitlesAndUrls2.add( "Submit Functional Annotation to TAIR" );
subTitlesAndUrls2.add( "/doc/submit/functional_annotation/123" );
subTitlesAndUrls2.add( "FTP Downloads" );
subTitlesAndUrls2.add( "ftp://ftp.arabidopsis.org/home/tair/Ontologies/\" onClick=\"javascript:urchinTracker('/outgoing/ftp/home/tair/Ontologies/');");
subMenus.put( "Gene Functional Annotation", subTitlesAndUrls2 );

java.util.Vector subTitlesAndUrls3 = new java.util.Vector();
subTitlesAndUrls3.add( "Gene Structural Annotation Tools" );
subTitlesAndUrls3.add( "/portals/genAnnotation/genome_annotation_tools/gene_id.jsp" );
subTitlesAndUrls3.add( "Software Downloads" );
subTitlesAndUrls3.add( "/portals/genAnnotation/genome_annotation_tools/bioinformatics.jsp" );
subTitlesAndUrls3.add( "Multiple Sequence Alignment Tools" );
subTitlesAndUrls3.add( "/portals/genAnnotation/genome_annotation_tools/seq_align.jsp" );
subTitlesAndUrls3.add( "Comprehensive Sequence Analysis Resources" );
subTitlesAndUrls3.add( "/portals/genAnnotation/genome_annotation_tools/seq_resources.jsp" );
subTitlesAndUrls3.add( "Comparative Resources" );
subTitlesAndUrls3.add( "/portals/genAnnotation/genome_annotation_tools/comparative_tools.jsp" );
subTitlesAndUrls3.add( "Plant Promoter and Regulatory Element Resources" );
subTitlesAndUrls3.add( "/portals/genAnnotation/genome_annotation_tools/cis_element.jsp" );
subTitlesAndUrls3.add( "Proteome Resources" );
subTitlesAndUrls3.add( "/portals/proteome/index.jsp" );
subTitlesAndUrls3.add( "Database Searches" );
subTitlesAndUrls3.add( "/portals/genAnnotation/genome_annotation_tools/dbsearches.jsp" );
subMenus.put( "Genome Annotation Tools", subTitlesAndUrls3 );

java.util.Vector subTitlesAndUrls4 = new java.util.Vector();
subTitlesAndUrls4.add( "Plant MODs" );
subTitlesAndUrls4.add( "/portals/genAnnotation/other_genomes/index.jsp#plants" );
subTitlesAndUrls4.add( "Non-plant MODs" );
subTitlesAndUrls4.add( "/portals/genAnnotation/other_genomes/index.jsp#non_plant" );
subTitlesAndUrls4.add( "Organism-specific Database Collections & Resources" );
subTitlesAndUrls4.add( "/portals/genAnnotation/other_genomes/index.jsp#multi_organism" );
subTitlesAndUrls4.add( "Plant Genome Sequencing Projects" );
subTitlesAndUrls4.add( "/portals/genAnnotation/other_genomes/index.jsp#sequence" );
subMenus.put( "Other Genomes", subTitlesAndUrls4 );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );

%>

