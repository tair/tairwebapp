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
<jsp:param name="id" value="11540" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="MASC Documents" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE//-->
<span class="mainheader">MASC Annual Reports</span>

<dl>
Annual reports summarize yearly progress of the global Arabidopsis research community and include reports of the member countries and MASC subcommittees as well as recommendations to the community by the MASC for the upcoming year.
<P>
<table border=0 cellpadding=10>
<tr>
  <td>
 <a href="/portals/masc/2012_MASC_Report.pdf" title="Multinational Steering Committee report 2012">
  2012 MASC Report</a>
  </td>
  </tr>
</table>


<dt><A href="/portals/masc/2011_MASC_Report.pdf">The Multinational <I>Arabidopsis thaliana </I>Functional  Genomics Project: Annual Report 2011 </a></dt>

<dt><A href="/portals/masc/2010_MASC_Report.pdf">The Multinational <I>Arabidopsis thaliana </I>Functional  Genomics Project: Annual Report 2010 </a></dt>

<dt><A href="/portals/masc/2009_MASC_Report.pdf">The Multinational <I>Arabidopsis thaliana </I>Functional  Genomics Project: Annual Report 2009 </a></dt>

<dt><A href="/portals/masc/2008_MASC_Report.pdf">The Multinational <I>Arabidopsis thaliana </I>Functional  Genomics Project: Annual Report 2008 </a></dt>

<dt><A href="/portals/masc/2007_MASC_Report.pdf">The Multinational <I>Arabidopsis thaliana </I>Functional  Genomics Project: Annual Report 2007</a></dt>

<dt><A href="/portals/masc/2006MASC_report.pdf">The Multinational <I>Arabidopsis thaliana </I>Functional  Genomics Project: Annual Report 2006</a></dt>

<dt><A href="/portals/masc/MASC2005Report.pdf">The Multinational <I>Arabidopsis thaliana </I>Functional  Genomics Project: Annual Report 2005 </A></dt>

 
<DT><A  href="/portals/masc/MascReport2ndEdition.pdf">The  Multinational <I>Arabidopsis thaliana </I>Functional  Genomics Project: Annual Report 2004 </A></dt>

 <DT><A  href="/portals/masc/2003_Report.pdf">The  Multinational <I>Arabidopsis thaliana </I>Functional  Genomics Project: Annual Report 2003 </A></B></dt>

 <DT><A  href="/portals/masc/2010report.pdf">The  Multinational <I>Arabidopsis thaliana </I>Functional  Genomics Project: Beyond the Whole Genome Sequence </A>

<DD>The 2002 MASC publication, detailing the goals of the  International <I>Arabidopsis </I>research community and  presenting an update on progress being made toward our  ultimate goal of understanding the function of every  <I>Arabidopsis </I>gene by the year 2010. </dd>

<DT><A href="/portals/genAnnotation/gene_structural_annotation/progrept7.jsp">Years 7 & 8</a>
<DT><A href="/portals/masc/year6.pdf">Year 6</a>
<DT><A href="/portals/masc/year5.pdf">Year 5</a>
<DT><A href="/portals/masc/year4.pdf">Year 4</a>
<DT><A href="/portals/masc/year3.pdf">Year 3</a>
<DT><A href="/portals/masc/year2.pdf">Year 2</a>
<DT><A href="/portals/masc/Long_range_plan_1990.pdf">Year 1: A Long-range Plan for the Multinational Coordinated <I>Arabidopsis thaliana</I> Genome Reseearch Project</A> <DD>The 1990 publication (NSF 90-80) was converted to digital format and posted online in December, 2006.</dd>
</DL>
<p>


<center>Last modified on July 11, 2012</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


