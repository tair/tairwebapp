<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%
String pageName = "TAIR - About TAIR";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="40" />
</jsp:include>

<jsp:include page="/jsp/includes/aboutSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value=""/>  
</jsp:include>


<div id="rightcolumn">


		<!--
		
			Content goes here
			
		//-->
<span class="mainheader">About TAIR</span>

<dl>
The 
<a href="/index.jsp">Arabidopsis Information Resource (TAIR)</a> collects information and maintains a <a href="/portals/education/aboutarabidopsis.jsp">database</a> of genetic and molecular biology <a href="/about/datasources.jsp">data</a> for <a href="/portals/education/aboutarabidopsis.jsp"><I>Arabidopsis thaliana</I></a>, a widely used model plant. 

<P>
TAIR is located at the
<a href="http://carnegiedpb.stanford.edu">Carnegie Institution for Science Department of Plant
Biology</a>,
<a href="http://www.stanford.edu">Stanford</a>, California. Funding is provided by the
<a href="http://www.nsf.gov">National Science Foundation</a>,
<a href="http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=0850219">(Grant No. DBI-0850219)</a>.
Additional support is provided by corporate and nonprofit organizations through the 
<a href="/doc/about/tair_sponsorship/412">TAIR Sponsorship Program</a>. To view the list of current 
sponsors, please visit our <a href="/doc/about/tair_sponsors/413">TAIR sponsors page</a>.

<p>TAIR collaborates with the Arabidopsis Biological Resource Center (<a href="http://abrc.osu.edu/">ABRC</a>) to provide researchers with the ability to search and order stocks. The ABRC's mission is to aquire, preserve and distribute seed and DNA resources that are useful to the Arabidopsis research community.</p>
<p>
The data in TAIR can be <a href="/servlets/Search?type=general&action=new_search">searched</a>, viewed using 
our <a href="/cgi-bin/gbrowse/arabidopsis/">Gbrowse</a> or <a href="http://tairvm09.tacc.utexas.edu/servlets/sv">interactive SeqViewer</a>,
and analyzed with our  
<a href="/tools/">tools</a>. Our datasets can also be   
<a href="ftp://ftp.arabidopsis.org/home/tair/home/tair">downloaded</a> for your convenience. 

In addition, pages on  
<a href="/news/">news</a>, information on the  
<a href="/portals/genAnnotation/gene_structural_annotation/index.jsp">Arabidopsis Genome Initiative (AGI)</a>, 
<a href="/servlets/Search?type=protocol&amp;action=new_search">Arabidopsis lab protocols</a>, and  
<a href="/portals/index.jsp">useful links</a> are provided. 
<P>
For an in-depth description of the TAIR project see our most recent review entitled: <a href="/about/TAIR.pdf"><br /> <b>The Arabidopsis Information Resource (TAIR): gene structure and function annotation </b></a>
<P>
For detailed information about the database, software, and data management used by TAIR see the following PowerPoint slides presented at the
<B>Plant and Animal Genome (PAG) Meeting - San Diego January 2008 <br />
TAIR Workshop: Community Annotation at TAIR </B>
<DL>
<dd>&nbsp;&nbsp;<a href="/portals/education/presentations/2008/PAG2008_partI.ppt ">Part I Gene function community annotation</a> (PowerPoint format) Donghui Li </dd>
<dd>&nbsp;&nbsp;<a href="/portals/education/presentations/2008/PAG_gene_structure_annotation.ppt">Part II Gene structure annotation at TAIR</a> (PowerPoint format) Philippe Lamesch </dd>

</DL>


<P>

We hope you enjoy using this site. Please feel free to <a href="/contact">contact</a> us if you have any suggestion or questions.
</DL>
<center>Last modified on August 5, 2008</center>
</div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
