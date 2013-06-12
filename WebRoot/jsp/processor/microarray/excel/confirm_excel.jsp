<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="java.util.*, org.tair.processor.microarray.excel.*, org.tair.processor.microarray.data.*, org.tair.tfc.*, org.tair.querytools.*, org.tair.processor.genesymbol.*, org.tair.bs.community.*, org.tair.utilities.*"
%>

<%!
String pageName = "Upload Microarray Excel File";
%>

<%

LoadableExpressionSet expressionSet = (LoadableExpressionSet) request.getAttribute( "expressionSet" );
ExcelLogger logger = (ExcelLogger) request.getAttribute( "logger" );
ExcelRowTracker rowTracker = (ExcelRowTracker) request.getAttribute( "rowTracker" );

%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />


<style>
.parse_error { font-size: 10pt; color: #FF0000; }
.parse_warning { font-size: 10pt; color: #FF8429; }

.field_name { font-size: 10pt; color: blue; }
.field_value { font-size: 10pt; }

</style>

<H4>Excel Parsing Results</H4>

Errors are displayed in <font class="parse_error">red</font>.

<p>
Warnings are displayed in <font class="parse_warning">yellow</font>.

<p>
Database loading will not continue if any errors have been encountered.
Loading will proceed with warnings, though some data may be skipped.

<p>
General Validation Rules for Submission:

<OL>
<LI> Title column with "*" is a required field that can not be empty.  <br>
<LI> Multiple values in one field are separated by "|", not "," or "/" <br>
<LI> Date format is "MMM dd yyyy", e.g. 'Apr 20 2004' <br>
<LI> Special character such as &gt;, &lt;, &quot;, &amp;, ' are not allowed <br>
<LI> Keywords, community id, germplasm tair accession, germplasm name or stock number, species_variant name, gene name, allele name, clone name, protocol, pubmed_id, array design, and array design software name are validated from database <br> 


<br>
</OL>

	    <% int row = 1; // experiment sheet only has one row of data %>
	    
	    <table width="100%" cellspacing="0">
	      <tr <%= myBgColor.toggleBgColor() %>>
		<td colspan="3"<h4> Sheet : Experiment </h4></td>
	      </tr>
	      
	      
	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Experiment.name</font></td> 
		<td><font class="field_value"><%= EmptyTextConverter.convert( expressionSet.get_original_name() ) %></font></td>
		<td><%= logger.getMessages( "experiment", row, "experiment name" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Experiment.description</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( expressionSet.get_description() ) %></font></td>
		<td><%= logger.getMessages( "experiment", row, "description" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Experiment.is_series</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( expressionSet.get_is_series() ) %></font></td>
		<td><%= logger.getMessages( "experiment", row, "is series" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Experiment.series_type</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( expressionSet.get_series_type() ) %></font></td>
		<td><%= logger.getMessages( "experiment", row, "series type" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Experiment.environment_is_variable</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( expressionSet.get_environment_is_variable() ) %></font></td>
		<td><%= logger.getMessages( "experiment", row, "environment is variable" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Experiment.plant_material_is_variable</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( expressionSet.get_plant_material_is_variable() ) %></font></td>
		<td><%= logger.getMessages( "experiment", row, "plant material is variable" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Experiment.probe_type_is_variable</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( expressionSet.get_probe_type_is_variable() ) %></font></td>
		<td><%= logger.getMessages( "experiment", row, "probe type is variable" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Experiment.harvesting_is_variable</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( expressionSet.get_harvesting_is_variable() ) %></font></td>
		<td><%= logger.getMessages( "experiment", row, "harvesting is variable" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Publication.PubMed_id</font></td>
		<td>
		  <% if ( expressionSet.hasPublications() ) { 
		         boolean first = true;
		         TairObjectPublication publication = null;
		         Iterator pubIter = expressionSet.getPublications();
                         while ( pubIter.hasNext() ) {
                            publication = (TairObjectPublication) pubIter.next();
                            if ( !first ) {
                                 out.write( "<br>" );
                            }
                            first = false;
                  %>

		            <a href="/servlets/TairObject?type=publication&id=<%= publication.get_reference_id() %>"><%= publication.get_title() %></a> 
 		            (<font class="field_value"><%= publication.get_pubmed_id() %></font>)
                      <% } %>
                  <% } %>
		  &nbsp;
		</td>

		<td><%= logger.getMessages( "experiment", row, "pub med id" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Experiment.date</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( TextConverter.dateToString( expressionSet.get_exp_date() ) ) %></font></td>
		<td><%= logger.getMessages( "experiment", row, "experiment date" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Experiment.authors</font></td>
		<td>
		  <% if ( expressionSet.hasAttributions() ) { 
		         boolean first = true;
                         for ( BsAttribution author : expressionSet.getAttributions() ) {
                            author = (BsAttribution) attribIter.next();
                            if ( !first ) {
                                 out.write( "<br>" );
                            }
                            first = false;
                  %>

  		            <a href="/servlets/TairObject?type=<%= author.getCommunity().getCommunityType() %>&id=<%= author.getCommunityId().toString() %>"><%= author.getCommunity().getName() %></a> 
 		            (<font class="field_value"><%= author.get_community_id() %></font>)
                      <% } %>
                  <% } %>
		  &nbsp;
		</td>

		<td><%= logger.getMessages( "experiment", row, "authors" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Experiment_Keyword.category</font></td>
		<td>
		  <% if ( expressionSet.hasExperimentCategories() ) { 
		         boolean first = true;
		         LoadableTairObjectKeyword keyword = null;
		         Iterator catIter = expressionSet.getExperimentCategories();
                         while ( catIter.hasNext() ) {
                            keyword = (LoadableTairObjectKeyword) catIter.next();
                            if ( !first ) {
                                 out.write( "<br>" );
                            }
                            first = false;
                  %>
		            <font class="field_value"><%= keyword.get_keyword() %></font>
                      <% } %>
                  <% } %>
		  &nbsp;
		</td>
		<td><%= logger.getMessages( "experiment", row, "category" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Experiment_Keyword.goals</font></td>
		<td>
		  <% if ( expressionSet.hasExperimentalGoals() ) { 
		         boolean first = true;
		         LoadableTairObjectKeyword keyword = null;
		         Iterator goalIter = expressionSet.getExperimentalGoals();
                         while ( goalIter.hasNext() ) {
                            keyword = (LoadableTairObjectKeyword) goalIter.next();
                            if ( !first ) {
                                 out.write( "<br>" );
                            }
                            first = false;
                  %>
		            <font class="field_value"><%= keyword.get_keyword() %></font>
                      <% } %>
                  <% } %>
		  &nbsp;
		</td>
		<td><%= logger.getMessages( "experiment", row, "goal" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Experiment_keyword.experimental_factors</font></td>
		<td>
		  <% if ( expressionSet.hasExperimentalFactors() ) { 
		         boolean first = true;
		         LoadableTairObjectKeyword keyword = null;
		         Iterator factorIter = expressionSet.getExperimentalFactors();
                         while ( factorIter.hasNext() ) {
                            keyword = (LoadableTairObjectKeyword) factorIter.next();
                            if ( !first ) {
                                 out.write( "<br>" );
                            }
                            first = false;
                  %>
		            <font class="field_value"><%= keyword.get_keyword() %></font>
                      <% } %>
                  <% } %>
		  &nbsp;
		</td>
		<td><%= logger.getMessages( "experiment", row, "experimental factor" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Experiment.number_of_rep_sets</font> (submitted)</td>
		<td><font class="field_value"><%= expressionSet.getNumberHybDescriptions() %></font></td>
		<td><%= logger.getMessages( "experiment", row, "number rep. sets" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Experiment.number_of_samples</font> (submitted)</td>
		<td><font class="field_value"><%= expressionSet.getNumberBioSamples() %></font></td>
		<td><%= logger.getMessages( "experiment", row, "number samples" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Experiment.number_of_slides</font> (submitted)</td>
		<td><font class="field_value"><%= expressionSet.getNumberHybDataSlides() %></font></td>
		<td><%= logger.getMessages( "experiment", row, "number slides" ) %></td>
	      </tr>
	    </table>

	    <!-- End Experiments Sheet -->


	    <!-- Begin Replicate Sets Sheet -->
	    <br><br>

	    <table width="100%" cellspacing="0">
	      <tr <%= myBgColor.toggleBgColor() %>>
		<td colspan="3"<h4> Sheet : Replicate Sets </h4></td>
	      </tr>

            <% int totalRows = rowTracker.getNumberReplicateSetRows();

	       LoadableHybDescription hybDescription = null;
	       String hybDescriptionName = null;

	       for ( row = 1; row <= totalRows; row++ ) {
                   hybDescriptionName = rowTracker.getReplicateSetRow( row );
                   hybDescription = expressionSet.getHybDescription( hybDescriptionName );
            %>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*ReplicateSet.name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescription.get_name() ) %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "replicate set name" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*ReplicateSet.is_multichannel</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescription.get_is_multichannel() ) %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "is multichannel" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">ReplicateSet.is_reverse_dye</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescription.get_is_reverse_dye() ) %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "is reverse dye" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">ReplicateSet.reverse_id</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescription.getReverseName() ) %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "reverse id" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">ReplicateSet.controller_id</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescription.getControllerName() ) %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "controller" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*ReplicateSet.scanning_software_name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescription.get_program_name() ) %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "scanning software name" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">ReplicateSet.scanning_sofware_version</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescription.get_version() ) %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "scanning software version" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*ReplicateSet.scanner</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescription.get_scanner() ) %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "scanner" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">ReplicateSet.normalization_description</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescription.get_normalization_desc() ) %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "normalization description" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*ArrayDesign.name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescription.get_array_design_name() ) %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "array design name" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">ReplicateSet.num_of_slides</font> (actual)</td>
		<td><font class="field_value"><%= hybDescription.getNumberHybData() %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "number slides" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">HybridizationProtocol.name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescription.get_protocol_title() ) %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "hybridization protocol name" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">HybridizationProtocol.PubMed_id</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescription.get_protocol_pubmed_id() ) %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "hybridization protocol pub med id" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">HybridizationProtocol.description</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescription.get_protocol_description() ) %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "hybridization protocol description" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">HybridizationProtocol.authors</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescription.get_protocol_authors() ) %></font></td>
		<td><%= logger.getMessages( "replicate_hybs", row, "hybridization protocol authors" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">HybridizationProtocol.URL</font></td>
		<td>
                     <% Iterator hybIter = hybDescription.getProtocolURLs();
                        if ( hybIter != null ) {
                            ReferenceURL url = null;
                            boolean first = true;
                            while ( hybIter.hasNext() ) {
                                url = (ReferenceURL) hybIter.next();
                                if ( !first ) {
                                   out.write( "<br>" );
                                }
                                first = false;
                     %>
		               <font class="field_value"><%= url.get_url() %></font>
                         <% } %>
                     <% } %>
                </td>
		<td><%= logger.getMessages( "replicate_hybs", row, "hybridization protocol url" ) %></td>
	      </tr>

              <tr>
                <td colspan="3"><hr></td>
              </tr>

            <% } %>

	    </table>

	    <!-- End Replicate Sets Sheet -->


	    <!-- Begin Slides Sheet -->
	    <br><br>
	    <table width="100%" cellspacing="0">
	      <tr <%= myBgColor.toggleBgColor() %>>
		<td colspan="3"<h4> Sheet : Slides </h4></td>
	      </tr>

            <% totalRows = rowTracker.getNumberSlideRows();

	      // get hyb data slide from expression set through hyb 
	      // description that contains it

               HybData hybData = null;
	       String hybDataName = null;

	       for ( row = 1; row <= totalRows; row++ ) {
                   hybDataName = rowTracker.getSlideRow( row );
                   hybDescriptionName = rowTracker.getReplicateSetSlideRow( row );

	           hybDescription = expressionSet.getHybDescription( hybDescriptionName );
                   hybData = hybDescription.getHybData( hybDataName );
            %>

 	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*ReplicateSet.name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybDescriptionName ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "replicate set name" ) %></td>
	      </tr>

 	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Slide.name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_original_name() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "slide name" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Slide.is_tech_replicate</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_is_tech_replicate() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "is tech replicate" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Slide.is_bio_replicate</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_is_bio_replicate() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "is bio replicate" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Slide.scan_parameters</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_scan_parameters() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "scan parameters" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Slide.normalization_factor</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_normalization_factor() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "normalization factor" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Slide.scale_factor</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_scaling_factor() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "scaling factor" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Slide.results_file_name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_txt_file_name() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "txt file name" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Slide.cel_name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_cel_name() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "cel name" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Slide.dat_name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_dat_name() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "dat name" ) %></td>
	      </tr>

           <!-- only show affy rows if slide has affy data to cut down on display noise -->
           <% if ( hybData.hasAffyMetrics() ) { %>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.SDTm</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_SDTm() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "SDTm" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.SRT</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_SRT() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "SRT" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.FC_intensity</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_FC_intensity_threshold() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "FC intensity threshold" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.abs_dec_matrix</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_abs_dec_matrix() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "abs dec matrix" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.central_minus_count</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_central_minus_count() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "central minus count" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.central_minus_avg</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_central_minus_avg() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "central minus average" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.corner_plus_count</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_corner_plus_count() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "corner plus count" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.corner_plus_average</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_corner_plus_avr() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "corner plus average" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.corner_minus_count</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_corner_minus_count() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "corner minus count" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.corner_minus_average</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_corner_minus_avg() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "corner minus average" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.background_avg</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_background_avg() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "background average" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.background.stdev</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_background_stdev() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "background stdev" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.noise</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_noise() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "noise" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.alpha1</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_alpha1() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "alpha1" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.alpha2</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_alpha2() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "alpha2" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.tau</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_tau() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "tau" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.TGT_value</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_TGT_value() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "TGT value" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.Gamma1H</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_gamma1h() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "gamma1h" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.Gamma1L</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_gamma1l() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "gamma1l" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.Gamma2H</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_gamma2h() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "gamma2h" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.Gamma2L</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_gamma2l() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "gamma2l" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Affymetrix.Perturbation</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_perturbation() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "perturbation" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">AffyMetrix.noise_raw</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_baseline_noise() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "baseline noise" ) %></td>
	      </tr> 

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">AffyMetrix.Baseline_SF</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( hybData.get_baseline_sf() ) %></font></td>
		<td><%= logger.getMessages( "slides", row, "baseline sf" ) %></td>
	      </tr> 
             <% } // end affymetrics data %>

            <tr>
               <td colspan="3"><hr></td>
            </tr>

           <% } %>

	    </table>

	    <!-- End Slides Sheet -->


	    <!-- Begin Samples Sheet -->
	    <br><br>
	    <table width="100%" cellspacing="0">
	      <tr <%= myBgColor.toggleBgColor() %>>
		<td colspan="3"<h4> Sheet : Samples</h4></td>
	      </tr>

            <% totalRows = rowTracker.getNumberSampleRows();

	      // get bio sample name and labeled sample name for row
	      LoadableBioSample bioSample = null;
	      String bioSampleName = null;

      	      LoadableLabeledSample labeledSample = null;
              String labeledSampleName = null;

	       for ( row = 1; row <= totalRows; row++ ) {
	           bioSampleName = rowTracker.getBioSampleRow( row );
                   labeledSampleName = rowTracker.getLabeledSampleRow( row );

	           bioSample = expressionSet.getBioSample( bioSampleName );

	          // labeled sample could have multiple entries for name if
    	          // multiple replicate sets entered for sample -- get first one
	          // as representative 
                  labeledSample = expressionSet.getFirstLabeledSample( labeledSampleName );

            %>

 	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*ReplicateSet.name</font></td>

		<!-- could be multiple replicate set names submitted -- each
                     will result in a new labeled sample with this row of
                     sample data -->
		<td>
                     <!-- get all replicate set names for submitted labeled sample -->
                     <% Iterator repIter = expressionSet.getLabeledSampleHybDescriptions( labeledSampleName );
                        if ( repIter != null ) {
                            String name = null;
                            boolean first = true;
                            while ( repIter.hasNext() ) {
                                name = (String) repIter.next();
                                if ( !first ) {
                                   out.write( "<br>" );
                                }
                                first = false;
                     %>
		               <font class="field_value"><%= name %></font>
                         <% } %>
                     <% } %>
		</td>

		<td><%= logger.getMessages( "samples", row, "replicate set name" ) %></td>
	      </tr>



	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*BioSample.name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_name() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "sample name" ) %></td>
	      </tr> 

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*Biomaterial_type</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_biomaterial_type() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "bio material type" ) %></td>
	      </tr> 

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Germplasm.TAIR_accession</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_germplasm_tair_object_id() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "germplasm accession" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Germplasm.name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_germplasm_original_name() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "germplasm name" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Germplasm.stock_number</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.getStockNumber() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "germplasm stock number" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Biomaterial_description</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_biomaterial_description() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "bio material description" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">BioSample.is_control</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_is_control() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "is control" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*BioSample.growth_description</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_growth_description() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "growth description" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*BioSample.treatment_description</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_treatment_description() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "treatment description" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*BioSample.anatomy_description</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_anatomy_description() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "anatomy description" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*BioSample.development_description</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_development_description() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "development description" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">BioSample.probe_type</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_probe_type() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "probe type" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*LabeledSample.name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( labeledSample.get_name() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "labeled sample name" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*LabeledSample.label</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( labeledSample.get_label() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "label" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">LabeledSample.channel_number</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( labeledSample.get_channel_number() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "channel number" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">LabelingProtocol.name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( labeledSample.get_protocol_title() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "labeling protocol title" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">LabelingProtocol.PubMed_id</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( labeledSample.get_protocol_pubmed_id() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "labeling protocol pub med id" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">LabelingProtocol.description</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( labeledSample.get_protocol_description() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "labeling protocol description" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">LabelingProtocol.authors</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( labeledSample.get_protocol_authors() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "labeling protocol authors" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">LabelingProtocol.URL</font></td>
		<td>
                     <% Iterator labIter = labeledSample.getLabelingProtocolURLs();
                        if ( labIter != null ) {
                            ReferenceURL url = null;
                            boolean first = true;
                            while ( labIter.hasNext() ) {
                                url = (ReferenceURL) labIter.next();
                                if ( !first ) {
                                   out.write( "<br>" );
                                }
                                first = false;
                     %>
		               <font class="field_value"><%= url.get_url() %></font>
                         <% } %>
                     <% } %>
                </td>
		<td><%= logger.getMessages( "samples", row, "labeling protocol url" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">RNA_IsolationProtocol.name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_protocol_title() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "isolation protocol title" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">RNA_IsolationProtocol.PubMed_id</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_protocol_pubmed_id() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "isolation protocol pub med id" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">RNA_IsolationProtocol.description</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_protocol_description() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "isolation protocol description" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">RNA_IsolationProtocol.authors</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSample.get_protocol_authors() ) %></font></td>
		<td><%= logger.getMessages( "samples", row, "isolation protocol authors" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">RNA_IsolationProtocol.URL</font></td>
		<td>
                     <% Iterator isoIter = bioSample.getExtractionProtocolURLs();
                        if ( isoIter != null ) {
                            ReferenceURL url = null;
                            boolean first = true;
                            while ( isoIter.hasNext() ) {
                                url = (ReferenceURL) isoIter.next();
                                if ( !first ) {
                                   out.write( "<br>" );
                                }
                                first = false;
                     %>
		               <font class="field_value"><%= url.get_url() %></font>
                         <% } %>
                     <% } %>
                </td>
		<td><%= logger.getMessages( "samples", row, "isolation protocol url" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">BioSample.structure_keyword</font></td>
		<td>
		  <% if ( bioSample.hasStructureKeywords()) { 
		         boolean first = true;
		         LoadableBioSampleKeyword keyword = null;
		         Iterator anatIter = bioSample.getStructureKeywords();
                         while ( anatIter.hasNext() ) {
                            keyword = (LoadableBioSampleKeyword) anatIter.next();
                            if ( !first ) {
                                 out.write( "<br>" );
                            }
                            first = false;
                  %>
		            <font class="field_value"><%= keyword.get_keyword() %></font>
                      <% } %>
                  <% } %>
		  &nbsp;
		</td>
		<td><%= logger.getMessages( "samples", row, "anatomy" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">BioSample.developmental_stage_keyword</font></td>
		<td>
		  <% if ( bioSample.hasDevelopmentalStages() ) { 
		         boolean first = true;
		         LoadableBioSampleKeyword keyword = null;
		         Iterator devIter = bioSample.getDevelopmentalStages();
                         while ( devIter.hasNext() ) {
                            keyword = (LoadableBioSampleKeyword) devIter.next();
                            if ( !first ) {
                                 out.write( "<br>" );
                            }
                            first = false;
                  %>
		            <font class="field_value"><%= keyword.get_keyword() %></font>
                      <% } %>
                  <% } %>
		  &nbsp;
		</td>
		<td><%= logger.getMessages( "samples", row, "development" ) %></td>
	      </tr>


              <tr>
                <td colspan="3"><hr></td>
              </tr>

            <% } %>

	    </table>

	    <!-- End Samples Sheet -->


	    <!-- Begin Environmental Conditions Sheet -->
	    <br><br>
	    <table width="100%" cellspacing="0">
	      <tr <%= myBgColor.toggleBgColor() %>>
		<td colspan="3"<h4> Sheet : Environmental Conditions</h4></td>
	      </tr>

            <% totalRows = rowTracker.getNumberEnvCondRows();

	      // get env. condition from expression set through bio 
	      // sample that contains it

	      BioSamEnvConObject envCond = null;
	      String conditionName = null;

	       for ( row = 1; row <= totalRows; row++ ) {

	           conditionName = rowTracker.getEnvCondRow( row );
                   bioSampleName = rowTracker.getBioSampleEnvCondRow( row );

	           bioSample = expressionSet.getBioSample( bioSampleName );
                   envCond = bioSample.getEnvironmentalCondition( conditionName );
            %>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*BioSample.id</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( bioSampleName ) %></font></td>
		<td><%= logger.getMessages( "env_cond", row, "sample name" ) %></td>
	      </tr> 

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">EnvironmentalCondition.type</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( envCond.get_condition_type() ) %></font></td>
		<td><%= logger.getMessages( "env_cond", row, "condition type" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">EnvironmentalCondition.name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( envCond.get_condition_name() ) %></font></td>
		<td><%= logger.getMessages( "env_cond", row, "condition name" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">EnvironmentalCondition.value</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( envCond.get_condition_value() ) %></font></td>
		<td><%= logger.getMessages( "env_cond", row, "condition value" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">EnvironmentalCondition.condition_description</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( envCond.get_condition_description() ) %></font></td>
		<td><%= logger.getMessages( "env_cond", row, "condition description" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">EnvironmentalCondition.condition_duration</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( envCond.get_condition_duration() ) %></font></td>
		<td><%= logger.getMessages( "env_cond", row, "condition duration" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">EnvironmentalCondition.condition_duration_units</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( envCond.get_duration_units() ) %></font></td>
		<td><%= logger.getMessages( "env_cond", row, "condition duration units" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">EnvironmentalCondition.application_frequency</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( envCond.get_application_frequency() ) %></font></td>
		<td><%= logger.getMessages( "env_cond", row, "application frequency" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">EnvironmentalCondition.is_expt_variable</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( envCond.get_is_experimental_variable() ) %></font></td>
		<td><%= logger.getMessages( "env_cond", row, "is experimental variable" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">EnvironmentalCondition.order</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( envCond.get_order_number() ) %></font></td>
		<td><%= logger.getMessages( "env_cond", row, "order" ) %></td>
	      </tr>

              <tr>
                <td colspan="3"><hr></td>
              </tr>

            <% } %>

	    </table>

	    <!-- End Environmental Conditions Sheet -->


	    <!-- Begin Germplasm Sheet -->
	    <br><br>
	    <table width="100%" cellspacing="0">
	      <tr <%= myBgColor.toggleBgColor() %>>
		<td colspan="3"<h4> Sheet : Germplasm</h4></td>
	      </tr>


            <% totalRows = rowTracker.getNumberGermplasmRows();

	       // get germplasm from expression set through a bio
	       // sample that contains it (doesn't matter which one)

               LoadableGermplasm germplasm = null;
	       String germplasmName = null;

	       for ( row = 1; row <= totalRows; row++ ) {
	           germplasmName = rowTracker.getGermplasmRow( row );
                   bioSampleName = rowTracker.getBioSampleGermplasmRow( row );

	           bioSample = expressionSet.getBioSample( bioSampleName );
                   germplasm = bioSample.getGermplasm();
            %>


              <!-- could be multiple bio sample names submitted for each germplasm -->
	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">*BioSample.name</font></td>

		<td>
                    <% if ( germplasm.hasBioSampleNames() ) { 
                           Iterator bioSamIter = germplasm.getBioSampleNames();
                           boolean first = true;
                           while ( bioSamIter.hasNext() ) {
                                bioSampleName = (String) bioSamIter.next();
                                if ( !first ) {
                                     out.write( "<br>" );
                                }
                                first = false;
                    %>
                                <font class="field_value"><%= bioSampleName %></font>
                         <% } %>
                    <% } %>
                    &nbsp;
                </td>
		<td><%= logger.getMessages( "germplasm", row, "sample name" ) %></td>
	      </tr> 

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Germplasm.name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_original_name() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "germplasm name" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Germplasm.species_variant</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_species_variant_abbrev_name() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "species variant" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Germplasm.special_growth_conditions</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_special_growth_conditions() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "growth conditions" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Germplasm.description</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_description() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "description" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Germplasm.is_natural_variant</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_is_natural_variant() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "is natural variant" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Germplasm.is_mutant</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_is_mutant() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "is mutant" ) %></td>
	      </tr> 

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Germplasm.mutagen</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_mutagen() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "mutagen" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Germplasm.allele</font></td>
		<td><font class="field_value">
                   <% if ( germplasm.hasPolymorphisms() ) {
                         TfcPolymorphism poly = null;
		         boolean first = true;
		         Iterator polyIter = germplasm.getPolymorphisms();
                         while ( polyIter.hasNext() ) {
                            poly = (TfcPolymorphism) polyIter.next();
                            if ( !first ) {
                                 out.write( "<br>" );
                            }
                            first = false;
                  %>

  		            <a href="/servlets/TairObject?type=polyallele&id=<%= poly.get_polymorphism_id() %>"><%= poly.get_original_name() %></a> 
                      <% } %>
                  <% } %>
		  &nbsp;
		<td><%= logger.getMessages( "germplasm", row, "allele" ) %></td>
	      </tr>


	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Germplasm.has_foreign_dna</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_has_foreign_dna() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "has foreign dna" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Clone.name</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_clone_name() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "clone name" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Clone.insert_type</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_clone_insert_type() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "clone insert type" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Construct.type</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_clone_construct_type() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "clone construct type" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Construct.inserted_gene</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_clone_gene_name() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "clone gene name" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">InsertedGene.taxon</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_clone_taxon_scientific_name() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "gene taxon" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Construct.promoter</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_clone_promoter() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "clone promoter" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Construct.reporter</font></td>
		<td><font class="field_value"><%= EmptyTextConverter.convert( germplasm.get_clone_reporter() ) %></font></td>
		<td><%= logger.getMessages( "germplasm", row, "clone reporter" ) %></td>
	      </tr>

	      <tr <%= myBgColor.toggleBgColor() %>>
		<td><font class="field_name">Publication.PubMed_id</font></td>
		<td>
		  <% if ( germplasm.hasPublications() ) { 
		         boolean first = true;
		         TairObjectPublication publication = null;
		         Iterator germPubIter = germplasm.getPublications();
                         while ( germPubIter.hasNext() ) {
                            publication = (TairObjectPublication) germPubIter.next();
                            if ( !first ) {
                                 out.write( "<br>" );
                            }
                            first = false;
                  %>

  		            <a href="/servlets/TairObject?type=publication&id=<%= publication.get_reference_id() %>"><%= publication.get_title() %></a> 
 		            (<font class="field_value"><%= publication.get_pubmed_id() %></font>)
                      <% } %>
                  <% } %>
		  &nbsp;
		</td>
		<td><%= logger.getMessages( "germplasm", row, "pub med id" ) %></td>
	      </tr>


              <tr>
                <td colspan="3"><hr></td>
              </tr>

             <% } %>

          </table>

	 <!-- End Germplasm Sheet -->


        
         <!-- Show button to allow curator to store expression set data to the database
              if no errors occurred while parsing. Otherwise, show file input box
              to allow posting of a corrected file -->
         <table width="100%">

             <tr>
                 <td>

                   <% if ( logger.hasErrors() ) { %>
                      <font class="parse_error">
                        Errors occurred while parsing.  
                        Please submit corrected data sheet to continue.
                     </font>

                     <p>
                     <% for ( Iterator msgIter = logger.getAllErrors(); msgIter.hasNext(); ) { %>
                             <%= (String) msgIter.next() + "<br>" %>
                      <% } %>
                          
                     <p>
                     <form action="/servlets/MultiServlet" enctype="multipart/form-data" method="post">
                       <input type="hidden" name="type" value="upload_microarray">
                       <input type="hidden" name="upload_action" value="confirm">
                       <input type="file" name="file">
                       <input type="submit" value="Upload Corrected Sheet">
                     </form>
                  <% } else { %>

                     Data loaded without errors. 

                     <p>
                     Enter unique submission number to use for this experiment and 
                     status for experiment ("active" experiments will display immediately
                     in the experiment and expression searches; "new" experiments
                     will not display).

                     <p>
                     Click "Load Data" button to load new data into the database.



                     <p>
                    <form action="/servlets/processor" method="post">
                      <input type="hidden" name="type" value="upload_microarray">
                      <input type="hidden" name="upload_action" value="store">
                      Submission Number: 
                      <input type="text" name="submission_number" size="20" maxlength="64">
                      &nbsp;&nbsp;&nbsp;
                      <input type="radio" name="status" value="active" checked> active
                      &nbsp;&nbsp;
                      <input type="radio" name="status" value="new"> new
                      &nbsp;&nbsp;&nbsp;
                      <input type="submit" value="Load Data">
                   </form>
                 <% } %>

                </td>
            </tr>
         </table>
 

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
