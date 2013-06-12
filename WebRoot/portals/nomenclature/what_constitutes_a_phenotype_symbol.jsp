<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String pageName = "TAIR Nomenclature Resources";
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

<jsp:include page="/jsp/includes/nomenclatureSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Gene Class Symbol Registration" />
</jsp:include>
<div id="rightcolumn">

<!--CONTENT HERE-->
<span class="mainheader">What Constitutes a Gene Class Symbol</span>
 <P>
<dl>
  
    Gene class symbols have been divided into two major categories (mutant phenotype and gene product) to facilitate curation. Mutant phenotype symbols should be used when a mutant is available and the symbol describes some aspect of the phenotype. Gene product symbols should be used regardless of the availability of a mutant when the symbol describes some aspect of gene structure or function. The use of organism specific prefixes such as At or Ath is discouraged as this is redundant and leads to a lot of genes named 'Arabidopsis thaliana X'.  

   <BR><BR>

Examples of Mutant Phenotype Symbols:  
   <UL>


<li>ABA: &nbsp;  ABA Deficient</li>
   <BR>
<li>AGE:  &nbsp;  Auxin-Responsive Gene Expression</li>
    <BR>
<li>EMB:   &nbsp; Embryo Defective</li> 
     <BR>
 </UL>

Examples of Gene Product Symbols: 
    <UL>


<li>ADH:  &nbsp;  Alcohol Dehydrogenase</li> 
    <BR>
<li>AGL:  &nbsp;  AGAMOUS-Like</li>
    <BR>
<li>COR:   &nbsp; Cold Regulated</li> 

</ul>
    


 </TD> </TR>
 
</TABLE>
</dl>		    
                </div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


