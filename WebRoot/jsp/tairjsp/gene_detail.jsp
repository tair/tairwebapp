<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*, org.tair.search.*, org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*, org.tair.bs.community.*"
%>

<%!
String pageName = "Gene Model Detail";
%>

<% // Get detail object from request
GeneDetail object = (GeneDetail) request.getAttribute("detail");
String hiddenReq = request.getParameter( "hideNote" );
boolean hidden = ( hiddenReq != null && hiddenReq.equals( "true" ) );
String gene_type="ProteinCoding";

String showAllReq = request.getParameter( "showAllNote" );
boolean showAll = ( showAllReq != null && showAllReq.equals( "true" ) );
// show properties -- individual include names are listed above each section
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
    <jsp:param name="pageName" value="<%= pageName %>" />
    <jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<script type="text/javascript" src="/js/prototype.js"></script>

<table width="100%" border="0" colspan="2" cellspacing="0" >
    <% 
    String obsoleteText = " ";
    if ( object.get_is_obsolete().booleanValue() ) { 
        obsoleteText = " (OBSOLETE)";
    }  %>
    <tr>
        <td colspan="3"><b><font size="+1">Gene Model: <%= object.get_gene_name() %></font><font size="+1" color = "red"><%= obsoleteText%></font></b> [<A href="/help/helppages/genedeta.jsp" target="_blank">Help</A>]</td>
    </tr>
    
    <!-- UPDATEHISTORY -->

    <% if ( object.hasUpdateHistory() || object.hasAffectedUpdateHistory() ){ %>
        <tr <%= myBgColor.toggleBgColor() %> valign="top">
            <th class="sm" align="left" valign="top">Update History<%= DefinitionsLookup.createPopupLink("UpdateHistory",null) %></th>
            <td class="sm" >&nbsp;</td>
            <td class="sm" >
                <table>
                    <%
                    Iterator updateHistoryIter = object.get_update_history();
                    UpdateHistory history = null;
                    Iterator affectedUpdateHistoryIter = object.getAffectedUpdateHistory();
                    UpdateHistory affectedHistory = null;
                    // first get update history rows where this tair object is 
                    // tair_object_id in UpdateHistory table

                    if ( updateHistoryIter != null ) {
                        while ( updateHistoryIter.hasNext() ) {
                            history = (UpdateHistory) updateHistoryIter.next();
                            %>
                            <tr>
                                <td class="sm" nowrap ><%= history.get_tair_object_name() %></td>
                                <td class="sm" nowrap ><%= history.get_display_text() %></td>
                                <% if ( history.get_affected_tair_object_id() != null ) { %>
                                    <td class="sm" nowrap ><a href="/servlets/TairObject?type=<%= history.get_affected_tair_object_type() %>&accession=<%= history.get_affected_tair_object_type() %>:<%= history.get_affected_tair_object_id() %>"><%= history.get_affected_tair_object_name() %></a></td>
                                <% }
                                if ( history.get_date() != null ) { %>
                                    <td class="sm" nowrap >on <%= history.get_date() %></td>
                                <% } %>				
                            </tr>
                        <% } %>
                    <% } %>

                    <% 
                    // next get update history rows where this tair object is 
                    // affected_tair_object_id in UpdateHistory table

                    if ( affectedUpdateHistoryIter != null ) {
                        while ( affectedUpdateHistoryIter.hasNext() ) {
                            affectedHistory = (UpdateHistory) affectedUpdateHistoryIter.next();
                            %>
                            <tr>
                                <td class="sm" nowrap ><%= affectedHistory.get_affected_tair_object_name() %></td>
                                <td class="sm" nowrap ><%= affectedHistory.get_affected_object_display_text() %></td>
                                <td class="sm" nowrap ><a href="/servlets/TairObject?type=<%= affectedHistory.get_tair_object_type() %>&accession=<%= affectedHistory.get_tair_object_type() %>:<%= affectedHistory.get_tair_object_id() %>"><%= affectedHistory.get_tair_object_name() %></a></td>
                                <% if ( affectedHistory.get_date() != null ) { %>
                                <td class="sm" nowrap >on <%= affectedHistory.get_date() %></td>
                                <% } %>				
                            </tr>
                        <% } %>				
                    <% } %>				
                </table>
            </td>
        </tr>
    <% } %>   	

    <!-- DATE_LAST_MODIFIED-->

    <% if ( object.get_date_last_modified() != null ) { %>  
        <tr  <%= myBgColor.toggleBgColor() %> >  
            <th class="sm" align="left">Date last modified<%= DefinitionsLookup.createPopupLink("Gene","date_last_modified") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%=  object.get_date_last_modified()  %></td>
        </tr>
    <% }  %>
 
    <!-- GENE_NAME -->

    <% if ( object.get_gene_name() != null ) { %>
        <tr <%=myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Name<%= DefinitionsLookup.createPopupLink("Gene","name") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%= object.get_gene_name() %></td>
        </tr>
    <% } %>

    <% if ( object.get_name_type() != null ) { %>
        <tr <%=myBgColor.toggleBgColor()%> >
            <th class="sm" valign="top" align="left">Name Type<%= DefinitionsLookup.createPopupLink("Gene","name_type") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%= object.get_name_type() %></td>
        </tr>
    <% } %>

    <% if ( object.get_gene_model_type() != null ) { %>
        <tr <%=myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Gene Model Type<%= DefinitionsLookup.createPopupLink("Gene","gene_model_type_id") %></th>
            <td class="sm">&nbsp;&nbsp;</td>
	    <% gene_type = (String) object.get_gene_model_type(); %>
            <td class="sm"><%= gene_type%></td>
        </tr>
    <% } %>

    <!-- ALIAS -->

    <% if ( object.get_aliases() != null ) { %>
        <tr <%= myBgColor.toggleBgColor() %>>
            <th class=sm align=left valign=top" >Aliases</th>
            <td class=sm >&nbsp;&nbsp;</td>
            <td class=sm ><%= object.get_alias_string() %></td>
        </tr>
    <% } %>

    <!-- TAIR ACCESSION-->

    <tr <%=myBgColor.toggleBgColor()%> >
        <th class="sm" align="left" valign="top">TAIR Accession<%= DefinitionsLookup.createPopupLink("Glossary","TAIR Accession") %></th>
        <td class="sm" >&nbsp;&nbsp;</td>
        <td class="sm" ><%=  object.getAccession() %></td>
    </tr>

    <% if ( object.get_description() != null ) { %>
        <tr <%=myBgColor.toggleBgColor() %> >
            <th class="sm" align="left" valign="top">Description</th>
            <td class="sm" >&nbsp;&nbsp;</td>
            <td class="sm" ><%= object.get_description() %></td>
        </tr>
    <% } %>   	      

    <!-- CHROMOSOME-->
    <tr <%=myBgColor.toggleBgColor()%> >
        <th class="sm" align="left" valign="top">Chromosome</th>
        <td class="sm" >&nbsp;</td>
        <td class="sm" ><%= Units.translateChromosome( object.get_chromosome() ) %></td>
    </tr>

    <!-- LOCUS -->

    <% if ( object.get_locus() != null ){ %>
        <tr <%= myBgColor.toggleBgColor() %> valign="top">
            <th class="sm" align="left" valign="top">Locus<%= DefinitionsLookup.createPopupLink("Locus","class") %></th>
            <td class="sm" >&nbsp;&nbsp;</td>
            <td class="sm" >
                <% 
                Iterator locusIter = object.get_locus();
                TfcLocus locus = null;
                while ( locusIter.hasNext() ) {
                    locus = (TfcLocus) locusIter.next();
                    %>
                    <a href="/servlets/TairObject?type=locus&id=<%= locus.get_locus_id() %>"><%= locus.get_name() %></a>
                    (Note: use this locus link to see all functional annotations, associated gene models, markers and ESTs).<br>
                <% } %>
            </td>
        </tr>
    <% } %>   	      
    
    
    <!-- GBrowse Detail Graphic -->
    <% if ( object.get_is_agi_map() || object.get_is_aly_map()) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Map Detail Image</th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
 	<% Iterator globalAssignmentIter2 = object.getGlobalAssignments();
   	Long gstart = object.getSpan_start_position();
	Long gend = object.getSpan_end_position();
	String chr = object.getGbrowseChromosome();
	String source = object.getGbrowseSource();
   	if((gstart == null || gend == null) && globalAssignmentIter2 != null && globalAssignmentIter2.hasNext()) 
	       {
	                   GlobalAssignment globalAssignment = (GlobalAssignment) globalAssignmentIter2.next();
			   gstart = Long.parseLong(globalAssignment.getFormatStartPosition());
			   gend = Long.parseLong(globalAssignment.getFormatEndPosition());
	       }	
		if(gstart != null && gend != null)
		{%>
		 <a href="/cgi-bin/gbrowse/<%=source%>/?name=<%= URLEncoder.encode( object.getGbrowseGeneName() ) %>"><div id="gb_img"></div></a>
	    </td>
	</tr>
		<script type="text/javascript">
		new Ajax.Updater('gb_img', '/cgi-bin/show_gbrowse_detail.cgi',{ asynchronous:true,method:'get',parameters: {name:'<%= URLEncoder.encode( object.get_gene_name() ) %>',ref:'<%= EmptyTextConverter.convert( chr ) %>',start:'<%= EmptyTextConverter.convert( gstart.toString() ) %>',end:'<%= EmptyTextConverter.convert( gend.toString() )%>',type:'<%= EmptyTextConverter.convert(gene_type) %>', source:'<%= EmptyTextConverter.convert(source) %>'} } );
		</script>
	<% } %>
<% } %>
    <!-- GENE ALIAS  -->

    <% if ( object.get_gene_aliases() != null ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Gene Alias<%= DefinitionsLookup.createPopupLink("GeneAlias","alias") %></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
                    <tr align="left">
                        <th class="sm">name</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">type<%= DefinitionsLookup.createPopupLink("GeneAlias","alias_type") %></th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                    </tr>
                    <% 
                    Iterator aliasIter = object.get_gene_aliases();
                    while ( aliasIter.hasNext() ) {
                        TfcGeneAlias alias = (TfcGeneAlias) aliasIter.next();
                        %>
                        <tr>
                            <td class="sm"><%= EmptyTextConverter.convert( alias.get_alias() ) %></td>
                            <td class="sm" nowrap>&nbsp; &nbsp;</th>
                            <td class="sm"><%=EmptyTextConverter.convert( alias.get_alias_type() ) %></td>
                            <td class="sm" nowrap>&nbsp; &nbsp;</th>
                        </tr>
                    <% } %>
                </table>
            </td>
        </tr>
    <% } %>

    <!-- GENE SYMBOL  -->

    <% if ( object.hasSymbols() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Symbols</th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
                    <tr align="left">
                        <th class="sm">symbol</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">full name</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                    </tr>
                    <% 
                    Collection<TfcSymbol> symbols = object.get_symbols();
                    for ( TfcSymbol symbol : symbols ) {
                       %>
                        <tr>
                            <td class="sm"><%= EmptyTextConverter.convert( symbol.get_symbol() ) %></td>
                            <td class="sm" nowrap>&nbsp; &nbsp;</td>
                            <td class="sm"><%=EmptyTextConverter.convert( symbol.get_full_name() ) %></td>
                            <td class="sm" nowrap>&nbsp; &nbsp;</td>
                        </tr>
                    <% } %>
                </table>
            </td>
        </tr>
    <% } %>

    <!-- KEYWORDS -->

    <% if ( object.hasKeywords() ) { %>
        <tr <%=myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Annotations<%= DefinitionsLookup.createPopupLink("Glossary","gene annot") %></TH>
            <td class="sm"> &nbsp;</td>
            <td class="sm">
                <table width="100%" border="0" cellpadding="1">
                    <tr>   
                        <th class="sm" valign="top" align="left">Category<%= DefinitionsLookup.createPopupLink("KeywordType","keyword_type") %></th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm" valign="top" nowrap align=left>Relationship Type<%= DefinitionsLookup.createPopupLink("RelationshipType","class") %></th>
                        <th class="sm" nowrap>&nbsp;</th>
                        <th class="sm" align="left" valign="top">Keyword<%= DefinitionsLookup.createPopupLink("Keyword","class") %></th>
                    </tr>
                    <%
                    Iterator kwTypeIter = object.getKeywords();
                    while ( kwTypeIter.hasNext() ) {
                        KeywordType kwType = (KeywordType) kwTypeIter.next();
                        %>
                        <TR>   
                            <td class="sm" valign="top" align="left"> <%= EmptyTextConverter.convert( kwType.getKeywordType()) %> </td>
                            <td class="sm">&nbsp;</td>
                            <% 
                            if (kwType.hasRelationshipTypes()) {
                                Iterator relationTypeIter = kwType.getRelationshipTypes();
                                boolean first = true ;
                                while (relationTypeIter.hasNext() ) {
                                    String  relation = (String) relationTypeIter.next();
                                    if (!first){
                                        %>    
                                        <TR>
                                            <TD colspan=2> &nbsp; </TD>
                                    <% } %>   
                                    <td class="sm" valign="top" nowrap> <%= EmptyTextConverter.convert( relation ) %> </TD>
                                    <td class="sm">&nbsp;</td>
                                    <td class="sm" valign="top"> <%= EmptyTextConverter.convert(kwType.getKeywords( relation ) ) %> </TD>
                                    <%  first = false ; 
                                }
                            } 
                            else { %>      
                                <TD colspan=3> &nbsp; </TD>
                                </TR>        
                            <% } %>
                        </TR>
                    <% } // end while %>
                    <TR> 
                        <TD colspan=5 align=left> 
                            <a href="/servlets/Search?action=search&type=annotation&tair_object_id=<%= object.get_tair_object_id() %>&gene_name=<%= object.get_gene_name() %>">Annotation Detail</a>
                        </TD>
                    </TR>
                </TABLE>
            </TD>
        </TR> 
    <% } %>

    <!-- REPRESENTATIVE PROTEIN DATA -->

    <% if ( object.hasAASequences() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Protein Data</th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
    	            <tr align="left">
                        <th class="sm">name</th>
 	                <th class="sm" nowrap>&nbsp;</th>
                        <th class="sm">Length(aa)</th>
	                <th class="sm" nowrap>&nbsp;</th>
  	                <th class="sm">molecular weight</th>
	                <th class="sm" nowrap>&nbsp;</th>
	                <th class="sm">isoelectric point</th>
	                <th class="sm">&nbsp;</th>
	                <th class="sm">domains( # of domains)</th>
	            </tr>
               <%
                  Iterator seqIter = object.getAASequences();
                  while ( seqIter.hasNext() ) {
                      AASequence sequence = (AASequence) seqIter.next(); 
                      // hash to hold domain name and count pair
                      HashMap hm = new HashMap();
                      if ( sequence.hasDomainMatches() ) {
                          Iterator dmIter =sequence.getDomainMatches();
                          while ( dmIter.hasNext() ) {
                              DomainMatch dm = (DomainMatch)dmIter.next();
                              String name="";
                              String accession ="";
                              if ( dm.get_interpro_name() != null ) {
                                  name = dm.get_interpro_name();
                                  accession = dm.get_interpro_accession(); 
                                  String url = "<A href=\"http://www.ebi.ac.uk/interpro/IEntry?ac=" + accession + "\">" + name + ":" + accession + "</A>";
                                  if ( !hm.containsKey( url ) ) {
                                      hm.put(url, new Integer(1) );
                                  } else {
                                      int old_count = ( (Integer)(hm.get(url))).intValue();
                                      old_count++;  
                                      hm.put(url, new Integer(old_count));
                                  }

                              }
                          }
                      }
                
               %> 
                    <tr align="left"> 
                        <td class="sm">
                           <A HREF="/servlets/TairObject?type=aa_sequence&id=<%= sequence.get_tair_object_id() %>"><%= sequence.get_name() %></A>&nbsp;
                        </td>
                        <td class="sm" nowrap>&nbsp;</td>
                        <td class="sm"><%= EmptyTextConverter.convert(sequence.get_length()) %>&nbsp;</td>
	                <td class="sm" nowrap>&nbsp;</td>
  	                <td class="sm"><%= EmptyTextConverter.convert(sequence.get_calc_MW()) %>&nbsp;</td>
             	        <td class="sm" nowrap>&nbsp;</td>
	                <td class="sm"><%= EmptyTextConverter.convert(sequence.get_calc_pI()) %>&nbsp;</td>
	                <td class="sm">&nbsp;</td> 

              <%     Set set = hm.entrySet();
                     Iterator iterator = set.iterator();
                     boolean first = true; 
                     while ( iterator.hasNext() ) {
                          java.util.Map.Entry  entry = (java.util.Map.Entry) iterator.next();  
                          if ( first ) { 
              %>
                                <td class="sm"><%= entry.getKey()+"("+entry.getValue()+")" %></td></TR>
  
              <%              first=false;
                          } else {  
              %>

                            <TR>
                                <td class="sm" nowrap>&nbsp;</td>
                                <td class="sm" nowrap>&nbsp;</td>
                                <td class="sm">&nbsp;</td>
	                        <td class="sm" nowrap>&nbsp;</td>
  	                        <td class="sm">&nbsp;</td>
	                        <td class="sm" nowrap>&nbsp;</td>
  	                        <td class="sm">&nbsp;</td>
	                        <td class="sm">&nbsp;</td>
                                <td class="sm"><%= entry.getKey()+"("+entry.getValue()+")" %></td>
                            </TR>
                       <% } %> 
                  <% } %>
       
             <% } %>
	       </table>
            </TD>
        </tr>
    <% } %>


    <!-- MAP_LOCATIONS -->

    <% if ( object.hasGlobalAssignments() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
        <jsp:include page="/jsp/includes/map_locations.jsp" flush ="true"/>
    <% } %>

    <!-- CREATE LINKS TO VIEWERS IF POSSIBLE -->

    <% if ( object.hasGlobalAssignments() && (object.is_ATH_taxon() || object.is_ALY_taxon())) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" align="left">Map Links<%= DefinitionsLookup.createPopupLink("Glossary", "Map Links") %></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <% if ( object.showMapViewerLink() ) { %>
                    <a href="/servlets/mapper?value=<%= URLEncoder.encode( object.get_gene_name() ) %>&action=search">Map Viewer</a>
                <% } %>
                <% if ( object.get_is_agi_map()) { %>
                    &nbsp;&nbsp;&nbsp;
                    <%= HTMLFactory.createSeqViewerLinks( "Sequence Viewer", "gene", object.get_tair_object_id(), object.getAGIChromosomes(), "&nbsp;" ) %>
                <% } if ( object.get_is_agi_map() || object.get_is_aly_map()) { %>
                &nbsp;&nbsp;&nbsp;
                <a href="/cgi-bin/gbrowse/<%=object.getGbrowseSource()%>/?name=<%= object.getGbrowseGeneName() %>">GBrowse</a>
                &nbsp;
                <% } %>
            </td>
        </tr>
    <% } %>

    <!-- SEQUENCE  -->

    <% if ( object.get_sequences() != null ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Nucleotide Sequence<%= DefinitionsLookup.createPopupLink("NucleotideSequence","class") %></th>
            <td class="sm">&nbsp</td>
            <td class="sm">
                <table>
                    <tr>
                        <th class="sm" align="left">Bio Source<%= DefinitionsLookup.createPopupLink("NucleotideSequence","type") %></th>
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
                            <td class="sm"><% if ( sequence.get_ic_accession() != null ) { %>
			    <a href="http://www.ncbi.nlm.nih.gov/entrez/viewer.cgi?db=nucleotide&val=<%= sequence.get_ic_accession() %>" target=_blank><%= sequence.get_ic_accession() %></a><% } %>&nbsp;</td>
                            <td class="sm"><a href="/servlets/TairObject?type=sequence&id=<%= sequence.get_nucleotide_seq_id() %>"><%= sequence.get_format_sequence_name() %></a></td>
                        </tr>
                    <% } %>
                </table>
            </td>
        </tr>
    <% } %>

    <!-- ASSIGNMENT_FEATURES -->

    <% if ( object.hasAssignmentFeatures() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Gene Feature<%= DefinitionsLookup.createPopupLink("FeatureAssignmentType","feature_assignment_type") %></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
                    <tr align="left">
                        <th class="sm"> type </th>
                        <th class="sm" nowrap>&nbsp;</th>
                        <th class="sm">coordinates</th>
                        <th class="sm" nowrap>&nbsp;</th>
                        <th class="sm">annotation source</th>
                        <th class="sm">&nbsp;</th>
                        <th class="sm">date</th>
                        <th class="sm" nowrap>&nbsp;</th>
                    </tr>
                    <%
                    Iterator globalAssignmentIter = object.getGlobalAssignments();
                    while ( globalAssignmentIter.hasNext() ) { 
                        GlobalAssignment globalAssignment = (GlobalAssignment) globalAssignmentIter.next();
                        if ( globalAssignment.hasAssignmentFeatures() ) { 
                            Iterator assignmentFeatureIter = globalAssignment.getAssignmentFeatures();
                            while ( assignmentFeatureIter.hasNext() ) { 
                                TfcAssignmentFeature assignmentFeature = (TfcAssignmentFeature) assignmentFeatureIter.next();
                                %>
                                <tr>
                                    <td class="sm"><%= assignmentFeature.getType() %></td>
                                    <td class="sm" nowrap>&nbsp;</th>
                                    <td class="sm"><%= assignmentFeature.getFormatStartPosition() + "-" + assignmentFeature.getFormatEndPosition() %></td>
                                    <td class="sm" nowrap>&nbsp</th>
                                    <td class="sm"><%= EmptyTextConverter.convert( globalAssignment.getSubmittedBySource() ) %></td>
                                    <td class="sm" nowrap>&nbsp</th>
                                    <td class="sm"><%= EmptyTextConverter.convert( globalAssignment.getSubmittedByDate() ) %></td>
                                    <td class="sm" nowrap>&nbsp</th>
                                </tr>
                            <% } %>
                        <% } %>
                    <% } %>
                </table>
            </td>
        </tr>
    <% } %>

    <!-- GENETIC_MARKER_VECTOR-->

    <% if ( object.get_genetic_markers() != null ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Genetic Markers<%= DefinitionsLookup.createPopupLink("GeneticMarker","class")%></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
                    <tr align="left">
                        <th class="sm">name</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">type<%= DefinitionsLookup.createPopupLink("GeneticMarker","type")%></th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">alias</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">chromosome</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">position</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">map</th>
                    </tr>
                    <%
                    Iterator markerIter = object.get_genetic_markers();
                    while ( markerIter.hasNext() ) {
                        GeneticMarker genetic_marker = (GeneticMarker) markerIter.next();
                        Iterator markerAssignIter = genetic_marker.getGlobalAssignments();
                        if ( markerAssignIter != null ) {
                            boolean first = true;
                            while ( markerAssignIter.hasNext() ) {
                                TfcGlobalAssignment globalAssignment = (TfcGlobalAssignment) markerAssignIter.next();
                                %>
                                <tr>
                                    <td class="sm">
                                        <% if (first) { %>
                                            <a href="/servlets/TairObject?accession=<%= "marker:" + genetic_marker.get_tair_object_id() %>"><%= EmptyTextConverter.convert( genetic_marker.get_name() ) %></a>
                                        <% } %>
                                        &nbsp;
                                    </td>
                                    <td class="sm" nowrap>&nbsp; &nbsp;</th>	
                                    <td class="sm">
                                        <% if ( first ) { %>
                                            <%= EmptyTextConverter.convert( genetic_marker.get_type() ) %>
                                        <% } %>
                                        &nbsp;
                                    </td>
                                    <td class="sm" nowrap>&nbsp; &nbsp;</th>
                                    <td class="sm">
                                        <% if ( first ) { %>
                                            <%= EmptyTextConverter.convert( genetic_marker.get_alias_string() ) %>
                                        <% } %>
                                        &nbsp;
                                    </td>
                                    <td class="sm" nowrap>&nbsp; &nbsp;</th>
                                    <td class="sm"><%=EmptyTextConverter.convert( genetic_marker.get_chromosome() ) %></td>
                                    <td class="sm" nowrap>&nbsp; &nbsp;</th>
                                    <td class="sm"><%= globalAssignment.getFormatStartPosition() + "-" + globalAssignment.getFormatEndPosition() + " " + globalAssignment.getUnits() %></td>
                                    <td class="sm" nowrap>&nbsp; &nbsp;</th>
                                    <td class="sm">
                                        <% if ( first ) { %>
                                            <a href="/servlets/mapper?value=<%= object.get_gene_name() %>&action=search">mapviewer</a>
                                        <% } %>
                                        &nbsp;
                                    </td>
                                </tr>
                                <% first = false; %>
                            <% } %>
                        <% } %>
                    <% } %>
                </table>
            </td>
        </tr>
    <% } %>

    <!-- ASSOCIATED TRANSPOSONS -->
    <% if (object.hasTransposons() ){ %>                                                                                                                                                                             
        <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" valign="top" align="left">Associated Transposons</th>
        <td class="sm">&nbsp;</td>
        <td class="sm">
        <table>
        <TR  align="left"> 
        <TH class="sm">Name</TH>
        <TH class="sm">&nbsp; </TH>
        <TH class="sm">Chromosome</TH> 
        </TR> 

        <% 
        String transposon = ""; 
        Iterator trans_iter = object.getTransposonsIterator(); 
        while (trans_iter.hasNext() ){ 
            Transposon t = (Transposon) trans_iter.next();
            transposon = "<A href = '/servlets/TairObject?type=transposon&id=" + t.get_transposon_id()+"'>" + t.get_name() + "</A>";                                                                             
        %> 

        <TR align="left"> 
        <TH class="sm"><%=transposon%></TH> 
        <TH class="sm">&nbsp;</TH> 
        <TH class="sm"><%=t.get_chromosome()%></TH> 
        </TR> 
        <% } %>                                                                                                                                                                                                  
        </table>                                                                                                                                                                                                     
        </tr>                                                                                                                                                                                                            
    <% } %> 

    <!-- POLYMORPHISM-->

    <% if ( object.getPolymorphisms() != null ) {
       int polysize = object.getPolymorphisms().size();
       long polycount = object.getPolymorphismCount();
       String polysearchurl = "/servlet/Search?type=polyallele&action=search&name_type1=gene_name&method1=4&term1="+object.get_gene_name()+"&name_type2=locus_name&method2=2&term2=&allele=any&poly_type=any&insertion_type=any&poly_site=any&inheritance=any&ecoLow=any&ecoHi=any&transgene=any&mutagen=any&size=25&order=name"; %>
        <tr <%= myBgColor.toggleBgColor() %> > 
            <th class="sm" valign="top" align="left">
              Polymorphism<%= DefinitionsLookup.createPopupLink("Polymorphism","class") %><br>
              Showing <%=polysize%> of <%=polycount%> entries<br>
              <%if(polycount > polysize){%>(<a href="<%=polysearchurl%>">see all</a>)<%}%></th>
            <td class="sm">&nbsp;</td>
            <td class="sm"> 
                <table> 
                    <TR  align="left">
                        <TH class="sm">name<%= DefinitionsLookup.createPopupLink("Polymorphism","name") %></TH> 
                        <TH class="sm">&nbsp; </TH>
                        <TH class="sm">type<%= DefinitionsLookup.createPopupLink("Polymorphism","type") %></TH>
                        <TH class="sm">&nbsp; </TH>
                        <TH class="sm">Polymorphism site</TH> 
                        <TH class="sm">&nbsp; </TH>
                        <TH class="sm">Allele type<%= DefinitionsLookup.createPopupLink("Polymorphism","allele_mode") %></TH> 
                    </TR> 
                    <%  
                    for(PolymorphismInfo pol: (List<PolymorphismInfo>)object.getPolymorphisms()){
                        %>
                        <TR> 
                            <td class="sm"><A href="/servlets/TairObject?id=<%= pol.getId() %>&type=polyallele"> <%=  pol.getOriginalName() %> </A> </td> 
                            <td class="sm">&nbsp; </td>
                            <td class="sm"> <%=  EmptyTextConverter.convert(pol.getType()) %></TD>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align="center"><%= EmptyTextConverter.convert(pol.getGeneFeatureSite("unknown")) %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align="center"><%= EmptyTextConverter.convert(pol.getAlleleMode("unknown")) %></td>
                        </TR> 
                    <% } %>
                </TABLE>
            </TD>
        </tr>
    <% } %>

    <!-- GERMPLASM -->
    <%
         String search_url = "/servlets/Search?type=germplasm&search_action=search&name_type_1=gene_name&method_1=4&name_1=" + object.get_gene_name();
         Collection germs = object.getGermplasms();
    %>
    <%  if (object.hasGermplasms()) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">
               Germplasm<BR><%= DefinitionsLookup.createPopupLink("Germplasm","class") %><br>
               Showing <%=germs.size()%> of <%=object.getGermplasmCount()%> entries<br>
               <%if(object.getGermplasmCount() > germs.size()){%>(<a href="<%=search_url%>">see all</a>)<%}%>
            </th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <form action="/servlets/Order/current" method="POST"  onSubmit="orderFormWindow( this )">
                <input type="hidden" name="state" value="addStock">
                <table border="0" class="germ_band">
                    <TR  align="left">
                        <TH class="sm">Name</TH>
                        <TH class="sm">&nbsp; </TH>
                        <TH class="sm">Polymorphisms</TH>
                        <TH class="sm">&nbsp; </TH>
                        <TH class="sm">Background</TH>
                        <TH class="sm">&nbsp; </TH>
                        <TH class="sm">Stock Name</TH>
                        <TH class="sm">&nbsp; </TH>
                        <TH class="sm">Select</TH>
                    </TR>
                    <%
                    boolean show_ordering_buttons = false;
                    Iterator iter = germs.iterator();
                    String polys, background, stock_name, orig_name;
                    GermplasmInfo germ;
                    Long polyId;
                    int germ_count = 0;
                    while(iter.hasNext()) {
                        germ = (GermplasmInfo) iter.next();
                        orig_name = "<a href=\"/servlets/TairObject?type=germplasm&id="+germ.getId().toString()+"\">"+germ.getOriginalName()+"</a>";
                        background = EmptyTextConverter.convert(germ.getSpeciesVariantAbbrevName());
                        polys = "";
                        Map polyMap = germ.getPolymorphisms();
                        Iterator it = polyMap.keySet().iterator();
                        while(it.hasNext()){
                            polyId = (Long)it.next();
                            polys += "<a href=\"/servlets/TairObject?type=polyallele&amp;id="+polyId+"\">" + polyMap.get(polyId) + "</a>" + (it.hasNext() ? "; " : " ");
                        }
                    %>
                    <tr  align="left">
                        <td class="sm"><%= orig_name %></td>
                        <td class="sm">&nbsp; </td>
                        <td class="sm"><%= polys %></td>
                        <td class="sm">&nbsp; </td>
                        <td class="sm"><%= background %></td>
                        <td class="sm">&nbsp;</td>
                   
                <%
                    if(germ.getStocks().size() == 0) {
                %>
                        <td class="sm"> not an ABRC stock</td>
                        <td class="sm" colspan = "2"> &nbsp;</td>
                    </tr>
                <%  
                    } else {
                      Iterator s_it = germ.getStocks().iterator();
                      StockInfo stock_obj;
                      while ( s_it.hasNext() ) {
                        stock_obj = (StockInfo) s_it.next();
                        String stock_number = stock_obj.getName();
                 %>
                        <td class="sm" align="left" valign="top"> <a href="/servlets/TairObject?type=stock&id=<%= stock_obj.getId() %>"> <%= stock_number %></a> </td>
                        <td class="sm" nowrap>&nbsp;</td>
                        <td class="sm" align="left" valign="top" >
                 <%
                        if ( DataConstants.getAvailableStock().equals( stock_obj.getAvailabilityType() ) ) {
                          show_ordering_buttons = true;
                 %>
                          <input type="checkbox" name="stock_number" value="<%= stock_number %>" /></td></tr>
                 <%
                        } else {
                 %>
                          not available</td></tr>
                 <%
                        }
                        if(s_it.hasNext()){
                 %>
                          <tr>
                            <td class="sm" colspan="6"> &nbsp;</td>
                          </tr>
                 <%
                        }
                     } // end stock loop
                   }
                 %>
                    <tr><th colspan="9" align="left">Images</th></tr>
                    <tr><td colspan="9">
                    <% 
                    ImageCollection images = germ.getImages();
                    Iterator imageIter = images.iterator();
                    TfcImage image = null;
                    
                    if (imageIter != null ) {
                        while (imageIter.hasNext() ){
                            image = (TfcImage) imageIter.next();
                            if (image.hasThumbnail() ){
                    %>
                    <a href="/jsp/common/image.jsp?id=<%= image.get_image_id() %>&format=<%= image.getLinkSuffix() %>"><img src="/servlets/images/thumb_<%= image.get_image_id() %>.<%= image.getLinkSuffix() %>" border="0"></a>
                    <%      } else { %>
                    <a href="/jsp/common/image.jsp?id=<%= image.get_image_id() %>&format=<%= image.getLinkSuffix() %>">View Image</a>
                    <%      } 
                        } 
                    } else { %>
                        None available
                    <% } %>
                    &nbsp;<br>
                    </td></tr>
                    
                    <tr><th colspan="9" align="left">Phenotypes<%= DefinitionsLookup.createPopupLink("Phenotype","class") %></th></tr>
                    <tr>
                        <td colspan="9">
                    <%
                        if(germ.getPhenotypes().size() == 0){
                    %>
                          None available
                    <%
                        } else {
                    %>
                          <ul>
                    <%
                          Iterator pt_it = germ.getPhenotypes().iterator();
                          while(pt_it.hasNext()) {
                            PhenotypeInfo pt = (PhenotypeInfo)pt_it.next();
                    %>
                            <li><%= EmptyTextConverter.convert(pt.getPhenotype()) %>
                    <%
                            if("".equals(pt.getLabel()))
                            {
                    %>
                               Phenotype curated by ABRC.
                    <%
                            } else {
                    %>
                               <a href="/servlets/TairObject?id=<%= pt.getReferenceId() %>&amp;type=<%= pt.getReferenceType() %>"><%= EmptyTextConverter.convert(pt.getLabel()).trim() %></a>
                    <%
                            }
                    %>
                           </li>
                    <%
                          }
                    %>
                          </ul>
                    <%
                        }
                    %>
                       <% if(iter.hasNext()){%><hr/><%}%></td>
                    </tr>
                    <% } if(show_ordering_buttons) {  %>
                        <tr>
                          <td colspan="9" nowrap>
                             <hr>
                             <input type="submit" name="submit" value="Order from ABRC">
                             &nbsp;
                             <input type="reset" name="reset" value="Reset">
                             &nbsp;
                             <input type="button" value="Order from NASC" onClick="document.location.href='http://seeds.nottingham.ac.uk/Nasc/action.lasso?-response=/Nasc/information/ordering.lasso'"> (European Users)
                          </td>
                        </tr>
                    <% }  %>

                </table>
                </form>
            </td>
        </tr>
    <%}%>
 
    <!-- EXTERNAL_LINK -->

    <%  if (object.get_external_links()!=null) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">External Link</th> 
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm">
                <table>
                    <%  
                    Iterator iter = object.get_external_links();
                    while ( iter.hasNext() ) {
                        ExternalLinkObject elo = (ExternalLinkObject) iter.next();
                        String web_site_name = elo.get_web_site_name();
                        %>
                        <TR> 
                            <td class="sm"><%= elo.get_external_HTML_link( web_site_name ) %> </td>
                        </TR> 
                    <% } %>
                </TABLE>
            </TD>
        </tr>
    <% } %>

    <!-- ANNOTATION -->

    <% if ( object.get_annotations() != null ) {  %>
        <% myBgColor.toggleBgColor(); %> 
        <TR>
            <TD colspan=3 >
                <table cellpadding="2" width="100%" border=0 cellspacing="0" >
                    <%
                    Iterator sourceIter = object.getAnnotationSources();
                    boolean firstSource = true ;
                    while ( sourceIter.hasNext() ) {
                        String annotated_by = (String) sourceIter.next();
                        if (! firstSource) { %> 
                            <TR <%= myBgColor.sameBgColor()  %>>
                                <TD colspan=5><HR></TD>
                            </TR> 
                        <% } %>

                        <tr <%= myBgColor.sameBgColor()  %> valign="top" >
                            <th class="sm" valign="top" align="left"> <%= EmptyTextConverter.convert( annotated_by) %>'s comment</th>
                        <td class="sm">&nbsp;</td>   
                        <% 
                        Iterator annotations =  object.getAnnotations ( annotated_by );
                        boolean first = true;
                        while ( annotations.hasNext()){
                            AnnotationObject annotation= (AnnotationObject)annotations.next();
                            if (!first) {
                                %>
                                <TR <%= myBgColor.sameBgColor() %> >
                                    <td class="sm" colspan=2 >&nbsp;</td>       
                            <%  }  %>
                            <td class="sm"><%= EmptyTextConverter.convert( annotation.get_short_annotation() ) + " " + EmptyTextConverter.convert( annotation.get_long_annotation() ) %></td>
                            <td class="sm">&nbsp;</td>
                            <td class="sm" align=left valign=top><%= EmptyTextConverter.convert( annotation.get_date_entered() )%></td>
                            </tr> 
                            <% 
                            first=false;
                        }
                        firstSource = false;
                    } %>
                </table>
            </TD>
        </TR>
    <% } %>

    <!--COMMENT-->

    <% String commentColor =  myBgColor.toggleBgColor() ; %>
    <form action="/servlets/updater" method="post">  
        <tr  <%= commentColor  %>  valign="top">
            <th class="sm" align="left">User Comments<%= DefinitionsLookup.createPopupLink("Glossary","Comments") %> (shows only the most recent comments by default)
                <input type="hidden" name="type" value="notepad">
                <input type="hidden" name="update_action" value="add">
                <input type="hidden" name="tair_object_id" value="<%= object.get_tair_object_id() %>">
                <input type="hidden" name="accession" value="<%= object.getAccession() %>" >
                <% 
                String hideText = hidden ? "Show Comments" : "Hide Comments";
                boolean hideOption = !hidden;
                String allText = showAll ? "Show Recent Comments" : "Show All Comments";
                boolean showAllOption = !showAll; 
                %>
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
                            if ( display_note.length() > 100) {
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
                <td class="sm" colspan="2"> &nbsp; </td>
            <% } %>
        </tr>
        <tr <%= commentColor  %>  valign="top"  %> 
            <td class="sm" colspan=3 align=center>
                <input type="submit" VALUE="Add My Comment">&nbsp;&nbsp;
                <input type="button" value="<%= hideText %>" onClick="document.location.href='/servlets/TairObject?accession=<%= object.getAccession() %>&hideNote=<%= hideOption %>'">&nbsp;&nbsp;
                <input type="button" value="<%= allText %>" onClick="document.location.href='/servlets/TairObject?accession=<%= object.getAccession() %>&showAllNote=<%= showAllOption %>'"> 
            </td>
        </tr>
    </form>

    <!-- ATTRIBUTION -->

    <% if ( object.get_attributions() != null ) { %>
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Attribution<%= DefinitionsLookup.createPopupLink("Attribution","class") %> </th>
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

    <!-- COMMUNICATION -->

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

    <!-- PUBLICATION -->

    <% if ( object.hasPublications()) { %>  
        <tr <%= myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Publication<%= DefinitionsLookup.createPopupLink("Publication","class") %> </th>
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
                            <td class="sm"><a href=/servlets/TairObject?type=publication&id=<%= publication.get_reference_id() %>><%= EmptyTextConverter.convert( publication.get_title() )%></a></td>
                            <td class="sm" nowrap>&nbsp; &nbsp;</th>
                            <td class="sm"><%= EmptyTextConverter.convert( publication.get_pub_source_name() ) %></td>
                            <td class="sm" nowrap>&nbsp; &nbsp;</th>
                            <td class="sm"><%=EmptyTextConverter.convert( publication.get_year() )%></td>
                        </tr>
                    <% } %>
                    <!-- if publications collection was abbreviated, show link to full list as publication search results --->
                    <% if ( object.publicationsAbbreviated() ) { %>
                        <tr>
                            <td class="sm" colspan="4"> <br> <a href="/servlets/Search?type=publication&search_action=search&gene_tair_object_id=<%= object.get_tair_object_id() %>&gene_name=<%= URLEncoder.encode( object.get_original_name() ) %>">View Complete List</a> &nbsp; (<%= object.getPublicationsSize() %> of <%= object.getPublicationsFullCount() %> displayed) </td>
                        </tr>
                    <% } %> 
                </table>
            </td>
        </tr>
    <% } %>

</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


