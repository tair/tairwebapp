<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
  String pageName = "TAIR -Clones/Radish ESTs";
  String cssfile = "/css/page/pagelevels.css";
%>

<%@ page errorPage="/jsp/common/gen_error.jsp"
	import="org.tair.tfc.*,org.tair.querytools.*,org.tair.utilities.*,java.util.*,java.net.*"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="cssfile" value="<%=cssfile %>" />
	<jsp:param name="id" value="1115" />
</jsp:include>

<jsp:include page="/jsp/includes/clonesSidebar.jsp" flush="true">
	<jsp:param name="sidebarName" value="Radish Expressed Sequence Tags" />
</jsp:include>

<div id="rightcolumn">


	<!-- CONTENT IN HERE -->

	<p>
		<span class="header">Radish Expressed Sequence Tags</span>
	</p>
<p>The ABRC distributes Expressed Sequence Tagged (EST) clones generated by Shinhan Shiu at Michigan State University (MSU) for which sequences have been submitted to NCBI (National Center for Biotechnology Information).
</p>
<p>
<h4>Tips for searching</h4>
ESTs for a particular species can be found using the DNA search. Select search for clone under output options and select the species of interest from the drop down menu. Restrict your search by clone end type=EST.
</p>
<p>
<h4>Finding ESTs using the Genome Browser (G-Browse)</h4>
Radish ESTs are displayed in the Radish clones track under Sequence Similarity in G-Click on the name .
</p>
<p>
Radish ESTs are available from the following libraries:<br/>
<br/>
RR1: Raphanus raphanistrum, maritimus (23,843 clones)<br/>
RR2: Raphanus raphanistrum, raphanistrum (23,366 clones)<br/>
RR3: Raphanus raphanistrum, raphanistrum (23,656 clones)<br/>
RR4: Raphanus raphanistrum, landra (23,795 clones)<br/>
RS1: Raphanus sativus, oleiformis (23,244 clones)<br/>
RS2: Raphanus sativus, early scarlet globe (23,161 clones)<br/>
RS3: Raphanus sativus, rat tail radish (23,512 clones)<br/>
</p>
<p>
All clones are in the pDNR-LIB vector which confers chloramphenicol resistance and are distributed in E. coli host strain GC10.
</p>
</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

