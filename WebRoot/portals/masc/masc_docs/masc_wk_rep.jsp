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
<jsp:param name="id" value="11542" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="MASC Documents" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE//-->
<span class="mainheader">Workshop Reports</span>
<dl> <dt>EU 2020 European Vision for Plant Science <a href="/portals/masc/2020_European_Vision.pdf">[Download Complete Workshop Report]</a></dt>
                <dd>The workshop aimed to map a way forward for plant science in the next decade, by looking at the current major challenges
facing biology and investigating how plants, particularly Arabidopsis, could provide solutions to these challenges.
</dd>
</dl></p>

<dl> <dt>2020 Vision for Biology: The Role of Plants in Addressing Grand Challenges in Biology <a href="/portals/masc/workshop2020.pdf">[Download Complete Workshop Report]</a></dt>
                <dd>Report from an NSF-sponsored workshop held January 3-5, 2008 that focused on the future directions for plant research, with special emphasis on the role of the reference species Arabidopsis in uncovering fundamental biological principles that will enable us
to face future challenges to our well-being and that of the global environment.
<p>
<b>A workshop summary was published by Natasha Raikhel in the journal Molecular Plant: </b> <a href="http://mplant.oxfordjournals.org/cgi/content/full/1/4/561">[Link to Free Full-text of Mol. Plant article]</a>
<i> Reference: Mol Plant 2008 1: 561-563; doi:10.1093/mp/ssn040</i>    
</dd>
</dl></p>

<dl> <dt>Plant Cyberinfrastructure Workshop Report <a href="/news/PlantCyberinReportFinal.pdf">[Download PDF]</a>.</dt>
                <dd>An outline for the next stage of the functional genomics research landscape. Report from an NSF-sponsored workshop held on October 17-18, 2005
documents the need and goals for a plant cyberinfrastructure for facilitating the synthesis of new biological insights from all available functional genomics data.
</dd>
</dl></p>

<dl>
<dt>Mid-course Evaluation of 2010 Program [<a href="AT2010WorkshopFinal.pdf">Download PDF]</a></dt>
                <dd>Report on the NSF 2010 Evaluation workshop held August 25-26, 2005 in Arlington, VA.</dd>
</dl></P>

<dl>
<dt>Data Integration Within the International Arabidopsis Community [<a href="/portals/masc/TIGRDataWorkshop.pdf">Download PDF]</a></dt>
                <dd>Report from the NSF workshop held April 18-19, 2005 at TIGR in Rockville, MD.</dd>
</dl></P>

<dl><dt>
 Functional Genomics and the Virtual Plant [<a href="/portals/masc/workshop2010.jsp">Link to summary webpage]</a></dt>
                    <DD>A blueprint for understanding how plants are built and
                    how to improve them. Report from an NSF-sponsored workshop
                    (Jan. 13-14, 2000 at the Salk Institute in San Diego, CA) to discuss the feasibility of commencing a publicly-funded program (AT2010) to
determine the function of all Arabidopsis genes during the next decade, using a systems approach, and sets the goals for functional genomics
                    research.</dd></dl></p>

<dl>
<dt>Realizing the Potential of Plant Genomics: From Model Systems to the Understanding of Diversity [<a href="http://www.nsf.gov/pubs/2001/bio011">Link to NSF site]</a></dt>
                <dd>Report (published in April, 1999) from the NSF-sponsored 'New Directions in Plant Biological Research' workshop held November 23 & 24, 1998 at the Carnegie Institution of
Washington, Department of Plant Biology, Stanford University. </dd>
                <dl>
<dt>Long-range Plan for the Multinational Coordinated <I>Arabidopsis thaliana</I> Genome Reseearch Project [<A href="/portals/masc/Long_range_plan_1990.pdf">Download PDF] </A></a></dt>
                <dd>This report (published in 1990) culminated from 4 NSF-sponsored workshops and input from the international research community at the Fourth International Arabidopsis
                Conference held in Vienna, in 1990. </dd>
</dl></P>
</dl></P>

</DL>
<p>


<center>Last modified on September 23, 2008</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

