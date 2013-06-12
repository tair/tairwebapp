<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
  String pageName = "TAIR - The PLAIN Project";
  String cssfile = "/css/page/pagelevels.css";
%>

<%@ page errorPage="/jsp/common/gen_error.jsp"%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="cssfile" value="<%=cssfile %>" />
	<jsp:param name="id" value="414" />
</jsp:include>

<jsp:include page="/jsp/includes/aboutSidebar.jsp" flush="true">
	<jsp:param name="sidebarName" value="The PLAIN Project" />
</jsp:include>

<div id="rightcolumn">
	<span class="mainheader">The PLAIN Project</span>
	<p>
		The Plant Genomics Data Computational Interface (PLAIN) project is a
		project to build an application programming interface (API) that will
		provide high-performance, web-based computational access for plant
		genomics data. The project will include a new, open technology for
		generating computational data web services; an open, portable,
		optimized data warehouse that supports very fast queries of plant
		biology data; and a plant biology query language, query builder, and
		query optimizer that will provide a simple way to limit query results
		to only the required data. The project will provide a range of data
		access methods to serve the needs of computational biologists and
		bench biologists for large and custom data sets. Implementation of
		this software at TAIR will provide REST and SOAP web services for
		computational use of TAIR data, RSS feeds for TAIR objects, and an
		implementation of a new query builder for TAIR.
	</p>
	<p>
		While strong advances have been made in data generation methods
		including new genome sequencing methods, high throughput phenotyping,
		protein localization and others, computational access to the resulting
		data still requires large amounts of both human and machine resources.
		By addressing this issue through architecture, this project leverages
		advances in software engineering by combining and applying them to the
		specific domain of plant genomics. In particular, developing a minimal
		but effective plant genomics schema using modern data modeling;
		leveraging model-driven architecture to enable generation of
		high-performance web services from platform-independent models; and
		developing a basic, well-formed query language for the plant genomics
		domain are intellectually challenging tasks that will have a
		significant impact on the technology required for computational
		access. Wide adoption of a standard set of web interfaces for
		computational access to plant genomics resources will greatly simplify
		the effort required to access and integrate plant genomic data,
		thereby facilitating computational analyses of the data. By providing
		an easy, robust, and consistent route to computational data access,
		standard web interfaces will also facilitate development of new
		resources that could transform existing datasets and present them in
		new ways, analogous to mashups using Google Maps data along with real
		estate listings, weather data, Wikipedia entries, etc. By providing
		computational APIs and the technological infrastructure to create them
		as open source tools, this project makes available a key set of
		technologies to computational biologists beyond TAIR. As the
		technology proves itself, it can move beyond plant biology into the
		more general biological realm.
	</p>
	<p>
	  You can find the current progress for the PLAIN project components at
	  these URLs:
	  <ul>
	  <li><a href="https://github.com/tair/webservice">PLAIN Web Services Generator</a></li>
	  <li><a href="/about/data_warehouse.jsp">PLAIN Data Warehouse</a></li>
	  <li><a href="https://github.com/tair/psql">Plant/SQL</a></li>
	  </ul>
	</p>
</div>

<p id="fund">
	<a href="http://www.ciw.edu/"><img src="/i/cis_logo.jpg" id="cis"
			alt="cis logo" width="69" height="35" /> </a><a
		href="http://www.nsf.gov/"><img src="/i/nsf.jpg" id="nsf"
			alt="nsf_logo" width="40" height="40" /> </a>The PLAIN project is
	located at the
	<a href="http://carnegiedpb.stanford.edu/">Carnegie Institution for
		Science Department of Plant Biology</a> and is funded by the
	<a href="http://www.nsf.gov/">National Science Foundation</a> by the
	NSF
	<a
		href="http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0960584">Plant
		Genomics Data Computational Interface</a> grant.
</p>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
