<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*, java.util.*, org.tair.bs.community.*" %>

<%!
String pageName = "Dna Fragment Detail";
%>

<% DnaFragmentDetail detail = (DnaFragmentDetail) request.getAttribute("detail");%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<table width="100%" border="0" colspan="2" cellspacing="0" >
     <tr>
         <td colspan="3"><b><font size="+1">Dna Fragment: <%= detail.get_original_name() %></font></b></td>
     </tr>

     <tr <%= myBgColor.toggleBgColor() %> >
	 <th class="sm" valign="top" align="left">Name</th>
	 <td class="sm">&nbsp;&nbsp;</td>
	 <td class="sm"><%= detail.get_original_name() %></td>
     </tr>


     <tr <%= myBgColor.toggleBgColor() %> >
	 <th class="sm" valign="top" align="left">Type</th>
	 <td class="sm">&nbsp;&nbsp;</td>
	 <td class="sm"><%= detail.get_type() %></td>
     </tr>


   <% if ( detail.get_date_entered() != null ) { %>  
     <tr <%= myBgColor.toggleBgColor() %> >  
         <th class="sm" align="left">Date entered</th>
         <td class="sm">&nbsp;&nbsp;</td>
         <td class="sm"><%=  detail.get_date_entered()  %></td>
     </tr>
   <% }  %>
 

   <% if ( detail.hasAliases() ) { %>
     <tr <%= myBgColor.toggleBgColor() %>>
         <th class=sm align=left valign=top" >Aliases</th>
         <td class=sm >&nbsp;&nbsp;</td>
         <td class=sm ><%= detail.get_alias_string() %></td>
     </tr>
   <% } %>


    <!-- MAP_LOCATIONS -->

    <% if ( detail.hasGlobalAssignments() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
        <jsp:include page="/jsp/includes/map_locations.jsp" flush ="true"/>
    <% } %>

 <% if ( detail.hasSequences() ) { %>
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
       Iterator seqIter = detail.get_sequences();
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

 <% if ( detail.hasFlankingSequences() ) { %>

  <tr <%= myBgColor.toggleBgColor() %> valign="top" > 
      <th class="sm" align=left valign=top>Flanking Sequences</th> 
      <td class="sm">&nbsp;</td>
      <td class="sm">

      <%   
        Iterator seqIter = detail.get_flanking_sequence();
        while ( seqIter.hasNext() ) {
           TfcFlankingSequence sequence = (TfcFlankingSequence) seqIter.next();
           String header = ( sequence.get_type() != null && sequence.get_type().equalsIgnoreCase( "PCR_primer" ) ) ? "primer" : "sequence";
       %>
           <b><%= header %> 1:</b> <%= EmptyTextConverter.convert( sequence.get_sequence1() ) %><br>
           <b><%= header %> 2:</b> <%= EmptyTextConverter.convert( sequence.get_sequence2() ) %>

     <% } %> 

   </td>
  </tr>
 <% } %>
 
 <%  if ( detail.has_external_links() ) { %>
  <tr <%= myBgColor.toggleBgColor() %> >
     <th class="sm" align="left" valign=top">External Link</th> 
     <td class="sm">&nbsp;&nbsp;</td>
     <td class="sm">
     <table>
 <%  Iterator iter = detail.get_external_links();
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



<% myBgColor.toggleBgColor(); %> 
    <% if ( detail.hasAnnotations() ) {  %>
       <TR>
          <TD colspan=3 >
                 <table cellpadding="2" width="100%" border=0 cellspacing="0" >

                 <% Iterator sourceIter = detail.getAnnotationSources();
                     boolean firstSource = true ;
		     while ( sourceIter.hasNext() ) {
		     String annotated_by = (String) sourceIter.next();
     %>

     <% if (! firstSource){  %> 
        <TR <%= myBgColor.sameBgColor()  %>>
           <TD colspan=5><HR></TD>
        </TR> 
     <% } %>

        <tr <%= myBgColor.sameBgColor()  %> valign="top" >

          <th class="sm" valign="top" align="left"><%= EmptyTextConverter.convert( annotated_by) %>'s comment</th>
          <td class="sm">&nbsp;</td>   

           <% Iterator annotations =  detail.getAnnotations ( annotated_by );
              boolean first = true;
              while ( annotations.hasNext()){
                  AnnotationObject annotation= (AnnotationObject)annotations.next();
                   if (!first){
            %>
         <TR <%= myBgColor.sameBgColor()  %> >
            <td class="sm" colspan=2 >&nbsp;</td>       
                   <% } %>

            <td class="sm"><%= EmptyTextConverter.convert( annotation.get_short_annotation() ) + " " + EmptyTextConverter.convert( annotation.get_long_annotation() ) %></td>
            <td class="sm">&nbsp;</td>
            <td class="sm" align=left valign=top><%= EmptyTextConverter.convert( annotation.get_date_entered() )%></td>
         </tr> 

             <% first = false; %>
         <% } %>

        <% firstSource = false; %>
      <% } %>

        </table>
       </TD>
    </TR>
<% } %>

<!-- attribution -->
<% if ( detail.hasAttributions() ) { %>
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
  <% if ( detail.hasCommunicationReferences() ) { %>  
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
  

 <!-- publication -->
  <% if ( detail.hasPublications() ) { %>  
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
  
  </table>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
