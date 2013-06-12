<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*,java.sql.*, org.tair.processor.genesymbol.*, java.text.*"
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

   boolean from_user = false ;
   boolean from_curator = false;

   if (request.getAttribute("from_who") != null){
      String from =  (String) request.getAttribute("from_who");
      if( from.equals("curator") ){
         from_curator =  true;
      }else if ( from.equals("user")){
         from_user = true ; 
      }
   }
   
   SimpleDateFormat formatter
         = new SimpleDateFormat ("MMM. d, yyyy");
   
%>

<table width="100%" border="0" colspan="2" cellspacing="0" >
  <% if (from_curator){  %>
  <caption >Complete List of Symbols to be Reviewed (Total:<%= symbols.size() %>, <%=  formatter.format(new java.util.Date()) %>) </caption>
  <% }else if (from_user){   %>
 <caption >Complete List of Symbols Submitted (Total:<%= symbols.size() %>, <%=  formatter.format(new java.util.Date())%>)  </caption>
  <%} else { %>
  <caption >Complete List of All <%= type %> Symbols (Total: <%= symbols.size() %>, <%=  formatter.format(new java.util.Date())%> ) </caption>
  <% } %> 

 <TR><TD colspan=5>&nbsp;</TD></TR>
 
 <TR <%=myBgColor.toggleBgColor() %> >
     <TH align=left valign=top>Symbol</TH>
     <TD>&nbsp;</TD> 
     <TH align=left valign=top>Symbol Full Name </TH>
     <TD>&nbsp;</TD>
     <% if (type.equals("") ){ %>
     <TH align=left valign=top>Type </TH>
     <TD>&nbsp;</TD>
     <% }  %>
     <TH align=left valign=top>Status </TH>
     <TD>&nbsp;</TD> 
     <TH align=left valign=top>Reference</TH>
     <TD>&nbsp;</TD> 
     <TH align=left valign=top>Contact</TH>
     <TD>&nbsp;</TD>
     <TH align=left valign=top>Submitted</TH> 
 </TR>
<TR><TD colspan=5>&nbsp;</TD></TR> 
<%    if (!symbols.isEmpty()){
       Iterator symbolIter =  symbols.iterator();
       TfcGeneClassSymbol symbol = null;
       while (symbolIter.hasNext() ){
         symbol = (TfcGeneClassSymbol) symbolIter.next();
         
%>

<TR <%=myBgColor.toggleBgColor() %>  >
     <TD valign=top>
    <% if (from_curator){ %>
    <A href="/servlets/processor?type=genesymbol&update_action=curator_approve&id=<%= symbol.get_tair_object_id() %>">
    <% }else{  %> 
    <A href="/servlets/TairObject?type=gene_class_symbol&id=<%= symbol.get_tair_object_id() %>">
    <% }  %> 
      <%= symbol.get_symbol() %>
      </A>&nbsp;
   <% if ( from_user == true ){
       //&&
        //  symbol.get_status()!= null  &&
        // ( symbol.get_status().equals("pending") || symbol.get_status().equals("await_approval") )){
   %>    
    <A href="/servlets/processor?type=genesymbol&update_action=edit_symbol&id=<%= symbol.get_tair_object_id() %>">
        edit
    </A>
   <%  }   %>    
    </TD>
    <TD>&nbsp;</TD> 
    <TD valign=top> 
    <%= EmptyTextConverter.convert(symbol.get_descriptive_symbol()) %>&nbsp;
    </TD>
    <TD>&nbsp;</TD>
   <% if (type.equals("") ){  %>
     <TD valign=top><%= symbol.get_has_mutant_phenotype().booleanValue() ? "P":"G"  %></TD>
    <TD>&nbsp;</TD>
   <% } %>
     <TD valign=top><%= symbol.get_status().equals("approved") ? "OK":"Pending"  %></TD>
    <TD>&nbsp;</TD>   
    <TD valign=top>
     <%  if(symbol.get_submitter_info()!=null ){  %> 
     <%= TextConverter.dbToHTML(symbol.get_submitter_info()) %>
     <% }  %> 
      &nbsp;
    </TD>
    <TD>&nbsp;</TD>
    <TD valign=top> <A href="/servlets/TairObject?type=person&id=<%= symbol.get_submitter_id() %>" >
        <%= EmptyTextConverter.convert(symbol.get_submitter_name()) %> </A>&nbsp;
    </TD>
    <TD>&nbsp;</TD>	
    <TD valign=top nowrap> 
    <%=  symbol.get_reservation_date()  %>&nbsp; 
    </TD>
 </TR>
 
 
<% }} %>
</TABLE>
 
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
