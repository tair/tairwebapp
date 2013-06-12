<%@ include file="templateSidebar.jsp" %>
<%

String sidebarName = request.getParameter( "sidebarName" );

if( sidebarName == null )
{
	throw new IllegalArgumentException( "sidebarName" );
}

java.util.Vector titlesAndUrls = new java.util.Vector();

titlesAndUrls.add( "DNA/Clones" );
titlesAndUrls.add( "/servlets/Search?action=new_search&amp;type=dna" );
titlesAndUrls.add( "Ecotypes" );
titlesAndUrls.add( "/servlets/Search?action=new_search&amp;type=ecotype" );
titlesAndUrls.add( "Genes" );
titlesAndUrls.add( "/servlets/Search?type=gene&amp;action=new_search" );
titlesAndUrls.add( "GO Annotations" );
titlesAndUrls.add( "/tools/bulk/go/index.jsp" );
titlesAndUrls.add( "Keywords" );
titlesAndUrls.add( "/servlets/Search?type=keyword&amp;action=new_search" );
titlesAndUrls.add( "Locus History" );
titlesAndUrls.add( "/tools/bulk/locushistory/index.jsp" );
titlesAndUrls.add( "Markers" );
titlesAndUrls.add( "/servlets/Search?type=marker&amp;action=new_search" );
titlesAndUrls.add( "Microarray Element" );
titlesAndUrls.add( "/tools/bulk/microarray/index.jsp" );
titlesAndUrls.add( "Microarray Experiment" );
titlesAndUrls.add( "/servlets/Search?type=expr&amp;search_action=new_search" );
titlesAndUrls.add( "Microarray Expression" );
titlesAndUrls.add( "/servlets/Search?action=new_search&amp;type=expression" );
titlesAndUrls.add( "People/Labs" );
titlesAndUrls.add( "/servlets/Search?action=new_search&amp;type=community" );
titlesAndUrls.add( "Polymorphisms and Alleles" );
titlesAndUrls.add( "/servlets/Search?action=new_search&amp;type=polyallele" );
titlesAndUrls.add( "Proteins" );
titlesAndUrls.add( "/servlets/Search?action=new_search&amp;type=protein" );
titlesAndUrls.add( "Protocols" );
titlesAndUrls.add( "/servlets/Search?type=protocol&amp;action=new_search" );
titlesAndUrls.add( "Publications" );
titlesAndUrls.add( "/servlets/Search?action=new_search&amp;type=publication" );
titlesAndUrls.add( "Seeds/Germplasms" );
titlesAndUrls.add( "/servlets/Search?action=new_search&amp;type=germplasm" );
titlesAndUrls.add( "Sequences" );
titlesAndUrls.add( "/tools/bulk/sequences/index.jsp" );
titlesAndUrls.add( "Textpresso Full Text" );
titlesAndUrls.add( "http://www.textpresso.org/arabidopsis/\" onClick=\"javascript:urchinTracker('/outgoing/textpresso');" );

String sidebarHtml = generateSidebar( titlesAndUrls, sidebarName );
out.println( sidebarHtml );

%>

