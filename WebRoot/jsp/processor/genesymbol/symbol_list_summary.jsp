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
<%
   String type =  "";
   if ( request.getAttribute ("symbolType") != null ){
       type  =  (String) ( request.getAttribute ("symbolType")); 
   }
   String display_type = "";
   if (type.equals("structure")){ display_type = "Gene Product"; }
   if(type.equals("mutant")){ display_type = "Mutant Phenotype"; }

   boolean from_curator = false;

   if (request.getAttribute("from_who") != null){
      String from =  (String) request.getAttribute("from_who");
      if( from.equals("curator") ){
         from_curator =  true;
      }
   }

%>

<table width="100%" border="0" colspan="2" cellspacing="0" >
<h3>Complete List of All <%=  display_type  %> Symbols </h3>
<h4>Click on a letter below to browse symbols start with that letter.</h4>
<%-- The ABCDEF...Z header --%>
<center>
 <%
    StringBuffer link =
       new StringBuffer("/servlets/processor?type=genesymbol&update_action=view_symbol&symbol_type="+type );
    if (from_curator){
       link.append ( "&from=curator&status=all");
    }
    String linkhref = link.toString();
 %> 
     <a href="<%= linkhref %>&startwith=all">All</a> &nbsp;  
<% for(char ch = 'A'; ch <= 'Z'; ch++) {  %>
     <a href="<%= linkhref %>&startwith=<%= ch %>"><%= ch %></a>
<% } %>
</center>

<% GeneClassSymbolCollection symbols = null;
   if (request.getAttribute("symbolList") != null){
      symbols = (GeneClassSymbolCollection)request.getAttribute("symbolList");
   }
   
   SimpleDateFormat formatter
         = new SimpleDateFormat ("MMM. d, yyyy");
 %>
  
 <TR><TD colspan=<%= (type.equals("all"))?13:11 %>>&nbsp;</TD></TR>
 <TR><TD colspan=<%= (type.equals("all"))?13:11 %>><HR></TD></TR>
 
 <TR><TD colspan=<%= (type.equals("all"))?13:11 %>> Total:<%= symbols.size() %>, <%=  formatter.format(new java.util.Date()) %> </TD></TR>
 <TR <%=myBgColor.toggleBgColor() %> >
     <TH align=left valign=top>Symbol</TH>
     <TD>&nbsp;</TD> 
     <TH align=left valign=top>Symbol Full Name </TH>
     <TD>&nbsp;</TD>
   <% if (type.equals("all")){  %>  
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
<%     Iterator symbolIter =  symbols.iterator();
       TfcGeneClassSymbol symbol = null;
       while (symbolIter.hasNext() ){
         symbol = (TfcGeneClassSymbol) symbolIter.next();
    
         ArrayList submitterNames = symbol.get_all_submitter_names();
         ArrayList submitterIDs = symbol.get_all_submitter_ids();

%>

<TR <%=myBgColor.toggleBgColor() %>  >
    <TD valign=top>
  <% if(from_curator){  %>
     <A href="/servlets/processor?type=genesymbol&update_action=curator_approve&id=<%= symbol.get_tair_object_id() %>">
  <% }else { %> 
      <A href="/servlets/TairObject?type=gene_class_symbol&id=<%= symbol.get_tair_object_id() %>">
  <% } %>    
      <%= symbol.get_symbol() %> </A>       
    </TD>
    <TD>&nbsp;</TD> 
    <TD valign=top> 
    <%= EmptyTextConverter.convert(symbol.get_descriptive_symbol()) %>&nbsp;
    </TD>
    <TD>&nbsp;</TD>
    <% if (type.equals("all")){  %>  
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
    <TD valign = top>
    <%
        for (int i=0; i<submitterNames.size(); i++){
            String name = "";
            Long id = null;
            if (submitterNames.get(i) != null){
                name = submitterNames.get(i).toString();
                id = Long.valueOf(submitterIDs.get(i).toString());
            }
    %>
    <A href="/servlets/TairObject?type=person&id=<%= id %>" >
        <%= EmptyTextConverter.convert(name) %> </A> <BR>  
    <%
        }
    %>
   </TD>

    <TD>&nbsp;</TD>	
    <TD valign=top nowrap> 
    <%=  symbol.get_reservation_date()  %>&nbsp; 
    </TD>
 </TR>
 
<% } %>

</TABLE>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
