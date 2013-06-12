<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="org.tair.abrc.stock.*, org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*, java.util.*, java.net.*, org.tair.bs.community.*"%>

<%!
String pageName ="Library";
%>

<% LibraryDetail object =(LibraryDetail)request.getAttribute("detail"); 

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


<table width="100%" cellpadding="1" border="0" cellspacing="0">

 <tr>
    <td colspan="3"><h1>library: <%= object.get_name() %></h1></td> 
 </tr>

   <!-- date_last_modified-->
   <% if ( object.get_date_last_modified() != null ) { %>  
    <tr  <%= myBgColor.toggleBgColor() %> >  

   <th class="sm" align="left">Date last modified</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%=  object.get_date_last_modified()  %></td>
 </tr>
  <% }  %>

 <tr <%= myBgColor.toggleBgColor() %> >
    <th class="sm" valign="top" align="left">Name</th>
    <td class="sm">&nbsp;&nbsp;</td>
    <td class="sm" width="80%"><%= object.get_name() %></td>
 </tr>

 <!-- alias -->
 <% if ( object.get_aliases() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %>>
        <th class=sm align=left valign=top" >Aliases</th>
        <td class=sm >&nbsp;&nbsp;</td>
        <td class=sm ><%= EmptyTextConverter.convert(object.get_alias_string()) %></td>
    </tr>
 <% } %>

 <!-- Tair Accession -->
    <tr  <%=myBgColor.toggleBgColor()%> >
         <th class="sm" align="left" valign="top">Tair Accession</th>
         <td class="sm" >&nbsp;</td>   
         <td class="sm" ><%=  EmptyTextConverter.convert(object.getAccession()) %></td>
    </tr>


 <% if ( object.get_description() != null ) { %>
    <tr <%=myBgColor.toggleBgColor() %>  >
        <th class="sm" align="left" valign="top" width="20%">Library Description</th>
        <td class="sm" width="5%">&nbsp;&nbsp;</td>	
        <td class="sm" width="80%" ><%= EmptyTextConverter.convert(object.get_description()) %></td>
    </tr>
 <% }  %>

 <!-- images -->
 <% if ( object.hasImages() ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign="top">
    <th class="sm" align="left">Images</th>
    <td class="sm">&nbsp;</td>
    <td class="sm">
    <% Iterator imageIter = object.getImages();
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


 <!--Abbreviation-->
 <%  if ( object.get_abbreviation() != null ) { %>
    <tr <%=myBgColor.toggleBgColor() %> >
        <th class="sm" align="left" valign="top" >Abbreviation</th>
        <td class="sm">&nbsp;&nbsp;</td>	
        <td class="sm" ><%= EmptyTextConverter.convert( object.get_abbreviation()) %></td>
    </tr>
 <%  } %>

 <!-- Host strain -->
 <% if ( object.hasHostStrain() ) { %>
    <tr <%=myBgColor.toggleBgColor() %> valign="top" >
        <th class="sm" align="left">Host Strain</th>
        <td class="sm">&nbsp;&nbsp;</td>	
        <td class="sm" >
            <table cellpadding="2">
                <tr>
                     <th class="small" align="left">Genus</th>
                     <th class="small" align="left">Species</th>
                     <th class="small" align="left">Strain Name</th>
                </tr>

                <tr>
                     <td class="small"><%= object.get_host_strain_genus() %></th>
                     <td class="small"><%= object.get_host_strain_species() %></th>
                     <td class="small"><a href="/servlets/TairObject?type=host_strain&id=<%= object.get_host_strain_id() %>"><%= object.get_host_strain_original_name() %></a></td>
                </tr>
             </table>
        </td>
    </tr>
 <%  } %>



<!--insert type-->
<%  if ( object.get_insert_type() != null ) { %>
<tr <%=myBgColor.toggleBgColor() %> >
        <th class="sm" align="left" valign="top" >Insert Type</th>
        <td class="sm">&nbsp;&nbsp;</td>	
        <td class="sm" ><%= EmptyTextConverter.convert( object.get_insert_type() ) %></td>
    </tr>
 <%  } %>

<!--insert size range-->

<%  if ( object.get_insert_size_range() != null ) { %>
<tr <%=myBgColor.toggleBgColor() %> >
        <th class="sm" align="left" valign="top" >Insert Size Range</th>
        <td class="sm">&nbsp;&nbsp;</td>	
        <td class="sm" ><%= EmptyTextConverter.convert( object.get_insert_size_range() ) %></td>
    </tr>
 <%  } %>

<!--restriction enzyme 1-->

<%  if ( object.get_restriction_enzyme_1_name() != null ) { %>
<tr <%=myBgColor.toggleBgColor() %> >
        <th class="sm" align="left" valign="top" >Restriction Enzyme 1</th>
        <td class="sm">&nbsp;&nbsp;</td>	
        <td class="sm" ><A href="/servlets/TairObject?type=restrictionenzyme&id=<%= object.get_restriction_enzyme_1_id() %>"><%= EmptyTextConverter.convert( object.get_restriction_enzyme_1_name() ) %></A></td>
    </tr>
 <%  } %>

<!--restriction enzyme 2-->
<%  if ( object.get_restriction_enzyme_2_name() != null ) { %>
<tr <%=myBgColor.toggleBgColor() %> >
        <th class="sm" align="left" valign="top" >Restriction Enzyme 2</th>
        <td class="sm">&nbsp;&nbsp;</td>	
        <td class="sm" ><A href="/servlets/TairObject?type=restrictionenzyme&id=<%= object.get_restriction_enzyme_2_id() %>"><%= EmptyTextConverter.convert( object.get_restriction_enzyme_2_name() ) %></A></td>
    </tr>
 <%  } %>




<!-- tfc_vector-->
  <% if ( object.get_vector_id() != null ) { %>
    <tr <%=myBgColor.toggleBgColor() %> >
        <th class="sm" valign="top" align="left">Vector</th>
        <td class="sm">&nbsp;</td>
        <td class="sm">
          <table cellpadding="2">
            <tr align="left">
               <th class="sm">name</th>
               <th class="sm">type</th>
            </tr>
            <tr>
               <td class="sm"><a href=/servlets/TairObject?type=vector&id=<%= object.get_vector_id() %> >
                <%=EmptyTextConverter.convert(object.get_vector_name()) %></a></td>
               <td class="sm"><%=EmptyTextConverter.convert( object.get_vector_type() )%></td>
	   </tr>
          </table>
         </td>
     </tr>
  <% } %>

<!-- external_link -->
 <%  if(object.get_external_links()!=null){ %>
    
  <tr <%= myBgColor.toggleBgColor() %> >
     <th class="sm" valign="top" align="left">External Link</th> 
     <td class="sm">&nbsp;&nbsp;</td>
     <td class="sm">
     <table>
 <%  Iterator iter = object.get_external_links();
         while ( iter.hasNext() ) {
           ExternalLinkObject elo = (ExternalLinkObject) iter.next();
           String web_site_name = elo.get_web_site_name();

  %>  <TR> 
     <td class="sm"><%= elo.get_external_HTML_link( web_site_name ) %>
     </td>
     </TR> 
<% } %>
     </TABLE></TD>
  </tr>
<% } %>

  <!-- annotation -->
	<% if ( object.get_annotations() != null ) { %>
	<tr <%= myBgColor.toggleBgColor() %> valign="top" >
	    <th class="sm" valign="top" align="left">Annotations</th>
	    <td class="sm">&nbsp;</td>
	    <td class="sm">
              <table>
	         <tr align="left">
	           <th class="sm">date</th>
	           <th class="sm">by</th>
  	           <th class="sm">annotation</th>
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
 <%
    String commentColor =  myBgColor.toggleBgColor() ;
 %>
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
    <% if ( object.get_attributions() != null ) { %>
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
               <td class="sm"><a href=/servlets/Community?action=view&type=<%= attribution.getCommunityLinkType() %>&communityID=<%= attribution.getCommunityId() %>><%= attribution.getCommunity().getName() %></a></td>
 	       <td class="sm" nowrap>&nbsp; &nbsp;</th>
               <td class="sm"><%= TextConverter.dateToString( attribution.getAttributionDate() ) %></td>
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

 <!-- publication -->
    <% if ( object.get_publications() != null ) { %>  
    <tr <%= myBgColor.toggleBgColor() %> >
	<th class="sm" valign="top" align="left">Publication</th>
	<td class="sm">&nbsp;&nbsp;</td>
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
            Iterator pubIter = object.get_publications();
            while ( pubIter.hasNext() ) {
                PublicationObject publication = (PublicationObject) pubIter.next();
          %>

	     <tr>
	        <td class="sm">
                   <a href=/servlets/TairObject?type=publication&id=<%= publication.get_reference_id() %>>
                   <%= EmptyTextConverter.convert( publication.get_title() )%></a>
                </td>
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
          <form action="/servlets/Order/current" method="POST"  onSubmit="orderFormWindow( this )">
          <input type="hidden" name="state" value="addStock">
          <TR <%= myBgColor.toggleBgColor() %> >
             <TH class="sm" align="left" valign="top">Stock Information<%= DefinitionsLookup.createPopupLink("Glossary","stock information") %></TH>
             <TD class="sm">&nbsp;</TD>
             <TD class="sm">
                 <table width="100%" border="0" cellpadding="1">
                    <TR align="left" >
                        <TH class="sm" align="left">Select</TH> 
                        <TH class="sm" align="left">Stock #<%= DefinitionsLookup.createPopupLink("Stock","name") %></TH> 
                        <TH class="sm" align="left">Availability<%= DefinitionsLookup.createPopupLink("StockAvailabilityType","stock_availability_type") %></TH>
                        <TH class="sm" align="left">Donor</TH>
			<TH class="sm" align="left" nowrap>Donor Stock #</TH>
                     </TR>
           
                  <%
                     Iterator iter = object.get_stocks();
                     StockObject stock = null;
                     while ( iter.hasNext() ) {
                        stock = (StockObject) iter.next();
                  %>

                     <TR align="left" > 
                        <TD class="sm" align="left" valign="top" >
                           <% if ( DataConstants.getAvailableStock().equals( stock.get_stock_availability_type() ) ) { %>
                               <input type="checkbox" name="stock_number" value="<%= stock.get_name() %>">
                           <% } %> &nbsp;
                        </TD>
                        <TD class="sm" align="left" valign="top"><a href="/servlets/TairObject?type=stock&id=<%= stock.get_stock_id() %>"><%= stock.get_name() %></a></TD> 
                        <TD class="sm" align="left" valign="top"><%= EmptyTextConverter.convert(stock.get_stock_availability_type()) %></TD>

                        <% if ( stock.hasDonors() ) {           
		               Iterator donorIter = stock.getDonors();
                               Donor donor = null;
		               boolean firstDonor = true;

                               // keep track of donor stock numbers and only show distinct numbers
                               List distinct = new ArrayList();
    		               String donorNumber = null;

                               while ( donorIter.hasNext() ) { 
		                   donor = (Donor) donorIter.next();

		                   donorNumber = donor.getDonorStockNumber();
		                   if ( donorNumber == null || distinct.contains( donorNumber ) ) {
                                       donorNumber = "";
                                   } else {
	  	                       distinct.add( donorNumber );
                                   }

                        %>


                               <!-- skip preceding columns if showing multiple donors -->
                               <% if ( !firstDonor ) { %>
                                  <tr>
                                     <td class="sm" colspan="3">&nbsp;</td>
                               <% } %>

                             <td class="sm"><a href="/servlets/TairObject?type=<%= donor.getCommunityType() %>&id=<%= donor.getCommunityID() %>"><%= donor.getDisplayName() %></a></td>
                             <td class="sm"><%= donorNumber %>&nbsp;</td>
                           </tr>

	                 <% firstDonor = false; %>
                       <% } %>
                   <% } else { %>
                       <td class="sm" colspan="2">&nbsp;</td>
                   <% } %>

                <% } // end main stock while  %>
                      <tr>
                         <td colspan="9">
                             <input type="submit" name="submit" value="Order from ABRC">
                             &nbsp; 
                             <input type="reset" name="reset" value="Reset">
                             &nbsp;
                         </td>
                     </tr>

              </table>
           </TD>
       </TR>

</form>

     <% } else { %>
        <TR <%= myBgColor.toggleBgColor() %> >
           <TH class="sm" valign="top" align="left">Stock</TH>
           <TD class="sm">&nbsp;</TD>
           <TD class="sm">not an ABRC stock</TD>
        </TR>
     <% } %>
      
    <!-- URLs -->
    <% if ( object.hasURLs() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Associated URLs</th>
            <td>&nbsp;</td>
            <td clas="sm" align="left">
            <%
            Iterator urlIter = object.getURLs();
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
  </TABLE>      
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
