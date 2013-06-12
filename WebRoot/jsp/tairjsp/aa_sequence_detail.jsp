<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*, java.util.*, java.net.*, org.tair.bs.community.*"
%>

<%!
String pageName = "Protein Detail";
%>

<% request.setAttribute("helpfile", "/help/helppages/protdet.jsp"); %>

<% 
    AASequenceDetail object = (AASequenceDetail)request.getAttribute("detail"); 
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
        <td colspan="3"><b><font size="+1">Protein: <%= object.get_name() %></font></b></td>
    </tr>
    
       <!-- updateHistory -->
	<% if( object.hasUpdateHistory() || object.hasAffectedUpdateHistory() ){ %>
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
                  <% } }
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
                 <% } } %>
             </table>
             </td>
          </tr>
     <% } %>   	

  <!-- date_last_modified-->
   <% if ( object.get_date_last_modified() != null ) { %>  
    <tr  <%= myBgColor.toggleBgColor() %> >  

   <th class="sm" align="left">Date last modified<%= DefinitionsLookup.createPopupLink("AASequence","date_last_modified") %></th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%=  object.get_date_last_modified()  %></td>
   </tr>
  <% }  %>
 
 

  <!-- tair accession -->
           <tr <%=myBgColor.toggleBgColor()%> >
              <th class="sm" align="left" valign="top">TAIR Accession<%= DefinitionsLookup.createPopupLink("Glossary","TAIR Accession") %></th>
              <td class="sm" >&nbsp;&nbsp;</td>
              <td class="sm" ><%= object.getAccession() %></td>
           </tr>

 <!-- alias  -->
     <% if ( object.get_aliases() != null ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" valign="top" align="left">Alias</th>
        <td class="sm">&nbsp;</td>
        <td class="sm">
	   <table>
	       <tr align="left">
	          <th class="sm">name</th>
	          <th class="sm" nowrap>&nbsp; &nbsp;</th>
	          <th class="sm">type</th>
	          <th class="sm" nowrap>&nbsp; &nbsp;</th>
	       </tr>
          <% 
             Iterator aliasIter = object.get_aliases();
             while ( aliasIter.hasNext() ) {
                  TfcAlias alias = (TfcAlias) aliasIter.next();
          %>
	        <tr>
	          <td class="sm"><%= EmptyTextConverter.convert( alias.get_alias() ) %></td>
 	          <td class="sm" nowrap>&nbsp; &nbsp;</th>
                  <td class="sm"><%=EmptyTextConverter.convert( alias.get_type() ) %></td>
 	          <td class="sm" nowrap>&nbsp; &nbsp;</th>
                </tr>
          <% } %>
           </table>
	 </td>
        </tr>
      <% } %>

   <!--description-->
    <% if ( object.get_description() != null ) { %>
           <tr <%=myBgColor.toggleBgColor() %> >
              <th class="sm" align="left" valign="top">Description</th>
              <td class="sm" >&nbsp;&nbsp;</td>
              <td class="sm" ><%= object.get_description() %></td>
           </tr>
     <% } %>   	      



  <!-- external_ids -->
   <%  if (object.get_uniprot_id()!=null ||
       object.get_genbank_gi() != null)  { %>

      <tr <%= myBgColor.toggleBgColor() %>>
              <th class=sm align=left valign=top >External IDs<%= DefinitionsLookup.createPopupLink("Glossary","external ids") %></th>
              <td class=sm >&nbsp;</td>
              <TD class="sm">
              <TABLE border=0>
                  <TR align="left">
                  
                      <TH class="sm">UniProtKB</TH>
                      <TH class="sm" nowrap>&nbsp;&nbsp;   </TH>
                      <TH class="sm">GenPept</TH>
                      <TH class="sm" nowrap>&nbsp;&nbsp;   </TH>
                      <TH class="sm">Similar Proteins in Genbank</TH>
                  </TR>

                 <TR>
                  <TD class="sm">
               <% if (object.get_uniprot_id()!=null){ %>
                 <A HREF=http://www.pir.uniprot.org/cgi-bin/upEntry?id=<%= object.get_uniprot_id() %>>  <%= object.get_uniprot_id() %></A>
               <% } %> &nbsp;
                  </TD>
                  <TD class="sm" nowrap>&nbsp;&nbsp;   </TD> 
                  <TD class="sm" nowrap>
                  <% if (object.get_genbank_gi() != null){ %>
                   <A HREF=http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=protein&list_uids=<%= object.get_genbank_gi()%>&dopt=GenPept target=_blank> <%= object.get_genbank_gi() %></A>
                 <% } %> &nbsp;</TD>
                   <TD class="sm" nowrap>&nbsp;&nbsp;   </TD>
                  <TD class="sm" nowrap>
                  <% if (object.get_genbank_gi() != null){ %>
                   <A HREF="http://www.ncbi.nlm.nih.gov/sutils/blink.cgi?pid=<%= object.get_genbank_gi()%>" onClick="window.open('http://www.ncbi.nlm.nih.gov/sutils/blink.cgi?pid=<%= object.get_genbank_gi()%>'); return false"> NCBI BLink</A>
                 <% } %> &nbsp;</TD>                                  
                </TR>

            </TABLE>
            </TD></TR>
      <% } %>


<!--properties-->
 <tr <%= myBgColor.toggleBgColor() %>>
 <TH class="sm" valign="top" align="left">Properties</TH>
<TD class="sm">  &nbsp;</TD>
<TD class=sm>
    <TABLE>
      <TR align="left">
        <TD class="sm">Calculated MW<%= DefinitionsLookup.createPopupLink("AASequence","calc_MW") %></TD>
        <TH class="sm" nowrap>&nbsp;</TH>
        <TD class="sm"><%=  EmptyTextConverter.convert (object.get_calc_MW() )  %></TD>
      </TR>      

      <TR>
        <TD class="sm">Calculated PI<%= DefinitionsLookup.createPopupLink("AASequence","calc_pI") %></TD>
        <TH class="sm" nowrap> &nbsp;</TH>
        <TD class="sm"><%= EmptyTextConverter.convert(object.get_calc_pI())  %></TD>
      </TR>

      <TR>
      <TD class="sm">Length (aa)<%= DefinitionsLookup.createPopupLink("AASequence","length") %></TD>
      <TH class="sm" nowrap> &nbsp;</TH>
      <TD class="sm"><%= EmptyTextConverter.convert(object.get_length())  %></TD>
      </TR>
    <!-- no data yet
    <TR>
      <TD class="sm">Experimental MW</TD>
      <TH class="sm" nowrap>   </TH>
      <TD class="sm">40400 Da</TD>
             </TR>
 
   <TR>
      <TD class="sm">Is membrane protein</TD>
      <TH class="sm" nowrap> &nbsp;   </TH>
      <TD class="sm">no</TD>
             </TR>

<TR>
      <TD class="sm">Localization</TD>
      <TH class="sm" nowrap> &nbsp; </TH>
      <TD class="sm">unknown</TD> --> 
             </TR>           
</TABLE>
</TD>
</TR>

<!-- domain matches-->
 <% if(object.getDomainMatches()!=null){ %>        
 <tr <%= myBgColor.toggleBgColor() %>>
 <TH class="sm" valign="top" align="left">Domains<BR><%= DefinitionsLookup.createPopupLink("ProteinDomain","type") %></TH>
  <TD class="sm"> &nbsp; </TD>
  <TD class="sm">
    <TABLE>
      <TR align="left">
        <TH class="sm">Database</TH>
        <TH class="sm" nowrap>&nbsp;</TH>
        <th class="sm">Structural Class Type<%=DefinitionsLookup.createPopupLink("StructuralClassType","structural_class_type_id")%></th>
        <TH class="sm" nowrap>&nbsp;</TH>
        <TH class="sm">Accession</TH>
        <TH class="sm" nowrap>&nbsp;</TH>
        <TH class="sm">Interpro</TH>
        <TH class="sm" nowrap>&nbsp; </TH>
        <TH class="sm">Position</TH>
      </TR>

<%  Iterator dmIter =object.getDomainMatches();
    while(dmIter.hasNext()){
       DomainMatch dm = (DomainMatch)dmIter.next();
       String interpro_url_base = "http://www.ebi.ac.uk/interpro/IEntry?ac";
       String interpro_accession =  dm.get_interpro_accession();
 %>    
      <TR>
        <TD class="sm"><%= dm.get_domain_type() %></TD>
        <TD class="sm" nowrap>   </Td>
        <TD class="sm"><%= EmptyTextConverter.convert( dm.get_structural_class_type_description() ) %></TD>
        <TD class="sm" nowrap>   </TD>
        <TD class="sm"><%= dm.get_domain_accession() %></TD>
        <TD class="sm" nowrap>   </TD>
        <TD class="sm">
      <% if ( !TextConverter.isEmpty(interpro_accession) ){ %>
      <A HREF="<%=interpro_url_base %>=<%= interpro_accession %>" target="_blank">
      <%= dm.get_interpro_name() %></A>
      <% } %>&nbsp;
      </TD>
        <TD class="sm" nowrap>   </TD>
      <!--  <TD class="sm"><%= dm.get_interpro_description() %> </TD>
        <TD class="sm" nowrap>   </TD> -->
        <TD class="sm"><%= dm.get_start_position()%>-<%= dm.get_end_position() %></TD>
      </TR>
  <%   }  %>
   
    </TABLE>
    </TD>
    </TR>
<% } %>

<!--Protein Complexes, no data yet-->
<% if(1==0){  %>
<TR>
  <TH class="sm" valign="top" align="left">Protein Complexes</TH>
  <TD class="sm"> </TD>
  <TD class="sm">
    <TABLE>
      <TR align="left">
      <TH>Complex</TH>
      <TH class="sm" nowrap>   </TH>
      <TH>Number of subunits</TH>
     </TR>

<TR>
  <TD> 1. At1g01030 </TD>
  <TD class="sm" nowrap>   </TD>  
  <TD><CENTER>2</CENTER></TD>
      </TR>
</TABLE>

</TD></TR>
 
<% } %>


<!-- gene family no data yet-->

<% if (1==0){ %>
 <tr <%= myBgColor.toggleBgColor() %>>

  <TH class="sm" valign="top" align="left">Gene family</TH>
  <TD class="sm"> </TD>
  <TD class="sm">
    <TABLE>
<TR align="left">
        <TH class="sm">Automatic Annotation</TH>
        <TH class="sm"> </TH>
         <TH class="sm"> </TD>
         <TH class="sm"> </TD></TR>
<TR align="left">
        <TH class="sm"> </TD>
        <TD class="sm"><LI>PSI-BLAST</TD>
        <TH class="sm"> </TD>
          <TH class="sm"> </TD></TR>

        <TR align="left">
        <TH class="sm"> </TD>
        <TD class="sm"> </TD>
        <TH class="sm"> </TD>
        <TH class="sm"><A href=""><LI>DNA-Binding</A></TD></TR>  

<TH class="sm">Manual Annotation</TH>
        <TH class="sm"> </TH>
         <TH class="sm"> </TD>
         <TH class="sm"> </TD></TR>

<TH class="sm"> </TH>
        <TD class="sm"><LI>none</TD>
         <TD class="sm"> </TD>
         <TH class="sm"> </TD></TR>      
</TABLE> 
                </TD>
 </TR>

 <% } %>

<%--
<!-- map link -->
<tr <%= myBgColor.toggleBgColor() %>>
 <TH class="sm" valign="top" align="left">Map Links</TH>
  <TD class="sm">&nbsp; </TD>
  <TD class="sm">
    <TABLE>
      <TR align="left">
      <TH class="sm"><A href="http://tairvm09.tacc.utexas.edu/servlets/sv?action=accession&chr=<%= object.get_gene_chromosome() %>&type=gene&id=<%= object.get_gene_tair_object_id()%>">Seqviewer</A></TH>
      
     </TR>
    </TABLE>
  </TD>
</TR>
--%>

<!-- pathway, no data-->
<% if(1==0){ %>
<tr <%= myBgColor.toggleBgColor() %>>
  <TH class="sm" valign="top" align="left">Metabolic Pathways</TH>
  <TD class="sm">&nbsp; </TD>
  <TD class="sm">
    <TABLE>
      <TR align="left">
      <TD>name</TD>
     </TR>
    </TABLE>
  </TD>
</TR>
<% }%>

<!-- sequence_content-->
 <% if( object.get_sequence() != null ) { %>

 <tr valign="top" <%= myBgColor.toggleBgColor() %>>
     <th class=sm align=left valign=top>Sequence
     <form action="/wublast/index2.jsp" method="post">
         <input type="hidden" name="sequence" value="<%= object.get_sequence().trim() %>" />
	     <input type="hidden" name="sequence_type" value="protein" />
     <input type="submit" value="Send to WU-BLAST">
     </form>
     </th>
     <td class="sm">&nbsp;</td>
     <td class="sm" ><p style="font-family: monospace"> 
 <%  
     String sequence_content = object.get_sequence().trim();
     int length_per_row = 50 ;
     int length_per_segment = 10 ;   
  %>
   <%= TextConverter.breakStringIntoSegmentLines (sequence_content,length_per_row ,length_per_segment ) %>
    </p>
    </td>
 </tr>
	 
 <% } %>

<!-- gene-locus-->
 <%  if( object.getGenes() != null ){ %>
 <TR <%= myBgColor.toggleBgColor() %> >
     <TH class="sm" align="left" valign="top">Associated Genes</TH>
     <TD class="sm">&nbsp;</TD>
     <TD class="sm">
         <table>   
           <TR align="left"> 
             <TH class="sm">Gene Model<%= DefinitionsLookup.createPopupLink("Gene","class") %></TH>
             <TH class="sm">&nbsp;</TH>  
             <TH class="sm">Locus<%= DefinitionsLookup.createPopupLink("Locus","class") %></TH>
             <TH class="sm">&nbsp;</TH> 
             <TH class="sm">seqviewer link</TH> 
           </TR>

          <%  Iterator gene_iter = object.getGenes();
              while ( gene_iter.hasNext() ) { 
                  GeneModel gene = (GeneModel)gene_iter.next();
          %>

           <TR valign="top">
             <TD class="sm"><A href= "/servlets/TairObject?type=gene&id=<%= gene.get_gene_id() %>" ><%= EmptyTextConverter.convert(gene.get_name()) %></A></TD>
             <TD class="sm">&nbsp;</TD>

             <!-- loci of this gene -->
             <% if ( gene.hasLocus() ) {     
                  Iterator loci_iter =  gene.getLocus();
                  boolean firstLocus = true;
                  while ( loci_iter.hasNext() ) { 
                      Locus locus = (Locus) loci_iter.next();
                      if ( !firstLocus ) { 
             %>
                    </tr>
                    <tr valign="top">
                       <td class="sm" colspan="2">&nbsp;</td>
                  <% } %>
               
                 <TD class="sm"><A href= "/servlets/TairObject?type=locus&id=<%= locus.get_locus_id() %>" ><%= EmptyTextConverter.convert(locus.get_name()) %></A></TD>
                 <td class="sm">&nbsp;</td>
                 <td class="sm">
                   <% if ( locus.isAGIMap() ) { %> 
                     <%= HTMLFactory.createSeqViewerLinks( "Sequence Viewer", "gene", locus.getRepresentativeTairObjectID(), locus.getAGIChromosomes(), "<br>" ) %>
                   <% } %>
                   &nbsp;
                 </td>
                  <% firstLocus = false; %>
              <% } %>
           <% } else { // if no locus %>
                <td colspan="3" class="sm">&nbsp;</td>
           <% } %>

         </tr>
     <% } %>
    </TABLE>
   </TD>
  </TR>             
 <% }  %>


 

<!-- annotation -->
<% if ( object.get_annotations() != null ) {  %>
<% myBgColor.toggleBgColor(); %> 
<TR><TD colspan=3 >
  <table cellpadding="2" width="100%" border=0 cellspacing="0" >
<%   Iterator sourceIter = object.getAnnotationSources();
     boolean firstSource = true ;
     while ( sourceIter.hasNext() ) {
        String annotated_by = (String) sourceIter.next();
%>
<% if (! firstSource){  %> <TR <%= myBgColor.sameBgColor()  %>><TD colspan=5><HR></TD></TR> <% } %>

<tr <%= myBgColor.sameBgColor()  %> valign="top" >

     <th class="sm" valign="top" align="left"> 
        <%= EmptyTextConverter.convert( annotated_by) %>'s comment</th>
     <td class="sm">&nbsp;</td>   
  <% Iterator annotations =  object.getAnnotations ( annotated_by );
     boolean first = true;
     while ( annotations.hasNext()){
         AnnotationObject annotation= (AnnotationObject)annotations.next();
         if (!first){
  %>
      <TR  <%= myBgColor.sameBgColor()  %> ><td class="sm" colspan=2 >&nbsp;</td>       
  <%  }  %>
      <td class="sm"><%= EmptyTextConverter.convert( annotation.get_short_annotation() ) + " " + EmptyTextConverter.convert( annotation.get_long_annotation() ) %></td>
      <td class="sm">&nbsp;</td>
      <td class="sm" align=left valign=top><%= EmptyTextConverter.convert( annotation.get_date_entered() )%></td>
     </tr> 
<%   first=false;
   }
%>

<% firstSource = false ;  
  } 
%>
  </table></TD></TR>
<% } %>

  
 <!-- external_link -->
 <%   if(  object.getASPDLink()!= null  ||  object.get_external_links()!=null) { %>
    
  <tr <%= myBgColor.toggleBgColor() %> >
     <th class="sm" valign="top" align="left">External Link</th> 
     <td class="sm">&nbsp;&nbsp;</td>
     <td class="sm">
     <table>
 <%   if(! TextConverter.isEmpty( object.getASPDLink() )){ %>
     <TR> 
      <td class="sm">
      	<A href='<%= object.getASPDLink() %>' target=_blank>The Subcellular Location of Proteins in Arabidopsis Database (SUBA)</a>
     </td>
     </TR> 
 <% } %>
     
 <%    if ( object.get_external_links()!=null){
       Iterator iter = object.get_external_links();
         while ( iter.hasNext() ) {
           ExternalLinkObject elo = (ExternalLinkObject) iter.next();
           String web_site_name = elo.get_web_site_name();

  %>  <TR> 
     <td class="sm"><%= elo.get_external_HTML_link( web_site_name ) %>
     </td>
     </TR> 
<% }} %>
     </TABLE></TD>
  </tr>
<% } %>




 <!--comment-->
 <%
    String commentColor =  myBgColor.toggleBgColor() ;
 %>
        <tr  <%=  commentColor  %>  valign="top">
           <th class="sm" align="left">User Comments<%= DefinitionsLookup.createPopupLink("Glossary","Comments") %><BR> (shows only the most recent comments by default)
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
                          
                         // display_note = note.get_comment().substring(0,100)+"..."; 
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
                    for (BsAttribution attribution : object.get_attributions()) {
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

     </table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
