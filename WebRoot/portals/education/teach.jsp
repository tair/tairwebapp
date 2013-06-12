<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "Teaching Resources";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%= cssfile %>" />
<jsp:param name="id" value="1122" />
</jsp:include>

<jsp:include page="/jsp/includes/educationSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Teaching Resources" />  
</jsp:include>


<div id="rightcolumn">


<span class="mainheader">Teaching Resources</span>
<p>This page includes links to a variety of resources for teaching and learning about Arabidopsis,  plant biology, genetics and genomics that may be of interest to students and teachers. If you have a link you think we should add, please contact us at <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></p>


<dl>

<dt><a href="http://www.aspb.org/education/">American Society of Plant Biologists Education Pages</a></dt>
<DD>The ASPB's education section is a wealth of resources for educational materials about plants, genomics and biotechnology. Includes links to Dr. Roger Hangarter's <a href="http://sunflower.bio.indiana.edu/~rhangart/plantmotion/PlantsInMotion.html">"Plants in Motion"</a> theatre, where you can view time lapse videos of germination, phototropism, gravitropism and more.</dd>

<dt><a href ="http://cgslab.com/">Classical Genetics Simulator </a></dt>
<dd>Developed at the University of Wisconsin-Madison, CGS allows students to perform virtual test crosses with model organisms. Instructors can set the parameters for the populations under study, such as the number and type of traits in a population, the modes of inheritance and trait linkage. The students determine which crosses to perform and interpret the resulting data. CGS can be used as a primary laboratory module for introductory biology or genetics courses, or as a supplement to a hands-on genetics module with real organisms. <dd>
</dt>

<dt><a href="http://www.fastplants.org">Fast Plants</a></dt>
<DD>Everything for and about Wisconsin Fast Plants (<i>Brassica rapa</i>). Great activities, lesson plans, teacher support and links to many exciting projects which require minimal resources.</dd></dt>


<dt><a href="http://www.prep.biotech.vt.edu/">Partnership for Research in Education in Plants (PREP)</a></dt>
<DD>A scientist-teacher-student partnership in which students design and conduct their own experiments on Arabidopsis mutants, collect and analyze data and share their findings with research scientists. The PREP handbook, written by a science teacher, a scientist and outreach coordinator, includes extensive information about Arabidopsis, methods for growing Arabidopsis in the classroom and lesson plans. The primary audience is high school students. </dd>


<dt><a href="http://www.plantgdb.org/AtGDB/tutorial/HOWTO/GSannotation/index.php">Arabidopsis thaliana Genome Database (AtGDB) Gene Annotation Project.</a></dt>
<DD>Looking for on-line Bioinformatics Lessons? Learn about genes, similarity searching and genomics while annotating the structures of real Arabidopsis genes.An extension project between the AtGDB and a High School Teacher. User Sumbitted Annotations are incorporated into the database and disseminated to the research community.</dd>

<dt><a href ="http://www.accessexcellence.org/">Access Excellence</a></dt>
<dd>Created in 1993, Access Excellence is a national educational program that provides high school biology and life science teachers access to their colleagues, scientists, and critical sources of new scientific information via the Wordd Wide Web. The program was originally developed and launched by Genentech Inc., and has since moved to the National Health Museum. The site provides links to numerous resources such as interactive media, on-line discussion forums, news links and teacher developed activities.</dd>
</dt>

<dt><a href ="http://www.bio-link.org/">BIO-LINK</a></dt>
<dd>Bio-Link is a National Advanced Technological Education (ATE) Center for Biotechnology that originated in late 1998 with a grant from the National Science Foundation. The ATE program was created to improve and expand educational programs that prepare skilled technicians to work in the high-tech fields that drive the U.S. economy.A national organization providing biotechnology related materials including: online courses, news and links to regional biotechnology education resources.Geared towards college students and college professors, the site also hosts a job bank.<dd>
</dt>


<!--<dt><a href="http://www.biochem.wisc.edu/brassicaclassroomgenetics/index.html">Brassica genetics for the classroom</a> from the Amasino Lab</dt>
<DD>A gallery of new mutations in <i>Brassica rapa</i> (Wisconsin Fast Plants) for plant genetics that are being developed by the Amasino Lab.</dd>-->


<!--<dt><a href ="http://www.enc.org/">Eisenhower National Clearinghouse</a></dt>
<dd>ENC's mission is to identify effective curriculum resources, create high-quality professional development materials, and disseminate useful information and products to improve K-12 mathematics and science teaching and learning.</dd>-->

<dt><a href="http://www.ipn.uni-kiel.de/eibe/ENGLISH/INTRO.HTM">European Initiative for Biotechnology Education</a></dt>
<DD>Teaching materials on genetics, genomics and biotechnology  for high school students.Includes units on Transgenic Plants.</dd>


<dt><a href ="http://www.kidsgardening.com/">Kids Gardening</a></dt>
<dd>Plant and garden based educational materials developed by the National Gardening Association Includes:online courses,projects/protocols for students,curriculum modules, materials and more.</dd>
</dt>


<dt><a href="http://www.bioone.org/perlserv/?request=get-document&doi=10.1662%2F0002-7685%282000%29062%5B0059%3AHCPTWW%5D2.0.CO%3B2">Laboratory Exercises to Introduce Gravitropism</a></dt>
<DD>How Can Plants Tell Which Way Is Up? Kiss et.al. From the American Biology Teacher.  "How to Do It" laboratory exercises demonstrating gravitropism using starchless and wild type Arabidopsis plants.</dd>

<dt><a href ="http://metnet.vrac.iastate.edu/MetNet_Meta!Blast.htm">Meta!Blast</a>
<dd>A program targeted at high school and undergraduate students with the goal to provide an innovative and exciting approach for the understanding of cell biology.</dd>

<dt><a href ="http://nsdl.org/">National Science Digital Library</a></dt>
<dd>NSDL is funded by the National Science Foundation to provide a comprehensive, online source for science, technology, engineering and mathematics education. It is a searchable digital library of high quality materials including online exhibits, interactive tutorials and lessons on a variety of topics.<dd>
</dt>


<dt><a href="http://instruct1.cit.cornell.edu/courses/biomi290/MOVIES/OXYGENIC.HTML">Oxygenic Photosynthesis Animation</a></dt>
<DD>An excellent animation of photosynthesis. Requires Macromedia Shockwave to view.From the Cornell University's Microbiology 290/291 course.</dd>




<dt><a href="http://ppge.ucdavis.edu/index.htm">Partnership for Plant Genomics Education</a></dt>
<DD> This site for UC Davis' Partnership for Plant Genomics education includes Curriculum materials and Lab Protocols for Biotechnology, Software for Virtual DNA Fingerprinting Lab and a  Virtual Plant Transformation Lab (under development) and a step by step overview of plant transformation.</dd>

<dt><a href="http://www.plantgdb.org/PGROP/pgrop.php">Plant Genome Research Outreach Portal (PGROP)</a></dt>
<dd>Provides a centralized access point for locating Plant Genome Research "Outreach" activities, programs and resources that serves the needs of students, educators and researchers.

<dt><a href="http://polyploidy.org/index.php/Education">Polyploidy Portal Education Page</a></dt>
<dd>A wiki site featuring teaching modules on polyploidy, gene mapping in Arabidopsis, and on biostatistical analysis of microarrays.</dd>

<dt><a href="http://www.plantsci.cam.ac.uk/Haseloff/teaching/Index_teaching.htm">Teaching Resources page from <a href="http://www.plantsci.cam.ac.uk/Haseloff/Home.html">Jim Haseloff</a></dt>
<DD>Resources for teaching courses on Plant Development, Plant Sciences, Plant Biotechnology posted on Dr. Jim Haseloff's website.</dd>


<dt><a href ="http://www.ucbiotech.org/">UC Biotech</a></dt>
<dd>Description:Developed and maintained by Peggy Lemaux at the University of California at Berkeley, this site contains links to instructional materials and downloadable resources for teaching about biotechnology.Also includes a searchable database of publications about biotechnology.</dd>
</dt>

<dt><a href="http://wise.berkeley.edu/">WISE - Web-based Inquiry Science Environment</a></dt>
<DD>This web resource includes a lesson on "Genetically Modified Food in Perspective" that addresses the ethical, legal and social issues of plant biotechnology. This lesson was developed by science educators at UC Berkeley and field tested in the classroom.</dd>

</dl>
</div><!--end rightcolumn-->
<center>Last modified on November 16, 2008</center>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
