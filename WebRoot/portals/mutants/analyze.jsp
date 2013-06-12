<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "Mutant/Mapping Resources: Analyze Mutants";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1163" />
</jsp:include>

<jsp:include page="/jsp/includes/forwardSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Analyze Mutants" />  
</jsp:include>


<div id="rightcolumn">

                <span class= "mainheader">Analyze Mutants</span>
		   <dl> 
                     <dd>This section provides links to resources useful for map-based cloning, PCR or sequencing primer design and flanking sequence recovery protocols.</dd>

                     <dt><a href = "mapping.jsp">Map-based Cloning</a></dt>
                     <dd>Resources for finding genetic markers, polymorphisms, mapping stocks and mapping and plant growth protocols.</dd>
                     <dt><a href = "identification.jsp">Mutant Identification/Confirmation</a></dt>
                     <dd>Links to online software that can help you design primers for sequencing or PCR and to protocols that can be used to recover the sequence flanking the insertion site and help you identify the mutated gene.</dd>

      		    </dl>


</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


