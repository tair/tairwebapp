<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.search.*, org.tair.utilities.*, java.util.*, java.net.*, org.tair.bs.community.*"%>

<%!
String pageName = "Contig Detail";
%>

<% ContigDetail object = (ContigDetail) request.getAttribute("detail"); 
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
<table width="100%" border="0" colspan="2" cellspacing="0" >
<tr>
  <td colspan="3"><b><font size="+1">Contig: <%= object.get_name() %></font></b></td>
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
 <% if ( object.get_name() != null ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
	 <th class="sm" valign="top" align="left">Name</th>
	 <td class="sm">&nbsp;&nbsp;</td>
	 <td class="sm"><%= object.get_name() %></td>
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

 <!-- tair accession -->
    <tr  <%=myBgColor.toggleBgColor()%> >
         <th class="sm" align="left" valign="top">Tair Accession</th>
         <td class="sm" >&nbsp;</td>   
         <td class="sm" ><%=  object.getAccession() %></td>
    </tr>

 <!-- tfc_contig --> 
    <tr <%=myBgColor.toggleBgColor()%> >
        <th class="sm" valign="top" align="left">Contig</th>
        <td class="sm">&nbsp;</td>
        <td class="sm">
          <table width="100%">
            <tr align="left">
               <th class="sm">chromosome</th>
               <th class="sm">length</th>
               <th class="sm">group name</th>
               <th class="sm">type</th>
               <th class="sm">date last modified</th>
            </tr>
            <tr>
               <td class="sm"><%= Units.translateChromosome( object.get_chromosome() ) %></td>
               <td class="sm"><%=EmptyTextConverter.convert(object.get_length()+object.get_units() )%></td>
               <td class="sm"><%=EmptyTextConverter.convert(object.get_group_name())%></td>
               <td class="sm"><%=EmptyTextConverter.convert(object.get_type())%></td>
               <td class="sm"><%=EmptyTextConverter.convert(object.get_date_last_modified())%></td>
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
             <a href="/servlets/mapper?value=<%= URLEncoder.encode( object.get_name() ) %>&action=search">Map Viewer</a>
          <% } %>

          <% if ( object.get_is_agi_map() ) { %>
              &nbsp;&nbsp;&nbsp;
             <%= HTMLFactory.createSeqViewerLinks( "Sequence Viewer", "contig", object.get_tair_object_id(), object.getAGIChromosomes(), "&nbsp;" ) %>
          <% } %>
          &nbsp;
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

   </TABLE>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
