<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "MASC";
String highlight = "3";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Europe" />
</jsp:include>
<div id="rightcolumn">
<!-- Content goes here //-->
<span class="mainheader"><I>Arabidopsis</I> Functional Genomics approaches highlighted in European Union FrameWork research funding programmes</span>
</span>
<p>
<dl>
<dd>
<LI><A HREF="#ERAPG"> ERA-NET Plant Genomics</A>
<LI><A HREF="#fp7"> EU's 7th Framework Programme</A>
<p>
</ul>
<p>
<hr>
<A NAME="ERAPG"><IMG SRC="/images/redball.gif"> <A HREF="http://www.erapg.org/">ERA-NET Plant Genomics.</a>
<p>
The ERA-NET Plant Genomics (ERA-PG) is a networking and coordination activity supported by the ERA-NET scheme under the EU’s 6th Framework Programme for strengthening the European Research Area.
The rationale behind ERA-NET is that networking national funding organizations and coordination between national programs in Europe will facilitate a stepping up from national to multilateral
coordination, thereby reducing redundancy and maximizing the returns on investment. Close collaboration and synergy of research efforts in plant sciences and joint investments in large-scale
technologies will create critical mass, contribute to competitiveness and help to drive policy development in favor of plant sciences at national and European levels. Building on a strong
foundation of existing collaborations, ERA-PG was among the first of ERA-NET projects to start in 2004. The Coordinator is NGI/NWO from The Netherlands and the founding members further include
ministries and funding agencies from Austria, Belgium, Denmark, Finland, France, Germany, Italy, Norway, Spain and UK. From the outset ERA-PG has been committed to expanding its network to new
members engaged in launching national plant genomics initiatives. Portugal, Switzerland, Israel and Sweden became contractual members two years after the start. Bulgaria joined as affiliate in 2006 followed by Canada in 2007.
<p>
ERA-PG has undertaken a large information gathering exercise leading to a shared information resource on research activities and economic impact of plant genomics that has been valuable beyond the
network itself. Researchers and science policy makers were brought together to build common ground for joint strategic activities at scientific and administrative levels, and to perform a study leading to development of
common framework mechanisms and best practices. In 2006 ERA-PG launched its first joint call for research ‘Structuring Plant Genomic Research in Europe’, which received more than 100 applications. 29 Projects were granted
with a total budget of over 35 million Euros, making this one of the largest coordinated multinational research programs in the ERA-NET scheme. As a result of the success of this process, the majority of these funding
organizations opted to commit to a further joint call, and they have also been joined by others. In January 2008 the second joint call ‘Strengthening the European Research Area in Plant Genomics – integrating new technologies
in plant science’ was launched, with a joint investment of about 15 million Euros, addressing researchers in Austria, Belgium, Canada, Finland, Germany, Israel, Netherlands, Portugal and United Kingdom. In the ERA-PG calls
the proposals are evaluated by international peer review after which an international expert panel advices the funding organizations about the selection and funding. The application, evaluation and selection are centrally managed following commonly agreed procedures.
<p>
ERA-PG organizes program summits (first in 2007 in Tenerife, second in 2009) and monitors the granted projects. Also, ERA-PG organizes and participates in science policy meetings, builds contacts with new countries and with the European Technology Platform
Plants for the Future and EPSO. The partners in ERA-PG aim to capitalize on the trans-national coordination of research and management established within the ERA-NET scheme and hope to receive funding for a follow-up under EU Framework Programme 7.
The overarching goal of the follow-up project will be to form sustainable cooperation and anchor joint programming (smaller or larger initiatives) between national programs in Europe and beyond.
<p>
<IMG SRC="/images/redball.gif"> <B>See the <A HREF="http://cordis.europa.eu/fp7/home_en.html">Cordis Website</A> now for information about receiving funding under
Framework Programme 7!</B></a>
<p>
<IMG SRC="/images/redball.gif"> <u><A HREF="http://ec.europa.eu/research/fp7/pdf/fp7-factsheets_en.pdf">
Read the FP7 Factsheet</U></a>
<p>
<A NAME="fp7"><a href="http://cordis.europa.eu/fp7/home_en.html">The European Union has highlighted Functional 
Genomics approaches, including plant genomics, in previous "Framework" research funding programmes</a>.  The current 7th Framework Programme (2007-2013) (FP7) is made up of 4 main blocks of activities forming 4
specific programmes plus a fifth specific programme on nuclear research:
<p>
<b>Cooperation - Collaborative research</b>
<LI> Health
<LI> Food, Agriculture and Biotechnology
<LI> Information and Communication Technologies
<LI> Nanosciences, Nanotechnologies, Materials and new Production Technologies
<LI> Energy
<LI> Environment (including climate change)
<LI> Transport (including Aeronautics)
<LI> Socio-economic sciences and Humanities
<LI> Security
<LI> Space
<p><b>Ideas - European Research Council</b>
<LI> Frontier research actions
<p>
<b>People - Human Potential, Marie Curie actions</b>
<LI> Initial training of researchers - Marie Curie Networks
<LI> Life-long training and career development - Individual fellowships
<LI> Industry-academia pathways and partnerships
<LI> International dimension - outgoing and incoming fellowships,
international cooperation scheme, reintegration grants
<LI> Excellence Awards
<p>
<b>Capacities - Research capacities</b>
<LI> Research infrastructures
<LI> Research for the benefit of SMEs
<LI> Regions of Knowledge
<LI> Research Potential
<LI> Science in Society
<LI> Support to the coherent development of research policies
<LI> Specific activities of international cooperation
<p>
<b>Nuclear research and training</b>
<LI> Fusion energy - ITER
<LI> Nuclear fission and radiation protection
<p>
<b>Joint Research Centre</b>
<LI> Direct actions in Euratom
<LI> Non-nuclear actions
<p>


</DT>
</DL>  
<center>Last modified on August 18, 2008</center>                  


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

