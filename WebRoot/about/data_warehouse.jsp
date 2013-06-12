<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
  String pageName = "TAIR - About TAIR - PLAIN Data Warehouse";
  String cssfile = "/css/page/pagelevels.css";
%>

<%@ page errorPage="/jsp/common/gen_error.jsp"%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="cssfile" value="<%=cssfile %>" />
	<jsp:param name="id" value="414" />
</jsp:include>

<jsp:include page="/jsp/includes/aboutSidebar.jsp" flush="true">
	<jsp:param name="sidebarName" value="PLAIN Data Warehouse" />
</jsp:include>

<div id="rightcolumn">
	<span class="mainheader">PLAIN Data Warehouse</span>
	<p>
		The PLAIN data warehouse is an ongoing research project designed to
		create a new data model that provides fast and easy access to the data
		of interest in the TAIR database.
	</p>
	<p>
		The PLAIN data warehouse is a series of data marts, each focusing on a
		single central concept and the related information relevant to that
		concept. Each mart gives the client user the ability to query
		information about the main concept in a way that optimizes both the
		amount of effort spent in constructing a query and the processing time
		required to retrieve the results.
	</p>
	<ul>
		<li>
			<a href="/about/data_warehouse/shared.jsp">Shared Resources:</a> This
			subsystem contains the basic resources shared across all data marts,
			such as taxon and species variant.
		</li>
		<li>
			<a href="/about/data_warehouse/locus_detail.jsp">Locus Detail:</a>
			This subsystem centers on the concept of locus, a specific location
			on a chromosome. This data mart contains information on gene models,
			gene structure, functional annotations, polymorphisms, germplasms,
			and meta data relevant to all available loci.
	</ul>
</div>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
