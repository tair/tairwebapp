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
String pageName = "Gene Registration";
String highlight = "1";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<% CompositeGeneClassSymbol symbol = new CompositeGeneClassSymbol() ;

   if (session.getAttribute("compositeSymbol")!=null){
      symbol = (CompositeGeneClassSymbol)(session.getAttribute("compositeSymbol") );
   }

%>


<table width="100%" border="0" colspan="2" cellspacing="0" >

<TR> 
  <TH colspan=3 align=left>
    You are about to submit the following information regarding the gene class symbol <%= symbol.get_symbol() %> to TAIR database:
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
     <Th align=center>Description</TH>
     <TD colspan=2 align=left>           
          <%= EmptyTextConverter.convert( symbol.get_description()) %>
     </TD>
 </TR>

 <TR>  
     <Th align=center>Has Phenotype</TH>
     <TD colspan=2 align=left>           
          <%= EmptyTextConverter.convert( symbol.get_has_mutant_phenotype() ) %>
     </TD>
 </TR>

<%  if(symbol.get_has_mutant_phenotype().booleanValue() ) { %>
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

<TR>  
     <Th align=center>Submitter community id</TH>
     <TD colspan=2  align=left>           
          <%= EmptyTextConverter.convert( symbol.get_submitter_id() ) %>
     </TD>
</TR>

<TR><TD colspan=3>&nbsp;</TD></TR> 

<TR> 
<form action="/servlets/processor">
<TD colspan=3>Please click "Go Back" to modify the informations about this gene class symbol, Or click "Add Loci/Publication" if you know this gene class symbol is  associated to gene or locus, or you have the reference article about this gene class symbol.Or click the "Submit Symbol" button to submit this gene class symbol to TAIR database
</TD>
</TR>

<input type=hidden name="type" value="genesymbol" >
<input type=hidden name="update_action" value="submit_symbol" >

<TR> 
  <TD>
    <input type="button"  value="Go Back" 
     onClick="document.location.href='/jsp/processor/genesymbol/symbol_registration.jsp'"> </TD>
  <TD><input type="button"  value="Add Loci/Publication" 
     onClick="document.location.href='/jsp/processor/genesymbol/add_loci_publication.jsp'"></TD>
  <TD><input type="submit" name="submit" value="Submit Symbol" ></TD>
</TR>

</form>       

</table>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
