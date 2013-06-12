<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="org.tair.tfc.*, org.tair.search.*, org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*, org.tair.abrc.stock.*, org.tair.bs.community.*" %>

<%!
String pageName = "Clone End Detail";
%>

<% CloneEndDetail object=(CloneEndDetail) request.getAttribute("detail");
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
       <td colspan="3"><b><font size="+1">CloneEnd: <%= object.get_clone_end_name() %></font></b></td>
    </tr>

 <!-- date_last_modified-->
   <% if ( object.get_date_last_modified() != null ) { %>  
    <tr  <%= myBgColor.toggleBgColor() %> >  

   <th class="sm" align="left">Date last modified</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%=  object.get_date_last_modified()  %></td>
 </tr>
  <% }  %>

 <!-- name -->
 <% if ( object.get_clone_end_name() != null ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
	 <th class="sm" valign="top" align="left">Name</th>
	 <td class="sm">&nbsp;&nbsp;</td>
	 <td class="sm"><%= object.get_clone_end_name() %></td>
     </tr>
 <% } %>

 <!-- alias -->
 <% if ( object.get_aliases() != null ) { %>
           <tr <%= myBgColor.toggleBgColor() %>>
              <th class=sm align=left valign=top" >Aliases</th>
              <td class=sm >&nbsp;&nbsp;</td>
              <td class=sm ><%= object.get_alias_string() %></td>
           </tr>
 <% } %>

 <!--TAIR Accession --> 
     <tr <%=myBgColor.toggleBgColor()%> >
              <th class="sm" align="left" valign="top">TAIR Accession</th>
              <td class="sm" >&nbsp;&nbsp;</td>
              <td class="sm" ><%=  object.getAccession() %></td>
     </tr>

 <% if ( object.get_clone_end_type() != null ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
	 <th class="sm" valign="top" align="left">Type</th>
	 <td class="sm">&nbsp;&nbsp;</td>
	 <td class="sm"><%= object.get_clone_end_type() %></td>
     </tr>
 <% } %>

 <!-- chromosome -->

 <TR <%=myBgColor.toggleBgColor()%> >
         <TH class="sm" align="left" valign="top">Chromosome</TH>
         <TD class="sm" >&nbsp;</TD>
         <TD class="sm" > <%= Units.translateChromosome( object.get_chromosome() ) %></TD>
  </TR>

<!--loci-->
 <% if(object.hasLocus()){ %>
 <tr <%= myBgColor.toggleBgColor() %> >
   <TH class="sm" align="left" valign="top">Associated Loci</TH>
   <TD class="sm">&nbsp;</TD> 
  
 <% String loci = "";
    Iterator loci_iter =  object.getLocus();
    while ( loci_iter.hasNext() ) { 
            TfcLocus locus = (TfcLocus)loci_iter.next();
            loci += "<A href= '/servlets/TairObject?type=locus&id="+locus.get_locus_id()+"'>" 
                    +locus.get_name() + "</A>, ";
    }
    loci = loci.substring (0, loci.lastIndexOf(",")); // remove the last ","
            
 %>
     <TD class="sm"><%= loci %></TD>
<% } %>
  

  <!-- tfc_clone -->
      <tr <%=myBgColor.toggleBgColor()%> valign="top"  >
	  <th class="sm" valign="top" align="left">Clone</th>
	  <td class="sm">&nbsp;</td>
	  <td class="sm">
	      <table width="450"> 
              <tr align="left">
                <th class="sm">name</th>
                <th class="sm">vector type</th>
                <th class="sm">insert type</th>
                <th class="sm">ABRC stock</th>
              </tr>
	      <tr align="left" valign="top"> 
                <td class="sm"><a href="/servlets/TairObject?type=clone&id=<%= object.get_clone_id() %>"><%=EmptyTextConverter.convert( object.get_clone_name()) %></a></td>
                <td class="sm"><%=EmptyTextConverter.convert( object.get_clone_vector_type()) %></td>
	        <td class="sm"><%=EmptyTextConverter.convert( object.get_clone_insert_type() )%></td>
                <td class="sm">
                    <% if ( object.get_stocks() != null ) { 
                          Iterator stockIter = object.get_stocks();
                          while ( stockIter.hasNext() ) {
                             TfcStock stock = (TfcStock) stockIter.next();
                     %>

                             <a href="/servlets/TairObject?type=stock&id=<%= stock.get_stock_id() %>"><%= EmptyTextConverter.convert( stock.get_name() ) %></a>

                       <% } %>
                     <% } else { %>
                         not an ABRC stock
                     <% } %>
                 </td>
              </tr>
            </table>
           </td>
	 </tr>

    <!-- MAP_LOCATIONS -->

    <% if ( object.hasGlobalAssignments() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
        <jsp:include page="/jsp/includes/map_locations.jsp" flush ="true"/>
    <% } %>

    <!-- CREATE LINKS TO VIEWERS IF POSSIBLE -->

    <% if ( object.hasGlobalAssignments() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Map Links</th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <% if ( object.showMapViewerLink() ) { %>
                    <a href="/servlets/mapper?value=<%= URLEncoder.encode( object.get_clone_end_name() ) %>&action=search">Map Viewer</a>
                <% } %>
                <% if ( object.get_is_agi_map() ) { %>
                    <!-- add in extra querystring params to get zoom level desired for clone ends alone -->
                    <%= HTMLFactory.createSeqViewerLinks( "Sequence Viewer", "cloneend", object.get_tair_object_id(), object.getAGIChromosomes(), "&nbsp;", "zoomto=6&rows=1" ) %>
                <% } %>
                &nbsp;&nbsp;&nbsp;
                <a href="/cgi-bin/gbrowse/arabidopsis/?name=<%= object.get_clone_end_name() %>">GBrowse</a>
                
            </td>
        </tr>
    <% } %>

    <!-- sequence  -->
       <% if ( object.get_sequences() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
	   <th class="sm" valign="top" align="left">Sequence</th>
	   <td class="sm">&nbsp;</td>
	   <td class="sm">
              <table>
                 <tr>
	            <th class="sm" align="left">Bio Source</th>
                    <th class="sm" align="left">Source</th>
	            <th class="sm" align="left">Date</th>
	            <th class="sm" align="left">GenBank Accession</th>
                    <th class="sm" align="left">Sequence</th>
                  </tr>

        <%
           Iterator seqIter = object.get_sequences();
           while ( seqIter.hasNext() ) {
               Sequence sequence = (Sequence) seqIter.next();
         %>
                 <tr>
                    <td class="sm"><%= EmptyTextConverter.convert( sequence.get_format_type() ) %></td>
                    <td class="sm"><%= EmptyTextConverter.convert( sequence.get_submission_source() ) %></td>
                    <td class="sm"><%= EmptyTextConverter.convert( sequence.get_submission_date() ) %></td>
                    <td class="sm"><% if ( sequence.get_ic_accession() != null ) { %><a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?db=nucleotide&val=<%= sequence.get_ic_accession() %>" target=_blank><%= sequence.get_ic_accession() %></a><% } %>&nbsp;</td>
		    <td class="sm"><a href="/servlets/TairObject?type=sequence&id=<%= sequence.get_nucleotide_seq_id() %>"><%= sequence.get_format_sequence_name() %></a></td>
	         </tr>
          <% } %>
	    </table>
	  </td>
      </tr>
     <% } %>

    <!-- MAP_FEATURE--> 

    <% if ( object.hasSubAssignments() ) { %>
        <tr <%= myBgColor.toggleBgColor() %>>
            <th class="sm" align="left" valign="top">Map Feature</th>
            <td class="sm">&nbsp;</td>
            <td class="sm" >
                <table width="100%" border="0" cellpadding="0">
                    <tr align="left">
                        <th class="sm">chrom</th>
                        <th class="sm">feature name</th>
                        <th class="sm">type</th>
                        <th class="sm">coordinates</th>
                        <th class="sm">attrib</th>
                    </tr>
                    <%
                    Iterator globalAssignmentIter = object.getGlobalAssignments();
                    while ( globalAssignmentIter.hasNext() ) { 
                        GlobalAssignment globalAssignment = (GlobalAssignment) globalAssignmentIter.next();
                        if ( globalAssignment.hasSubAssignments() ) { 
                            Iterator subAssignmentIter = globalAssignment.getSubAssignments();
                            while ( subAssignmentIter.hasNext() ) { 
                                LocalAssignment subAssignment = (LocalAssignment) subAssignmentIter.next();
                                %>
                                <tr>
                                    <td class="sm"><%= EmptyTextConverter.convert( subAssignment.getMapElementChromosome() ) %>&nbsp;</td>
                                    <td class="sm"><a href="/servlets/TairObject?type=<%= subAssignment.getLinkType() %>&id=<%= subAssignment.getLinkId() %>"> <%= subAssignment.getMapElementName() %></a></td>
                                    <td class="sm"><%= subAssignment.getMapElementType() %></td>
                                    <td class="sm">
                                        <%= EmptyTextConverter.convert( subAssignment.getFormatStartPosition() ) %> - 
                                        <%= EmptyTextConverter.convert( subAssignment.getFormatEndPosition() ) %>
                                        <%= EmptyTextConverter.convert( subAssignment.getUnits() ) %>
                                    </td>
                                    <td class="sm"><% if ( globalAssignment.hasDetails() ) { %><a href="/servlets/TairObject?type=global_assignment&id=<%= globalAssignment.getGlobalAssignmentId() %>">details</a><% } %></td>
                                </tr>
                            <% } %>
                        <% } %>
                    <% } %>
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
	              <th class="sm" >&nbsp; &nbsp;</th>
	              <th class="sm">source</th>
	              <th class="sm">&nbsp; &nbsp;</th>
	              <th class="sm">date</th>
	          </tr>

                  <%
                    Iterator pubIter = object.get_publications();
                    while ( pubIter.hasNext() ) {
                         PublicationObject publication = (PublicationObject) pubIter.next();
		  %>

	          <tr>
	             <td class="sm"><a href=/servlets/TairObject?type=publication&id=<%= publication.get_reference_id() %>><%= EmptyTextConverter.convert( publication.get_title() )%></a></td>
 	             <td class="sm">&nbsp; &nbsp;</th>
                     <td class="sm"><%=EmptyTextConverter.convert( publication.get_pub_source_name() )%></td>
 	             <td class="sm">&nbsp; &nbsp;</th>
                     <td class="sm"><%=EmptyTextConverter.convert( publication.get_year() )%></td>
                 </tr>
                <% } %>
                </table>
	     </td>
           </tr>
        <% } %>

 
 </TABLE>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
