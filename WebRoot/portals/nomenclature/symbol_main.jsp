<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String pageName = "TAIR Nomenclature Resources";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="1172" />
</jsp:include>

<jsp:include page="/jsp/includes/nomenclatureSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Gene Class Symbol Registration" />
</jsp:include>
<div id="rightcolumn">

<!--CONTENT HERE-->
<span class="mainheader"> Gene Class Symbol Registration</span>
 <P>
<dl>
<dt>
<dd>
      Please use this page to register a Gene Class Symbol (Example: ABC).
<P>
In order to register a Gene Class Symbol,<b> you must be registered at TAIR</b>. To register, please visit <a href="/servlets/Community?action=login">this page</a>.

<p>These symbols typically consist of 3 or 4 letters that define either a single gene (ABC) or a gene 
family (ABC1, ABC2, ABC3). Although a number of classical genetic loci were assigned 2-letter symbols 
years ago, the continued use of 2-letter symbols to name new loci is strongly discouraged except in 
cases where there is a compelling reason based on the underlying science. A similar justification should 
be provided for the use of gene class symbols with more than 4 letters. Symbols may describe a mutant 
phenotype or some aspect of gene structure or function.</p>

<p>Please use <font style="color: red">ALL UPPERCASE letters</font> for the Mutant Symbols (ex: EMBRYONIC LETHAL) and 
<font style="color:red">all lowercase letters</font> for Gene Product Symbols (except when referring to domains or other 
symbols; examples: chloroplast J-like domain; TON1 recruiting motif)</font>

<p>This registration process is designed to minimize accidental duplications in gene nomenclature by 
comparing the symbol being registered with both the Registered Symbol list below and searching TAIR 
to see if the symbol is unregistered but already published. If the symbol is either registered or 
published the registration will not be accepted.</p>

<p><a href="/servlets/processor?type=genesymbol">Click Here to Register a Gene Class Symbol</a></p>  

<P>
    
       View Current List of Registered Symbols:<BR> <UL>

      <li><A href="/servlets/processor?type=genesymbol&update_action=view_symbol">
	  All Registered Symbols</A><BR></li>

      <li><A href="/servlets/processor?type=genesymbol&update_action=view_symbol&symbol_type=mutant">Mutant Phenotype Symbols</A><BR></li> 

      <li><A href="/servlets/processor?type=genesymbol&update_action=view_symbol&symbol_type=structure">Gene Product Symbols</A><BR></li>
      </UL>  

       <BR>
      <A href="/portals/nomenclature/what_constitutes_a_phenotype_symbol.jsp"> What Constitutes a Gene Class Symbol?</A><BR> 
      

<P>
      Email Comments to Curator:  <BR>

      Mutant Phenotype Symbols (<a href="mailto:meinke@okstate.edu,curator@arabidopsis.org">David Meinke and TAIR curator</A>)<BR>

      Gene Product Symbols (<a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">TAIR Curator</A>) 
</dd>
</dl>		    
<center>Last modified on September 1, 2006</center>
                </div> <!--right column-->

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>


