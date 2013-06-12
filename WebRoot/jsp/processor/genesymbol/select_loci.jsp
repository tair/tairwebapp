<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->

<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*,java.sql.*,  org.tair.processor.genesymbol.* "
%>

<%!
String pageName = "Loci select";
%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />
<center>
<table width="80%" border="0" colspan="2" cellspacing="0" >
<form action="/servlets/processor">

<%
  String symbol = "";
  if (request.getAttribute("symbol_name") != null){
      symbol= (String) request.getAttribute("symbol_name") ;
  }
  
  String search_term = "";
  if (request.getAttribute("search_term" )!=null){
     search_term =(String)request.getAttribute("search_term" );
  }
  
  HashMap results = new HashMap();
  if (request.getAttribute("searchResult" )!=null){
     results =(HashMap)request.getAttribute("searchResult" );
  }
  
  if (results == null || (! results.containsKey("locus")) ){ 
%>

 <TR> <TD colspan=2>The locus names you entered:<BR>
    <%= search_term %><BR>
    were not found in the TAIR database. Please go back to modify your entry,
    or click <A href="/servlets/Search?action=new_search&type=gene" target="_blank">
    Here</A> for an advanced search.
    If you feel you have encountered an error in the database,
    please contact our <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curators</A>

    </TD>
 </TR>

<%  }else{  %>

<TR  <%=myBgColor.toggleBgColor()%> >
    <TD> &nbsp; </TD>   
    <TD colspan=2 > 
      <input type="reset" name="reset" value="reset">
    </TD >
    <TD> &nbsp; </TD>    
    <TD colspan=2 >  
     <input type="submit" name="submit" value="associate">
    </TD> 
     <input type="hidden"  name="type" value="genesymbol" >
     <input type=hidden name="update_action" value="associate_loci"> 
   </TD>
</TR>

<TR <%=myBgColor.toggleBgColor()%> > <TD colspan=6> 
   The locus name you entered matches the following locus in the TAIR database. 
   Please uncheck/check the box below to select the associated locus
   and add the number suffix of the gene symbol (e.g. enter 2000 for EMB2000).
   Then click "associate" when you are done.
</TD> </TR>

<TR  <%=myBgColor.toggleBgColor()%> >
    <TD> &nbsp; </TD> 
    <TD>Locus Name </TD>  
    <TD> &nbsp; </TD> 
    <TD>Representative Gene Model</TD>  
    <TD> &nbsp; </TD> 
    <TD>Add Number Suffix</TD>  
</TR>

<%
    ArrayList loci = (ArrayList)results.get("locus");
    for (int i=0 ; i< loci.size() ; i++){ 
       GeneSymbolLocus locus =(GeneSymbolLocus)(loci.get(i));
       String name = "add_locus_"+locus.get_locus_id();
       String alias_name = "add_alias_"+locus.get_locus_id();
%>

<TR  <%=myBgColor.toggleBgColor()%> > 
   <TD><input type="checkbox" name="<%= name %>"
         value = "<%= locus.get_locus_id() %>" 
        checked> 
    </TD>
    <TD> 
    <A href="/servlets/TairObject?accession=locus:<%= locus.get_tair_object_id() %>">
      <%= locus.get_original_name() %>
    </A>
    </TD>
     <TD> &nbsp; </TD>
     <TD> <A href="/servlets/TairObject?type=gene&id=<%= locus.get_representative_gene_id() %>">
         <%= locus.get_representative_gene_name() %></A>
     </TD>
     <TD> &nbsp; </TD>
     <TD><%= symbol %><input type=text name=<%= alias_name %> size=5> </TD>   
</TR>

<%  }}%>
   
</FORM>	

</TABLE>
</center>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


