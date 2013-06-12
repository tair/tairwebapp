<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
String pageName = "TAIR - About TAIR - Board";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>



<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="409" />
</jsp:include>

<jsp:include page="/jsp/includes/aboutSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="TAIR Board"/>  
</jsp:include>
<div id="rightcolumn">


		<!--		
			Content goes here
			
		//-->
<span class="mainheader">TAIR Board</span>
<p>Board of Directors:</p>
    <div class="event">
        <a href="http://www.salk.edu/faculty/ecker.html">Joseph R. Ecker</a> <br />
        Professor <br />
        Plant Molecular and Cellular Biology Laboratory <br />
        Salk Institute for Biological Studies <br />
        San Diego, California <br />
    </div>
    <div class="event">
        <a href="http://biosci3.ucdavis.edu/FacultyAndResearch/FacultyProfile.aspx?FacultyID=217">Charles S. Gasser</a> <br />
	    Professor<br />
        Department of Molecular and Cellular Biology<br />
        University of California, Davis<br />
    </div>
	<div class="event">
        <a href="http://www.dartmouth.edu/~guerinot/Mary_Lou_Guerinot.html">Mary Lou Guerinot</a> <br /> 
	    Professor<br />
        Department of Biological Sciences<br />
        Dartmouth College<br />
    </div>
    
    <p>Advisory Board:</p>
    <div class="event">
        <a href="http://fds.duke.edu/db/aas/Biology/faculty/philip.benfey">Philip Benfey</a><br />
        Professor and Chair<br />
        Department of Biology<br />
        Duke University<br />
    </div>
    
    <div class="event">
	    <a href="http://www.mcb.harvard.edu/Faculty/faculty_profile.php?f=william-gelbart-m">William Gelbart</a> <br />
	    Professor<br />
        Department of Molecular and Cellular Biology<br />
        Harvard University and<br />
        Director of FlyBase<br/>
    </div>
    <div class="event">
	    <a href="http://www.jgi.doe.gov/research/rokhsar.html">Daniel Rokhsar</a> <br />
	    Program Head, Plant Genome Program, DOE Joint Genome Institute and<br />
        Professor of Genetics, Genomics, and Development<br />
        University of California, Berkeley<br />
    </div>
    
    
    <div class="event">
	    <a href="http://www-biology.ucsd.edu/faculty/schroeder.html">Julian Schroeder</a><br />
	    Distinguished Professor<br />
        Cell and Developmental Biology Section and Center for Molecular Genetics<br />
        University of California, San Diego<br />
    </div>
    
    <div class="event">
        <a href="http://www.weigelworld.org">Detlef Weigel</a><br />
        Director<br />
        Department of Molecular Biology<br />
        Max Planck Institute for Developmental Biology<br />
        T&#252;bingen, Germany<br />
    </div> 

<p>

<center>Last modified on December 9, 2009</center>
</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
