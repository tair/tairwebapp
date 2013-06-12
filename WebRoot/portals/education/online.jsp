<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "Web Resources";
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


<jsp:include page="/jsp/includes/educationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Web Resources for Teachers and Students" />  
</jsp:include>


<!--
<div id="breadcrumbs"><a href="index.jsp">Home</a> &gt; <a href="/links/index.jsp">Link To</a></div>
-->
<div id="rightcolumn">


<span class="mainheader">Web Resources for Teachers and Students</span>
<p>This page contains information about and links to primarily web-based educational resources such as curriculum materials, student activities and public outreach materials.</p>
<dl>
<dt><a href ="http://nsdl.org/">National Science Digital Library</a></dt>
<dd>Description:NSDL is funded by the National Science Foundation to provide a comprehensive, online source for science, technology, engineering and mathematics education. It is a searchable digital library of high quality materials including online exhibits, interactive tutorials and lessons on a variety of topics.</dd>
<dd>Affiliated Organizations:National Science Foundation</dd>
<dd>Links:<a href ="http://nsdl.org/">http://nsdl..org/</a></dd>


<dt>American Society of Plant Biologists</dt>
<dd>Description:This site includes links to educational materials about  plants including: classroom exercises,informational videos and web pages,instructional materials and more. ASPB also sponsors undergraduates who wish to perform research in a participating laboratory.</dd>
<dd>Affiliated Organizations:American Society of Plant Biologists</dd>
<dd>Links:<a href ="http://www.aspb.org/education/">http://www.aspb.org/education/</a></dd>



<dt><a href ="http://www.accessexcellence.org/">Access Excellence</a></dt>
<dd>Description:Created in 1993,Access Excellence is a national educational program that provides high school biology and life science teachers access to their colleagues, scientists, and critical sources of new scientific information via the World Wide Web. The program was originally developed and launched by Genentech Inc., and has since moved to the National Health Museum. The site provides links to numerous resources such as interactive media, on-line discussion forums, news links and teacher developed activities.</dd>
<dd>Affiliated Organizations:National Health Museum</dd>
<dd>Links:<a href ="http://www.accessexcellence.org/">http://www.accessexcellence.org/</a></dd>



<dt>UC Biotech</dt>
<dd>Description:Developed and maintained by Peggy Lemaux at the University of California at Berkeley, this site contains links to instructional materials and downloadable resources for teaching about biotechnology.Also includes a searchable database of publications about biotechnology.</dd>
<dd>Affiliated Organizations:University of California, Berkeley, CA. USA</dd>
<dd>Links:<a href ="http://www.ucbiotech.org/">http://www.ucbiotech.org/</a></dd>



<dt>European Biotechnology Initiative</dt>
<dd>Description:"The European Initiative for Biotechnology Education (EIBE) seeks to promote skills, enhance understanding and facilitate public debate throughout Europe." The site is available in English, French, Dutch,Italian and German and contains materials about biotechnology  designed for high school aged students. Includes two units dealing specifically with plant biotechnology.</dd>
<dd>Affiliated Organizations:</dd>
<dd>Links:<a href ="http://www.eibe.info/">http://www.eibe.info/</a></dd>



<dt>BIO-LINK</dt>
<dd>Description:Bio-Link is a National Advanced Technological Education (ATE) Center for Biotechnology that originated in late 1998 with a grant from the National Science Foundation. The ATE program was created to improve and expand educational programs that prepare skilled technicians to work in the high-tech fields that drive the U.S. economy.A national organization providing biotechnology related materials including: online courses, news and links to regional biotechnology education resources.Geared towards college students and college professors, the site also hosts a job bank.</dd>
<dd>Affiliated Organizations:University of California, San Francisco</dd>
<dd>Links:<a href ="http://www.bio-link.org/">http://www.bio-link.org/</a></dd>



<dt>Kids Gardening</dt>
<dd>Description:Plant and garden based educational materials developed by the National Gardening Association Includes:online courses,projects/protocols for students,curriculum modules, materials and more.</dd>
<dd>Affiliated Organizations:National Gardening Association</dd>
<dd>Links:<a href ="http://www.kidsgardening.com/">http://www.kidsgardening.com/</a></dd>

<dt>Eisenhower National Clearinghouse</dt>
<dd>Description:ENC's mission is to identify effective curriculum resources, create high-quality professional development materials, and disseminate useful information and products to improve K-12 mathematics and science teaching and learning.</dd>
<dd>Affiliated Organizations:Ohio State University, USDA</dd>
<dd>Links:<a href ="http://www.enc.org/">http://www.enc.org/</a></dd>
</dl>

</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
