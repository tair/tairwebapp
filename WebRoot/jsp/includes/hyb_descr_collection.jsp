
<%

// static include to display hyb descriptions;  include assumes that
// detail class is ExpressionSetDetail or one of its sub-classes
// (BioSampleCollectionDetail or HybDescriptionCollectionDetail)
//
// Hybridization info. will be displayed if detail class contains hyb
// description data; if expression set does not currently have hybridizations,
// but the total number of hybridizations associated to expression set
// is greater than zero, show a link for user to follow for viewing
// all hybridization data.  
//
// Since number of associated hybridizations can be very big, initial view
// of expression set will always show data as a link only, not full
// view.





// populate boolean variables that get referred to several times -- since each
// value needs to be calculated, save in vars to avoid unneeded iterations through collections
boolean hasCommonArrayDesign = detail.hasCommonArrayDesign();
boolean hasCommonProtocol = detail.hasCommonProtocol();
boolean hasCommonScanningSoftware = detail.hasCommonScanningSoftware();
boolean hasCommonScanningHardware = detail.hasCommonScanningHardware();
boolean hasCommonNormalizationDesc = detail.hasCommonNormalizationDesc();
%>

     <% if ( detail.hasHybDescriptions() ) { %>
      <tr bgcolor="<%= DataConstants.DARK_BGCOLOR %>">
	<td colspan="2"><b>Hybridization Information</b><%=DefinitionsLookup.createPopupLink("HybDescription","class")%></td>
      </tr>


      <% Iterator hybIter = detail.getHybDescriptions();
         HybDescriptionObject hybDescr = null;
         int counter = 1;
         String bgColor = null; // alternate colors for each hybridization
         while ( hybIter.hasNext() ) { 
            hybDescr = (HybDescriptionObject) hybIter.next();
            bgColor = myBgColor.toggleBgColor();
      %>

      <tr <%= bgColor %> >
         <td colspan="2"><font class="formheader">Replicate Hybridization<%=DefinitionsLookup.createPopupLink("Glossary","replicate_hybridization")%> Set <%= counter++ %>:</font></td>
      </tr>

      <tr <%= bgColor %> >
         <th class="sm" align="left" nowrap>Name</th>
         <td class="sm"><%= hybDescr.get_name() %></td>
      </tr>

      <% if ( !hasCommonProtocol && hybDescr.get_protocol_title() != null ) { %>
      <tr <%= bgColor %> >
         <th class="sm" align="left" nowrap>Hybridization protocol</th>
         <td class="sm"><%= hybDescr.get_protocol_title() %></td>
      </tr>
      <% } %>

      <% if ( !hasCommonScanningSoftware && hybDescr.get_program_name() != null ) { %>
      <tr <%= bgColor %> >
         <th class="sm" align="left" nowrap>Scanning software</th>
         <td class="sm"><%= hybDescr.get_program_name() %></td>
      </tr>
      <% } %>

      <% if ( !hasCommonScanningHardware && hybDescr.get_scanner() != null ) { %>
      <tr <%= bgColor %> >
         <th class="sm" align="left" nowrap>Scanning hardware</th>
         <td class="sm"><%= hybDescr.get_scanner() %></td>
      </tr>
      <% } %>

      <% if ( !hasCommonNormalizationDesc && hybDescr.get_normalization_desc() != null ) { %>
      <tr valign="top" <%= bgColor %>>
         <th class="sm" align="left" nowrap>Normalization<br>description</th>
         <td class="sm"><%= hybDescr.get_normalization_desc() %></td>
      </tr>
      <% } %>

      <tr valign="top" <%= bgColor %>>
         <th class="sm" align="left" nowrap># of hybridizations</th>
         <td class="sm"><%= hybDescr.getNumberHybData() %></td>
      </tr>

      <% if ( hybDescr.hasLabeledSamples() ) { %>
      <tr valign="top" <%= bgColor %>>
         <th class="sm" align="left" nowrap>Sample(s)<%=DefinitionsLookup.createPopupLink("BioSample","class")%></th>
         <td class="sm">
             <table cellpadding="1" cellspacing="0" border="0">
	        <tr>
                  <th class="sm" align="left">Name</th>
	          <th class="sm">&nbsp;&nbsp;</th>
                  <th class="sm" align="left">Label<%=DefinitionsLookup.createPopupLink("LabeledSample","label")%></th>
	          <th class="sm">&nbsp;&nbsp;</th>
                  <th class="sm" align="center">Channel #<%=DefinitionsLookup.createPopupLink("LabeledSample","channel_number")%></th>

	          <% if ( hybDescr.hasLabelingProtocol() ) { %>
	          <th class="sm">&nbsp;&nbsp;</th>
	          <th class="sm" align="left">Labeling Protocol<%=DefinitionsLookup.createPopupLink("LabeledSample","labeling_protocol_name")%></th>
                  <% } %>
	        </tr>

               <% Iterator sampleIter = hybDescr.getLabeledSamples();
                  LabeledSample sample = null;
                  while ( sampleIter.hasNext() ) {
                     sample = (LabeledSample) sampleIter.next();
                %>

	        <tr>
                  <td class="sm">
	             <!-- make links to samples on same page or separate page depending on detail object contents -->
                     <% if ( detail.hasBioSamples() ) { %>
	                <a href="#<%= sample.get_bio_sample_id() %>"><%= EmptyTextConverter.convert( sample.getBioSampleName() ) %></a>
                     <% } else { // must be shown on separate page %>
	                <a href="/servlets/TairObject?type=bio_sample_collection&id=<%= detail.get_tair_object_id() %>#<%= sample.get_bio_sample_id() %>" target=_blank><%= EmptyTextConverter.convert( sample.getBioSampleName() ) %></a> 
                     <% } %>
                  </td>
	          <td class="sm">&nbsp;&nbsp;</td>
                  <td class="sm"><%= EmptyTextConverter.convert( sample.get_label() ) %></td>
	          <td class="sm">&nbsp;&nbsp;</td>
                  <td class="sm" align="center"><%= EmptyTextConverter.convert( sample.get_channel_number() ) %></td>
	          <% if ( hybDescr.hasLabelingProtocol() ) { %>
	          <td class="sm">&nbsp;&nbsp;</td>
                  <td class="sm"><% if ( sample.get_labeling_protocol_ref_id() != null ) { %><a href="/servlets/TairObject?type=protocol&id=<%= sample.get_labeling_protocol_ref_id() %>"><%= sample.get_protocol_title() %></a><% } %>&nbsp;</td>
                  <% } %>
	        </tr>

               <% } %>

             </table>
          </td>
      </tr>
      <% } %>

      <% if ( hybDescr.getForwardName() != null ) { %>
      <tr <%= bgColor %> >
         <th class="sm" align="left" nowrap>Is reversed dye of</th>
         <td class="sm"><%= hybDescr.getForwardName() %></td>
      </tr>
      <% } %>
   
      <% if ( hybDescr.isController() ) { %>
      <tr <%= bgColor %> >
         <th class="sm" align="left" nowrap>Is reference for</th>
         <td class="sm">
              <% Iterator refIter = hybDescr.getControlledNames();
                 String name = null;
                 boolean firstName = true;
                 while ( refIter.hasNext() ) {
                    if ( !firstName ) {
                       out.write( ", " );
                    }
                    out.write( name );
                    firstName = false;
                 }
               %>
	 </td>
      </tr>
      <% } %>


      <% if ( hybDescr.hasHybData() ) { %>
      <!-- form for downloading hyb data files - no action, just need for buttons -->
      <form>
      <tr valign="top" <%= bgColor %>>
          <th class="sm" align="left" nowrap>Slides<%=DefinitionsLookup.createPopupLink("HybData","class")%></th>
          <td class="sm">
              <table cellpadding="1" cellspacing="0" border="1" width="100%">
	         <tr valign="bottom">
	            <th class="sm" align="left">Slide description</th>
	            <th class="sm" align="center">Replicate<br>type<%=DefinitionsLookup.createPopupLink("LabeledSample","label")%></th>
	            <th class="sm" align="center">Scan<br>Params<%=DefinitionsLookup.createPopupLink("HybData","Scan_parameters")%></th>
	            <th class="sm" align="center">Normalization<br>factor<%=DefinitionsLookup.createPopupLink("HybData","normalization_factor")%></th>
	            <th class="sm" align="center">External ID<%=DefinitionsLookup.createPopupLink("HybData","external_id")%></th>
	            <th class="sm" align="center">Data</th>
	         </tr>

                <% Iterator dataIter = hybDescr.getHybData();
	           HybData data = null;
                   while ( dataIter.hasNext() ) {
	              data = (HybData) dataIter.next();
	              int hybMaxCols = 6; 
	        %>

	         <tr>

                    <!-- set anchor for linking directly to this slide data from expression viewer -->
                    <!-- external id should be AFGC id in this case -->
	            <td class="sm" nowrap>
                       <a name="<%= data.get_experiment_id()%>"><%= EmptyTextConverter.convert( data.get_slide_description() ) %></a>
                    </td>

	            <td class="sm" align="center"><%= EmptyTextConverter.convert( data.getReplicateType() ) %>&nbsp;</td>
	            <td class="sm"><%= EmptyTextConverter.convert( data.get_scan_parameters() ) %>&nbsp;</td>
	            <td class="sm" align="center"><%= EmptyTextConverter.convert( data.get_normalization_factor() ) %></td>
	            <td class="sm" align="center" nowrap>
                       <%= EmptyTextConverter.convert( data.getExperimenterFormatAbbrevName() ) %> : <%= data.get_experiment_id() %>
                    </td>
	            <td class="sm" align="center"><% if ( data.getFtpURL() != null ) { %><input type="button" value="Get Data" onClick="document.location.href='<%= data.getFtpURL() %>'"><% } else { %>&nbsp;<% } %></td>
                 </tr>



               <!-- AffyMetrics data -- no data yet, will need to reformat when available -->
               <%--
	         <% if ( data.get_SDTm() != null ) { %>
	         <tr>
	            <th class="sm" align="left">SDTm</th>
	            <td class="sm">&nbsp;&nbsp;</td>
	            <td class="sm"><%= data.get_SDTm() %></td>
	         </tr>
	         <% } %>
	         
	         <% if ( data.get_SRT() != null ) { %>
	         <tr>
	            <th class="sm" align="left">SRT</th>
	            <td class="sm">&nbsp;&nbsp;</td>
	            <td class="sm"><%= data.get_SRT() %></td>
	         </tr>
	         <% } %>

	         <% if ( data.get_noise() != null ) { %>
	         <tr>
	            <th class="sm" align="left">noise</th>
	            <td class="sm">&nbsp;&nbsp;</td>
	            <td class="sm"><%= data.get_noise() %></td>
	         </tr>
	         <% } %>

	         <% if ( data.get_FC_intensity_threshold() != null ) { %>
	         <tr>
	            <th class="sm" align="left">Fold Change Intensity Threshold</th>
	            <td class="sm">&nbsp;&nbsp;</td>
	            <td class="sm"><%= data.get_FC_intensity_threshold() %></td>
	         </tr>
	         <% } %>

	         <% if ( data.get_abs_dec_matrix() != null ) { %>
	         <tr>
	            <th class="sm" align="left">Absolute Decision Matrix</th>
	            <td class="sm">&nbsp;&nbsp;</td>
	            <td class="sm"><%= data.get_abs_dec_matrix() %></td>
	         </tr>
	         <% } %>

	         <% if ( data.get_background_avg() != null ) { %>
	         <tr>
	            <th class="sm" align="left">Background average</th>
	            <td class="sm">&nbsp;&nbsp;</td>
	            <td class="sm"><%= data.get_background_avg() %></td>
	         </tr>
	         <% } %>

	         <% if ( data.get_background_stdev() != null ) { %>
	         <tr>
	            <th class="sm" align="left">Background standard deviation</th>
	            <td class="sm">&nbsp;&nbsp;</td>
	            <td class="sm"><%= data.get_background_stdev() %></td>
	         </tr>
	         <% } %>

	         <% if ( data.get_central_minus_count() != null ) { %>
	         <tr valign="top">
	            <th class="sm" align="left">Central minus</th>
	            <td class="sm">&nbsp;&nbsp;</td>
	            <td class="sm">
                        <table cellpadding="2" cellspacing="0" border="0">
                             <tr>
                                <th class="sm" align="left">Count</th>
                                <th class="sm" align="left">Average</th>
                             </tr>

                             <tr>
                                <td class="sm" align="left"><%= data.get_central_minus_count() %></td>
                                <td class="sm" align="left"><%= data.get_central_minus_avg() %></td>
                             </tr>
	                 </table>
                     </td>
	         </tr>
	         <% } %>

	         <% if ( data.get_corner_minus_count() != null ) { %>
	         <tr valign="top">
	            <th class="sm" align="left">Corner minus</th>
	            <td class="sm">&nbsp;&nbsp;</td>
	            <td class="sm">
                        <table cellpadding="2" cellspacing="0" border="0">
                             <tr>
                                <th class="sm" align="left">Count</th>
                                <th class="sm" align="left">Average</th>
                             </tr>

                             <tr>
                                <td class="sm" align="left"><%= data.get_corner_minus_count() %></td>
                                <td class="sm" align="left"><%= data.get_corner_minus_avg() %></td>
                             </tr>
	                 </table>
                     </td>
	         </tr>
	         <% } %>

	         <% if ( data.get_corner_plus_count() != null ) { %>
	         <tr valign="top">
	            <th class="sm" align="left">Corner plus</th>
	            <td class="sm">&nbsp;&nbsp;</td>
	            <td class="sm">
                        <table cellpadding="2" cellspacing="0" border="0">
                             <tr>
                                <th class="sm" align="left">Count</th>
                                <th class="sm" align="left">Average</th>
                             </tr>

                             <tr>
                                <td class="sm" align="left"><%= data.get_corner_plus_count() %></td>
                                <td class="sm" align="left"><%= data.get_corner_plus_avr() %></td>
                             </tr>
	                 </table>
                     </td>
	         </tr>
	         <% } %>

                --%>
               <!-- end affymetrics data -->
                <% } // end hyb data while %>
              </table>
           </td>
        </tr> 
        </form>
        <% } // end hyb data if %>


       <!-- show data specific to this hyb description if not common to entire collection -->
       <% if ( !hasCommonArrayDesign && hybDescr.hasArrayDesign() ) { %>
        <tr valign="top" <%= bgColor %>>
            <th class="sm" align="left" nowrap>Array Information<%=DefinitionsLookup.createPopupLink("ArrayDesign","class")%></td>
	    <td class="sm">
                <table cellpadding="2" cellspacing="0" border="0" width="100%">
                   <tr valign="bottom">

                     <% if ( hybDescr.get_array_design_name() != null ) { %>
                      <th class="sm" align="left">Name</th>
                     <% } %>

                     <% if ( hybDescr.get_array_manufacturer() != null ) { %>
	              <th class="sm" align="left">Manufacturer</th>
                     <% } %>

                     <% if ( hybDescr.get_platform_type() != null ) { %>
	              <th class="sm" align="left">Platform type<%=DefinitionsLookup.createPopupLink("ArrayDesign","platform_type")%></th>
                     <% } %>

                     <% if ( hybDescr.get_surface_type() != null ) { %>
	              <th class="sm" align="left">Surface type<%=DefinitionsLookup.createPopupLink("ArrayDesign","surface_type")%></th>
                     <% } %>

                     <% if ( hybDescr.get_num_spots() != null ) { %>
	              <th class="sm" align="left">Num spots</th>
                     <% } %>

                     <% if ( hybDescr.get_number_of_slides() != null ) { %>
	              <th class="sm" align="left">Num slides</th>
                     <% } %>

                     <% if ( hybDescr.get_array_description() != null ) { %>
	              <th class="sm" align="left">Description</th>
                     <% } %>
	           </tr>
 
	           <tr>
                     <% if ( hybDescr.get_array_design_name() != null ) { %>
                      <td class="sm" nowrap><%= hybDescr.get_array_design_name() %></td>
                     <% } %>

                     <% if ( hybDescr.get_array_manufacturer() != null ) { %>
	              <td class="sm"><%= hybDescr.get_array_manufacturer() %></td>
                     <% } %>

                     <% if ( hybDescr.get_platform_type() != null ) { %>
	              <td class="sm"><%= hybDescr.get_platform_type() %></td>
                     <% } %>

                     <% if ( hybDescr.get_surface_type() != null ) { %>
	              <td class="sm"><%= hybDescr.get_surface_type() %></td>
                     <% } %>

                     <% if ( hybDescr.get_num_spots() != null ) { %>
	              <td class="sm"><%= hybDescr.get_num_spots() %></td>
                     <% } %>

                     <% if ( hybDescr.get_number_of_slides() != null ) { %>
	              <td class="sm"><%= hybDescr.get_number_of_slides() %></td>
                     <% } %>

                     <% if ( hybDescr.get_array_description() != null ) { %>
	              <td class="sm"><%= hybDescr.get_array_description() %></td>
                     <% } %>
	           </tr>
               </table>
           </td>
        </tr>

      <% } %>

        <tr <%= bgColor %> >
           <td class="sm" colspan="2">&nbsp;</td>
        </tr>

     <% } // end hyb description while %>



      <!-- display info common to all hybridizations if possible -->
       <% HybDescriptionObject hybDescription = null; %>
       <% if ( hasCommonArrayDesign || hasCommonProtocol || hasCommonScanningSoftware || hasCommonScanningHardware || hasCommonNormalizationDesc ) {
             hybDescr = detail.getRepresentativeHybDescription();
       %>


       <% if ( hasCommonArrayDesign && hybDescr.get_array_design_id() != null ) { %>   
        <tr valign="top">
            <th class="sm" align="left" nowrap>Array Information<%=DefinitionsLookup.createPopupLink("ArrayDesign","class")%></td>
	    <td class="sm">
                <table cellpadding="2" cellspacing="0" border="0" width="100%">
                   <tr valign="bottom">

                     <% if ( hybDescr.get_array_design_name() != null ) { %>
                      <th class="sm" align="left">Name</th>
                     <% } %>

                     <% if ( hybDescr.get_array_manufacturer() != null ) { %>
	              <th class="sm" align="left">Manufacturer</th>
                     <% } %>

                     <% if ( hybDescr.get_platform_type() != null ) { %>
	              <th class="sm" align="left">Platform type<%=DefinitionsLookup.createPopupLink("ArrayDesign","platform_type")%></th>
                     <% } %>

                     <% if ( hybDescr.get_surface_type() != null ) { %>
	              <th class="sm" align="left">Surface type<%=DefinitionsLookup.createPopupLink("ArrayDesign","surface_type")%></th>
                     <% } %>

                     <% if ( hybDescr.get_num_spots() != null ) { %>
	              <th class="sm" align="left">Num spots</th>
                     <% } %>

                     <% if ( hybDescr.get_number_of_slides() != null ) { %>
	              <th class="sm" align="left">Num slides</th>
                     <% } %>

                     <% if ( hybDescr.get_array_description() != null ) { %>
	              <th class="sm" align="left">Description</th>
                     <% } %>
	           </tr>
 
	           <tr>
                     <% if ( hybDescr.get_array_design_name() != null ) { %>
                      <td class="sm" nowrap><%= hybDescr.get_array_design_name() %></td>
                     <% } %>

                     <% if ( hybDescr.get_array_manufacturer() != null ) { %>
	              <td class="sm"><%= hybDescr.get_array_manufacturer() %></td>
                     <% } %>

                     <% if ( hybDescr.get_platform_type() != null ) { %>
	              <td class="sm"><%= hybDescr.get_platform_type() %></td>
                     <% } %>

                     <% if ( hybDescr.get_surface_type() != null ) { %>
	              <td class="sm"><%= hybDescr.get_surface_type() %></td>
                     <% } %>

                     <% if ( hybDescr.get_num_spots() != null ) { %>
	              <td class="sm"><%= hybDescr.get_num_spots() %></td>
                     <% } %>

                     <% if ( hybDescr.get_number_of_slides() != null ) { %>
	              <td class="sm"><%= hybDescr.get_number_of_slides() %></td>
                     <% } %>

                     <% if ( hybDescr.get_array_description() != null ) { %>
	              <td class="sm"><%= hybDescr.get_array_description() %></td>
                     <% } %>
	           </tr>
               </table>
           </td>
        </tr>
       <% } %>   

       <% if ( hasCommonProtocol && hybDescr.get_protocol_title() != null ) { %>
        <tr>
          <th class="sm" align="left" nowrap>Hybridization protocol<%=DefinitionsLookup.createPopupLink("HybDescription","hyb_protocol_ref_id")%></th>
          <td class="sm"><a href="/servlets/TairObject?type=protocol&id=<%= hybDescr.get_hyb_protocol_ref_id() %>"><%= hybDescr.get_protocol_title() %></a></td>
        </tr>
       <% } %>

       <% if ( hasCommonScanningSoftware && hybDescr.get_program_name() != null ) { %>
       <tr>
          <th class="sm" align="left" nowrap>Scanning software<%=DefinitionsLookup.createPopupLink("HybDescription","scanning_software_id")%></th>
          <td class="sm"><%= hybDescr.get_program_name() %></td>
       </tr>
       <% } %>

       <% if ( hasCommonScanningHardware && hybDescr.get_scanner() != null ) { %>
       <tr>
          <th class="sm" align="left" nowrap>Scanning hardware<%=DefinitionsLookup.createPopupLink("HybDescription","scanner")%></th>
          <td class="sm"><%= hybDescr.get_scanner() %></td>
       </tr>
       <% } %>

      <% if ( hasCommonNormalizationDesc && hybDescr.get_normalization_desc() != null ) { %>
      <tr valign="top">
         <th class="sm" align="left" nowrap>Normalization description<%=DefinitionsLookup.createPopupLink("HybDescription","normalization_desc")%></th>
         <td class="sm"><%= hybDescr.get_normalization_desc() %></td>
      </tr>
      <% } %>

    <% } // end common data if %>

   <!-- show link to hyb description collection detail page if expression set has associated data -->
   <% } else if ( detail.getNumberHybDescriptions() > 0 ) { %>
       <tr bgcolor="<%= DataConstants.BGCOLOR %>" >
 	 <th class="sm" align="left">Hybridization Information</th>
         <td class="sm"><b><a href="/servlets/TairObject?type=hyb_descr_collection&id=<%= detail.get_tair_object_id() %>">View Complete Listing</a></b></td>
      </tr>
   <% } // end hybridization if %>
