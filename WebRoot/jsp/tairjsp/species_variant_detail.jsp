<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="org.tair.querytools.*, org.tair.community.*, org.tair.utilities.*, java.util.*, org.tair.tfc.*, org.tair.abrc.stock.*, org.tair.bs.community.*" %>

<%!
String pageName = "Species Variant Detail";
%>
<%    
   SpeciesVariantDetail object = (SpeciesVariantDetail) request.getAttribute( "detail" );
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


<table width="100%" border="0" colspan="2" cellspacing="0" >
  <tr>
    <td colspan="3"><b><font size="+1">Ecotype/Species: <%= object.get_format_name() %></font></b></td>
  </tr>


 <!-- species variant -->
 <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left">Name</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%= object.get_format_name() %></td>
 </tr>

 <% if (object.getAliasesString() != null){  %>
    <tr <%= myBgColor.toggleBgColor() %>>
        <th class="sm" align="left">Alias</th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm"><%= object.getAliasesString() %></td>
    </tr>
<%  }  %>

 <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left" width="10">Abbreviated Name</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%= object.get_abbrev_name() %></td>
 </tr>
 

 <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left">Tair Accession</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%= object.getAccession() %></td>
 </tr>

 <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left">Type</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%= object.get_speciesvariant_type() %></td>
 </tr>


<!-- date_last_modified-->
   <% if ( object.get_date_last_modified() != null ) { %>  
    <tr  <%= myBgColor.toggleBgColor() %> >  

   <th class="sm" align="left">Date last modified</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%=  object.get_date_last_modified()  %></td>
   </tr>
  <% }  %>

 <!-- taxon -->
 <% if ( object.get_taxon_id() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign="top">
      <th class="sm" align="left">Taxon</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm">
         <table cellpadding="2">
            <tr valign="botton">
              <th class="sm" align="left">Genus</th>
              <th class="sm" align="left">Species</th>
              <th class="sm" align="left" nowrap>Common Name</th>
              <th class="sm" align="left">Taxonomy</th>
            </tr>
 
            <tr valign="top">
              <td class="sm"><%= EmptyTextConverter.convert( object.get_genus() ) %></td>
              <td class="sm"><%= EmptyTextConverter.convert( object.get_species() ) %></td>
              <td class="sm"><%= EmptyTextConverter.convert( object.get_common_name() ) %></td>
              <td class="sm"><%= EmptyTextConverter.convert( object.get_taxonomy() ) %></td>
            </tr>
         </table>
     </td>
    </tr>
   <% } %>
 
 <!-- alias -->
 <% if ( object.hasTaxonAliases() ) { %>
 <tr  <%= myBgColor.toggleBgColor() %> >  

   <th class="sm" align="left">Taxon Aliases</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td> <%=   EmptyTextConverter.convert( object.getTaxonAliasString()) %>
      </td>        
           
 </tr>
 <% } %>


 <% if ( object.hasCollectors() ) { %>
 <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left">Collector</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm">
           <% Iterator collectorIter = object.getCollectors();
              ListCommunity collector = null;
              while ( collectorIter.hasNext() ) { 
                 collector = (ListCommunity) collectorIter.next();
           %>

               <a href="/servlets/TairObject?type=<%= collector.getCommunityType() %>&id=<%= collector.getCommunityID() %>"><%= collector.getDisplayName() %></a><br>
           <% } %>
      </td>
 </tr>
 <% } %>

 <% if ( object.get_date_collected() != null ) { %>
  <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left">Date Collected</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%= object.get_date_collected() %></td>
  </tr>
 <% } %>



 <% if ( object.get_country() != null ) { %>
  <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left">Country</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%= object.get_country() %></td>
   </tr>
  <% } %>


  <% if ( object.get_location() != null ) { %>
   <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left">Location</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%= object.get_location() %></td>
   </tr>
  <% } %>

 

 <% if ( object.get_habitat() != null ) { %>
   <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left">Habitat</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%= object.get_habitat() %></td>
   </tr>
 <% } %>

 <% if ( object.get_daily_temperature() != null ) { %>
   <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left">Average Temperature</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%= object.get_daily_temperature() %></td>
   </tr>
 <% } %>

 <% if ( object.get_monthly_precipitation() != null ) { %>
   <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left">Monthly Precipitation</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%= object.get_monthly_precipitation() %></td>
   </tr>
 <% } %>

 <% if ( object.get_min_altitude() != null || object.get_max_altitude() != null ) { %>
   <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left">Altitude (min/max)</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm">
           <%= EmptyTextConverter.convert( object.get_min_altitude() ) %> /
           <%= EmptyTextConverter.convert( object.get_max_altitude() ) %>
      </td>
   </tr>
 <% } %>


 <% if ( object.get_min_latitude() != null || object.get_max_latitude() != null ) { %>
   <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left">Latitude (min/max)</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm">
           <%= EmptyTextConverter.convert( object.get_min_latitude() ) %> /
           <%= EmptyTextConverter.convert( object.get_max_latitude() ) %>
      </td>
   </tr>
 <% } %>


 <% if ( object.get_min_longitude() != null || object.get_max_longitude() != null ) { %>
   <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left">Longitude (min/max)</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm">
           <%= EmptyTextConverter.convert( object.get_min_longitude() ) %> /
           <%= EmptyTextConverter.convert( object.get_max_longitude() ) %>
      </td>
   </tr>
 <% } %>

 <% if ( object.get_num_plants() != null ) { %>
   <tr <%= myBgColor.toggleBgColor() %>>
      <th class="sm" align="left">Number of Plants Collected</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%= object.get_num_plants() %></td>
   </tr>
 <% } %>

 <% if ( object.hasGermplasms() ) { %>
   <tr <%= myBgColor.toggleBgColor() %> valign="top">
      <th class="sm" align="left">Germplasms</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm">
          <% Germplasm germplasm = null;
             Iterator germplasmIter = object.getGermplasms();
           %>
          <table cellpadding="2" border="0">
              <tr>
                 <th class="sm" align="left">name</th>
                 <th class="sm" align="left">description</th>
              </tr>
 
            <% while ( germplasmIter.hasNext() ) {
                 germplasm = (Germplasm) germplasmIter.next();
            %>
              <tr valign="top">
                  <td class="sm"><a href="/servlets/TairObject?type=germplasm&id=<%= germplasm.get_tair_object_id() %>"><%= germplasm.get_name() %></a></td>
                  <td class="sm"><%= EmptyTextConverter.convert( germplasm.get_description() ) %></td>
              </tr>
            <% } %>

          </table>
       </td>
   </tr>
  <% } %> 

 
 <!-- annotation -->
 <% if ( object.hasAnnotations() ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign="top" >
	<th class="sm" valign="top" align="left">Annotations</th>
	<td class="sm">&nbsp;</td>
	<td class="sm">
        <table>
	    <tr align="left">
	        <th class="sm" align="left">date</th>
	        <th class="sm" align="left">by</th>
  	        <th class="sm" align="left">annotation</th>
	    </tr>

      <% 
         Iterator annotationIter = object.get_annotations();
         while ( annotationIter.hasNext() ) {
             AnnotationObject annotation = (AnnotationObject) annotationIter.next();
      %>

            <tr valign="top">
                <td class="sm"><%= EmptyTextConverter.convert( annotation.get_date_entered() )%></td>
                <td class="sm"><%= EmptyTextConverter.convert( annotation.get_annotation_source() ) %></td>
                <td class="sm" colspan="2"><%= EmptyTextConverter.convert( annotation.get_short_annotation() ) + " " + EmptyTextConverter.convert( annotation.get_long_annotation() ) %></td>
            </tr>
      <% } %>
         </table>
         </td>
      </tr>
  <% } %>	

  <!--comment-->
 <% String commentColor =  myBgColor.toggleBgColor(); %>
        <tr  <%=  commentColor  %>  valign="top">
           <th class="sm" align="left">Comments (shows only the most recent comments by default)
           <form action="/servlets/updater" method="post">  
             <input type="hidden" name="type" value="notepad">
             <input type="hidden" name="update_action" value="add">
             <input type="hidden" name="tair_object_id" value="<%= object.get_tair_object_id() %>">
             <input type="hidden" name="accession" value="<%= object.getAccession() %>" >

            <% String hideText = hidden ? "Show Comments" : "Hide Comments"; %>
            <% boolean hideOption = !hidden; %>
            <% String allText = showAll ? "Show Recent Comments" : "Show All Comments"; %>
            <% boolean showAllOption = !showAll; %>

           </th>

        <% if ( !hidden && object.hasNotepad() ) { %>
                <td class="sm">&nbsp;</td>
                <td class="sm">
                  <table cellpadding="2" width="100%">
                    <tr align="left">
                      <th class="sm">entered by</th>
	              <th class="sm">date</th>
	              <th class="sm">comment</th>
	            </tr>
                 <%                          
                   Iterator noteIter = object.getNotepad( showAll );
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
              </td>


        <% } else { %>
           <td class="sm" colspan="2"> &nbsp;
          </td>
        <% } %>
      </tr>
      <tr<%= commentColor  %>  valign="top"  %> 
          <td class="sm" colspan=3 align=center>
          <input type="submit" VALUE="Add My Comment">&nbsp;&nbsp;
          <input type="button" value="<%= hideText %>" onClick="document.location.href='/servlets/TairObject?accession=<%= object.getAccession() %>&hideNote=<%= hideOption %>'">&nbsp;&nbsp;
          <input type="button" value="<%= allText %>" onClick="document.location.href='/servlets/TairObject?accession=<%= object.getAccession() %>&showAllNote=<%= showAllOption %>'"> 
           </td>
           
      </tr>
   </form>



     <!-- attribution -->
	<% if ( object.hasAttributions() ) { %>
            <tr <%= myBgColor.toggleBgColor() %> >
                <th class="sm" valign="top" align="left">Attribution</th>
                <td class="sm">&nbsp;</td>
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
                   for ( BsAttribution attribution : object.get_attributions() ) {
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
  <% if ( object.hasCommunicationReferences() ) { %>  
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


 <!-- publication -->
  <% if ( object.hasPublications() ) { %>  
     <tr <%= myBgColor.toggleBgColor() %> >
	 <th class="sm" valign="top" align="left">Publication</th>
	 <td class="sm">&nbsp;&nbsp;</td>
	 <td class="sm">
       	 <table>
	     <tr align="left">
	       <th class="sm" align="left">title</th>
	       <th class="sm" nowrap>&nbsp; &nbsp;</th>
	       <th class="sm" align="left">source</th>
	       <th class="sm" nowrap>&nbsp; &nbsp;</th>
	       <th class="sm" align="left">date</th>
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
  
   <!-- stock --> 
 <% if ( object.hasStocks() ) { %>
   <form action="/servlets/Order/current" onSubmit="orderFormWindow( this ) ">
   <input type="hidden" name="state" value="addStock">
    <tr <%= myBgColor.toggleBgColor() %> >
     <th class="sm" valign="top" align="left">Stock Information</th>
     <td class="sm">&nbsp;</td>
     <td class="sm">
       <table cellpadding="1" width="100%" border="0">
           <tr align="left" >
                <TH class="sm" align="left">Select</TH> 
                <TH class="sm" align="left">&nbsp;</TH>
                <TH class="sm" align="left">Name</TH> 
                <TH class="sm" align="left">&nbsp;</TH> 
                <TH class="sm" align="left">Availability</TH>
                <TH class="sm" align="left">&nbsp;</TH>   
                <TH class="sm" align="left">Donor</TH>
            </tr>

        <% 
           Iterator stockIter = object.getStocks();
           while ( stockIter.hasNext() ) {
             StockObject stock = (StockObject) stockIter.next();
        %>
 
           <tr>
             <TD class="sm" align="left" valign="top" >
                <% if ( DataConstants.getAvailableStock().equals( stock.get_stock_availability_type() ) ) { %>
                  <input type="checkbox" name="stock_number" value="<%= stock.get_name() %>">
                <% } %> &nbsp;
             </TD>
             <TD class="sm" align="left">&nbsp;</TD>
             <TD class="sm" align="left" valign="top" >
               <a href="/servlets/TairObject?type=stock&id=<%= stock.get_stock_id() %>"><%= stock.get_name() %></a>
             </TD> 
             <TD class="sm" align="left">&nbsp;</TD>
             <TD class="sm" align="left" valign="top">
               <%= EmptyTextConverter.convert(stock.get_stock_availability_type()) %>
             </TD>
             <TD class="sm" align="left">&nbsp;</TD>
             <TD class="sm">
           <% if ( stock.hasDonors() ) {    
          Iterator donorIter = stock.getDonors();
          Donor donor = null;
          while ( donorIter.hasNext() ) { 
             donor = (Donor) donorIter.next();
     %>
             <a href="/servlets/TairObject?type=<%= donor.getCommunityType() %>&id=<%= donor.getCommunityID() %>">
             <%= donor.getDisplayName() %></a><BR>
             
          <% } %>
         <% } %>&nbsp;</TD> 
       </TR>
          <% } // end main stock while  %>
          </table>
         </td>
         
        </TR>
        
         <tr>
           <td  colspan=3>
          <input type="submit" name="submit" value="Order from ABRC">
          &nbsp; <input type="reset" name="reset" value="Reset">
          &nbsp; <input type="button" value="Order from NASC" onClick="document.location.href='http://seeds.nottingham.ac.uk/Nasc/action.lasso?-response=/Nasc/information/ordering.lasso'"> (European Users)
           </td>
          <%-- <td class="sm" colspan="2">&nbsp;</td>
           <td class="sm" ><input type="submit" value="Order from ABRC"></td>--%>
         </tr>
     </form>
  <% } else { %>
     <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" valign="top" align="left">Stocks</th>
         <td class="sm">&nbsp;</td>
         <td class="sm">not an ABRC stock</td>
    </tr>
  <% } %>


</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
