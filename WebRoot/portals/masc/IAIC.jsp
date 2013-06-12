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
<jsp:param name="id" value="11551" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="2010 Program" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE//-->
<span class="mainheader"><a href="http://www.arabidopsisinformatics.org">IAIC: International Arabidopsis Informatics Consortium</span></a>
<hr>
    <IMG SRC="/images/redball.gif"><b> Please visit the official <a href="http://www.arabidopsisinformatics.org"><u>IAIC website</u> for the most recent IAIC information. </a></b> 
<dl>
    <p>
        
        <b>News Items:</b><p>
      
        <li> <a href="http://www.arabidopsisinformatics.org/design-workshop-2011/"<u>Design Workshop</u></a> completed, Dec. 14, 2011.
        Workshop <a href="http://www.arabidopsisinformatics.org/design-workshop-2011/presentations/"><u>presentations</u></a> are available as PDFs.
        Workshop <a href="http://www.arabidopsisinformatics.org/design-workshop-2011/design-workshop-participants/"><u>participants</u></a> are developing
        a white paper including recommendations about designing an Arabidopsis Informatics Portal (AIP).
        <li>Community Nominations to the IAIC Scientific Advisory Board are being reviewed by the IAIC Steering Committee and Multinational Arabidopsis
        Steering Committee (MASC). Final selections are expected to be made by end of January, 2012.</b>
 

<hr>
<p>The <a href="/portals/masc/MASC_Info.jsp"><u>Multinational Arabidopsis Steering Committee (MASC)</u></a> and the <a href="/portals/masc/countries/NAASC_Info.jsp"><u>North American Arabidopsis Steering Committee (NAASC)</u></a>
hosted workshops in the UK and the US in spring, 2010 to consider the future bioinformatics needs of the Arabidopsis community as well as other science communities that depend vitally on Arabidopsis resources.
<p>
The international workshops included about 36 participants each with representatives from plant biology, other model organism databases, computation,
database curation, community resources and funding agencies. A major outcome was the proposal to establish the IAIC. Although there are other international
Arabidopsis collaborations, e.g. MASC, the IAIC would focus on informatics and resources for the Arabidopsis and other plant communities. As proposed,
the IAIC would have a close relationship with MASC, and other community representatives and members, to best represent international interests. 
<p>
<b>    Primary goals for the <a href="http://www.arabidopsisinformatics.org/"><u>IAIC include:</b></u></a>
<ol>
    <li> to effectively manage the increasing amounts and types of Arabidopsis data and facilitate access by the community;
<li> to leverage international resources, knowledge, and collaborations;
<li> to be dynamic and represent the evolving needs and capacities of the community while reflecting the funding interests of the respective countries;
</li><br>Background information and additional outcomes are described below.
</ol>    
 <p><A href="/portals/masc/IAICDW_Info.pdf">Letter to the Community- Sep. 8, 2011 [PDF download]</a><p>
   
    <hr>
<LI><A HREF="#background"> IAIC Background and Goals</A> 
<LI><A HREF="#outcomes"> Conclusions and Outcomes of the Initial International Workshops (2010)</A>  
<LI><A HREF="#RCN"> Research Coordination Network Proposal to Establish the IAIC</A>  
<LI><A HREF="#tpc"> Commentary Published in The Plant Cell</A>
<LI><A HREF="#events"> Upcoming IAIC Events</A>
<LI><A HREF="#presentations"> Meeting Presentations</A>
<LI><A HREF="#input"> How to Provide Input to the IAIC</A>   
<LI><A HREF="#contacts"> IAIC Contacts</A>
<LI><A HREF="#pubs"> Additional Relevant Publications</A>
</dl>  
<p>

<A NAME="background"><b> IAIC Background and Goals</b></a>
<p>
<u>Background</u><p>
The focus of the US and UK workshops in early 2010 was on Arabidopsis bioinformatics. Arabidopsis plays a unique and essential role as the reference organism for all seed plant species, including crop plants.
The development of the highly annotated Arabidopsis genome sequence has been an invaluable resource for plant and crop sciences and provides important information for other species.
Molecular, biochemical, and genomic research in Arabidopsis sets the standard for other plants, laying the groundwork for advanced research in those organisms. However, it has become clear that an explosion
in the amount of information produced by the community has surpassed the ability of current data warehousing and distribution systems to accommodate and disseminate these data, resulting in a need to develop
new models for data integration and distribution. In addition, these data are being developed globally, and thus it is important that these models have a substantial international basis.
<p>
<u>Goals</u><p>
Based on the productivity of the Arabidopsis community and the importance of its findings, workshop participants concluded that there is a continued need for a central Arabidopsis information resource.
    Cohesive, cooperative, and long-term international collaboration will be critical to successfully maintain an Arabidopsis database infrastructure that is essential for plant biology research. Furthermore,
    the Arabidopsis community and funding agencies recognize the need for a single data management infrastructure. A key challenge is to develop and fund this resource in a sustainable and transparent manner, on a global scale.
    <p>
   The <a href="http://www.arabidopsisinformatics.org/"><u><b>International Arabidopsis Informatics Consortium (IAIC)</b></u></a> was proposed to achieve these overarching goals: <p>
<ol><li> to effectively manage the increasing amounts and types of Arabidopsis data and facilitate access by the community
<li> to leverage international resources, knowledge, and collaborations
<li> to be dynamic and represent the evolving needs and capacities of the community while reflecting the funding interests of the respective countries
  </ol>   

<P>
<p><A NAME="outcomes"><b> Conclusions and Outcomes of the Initial International Workshops (2010)</b></a>
<dd><li> The development and maintenance of plant data, tools and resources, including those of Arabidopsis, require significant support by funding agencies.
<p><li> This resource was envisioned to be part of a larger infrastructure. This might consist of a distributed system of data, tools and resources, accessed via a single point unified front-end interface (Arabidopsis Informatics Portal, AIP). 
<p><li> The resource would be funded by a variety of sources, under shared international management and scientific advisory board.
<p><li> The development of a new international Arabidopsis bioinformatics initiative is a logical next step to manage the increasing amounts and types of data, and it will allow the leveraging of resources, knowledge, and collaborations.
<p><li> The proposed International Arabidopsis Informatics Consortium (IAIC), is envisaged to initially consist of four parts: <br>
(1) the Arabidopsis Information Portal (mentioned above); (2) ‘gold-standard’ genome annotation; (3) genome/sequence curation providing functional information on genes, gene products, and associated features; (4) and stocks and resources databases.
<p><li> Additional informatics modules could join the IAIC to create a larger, more inclusive resource that represents the evolving needs and capacities of the community. A distributed IAIC (i.e. spread geographically amongst providers) allows the
workload, human expertise, innovation and costs to be shared across many sites that are internationally located.
<p><li> The proposed modular structure provides an ideal opportunity for the IAIC to link out and interact with other plant species. It was noted that an essential function of the IAIC would be to ensure that the distributed set of resources that
make up the IAIC could easily be leveraged to benefit those communities.
<p><li> The Arabidopsis and plant informatics communities will have direct input into IAIC activities via IAIC-sponsored workshops at the annual Arabidopsis meeting as well as through email to the consortium (see ‘contacts’ below) and through their country’s representative to MASC (if available).
<p><li> It was proposed that the IAIC would develop a comparative genomics module that would allow integration of data from other species as it reaches sufficient depth and quality. Such a module could consist of four layers: 1) Arabidopsis –
natural variation and genome evolution; 2) other Brassicaceae – nearest relatives enabling wider genome associations, orthology, natural variation, evolution, crop traits; 3) crop genomes – evolution, orthology, crop traits; and
4) other species. Such a module would not only allow other plant and crop researchers to access Arabidopsis information but would also enable Arabidopsis researchers to link out to appropriate orthologs and associated data in other plant species. 
 </dd>
<p><A NAME="RCN"><b> <A href="/portals/masc/IAIC_RCN_Aug2010.pdf">Research Coordination Network Proposal to Establish the IAIC</b></a>
            
<p><A NAME="tpc"><b> <A href="http://www.plantcell.org/cgi/reprint/tpc.110.078519v2">Commentary Published in The Plant Cell</b></a>

<p><A NAME="events"><a href="http://www.arabidopsisinformatics.org/meetings-opportunities/"><b> Upcoming IAIC Events</b></a>  <p>

<p><A NAME="presentations"><b> Presentations from IAIC meetings</b></a>  <p>
        <dd><li> Jane Silverthorne (NSF)- <A href="/portals/masc/PAG2011_NSF_FundingOpportunities.ppt">Powerpoint presentation </A>on Arabidopsis funding opportunities at NSF. From January 15, 2011 community meeting at the Plant and Animal Genome meeting. San Diego, CA. <p>
        <li> <A href="http://www.arabidopsisinformatics.org/design-workshop-2011/presentations/">Design Workshop (2011) presentations.</A>
        </dd>

<p><A NAME="input"><b><A HREF="http://www.arabidopsisinformatics.org/contact-us/">Provide Input to the IAIC</b></a><p>

<p> <A NAME="pubs"><A href="http://www.arabidopsisinformatics.org/resources/"><b> Additional Relevant Publications</b></a>


<center>Last modified on December 30, 2011</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


