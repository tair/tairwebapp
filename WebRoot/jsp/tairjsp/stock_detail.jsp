<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights 
  reserved.
-->

<%@ page import = "java.util.*, org.tair.abrc.stock.*, org.tair.querytools.*, org.tair.community.*, org.tair.tfc.*, org.tair.utilities.*,  java.net.*, org.tair.bs.community.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Stock Detail";
%>

<% StockDetail detail = (StockDetail) request.getAttribute( "detail" ); 
   String hiddenReq = request.getParameter( "hideNote" );
   boolean hidden = ( hiddenReq != null && hiddenReq.equals( "true" ) );

   String showAllReq = request.getParameter( "showAllNote" );
   boolean showAll = ( showAllReq != null && showAllReq.equals( "true" ) );
%>  

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<%@ include file="/jsp/includes/order_functions.jsp" %>


<b><font size="+1">Stock: <%= detail.get_name() %></font></b>

<table cellpadding="3" border="0" cellspacing="0" align="center" width="100%">

      <tr>
	<td colspan="2">&nbsp;</td>
      </tr>

      <tr valign="top" <%= myBgColor.toggleBgColor() %> >
	<th  align="left"   class="sm">Stock #:</th>
	<td  class="sm"><%= detail.get_name() %>&nbsp;</td>
      </tr>

      <% if ( detail.get_aliases() != null ) { %>
      <tr valign="top" <%= myBgColor.toggleBgColor() %> >
	<th  align="left" class="sm">Aliases<%= DefinitionsLookup.createPopupLink("Alias", "class") %></th>
	<td   class="sm">
            <table cellpadding="1" cellspacing="0" border="0">
                <tr>
                   <th class="sm" align="left">Alias</th>  
                   <th class="sm" nowrap>&nbsp; &nbsp;</th>
                   <th class="sm">Alias Type</th> 
                   <th class="sm" nowrap>&nbsp; &nbsp;</th>
                   <th class="sm">Note</th>
                </tr>
        <% 
           Iterator iter = detail.get_aliases();
           while ( iter.hasNext() ) {
              TfcAlias alias = (TfcAlias) iter.next();
        %>
                <tr>
                   <td class="sm"><%= alias.get_original_alias() %></td>
                   <td class="sm" nowrap>&nbsp; &nbsp;</td>
                   <td class="sm"><%= alias.get_type() %></td>
                   <td class="sm" nowrap>&nbsp; &nbsp;</td>
                   <td class="sm"><%= EmptyTextConverter.convert( alias.get_note() ) %></td>
                </tr>
        <% } %>
            
            </table>
        </td>
      </tr>
      <% } %>


     <tr <%=myBgColor.toggleBgColor()%> >
        <th class="sm" align="left" valign="top">TAIR Accession<%= DefinitionsLookup.createPopupLink("Glossary", "TAIR Accession") %></th>
        <td class="sm" ><%= detail.getAccession() %>&nbsp;</td>
    </tr>

     <% if ( detail.get_date_last_modified() != null ) { %>  
      <tr  <%= myBgColor.toggleBgColor() %> >  
        <th class="sm" align="left">Date last modified</th>
        <td class="sm"><%=  detail.get_date_last_modified()  %></td>
      </tr>
     <% } %>


     <% if ( detail.get_release_date() != null ) { %>  
      <tr  <%= myBgColor.toggleBgColor() %> >  
        <th class="sm" align="left">Date released</th>
        <td class="sm"><%=  detail.get_release_date()  %></td>
      </tr>
     <% } %>


      <tr valign="top" <%= myBgColor.toggleBgColor() %> >
	<th class="sm" align="left">Stock type<%= DefinitionsLookup.createPopupLink("StockType", "stock_type") %></th>
	<td class="sm">
              <%= detail.get_stock_type() %>
              &nbsp; 
              <% if ( detail.get_is_molecular_mapping() != null && detail.get_is_molecular_mapping().booleanValue() ) { %>
                   Molecular mapping line<%= DefinitionsLookup.createPopupLink("Stock", "is_molecular_mapping") %>
                   &nbsp;
              <% } %>
              <%  if ( detail.get_is_classical_mapping() != null && detail.get_is_classical_mapping().booleanValue() ) { %>
                   Classical mapping line<%= DefinitionsLookup.createPopupLink("Stock", "is_classical_mapping") %>
              <% } %>
        </td>
      </tr>

      <tr valign="top" <%= myBgColor.toggleBgColor() %> >
	<th class="sm" align="left" >Availability<%= DefinitionsLookup.createPopupLink("StockAvailabilityType", "stock_availability_type") %></th>
	<td class="sm"><%= detail.get_stock_availability_type() %><%= !TextConverter.isEmpty(EmptyTextConverter.convert( detail.get_stock_availability_comment() )) ? "," : "" %> 
	  <%= EmptyTextConverter.convert( detail.get_stock_availability_comment() )%>&nbsp;</td>
      </tr>


      <% if ( detail.get_format_base_price() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
	<th class="sm" align="left">Academic fee<%= DefinitionsLookup.createPopupLink("Glossary","academic fee") %></th>
	<td class="sm"><%= detail.get_format_base_price() %></td>
      </tr>

    <tr <%= myBgColor.toggleBgColor() %> >
	<th class="sm" align="left">Commercial fee<%= DefinitionsLookup.createPopupLink("Glossary","comm fee") %></th>
	<td class="sm"><%= detail.get_format_commercial_price() %></td>
      </tr>
      <% } %>
    
    <% if ( detail.get_express_shipping_required().booleanValue() ) { %>
    <tr <%= myBgColor.toggleBgColor() %> >
	<th class="sm" align="left">Express shipping required<%= DefinitionsLookup.createPopupLink("Glossary","express_shipping_reqd") %></th>
	<td class="sm"><%= TextConverter.booleanToWord( detail.get_express_shipping_required() ) %></td>
    </tr>
      
    <tr <%= myBgColor.toggleBgColor() %> >
	<th class="sm" align="left">Express shipping charge<%= DefinitionsLookup.createPopupLink("Glossary","express_ship") %></th>
	<td class="sm"><%=  detail.get_format_express_shipping_charge() %></td>
    </tr>
    <% } %>
    
    <% if( detail.get_is_restricted() != null && detail.get_is_restricted().booleanValue() ) {  %>    
      <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" align="left">Restricted to academic organizations?</th>
        <td class="sm"><%= TextConverter.booleanToWord( detail.get_is_restricted() ) %></td>
      </tr>
    <% } %>

     <% if ( detail.get_format_shipped() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" align="left">
            Format shipped 
        <% if(detail.get_is_seed() != null && detail.get_is_seed().booleanValue()){ %>
           (#seeds/vial)
        <% } %></th>

        <td class="sm"><%= detail.get_format_shipped() %></td>
      </tr>
     <% } %>

     <% if ( detail.get_kit_contents() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" align="left">Kit contents</th>
        <td class="sm"><%= detail.get_kit_contents() %></td>
      </tr>
     <% } %>

     <% if ( detail.get_number_in_set() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" align="left">Number in set 
       <% if(detail.get_is_seed() != null && detail.get_is_seed().booleanValue()){ %>
           (#tubes/stock#)
       <% } %> 
        </th>
        <td class="sm"><%= detail.get_number_in_set() %></td>
      </tr>
     <% } %>

     <% if ( detail.get_num_lines() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" align="left" >Number of lines represented/stock#</th>
        <td class="sm"><%= detail.get_num_lines() %></td>
      </tr>
     <% } %>

     <% if ( detail.get_media() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" align="left">Media</th>
        <td class="sm"><%= detail.get_media() %></td>
      </tr>
     <% } %>

     <% if ( detail.get_growth_temperature() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" align="left">Growth temperature</th>
        <td class="sm"><%= detail.get_growth_temperature() %></td>
      </tr>
     <% } %>

     <% if ( detail.get_duration_of_growth() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" align="left">Duration of growth</th>
        <td class="sm"><%= detail.get_duration_of_growth() %></td>
      </tr>
     <% } %>

      <% if ( detail.get_MTA_signature() != null && detail.get_MTA_signature().booleanValue() ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" align="left">MTA signature required before shipping?</th>
        <td class="sm"><%= TextConverter.booleanToWord( detail.get_MTA_signature() ) %></td>
      </tr>
      <% } %>


      <% if ( detail.get_description() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %> valign="top">
        <th class="sm" align="left" valign="top">Description</th>
        <td class="sm"><%= detail.get_description() %>&nbsp;</td>
      </tr>
      <% } %>
      
      <!-- images -->
      <% if ( detail.hasImages() ) { %> 
        <tr <%= myBgColor.toggleBgColor() %> valign="top">
        <th class="sm" align="left">Images</th>
        <td class="sm">
        <% Iterator imageIter = detail.getImages();
        TfcImage image = null;
        while ( imageIter.hasNext() ) { 
            image = (TfcImage) imageIter.next();
        %>  
            <% if ( image.hasThumbnail() ) { %>       
                <a href="/jsp/common/image.jsp?id=<%= image.get_image_id() %>&format=<%= image.getLinkSuffix() %>">
                <img src="/servlets/images/thumb_<%= image.get_image_id() %>.<%= image.getLinkSuffix() %>" border="0"></a>
            <% } else { %>       
                <a href="/jsp/common/image.jsp?id=<%= image.get_image_id() %>&format=<%= image.getLinkSuffix() %>">View Image</a>    
            <% } %>                                                                                     
        <% } %>                                                                                             
        </td>                                                                                                 
        </tr>                                                                                                   
      <% } %>      
      
      <% if ( detail.get_ABRC_comments() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %> valign="top"  align="left">
        <th class="sm" align="left">ABRC comments<%= DefinitionsLookup.createPopupLink("Stock","ABRC_comments") %></th>
        <td class="sm"><%= detail.get_ABRC_comments() %>&nbsp;</td>
      </tr>
      <% } %>


      <% if ( detail.hasParentStocks() ) { %>
      <tr <%= myBgColor.toggleBgColor() %> valign="top"  align="left">
        <th class="sm" align="left">Related Sets/Pools</th>
        <td class="sm">
               <table cellpadding="2" cellspacing="2" border="0">
                   <tr>
                      <th class="sm" align="left">stock #</th>
                      <th class="sm" align="left">stock type</th>
                   </tr>

                 <% Iterator parentIter = detail.getParentStocks();
                    StockObject parent = null;
                    while ( parentIter.hasNext() ) {
                        parent = (StockObject) parentIter.next();
                 %>

                 <tr>
                   <td class="sm"><a href="/servlets/TairObject?type=stock&id=<%= parent.get_stock_id() %>"><%= parent.get_name() %></a></td>
                   <td class="sm"><%= parent.get_stock_type() %></td>
                 </tr>

               <% } %>
            </table>
          </td>
       </tr>
     <% } %>


      <% if ( detail.hasMemberStocks() ) { %>
      <tr <%= myBgColor.toggleBgColor() %> valign="top"  align="left">
        <th class="sm" align="left">Member Stocks</th>
        <td class="sm">
               <table cellpadding="2" cellspacing="2" border="0">
                   <tr>
                      <th class="sm" align="left">stock #</th>
                      <th class="sm" align="left">stock type</th>
                   </tr>

                 <% Iterator memberIter = detail.getMemberStocks();
                    StockObject member = null;
                    while ( memberIter.hasNext() ) {
                        member = (StockObject) memberIter.next();
                 %>

                 <tr>
                    <td class="sm"><a href="/servlets/TairObject?type=stock&id=<%= member.get_stock_id() %>"><%= member.get_name() %></a></td>
                    <td class="sm"><%= member.get_stock_type() %></td>
                 </tr>

               <% } %>
  

               <% if ( detail.memberStocksAbbreviated() ) { %>
                 <tr>
                    <td class="sm" colspan="2"><br>

                       <% if ( detail.get_is_seed() != null && detail.get_is_seed().booleanValue() ) { %>
                          <a href="/servlets/Search?type=seed&search_action=search&parent_id=<%= detail.get_tair_object_id() %>&parent_name=<%= URLEncoder.encode( detail.get_name() ) %>">View Complete List</a>
                       <% } else { %>
                          <a href="/servlets/Search?type=dna&dna_type=stock&search_action=search&parent_id=<%= detail.get_tair_object_id() %>&parent_name=<%= URLEncoder.encode( detail.get_name() ) %>">View Complete List</a>
                       <% } %>
                       &nbsp;
                       (<%= detail.getNumberMemberStocks() %> of <%= detail.getTotalMemberStocks() %> displayed)
                     </td>
                 </tr>
               <% } %>
 
            </table>
          </td>
       </tr>
     <% } %>


   <!-- clones-->  
   <% if ( detail.hasClones() ) { %> 
   <tr <%= myBgColor.toggleBgColor() %> >
       <th class="sm" valign="top" align="left">Clone<%= DefinitionsLookup.createPopupLink("Clone", "class") %></th>
       <td class="sm">
           <table>
	   <tr align="left">
	       <th class="sm" align="left">vector type<%= DefinitionsLookup.createPopupLink("Vector","type") %></th>
               <th class="sm" nowrap>&nbsp; &nbsp;</th>
	       <th class="sm">insert type<%= DefinitionsLookup.createPopupLink("Clone","insert_type") %></th>
               <th class="sm" nowrap>&nbsp; &nbsp;</th>
	       <th class="sm">clone name<%= DefinitionsLookup.createPopupLink("Clone","name") %></th>
               <th class="sm" nowrap>&nbsp; &nbsp;</th>
	       <th class="sm">Taxon<%= DefinitionsLookup.createPopupLink("Taxon","class") %></th>
	   </tr>
      <%
          Iterator cloneIter = detail.getClones();
          Clone clone = null;
          while ( cloneIter.hasNext() ) {
             clone = (Clone) cloneIter.next();
      %>
      
 	   <tr>
	   	<td class="sm"><%= EmptyTextConverter.convert( clone.get_vector_type() ) %>&nbsp;</td>
                <td class="sm" nowrap>&nbsp; &nbsp;</td>
	        <td class="sm"><%= EmptyTextConverter.convert( clone.get_insert_type() ) %>&nbsp;</td>
                <td class="sm" nowrap>&nbsp; &nbsp;</td>
		<td class="sm"><a href="/servlet/TairObject?type=clone&id=<%= clone.get_clone_id() %>"><%= clone.get_name() %></a></td>
                <td class="sm" nowrap>&nbsp; &nbsp;</td>
	    <% if (clone.get_scientific_name() != null) {%>
		    <td class="sm"><%= clone.get_scientific_name() %></td>
        <% } else { %>
            <td class="sm" nowrap>&nbsp; &nbsp;</td>
        <% } %>
       </tr>
       <%  }  %>
	   </table>
	   </td>
         </tr>
   <%  }  %>


 <!-- libraries -->
 <% if ( detail.hasLibraries() ) { %>
   <tr <%= myBgColor.toggleBgColor() %>>
       <th class="sm" align="left" valign="top" >Library<%= DefinitionsLookup.createPopupLink("Library","class") %></th>
       <td class="sm">
          <table width="100%" cellpadding="1" cellspacing="0">
              <tr align="left">
                 <th class="sm">name</td>
                 <th class="sm">description</td>
              </tr>
           
          <% Iterator libraryIter = detail.getLibraries();
             TfcLibrary library = null;
             while ( libraryIter.hasNext() ) { 
               library = (TfcLibrary) libraryIter.next();
          %>
              <tr valign="top">
                 <td class="sm"><a href="/servlets/TairObject?type=library&id=<%= library.get_library_id() %>"><%= library.get_name() %></a></td>
                 <td class="sm"><%= EmptyTextConverter.convert( library.get_description() ) %></td>
              </tr>
          <% } %>
          </table>
       </td> 
   </tr>
 <% } %>

 <!-- Host strain -->
 <% if ( detail.hasHostStrains() ) { %>
    <tr <%=myBgColor.toggleBgColor() %> valign="top" >
        <th class="sm" align="left">Host Strain</th>
        <td class="sm" >
            <table cellpadding="2">
                <tr>
                     <th class="small" align="left">Genus</th>
                     <th class="small" align="left">Species</th>
                     <th class="small" align="left">Strain Name</th>
                </tr>

               <% Iterator strainIter = detail.getHostStrains();
                  HostStrain strain = null;
                  while ( strainIter.hasNext() ) {
                      strain = (HostStrain) strainIter.next();
               %>

                <tr>
                     <td class="small"><%= strain.get_genus() %></th>
                     <td class="small"><%= strain.get_species() %></th>
                     <td class="small"><a href="/servlets/TairObject?type=host_strain&id=<%= strain.get_host_strain_id() %>"><%= strain.get_original_name() %></a></td>
                </tr>

               <% } %>

             </table>
        </td>
    </tr>
 <%  } %>


 <!-- vector data may be either for stock (if stock is itself a vector), or
      for clones associated to stock (if stock is itself a clone) -->

 <% if ( detail.hasVectors() || detail.hasCloneVectors() ) { %>
     <tr <%= myBgColor.toggleBgColor() %>>
        <th class="sm" valign="top" align="left">Vector<%= DefinitionsLookup.createPopupLink("Vector", "class") %></th>
        <td class="sm">
        <table cellpadding="2">
            <tr align="left">
               <th class="sm">name <%= DefinitionsLookup.createPopupLink("Vector", "name ") %></th>
               <th class="sm" nowrap>&nbsp;</th>
               <th class="sm">type<%= DefinitionsLookup.createPopupLink("Vector", "type ") %></th>
               <th class="sm" nowrap>&nbsp;</th>
               <th class="sm">description<%= DefinitionsLookup.createPopupLink("Vector","description") %></th>
               
            </tr>
            <%
	       // get vector iterator from detail object itself (if stock is a vector)
               // or from stock's associated clone (if stock is a clone)
	       Iterator vectorIter = detail.hasVectors() ? detail.getVectors() : detail.getCloneVectors();
		
               TfcVector vector = null;
               while ( vectorIter.hasNext() ) {
                 vector = (TfcVector) vectorIter.next();
             %>

              <tr valign="top">
                 <td class="sm"><a href="/servlets/TairObject?type=vector&id=<%= vector.get_vector_id() %>">
                     <%= vector.get_name() %></a></td>
                 <td class="sm" nowrap>&nbsp;</td>
                 <td class="sm"><%= vector.get_vector_type() %></a></td>
                 <td class="sm" nowrap>&nbsp;</td>
                 <td class="sm"><%= EmptyTextConverter.convert( vector.get_description() ) %></td>
	      </tr>
             <% } %>
         </table>
         </td>
     </tr>
  <% } %>

 <!-- germplasms -->
 <% if ( detail.hasGermplasms() ) { %>
     <tr <%= myBgColor.toggleBgColor() %>>
        <th class="sm" valign="top" align="left">Germplasm<%= DefinitionsLookup.createPopupLink("Germplasm","class") %></th>
        <td class="sm">
        <table cellpadding="2" class="germ_band">
            <tr align="left">
               <th class="sm" align="left">name<%= DefinitionsLookup.createPopupLink("Germplasm", "name") %></th>
               <th class="sm" nowrap>&nbsp;</th>
               <th class="sm">genus</th>
               <th class="sm" nowrap>&nbsp;</th>
               <th class="sm">species</th>
               <th class="sm" nowrap>&nbsp;</th>
               <th class="sm" nowrap>common name</th>
            </tr>
            <%
               Iterator germplasmIter = detail.getGermplasms();
               Germplasm germplasm = null;
               while ( germplasmIter.hasNext() ) {
                 germplasm = (Germplasm) germplasmIter.next();
             %>

              <tr valign="top">
                 <td class="sm"><a href="/servlets/TairObject?type=germplasm&id=<%= germplasm.get_tair_object_id() %>"><%= germplasm.get_name() %></a></td>
                 <td class="sm" nowrap>&nbsp;</td>
                 <td class="sm"><%= EmptyTextConverter.convert( germplasm.get_genus() ) %></td>
                 <td class="sm" nowrap>&nbsp;</td>
                 <td class="sm"><%= EmptyTextConverter.convert( germplasm.get_species() ) %></td>
                 <td class="sm" nowrap>&nbsp;</td>
                 <td class="sm"><%= EmptyTextConverter.convert( germplasm.get_common_name() ) %></td>
	      </tr>
              <tr>
                 <th class="sm" colspan="7" align="left" style="padding: 9px 0 0 0">Phenotypes<%= DefinitionsLookup.createPopupLink("Phenotype","class") %></th>
              </tr>
               <% 
                  Iterator pcIter = germplasm.get_phenotypes().iterator();
                  if ( !pcIter.hasNext() ) { %>

                 <tr>
                    <td class="sm" colspan="7">None available</td>
                 </tr>

               <% } else { %>

                 <tr>
                    <td class="sm" colspan="7"><ul>

               <% Phenotype pheno;
                  while(pcIter.hasNext()) {
                    pheno = (Phenotype) pcIter.next();
                    TfcReference ref = pheno.get_reference(); %>

                    <li><%= EmptyTextConverter.convert(pheno.get_phenotype()) %>
                    <%
                            if( ref == null || ref.get_reference_id() == null )
                            {
                    %>
                               Phenotype curated by ABRC.
                    <%
                            } else {
                               String type = pheno.get_reference().get_reference_type();
                               String label = null;
                               
                               if (type.compareToIgnoreCase("publication") == 0) {
                                   label = pheno.get_publication().getReferenceLabel();
                               } else if (type.compareToIgnoreCase("communication") == 0) {
                                   label = pheno.get_communication().getReferenceLabel();
                               } else if (type.compareToIgnoreCase("analysis_reference") == 0) {
                                   label = pheno.get_analysis_reference().getReferenceLabel();
                               }
                    %>
                               <a href=/servlets/TairObject?id=<%= ref.get_reference_id() %>&type=<%= ref.get_reference_type() %>><%= EmptyTextConverter.convert(label).trim() %></a>
                    <%
                            }
                    %>

                    </li>

                <% } // end phenotype while loop %>

                    </ul></td>
                 </tr>

               <% } %>

             <% } %>
         </table>
         </td>
     </tr>
  <% } %>


 <!-- external_link -->
 <% if ( detail.get_external_links() != null ) { %>
    
  <tr <%= myBgColor.toggleBgColor() %> >
     <th class="sm" align="left" valign=top">External Link<%= DefinitionsLookup.createPopupLink("Glossary","external link") %></th> 
     <td class="sm">
     <table>
 <%  Iterator iter = detail.get_external_links();
         while ( iter.hasNext() ) {
           ExternalLinkObject elo = (ExternalLinkObject) iter.next();
           String web_site_name = elo.get_web_site_name();

  %>  <TR> 
     <td class="sm"><%= elo.get_external_HTML_link( web_site_name ) %></td>
     </TR> 
<% } %>
     </TABLE></TD>
  </tr>
<% } %>


<!-- annotation -->
<% if ( detail.get_annotations() != null ) {  %>
<% myBgColor.toggleBgColor(); %> 
<TR><TD colspan=3 >
  <table cellpadding="2" width="100%" border=0 cellspacing="0" >
<%   Iterator sourceIter = detail.getAnnotationSources();
     boolean firstSource = true ;
     while ( sourceIter.hasNext() ) {
        String annotated_by = (String) sourceIter.next();
%>
<% if (! firstSource){  %> <TR <%= myBgColor.sameBgColor()  %>><TD colspan=5><HR></TD></TR> <% } %>

<tr <%= myBgColor.sameBgColor()  %> valign="top" >

     <th class="sm" valign="top" align="left"> 
        <%= EmptyTextConverter.convert( annotated_by) %>'s comment</th>
     <td class="sm">&nbsp;</td>   
  <% Iterator annotations =  detail.getAnnotations ( annotated_by );
     boolean first = true;
     while ( annotations.hasNext()){
         AnnotationObject annotation= (AnnotationObject)annotations.next();
         if (!first){
  %>
      <TR  <%= myBgColor.sameBgColor()  %> ><td class="sm" colspan=2 >&nbsp;</td>       
  <%  }  %>
      <td class="sm"><%= EmptyTextConverter.convert( annotation.get_short_annotation() ) + " " + EmptyTextConverter.convert( annotation.get_long_annotation() ) %></td>
      <td class="sm">&nbsp;</td>
      <td class="sm" align=left valign=top><%= EmptyTextConverter.convert( annotation.get_date_entered() )%></td>
     </tr> 
<%   first=false;
   }
%>

<% firstSource = false ;  
  } 
%>
  </table></TD></TR>
<% } %>


 <!-- donors -->
    <% if ( detail.hasDonors() ) { %>

      <tr <%= myBgColor.toggleBgColor() %> valign="top">
	<th class="sm" align="left">Donor(s)</th>
	<td class="sm">
          <table>
             <tr>
                  <th class="sm" align="left">Donor</th>
		  <th class="sm">&nbsp;&nbsp;</th>
                  <th class="sm" align="left">Donor Stock #</th>
             </tr>

      <%
             Iterator donorIter = detail.getDonors();

             // keep track of donor stock numbers and only show distinct numbers
             List distinct = new ArrayList();
             String donorNumber = null;

             while ( donorIter.hasNext() ) {
                 Donor donor= (Donor) donorIter.next();

                 donorNumber = donor.getDonorStockNumber();
		 if ( donorNumber == null || distinct.contains( donorNumber ) ) {
                     donorNumber = "";
                 } else {
	  	     distinct.add( donorNumber );
                 }
      %>
                 <tr>
                     <td class="sm"><a href="/servlets/TairObject?type=<%= donor.getCommunityType() %>&id=<%= donor.getCommunityID() %>"><%= donor.getDisplayName() %></a></td>
		     <th class="sm">&nbsp;&nbsp;</th>
                     <td class="sm"><%= donorNumber %></td>
                 </tr>

          <% } %>
          </table>

         </td>
      </tr>

      <% } %>




  <!--comment-->
 <% String commentColor =  myBgColor.toggleBgColor(); %>
      <form action="/servlets/updater" method="post"> 
        <tr <%= commentColor %> valign="top">
           <th class="sm" align="left">Comments <%= DefinitionsLookup.createPopupLink("Glossary","Comments") %><br>(shows only the most recent comments by default)
             <input type="hidden" name="type" value="notepad">
             <input type="hidden" name="update_action" value="add">
             <input type="hidden" name="tair_object_id" value="<%= detail.get_tair_object_id() %>">
             <input type="hidden" name="accession" value="<%= detail.getAccession() %>">

            <% String hideText = hidden ? "Show Comments" : "Hide Comments"; %>
            <% boolean hideOption = !hidden; %>
            <% String allText = showAll ? "Show Recent Comments" : "Show All Comments"; %>
            <% boolean showAllOption = !showAll; %>
           </th>

          <td class="sm">
             <% if ( !hidden && detail.hasNotepad() ) { %>
                  <table cellpadding="2" width="100%">
                    <tr align="left">
                      <th class="sm">entered by</th>
	              <th class="sm">date</th>
	              <th class="sm">comment</th>
	            </tr>
                 <%                          
                   Iterator noteIter = detail.getNotepad( showAll );
                   Notepad note = null;
                   while ( noteIter.hasNext() ) {
                      note = (Notepad) noteIter.next();
                      String display_note = note.get_comment() ;
                      if ( display_note.length() > 100){
                          display_note =  TextConverter.truncateString( note.get_comment(), 100 );
                      }
                 %>
	                <tr valign="top">
                           <td class="sm" nowrap><a href="/servlets/Community?action=view&type=person&communityID=<%= note.get_community_id() %>"><%= note.get_person_name() %></a></td>
 	                   <td class="sm" nowrap><%= TextConverter.dateToString( note.get_date_entered() ) %></td>
                           <td class="sm"><a href="/servlets/TairObject?type=notepad&id=<%= note.get_notepad_id() %>"><%= display_note  %></a></td> 
                        </tr>

                 <% } %>
                </table>
             <% } %>
              &nbsp;
          </td>
        </tr>
      <tr <%= commentColor  %>  valign="top" >
          <td class="sm" colspan="2" align="center">
          <input type="submit" VALUE="Add My Comment">&nbsp;&nbsp;
          <input type="button" value="<%= hideText %>" onClick="document.location.href='/servlets/TairObject?accession=<%= detail.getAccession() %>&hideNote=<%= hideOption %>'">&nbsp;&nbsp;
          <input type="button" value="<%= allText %>" onClick="document.location.href='/servlets/TairObject?accession=<%= detail.getAccession() %>&showAllNote=<%= showAllOption %>'"> 
           </td>
      </tr>
   </form>


  <!-- attribution -->
    <% if ( detail.get_attributions() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" valign="top" align="left">Attribution<%= DefinitionsLookup.createPopupLink("Attribution","class") %></th>
      
        <td class="sm">
	   <table>
	   <tr align="left">
	       <th class="sm">type</th>
	       <th class="sm" nowrap>&nbsp; &nbsp;</th>
	       <th class="sm">name</th>
	       <th class="sm" nowrap>&nbsp; &nbsp;</th>
	       <th class="sm">date</th>
	   </tr>
          <%
               for ( BsAttribution attribution : detail.get_attributions() ) {
          %>
	   <tr>
 	       <td class="sm"><%= EmptyTextConverter.convert( attribution.getType().getAttributionType() ) %></td>
  	       <td class="sm" nowrap>&nbsp; &nbsp;</th>
               <td class="sm"><a href=/servlets/Community?action=view&type=<%= attribution.getCommunityLinkType() %>&communityID=<%= attribution.getCommunityId().toString() %>><%= attribution.getCommunity().getName() %></a></td>
 	       <td class="sm" nowrap>&nbsp; &nbsp;</th>
               <td class="sm"><%= TextConverter.dateToString( attribution.getAttributionDate() ) %></td>
           </tr>
         <% } %>
           </table>
	</td>
    </tr>
    <% } %>


 <!-- communication -->
 <% if ( detail.get_communication_references() != null ) { %>  
     <tr <%= myBgColor.toggleBgColor() %> >
	 <th class="sm" valign="top" align="left">Communication<%= DefinitionsLookup.createPopupLink("Communication","class") %></th>
	 <td class="sm">
       	 <table> 
            <tr align="left">
	       <th class="sm">Name</th>
	       <th class="sm" nowrap>&nbsp; &nbsp;</th>
	       <th class="sm">Author Name<%= DefinitionsLookup.createPopupLink("Communication","author_type") %></th>
	       <th class="sm" nowrap>&nbsp; &nbsp;</th>
               <th class="sm">date</th>
	     </tr>
	    
        <%
             Iterator comIter = detail.get_communication_references() ;
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
    
  <!-- URLs -->
  <% if ( detail.hasURLs() ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
          <th class="sm" valign="top" align="left">Associated URLs</th>
          <td clas="sm" align="left">
          <%
          Iterator urlIter = detail.getURLs();
          while ( urlIter.hasNext() ) {
            BsUrl url = (BsUrl) urlIter.next();
            if (url.getWebSiteName() == null || url.getWebSiteName() == ""){
            %>
                <a href="<%=url.getUrl()%>"><%=url.getUrl()%></a><br /><%
            }else{
            %>
                <a href="<%=url.getUrl()%>"><%=url.getWebSiteName()%></a><br /><%
            }
          }
          %>
          </td>
    </tr>
    <% } %>


 <!-- publication -->
 <% if ( detail.get_publications() != null ) { %>  
      <tr <%= myBgColor.toggleBgColor() %> >
	  <th class="sm" valign="top" align="left">Publication<%= DefinitionsLookup.createPopupLink("Publication","class") %></th>
	  <td class="sm">
       	        <table>
	           <tr align="left">
	              <th class="sm">title</th>
	              <th class="sm" nowrap>&nbsp; &nbsp;</th>
	              <th class="sm">source</th>
	              <th class="sm" nowrap>&nbsp; &nbsp;</th>
	              <th class="sm">date</th>
	          </tr>

                  <%
                    Iterator pubIter = detail.get_publications();
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



   
      <tr>
          <td colspan="2">&nbsp;</td>
      </tr>
      
      <tr valign="top">
        <td colspan="2" class="sm" nowrap>
        <form action="/servlets/Order/current" method="post"> 
         <% if ( DataConstants.getAvailableStock().equals( detail.get_stock_availability_type() ) ) { %>
           <input type="hidden" name="state" value="addStock">
           <input type="hidden" name="stock_number" value="<%= detail.get_name() %>">
           <input type="submit" value="Order From ABRC">
            &nbsp;
        <% } %>
        <% if(detail.get_is_seed() != null && detail.get_is_seed().booleanValue()){  %>
           <input type="button" value="Order from NASC" 
           onClick="document.location.href='http://arabidopsis.info/BasicForm'"> (European Users)
        <% } %> &nbsp;
            
        <input type="button" value="View Order History" onClick="document.location.href='/servlets/Order?state=search&mode=stock&stock_numbers=<%= detail.get_name() %>'">           
           </form>
          </td>
      </tr>


    </table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
