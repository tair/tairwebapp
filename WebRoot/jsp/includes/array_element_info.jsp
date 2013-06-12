  <% if ( object.hasAliases() ) { %>
  <tr <%= myBgColor.toggleBgColor() %> >
    <TH align=left width=30% >Aliases</TH>
    <td width=5%>&nbsp;</td>
    <td class="sm">
      <%=  EmptyTextConverter.convert(object.get_alias_string()) %> 
    </TD>   
  </tr>
  <% } %>

  <tr <%= myBgColor.toggleBgColor() %> >
  <TH align=left width=30% >Type</TH>
  <td  width=5%>&nbsp;</td>
  <td class="sm">
    <%=  EmptyTextConverter.convert(object.getMapElementType ()).replace('_', ' ') %>
    <!-- if the type is clone , make a hyperlink to clone detail page-->
    <% if ( object.getMapElementType ().equals("clone")){  %>
      <A href="/servlets/TairObject?type=clone&id=<%= object.get_table_id() %>"> (<%= object.get_name()%>)</A>
    <% } %>
  </TD>
  </TR>
  
 <%  if ( object.get_is_control() != null ){ %>
  <tr <%= myBgColor.toggleBgColor() %> >
  <TH align=left width=30% >Is a Control</TH>
  <td  width=5%>&nbsp;</td>
  <td class="sm"> <%= TextConverter.booleanToWord(object.get_is_control()) %>
   </TD>
  </TR>
 <% } %> 
  
  <tr <%= myBgColor.toggleBgColor() %> >
    <%  if ( object.get_table_name().equalsIgnoreCase("clone") && object.hasGenbankAccessions() ) { %>
  <TH align=left width=30% valign=top>Sequence</TH>
  <td  width=5%>&nbsp;</td>
  <td class="sm">
    <% Iterator gbaIter = object.getGenbankAccessions();
       while ( gbaIter.hasNext() ) {
         String accession = (String) gbaIter.next();
    %>     
     <A href="http://www.ncbi.nlm.nih.gov/entrez/viewer.fcgi?save=0&cmd=search&val=<%= accession %>" target=_blank>
      <%=  accession  %><BR></A>
     <% } %>
  </TD>
   <% } else if ( object.get_table_name().equalsIgnoreCase("DnaFragment") && object.hasNucleotideSequence() ) { %>
   
   <TH align=left width=30% valign=top> Sequence</TH>
     <td  width=5%>&nbsp;</td>
     <td class="sm">
     <% Iterator sequenceIter = object.getNucleotideSequences();
        while ( sequenceIter.hasNext() ) {
           TfcNucleotideSequence seq = (TfcNucleotideSequence)sequenceIter.next();
     %>
       
     <A href="/servlets/TairObject?type=sequence&id=<%=seq.get_nucleotide_seq_id()%>" target=_blank>
      <%=  seq.get_name()  %></BR></A>
     <% } %>
  </TD>

   <% } else { %>
       <TH align=left colspan=3>No Sequence Available</TH>
     <% } %>  
  </TR>
  

  
   <%  if ( object.hasLocus()){ %>
  
   <tr <%= myBgColor.toggleBgColor() %> >
   <TH align=left width=30%>Locus</TH>

   <td  width=5%>&nbsp;</td>
   <td class="sm">
   <%  Iterator lociIter = object.getLocus();
       while ( lociIter.hasNext() ) {
           Locus locus = (Locus) lociIter.next();
   %>
   <a href="/servlets/TairObject?type=locus&id=<%= locus.get_locus_id() %>"><%= locus.get_name() %></a> &nbsp;&nbsp;
   <% } %>
   </TD>
   </tr>
   
   <tr <%= myBgColor.toggleBgColor() %> >
   <TH align=left valign=top width=30%>Locus Description</TH>
   <td width=5% >&nbsp;</td>
   <td class="sm">
   <%  lociIter = object.getLocus();
       while ( lociIter.hasNext() ) {
           Locus locus = (Locus) lociIter.next();
   %>
           <%= locus.getRepGeneDescription() %><br /><br /> 
    <% } // end while  %>
    </td></tr> 
  <% }  %> 
    
  <% if ( object.hasTaxon()){
       TfcTaxon taxon  = object.getTaxon() ;
  %>
  <tr <%= myBgColor.toggleBgColor() %> >
   <TH align=left width=30%>Organism<%= DefinitionsLookup.createPopupLink("Taxon","class") %></TH>
   <TD class="sm">&nbsp;&nbsp;</TD>
   <TD class="sm"><%= EmptyTextConverter.convert (taxon.get_scientific_name()) %></TD>
  </tr>
  <% } %>
  
  <% if ( object. get_avg_log_ratio()!= null){ %>
  <tr  <%= myBgColor.toggleBgColor() %> >
    <TH align=left width=30% colspan=2>Avg. Log Ratio<%= DefinitionsLookup.createPopupLink("ArrayElement","avg_log_ratio") %>(Std. Error<%= DefinitionsLookup.createPopupLink("ArrayElement","std_error") %>)</TH>
    <td > <%= EmptyTextConverter.convert( object.get_avg_log_ratio() ) %>
         (<%= EmptyTextConverter.convert( object.get_std_error() ) %>)
    </td>	
  </tr>
  <% } %>

  <% if ( object.get_avg_intensity()!= null){ %> 
  <tr  <%= myBgColor.toggleBgColor() %> >
    <TH align=left width=30% colspan=2>Avg. Signal Intensity<%= DefinitionsLookup.createPopupLink("ArrayElement","avg_intensity") %>(Std. Error<%= DefinitionsLookup.createPopupLink("ArrayElement","avg_intensity_std_err") %>)</TH>
    <td > <%= EmptyTextConverter.convert( object.get_avg_intensity() ) %>
         (<%= EmptyTextConverter.convert( object.get_avg_intensity_std_err() ) %>)
    </td>	
  </tr>
  <% }  %>
  
  <!-- if AFGC element, use SU ID for linking to both expression viewer and SMD spot history -->
  <% if ( object.isAfgcElement() ) { %>
 

    <% if ( object.hasViewerData() ) {  %>
     <tr <%= myBgColor.toggleBgColor() %>>
      <TH  align=left  width=30% nonwrap>Expression Viewer<%= DefinitionsLookup.createPopupLink("Tools","expr_viewer") %> </TH>
      <td  width=5%>&nbsp;</td>
      <td><a href="/cgi-bin/afgc/atExpressioncgi.pl?su_id=<%= object.get_external_id() %>" target=_blank>Viewer</a></td>
     </tr>
    <% } %>

    <tr  <%= myBgColor.toggleBgColor() %>>
     <TH  align=left width=30%>SMD Spot History <%= DefinitionsLookup.createPopupLink("Tools","smd_spot") %></TH>
     <td  width=5%>&nbsp;</td>
     <td class="sm" ><a href="http://genome-www5.stanford.edu/cgi-bin/data/spotHistory.pl?state=parameters;login=no;suid=<%= object.get_external_id() %>" target=_blank><%= object.get_external_id() %></a></td>
  </tr>

  <% } %>

  <% if (  object.hasExpressionResult ( ) ){  %>
  
   <tr  <%= myBgColor.toggleBgColor() %>>
   <TH  align=left colspan=2>Expression Results using Default Search  
      <%= DefinitionsLookup.createPopupLink("Glossary","expression_default") %></TH>
   <td class="sm">
       <form  action="/servlets/MultiServlet" name="expressionSearch"
            enctype="multipart/form-data" method="post">
 
       <!-- default search to dual channel for now, should change when altering
            detail page code to handle both single and dual channel elements -->
       <% String  array_type_value = object.getArrayDesignPlatformType().equals( "dual") ? "dual_channel":"single_channel"; %>
       <input type="hidden" name="array_type" value="<%=  array_type_value %>">
       <input type="hidden" name="type" value="expression">
       <input type="hidden" name="search_action" value="search">
       <input type="hidden" name="input" value="wild">
       <input type="hidden" name="expression_name_type" value="name">
       <input type="hidden" name="expression_term" value="<%= object.get_name() %>">
       <input type="hidden" name="size" value="25">
       <input type="hidden" name="analysis_level" value="replicate">
       <input type="hidden" name="absolute" value="expressed">
       <input type="hidden" name="value"  value="2">  
       <input type="hidden" name="relative" value="any">
       <input type="hidden" name="error" value="any"> 
       <input type="button" name="values" value="get" onclick="form.submit()"> 
       </form> 
    </td>
  </tr>
  <% }  %>
