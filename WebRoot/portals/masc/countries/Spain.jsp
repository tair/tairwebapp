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
<jsp:param name="sidebarName" value="MASC By Country" />
</jsp:include>
<div id="rightcolumn">
		

		
<!-- Content goes here //--> 
<span class="mainheader">
<I>Arabidopsis
</I> Functional Genomics Efforts in Spain
</span>
<dl>
<p>Compiled by 
<A HREF="mailto:jpazares@cnb.uam.es">
Javier Paz-Ares</A>, 
<A HREF="http://www.cnb.uam.es/">
CSIC
</A>, Nacional de Biotechnologia, Madrid. 

<hr>
<p><IMG SRC="/images/redball.gif"> New! Read the <a href="/portals/masc/countries/Spain_2008.pdf"><u>2008 Spain MASC report (pdf).</u></a>
</p>
<b>1) TRANSPLANTA project:</b>
<p>
Coordinator: Javier Paz-Ares
<p>
This project aims to generate functional genomics resources for the analysis of Arabidopsis transcription factors. 
<br>
<b>Main project activities are:</b>
<p>
<LI>
i) generation of a collection of 1000  independent transgenic plants each conditionally expressing a different transcription factor
<LI>ii) Functional characterization of transcription factor expressing lines, to identify transcription factors relevant in development, and biotic and abiotic stress responses
<LI>iii) Identification of the binding site of 50 transcription factors using a microarray-based strategy
<LI>iv) Screen of EMS mutagenised plants using microarray based strategy 
<LI>v) Map Based cloning of relevant mutant genes.
<br>
The program has just started and the Website will be prepared this year.
<p>
<b>2) A Tilling facility for the Arabidopsis Landsberg ecotype has been implemented</b>
<p>Coordinator, Carlos Alonso; Web site: http://www.cnb.csic.es/~tiller
<p>
<b>3) Additionally several  biological process oriented projects (about 30) in which  genomics tools are being used are currently funded by the Spanish Ministry of Science.</b>
<p>
<b>Major funding sources for Arabidopsis functional genomics:</b>
<LI>Spanish Ministry of Education and Science (http://www.mec.es/)
<LI>Tri-lateral Research Activities (Spain-France-Germany) (http://www.erapg.org/everyone/17317)

</p>  
</dl>
<center>Last modified on August 18, 2008</center>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

