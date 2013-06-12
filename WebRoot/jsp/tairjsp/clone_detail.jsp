<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->

<%@ page errorPage="/jsp/common/gen_error.jsp"%>

<%@ page 
import="org.tair.tfc.*, org.tair.search.*, org.tair.querytools.*, org.tair.utilities.*, org.tair.abrc.stock.*, java.util.*, java.net.*, org.tair.bs.community.*"
%>

<%!
String pageName = "Clone Detail";
%>

<%
// Get detail object from request
   CloneDetail object = (CloneDetail) request.getAttribute("detail");
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
    <TR>
        <TD colspan="3"><b><font size="+1">Clone: <%= object.get_clone_name() %></font></b></TD>
    </TR>

 <!-- date_last_modified-->
   <% if ( object.get_date_last_modified() != null ) { %>  
    <TR  <%= myBgColor.toggleBgColor() %> >  

   <TH class="sm" align="left">Date last modified</TH>
      <TD class="sm">&nbsp;&nbsp;</TD>
      <TD class="sm"><%=  object.get_date_last_modified()  %></TD>
 </TR>
  <% }  %>

 <!-- name -->
 <% if ( object.get_clone_name() != null ) { %>
     <TR <%= myBgColor.toggleBgColor() %> >
	 <TH class="sm" valign="top" align="left">Name</TH>
	 <TD class="sm">&nbsp;&nbsp;</TD>
	 <TD class="sm" width="80%"><%= object.get_clone_name() %></TD>
     </TR>
 <% } %>

 <!-- alias -->
 <% if ( object.get_aliases() != null ) { %>
    <TR <%= myBgColor.toggleBgColor() %>>
        <TH class=sm align=left valign=top" >Aliases</TH>
        <TD class=sm >&nbsp;&nbsp;</TD>
        <TD class=sm ><%= object.get_alias_string() %></TD>
    </TR>
 <% } %>

 <!--TAIR Accession -->
 <% if(object.getAccession()!=null){ %> 
    <TR <%=myBgColor.toggleBgColor()%> >
        <TH class="sm" align="left" valign="top">TAIR Accession</TH>
        <TD class="sm" >&nbsp;&nbsp;</TD>
        <TD class="sm" ><%=  object.getAccession() %></TD>
   </TR>
 <% } %>

 <!-- clone -->
   <TR <%=myBgColor.toggleBgColor()%> valign="top">
       <TH class="sm" valign="top" align="left">Clone</TH>
       <TD class="sm">&nbsp;</TD>
       <TD class="sm">
	   <table cellpadding="1" cellspacing="1" border="0" width="100%">
	   <TR align="left" valign="bottom">
	       <TH class="sm">insert type</TH>
	       <TH class="sm">insert size</TH>
  
          <% // only show clone's vector type if there's no vector band down below
             if ( object.get_vector_id() == null && object.get_vector_type() != null ) { %>
	       <TH class="sm">vector type</TH>
          <% } %>
	    </TR>

	    <TR valign="top">
 	        <TD class="sm"><%=EmptyTextConverter.convert( object.get_insert_type() )%></TD>
                <TD class="sm"><%=EmptyTextConverter.convert( object.get_insert_size()) %></TD>

           <% // only show clone's vector type if there's no vector band down below
               if ( object.get_vector_id() == null && object.get_vector_type() != null ) { %>
                 <TD class="sm"><%=EmptyTextConverter.convert( object.get_clone_vector_type()) %></TD>
           <% } %>

             </TR>
            </table>
           </TD>
     </TR>

   <% if ( object.hasParentClone() ) { %>
          <% Clone parentClone = object.getParentClone(); %>
     <tr <%= myBgColor.toggleBgColor() %>>
        <th class="sm" valign="top" align="left">Parent Clone</TH>
	<td class="sm">&nbsp;&nbsp;</TD>
        <td class="sm">
           <table cellpadding="2" cellspacing="1" border="0">
              <tr>
                  <th class="sm" align="left">Name</th>
                  <th class="sm" align="left">Stock #</th>
              </tr>

              <tr valign="top">
                  <td class="sm"><a href="/servlets/TairObject?type=clone&id=<%= parentClone.get_clone_id() %>"><%= parentClone.get_name() %></a></td>
                  <td class="sm">
                      <% 
                        if ( parentClone.hasStocks() ) {
                            StockObject stock = null;
                            boolean firstStock = true;
                            Iterator parentStockIter = parentClone.getStocks();
                            while ( parentStockIter.hasNext() ) {
                                stock = (StockObject) parentStockIter.next();
                                if ( !firstStock ) {
                                    out.write( "<br>" );
                                }
                                firstStock = false;
                       %>
                         <a href="/servlets/TairObject?type=stock&id=<%= stock.get_stock_id() %>"><%= stock.get_name() %></a>
                          <% } %>
                      <% } %>
                      &nbsp;
                   </td>
               </tr>
            </table>
          </td>
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
          


   <% if ( object.get_taxon_id() != null || object.get_species_variant_id() != null ) { %>
     <TR <%= myBgColor.toggleBgColor() %> >
        <TH class="sm" valign="top" align="left">Taxon</TH>
	<TD class="sm">&nbsp;&nbsp;</TD>
        <TD class="sm">
           <table cellpadding="2" cellspacing="1" border="0">
             <tr>
	        <TH class="sm" align="left">Taxon</TH>
                <TH class="sm" align="left">Species Variant</TH> 
             </tr>

             <tr>
 	       <TD class="sm"><%= EmptyTextConverter.convert( object.get_scientific_name() ) %></TD>
               <TD class="sm"><A href="/servlets/TairObject?type=species_variant&id=<%= object.get_species_variant_id() %>"><%= EmptyTextConverter.convert( object.get_species_variant_original_name() ) %></A></TD>
             </tr>
           </table>
        </td>
      </tr>
   <% } %>


   <% if ( object.get_construct_type() != null || object.get_promoter() != null || object.get_reporter() != null ) { %>
     <TR <%= myBgColor.toggleBgColor() %> >
        <TH class="sm" valign="top" align="left">Construct</TH>
	<TD class="sm">&nbsp;&nbsp;</TD>
        <TD class="sm">
            <table cellpadding="1" cellspacing="0" border="0">
               <tr>
                  <% if ( object.get_construct_type() != null ) { %>
                   <th class="sm" align="left">type</th>
                   <td class="sm">&nbsp; &nbsp;</td>
                  <% } %>

                  <% if ( object.get_promoter() != null ) { %>
                   <th class="sm" align="left">promoter</th>
                   <td class="sm">&nbsp; &nbsp;</td>
                  <% } %>

                  <% if ( object.get_reporter() != null ) { %>
                   <th class="sm" align="left">reporter</th>
                   <td class="sm">&nbsp; &nbsp;</td>
                  <% } %>
               </tr>
               <tr>
                 <% if ( object.get_construct_type() != null ) { %>
                   <td class="sm"><%= object.get_construct_type() %></td>
                   <td class="sm">&nbsp; &nbsp;</td>
                 <% } %>

                 <% if ( object.get_promoter() != null ) { %>
                   <td class="sm"><%= object.get_promoter() %></td>
                   <td class="sm">&nbsp; &nbsp;</td>
                 <% } %>

                 <% if ( object.get_reporter() != null ) { %>
                   <td class="sm"><%= object.get_reporter() %></td>
                   <td class="sm">&nbsp; &nbsp;</td>
                 <% } %>
               </tr>
            </table>
        </td>
   <% } %>



  <!-- chromosome -->
  <TR <%=myBgColor.toggleBgColor()%> >
         <TH class="sm" align="left" valign="top">Chromosome</TH>
         <TD class="sm" >&nbsp;</TD>
         <TD class="sm" > <%= Units.translateChromosome( object.get_chromosome() ) %></TD>
  </TR>

<!-- gene-locus-->
 <%  if( object.getGenes() != null ){ %>
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
     <%   Iterator gene_iter = object.getGenes();
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
 </tr>
<% } %>
  



  <!-- antibiotic resistance-->

 <% if ( object.get_antibiotic_selection() != null ) {   %>
   <TR <%=myBgColor.toggleBgColor()%> >
       <TH class="sm" align="left" valign="top">Antibiotic Resistance</TH>
       <TD class="sm" >&nbsp;&nbsp;</TD>
       <TD class="sm" ><%= EmptyTextConverter.convert( object.get_antibiotic_selection()) %></TD>
    </TR>
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

   <!-- sequence  -->
    <% if ( object.get_sequences() != null ) { %>
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
           Iterator seqIter = object.get_sequences();
           while ( seqIter.hasNext() ) {
               Sequence sequence = (Sequence) seqIter.next();
         %>
                 <TR>
                    <TD class="sm"><%= EmptyTextConverter.convert( sequence.get_format_type() ) %></TD>
                    <TD class="sm"><%= EmptyTextConverter.convert( sequence.get_submission_source() ) %></TD>
                    <TD class="sm"><%= EmptyTextConverter.convert( sequence.get_submission_date() ) %></TD>
                    <TD class="sm"><% if ( sequence.get_ic_accession() != null ) { %>
		      <a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?db=nucleotide&val=<%= sequence.get_ic_accession() %>" target=_blank><%= sequence.get_ic_accession() %></a><% } %>&nbsp;</TD>
		    <TD class="sm"><a href="/servlets/TairObject?type=sequence&id=<%= sequence.get_nucleotide_seq_id() %>"><%= sequence.get_format_sequence_name() %></a></TD>
	         </TR>
          <% } %>
	    </table>
	  </TD>
      </TR>
     <% } %>



 <!-- clone_end_vector -->   
 <%  if( object.get_clone_ends() != null ){ %> 
     <TR <%= myBgColor.toggleBgColor() %> >
        <TH class="sm" align="left" valign="top">CloneEnds</TH>
        <TD class="sm">&nbsp;</TD>
             <TD class="sm">
                  <table>
                    <TR align="left">
                        <TH class="sm">TAIR accession&nbsp;&nbsp;&nbsp;</TH>
                        <TH class="sm">name&nbsp;&nbsp;&nbsp;</TH>
                        <TH class="sm">type&nbsp;&nbsp;&nbsp;</TH>
                        <TH class="sm">info&nbsp;&nbsp;&nbsp;</TH>
                        <TH class="sm">GenBank Accession&nbsp;&nbsp;&nbsp;</TH>
                    </TR>
     <%
              Iterator clone_end_iter = object.get_clone_ends();
              while ( clone_end_iter.hasNext() ) { 
                  CloneEnd clone_end = (CloneEnd)clone_end_iter.next();
                  Iterator nucleotide_sequence_iter = clone_end.get_nucleotide_sequences();
     %>    
	         <TR>                             
                         <TD class="sm">CloneEnd:<%= EmptyTextConverter.convert(clone_end.get_tair_object_id().toString() ) %></TD>
                         <TD class="sm"> 
                          <a href=/servlets/TairObject?type=cloneend&id=<%= clone_end.get_clone_end_id() %>>
                          <%= EmptyTextConverter.convert( clone_end.get_name() ) %> </A>
                         </TD>  
                         <TD class="sm"><%= EmptyTextConverter.convert( clone_end.get_type() ) %>
                         </TD>
                         <TD class="sm"><%= EmptyTextConverter.convert( clone_end.get_oligo_info() ) %>
                         </TD>
                         <TD class="sm">
                              <%     
                                 if ( nucleotide_sequence_iter != null ) {
                                    while ( nucleotide_sequence_iter.hasNext() ) { 
                                          TfcNucleotideSequence  sequence = (TfcNucleotideSequence)nucleotide_sequence_iter.next();
                               %>

                                   <a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?db=nucleotide&val=<%=EmptyTextConverter.convert( sequence.get_ic_accession() )%>" target=_blank>
                                   <%= EmptyTextConverter.convert( sequence.get_ic_accession() ) %> </a>

                                  <% } %> 
                             <% } %> 
                         </TD>
                 </TR>
              
    <%  } // end while   %>
       </table>
    <% }// end if   %>
    <!-- end clone_end -->
  
  <!--tfc_assembly_unit -->
  <% if( object.get_assembly_unit_id() != null){  %>
     <TR <%= myBgColor.toggleBgColor() %>>
        <TH class="sm" valign="top" align="left">Annotation Unit</TH>
        <TD class="sm">&nbsp;</TD>
        <TD class="sm">
            <a href="/servlet/TairObject?type=AssemblyUnit&id=<%= object.get_assembly_unit_id() %>"><%= EmptyTextConverter.convert(object.get_assembly_unit_name()) %></a>
            <% if ( object.get_note() != null ) { %>
              <br><br>
              Note<br>
              <%= object.get_note() %>
            <% } %>
        </TD>
     </TR>
   <% } %>

    <!-- MAP_LOCATIONS -->

    <% if ( object.hasGlobalAssignments() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
        <jsp:include page="/jsp/includes/map_locations.jsp" flush ="true"/>
    <% } %>

    <!-- CREATE LINKS TO VIEWERS IF POSSIBLE -->

    <% if ( object.hasGlobalAssignments() ) { %>
        <TR <%= myBgColor.toggleBgColor() %> >
            <TH class="sm" align="left">Map Links</TH>
            <TD class="sm">&nbsp;</TD>
            <TD class="sm">
                <% if ( object.showMapViewerLink() ) { %>
                    <a href="/servlets/mapper?value=<%= URLEncoder.encode( object.get_clone_name() ) %>&action=search">Map Viewer</a>
                <% } %>
                <% if ( object.get_is_agi_map() ) { %>
                    <%= HTMLFactory.createSeqViewerLinks( "Sequence Viewer", "clone", object.get_tair_object_id(), object.getAGIChromosomes(), "&nbsp;" ) %>
                <% } %>
                &nbsp;&nbsp;&nbsp;
                <a href="/cgi-bin/gbrowse/arabidopsis/?name=<%= object.get_clone_name() %>">GBrowse</a>
                &nbsp;
            </TD
        </TR>
    <% } %>



 <!-- tfc_library_clone -->
 <% if(object.get_library_id()!=null){ %>
   <TR <%= myBgColor.toggleBgColor() %>>
       <TH class=sm align=left valign=top" >Library</TH>
       <TD class=sm >&nbsp;&nbsp;</TD>
       <TD class=sm ><a href="/servlets/TairObject?type=library&id=<%= object.get_library_id() %>"><%= EmptyTextConverter.convert( object.get_library_name() ) %></A></TD> 
   </TR>
 <% } %>

 <!-- tfc_vector -->
 <% if(object.get_vector_id()!=null){ %>
     <TR <%= myBgColor.toggleBgColor() %>>
        <TH class="sm" valign="top" align="left">Vector</TH>
        <TD class="sm">&nbsp;</TD>
        <TD class="sm">
        <table cellpadding="2">
            <TR align="left">
               <TH class="sm">name&nbsp;&nbsp;&nbsp;</TH>
               <TH class="sm">type&nbsp;&nbsp;&nbsp;</TH>
               <TH class="sm">description&nbsp;&nbsp;&nbsp;</TH>
            </TR>
            <TR valign="top">
               <TD class="sm"><a href=/servlets/TairObject?type=vector&id=<%= object.get_vector_id() %>><%= EmptyTextConverter.convert(object.get_vector_name() )  %></a></TD>
               <TD class="sm"><%= EmptyTextConverter.convert(object.get_vector_type() )  %></a></TD>
               <TD class="sm"><%= EmptyTextConverter.convert(object.get_vector_description() )  %></a></TD>
	    </TR>
         </table>
         </TD>
     </TR>
  <% } %>

 <!-- tfc_cloning_enzyme -->
   <% if ( object.get_restriction_enzyme_1_id() != null || object.get_restriction_enzyme_2_id() != null ) { %>
    <TR <%= myBgColor.toggleBgColor() %>>
        <TH class="sm" valign="top" align="left">Restriction Enzyme</TH>
        <TD class="sm">&nbsp;</TD>
        <TD class="sm">
        <table width="100%">
            <TR align="left">
               <TH class="sm">cloning enzyme 1&nbsp;&nbsp;&nbsp;</TH>
               <TH class="sm">cloning enzyme 2&nbsp;&nbsp;&nbsp;</TH>
            </TR>
            <TR>
               <TD class="sm">
               <a href=/servlets/TairObject?type=restrictionenzyme&id=<%= object.get_restriction_enzyme_1_id() %>>
               <%= EmptyTextConverter.convert(object.get_restriction_enzyme_1_name() )  %></a>
               </TD>
               <TD class="sm">
               <a href=/servlets/TairObject?type=restrictionenzyme&id=<%= object.get_restriction_enzyme_2_id() %>>
               <%= EmptyTextConverter.convert(object.get_restriction_enzyme_2_name() )  %></a>
               </TD>
	    </TR>
         </table>
         </TD>
     </TR>
   <% } %>
   
  <!-- clone_chimerism clone_id=591 has this -->
  <% if ( object.get_clone_chimerism_repeat_type() != null ) { %>
    <TR  <%= myBgColor.toggleBgColor() %> >
        <TH class="sm" align="left" valign="top">Chimerisms</TH>
        <TD class="sm">&nbsp;</TD>
        <TD class="sm">
            <table>
	    <TR><TD class="sm"><b>genome type:</b></TD>
                <TD class="sm"><%= object.get_clone_chimerism_genome_type() %></TD>
            </TR>
            <TR><TD class="sm"><b>repeat type:</b></TD>
                <TD class="sm"><%= object.get_clone_chimerism_repeat_type() %></TD></TR>
            <TR><TD class="sm"><b>position known:</b></TD>
                <TD class="sm"><%=EmptyTextConverter.convert(object.get_chim_pos_known())%></TD>
            </TR>
            <TR><TD class="sm"><b>chimerism on left:</b></TD>
                <TD class="sm"><%=EmptyTextConverter.convert(object.get_chim_on_left())%></TD>
            </TR>
            <TR><TD class="sm"><b>chimerism on right:</b></TD>
                <TD class="sm"><%=EmptyTextConverter.convert(object.get_chim_on_right())%></TD>
            </TR>
            <TR><TD class="sm"><b>on same chromosome:</b></TD>
                <TD class="sm"><%=EmptyTextConverter.convert(object.is_on_same_chr())%></TD>
            </TR>
            <TR><TD class="sm"><b>has repetitive sequence:</b></TD>
                <TD class="sm"><%=EmptyTextConverter.convert(object.is_repeat())%></TD>
            </TR>
           </table>
          </TD>
   </TR>
   <% } %>

  <!-- flanking sequence -->
 <% if ( object.get_flanking_sequence() != null ) { %>

  <TR <%= myBgColor.toggleBgColor() %> valign="top" > 
      <TH class="sm" align=left valign=top>Flanking Sequences</TH> 
      <TD class="sm">&nbsp;</TD>
      <TD class="sm">

     <% Iterator seqIter = object.get_flanking_sequence();
        while ( seqIter.hasNext() ) {
           TfcFlankingSequence sequence = (TfcFlankingSequence) seqIter.next();
           String header = ( sequence.get_flankingsequence_type() != null && sequence.get_flankingsequence_type().equalsIgnoreCase( "PCR_primer" ) ) ? "primer" : "sequence";
     %>

           <b><%= header %> 1:</b> <%= EmptyTextConverter.convert( sequence.get_sequence1() ) %><br>
           <b><%= header %> 2:</b> <%= EmptyTextConverter.convert( sequence.get_sequence2() ) %>

     <% } %> 
   </TD>
  </TR>
 <% } %>
  
    <!-- MAP_FEATURES --> 

    <% if ( object.hasSubAssignments() ) { %>
        <TR <%= myBgColor.toggleBgColor() %>>
            <TH class="sm" align="left" valign="top">Map Feature</TH>
            <TD class="sm">&nbsp;</TD>
            <TD class="sm" >
                <table width="100%" border="0" cellpadding="0">
                    <TR align="left">
                        <TH class="sm">chrom</TH>
                        <TH class="sm">feature name</TH>
                        <TH class="sm">type</TH>
                        <TH class="sm">coordinates</TH>
                        <TH class="sm">attrib</TH>
                    </TR>
                    <%
                    Iterator globalAssignmentIter = object.getGlobalAssignments();
                    while ( globalAssignmentIter.hasNext() ) { 
                        GlobalAssignment globalAssignment = (GlobalAssignment) globalAssignmentIter.next();

                        if ( globalAssignment.hasSubAssignments() ) { 
                            Iterator subAssignmentIter = globalAssignment.getSubAssignments();
                            while ( subAssignmentIter.hasNext() ) { 
                                LocalAssignment subAssignment = (LocalAssignment) subAssignmentIter.next();
                                %>
                                <TR>
                                    <TD class="sm"><%= EmptyTextConverter.convert( subAssignment.getMapElementChromosome() ) %>&nbsp;</TD>
                                    <TD class="sm"><a href="/servlets/TairObject?type=<%= subAssignment.getLinkType() %>&id=<%= subAssignment.getLinkId() %>"> <%= subAssignment.getMapElementName() %></a></TD>
                                    <TD class="sm"><%= subAssignment.getMapElementType() %></TD>
                                    <TD class="sm">
                                        <%= EmptyTextConverter.convert( subAssignment.getFormatStartPosition() ) %> - 
                                        <%= EmptyTextConverter.convert( subAssignment.getFormatEndPosition() ) %>
                                        <%= EmptyTextConverter.convert( subAssignment.getUnits() ) %>
                                    </TD>
                                    <TD class="sm"><% if ( globalAssignment.hasDetails() ) { %><a href="/servlets/TairObject?type=global_assignment&id=<%= globalAssignment.getGlobalAssignmentId() %>">details</a><% } %></TD>
                                </TR>
                            <% } %>
                        <% } %>
                    <% } %>
                </table>
            </TD>
        </TR>
    <% } %>



 <!-- external_link -->
 <%  if(object.get_external_links()!=null){ %>
    
  <TR <%= myBgColor.toggleBgColor() %> >
     <TH class="sm" align="left" valign=top">External Link</TH> 
     <TD class="sm">&nbsp;&nbsp;</TD>
     <TD class="sm">
     <table>
 <%  Iterator iter = object.get_external_links();
         while ( iter.hasNext() ) {
           ExternalLinkObject elo = (ExternalLinkObject) iter.next();
           String web_site_name = elo.get_web_site_name();

  %>  <TR> 
     <TD class="sm"><%= elo.get_external_HTML_link( web_site_name ) %>
     </TD>
     </TR> 
<% } %>
     </TABLE></TD>
  </TR>
<% } %>


  <!-- annotation -->
  <% if ( object.get_annotations() != null ) { %>
       <TR <%= myBgColor.toggleBgColor() %> valign="top" >
	    <TH class="sm" valign="top" align="left">Annotations</TH>
	    <TD class="sm">&nbsp;</TD>
	    <TD class="sm">
              <table>
	         <TR align="left">
	           <TH class="sm">date</TH>
	           <TH class="sm">by</TH>
  	           <TH class="sm">annotation</TH>
	         </TR>

                <% 
                   Iterator annotationIter = object.get_annotations();
                   while ( annotationIter.hasNext() ) {
                      AnnotationObject annotation = (AnnotationObject) annotationIter.next();
                %>

                 <TR valign="top">
                   <TD class="sm"><%= EmptyTextConverter.convert( annotation.get_date_entered() )%></TD>
                   <TD class="sm"><%= EmptyTextConverter.convert( annotation.get_annotation_source() ) %></TD>
                   <TD class="sm" colspan="2"><%= EmptyTextConverter.convert( annotation.get_short_annotation() ) + " " + EmptyTextConverter.convert( annotation.get_long_annotation() ) %></TD>
                </TR>
                 <% } %>
              </table>
            </TD>
	 </TR>
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
        <TR <%= myBgColor.toggleBgColor() %> >
            <TH class="sm" valign="top" align="left">Attribution</TH>
            <TD class="sm">&nbsp;</TD>
            <TD class="sm">
	        <table>
	            <TR align="left">
	                   <TH class="sm">type</TH>
	                   <TH class="sm" nowrap>&nbsp; &nbsp;</TH>
	                   <TH class="sm">name</TH>
	                   <TH class="sm" nowrap>&nbsp; &nbsp;</TH>
	                   <TH class="sm">date</TH>
	            </TR>
                 <%
                   for ( BsAttribution attribution : object.get_attributions() ) {
                 %>
	            <TR>
 	                   <TD class="sm"><%= EmptyTextConverter.convert( attribution.getType().getAttributionType() ) %></TD>
  	                   <TD class="sm" nowrap>&nbsp; &nbsp;</TH>
                           <TD class="sm"><a href=/servlets/Community?action=view&type=<%= attribution.getCommunityLinkType() %>&communityID=<%= attribution.getCommunityId().toString() %>><%= attribution.getCommunity().getName() %></a></TD>
 	                   <TD class="sm" nowrap>&nbsp; &nbsp;</TH>
                           <TD class="sm"><%= TextConverter.dateToString( attribution.getAttributionDate() ) %></TD>
                    </TR>
                 <% } %>
                </table>
	     </TD>
          </TR>
        <% } %>

 <!-- communication -->
 <% if ( object.get_communication_references() != null ) { %>  
     <TR <%= myBgColor.toggleBgColor() %> >
	 <TH class="sm" valign="top" align="left">Communication</TH>
	 <TD class="sm">&nbsp;&nbsp;</TD>
	 <TD class="sm">
       	 <table> 
            <TR align="left">
	       <TH class="sm">Name</TH>
	       <TH class="sm" nowrap>&nbsp; &nbsp;</TH>
	       <TH class="sm">Author Name</TH>
	       <TH class="sm" nowrap>&nbsp; &nbsp;</TH>
               <TH class="sm">date</TH>
	     </TR>
	    
        <%
             Iterator comIter = object.get_communication_references() ;
             while ( comIter.hasNext() ) {
                CommunicationObject  communication = (CommunicationObject)comIter.next();
        %>

	     <TR>
	        <TD class="sm"><a href=/servlets/TairObject?type=communication&id=<%= communication.get_reference_id() %>><%= EmptyTextConverter.convert(communication.get_name() )%></a></TD>
 	        <TD class="sm" nowrap>&nbsp; &nbsp;</TH>
                <TD class="sm"><%=EmptyTextConverter.convert( communication.get_author_name() )%></TD>
                <TD class="sm" nowrap>&nbsp; &nbsp;</TD>
               
                <TD class="sm"><%= EmptyTextConverter.convert( communication.get_date() ) %></TD>
             </TR>
         <% } %>
          </table>
	 </TD>
       </TR>
   <% } %>


 <!-- publication -->
 <% if ( object.get_publications() != null ) { %>  
      <TR <%= myBgColor.toggleBgColor() %> >
	  <TH class="sm" valign="top" align="left">Publication</TH>
	  <TD class="sm">&nbsp;&nbsp;</TD>
	  <TD class="sm">
       	        <table>
	           <TR align="left">
	              <TH class="sm">title</TH>
	              <TH class="sm" nowrap>&nbsp; &nbsp;</TH>
	              <TH class="sm">source</TH>
	              <TH class="sm" nowrap>&nbsp; &nbsp;</TH>
	              <TH class="sm">date</TH>
	          </TR>

                  <%
                    Iterator pubIter = object.get_publications();
                    while ( pubIter.hasNext() ) {
                         PublicationObject publication = (PublicationObject) pubIter.next();
		  %>

	          <TR>
	             <TD class="sm"><a href=/servlets/TairObject?type=publication&id=<%= publication.get_reference_id() %>><%= EmptyTextConverter.convert( publication.get_title() )%></a></TD>
 	             <TD class="sm" nowrap>&nbsp; &nbsp;</TH>
                     <TD class="sm"><%=EmptyTextConverter.convert( publication.get_pub_source_name() )%></TD>
 	             <TD class="sm" nowrap>&nbsp; &nbsp;</TH>
                    <TD class="sm"><%=EmptyTextConverter.convert( publication.get_year() )%></TD>
                 </TR>
                <% } %>
                </table>
	     </TD>
           </TR>
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
                   <tr>
                   <td class="sm" colspan="9"><%= EmptyTextConverter.convert(stock.get_description()) %></td>
                   </tr>

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
    </td></tr>
    <% } %>

   </TABLE>      

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
