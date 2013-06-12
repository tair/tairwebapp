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
<jsp:param name="id" value="1150" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="About MASC" />
</jsp:include>
<div id="rightcolumn">
<!--CONTENT HERE//-->
<span class="mainheader">About MASC</span>
<dl>
<dt>History and Purpose</dt>
<dd>At the outset of the Multinational Coordinated <I>Arabidopsis thaliana </I> Genome Research Project, an <I>ad hoc </I> committee was formed, made up of representatives of countries and programs around the world involved in Arabidopsis  research.  Among the goals of this committee were forging relationships and fostering communication among the involved groups.  After some time had passed, the committee coalesced into the Multinational Science Steering Committee, and it was members of this committee who ensured communication among the Arabidopsis research community at large.
<p>
Arabidopsis  research has now progressed to a stage in which functional genomics will take the forefront. Participants in this exciting new world of genomic research realized that the same type of communication and coordination
provided by the Multinational Science Steering Committee during the first 10 years of the Project will be necessary in the new era.  Accordingly, the committee has been renewed under the title Multinational Arabidopsis Steering Committee
to coordinate various functional genomics activities world-wide.
</p>
</dd>

<dt>Composition and Responsibilities</dt>
<dd>The Multinational Arabidopsis Steering Committee (MASC) will be composed of <A HREF="/portals/masc/MASC_members.jsp"><u>representatives from each country</u></a> with major Arabidopsis functional genomics efforts or coalition of countries with smaller programs.
It is open to any country interested in participating.  Selection of MASC representatives is left to the discretion of each country.  It will meet once a year in conjunction with the International Conference on Arabidopsis Research.
Rotating MASC Chairs and Co-Chairs will be selected from the MASC membership, including <A HREF="/portals/masc/MASC_members.jsp"><u>country representatives</u></a> and <A HREF="/portals/masc/Subcommittees.jsp"><u>Subcommittee members.</u></a>
Specific responsibilities of the committee are:<br>

<UL TYPE=DISC>
<LI>To coordinate programmatic aspects of the Arabidopsis research world-wide.
<LI>To facilitate open communication and free exchange of data, materials and ideas among the Arabidopsis research community .
<LI>To monitor and summarize progress of scientific activities of participating laboratories
<LI>To identify needs and opportunities of the Arabidopsis research community and communicate them to funding agencies of participating nations.
<LI>To periodically update and adjust the course of the Project.
</UL>
</dd>
<dt>MASC Subcommittees</dt>

<dd>As a next step in coordination of International Arabidopsis
research, and especially the ongoing world-wide Functional Genomics
projects, the MASC has instituted a system of subcommittees, each of
which tracks progress toward the goals outlined for the Functional
Genomics community in the <A
HREF="http://www.nsf.gov/pubsys/ods/getpub.cfm?bio0202"> 2002 planning
document</A>.  These subcommittees will be composed of members of the
Arabidopsis community with expertise in each of the following
areas: 
<P> <UL TYPE=DISC>
 <LI> <A
HREF="/portals/masc/Subcommittees.jsp#bioinf">Bioinformatics</A>,
including genome annotation and pioneer proteins. 
 <LI><A
HREF="/portals/masc/Subcommittees.jsp#cdnas">cDNAs and
Clone-based Functional Proteomics (ORFeomics)</A> 

<LI> <A
HREF="/portals/masc/Subcommittees.jsp#metab">Metabolomics</A>
<LI> <A
HREF="/portals/masc/Subcommittees.jsp#natvar">Natural Variation/Comparative Genomics</A>
<LI> <A
HREF="/portals/masc/Subcommittees.jsp#phenome">Phenomics</A>
<LI> <A
HREF="/portals/masc/Subcommittees.jsp#prot">Proteomics</A>
<LI> <A
HREF="/portals/masc/Subcommittees.jsp#sysbio">Systems Biology</A>
</UL>
<p>Representatives to each of the subcommittees are encouraged to be in frequent contact with Arabidopsis colleagues in their country or region who are contributing to research in their field.  In turn, each member of the Arabidopsis community is encouraged to be in contact with their MASC representative or subcommittee representative to communicate where his or her research fits into our community efforts and where he or she sees needs or new opportunities. </p>
</dd>

</dl>
<p>

<center>
  Last modified on January 29, 2010
</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>





