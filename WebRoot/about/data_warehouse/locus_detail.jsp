<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
  String pageName = "TAIR - About TAIR - Data Warehouse - Locus Detail";
  String cssfile = "/css/page/pagelevels.css";
%>

<%@ page errorPage="/jsp/common/gen_error.jsp"%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="cssfile" value="<%=cssfile %>" />
	<jsp:param name="id" value="414" />
</jsp:include>

<span style="margin-left: 10px" class="mainheader">PLAIN Data Warehouse - Locus Detail</span>

<div id="margincolumn">

	<p>
		This subsystem centers on the concept of locus, a specific location on
		a chromosome. This data mart contains information on gene models, gene
		structure, functional annotations, polymorphisms, germplasms, and meta
		data relevant to all available loci.
	</p>

	<p>
		<img alt="PLAIN Data Warehouse Locus Detail"
			src="/images/data_warehouse/locus_detail.png">
	</p>

</div>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
