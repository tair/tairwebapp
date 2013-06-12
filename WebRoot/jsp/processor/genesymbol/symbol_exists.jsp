<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*,java.sql.* "
%>

<%!
String pageName = "Gene Registration Failed";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />


<table width="100%" border="0" colspan="2" cellspacing="0" >

 <TR>
   <td colspan=4>
   <b><font size="+1"> </font></b>
   <br>
   </TD>
 </TR>

 <TR><TD colspan=4>&nbsp;</TD></TR>

 <% HashMap results =(HashMap)request.getAttribute("searchResult" );   
   if (results != null && results.containsKey("symbol") ){
 %>
 <TR bgcolor=#F1EFEC >
     <TD colspan=4>
       The proposed gene class symbol already exists in the TAIR database:
    </TD>
 </TR>
 
 <TR><TD colspan=4>&nbsp;</TD></TR>

 <TR>
   <TD>
     <table border=0 cellspacing="0"  width="100%">
     <TR>
     <TH align=left >Symbol</TH>
     <TH>&nbsp;</TH> 
     <TH align=left>Symbol Full Name </TH>
     <TH>&nbsp;</TH>
     <TH align=left>Symbol Type </TH>
     <TH>&nbsp;</TH> 
     <TH align=left>Submitted By</TH>
     </TR>
     
 <%     ArrayList symbols = (ArrayList)(results.get("symbol"));
      for (int i = 0; i < symbols.size(); i++){
         TfcGeneClassSymbol symbol = (TfcGeneClassSymbol)(symbols.get(i));
%>
         
  <TR <%= myBgColor.toggleBgColor() %> >
    <TD align=left valign=top>   
    <A href="/servlets/TairObject?type=gene_class_symbol&id=<%= symbol.get_tair_object_id() %>">
     <%= symbol.get_symbol() %>
    </A>
    </TD>
    <TD>&nbsp;</TD>
    <TD align=left valign=top>  <%= EmptyTextConverter.convert(symbol.get_descriptive_symbol()) %>
    </TD>
    <TD>&nbsp;</TD>
 <% String symbol_type= symbol.get_has_mutant_phenotype().booleanValue()? "Mutant Phenotype":"Gene Product"; %>       <TD align=left valign=top>  <%= EmptyTextConverter.convert(symbol_type) %>
    </TD>
    <TD>&nbsp;</TD>
    <TD> <%= EmptyTextConverter.convert(symbol.get_submitter_name()) %>&nbsp;</TD>
  </TR>

<% } %>
 </TD></table></TR>
<% } %>


 <%  if (results != null && results.containsKey("gene") ){  %>
 <TR> <TD colspan=4> &nbsp;</TD></TR>
 <TR bgcolor=#F1EFEC >
     <TD colspan=4>
       The Gene Class Symbol conflicts with an existing Gene or Gene alias name in the TAIR database:
    </TD>
 </TR>
 <TR> <TD colspan=4> &nbsp;</TD></TR>
 <TR>
   <TD>
     <table border=0 cellspacing=0  width="100%">
     <TR>
     <TH align=left >Gene Name</TH>
     <TH>&nbsp;</TH> 
     <TH align=left>Alias/Symbol </TH>
     <TH>&nbsp;</TH> 
     <TH align=left>Description </TH>
     </TR>
     
 
<%   ArrayList genes = (ArrayList)(results.get("gene"));
     for (int i = 0; i < genes.size(); i++){
         GeneModel gene = (GeneModel)(genes.get(i));
%>
<TR <%= myBgColor.toggleBgColor() %>><TD valign=top > 
    <A href="/servlets/TairObject?type=gene&id=<%= gene.get_gene_id() %>">
     <%= gene.get_name() %>
    </A>
    </TD>
    <TD> &nbsp;</TD>
    <TD valign=top ><%= EmptyTextConverter.convert( gene.get_gene_alias_symbol_string()) %></TD>
    <TD> &nbsp;</TD>
    <TD valign=top> 
      <%= EmptyTextConverter.convert(gene.get_description()) %> &nbsp;
    </TD> 
</TR>

<% } %>
</TD></table></TR>

<% } %>





<TR><TD colspan=4>&nbsp;</TD></TR>
  
<TR> <td colspan=4>
  Please click<A href="/servlets/processor?type=genesymbol"> here </A> to submit another gene class symbol. If you wish to submit this symbol despite the conflict, contact a <a href="mailto:curator@arabidopsis.org"> TAIR curator</A>.
       
</TR>

</FORM>	
</TABLE>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


