<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%!
String pageName = "Browse";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%= cssfile %>" />
<jsp:param name="id" value="60" />
</jsp:include>

<jsp:include page="/jsp/includes/browseSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="" />
</jsp:include>

<!-- CONTENT IN HERE -->

<div id="rightcolumn">

<span class="mainheader">Browse Overview</span>
<p>
This section provides access to the following types of data in TAIR presented in browsable form.

</p>
<dl>

<dt><a href="/servlets/Order?state=catalog">ABRC Catalog</a></dt>
<dd>Browse the DNA and seed stocks available from ABRC. </dd>

<dt><a href="/portals/masc/projects.jsp">2010 Projects</a>
<dd>Find the Arabidopsis functional genomic projects awarded by NSF and other funding agencies.</dd>

<dt><a href="/browse/Cereon/index.jsp">Monsanto SNP and Ler Collections</a></dt>
<dd>Point of access to the Monsanto SNP & Ler sequence data, originally owned by Cereon.</dd>

<dt><a href="/browse/genefamily/index.jsp">Gene Families</a></dt>
<dd>Browse the Arabidopsis gene family data submitted to TAIR by users.</dd>

<dt><a href="/servlets/processor?type=transposonfamily&update_action=browse">Transposon Families</a></dt>
<dd>Browse families of transposable elements found in the Arabidopsis genome.</dd>

<dt><a href="/servlets/processor?type=genesymbol&update_action=view_symbol">Gene Symbols</a></dt>
<dd>Browse the Arabidopsis symbolic gene names currently in use.</dd>

<dt><a href="/servlets/Search?action=new_search&type=keyword">Ontologies/Keywords</a></dt>
<dd>Browse the terms available for functional annotation of genes used at TAIR.</dd>

<dt><a href="/browse/electricarab.jsp">Archived e-Journals</a></dt>
<dd>Browse old Arabidopsis publications only available as electronic files.</dd>


<dt><a href="http://www.aspb.org/publications/arabidopsis/">The Arabidopsis Book (TAB)</a></dt>
<dd>
This electronic book from ASPB contains dozens of invited chapters, each reviewing in detail an important and interesting aspect of Arabidopsis
thaliana biology and tools, with reference to what is known in other plants and in other kingdoms. New and updated chapters are regularly added.</dd>
</dl>
<center>Last modified on September 22, 2008</center>
		</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

