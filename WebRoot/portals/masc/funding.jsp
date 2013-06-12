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
<jsp:param name="id" value="1156" />
</jsp:include>

<jsp:include page="/jsp/includes/mascSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Funding and Educational Opportunities" />
</jsp:include>
<div id="rightcolumn">
<p>
  <!--CONTENT HERE//-->
  <span class="mainheader">Funding and Educational Opportunities</span></p>

<p><b>Funding Opportunities for US Scientists to attend the <a href="http://www.icar2012.org/"><u>23rd International Conference on Arabidopsis Research</u></b></a>

 <p> <b> The Arabidopsis Conference will be held at the Hofburg Palace in Vienna, Austria</b>
 <p>
 <li> Date: July 3-7, 2012
 <li> Funding opportunities: (1) Travel Awards For up to 11 Early Career U.S. Scientists (postdoctoral scholars, graduate students and first position faculty within 2 years of first faculty appointment). <p>
 (2) Full conference funding for up to 7 plant biologists from U.S. institutions that are members of under-represented minority groups and/or faculty from federally-designated U.S. Minority-Serving Institutions,
 Historically Black Colleges and Universities, and 1890 Institutions. <p>
 <b> Application deadline for all applications: March 31, 2012
 <p><b>See application form for citizenship requirements</b>
 <p> Download application forms:</b>

 <li><A href="/portals/masc/23rd_ICAR_MinorityFunds.doc"><u>Minority Funding Opportunities</u></a><p>
 <i> Under-represented minorities, in advanced fields of math and science, include: African Americans, Blacks, Hispanics or Latinos (of South American descent), Native Americans/American Indians
 or Alaska Natives, Native Hawaiians or other Pacific Islanders and Asian subpopulations (any Asians other than Chinese, Filipino, Japanese, Korean, Asian Indian,
 Taiwanese, or Thai)</i><p>
 
 <li><A href="/portals/masc/23rd_ICAR_TravelSupplement.doc"><u>Early Career Scientist Travel Funding Opportunities</u> </a><p>

<hr>

<center>
  Last modified on January 3, 2012
</center>
</div><!--end rightcolumn-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


