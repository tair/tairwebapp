<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*, org.tair.search.*, org.tair.querytools.*, org.tair.utilities.*, java.util.*, java.net.*, org.tair.bs.community.*"
%>

<%!
String pageName = "Genetic Marker Detail";
%>

<% 
   GeneticMarkerDetail detail =  (GeneticMarkerDetail) request.getAttribute("detail"); 
   String hiddenReq = request.getParameter( "hideNote" );
   boolean hidden = ( hiddenReq != null && hiddenReq.equals( "true" ) );

   String showAllReq = request.getParameter( "showAllNote" );
   boolean showAll = ( showAllReq != null && showAllReq.equals( "true" ) );
// don't show num_sites column in digest pattern band if RFLP marker -- per Tanya 06.04.02
boolean isRFLP = ( detail.get_genetic_marker_type() != null && detail.get_genetic_marker_type().equals( "RFLP" ) );
%>
      


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />
<table width="100%" border="0" colspan="2" cellspacing="0" >
     <tr>
	<td colspan="3"><b><font size="+1">Genetic Marker:<%= detail.get_genetic_marker_name() %></font></b></td>
     </tr>

 <!-- date_last_modified-->
   <% if ( detail.get_date_last_modified() != null ) { %>  
    <tr  <%= myBgColor.toggleBgColor() %> >  

   <th class="sm" align="left">Date last modified</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%=  detail.get_date_last_modified()  %></td>
   </tr>
  <% }  %>

 <!-- name -->
 <% if ( detail.get_genetic_marker_name() != null ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
	 <th class="sm" valign="top" align="left">Name</th>
	 <td class="sm">&nbsp;&nbsp;</td>
	 <td class="sm" width="80%"><%= detail.get_genetic_marker_name() %></td>
     </tr>
 <% } %>

 <!-- alias -->
 <% if ( detail.get_alias_string() != null) { %>
     <tr <%= myBgColor.toggleBgColor() %>>
         <th class=sm align=left valign=top" >Aliases</th>
         <td class=sm >&nbsp;&nbsp;</td>
         <td class=sm ><%= detail.get_alias_string() %></td>
     </tr>
 <% } %>

 <!-- Tair Accession -->
 <% if(detail.getAccession()!=null){ %>
   <tr <%=myBgColor.toggleBgColor()%> >
       <th class="sm" align="left" valign="top">Tair Accession</th>
       <td class="sm" >&nbsp;</td>
       <td class="sm" ><%=  detail.getAccession() %></td>
   </tr>
 <% } %>

 <% if ( detail.getDisplayMarkerType() != null ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
         <th class="sm" align="left" valign="top">Type</th>
         <td class="sm" >&nbsp;</td>
         <td class="sm" ><%= detail.getDisplayMarkerType() %></td>
     </tr>
 <% } %>

 <% if ( detail.get_length() != null ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
         <th class="sm" align="left" valign="top">Length</th>
         <td class="sm" >&nbsp;</td>
         <td class="sm" ><%= detail.get_length() %></td>
     </tr>
 <% } %>

 <% if ( detail.get_is_pcr_marker() != null ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
         <th class="sm" align="left" valign="top">Is PCR Marker</th>
         <td class="sm" >&nbsp;</td>
         <td class="sm" ><%= detail.get_is_pcr_marker() %></td>
      </tr>
 <% } %>

 <% if ( detail.get_special_conditions() != null ) { %>
      <tr <%=myBgColor.toggleBgColor() %> >
         <th class="sm" align="left" valign="top">Special Conditions</th>
         <td class="sm" >&nbsp;</td>
         <td class="sm" ><%= detail.get_special_conditions() %></td>
      </tr>
 <% } %>

 <!-- chromosome -->

  <tr <%=myBgColor.toggleBgColor()%> >
         <th class="sm" align="left" valign="top">Chromosome</th>
         <td class="sm" >&nbsp;</td>
         <td class="sm" > <%= Units.translateChromosome( detail.get_chromosome() ) %></td>
  </tr>
  
 

  <!-- gene-locus-->
 <%  if( detail.getGenes() != null ){ %>
 <TR <%= myBgColor.toggleBgColor() %> >
     <TH class="sm" align="left" valign="top">Associated Genes</TH>
     <TD class="sm">&nbsp;</TD>
     <TD class="sm">
         <table>   
           <TR align="left"> 
             <TH class="sm">Gene Model</TH>
             <TH class="sm">&nbsp;</TH>  
             <TH class="sm">Locus</TH>
             <TH class="sm">&nbsp;</TH>  
             <TH class="sm">Association Type</TH>
           </TR>
     <%   Iterator gene_iter = detail.getGenes();
          while ( gene_iter.hasNext() ) { 
               GeneModel gene = (GeneModel)gene_iter.next();
     %>
           <TR align="left">
             <TD class="sm" valign="top">
              <A href= "/servlets/TairObject?type=gene&id=<%= gene.get_gene_id() %>" >   
              <%= EmptyTextConverter.convert(gene.get_name()) %></A> </TD>
             <TD class="sm">&nbsp;</TD>
     <!-- loci of this gene -->
             <TD class="sm">
     <% if(gene.hasLocus()){     
        Iterator loci_iter =  gene.getLocus();
        while ( loci_iter.hasNext() ) { 
            TfcLocus locus = (TfcLocus)loci_iter.next();
     %>  
         <A href= "/servlets/TairObject?type=locus&id=<%= locus.get_locus_id() %>" >              
         <%= EmptyTextConverter.convert(locus.get_name()) %></A><BR>
  
     <% } %>
     <%}else{ %>
         &nbsp;   
     <% } %>
        </TD>
         
        <TD class="sm">&nbsp;</TD> 
        <TD class="sm"> <%=  EmptyTextConverter.convert(gene.get_relationship_type()) %></TD>
          </TR>
     <% } %> 
       </TABLE>
     </TD>
    </TR>             
 <% }  %>


<!--loci-->
 <% if(detail.hasLocus()){ %>
 <tr <%= myBgColor.toggleBgColor() %> >
   <TH class="sm" align="left" valign="top">Associated Loci</TH>
   <TD class="sm">&nbsp;</TD> 
  
 <% String loci = "";
    Iterator loci_iter =  detail.getLocus();
    while ( loci_iter.hasNext() ) { 
            TfcLocus locus = (TfcLocus)loci_iter.next();
            loci += "<A href= '/servlets/TairObject?type=locus&id="+locus.get_locus_id()+"'>" 
                    +locus.get_name() + "</A>, ";
    }
    loci = loci.substring (0, loci.lastIndexOf(",")); // remove the last ","
            
 %>
     <TD class="sm"><%= loci %></TD>
<% } %>
  


 <!-- made_from_map_element -->
 <% if ( detail.get_made_from_id() != null ) { %>
     <tr <%=myBgColor.toggleBgColor()%> >
         <th class="sm" valign="top" align="left">Made From</th>
         <td class="sm">&nbsp;</td>
         <td class="sm">
         <table>
              <tr align="left" valign="top">
                  <th class="sm">name</th>
	          <th class="sm">&nbsp; &nbsp;</th>
                  <th class="sm">map element type</th>
               </tr>

               <tr>
                  <td class="sm" ><a href="/servlets/TairObject?accession=<%= detail.get_made_from_accession() %>"><%= detail.get_made_from_name() %></a></td>
	   	  <td class="sm">&nbsp; &nbsp;</td>	
                  <td class="sm" ><%= detail.get_made_from_type() %></td>
               </tr>
          </table>
          </td>
       </tr>		
 <% } %>


  <% if ( detail.has_polymorphisms() ) { %>
       <% String bgColor = myBgColor.toggleBgColor(); %>
       <tr <%= bgColor %> >
           <th class="sm" colspan="3" align="left">Associated Polymorphisms</th>
       </tr>


 <!-- polymorphism_digest_pattern use id 619 -->
 <%  if ( detail.get_polymorphisms( "digest_pattern" ) != null ) {  %>   
       <tr <%= bgColor %>>
            <th class="sm" valign="top" align="left">Digest Patterns</th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
            <table width="100%" border="0" cellpadding="1" >
               <tr align="left" valign="top">
		   <th class="sm">Polymorphism </th>
                   <th class="sm">species variant</th>
		
                   <th class="sm">restrict enzyme</th>
		
                 <% if ( !isRFLP ) { %>
		   <th class="sm">num sites</th>
		
	        <% } %>
                   <th class="sm">fragment length</th>
		
                   <th class="sm">attribution</th>
               </tr>
      <%
       Iterator iter = detail.get_polymorphisms( "digest_pattern" );
        while ( iter.hasNext() ){
           PolymorphismObject polymorphism = (PolymorphismObject) iter.next();
           Iterator enzymeIter = polymorphism.get_restriction_enzymes();
           if ( enzymeIter != null ) { 
               boolean first = true;
               while ( enzymeIter.hasNext() ){
                  PolymorphismRestrictionEnzyme enzyme = (PolymorphismRestrictionEnzyme) enzymeIter.next();
                  if ( first ) {  
      %>
               <tr>
		   <td class="sm"><A href="/servlets/TairObject?id=<%= polymorphism.get_ref_polymorphism_id() %>&type=polyallele">
		      <%= EmptyTextConverter.convert( polymorphism.get_name() ) %></A>
		   </td> 
                   <td class="sm"><%= EmptyTextConverter.convert( polymorphism.get_species_variant_name() ) %></td>
		
                   <td class="sm"><a href="/servlets/TairObject?type=restrictionenzyme&id=<%= enzyme.get_restriction_enzyme_id() %>"><%= EmptyTextConverter.convert( enzyme.get_name() ) %></a></td>
		
                   <% if ( !isRFLP ) { %>
                   <td class="sm"><%= EmptyTextConverter.convert( enzyme.get_num_sites() ) %></td>
		
                   <% } %>
                   <td class="sm"><%= EmptyTextConverter.convert( polymorphism.get_format_lengths() ) %></td>
		
	           <td class="sm"><% if ( polymorphism.hasAttributions() ){ %><a href="/servlets/TairObject?id=<%=polymorphism.get_tair_object_id() %>&type=attrib">attribution</a><% } else { %>&nbsp;<% } %></td>
              </tr>

               <% } else if ( enzyme.get_name() != null || enzyme.get_num_sites() != null ) {  %>
               <tr>
                    <td class="sm" colspan=2>&nbsp;</td>
                    <td class="sm"><a href="/servlets/TairObject?type=restrictionenzyme&id=<%= enzyme.get_restriction_enzyme_id() %>"><%= EmptyTextConverter.convert( enzyme.get_name() ) %></a></td>
                    <% if ( !isRFLP ) { %>
                      <td class="sm"><%= EmptyTextConverter.convert( enzyme.get_num_sites() )%></td>
                    <% } %>
                    <td class="sm">&nbsp;</td>
                    <td class="sm">&nbsp;</td>
               </tr>

    <% 
                }
                first = false;
             } 
          }
       }
    %>

	</table>
      </td>
    </tr>
   <%  }  %>


 <!-- polymorphism_visible_phenotype use id 1236 -->
 <%  if ( detail.get_polymorphisms( "visible" ) != null ) { %>    
      <tr <%= bgColor %>>
          <th class="sm" valign="top" align="left">Visible Phenotype</th>
          <td class="sm">&nbsp;</td>
          <td class="sm">
              <table cellpadding="2">
              <tr>
		 <th class="sm">Polymorphism </th>
	         <th class="sm">species variant</th>
	         <th class="sm">description</th>
	         <th class="sm">attribution</th>
              </tr>

             <%
               Iterator iter = detail.get_polymorphisms( "visible" );
               while ( iter.hasNext() ) {
                   PolymorphismObject polymorphism = (PolymorphismObject) iter.next();
             %>

              <tr>
		  <td class="sm"><A href="/servlets/TairObject?id=<%= polymorphism.get_ref_polymorphism_id() %>&type=polyallele">
		      <%= EmptyTextConverter.convert( polymorphism.get_name() ) %></A>
		  </td> 
                  <td class="sm"><%= EmptyTextConverter.convert( polymorphism.get_species_variant_name() ) %></td>
                  <td class="sm"><%= EmptyTextConverter.convert( polymorphism.get_description() ) %></td>
	          <td class="sm"><% if ( polymorphism.hasAttributions() ) { %><a href="/servlets/TairObject?id=<%= polymorphism.get_tair_object_id() %>&type=attrib">attribution</a><% } else { %>&nbsp;<% } %></td>
              </tr>

            <% } %>
	    </table>
	 </td>
      </tr>
   <% } %>


 <!-- polymorphism_pcr_product_length use id 2256 -->
 <%  if ( detail.get_polymorphisms( "PCR_product_length" ) != null ) { %>
     <tr <%= bgColor %>>
         <th class="sm" valign="top" align="left">PCR Product Length</th>
         <td class="sm">&nbsp;</td>
         <td class="sm">
             <table cellpadding="2">
             <tr>
	        <th class="sm">Polymorphism </th>
	        <th class="sm" align=left>species variant name</th>
	        <th class="sm">product length</th>
	        <th class="sm">attribution</th>
             </tr> 
     
             <%
               Iterator iter = detail.get_polymorphisms("PCR_product_length");
               while ( iter.hasNext() ) {
                   PolymorphismObject polymorphism = (PolymorphismObject) iter.next();
             %>  

              <tr>
		  <td class="sm"><A href="/servlets/TairObject?id=<%= polymorphism.get_ref_polymorphism_id() %>&type=polyallele">
		      <%= EmptyTextConverter.convert( polymorphism.get_name() ) %></A>
		  </td> 
                 <td class="sm" align=left><%= EmptyTextConverter.convert( polymorphism.get_species_variant_name() ) %></td>
                 <td class="sm"><%= EmptyTextConverter.convert( polymorphism.get_format_lengths() ) %></td>
	         <td class="sm"><% if ( polymorphism.hasAttributions() ) { %><a href="/servlets/TairObject?id=<%= polymorphism.get_tair_object_id() %>&type=attrib">attribution</a><% } else { %>&nbsp;<% } %></td>
              </tr>

             <% } %>

	    </table>
	 </td>
      </tr>
   <% } %>


 <!-- polymorphism_sequence_variant use id 632 -->
 <!-- get SNP, substitution & INDEL as one "sequence variant" band -->
 <%  Iterator seqVarIter = detail.get_polymorphisms( new String[] { "SNP", "substitution", "INDEL" } );
     if ( seqVarIter != null ) {  %>
	  <tr valign="top" <%= bgColor %>>
              <th class="sm" valign="top" align="left">Sequence Variant</th>
                <td class="sm">&nbsp;</td>
                  <td class="sm">
                  <table>
		     <tr>
		       <th class="sm">Polymorphism </th>
	               <th class="sm" align="left">species variant</th>
	               <th class="sm" align="left">variant type</th>
	               <th class="sm" align="left">length</th>
	               <th class="sm" align="left">poly sequence</th>
	               <th class="sm" align="left">attribution</th>
		     </tr>

               <%
                 while ( seqVarIter.hasNext() ) {
                     PolymorphismObject poly = (PolymorphismObject) seqVarIter.next();
                 %>

                    <tr>
		          <td class="sm"><A href="/servlets/TairObject?id=<%= poly.get_ref_polymorphism_id() %>&type=polyallele">
		      <%= EmptyTextConverter.convert( poly.get_name() ) %></A>
		         </td> 
                         <td class="sm"><%= EmptyTextConverter.convert( poly.get_species_variant_name() ) %></td>
                         <td class="sm"><%= EmptyTextConverter.convert( poly.get_polymorphism_type() ) %></td>
                         <td class="sm"><%= EmptyTextConverter.convert( poly.get_format_lengths() ) %></td>
                         <td class="sm"><%= EmptyTextConverter.convert( poly.get_polymorphic_sequence() ) %></td>
			 <td class="sm"><% if ( poly.hasAttributions() ){ %><a href="/servlets/TairObject?id=<%=poly.get_tair_object_id() %>&type=attrib">attribution</a><% }else{ %>&nbsp;<% } %></td>
                    </tr>

              <% } %>  
                
                  </table>
              </td>
            </tr>
 <% }  %>

<% } // end polymorphism group %>


    <!-- MAP_LOCATIONS -->

    <% if ( detail.hasGlobalAssignments() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
        <jsp:include page="/jsp/includes/map_locations.jsp" flush ="true"/>
    <% } %>

    <!-- CREATE LINKS TO VIEWERS IF POSSIBLE -->

    <% if ( detail.hasGlobalAssignments() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Map Links</th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <% if ( detail.showMapViewerLink() ) { %>
                    <a href="/servlets/mapper?value=<%= URLEncoder.encode( detail.get_genetic_marker_name() ) %>&action=search">Map Viewer</a>
                <% } %>
                <% if ( detail.get_is_agi_map() ) { %>
                    &nbsp;&nbsp;&nbsp;
                    <%= HTMLFactory.createSeqViewerLinks( "Sequence Viewer", "marker", detail.get_tair_object_id(), detail.getAGIChromosomes(), "&nbsp;&nbsp;" ) %>
                <% } %>
                &nbsp;&nbsp;&nbsp;
                <a href="/cgi-bin/gbrowse/arabidopsis/?name=<%= detail.get_genetic_marker_name().replace(',','~') %>">GBrowse</a>
            </td>
        </tr>
    <% } %>

 	
  <!-- sequence  -->
       <% if ( detail.get_sequences() != null ) { %>
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


<!-- flanking sequence id:1012837-->
 <!--Associated Nucleotide Sequences-->
 <% String seqColor = "";
    if ( detail.get_flanking_sequence() !=null ) { 
       seqColor = myBgColor.toggleBgColor();
%>
 
 <tr <%= seqColor %> >
    <th class="sm" align="left" colspan="3">Associated  Nucleotide Sequences</th>
 </TR>  

<% } %>


 <% if ( detail.get_flanking_sequence() != null ) { %>

  <tr <%= seqColor %> valign="top" > 
      <th class="sm" align=left valign=top>Flanking Sequences</th> 
      <td class="sm">&nbsp;</td>
      <td class="sm">

      <%   
        Iterator seqIter = detail.get_flanking_sequence();
        while ( seqIter.hasNext() ) {
           TfcFlankingSequence sequence = (TfcFlankingSequence) seqIter.next();
           String header = ( sequence.get_flankingsequence_type() != null && sequence.get_flankingsequence_type().equalsIgnoreCase( "PCR_primer" ) ) ? "primer" : "sequence";
       %>
           <b><%= header %> 1:</b> <%= EmptyTextConverter.convert( sequence.get_sequence1() ) %><br>
           <b><%= header %> 2:</b> <%= EmptyTextConverter.convert( sequence.get_sequence2() ) %>

     <% } %> 

   </td>
  </tr>
 <% } %>

<!-- external_link -->
 <%  if(detail.get_external_links()!=null){ %>
    
  <tr <%= myBgColor.toggleBgColor() %> >
     <th class="sm" valign="top" align="left">External Link</th> 
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

<!-- annotation -->
 <% if ( detail.get_annotations() != null ) { %>
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
         Iterator annotationIter = detail.get_annotations();
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
             <input type="hidden" name="tair_object_id" value="<%= detail.get_tair_object_id() %>">
             <input type="hidden" name="accession" value="<%= detail.getAccession() %>" >

            <% String hideText = hidden ? "Show Comments" : "Hide Comments"; %>
            <% boolean hideOption = !hidden; %>
            <% String allText = showAll ? "Show Recent Comments" : "Show All Comments"; %>
            <% boolean showAllOption = !showAll; %>

           </th>

        <% if ( !hidden && detail.hasNotepad() ) { %>
                <td class="sm">&nbsp;</td>
                <td class="sm">
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
              </td>


        <% } else { %>
           <td class="sm" colspan="2"> &nbsp;
          </td>
        <% } %>
      </tr>
      <tr<%= commentColor  %>  valign="top"  %> 
          <td class="sm" colspan=3 align=center>
          <input type="submit" VALUE="Add My Comment">&nbsp;&nbsp;
          <input type="button" value="<%= hideText %>" onClick="document.location.href='/servlets/TairObject?accession=<%= detail.getAccession() %>&hideNote=<%= hideOption %>'">&nbsp;&nbsp;
          <input type="button" value="<%= allText %>" onClick="document.location.href='/servlets/TairObject?accession=<%= detail.getAccession() %>&showAllNote=<%= showAllOption %>'"> 
           </td>
           
      </tr>
   </form>

  <!-- attribution -->
    <% if ( detail.get_attributions() != null ) { %>
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
  <% if ( detail.get_communication_references() != null ) { %>  
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
  <% if ( detail.get_publications() != null ) { %>  
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

 </TABLE>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

