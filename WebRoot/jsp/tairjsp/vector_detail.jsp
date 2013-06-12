<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, org.tair.abrc.stock.*, java.net.*, org.tair.bs.community.*"%>

<%!
String pageName = "Vector Detail";
%>

<% VectorDetail object = (VectorDetail) request.getAttribute("detail"); 
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
    <td colspan="3"><b><font size="+1">Vector: <%= object.get_original_name() %></font></b></td>
  </tr>

  <!-- date_last_modified-->
   <% if ( object.get_date_last_modified() != null ) { %>  
    <tr  <%= myBgColor.toggleBgColor() %> >  

   <th class="sm" align="left">Date last modified</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%=  object.get_date_last_modified()  %></td>
 </tr>
  <% }  %>

<%-- <!-- vector -->
 <% if ( object.get_vector_name() != null ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
	 <th class="sm" valign="top" align="left">Name</th>
	 <td class="sm">&nbsp;&nbsp;</td>
	 <td class="sm"><%= EmptyTextConverter.convert(object.get_vector_name()) %></td>
     </tr> 
 <% } %>
--%>
  <!-- original_name-->
   <% if ( object.get_original_name() != null ) { %>  
    <TR  <%= myBgColor.toggleBgColor() %> >  

     <TH class="sm" align="left">Name</TH>
        <TD class="sm">&nbsp;&nbsp;</TD>
        <TD class="sm"><%=  object.get_original_name()  %></TD>
   </TR>
  <% }  %>

  <tr <%=myBgColor.toggleBgColor() %> >
      <th class="sm" align="left" valign="top">Type</th>
      <td class="sm" >&nbsp;&nbsp;</td>
      <td class="sm" ><%=EmptyTextConverter.convert( object.get_vector_type() ) %></td>
  </tr>

  <tr  <%=myBgColor.toggleBgColor()%> >
       <th class="sm" align="left" valign="top">Tair Accession</th>
       <td class="sm" >&nbsp;</td>   
       <td class="sm" ><%=  EmptyTextConverter.convert(object.getAccession()) %></td>
  </tr>

 
<% if ( object.get_ic_accession() != null ) { %>
 <tr <%= myBgColor.toggleBgColor() %> >
    <th class="sm" align="left">GenBank Accession</th>
    <td class="sm">&nbsp;&nbsp;</td>
    <td class="sm"><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?db=nucleotide&val=<%= object.get_ic_accession() %>" target=_blank><%= object.get_ic_accession() %></a></td>
 </tr>
<% } %>


 <!-- alias -->
  <% if ( object.get_aliases() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %>>
        <th class=sm align=left valign=top" >Aliases</th>
        <td class=sm >&nbsp;&nbsp;</td>
        <td class=sm ><%= EmptyTextConverter.convert(object.get_alias_string()) %></td>
    </tr>
  <% } %>


<!--description-->
 <% if ( object.get_description() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %>>
        <th class=sm align=left valign=top" >Description</th>
        <td class=sm >&nbsp;&nbsp;</td>
        <td class=sm ><%= EmptyTextConverter.convert(object.get_description()) %></td>
    </tr>
  <% } %>

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


<!--selectable markers-->

 <% if ( object.get_selectable_markers() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %>>
        <th class=sm align=left valign=top" >Selectable Markers</th>
        <td class=sm >&nbsp;&nbsp;</td>
        <td class=sm ><%= EmptyTextConverter.convert(object.get_selectable_markers()) %></td>
    </tr>
  <% } %>

<!--promoter reporter name-->
 <% if ( object.get_promoter_name() != null || object.get_reporter_name() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %>>
        <th class=sm align=left valign=top" >Promoter:Reporter Names</th>
        <td class=sm >&nbsp;&nbsp;</td>
        <td class=sm ><%= EmptyTextConverter.convert(object.get_promoter_name()) %>:
                      <%= EmptyTextConverter.convert(object.get_reporter_name()) %>
         </td>
    </tr>
<% } %>

<!--promoter reporter info-->
 <% if ( object.get_promoter_info() != null || object.get_reporter_info() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %>>
        <th class=sm align=left valign=top" >Promoter:Reporter Information</th>
        <td class=sm >&nbsp;&nbsp;</td>
        <td class=sm ><%= EmptyTextConverter.convert(object.get_promoter_info()) %>:
                      <%= EmptyTextConverter.convert(object.get_reporter_info()) %>
         </td>
    </tr>
<% } %>

<!-- promoter desc-->
 <%-- if ( object.get_promoter_description() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %>>
        <th class=sm align=left valign=top" >Promoter Description</th>
        <td class=sm >&nbsp;&nbsp;</td>
        <td class=sm ><%= EmptyTextConverter.convert(object.get_promoter_description()) %></td>
    </tr>
  <% } --%>



<!--reporter desc-->
 <%-- if ( object.get_reporter_description() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %>>
        <th class=sm align=left valign=top" >Reporter Description</th>
        <td class=sm >&nbsp;&nbsp;</td>
        <td class=sm ><%= EmptyTextConverter.convert(object.get_reporter_description()) %></td>
    </tr>
  <% } --%>

<!--antibiotic resistance-->
<% if ( object.get_antibiotic_resistance() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %>>
        <th class=sm align=left valign=top" >Antibiotic Resistance</th>
        <td class=sm >&nbsp;&nbsp;</td>
        <td class=sm ><%= EmptyTextConverter.convert(object.get_antibiotic_resistance() ) %></td>
    </tr>
  <% } %>

<!-- library_vector -->
  <% if ( object.get_library() != null ) { %> 
  <tr <%= myBgColor.toggleBgColor() %>>
      <th class=sm align=left valign=top" >Library</th>
      <td class="sm">&nbsp;</td>
      <td class="sm">
    <%
        Iterator libIter = object.get_library();
        while ( libIter.hasNext() ) {
              TfcLibrary library = ( TfcLibrary) libIter.next();
    %> 
      <a href=/servlets/TairObject?type=library&id=<%= library.get_library_id() %>><%= EmptyTextConverter.convert( library.get_name() ) %></A><br>
    <% } %>
      </td>
   </tr>
   <% } %>


   <!-- NT sequence  -->
    <% if ( object.hasNTSequences() ) { %>
      <TR <%= myBgColor.toggleBgColor() %> >
	   <TH class="sm" valign="top" align="left">Sequence</TH>
	   <TD class="sm">&nbsp;</TD>
	   <TD class="sm">
              <table>
                 <TR>
	            <TH class="sm" align="left">Bio Source</TH>
                    <TH class="sm" align="left">Source</TH>
	            <TH class="sm" align="left">Date</TH>
	            <TH class="sm" align="left">GenBank Accession</TH>
                    <TH class="sm" align="left">Sequence</TH>
                  </TR>

        <%
           Iterator seqIter = object.getNTSequences();
           while ( seqIter.hasNext() ) {
               Sequence sequence = (Sequence) seqIter.next();
         %>
                 <TR>
                    <TD class="sm"><%= EmptyTextConverter.convert( sequence.get_format_type() ) %></TD>
                    <TD class="sm"><%= EmptyTextConverter.convert( sequence.get_submission_source() ) %></TD>
                    <TD class="sm"><%= EmptyTextConverter.convert( sequence.get_submission_date() ) %></TD>
                    <TD class="sm"><% if ( sequence.get_ic_accession() != null ) { %><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?db=nucleotide&val=<%= sequence.get_ic_accession() %>" target=_blank><%= sequence.get_ic_accession() %></a><% } %>&nbsp;</TD>
		    <TD class="sm"><a href="/servlets/TairObject?type=sequence&id=<%= sequence.get_nucleotide_seq_id() %>"><%= sequence.get_format_sequence_name() %></a></TD>
	         </TR>
          <% } %>
	    </table>
	  </TD>
      </TR>
     <% } %>


 <!-- external_link -->
 <%  if(object.get_external_links()!=null){ %>
    
  <tr <%= myBgColor.toggleBgColor() %> >
     <th class="sm" align="left" valign=top">External Link</th> 
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
     <% 
       Iterator stockIter = object.get_stocks(); 
       while ( stockIter.hasNext() ) {
          StockObject stock = (StockObject) stockIter.next();
     %>

      <tr <%= myBgColor.toggleBgColor() %> >
         <th class="sm" valign="top" align="left">Stock</th>
         <td class="sm">&nbsp;</td>
         <td class="sm">
            <table>
                <tr>
                    <th class="sm" align="left">Stock #<%= DefinitionsLookup.createPopupLink("Stock","name") %></th> 
	            <th class="sm">&nbsp;&nbsp;</th>
                    <th class="sm" align="left">Donor</th>
	            <th class="sm">&nbsp;&nbsp;</th>
                    <th class="sm" align="left">Donor Stock #</th>
                </tr>

                <tr>
                    <td class="sm"><a href="/servlets/TairObject?type=stock&id=<%= stock.get_stock_id() %>"><%= stock.get_name() %></a></td>
		    <td class="sm">&nbsp;&nbsp;</td>

                    <% if ( stock.hasDonors() ) { 
                           Donor donor = null;
                           boolean firstDonor = true;

                           // keep track of donor stock numbers and only show distinct numbers
                           List distinct = new ArrayList();
 		           String donorNumber = null;

                           for ( Iterator iter = stock.getDonors(); iter.hasNext(); ) {
                                donor = (Donor) iter.next();

		                donorNumber = donor.getDonorStockNumber();
		                if ( donorNumber == null || distinct.contains( donorNumber ) ) {
                                    donorNumber = "";
                                } else {
	  	                    distinct.add( donorNumber );
                                }


                                if ( !firstDonor ) { 
                    %>

                                   <tr>
                                       <td colspan="2">&nbsp;</td>
                             <% } %>
                          
                           <td class="sm"><a href="/servlets/TairObject?type=<%= donor.getCommunityType() %>&id=<%= donor.getCommunityID() %>"><%= donor.getDisplayName() %></td>
			   <td class="sm">&nbsp;&nbsp;</td>
                           <td class="sm"><%= donorNumber %></td>
                           
                             <% firstDonor = false; %>
                        <% } %>
                    <% } else { %>
                          <td colspan="3">&nbsp;</td>
                    <% } %>
                </tr>
           </table>
         </td>
      </tr>

      <tr>
         <td class="sm" colspan="3">
            <% if ( DataConstants.getAvailableStock().equals( stock.get_stock_availability_type() ) ) { %>
              <form action="/servlets/Order/current" onSubmit="orderFormWindow( this ) ">
                <input type="hidden" name="state" value="addStock">
                <input type="hidden" name="stock_number" value="<%= stock.get_name() %>">
	        <input type="submit" value="Order from ABRC">
              </form>
            <% } else { %>
               Stock not available for ordering
            <% } %>
         </td>
       </tr>
     <% } %>

 <% } else { %>
     <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" valign="top" align="left">Stock</th>
        <td class="sm">&nbsp;</td>
        <td class="sm">not an ABRC stock</td>
     </tr>
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
  </td></tr>
  <% } %>


  </TABLE>      
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
