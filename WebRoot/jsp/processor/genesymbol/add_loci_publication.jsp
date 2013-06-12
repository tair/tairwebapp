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
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<% CompositeGeneClassSymbol symbol = new CompositeGeneClassSymbol() ;

   if (request.getAttribute("symbol")!=null){
      symbol = (CompositeGeneClassSymbol)(request.getAttribute("symbol") );
   }
%>

<table width="100%" border="0" colspan="2" cellspacing="0" > 
 <% //myBgColor.toggleBgColor(); %> 
  <TR <%= myBgColor.sameBgColor() %> >
    <TD colspan=2 valign=top><B>Associated Loci and Publications </B><BR><BR>
     On this page you can associate your proposed gene class symbol with
     loci and publications. When you are done, click the "Submit" button on the bottom of this page.
     </TD> 
  </TR>
   
  <TR <%= myBgColor.sameBgColor() %> > <TD colspan=2> &nbsp;</TD>
  </TR>
 
  <% myBgColor.toggleBgColor(); %>
  
  <TR <%= myBgColor.sameBgColor() %>>
     <TD colspan=2><B> AGI Loci to Associate</B></TD>
  </TR>
  
   
 <%   if( symbol.hasLoci()){    %> 
 
 <form action="/servlets/processor" method=post>
  <input type=hidden name="type" value="genesymbol" >
  <input type=hidden name="update_action" value="remove_loci">

 <TR <%= myBgColor.sameBgColor() %> > <TD colspan=2>
    Your gene class symbol is associated to the following loci. Add more
   loci using the "Add Loci" button. If you want to remove any associated
   loci, check the box and click on the "Remove" button.
   
   </TD>
  </TR>

 <TR <%= myBgColor.sameBgColor() %>  >
 <%   GeneSymbolLocusCollection  loci = symbol.getLoci();
      for (int i = 0; i< loci.size(); i++){
         GeneSymbolLocus  locus= loci.elementAt(i);
         String locus_name= locus.get_name();
         String remove_name= "remove_locus_"+locus_name;
         Long locus_id = locus.get_locus_id();
 %>
    
  <TD> <%= locus_name %>
    &nbsp; <%= EmptyTextConverter.convert (locus.getAliasName()).equals("") ? "" : "Alias: "+ locus.getAliasName() %> </TD> 
  <TD><input type=checkbox  name="<%= remove_name %>" value= "<%= locus_id  %>"> </TD>
 
 </TR>
 
 <% } %>
 <TR <%= myBgColor.sameBgColor() %>  ><TD>&nbsp;</TD>
     <TD><input type=submit name="remove" value ="Remove"> </TD>
 </TR>
 </form>

 <% } %>

 <TR <%= myBgColor.sameBgColor() %>  >
  <form action="/servlets/processor">
  <input type=hidden name="type" value="genesymbol" >
  <input type=hidden name="update_action" value="search">
  <input type=hidden name="search_type" value="locus">
  <TD colspan=2>
    Associate AGI locus codes (e.g. AT1G01010) to your gene class symbol
using this box. You may associate multiple loci by separating the
individual loci with a semicolon (;).
   
   <BR> <input name = "locus_name" size="30" >  <input type=submit  name="sumbit" value ="Add Loci"> 
  </TD>
  </form>
 </TR>
 </form>

 <TR <%= myBgColor.sameBgColor() %> ><TD colspan=2>&nbsp;</TD></TR>
 
 <% myBgColor.toggleBgColor(); %> 

 <TR <%= myBgColor.sameBgColor() %> > <TD colspan=2 valign=top><B> Publications to Associate</B>  </TD></TR>
 
   

 <!-- publication -->

 <%   if( symbol.hasPublication()){    %> 
  <form action="/servlets/processor">
  <input type=hidden name="type" value="genesymbol" >
  <input type=hidden name="update_action" value="remove_pubs"> 
  <TR <%= myBgColor.sameBgColor() %> >
     <TD colspan=2>
      This gene class symbol is associated to the following
      publications. If you want to remove any associated publications, check
      the box and click the "Remove" button.
     </TD>
  </TR>
     

  
 <%   TairObjectPublicationCollection  pubs = symbol.getPublications();
      for (int i = 0; i<pubs.size(); i++){
         TairObjectPublication  pub = pubs.elementAt(i);
         Long ref_id= pub.get_reference_id();
         String remove_name= "remove_pub_"+ref_id;
         String pub_title = pub.get_title();
 %>
 <TR <%= myBgColor.sameBgColor() %> >   
  <TD> <A href="/servlets/TairObject?type=publication&id=<%= pub.get_publication_id() %>"><%= pub_title %></A></TD>
  <TD><input type=checkbox  name="<%= remove_name %>" value= "<%= ref_id  %>"> </TD>
 </TR>
 <% }  %>
  
 <TR <%= myBgColor.sameBgColor() %> ><TD>&nbsp;</TD>
     <TD><input type=submit name="remove" value ="Remove"> </TD>
 </TR>

 <% } %>

 <TR <%= myBgColor.sameBgColor() %> > <TD colspan=2 valign=top> <A href="/servlets/Search?type=publication&search_action=new_search&mode=gene_symbol"> Search Publication </A> 
       <BR>
       Click on the link above to find papers to associate to your
       gene class symbol.
       </TD>
  </TR>
 
 </form>       

  <form action="/servlets/processor">
  <TR <%= myBgColor.toggleBgColor() %>>
   <TD colspan=2 align=center>
   <input type="submit" name="Submit" value="Submit">
   <input type=hidden name="type" value="genesymbol" >
   <input type=hidden name="update_action" value="confirm_all">
 </form>
   
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
