<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - Mutant/Mapping Resources";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="116" />
</jsp:include>

<jsp:include page="/jsp/includes/forwardSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="" />  
</jsp:include>


<div id="rightcolumn">

                <span class= "mainheader">Mutant and Mapping Resources</span>
                     <dl>
                     <dt><a href = "stockcenters.jsp">Stock Centers</a></dt>
                     <dd>This section provides links to many of the stock centers all over the world that provide seed resources and related data.</dd>
                     <dt><a href = "worldwide.jsp">Worldwide Resources</a></dt>
                     <dd>This gives an overview of many forward and reverse genetics projects and resources and provides links to project websites and more detailed information about the lines generated. </dd>
                     <dt><a href = "findmutants.jsp">Find Mutants</a></dt>
                     <dd>This section lists a series of links to websites that allow you to 
			<UL>
			<LI>search for and order seed stocks </LI>
			<LI>view the insertion sites of various T-DNA and transposon lines mapped onto the Arabidopsis genome</LI>
			<LI>use BLAST to locate insertions in your gene/sequence of interest or </LI> 
			<LI>place orders for point mutations.</LI> 
			</UL>
A table summarizing which mapped mutations can be visualized using which genome browser is also provided.
		    </dd>
                     <dt><a href = "analyze.jsp">Analyze Mutants</a></dt>
                     <dd>This section provides links to resources useful for map-based cloning, PCR or sequencing primer design and flanking sequence recovery protocols.</dd>

      		    </dl>


</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


