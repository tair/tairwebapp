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
<jsp:param name="id" value="115" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="MASC Submcomittees" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE//-->
<span class="mainheader">The Multinational Arabidopsis Steering Committee</span>
<p>

This portal contains information about the Multinational Arabidopsis Steering Committee (MASC), its full-time Coordinator, its Subcommittees, and Arabidopsis functional genomics projects and resources world wide.
<p>
The aim of these initiatives is to identify the molecular function of all Arabidopsis genes. 
<p>
It is MASC's goal to present the most comprehensive information about these projects.
<p> If you have feedback or information to add, please contact <A HREF="mailto:luise.brand@uni-tuebingen.de"> Luise Brand</a>,
Coordinator for the Multinational Arabidopsis Steering Committee.
<p>

<p><img src="/images/redball.gif"> <strong>New!</strong><a href="/portals/masc/2012_MASC_Report.pdf"> 2012 MASC Report </a> is now available!
<p>

<p><img src="/images/redball.gif"> <strong>New!</strong><a href="http://www.nsf.gov/pubs/2011/nsf11045/nsf11045.jsp"> Please see the 'Dear Colleague Letter for New Zeland and Japan' </a> from the U.S. National Science Foundation regarding
mechanisms in place at the NSF to respond to immediate research and education needs that may arise from unexpected evevnts.<p>

<p><img src="/images/redball.gif"> <strong>New!</strong>
<li><a href="http://nipponsciencesupport.net/">Support for Japanese scientists </a> affected by the March 11, 2011 earthquake and tsunami in Japan.<p>
<li>A <a href="http://nipponsciencesupport.net/home-us.html">U.S.-based effort</a> has been established recently.</li><p>

<p><img src="/images/redball.gif"> <strong>New!</strong> <a href="http://www.plantcell.org/cgi/reprint/tpc.110.078519v2"> PLANT CELL  Commentary on Bioinformatics</a>
<p><img src="/images/redball.gif"> <a href="/portals/masc/journal.jsp#informatics_wk">Arabidopsis Bioinformatics </a> and <a href="/portals/masc/Bioinformatics_Survey_18Mar2010.pdf"> Bioinformatics survey</a>  
</p>
<hr>
    <b>Based on Google Analytics employed by TAIR to track usage of the website, the top three MASC websites visited between November 1 2009- January 1, 2010 are:</b>
    <OL>
        <li><a href="/portals/masc/projects.jsp"><u>2010 and Plant Genome Research Program (PGRP) NSF-supported Projects</u></a>
          <p>
            <li><u><a href="/portals/masc/countries/NAASC_Info.jsp">Countries: NAASC_Info</a></u>
              <p>
      <li><a href="/portals/masc/index.jsp"><u>MASC Index page</u></a>
        <p>
          </ol>
</DL>
<p>
<b> Total MASC-related website usage in the time period between November 1 2010-January 1, 2011:<b>
<p>
 <UL TYPE=DISC>
<LI>45 MASC pages were viewed a total of 1,690 times
</UL>

<center>
  Last modified on July 11, 2012
</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


