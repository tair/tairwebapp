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
String pageName = "Gene Registration confirm";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<% CompositeGeneClassSymbol symbol = new CompositeGeneClassSymbol() ;

   if (request.getAttribute("symbol") != null){
      symbol = (CompositeGeneClassSymbol)(request.getAttribute("symbol") );
   }

   boolean fromCurator = false;

   if (  request.getAttribute("from_who") != null  && 
        ( ((String)(request.getAttribute("from_who"))).equals("curator") ) ){
        fromCurator = true ;
   }
   
%>


<table width="100%" border="0" colspan="2" cellspacing="0" >

<TR <%= myBgColor.toggleBgColor() %> > 
  <TH colspan=3 align=left>
   <% if ( fromCurator ){ %>
    Please review the information about <%= symbol.get_symbol() %>,
    your decision about this symbol will be sent to submitter by email.
   <% }else{ %> 
    Please review :
   <% } %>  
  </TH>
</TR>

<TR><TD colspan=3>&nbsp;</TD></TR> 

<TR <%= myBgColor.toggleBgColor() %>> 
     <Th align=left >Gene Class Symbol</TH>
     <TD colspan=2  align=left>           
         <%= EmptyTextConverter.convert( symbol.get_symbol() ) %>
     </TD>
</TR>

 <TR <%= myBgColor.toggleBgColor() %>> 
     <Th align=left >Symbol Full Name</TH>
     <TD colspan=2  align=left>           
         <%= EmptyTextConverter.convert( symbol.get_descriptive_symbol()) %>
     </TD>
 </TR>


 <% if( ! TextConverter.isEmpty(symbol.get_description() )){ %>  
 <TR <%= myBgColor.toggleBgColor() %>> 
     <Th align=left valign=top >Description</TH>
     <TD colspan=2 align=left>           
         <%= TextConverter.dbToHTML( symbol.get_description() ) %> &nbsp;
     </TD>
 </TR>
 <% }  %>

 <TR <%= myBgColor.toggleBgColor() %>>  
     <Th align=left>Symbol Type</TH>
     <TD colspan=2 align=left>           
          <%= symbol.get_has_mutant_phenotype().booleanValue() ? "Mutant Phenotype":"Gene Product"  %>
     </TD>
 </TR>

<%  if(symbol.get_has_mutant_phenotype() != null &&
       symbol.get_has_mutant_phenotype().booleanValue()  &&
       symbol.get_mutant_phenotype_class() != null ) { %>
 
  <TR <%= myBgColor.toggleBgColor() %>>  
     <Th align=left valign=top>Phenotype Class </TH>
     <TD colspan=2 align=left>           
          <%= TextConverter.dbToHTML( symbol.get_mutant_phenotype_class() ) %>
     </TD>
 </TR> 
  
<% } %>



<% if (symbol.get_associated_loci_count() != null){   %>
<TR <%= myBgColor.toggleBgColor() %>>  
     <Th align=left>Associated Loci Count</TH>
     <TD colspan=2  align=left>           
          <%= TextConverter.SymbolLociCountToHTML( symbol.get_associated_loci_count() ) %>
     </TD>
</TR>
<% }  %>


<%  if( symbol.hasLoci()){  %>

<TR <%= myBgColor.toggleBgColor() %>>  
     <Th align=left valign=top >Associated Loci</TH>  
     <TD colspan=2  align=left>
  <%   GeneSymbolLocusCollection  loci = symbol.getLoci();
       for (int i = 0; i< loci.size(); i++){
         GeneSymbolLocus  locus= loci.elementAt(i);
         String locus_name= locus.get_name();
  %>
    <%= locus_name %>   <%= EmptyTextConverter.convert(locus.getAliasName()).equals("")? "": "Alias: "+locus.getAliasName() %> <BR>
 <% } %>
     </TD>
 </TR>
 <% } %>  

<%  if( symbol.hasPublication()){  %>
 <TR <%= myBgColor.toggleBgColor() %>>     
     <Th align=left valign=top >Associated Publications</TH>  
     <TD colspan=2  align=left>
 <%   TairObjectPublicationCollection  pubs = symbol.getPublications();
       for (int i = 0; i< pubs.size(); i++){
           TairObjectPublication  pub = pubs.elementAt(i); 
           Long ref_id= pub.get_reference_id();
           String pub_title = pub.get_title();
          
  %>  
     <A href="/servlets/TairObject?type=publication&id=<%= ref_id %>">
    <%= pub_title %>
    </A></BR>
 <% } %>
 </TR>      
<% } %>


<% if ( fromCurator  &&
        symbol.get_submitter_info() != null ){ %>
<TR <%= myBgColor.toggleBgColor() %>>  
     <Th align=left valign=top>Submitter</TH>
     <TD colspan=2  align=left>           
          <%= EmptyTextConverter.convert( symbol.get_submitter_info() ) %>
     </TD>
</TR>

<% } %>

 

 <% if (symbol.getAssociatedOrgName() != null){ %> 
 <TR <%= myBgColor.toggleBgColor() %>>  
     <Th align=left valign=top>Submitter Associated Organization</TH>
     <TD colspan=2  align=left>           
          <%= EmptyTextConverter.convert( symbol.getAssociatedOrgName() ) %>
     </TD>
</TR>

<% } %>

<%  if( ! TextConverter.isEmpty( symbol.get_comments() )){ %> 
<TR <%= myBgColor.toggleBgColor() %>>  
     <Th align=left valign=top>Comment</TH>
     <TD colspan=2  align=left>           
          <%= TextConverter.dbToHTML(symbol.get_comments() ) %>&nbsp;
     </TD>
</TR>
<% } %>

<form action="/servlets/processor" method=post>
 
<% if ( fromCurator ){ %>
  <input type=hidden name="update_action" value="approve_symbol" >
  <TR <%= myBgColor.toggleBgColor() %>>
    <Th valign=top align=left>Approval Action</TH>
    <TD colspan=2  align=left>
       <input type=radio name="approval_or_not" value="approved"> Approve <BR>
       <input type=radio name="approval_or_not" value="pending"> Pending<BR>
       <input type=radio name="approval_or_not" value="obsolete"> Obsolete<BR>
       please put comment in the following input box if you choose "pending" or "obsolete"<BR>
    </TD>
   </TR>

  <TR <%= myBgColor.toggleBgColor() %>>
    <Th align=left valign=top>Curator's Comment  </TH>
    <TD colspan=2 align=left>
       <textarea col=150  rows=4  wrap=soft name="reason"></textarea>
    </TD>
  </TR>
   
   <TR <%= myBgColor.toggleBgColor() %>>
    <Th align=left valign=top>Send Email To Submitter
    </TH>
    <TD colspan=2  align=left>
       <input type=radio name="send_email" value="y" checked> Yes <BR>
       <input type=radio name="send_email" value="n"> No
    </TD>
  </TR>
   
  <TR <%= myBgColor.toggleBgColor() %>>
    <Th align=left valign=top>JIRA Issue Id</TH>
    <TD colspan=2 align=left>
        <input type="text" size="10" name="jira" value="HLP-">
    </TD>
  </TR>
   
<% }else {  %>
   <input type=hidden name="update_action" value="submit_symbol" >
<% } %>

   <TR><TD colspan=3>&nbsp;</TD></TR> 

<TR <%= myBgColor.toggleBgColor() %>> 

  
<TD colspan=3>Please click "Modify Symbol Information" to update/change the information about this gene class symbol, "Associate Loci/Publications" to associate loci/publications to this gene class symbol, and "Submit" to submit.
</TD>
</TR>
        
<input type=hidden name="type" value="genesymbol" >

<TR <%= myBgColor.toggleBgColor() %>> 
  <TD>
    <input type="button"  value="Modify Symbol Information" 
     onClick="document.location.href='/servlets/processor?type=genesymbol&update_action=modify_symbol'"> </TD>
  <TD><input type="button"  value="Associate Loci/Publications" 
     onClick="document.location.href='/servlets/processor?type=genesymbol&update_action=associate_loci_pub'"></TD>

  <TD><input type="submit" name="submit" value="Submit" ></TD>
  
</TR>


</form>       

</table>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
