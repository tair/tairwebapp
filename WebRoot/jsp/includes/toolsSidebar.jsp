<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName must be non-null" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();
titlesAndUrls.add( "GBrowse" );
titlesAndUrls.add( "/cgi-bin/gbrowse/arabidopsis/" );
titlesAndUrls.add( "Synteny Viewer" );
titlesAndUrls.add( "/cgi-bin/gbrowse_syn/arabidopsis/" );
titlesAndUrls.add( "Seqviewer" );
titlesAndUrls.add( "http://tairvm09.tacc.utexas.edu/servlets/sv" );
titlesAndUrls.add( "N-Browse" );
titlesAndUrls.add( "/tools/nbrowse.jsp" );
titlesAndUrls.add( "IGB" );
titlesAndUrls.add( "/doc/tools/igb/91" );
titlesAndUrls.add( "Mapviewer" );
titlesAndUrls.add( "/servlets/mapper" );
titlesAndUrls.add( "AraCyc Pathways" );
titlesAndUrls.add( "/biocyc/index.jsp" );
titlesAndUrls.add( "BLAST" );
titlesAndUrls.add( "/Blast/index.jsp" );
titlesAndUrls.add( "WU-BLAST2" );
titlesAndUrls.add( "/wublast/index2.jsp" );
titlesAndUrls.add( "FASTA" );
titlesAndUrls.add( "/cgi-bin/fasta/nph-TAIRfasta.pl" );
titlesAndUrls.add( "Pattern Matching" );
titlesAndUrls.add( "/cgi-bin/patmatch/nph-patmatch.pl" );
titlesAndUrls.add( "Motif Analysis" );
titlesAndUrls.add( "/tools/bulk/motiffinder/index.jsp" );
titlesAndUrls.add( "VxInsight&reg;" );
titlesAndUrls.add( "/tools/bulk/microarray/analysis/index.jsp#vx" );
titlesAndUrls.add( "Java TreeView" );
titlesAndUrls.add( "/tools/bulk/microarray/analysis/index.jsp#jtv" );
titlesAndUrls.add( "Bulk Data Retrieval" );
titlesAndUrls.add( "/tools/bulk/index.jsp" );
titlesAndUrls.add( "Chromosome Map Tool" );
titlesAndUrls.add( "/jsp/ChromosomeMap/tool.jsp" );
titlesAndUrls.add( "Gene Symbol Registry" );
titlesAndUrls.add( "/portals/nomenclature/symbol_main.jsp" );
titlesAndUrls.add( "Textpresso Full Text" );
titlesAndUrls.add( "http://www.textpresso.org/arabidopsis/\" onClick=\"javascript:urchinTracker('/outgoing/textpresso');" );

    
java.util.Map subMenus = new java.util.HashMap();
java.util.Vector subTitlesAndUrls = new java.util.Vector();
subTitlesAndUrls.add( "Gene Descriptions" );
subTitlesAndUrls.add( "/tools/bulk/genes/index.jsp" );
subTitlesAndUrls.add( "GO Annotations" );
subTitlesAndUrls.add( "/tools/bulk/go/index.jsp" );
subTitlesAndUrls.add( "PO Annotations" );
subTitlesAndUrls.add( "/tools/bulk/po/index.jsp" );
subTitlesAndUrls.add( "Sequences" );
subTitlesAndUrls.add( "/tools/bulk/sequences/index.jsp" );
subTitlesAndUrls.add( "Proteins" );
subTitlesAndUrls.add( "/tools/bulk/protein/index.jsp" );
subTitlesAndUrls.add( "Locus History" );
subTitlesAndUrls.add( "/tools/bulk/locushistory/index.jsp" );
subTitlesAndUrls.add( "Microarray Elements" );
subTitlesAndUrls.add( "/tools/bulk/microarray/index.jsp" );
subMenus.put( "Bulk Data Retrieval", subTitlesAndUrls );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName, subMenus );
out.println( sidebarHtml );

%>

