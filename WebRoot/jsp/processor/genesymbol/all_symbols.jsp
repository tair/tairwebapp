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
String pageName = "Gene Class Symbol List";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<% GeneClassSymbolCollection symbols = null;
   if (request.getAttribute("symbolList") !=null){
      symbols = (GeneClassSymbolCollection)request.getAttribute("symbolList");
   }
   String type = "";
   if (request.getAttribute("symbolType") !=null){
      type = (String)request.getAttribute("symbolType");
   }
   boolean from_user = false;
   if (request.getAttribute("from_user") !=null){
      from_user =  true;
   } 
%>

<table width="100%" border="0" colspan="2" cellspacing="0" >

  <caption >Complete List of All <%= type %> Symbols  </caption>

 <TR><TD colspan=5>&nbsp;</TD></TR>
 
 <TR <%=myBgColor.toggleBgColor() %> >
     <TH align=left >Symbol</TH>
     <TD>&nbsp;</TD> 
     <TH align=left>Symbol Full Name </TH>
     <TD>&nbsp;</TD> 
     <TH align=left>Has Mutant Phenotype </TH>
     <TD>&nbsp;</TD> 
     <TH align=left>Description </TH>
     <TD>&nbsp;</TD> 
     <TH align=left>Submitter</TH>
 </TR>
 
<%    if (!symbols.isEmpty()){
       Iterator symbolIter =  symbols.iterator();
       TfcGeneClassSymbol symbol = null;
       while (symbolIter.hasNext() ){
         symbol = (TfcGeneClassSymbol) symbolIter.next();
         
%>

<TR <%=myBgColor.toggleBgColor() %>  >
     <TD> 
    <A href="/servlets/TairObject?type=gene_class_symbol&id=<%= symbol.get_tair_object_id() %>">
        <%= symbol.get_symbol() %>
    </A>&nbsp;
   <% if(from_user){  %>    
    <A href="/servlets/processor?type=genesymbol&update_action=edit_symbol&id=<%= symbol.get_tair_object_id() %>">
        edit
    </A>
   <% }  %>    
    </TD>
    <TD>&nbsp;</TD> 
    <TD> 
    <%= EmptyTextConverter.convert(symbol.get_descriptive_symbol()) %>&nbsp;
    </TD>
    <TD>&nbsp;</TD> 
    <TD><%= TextConverter.booleanToWord(symbol.get_has_mutant_phenotype()) %></TD>
    <TD>&nbsp;</TD> 
    <TD> 
     <%= EmptyTextConverter.convert(symbol.get_description()) %>&nbsp;
    </TD>
    <TD>&nbsp;</TD> 
    <TD> <A href="/servlets/TairObject?type=person&id=<%= symbol.get_submitter_id() %>" >
        <%= EmptyTextConverter.convert(symbol.get_submitter_name()) %> </A>&nbsp;</TD>
   
     
</TR>
 
 
<% }} %>
</TABLE>
 
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
