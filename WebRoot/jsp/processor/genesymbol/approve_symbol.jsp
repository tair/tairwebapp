<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*,java.sql.*, org.tair.processor.genesymbol.* "
%>

<%!
String pageName = "approve symbol";
String highlight = "1";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<% CompositeGeneClassSymbol symbol = new CompositeGeneClassSymbol() ;

   if (request.getAttribute("symbol") != null ){
      symbol = (CompositeGeneClassSymbol)(request.getAttribute("symbol") );
   }

%>


<table width="100%" border="0" colspan="2" cellspacing="0" >

<TR> 
  <TH colspan=3 align=left>Gene Class Symbol Approval Page
  </TH>
</TR>

<TR><TD colspan=3>&nbsp;</TD></TR> 

<TR> 
     <Th align=center >Gene Class Symbol</TH>
     <TD colspan=2  align=left>           
         <%= EmptyTextConverter.convert( symbol.get_symbol() ) %>
     </TD>
</TR>

 <TR> 
     <Th align=center >Symbol Full Name</TH>
     <TD colspan=2  align=left>           
         <%= EmptyTextConverter.convert( symbol.get_descriptive_symbol()) %>
     </TD>
 </TR>

 <TR> 
     <Th align=center>Description</TH>
     <TD colspan=2 align=left>           
         <%-- <%= EmptyTextConverter.convert( symbol.get_description()) %> --%>
     </TD>
 </TR>

 <TR>  
     <Th align=center>Has Phenotype</TH>
     <TD colspan=2 align=left>           
          <%= EmptyTextConverter.convert( symbol.get_has_mutant_phenotype() ) %>
     </TD>
 </TR>

<%  if(symbol.get_has_mutant_phenotype() !=null &&
       symbol.get_has_mutant_phenotype().booleanValue() ) { %>
  <TR>  
     <Th align=center>Mutant Phenotype/Class </TH>
     <TD colspan=2 align=left>           
          <%= EmptyTextConverter.convert( symbol.get_mutant_phenotype_class() ) %>
     </TD>
 </TR> 
  
<% } %>

<TR>  
     <Th align=center>Comment</TH>
     <TD colspan=2  align=left>           
          <%= EmptyTextConverter.convert( symbol.get_comments() ) %>
     </TD>
</TR>

 <%  if( symbol.hasLoci()){  %>
 <TR>  
     <Th align=center valign=top >Associated Loci</TH>  
     <TD colspan=2  align=left>
  <%   GeneSymbolLocusCollection  loci = symbol.getLoci();
       for (int i = 0; i< loci.size(); i++){
         GeneSymbolLocus  locus= loci.elementAt(i);
         String locus_name= locus.get_name();
  %>
    <%= locus_name %>   Alias: <%= locus.getAliasName() %> <BR>
 <% } %>
     </TD>
 </TR>
 <% } %>  

<%  if( symbol.hasPublication()){  %>
   
     <Th align=center valign=top >Associated Publications</TH>  
     <TD colspan=2  align=left>
 <%   TairObjectPublicationCollection  pubs = symbol.getPublications();
       for (int i = 0; i< pubs.size(); i++){
           TairObjectPublication  pub = pubs.elementAt(i); 
           Long pub_id= pub.get_publication_id();
           String pub_title = pub.get_title();
          
  %>  
     <A href="/servlets/TairObject?type=publication&id=<%= pub_id %>">
    <%= pub_title %>
    </A></BR>
 <% } %>
<% } %>    

 <TR><TD colspan=3>&nbsp;</TD></TR> 

<TR> 
<form action="/servlets/processor">
<TD colspan=3>Please click "Modify Symbol" to modify the informations about this gene class symbol, Or click "Modify Loci/Publication" to modify the loci/publication information, Or click the "Approve" button to submit this gene class symbol to TAIR database
</TD>
</TR>

<input type=hidden name="type" value="genesymbol" >
<input type=hidden name="update_action" value="approve_symbol" >

<TR> 
  <TD>
    <input type="button"  value="Midify Symbol" 
     onClick="document.location.href='/jsp/processor/genesymbol/symbol_registration.jsp'"> </TD>
  <TD><input type="button"  value="Modify Loci/Publication" 
     onClick="document.location.href='/jsp/processor/genesymbol/add_loci_publication.jsp'"></TD>
  <TD><input type="submit" name="submit" value="Approve Symbol" ></TD>
</TR>

</form>       

</table>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
