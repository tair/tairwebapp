<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%!
String pageName = "TAIR - About TAIR - Linking to TAIR";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="402" />
</jsp:include>

<jsp:include page="/jsp/includes/aboutSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Hyperlinking to TAIR"/>  
</jsp:include>


<div id="rightcolumn">


		<!--
		
			Content goes here
			
		//-->
<span class="mainheader">Hyperlinking to TAIR</span>
<dl>
            There are three ways of hyperlinking to a page displaying information generated from TAIR DB.
<dl>
	<ul>
	  <li><b>Linking using TAIR accession</b>
	    <p>Any TAIR Object (e.g. clone, gene, genetic marker, sequence, etc.) can be linked to its detail page using its TAIR accession, which is a unique identifier in TAIR DB. The base URL for linking is:
<p>
	      http://arabidopsis.org/servlets/TairObject?accession=

<p>      e.g. <a href="/servlets/TairObject?accession=Clone:1768">http://www.arabidopsis.org/servlets/TairObject?accession=Clone:1768</a>
<p>
A list of TAIR accessions for Genes, Clones, and Genetic Markers on the sequenced genome is available from our ftp site at:
<p>
	  <a href="ftp://ftp.arabidopsis.org/home/tair/Maps/seqviewer_data/">ftp://ftp.arabidopsis.org/home/tair/Maps/seqviewer_data/</a>
 <p>   
	  <li><b>Linking to Locus using name and type</b>
	    <p>  
	      Any <a href="/search/generesu.htm#Locus">Locus</a> can be linked to its detail page using its name and type. The name of a Locus is unique and used by TAIR, TIGR, and MIPS. The base URL for linking is:
	<p> http://arabidopsis.org/servlets/TairObject?type=locus&name=

<p>e.g. <a href="/servlets/TairObject?type=locus&name=AT4G18960">http://www.arabidopsis.org/servlets/TairObject?type=locus&name=AT4G18960</a>
 <p>   
	  <li><b>Linking to Stocks using stock number</b>
	    <p>  
	      Any Stock can be linked to its detail page using its stock number. The number of a stock is unique and used by TAIR and ABRC. The base URL for linking is:
	<p> http://arabidopsis.org/servlets/StockSearcher?action=detail&stock_number=

<p>e.g. <a href="/servlets/StockSearcher?action=detail&stock_number=C00006">http://www.arabidopsis.org/servlets/StockSearcher?action=detail&stock_number=C00006</a>
	      </ul>
	      
              


<p>If you prefer to use programmatic methods to retrieve data from TAIR please contact <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a>. For TAIR's scripting policy, please see <a href="/help/faq.jsp#dev">TAIR FAQ for Developers</a>
</p>
</dl>
</dl>
<P>
<center>Date last modified: March 31, 2005</center>
</P>
</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
