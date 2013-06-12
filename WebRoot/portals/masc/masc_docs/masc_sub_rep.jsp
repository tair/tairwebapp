<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "MASC";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="11541" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="MASC Documents" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE//-->
<span class="mainheader">MASC Subcommittee Reports</span>

<dl>
<dt>Bioinformatics Subcommittee: [<a href="/portals/masc/Bioinformatics_2006Report.pdf">2006 Report]</a> 
[<a href="/portals/masc/Bioinformatics_2007Report.pdf">2007 Report]</a>
[<a href="/portals/masc/Bioinformatics_2008Report.pdf">2008 Report]</a> </dt>
</dl></P>

<dl>
<dt>Metabolomics Subcommittee: [<a href="/portals/masc/Metabolomics_2006Report.pdf">2006 Report]</a>
[<a href="/portals/masc/Metabolomics_2007Report.pdf">2007 Report]</a></dt>
</dl></P>

<dl>
<dt>Natural Variation and Comparative Genomics Subcommittee: [<a href="/portals/masc/NatVar_CompGen_2006Report.pdf">2006 Report]</a>
[<a href="/portals/masc/NatVar_CompGen_2007Report.pdf">2007 Report]</a>
[<a href="/portals/masc/NatVar_CompGen2007_LONGReport.pdf">2007 Expanded Report]</a>
[<a href="/portals/masc/NatVar_CompGen_2008Report.pdf">2008 Report]</a>
[<a href="/portals/masc/NatVar_CompGen_2009Report.pdf">2009 Report]</a></dt>
</dl></P>

<dl>
<dt>ORFeomics Subcommittee: [<a href="/portals/masc/ORFeomics_2006Report.pdf">2006 Report]</a>
[<a href="/portals/masc/ORFeomics_2007Report.pdf">2007 Report]</a>
[<a href="/portals/masc/ORFeomics_2008Report.pdf">2008 Report]</a>
[<a href="/portals/masc/ORFeomics_2009Report.pdf">2009 Report]</a>
</dt>
</dl></P>

<dl>
<dt>Phenomics Subcommittee: [<a href="/portals/masc/Phenomics_2006Report.pdf">2006 Report]</a>
[<a href="/portals/masc/Phenomics_2007Report.pdf">2007 Report]</a>
[<a href="/portals/masc/Phenomics_2008Report.pdf">2008 Report]</a>
[<a href="/portals/masc/Phenomics_2009Report.pdf">2009 Report]</a>
</dt>
</dl></P>

<dl>
<dt>Proteomics Subcommittee: [<a href="/portals/masc/Proteomics_2006Report.pdf"> 2006 Report]</a>
[<a href="/portals/masc/Proteomics_2007Report.pdf">2007 Report]</a>
[<a href="/portals/masc/Proteomics_2008Report.pdf">2008 Report]</a>
[<a href="/portals/masc/masc_docs/MASCP_editorial.pdf">Oct. 2008 J of Proteome Research Article]</a>
[<a href="/portals/masc/Proteomics_2009Report.pdf">2009 Report]</a>


</dt>
</dl></P>

<dl>
<dt>Systems Biology Subcommittee: [<a href="/portals/masc/SystemsBiology_2007Report.pdf">2007 Report]</a>
[<a href="/portals/masc/SystemsBiology_2008Report.pdf">2008 Report]</a>
[<a href="/portals/masc/SystemsBiology_2009Report.pdf">2009 Report]</a>
</dt>
</dl></P>
<center>Last modified on August 27, 2009</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


