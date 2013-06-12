<!-- Copyright (c) 2000-2010 Carnegie Institution for Science.  All rights reserved. -->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<%@ page import="org.tair.tfc.*,org.tair.bs.locusdetail.*,org.tair.search.*,org.tair.querytools.*,org.tair.utilities.*,java.util.*,java.net.*"%>
<%!String pageName = "Locus Detail";%>

<%
  LocusDetail object = (LocusDetail)request.getAttribute("detail");
  String hiddenReq = request.getParameter("hideNote");
  boolean hidden = (hiddenReq != null && hiddenReq.equals("true"));

  String showAllReq = request.getParameter("showAllNote");
  boolean showAll = (showAllReq != null && showAllReq.equals("true"));
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
    <jsp:param name="pageName" value="<%= pageName %>" />
    <jsp:param name="id" value="" />
</jsp:include>

<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<script type="text/javascript" src="/js/prototype.js"></script>

<table width="100%" border="0" cellspacing="0" >
    <%
      String obsoleteText = " ";
      if (object.isObsolete()) {
        obsoleteText = " (obsolete)";
      }
    %>
    <tr>
        <td colspan="3"><b><font size="+1">Locus: <%=object.getLocusName()%></font><font size="+1" color = "red"><%=obsoleteText%></font></b></td>
    </tr>

       <!-- updateHistory -->
     <%
       if (object.hasUpdateHistory() || object.hasAffectedUpdateHistory()) {
     %>
           <tr <%=myBgColor.toggleBgColor()%> valign="top">
              <th class="sm" align="left" valign="top">Update History<%=DefinitionsLookup.createPopupLink("UpdateHistory", null)%></th>
              <td class="sm" >&nbsp;</td>
              <td class="sm" >
              <table>
				<%
				  // first get update history rows where this tair object is
				    // tair_object_id in UpdateHistory table
				    for (BsLocusUpdateHistory history : object.getUpdateHistories()) {
				%>
				<tr>
					<td class="sm" nowrap><%=history.getLocusName()%></td>
					<td class="sm" nowrap><%=history.getUpdateType()%></td>
					<%
					  if (history.getAffectedTairObjectId() != null) {
					%>
					<td class="sm" nowrap>
						<a
							href="/servlets/TairObject?type=<%=history.getAffectedTairObjectType()%>&amp;accession=<%=history.getAffectedTairObjectType()%>:<%=history.getAffectedTairObjectId()%>"><%=history.getAffectedTairObjectName()%></a>
					</td>
					<%
					  }
					      if (history.getUpdateHistoryDate() != null) {
					        java.text.Format formatter = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
					        String historyDate = formatter.format(history.getUpdateHistoryDate()); 
					%>
					<td class="sm" nowrap>
						on
						<%=historyDate%></td>
					<%
					  }
					%>
				</tr>
				<%
				  }
				    // next get update history rows where this tair object is
				    // affected_tair_object_id in UpdateHistory table
				    for (BsAffectedLocusUpdateHistory affectedHistory : object.getAffectedUpdateHistories()) {
				%>
				<tr>
					<td class="sm" nowrap><%=object.getLocusName()%></td>
					<td class="sm" nowrap><%=affectedHistory.getUpdateType()%></td>
					<td class="sm" nowrap><a href="/servlets/TairObject?type=<%=affectedHistory.getObjectType()%>&amp;accession=<%=affectedHistory.getObjectType()%>:<%=affectedHistory.getTairObjectId()%>"><%=affectedHistory.getTairObjectName()%></a></td>
					<%
					  if (affectedHistory.getUpdateHistoryDate() != null) {
					    java.text.Format formatter = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
					    String affectedHistoryDate = formatter.format(affectedHistory.getUpdateHistoryDate()); 
					%>
					<td class="sm" nowrap>on <%=affectedHistoryDate%></td>
					<%
					  }
					%>
				</tr>
				<%
				  }
				%>
			</table>
             </td>
          </tr>
     <%
       }
     %>

  <!-- date_last_modified-->
   <%
     if (object.getDateLastModified() != null) {
	   java.text.Format formatter = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
	   String dateLastModified = formatter.format(object.getDateLastModified()); 
   %>
    <tr  <%=myBgColor.toggleBgColor()%> >

   <th class="sm" align="left">Date last modified</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%=dateLastModified%></td>
 </tr>
  <%
    }
  %>

 <!-- tair accession-->
    <tr <%=myBgColor.toggleBgColor()%> >
         <th class="sm" align="left" valign="top">TAIR Accession<%=DefinitionsLookup.createPopupLink("Glossary", "TAIR accession")%></th>
         <td class="sm" >&nbsp;&nbsp;</td>
         <td class="sm" ><%=object.getAccession()%></td>
     </tr>

  <!-- gene_name -->
  <%
    if (object.getRepresentativeGeneName() != null) {
      String name = object.getRepresentativeGeneName();
  %>
   <tr  <%=myBgColor.toggleBgColor()%>>
       <th class="sm" align="left" valign="top">Representative Gene Model<%=DefinitionsLookup.createPopupLink("Locus", "rep_genemodel_id")%><a name="<%=name%>"></a></th>
       <td class="sm" >&nbsp;&nbsp;</td>
       <td class="sm">
            <table>
                <tr align="left" valign="bottom">
               <th class="sm">
                  <a href=/servlets/TairObject?type=gene&amp;id=<%=object.getRepresentativeGeneId()%>><%=name%></A>
                  </th>
              </tr>
            </table>
       </td>
   </tr>
  <%
    }
  %>

  <!-- gene_model_type -->
  <%
    if (object.getRepresentativeGeneModelType() != null) {
  %>
      <tr <%=myBgColor.toggleBgColor()%> >
          <th class="sm" valign="top" align="left">Gene Model Type<%=DefinitionsLookup.createPopupLink("Locus",
                                                    "gene_model_type_id")%></th>
          <td class="sm">&nbsp;&nbsp;</td>
          <td class="sm"><%=object.getRepresentativeGeneModelType()%></td>
      </tr>
  <%
    }
  %>

  <!-- other_name: all names and alias names from all associated gene -->
  <%
    String other_names = object.getOtherNames();
  %>
  <%
    if (other_names != null) {
  %>
   <tr  <%=myBgColor.toggleBgColor()%>>
       <th class="sm" align="left" valign="top">Other names:</th>
       <td class="sm" >&nbsp;&nbsp;</td>
       <td class="sm" >
             <table>
           <tr align="left">
               <td class="sm"><%=other_names%></td>
           </tr>
             </table>
       </td>
   </tr>
  <%
    }
  %>
  
  
  <!-- Description-->
  <%
    if (object.getRepresentativeGeneDescription() != null) {
  %>

  <tr  <%=myBgColor.toggleBgColor()%>>
        <th class="sm" align="left" valign="top">Description<%=DefinitionsLookup.createPopupLink("Gene", "description")%></th>
        <td class="sm" >&nbsp;</td>
        <td class="sm" ><%=object.getRepresentativeGeneDescription()%></td>
  </tr>
  <%
    }
  %>
 
    <!--- ASSOCIATED TRANSPOSONS --->

	<%
	  if (object.hasTransposons()) {
	%>
	<tr <%=myBgColor.toggleBgColor()%>>
		<th class="sm" valign="top" align="left">
			Associated Transposons
		</th>
		<td class="sm">
			&nbsp;
		</td>
		<td class="sm">
			<table>
				<tr align="left">
					<th class="sm">
						Name
					</th>
					<th class="sm">
						&nbsp;
					</th>
					<th class="sm">
						Chromosome
					</th>
				</tr>
				<%
				  for (BsLocusTransposon t : object.getTransposons()) {
				      String transposon =
				        "<a href = '/servlets/TairObject?type=transposon&id="
				            + t.getTransposonId() + "'>" + t.getName() + "</a>";
				%>
				<tr align="left">
					<td class="sm"><%=transposon%></td>
					<td class="sm">
						&nbsp;
					</td>
					<td class="sm"><%=t.getChromosome()%></td>
				</tr>

				<%
				  }
				%>
			</table>
	</tr>
	<%
	  }
	%>


	<!-- gene_model_vector -->
  
   <%
       if (object.hasGeneModels()) {
     %>
      <tr  <%=myBgColor.toggleBgColor()%>  valign="top">
       <th class="sm" valign="top" align="left">Other Gene Models<%=DefinitionsLookup.createPopupLink("Glossary",
                                                    "associated genes")%></th>
       <td class="sm">&nbsp;</td>
       <td class="sm">
           
       <table>
            <tr valign="top">
            <%
              for (BsLocusGeneModel model : object.getGeneModels()) {
                  String name = model.getName();
                  boolean is_splice_variant = object.isSpliceVariant(name);
            %>
               <td class="sm" nowrap>
                  <a href=/servlets/TairObject?type=gene&amp;id=<%=model.getGeneId()%>>
                     <%=EmptyTextConverter.convert(model.getName())%>
                  </a>
                  <%
                    if (is_splice_variant) {
                  %><br> (splice variant) <%
                    }
                  %>
                  &nbsp;
                 </td>
                <%
                  }
                %>
             </tr>
         </table>
       </td>
   </tr>


   <%
     }
   %>
    
    <!-- GBrowse Detail Graphic -->
 <% 
   String locus_name = object.getLocusName();
   String gene_type = object.getRepresentativeGeneModelType();
   gene_type = (gene_type == null ? "ProteinCoding" : gene_type);
   Long start = object.getSpanStartPosition();
   Long end = object.getSpanEndPosition();
   String chr = object.getGbrowseChromosome();
   String source = object.getGbrowseSource();  
 %>
   <tr <%=myBgColor.toggleBgColor()%> >
       <th class="sm" align="left">Map Detail Image</th>
       <td class="sm">&nbsp;</td>
       <td class="sm">
 <%
   if (start != null && end != null) {
     String img_html = "<div align=\"center\"><img alt=\"detail\" width=\"650\" name=\"detail\" border=\"1\" src=\"/cgi-bin/gb2/gbrowse_img/" + source  + "?name=" + chr + ":" + start + ".."  + end  +  ";type=ProteinCoding;width=650\" usemap=\"#detail_map\" id=\"detail_image\"></div>";
     if (object.hasGlobalAssignments() && object.isArabidopsisLyrata()) {
 %>
       <a href="/cgi-bin/gbrowse/gb_ensembl_alyrata/?name=<%=URLEncoder.encode(locus_name, "ISO-8859-1")%>"><div id="gb_img"><%= img_html %></div></a>
<%   }
     else
     { %>       
           <a href="/cgi-bin/gbrowse/arabidopsis/?name=<%=URLEncoder.encode(locus_name, "ISO-8859-1")%>"><div id="gb_img"><%= img_html %></div></a>
<%   } %>	   
	   </td>
    </tr>
 <%
   }
 %>

    <!-- Annotations/Keywords -->
<%
  if (object.hasAnnotations()) {
%>

      <tr  <%=myBgColor.toggleBgColor()%>  valign="top">
        <th class="sm" valign="top" align="left">Annotations<%=DefinitionsLookup.createPopupLink("Glossary", "gene annot")%></TH>
        <td class="sm"> &nbsp;</td>
        <td class="sm">

        <table width="100%" border="0" cellpadding="1">
        <tr>
            <th class="sm" valign="top" align="left">category<%=DefinitionsLookup.createPopupLink("KeywordType",
                                                    "keyword_type")%></th>
            <th class="sm">&nbsp;</th>
            <th class="sm" valign="top" nowrap align=left>relationship type<%=DefinitionsLookup.createPopupLink("RelationshipType", "class")%></th>
            <th class="sm" nowrap>&nbsp;</th>
            <th class="sm" align="left" valign="top">keyword<%=DefinitionsLookup.createPopupLink("Keyword", "class")%></th>
        </tr>
        
        <%
          List<LocusAnnotationGroup> groups = object.getAnnotationGroups();
          for (LocusAnnotationGroup group : groups) {
        %>
        
        <tr>
            <td class="sm" valign="top" align="left">
            <%=group.getCategory()%>
            </td><td class="sm">
            &nbsp;
            </td><td class="sm" valign="top" align="left">
            <%=group.getRelationshipType()%>
            </td><td class="sm">
            &nbsp;
            </td><td class="sm" valign="top" align="left">
            <%=group.getLinks()%>
            </td>
        </tr>    
        <%
          }
        %>
        <tr> 
            <td colspan=5 align=center> 
                <a href="/servlets/Search?action=search&amp;type=annotation&amp;tair_object_id=<%=object.getTairObjectId()%>&amp;locus_name=<%=object.getLocusName()%>">Annotation Detail </a> 
            </td>
        </tr>
        </table>
        </td>
    </TR>
    <%
      }
    %>
  <!-- microarray element data -->
  <%
    if (object.hasDualChannelArrayElements()
        || object.hasSingleChannelArrayElements()) {
  %>
  <%
    String bgColor = myBgColor.toggleBgColor();
  %>
    <tr <%=bgColor%>>
        <th class="sm" align="left">RNA Data</th>
        <td class="sm" colspan="2">&nbsp;</td>
    </tr>
    <%
      }
    %>
  <!-- dual channel microarray element data -->
  <%
    if (object.hasDualChannelArrayElements()) {
  %>
  <%
    String bgColor = myBgColor.sameBgColor();
  %>
    <tr <%=bgColor%>>
        <td class="sm" colspan="3">&nbsp;</td>
    </tr>
    <tr <%=bgColor%>>
        <th class="sm" align="left" valign="top">Two-channel Arrays</th>
        <td class="sm">&nbsp;</td>
        <td class="sm" >
            <table width="100%" border="0" cellpadding="2" cellspacing="1">
               <tr valign="bottom">
                  <th class="sm" align="left" nowrap>array element<br>name<%=DefinitionsLookup.createPopupLink("ArrayElement", "class")%></th>
                  <th class="sm" align="left" nowrap>avg. log ratio<br>(std. error)</th>
                  <th class="sm" align="left" nowrap>avg. intensity<br>(std. error)</th>
                  <th class="sm" nowrap>expression<br>viewer</th>
                  <th class="sm" nowrap>spot history<br>(SMD)</th>
               </tr>

            <%
              for (BsLocusArrayElement arrayElement : object.getDualChannelArrayElements()) {
            %>
               <tr valign="top">
                  <td class="sm">
             <A href="/servlets/TairObject?type=array_element&amp;id=<%=arrayElement.getArrayElementId()%>">
              <%=arrayElement.getName()%></A></td>
                  <td class="sm"><%=EmptyTextConverter.convert(arrayElement.getAvgLogRatio())%> (<%=EmptyTextConverter.convert(arrayElement.getStdError())%>)</td>
                  <td class="sm"><%=EmptyTextConverter.convert(arrayElement.getAvgIntensity())%> (<%=EmptyTextConverter.convert(arrayElement.getAvgIntensityStdError())%>)</td>
                     <td class="sm" align="center">
                      <%
                        if (arrayElement.getViewerData()) {
                      %>
                              <a href="/cgi-bin/afgc/atExpressioncgi.pl?su_id=<%=arrayElement.getExternalId()%>">Viewer</a>
                      &nbsp;
                     </td>

                     <td class="sm" align="center"><a href="http://genome-www5.stanford.edu/cgi-bin/data/spotHistory.pl?state=parameters;login=no;suid=<%=arrayElement.getExternalId()%>" target=_blank><%=arrayElement.getExternalId()%></a></td>
                  <%
                    } else {
                  %>
                     <td class="sm" colspan="2">&nbsp;</td>
                  <%
                    }
                  %>
               </tr>

           <%
             } // end array element for
           %>

          </table>
        </td>
      </tr>

    <%
      } // end dual array element if
    %>
  <!-- single channel microarray element data -->
  <%
    if (object.hasSingleChannelArrayElements()) {
  %>
  <%
    String bgColor = myBgColor.sameBgColor();
  %>
    <tr <%=bgColor%>>
        <td class="sm" colspan="3">&nbsp;</td>
    </tr>

        <tr <%=bgColor%>>
        <th class="sm" align="left" valign="top">One-channel Arrays</th>
        <td class="sm">&nbsp;</td>
        <td class="sm" >
            <table width="100%" border="0" cellpadding="2" cellspacing="1">
               <tr valign="bottom">
                  <th class="sm" align="left" nowrap>array element<br>name<%=DefinitionsLookup.createPopupLink("ArrayElement", "class")%></th>
                  <th class="sm" align="left" nowrap>avg. signal<br>intensity (std. error)</th>
                  <th class="sm" align="left" nowrap>avg. signal<br>percentile (std. error)</th>
               </tr>

            <%
              for (BsLocusArrayElement arrayElement :  object.getSingleChannelArrayElements()) {
            %>
               <tr valign="top">
                  <td class="sm">
             <A href="/servlets/TairObject?type=array_element&amp;id=<%=arrayElement.getArrayElementId()%>">
              <%=arrayElement.getName()%></A></td>
                  <td class="sm"><%=EmptyTextConverter.convert(arrayElement.getAvgIntensity())%> (<%=EmptyTextConverter.convert(arrayElement.getAvgIntensityStdError())%>)</td>
                  <td class="sm"><%=EmptyTextConverter.convert(arrayElement.getAvgSignalPercentile())%> (<%=EmptyTextConverter.convert(arrayElement.getAvgSignalPercentileStdError())%>)</td>

               </tr>

           <%
             } // end array element for
           %>

          </table>
        </td>
      </tr>

    <%
      } // end single array element if
    %>

    <%
      if (object.hasTranscriptCounts()) {
    %>

        <!-- show transcripts regardless of array elements, but show as part of same band -->
        <!-- with a spacer row inserted and w/same bg color if array elements were displayed -->
        <%
          String bgColor =
              (object.hasSingleChannelArrayElements() || object.hasDualChannelArrayElements()) ? myBgColor.sameBgColor()
                  : myBgColor.toggleBgColor();
        %>
        <%
          if (object.hasSingleChannelArrayElements()
                || object.hasDualChannelArrayElements()) {
        %>

        <tr <%=bgColor%>>
            <td class="sm" colspan="3">&nbsp;</td>
        </tr>
        <%
          }
        %>

    <tr <%=bgColor%>>
        <th class="sm" align="left" valign="top">Associated Transcripts<%=DefinitionsLookup.createPopupLink("Glossary",
                                                    "associated elements")%></th>
        <td class="sm">&nbsp;</td>
        <td class="sm" >
            <table width="100%" border="0" cellpadding="2" cellspacing="1">
               <tr>
                  <td class="sm" align="left">type</td>
                  <td class="sm" align="left">number associated</td>
               </tr>

            <%
              for (BsLocusTranscriptCount count : object.getTranscriptCounts()) {
            %>
               <tr>
                   <td class="sm"><%=count.getTranscriptType()%></td>
                   <td class="sm">( <a href="<%=count.getSearchLink()%>" target=_blank><%=count.getTranscriptCount()%></a> )
               </tr>
             <%
               }
             %>
           </table>
       </td>
    </tr>
  <%
    }
  %>



  <!-- chromosome-->
           <tr <%=myBgColor.toggleBgColor()%> >
              <th class="sm" align="left" valign="top">Chromosome</th>
              <td class="sm" >&nbsp;</td>
              <td class="sm" ><%=Units.translateChromosome(object.getChromosome())%></td>
           </tr>


   <!-- sequence of representative gene_model-->
    <%
      if (object.hasRepresentativeGeneSequences()) {
    %>
      <tr <%=myBgColor.toggleBgColor()%> >
        <th class="sm" valign="top" align="left">Nucleotide Sequence<%=DefinitionsLookup.createPopupLink("NucleotideSequence",
                                                    "class")%></th>
        <td class="sm">&nbsp;</td>
        <td class="sm" nowrap>
              <%
                Collection<BsLocusNucleotideSequence> seqs = object.getRepresentativeGeneSequences();
                  String sep = "";
                  for (BsLocusNucleotideSequence seq : seqs) {
              %>
                      <%=sep%><a href="<%=seq.getSequenceLink()%>"><%=seq.getSequenceName()%></a>
              <%
                      sep = "&nbsp;&nbsp;";
                  }
              %>
        </td>
       </tr>
    <%
      }
    %>

   <!-- representative protein data-->

  <%
      if (object.hasRepresentativeGeneAaSequences()) {
  %>
      <tr <%=myBgColor.toggleBgColor()%> >
        <th class="sm" valign="top" align="left">Protein Data<%=DefinitionsLookup.createPopupLink("Glossary", "protein data")%></th>
        <td class="sm">&nbsp;</td>
        <td class="sm">
        <table>
       <tr align="left">
          <th class="sm">name</th>
       <th class="sm" nowrap>&nbsp;</th>
          <th class="sm">length(aa)</th>
       <th class="sm" nowrap>&nbsp;</th>
       <th class="sm">molecular weight</th>
       <th class="sm" nowrap>&nbsp;</th>
       <th class="sm">isoelectric point</th>
       <th class="sm">&nbsp;</th>
       <th class="sm">domains( # of domains)</th>
       </tr>
     <%
        for (BsLocusProteinSequence sequence : object.getRepresentativeGeneAaSequences()) {
     %>
          <tr align="left">
            <td class="sm">
              <a href="/servlets/TairObject?type=aa_sequence&amp;id=<%=sequence.getSequenceTairObjectId()%>"><%=sequence.getName()%></a>&nbsp;</td>
            <td class="sm" nowrap>&nbsp;</td>
            <td class="sm"><%=EmptyTextConverter.convert(sequence.getLength())%>&nbsp;</td>
            <td class="sm" nowrap>&nbsp;</td>
            <td class="sm"><%=EmptyTextConverter.convert(sequence.getMolecularWeight())%>&nbsp;</td>
            <td class="sm" nowrap>&nbsp;</td>
            <td class="sm"><%=EmptyTextConverter.convert(sequence.getIsoelectricPoint())%>&nbsp;</td>
            <td class="sm">&nbsp;</td>
     <%
          boolean first = true;
          for (BsLocusProteinSequenceDomain domain : sequence.getDomains()) {
            if (first) {
     %>
            <td class="sm"><%=domain.getInterproLink() + "(" + domain.getDomainCount() + ")"%></td>
          </tr>
    <%
              first = false;
            } else {
    %>
          <tr>
            <td class="sm" nowrap>&nbsp;</td>
            <td class="sm" nowrap>&nbsp;</td>
            <td class="sm">&nbsp;</td>
            <td class="sm" nowrap>&nbsp;</td>
            <td class="sm">&nbsp;</td>
            <td class="sm" nowrap>&nbsp;</td>
            <td class="sm">&nbsp;</td>
            <td class="sm">&nbsp;</td>
            <td class="sm"><%=domain.getInterproLink() + "(" + domain.getDomainCount() + ")"%></td>
          </tr>
    <%
            }   
          }
        }
   %>
      </table>
    </td>
   </tr>
   <%
      }
   %>

    <!-- MAP_LOCATIONS -->

    <%
      if (object.hasGlobalAssignments()) {
    %>
        <tr <%=myBgColor.toggleBgColor()%> >
          <th class="sm" align="left" valign="top">Map Locations<br><%= DefinitionsLookup.createPopupLink("Glossary","Map Locations") %></th>
          <td class="sm">&nbsp;</td>
          <td class="sm">
          <table width="100%" border="0" cellpadding="1">
            <tr align="left" valign="bottom">
              <th class="sm" align="left">chrom</th>
              <th class="sm" align="left">map</th>
              <th class="sm" align="left">map type<%= DefinitionsLookup.createPopupLink("Map","map_type") %></th>
              <th class="sm" align="left">coordinates</th>
              <th class="sm" align="left">orientation</th>
              <th class="sm" align="left">attrib</th>
            </tr>
       <%
       for (BsLocusGlobalAssignment globalAssignment : object.getLocusGlobalAssignments()) {
            %>

            <tr>
                <td class="sm"><%= EmptyTextConverter.convert( globalAssignment.getChromosome()) %></td>
                <td class="sm"><a href="/servlets/TairObject?type=map&amp;id=<%= globalAssignment.getMapId() %>"> <%= globalAssignment.getMapName() %></a></td>
                <td class="sm"><%= globalAssignment.getMapType() %></td>
                <td class="sm"> <%= TextConverter.doublePositionToString( globalAssignment.getStartPosition(), globalAssignment.getUnits() ) %> - <%= TextConverter.doublePositionToString( globalAssignment.getEndPosition(), globalAssignment.getUnits() ) %> <%= EmptyTextConverter.convert( globalAssignment.getUnits() ) %> </td>
                <td class="sm"> <%= globalAssignment.getOrientation() %></td>
                <td class="sm">&nbsp;</td>
                <td class="sm">
                    <% if ( globalAssignment.getAnnotations() || globalAssignment.getAttributions() ) { %>
                        <a href="/servlets/TairObject?id=<%= globalAssignment.getGlobalAssignmentId() %>&amp;type=global_assignment">details</a>
                    <% } %>
                </td>
            </tr>

            <% 
            // Get Super Assignments for this Global Assignment

            if ( globalAssignment.getSuperAssignments().size() > 0 ) {
                for (BsLocusGlobalSuperAssignment superAssignment : globalAssignment.getSuperAssignments()) {
                    %>

                    <tr>
                        <td class="sm"><%= EmptyTextConverter.convert( superAssignment.getChromosome() ) %></td>
                        <td class="sm"><a href="/servlets/TairObject?type=<%= superAssignment.getObjectType() %>&id=<%= superAssignment.getObjectId() %>"> <%= superAssignment.getObjectName() %></a></td>
                        <td class="sm"><%= superAssignment.getObjectType() %></td>
                        <td class="sm"> <%= TextConverter.doublePositionToString( superAssignment.getStartPosition(), superAssignment.getUnits() ) %> - <%= TextConverter.doublePositionToString( superAssignment.getEndPosition(), superAssignment.getUnits() ) %> <%= EmptyTextConverter.convert( superAssignment.getUnits() ) %> </td>
                        <td class="sm"> <%= superAssignment.getOrientation() %></td>
                    </tr>
            <%
                } 
            } 
        } %>
          </table>
        </td>
      </tr>
    <%
      }
    %>

    <!-- CREATE LINKS TO VIEWERS IF POSSIBLE -->

    <%
      if (object.hasGlobalAssignments() && object.isArabidopsisThaliana()) {
    %>
        <tr <%=myBgColor.toggleBgColor()%> >
            <th class="sm" align="left">Map Links<%=DefinitionsLookup.createPopupLink("Glossary", "Map Links")%></th>
            <td class="sm">&nbsp;</td>
            <!-- create viewer links using name and gene model info since locus has no assignments of its own -->
            <td class="sm">
                <%
                  if (object.showMapViewerLink()) {
                %>
                    <a href="/servlets/mapper?value=<%=URLEncoder.encode(object.getLocusName(), "ISO-8859-1")%>&amp;action=search">Map Viewer</a>
                <%
                  }
                %>
                <%
                  if (object.isAgiMap()) {
                %>
                    &nbsp;&nbsp;&nbsp;
                    <%=HTMLFactory.createSeqViewerLinks("Sequence Viewer",
                                                     "gene",
                                                     object.getRepresentativeGeneModelTairObjectId(),
                                                     object.getAGIChromosomes(),
                                                     "&nbsp;")%>
                <%
                  }
                %>
                &nbsp;&nbsp;&nbsp;
                <a href="/cgi-bin/gbrowse/arabidopsis/?name=<%=object.getLocusName()%>">GBrowse</a>
                &nbsp;
                
            </td>
        </tr>
    <%
      } else if (object.hasGlobalAssignments() && object.isArabidopsisLyrata()) {
    %>    
        <tr <%=myBgColor.toggleBgColor()%> >
            <th class="sm" align="left">Map Links<%=DefinitionsLookup.createPopupLink("Glossary", "Map Links")%></th>
            <td class="sm">&nbsp;</td>
            <td class="sm"><a href="/cgi-bin/gbrowse_syn/arabidopsis/?search_src=lyrata&name=<%=object.getLocusName()%>">GBrowse_syn</a>
             &nbsp;&nbsp;&nbsp;
             <a href="/cgi-bin/gbrowse/gb_ensembl_alyrata/?name=<%=object.getLocusName()%>">GBrowse</a>
             &nbsp;
            </td>
        </tr>
    <%
      }
    %>

    <!-- GENETIC_MARKER_LOCUS_VECTOR-->

 <%
   if (object.hasGeneticMarkers()) {
 %>
        <tr <%=myBgColor.toggleBgColor()%> >
            <th class="sm" valign="top" align="left">Genetic Markers<%=DefinitionsLookup.createPopupLink("GeneticMarker", "class")%></th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <table>
                    <tr align="left">
                        <th class="sm">name<%=DefinitionsLookup.createPopupLink("GeneticMarker", "name")%></th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">type<%=DefinitionsLookup.createPopupLink("GeneticMarker", "type")%></th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">alias</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">chromosome</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">position</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">mapViewer</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">seqViewer</th>
                    </tr>
 <%
     for (BsLocusMarker marker : object.getGeneticMarkers()) {
       boolean first = true;
       for (BsLocusMarkerGlobalAssignment assignment : marker.getGlobalAssignments()) {
 %>
                    <tr>
                       <td class="sm">
 <%
         if (first) {
 %>
                           <a href="/servlets/TairObject?accession=<%="marker:" + marker.getMarkerTairObjectId()%>"><%=EmptyTextConverter.convert(marker.getName())%></a>
 <%
         }
 %>
                         &nbsp;
                         </td>
                         <td class="sm" nowrap>&nbsp; &nbsp;</td>
                         <td class="sm">
 <%
         if (first) {
 %>
                             <%=EmptyTextConverter.convert(marker.getMarkerType())%>
 <%
         }
 %>
                             &nbsp;
                         </td>
                         <td class="sm" nowrap>&nbsp; &nbsp;</td>
                         <td class="sm">
<%
         if (first) {
%>
                             <%=EmptyTextConverter.convert(object.getMarkerAliasString(marker))%>
 <%
         }
 %>
                             &nbsp;
                         </td>
                         <td class="sm" nowrap>&nbsp; &nbsp;</td>
                         <td class="sm"><%=EmptyTextConverter.convert(marker.getChromosome())%></td>
                         <td class="sm" nowrap>&nbsp; &nbsp;</td>
                         <td class="sm"><%=TextConverter.doublePositionToString(assignment.getStartPosition(), assignment.getUnits()) + "-" + TextConverter.doublePositionToString(assignment.getEndPosition(), assignment.getUnits()) + " " + assignment.getUnits()%></td>
                         <td class="sm" nowrap>&nbsp; &nbsp;</td>
                         <td class="sm">
 <%
         if (first && object.showMapViewerLink()) {
 %>
                             <a href="/servlets/mapper?value=<%=object.getLocusName()%>&amp;action=search">Map Viewer</a>
 <%
         }
 %>
                       
                             &nbsp;
                         </td>
                         <td class="sm" nowrap>&nbsp; &nbsp;</td>
                         <td class="sm">
 <%
         if (first && object.getMarkerAGIChromosomes(marker).length > 0) {
 %>
                             <%=HTMLFactory.createSeqViewerLinks("Sequence Viewer",
                                                                 "marker",
                                                                 marker.getMarkerTairObjectId(),
                                                                 object.getMarkerAGIChromosomes(marker),
                                                                 "&nbsp;")%>
 <%
         }
 %>
                             &nbsp;
                         </td>
                    </tr>
 <%
         first = false;
       } // end assignment loop
     } // end marker loop
 %>
                </table>
            </td>
        </tr>
 <%
   }
 %>



<!-- polymorphism-->

<%
  int MAX_POLYS = 15;
  List<BsLocusPolymorphism> locusPolys = object.getPolymorphisms();
  String polysearchurl =
    "/servlet/Search?type=polyallele&amp;action=search&name_type1=locus_name&amp;method1=4&amp;term1="
        + object.getLocusName()
        + "&amp;name_type2=locus_name&amp;method2=2&amp;term2=&amp;allele=any&amp;poly_type=any&amp;insertion_type=any&amp;poly_site=any&amp;inheritance=any&amp;ecoLow=any&ecoHi=any&amp;transgene=any&amp;mutagen=any&amp;size=25&amp;order=name";
  if (locusPolys.size() > 0) {
%>
  <tr <%=myBgColor.toggleBgColor()%> >
     <th class="sm" valign="top" align="left">
      Polymorphism<%=DefinitionsLookup.createPopupLink("Polymorphism", "class")%><br />
      Showing <%=locusPolys.size() > MAX_POLYS ? MAX_POLYS : locusPolys.size()%> of <%=object.getPolymorphismCount()%> entries<br>
      <%
        if (locusPolys.size() > MAX_POLYS) {
      %>(<a href="<%=polysearchurl%>">see all</a>)<%
        }
      %></th>
     <td class="sm">&nbsp;</td>
     <td class="sm">
     <table>
       <tr align="left">
         <th class="sm">name<%=DefinitionsLookup.createPopupLink("Polymorphism", "name")%></th>
         <th class="sm">&nbsp; </th>
         <th class="sm">type<%=DefinitionsLookup.createPopupLink("Polymorphism", "type")%></th>
         <th class="sm">&nbsp; </th>
         <th class="sm">polymorphism site</th>
         <th class="sm">&nbsp; </th>
         <th class="sm">allele type<%=DefinitionsLookup.createPopupLink("Polymorphism",
                                                    "allele_mode")%></th>
       </tr>
      <%
        int counter = 0;
        for (BsLocusPolymorphism pol : locusPolys) {
      %>  
       <tr>
         <td class="sm"><a href="/servlets/TairObject?id=<%=pol.getPolymorphismId()%>&amp;type=polyallele"> <%=pol.getName()%> </a> </td>
         <td class="sm">&nbsp; </td>
         <td class="sm"> <%=EmptyTextConverter.convert(pol.getPolymorphismType())%> </td>
         <td class="sm">&nbsp;</td>
         <td class="sm" align="center"><%=EmptyTextConverter.convert(pol.getGeneFeatureSite())%></td>
         <td class="sm">&nbsp;</td>
         <td class="sm" align="center"><%=EmptyTextConverter.convert(pol.getAlleleMode())%></td>
         </tr>
      <%
          counter++;
          if (counter >= MAX_POLYS) {
            // Display only the MAX number of polymorphisms.
            break;
          }
        }
      %>
     </table>
   </td>
  </tr>
<%
  }
%>

    <!-- GERMPLASM -->
    <%
      String search_url =
        "/servlets/Search?type=germplasm&amp;search_action=search&amp;name_type_1=gene_name&amp;method_1=4&amp;name_1="
            + object.getLocusName();
      List<BsLocusGermplasm> germplasms = object.getGermplasms();
    %>
    <%
      // Maximum number of germplasms to display
      int MAX_GERMPLASMS = 15;
      if (object.hasGermplasms()) {
    %>
        <tr <%=myBgColor.toggleBgColor()%>>
            <th class="sm" valign="top" align="left">
               Germplasm<BR><%=DefinitionsLookup.createPopupLink("Germplasm", "class")%><br>
               Showing <%=germplasms.size() > MAX_GERMPLASMS ? MAX_GERMPLASMS : germplasms.size()%> of <%=object.getGermplasmCount()%> entries<br>
    <%
        if (germplasms.size() > MAX_GERMPLASMS) {
    %>
               (<a href="<%=search_url%>">see all</a>)
    <%
        }
    %>
            </th>
            <td class="sm">&nbsp;</td>
            <td class="sm">
                <form action="/servlets/Order/current" method="POST"  onSubmit="orderFormWindow( this )">
                    <input type="hidden" name="state" value="addStock">
                    <table border="0" class="germ_band">
                        <tr  align="left">
                            <th class="sm">name</th>
                            <th class="sm">&nbsp; </th>
                            <th class="sm">polymorphisms</th>
                            <th class="sm">&nbsp; </th>
                            <th class="sm">background</th>
                            <th class="sm">&nbsp; </th>
                            <th class="sm">stock name</th>
                            <th class="sm">&nbsp; </th>
                            <th class="sm">select</th>
                        </tr>
    <%
        boolean show_ordering_buttons = false;
        String background, stock_name, orig_name;
        int germplasmCount = 0;
        germplasmLoop: for (BsLocusGermplasm germplasm : germplasms) {
          orig_name = "<a href=\"/servlets/TairObject?type=germplasm&amp;id="
                      + germplasm.getGermplasmTairObjectId().toString() + "\">" 
                      + germplasm.getName() + "</a>";
          background = EmptyTextConverter.convert(germplasm.getSpeciesVariantAbbrevName());
          StringBuilder polys = new StringBuilder("");
          String sep = "";
          for (BsLocusGermplasmPolymorphism poly : germplasm.getPolymorphisms()) {
            polys.append(sep);
            polys.append("<a href=\"/servlets/TairObject?type=polyallele&amp;id=");
            polys.append(poly.getPolymorphismId());
            polys.append("\">");
            polys.append(poly.getName());
            polys.append("</a>");
            sep = "; ";
          }
    %>
    <%
          // Display horizontal rule before next germplasm
          // Display rule after first but not after the last one (max).
          if (germplasmCount > 0 && germplasmCount < MAX_GERMPLASMS && germplasmCount < germplasms.size()) {
    %>
                                <tr><td colspan="9"><hr/></td></tr>
    <%
          }
          germplasmCount++;
          if (germplasmCount > MAX_GERMPLASMS) {
            // Display only up to MAX germplasms
            break germplasmLoop;
          }
    %>
                        <tr  align="left">
                            <td class="sm"><%=orig_name%></td>
                            <td class="sm">&nbsp; </td>
                            <td class="sm"><%=polys%></td>
                            <td class="sm">&nbsp; </td>
                            <td class="sm"><%=background%></td>
                            <td class="sm">&nbsp;</td>
                   
    <%
          if (germplasm.getStocks().size() == 0) {
    %>
                            <td class="sm"> not an ABRC stock</td>
                            <td class="sm" colspan = "2"> &nbsp;</td>
                        </tr>
    <%
          } else {
            boolean firstStock = true;
            for (BsLocusGermplasmStock stock : germplasm.getStocks()) {
              if (!firstStock) {
                // Display separator row for multiple stocks.
    %>
                        <tr>
                            <td class="sm" colspan="6"> &nbsp;</td>
                        </tr>
    <%
              } else {
                // set flag off to display separator row next time
                firstStock = false; 
              }
    %>
                            <td class="sm" align="left" valign="top"><a href="/servlets/TairObject?type=stock&amp;id=<%=stock.getStockId()%>"> <%=stock.getStockNumber()%></a></td>
                            <td class="sm" nowrap>&nbsp;</td>
                            <td class="sm" align="left" valign="top" >
    <%
              if (DataConstants.getAvailableStock().equals(stock.getAvailabilityType())) {
                show_ordering_buttons = true;
    %>
                                <input type="checkbox" name="stock_number" value="<%=stock.getStockNumber()%>" />
                            </td>
                        </tr>
    <%
              } else {
    %>
                                not available
                            </td>
                        </tr>
    <%
              }
            } // end stock loop
          }
    %>
                        <tr>
                            <th colspan="9" align="left">images</th>
                        </tr>
                        <tr>
                            <td colspan="9">
    <%
          if (germplasm.getImageCount() > 0) {
            for (BsLocusGermplasmImage image : germplasm.getImages()) {
              if (image.getThumbnail()) {
    %>
                                <a href="/jsp/common/image.jsp?id=<%=image.getImageId()%>&amp;format=<%=image.getLinkSuffix()%>"><img src="/servlets/images/thumb_<%=image.getImageId()%>.<%=image.getLinkSuffix()%>" border="0"></a>
    <%
              } else {
    %>
                                <a href="/jsp/common/image.jsp?id=<%=image.getImageId()%>&amp;format=<%=image.getLinkSuffix()%>">View Image</a>
    <%
              }
            }
          } else {
    %>
                                None available
    <%
          }
    %>
                                &nbsp;<br />
                            </td>
                        </tr>
                    
                        <tr>
                            <th colspan="9" align="left">phenotypes<%=DefinitionsLookup.createPopupLink("Phenotype", "class")%></th>
                        </tr>
                        <tr>
                            <td colspan="9">
    <%
          if (germplasm.getPhenotypeCount() > 0) {
    %>
                                <ul>
    <%
            for (BsLocusGermplasmPhenotype phenotype : germplasm.getPhenotypes()) {
    %>
                                        <li><%=EmptyTextConverter.convert(phenotype.getPhenotype())%>
    <%
              if (phenotype.getLabel() == null || phenotype.getLabel().length() == 0) {
    %>
                                        Phenotype curated by ABRC.
    <%
              } else {
    %>
                                        <a href="/servlets/TairObject?id=<%=phenotype.getReferenceId()%>&amp;type=<%=phenotype.getReferenceType()%>"><%=EmptyTextConverter.convert(phenotype.getLabel()).trim()%></a>
    <%
              }
    %>
                                    </li>
    <%
            } // end phenotype loop
    %>
                                </ul>
    <%
          } else {
    %>
                                        None available
    
    <%
          }
    %>
                            </td>
                        </tr>
    <%
        } // end germplasm loop
        if (show_ordering_buttons) {
    %>
                        <tr>
                            <td colspan="9" nowrap>
                                <hr>
                                <input type="submit" name="submit" value="Order from ABRC">
                                &nbsp;
                                <input type="reset" name="reset" value="Reset">
                               </td>
                        </tr>
    <%
        }
    %>

                    </table>
                </form>
            </td>
        </tr>
    <%
      }
    %>

<!-- external_link -->
 <%
   if (object.getExternalLinks() != null || object.getATGDBLink() != null) {
 %>

 <tr <%=myBgColor.toggleBgColor()%> >
     <th class="sm" align="left" valign=top>External Link<%=DefinitionsLookup.createPopupLink("Glossary", "external link")%></th>
     <td class="sm">&nbsp;&nbsp;</td>
     <td class="sm">
         <table>
  <%
    if (object.getATGDBLink() != null) {
  %>
         <tr>
             <td class="sm">
                 <a onClick="javascript:urchinTracker('/outgoing/www.plantgdb.org');" href='<%=object.getATGDBLink()%>' target=_blank>AtGDB View</a>
             </td>
         </tr>
  <%
    }
  %>
  <%
    if (object.getExternalLinks().size() > 0) {
        for (BsLocusExternalLink linkObject : object.getExternalLinks()) {
          LocusExternalLink link = new LocusExternalLink(linkObject);
  %>
         <tr>
             <td class="sm"><%=link.getExternalLink()%></td>
         </tr>
  <%
    }
      }
  %>
         </table>
     </td>
 </tr>
<%
  }
%>

  <!--comment-->
 <%
   String commentColor = myBgColor.toggleBgColor();
 %>
        <tr  <%=commentColor%>  valign="top">
           <th class="sm" align="left">Comments <%=DefinitionsLookup.createPopupLink("Glossary", "Comments")%><br>(shows only the most recent comments by default)</th>

 <%
   if (!hidden && object.hasComments()) {
 %>
                <td class="sm">&nbsp;</td>
                <td class="sm">
                    <table cellpadding="2" width="100%">
                        <tr align="left">
                            <th class="sm">entered by</th>
                            <th class="sm">date</th>
                            <th class="sm">comment</th>
                        </tr>
 <%
      for (BsLocusComment comment : object.getComments(showAll)) {
 %>
                        <tr valign="top">
                            <td class="sm" nowrap><a href="/servlets/Community?action=view&amp;type=person&amp;communityID=<%=comment.getCommunityId()%>"><%=comment.getName()%></a></td>
                            <td class="sm" nowrap><%=TextConverter.dateToString(comment.getDateEntered())%></td>
                            <td class="sm"><a href="/servlets/TairObject?type=notepad&amp;id=<%=comment.getNotepadId()%>"><%=comment.getCommentText()%></a></td>
                        </tr>
 <%
      }
 %>
                    </table>
                </td>
 <%
    } else {
 %>
                <td class="sm" colspan="2"> &nbsp;</td>
 <%
    }
 %>
        </tr>
        <tr<%=commentColor%>  valign="top"  %>
            <td class="sm" colspan=3 align=center>
                <form action="/servlets/updater" method="post">
                    <input type="hidden" name="type" value="notepad">
                    <input type="hidden" name="update_action" value="add">
                    <input type="hidden" name="tair_object_id" value="<%=object.getTairObjectId()%>">
                    <input type="hidden" name="accession" value="<%=object.getAccession()%>" >
                    <input type="submit" VALUE="Add My Comment">&nbsp;&nbsp;
 <%
    String hideText = hidden ? "Show Comments" : "Hide Comments";
    boolean hideOption = !hidden;
    String allText = showAll ? "Show Recent Comments" : "Show All Comments";
    boolean showAllOption = !showAll;
 %>
                  <input type="button" value="<%=hideText%>" onClick="document.location.href='/servlets/TairObject?accession=<%=object.getAccession()%>&amp;hideNote=<%=hideOption%>'">&nbsp;&nbsp;
                  <input type="button" value="<%=allText%>" onClick="document.location.href='/servlets/TairObject?accession=<%=object.getAccession()%>&amp;showAllNote=<%=showAllOption%>'">
              </form>
           </td>
        </tr>

   <!-- attribution -->
 <%
    if (object.getAttributions() != null) {
 %>
       <tr <%=myBgColor.toggleBgColor()%> >
           <th class="sm" valign="top" align="left">Attribution<%=DefinitionsLookup.createPopupLink("Attribution", "class")%></th>
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
      for (BsLocusAttribution attribution : object.getAttributions()) {
 %>
                   <tr>
                       <td class="sm"><%=EmptyTextConverter.convert(attribution.getAttributionType())%></td>
                       <td class="sm" nowrap>&nbsp; &nbsp;</td>
                       <td class="sm"><a href="/servlets/Community?action=view&amp;type=<%=attribution.getLinkType()%>&amp;communityID=<%=attribution.getCommunityId()%>"><%=attribution.getName()%></a></td>
                       <td class="sm" nowrap>&nbsp; &nbsp;</td>
                       <td class="sm"><%=EmptyTextConverter.convert(TextConverter.dateToString(attribution.getAttributionDate()))%></td>
                   </tr>
 <%
      }
 %>
               </table>
           </td>
        </tr>
 <%
    }
 %>


   <!-- communication -->
 <%
   if (object.hasCommunicationReferences()) {
 %>
        <tr <%=myBgColor.toggleBgColor()%> >
            <th class="sm" valign="top" align="left">Communication</th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm">
                <table>
                    <tr align="left">
                        <th class="sm">name</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">author name</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">date</th>
                    </tr>

 <%
     for (BsLocusCommunication communication : object.getCommunications()) {
 %>

                    <tr>
                        <td class="sm"><a href=/servlets/TairObject?type=communication&amp;id=<%=communication.getReferenceId()%>><%=EmptyTextConverter.convert(communication.getName())%></a></td>
                        <td class="sm" nowrap>&nbsp; &nbsp;</td>
                        <td class="sm"><%=EmptyTextConverter.convert(communication.getAuthorName())%></td>
                        <td class="sm" nowrap>&nbsp; &nbsp;</td>
                        <td class="sm"><%=EmptyTextConverter.convert(TextConverter.dateToString(communication.getCommunicationDate()))%></td>
                    </tr>
 <%
     }
 %>
                </table>
            </td>
        </tr>
 <%
   }
 %>

  <!-- publication -->
 <%
   if (object.hasPublications()) {
 %>
        <tr <%=myBgColor.toggleBgColor()%> >
            <th class="sm" valign="top" align="left">Publication<%=DefinitionsLookup.createPopupLink("Publication", "class")%></th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm">
                <table>
                    <tr align="left">
                        <th class="sm">title</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">source</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">associated loci</th>
                        <th class="sm" nowrap>&nbsp; &nbsp;</th>
                        <th class="sm">date</th>
                    </tr>

 <%
   int MAX_PUBS = 15;
   int pubCount = 0;
   boolean pubsAbbreviated = false;
   for (BsPublication publication : object.getPublications()) {
     pubCount++;
     if (pubCount >= MAX_PUBS) {
       // Enough pubs already--stop printing.
       pubsAbbreviated = true;
       break;
     }
 %>

                    <tr>
                        <td class="sm"><a href="/servlets/TairObject?type=publication&amp;id=<%=publication.getReferenceId()%>"><%=EmptyTextConverter.convert(publication.getTitle())%></a></td>
                        <td class="sm" nowrap>&nbsp; &nbsp;</td>
                        <td class="sm"><%=EmptyTextConverter.convert(publication.getPubSourceName())%></td>
                        <td class="sm" nowrap>&nbsp; &nbsp;</td>
                        <td class="sm">

 <%
     if (publication.getLociCount() > 0) { 
       int MAX_LOCI = 20;
       int lociCount = 0;
       boolean lociAbbreviated = false;
       for (BsPublicationLocus pubLocus : publication.getDisplayLoci()) {
 %>
                            <a href="/servlets/TairObject?name=<%=pubLocus.getName()%>&amp;type=locus"><%=pubLocus.getName()%></a>&nbsp;
 <% 
         lociCount++;
         if (lociCount >= MAX_LOCI) {
           // Enough loci already--stop printing.
           lociAbbreviated = true;
           break;
         }
       } // end while loci loop
        
       if(lociAbbreviated) { 
 %>
                            <a href="/servlets/TairObject?type=publication&amp;id=<%=publication.getReferenceId()%>">more...</a>
 <%
       }
     }
%>
                        </td>
                        <td class="sm" nowrap>&nbsp; &nbsp;</td>
                        <td class="sm"><%=publication.getPublicationYear()%></td>
                    </tr>
 <%
   } // end while publication loop
 %>

 <!-- if publications collection was abbreviated, show link to full list
                as publication search results --->
 <%
   if (pubsAbbreviated) {
 %>
                    <tr>
                        <td class="sm" colspan="4"><br \>
                            <a href="/servlets/Search?type=publication&amp;search_action=search&amp;locus_tair_object_id=<%=object.getTairObjectId()%>&amp;locus_name=<%=URLEncoder.encode(object.getLocusName(), "ISO-8859-1")%>">View Complete List</a>
                            &nbsp;
                            (<%=MAX_PUBS%> of <%=object.getPublicationCount()%> displayed)
                        </td>
                    </tr>
 <%
   }
 %>
                </table>
            </td>
        </tr>
 <%
 }
 %>


   </table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
