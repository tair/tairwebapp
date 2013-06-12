<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*,java.sql.*, org.tair.processor.genesymbol.*, org.tair.bs.community.* "
%>

<%!
String pageName = "GeneClassSymbol detail";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<%
    GeneClassSymbolDetail  object =  (GeneClassSymbolDetail)request.getAttribute("detail");
%>

<table width="100%" border="0" colspan="2" cellspacing="0" >

<TR> <tr>
        <td colspan="3"><h1>Gene Class Symbol: <%= object.get_symbol() %></h1></td>
    </tr> 


<!-- date_last_modified-->
   <% if ( object.get_date_last_modified() != null ) { %>  
    <tr  <%= myBgColor.toggleBgColor() %> >  

      <th align="left">Date Last Modified</TH>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%=  object.get_date_last_modified()  %></td>
   </tr>
  <% }  %>

   
 <TR <%= myBgColor.toggleBgColor() %>>  
     <Th align=left>Symbol Type</TH>
     <td class="sm">&nbsp;&nbsp;</td>
     <TD align=left>           
          <%= object.get_has_mutant_phenotype().booleanValue()?"Mutant Phenotype":"Gene Product"  %>
     </TD>
 </TR>
 
  <% if (object.get_descriptive_symbol() !=null ){ %>  
 <TR  <%= myBgColor.toggleBgColor() %>> 
     <Th align=left >Symbol Full Name</TH>
     <td class="sm">&nbsp;&nbsp;</td>
     <TD align=left>           
         <%= EmptyTextConverter.convert( object.get_descriptive_symbol()) %>
     </TD>
 </TR>
 <% } %> 

 <% if (! TextConverter.isEmpty( object.get_description()  )) {%>  
 <TR <%= myBgColor.toggleBgColor() %> > 
     <Th align=left valign=top>Description</TH>
     <td class="sm">&nbsp;&nbsp;</td>
     <TD  align=left>           
        <%= TextConverter.dbToHTML( object.get_description()) %> &nbsp;
     </TD>
 </TR>
 <% } %>

 
<%  if(object.get_has_mutant_phenotype().booleanValue() ) { %>
  <TR <%= myBgColor.toggleBgColor() %>>  
     <Th align=left valign=top>Phenotype Class </TH>
     <td class="sm">&nbsp;&nbsp;</td>
     <TD align=left>           
          <%= EmptyTextConverter.convert( object.get_mutant_phenotype_class() ) %>&nbsp;
     </TD>
 </TR> 
  
<% } %>

<% if ( ! TextConverter.isEmpty( object.get_comments() ) ){ %> 
<TR <%= myBgColor.toggleBgColor() %>>  
     <Th align=left valign=top>Comment</TH>
     <td class="sm">&nbsp;&nbsp;</td>
     <TD align=left>           
          <%= EmptyTextConverter.convert( object.get_comments() ) %>&nbsp;
     </TD>
</TR>
<% } %>

<% if (object.get_associated_loci_count() != null ){ %> 
<TR <%= myBgColor.toggleBgColor() %>>  
     <Th align=left>Associated Loci Count</TH>
     <td class="sm">&nbsp;&nbsp;</td>
     <TD align=left>           
          <%=  TextConverter.SymbolLociCountToHTML( object.get_associated_loci_count())  %>&nbsp;
     </TD>
</TR>
<% } %>


<%  if( object.hasLoci() ){  %>
 <TR <%= myBgColor.toggleBgColor() %> >  
     <Th align=left valign=top >Associated Loci</TH>
     <td class="sm">&nbsp;&nbsp;</td> 
     <TD >
       <table cellpadding="2" width="100%">
	<TR>
        <TH  align=left>Locus</TH>
	<TH>&nbsp;</TH> 
	<TH  align=left>Representative Gene Model</TH>
	<TH>&nbsp;</TH> 
	<TH  align=left>&nbsp;</TH>
       </TR>
  <%   Iterator  lociIter = object.getLoci();
       while (lociIter.hasNext()){
          GeneSymbolLocus locus = (GeneSymbolLocus)lociIter.next();
          Long locus_id = locus.get_locus_id();
          String locus_name= locus.get_name();
  %>  
       <TR>
       <TD>
        <A href="/servlets/TairObject?type=locus&id=<%= locus_id %>">
        <%= locus_name %> </A>
        </TD>
	<TD>&nbsp;</TD>
	<TD> <A href="/servlets/TairObject?type=gene&id=<%= locus.get_representative_gene_id() %>">
         <%= locus.get_representative_gene_name() %></A>
	</TD>
	<TD>&nbsp;</TD>
       <TD>
    <% if(locus.get_alias()!=null){ %>
	  <%= locus.getAliasName() %>
     <% }  %> &nbsp;
        </TD>
      </TR>
     <% } %>  
     </table>
     </TD>
 </TR>
 <% } %>
 

  <TR <%= myBgColor.toggleBgColor() %>>  
     <Th align=left>Status</TH>
     <td class="sm">&nbsp;&nbsp;</td>
     <TD align=left>           
          <% String status = "Registered";
          if (object.get_status().equals("obsolete") ) { status = "Obsolete"; }
          if (object.get_status().equals("pending") || object.get_status().equals("await_approval") ){
            status = "Pending";
          }%>
          <%= status  %>&nbsp;
     </TD>
 </TR> 
  

 
  <!-- attribution -->

 <%
    // if no submitter infor in the  attribution table, we will display submitter infor
    // from GeneClassSymbol table 
     boolean has_submitter_from_attribution = false ;
     List<BsAttribution> attributions = object.get_attributions();
     if ( attributions != null && attributions.size() > 0 ){
         has_submitter_from_attribution = true ;
     }
 %>
    <tr <%= myBgColor.toggleBgColor() %> >
         <th valign="top" align="left">Attribution</th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
	    <table cellpadding="2" width="100%">
	        <tr align="left">
	            <th  align=left>Type</th>
	            <th  align=left nowrap>&nbsp; &nbsp;</th>
	            <th  align=left >Name</th>
	            <th  align=left nowrap>&nbsp; &nbsp;</th>
	            <th  align=left >Date</th>
	       </tr>
         <% if (has_submitter_from_attribution == false){  %>
               <tr>
 	            <td class="sm">Submitted By</td>
  	            <td class="sm" nowrap>&nbsp; &nbsp;</th>
                    <td class="sm"><%= EmptyTextConverter.convert(object.get_submitter_info()) %></td>
 	            <td class="sm" nowrap>&nbsp; &nbsp;</th>
                    <td class="sm"><%= EmptyTextConverter.convert(object.get_reservation_date()) %></td>
               </tr>
	 <% }else {
             BsAttribution submitter = object.getLastAttribution("submitted_by");
	 %>      
                <tr>
                <td class="sm">Submitted By
                 <% ArrayList submitted_by_names = new ArrayList();
                    ArrayList submitted_by_ids = new ArrayList();
                    ArrayList submitted_by_dates = new ArrayList();
                    submitted_by_names = object.get_all_submitter_names();
                    submitted_by_ids = object.get_all_submitter_ids(); 
                    submitted_by_dates = object.get_all_submitter_dates();
                    for (int i=0; i<submitted_by_names.size(); i++){
                 %>   
                    <% if (i!=0){ %>
                        <td class = "sm" nowrap> &nbsp; &nbsp;</th>
                    <% } %>
                    <td class="sm" nowrap>&nbsp; &nbsp;</th>
                    <td class="sm"><a href=/servlets/Community?action=view&type=<%= submitter.getCommunityLinkType() %>&communityID=<%=  Long.valueOf(submitted_by_ids.get(i).toString()) %>><%= submitted_by_names.get(i).toString()%></a></td>
                <td class="sm" nowrap>&nbsp; &nbsp;</th>
                    <td class="sm">
                        <%= submitted_by_dates.get(i).toString() %></td>
                        <!%= EmptyTextConverter.convert(object.get_reservation_date()) %><!/td>
                </td>
                </tr>
                <% } %>
	 <% }  %>      
	       
          <!-- reviewed_by -->
          <% if (  object.getLastReviewerAttribution( ) != null ) { 
               BsAttribution reviewer = object.getLastReviewerAttribution( );
          %>
              <tr>
 	            <td class="sm">Reviewed By</td>
  	            <% ArrayList reviewed_by_names = new ArrayList();
                   ArrayList reviewed_by_dates = new ArrayList();
                   ArrayList reviewed_by_ids = new ArrayList();
                   reviewed_by_ids = object.get_all_reviewer_ids();
                   reviewed_by_dates = object.get_all_reviewer_dates();
                   reviewed_by_names = object.get_all_reviewer_names();
                   if (reviewed_by_ids.size() == 0) { 
                %>

                    <td class="sm" nowrap>&nbsp; &nbsp;</th>
                    <td class="sm"><a href=/servlets/Community?action=view&type=<%= reviewer.getCommunityLinkType() %>&communityID=<%= reviewer.getCommunityId().toString()  %>><%=  reviewer.getCommunity().getName()  %></a></td>
 	            <td class="sm" nowrap>&nbsp; &nbsp;</th>
                    <td class="sm"><%= EmptyTextConverter.convert( reviewer.getAttributionDate()) %></td>
 	       </tr> 
                <%} else {   
                   for (int i=0; i<reviewed_by_names.size(); i++){
                    if (i!=0){
                %>
                      <td class="sm" nowrap>&nbsp; &nbsp;</th>
                <%  } %>
                    <td class="sm" nowrap>&nbsp; &nbsp;</th>
                    <td class="sm"><a href=/servlets/Community?action=view&type=<%= reviewer.getCommunityLinkType() %>&communityID=<%=  Long.valueOf(reviewed_by_ids.get(i).toString())  %>><%=  reviewed_by_names.get(i).toString()  %></a></td>
 	            <td class="sm" nowrap>&nbsp; &nbsp;</th>
                    <td class="sm"><%= EmptyTextConverter.convert( reviewed_by_dates.get(i).toString()) %></td>
 	       </tr> 

	               <% } %>
               <% } %>
     <% } %>
	
	      </table>
	     </td>
      </tr>
       



    <!-- publication -->
	<% if ( object.get_publications() != null ) { %>  
          <tr <%= myBgColor.toggleBgColor() %> >
	     <th class="sm" valign="top" align="left">Publication</th>
	     <td class="sm">&nbsp;&nbsp;</td>
	     <td class="sm">
       	        <table  cellpadding="2" width="100%">
	           <tr align="left">
	              <th class="sm">Title</th>
	              <th class="sm" nowrap>&nbsp; &nbsp;</th>
	              <th class="sm">Source</th>
	              <th class="sm" nowrap>&nbsp; &nbsp;</th>
	              <th class="sm">Date</th>
	          </tr>

                  <%
                    Iterator pubIter = object.get_publications();
                    while ( pubIter.hasNext() ) {
                         PublicationObject publication = (PublicationObject) pubIter.next();
		  %>

	          <tr>
	             <td class="sm"><a href=/servlets/TairObject?type=publication&id=<%= publication.get_reference_id() %>><%= EmptyTextConverter.convert( publication.get_title() )%></a></td>
 	             <td class="sm" nowrap>&nbsp; &nbsp;</th>
                     <td class="sm"><%=EmptyTextConverter.convert( publication.get_pub_source_name() )%></td>
 	             <td class="sm" nowrap>&nbsp; &nbsp;</th>
                    <td class="sm"><%=EmptyTextConverter.convert( publication.get_year() )%></td>
                 </tr>
                <% } %>
                </table>
	     </td>
           </tr>
        <% } %>

<!-- communication -->
  <% if ( object.get_communication_references() != null ) { %>  
     <tr <%= myBgColor.toggleBgColor() %> >
	 <th class="sm" valign="top" align="left">Communication</th>
	 <td class="sm">&nbsp;&nbsp;</td>
	 <td class="sm">
       	 <table> 
            <tr align="left">
	       <th class="sm">Name</th>
	       <th class="sm" nowrap>&nbsp; &nbsp;</th>
	       <th class="sm">Author Name</th>
	       <th class="sm" nowrap>&nbsp; &nbsp;</th>
               <th class="sm">date</th>
	     </tr>
	    
        <%
             Iterator comIter = object.get_communication_references() ;
             while ( comIter.hasNext() ) {
                CommunicationObject  communication = (CommunicationObject)comIter.next();
        %>

	     <tr>
	        <td class="sm"><a href=/servlets/TairObject?type=communication&id=<%= communication.get_reference_id() %>><%= EmptyTextConverter.convert(communication.get_name() )%></a></td>
 	        <td class="sm" nowrap>&nbsp; &nbsp;</th>
                <td class="sm"><%=EmptyTextConverter.convert( communication.get_author_name() )%></td>
                <td class="sm" nowrap>&nbsp; &nbsp;</td>
               
                <td class="sm"><%= EmptyTextConverter.convert( communication.get_date() ) %></td>
             </tr>
         <% } %>
          </table>
	 </td>
       </tr>
   <% } %>
 
</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
