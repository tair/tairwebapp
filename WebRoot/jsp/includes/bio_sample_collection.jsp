 <% if ( detail.hasBioSamples() ) { 

         Iterator sampleIter = detail.getBioSamples();
         BioSampleObject sample = null;
         boolean firstSample = true;
         while ( sampleIter.hasNext() ) { 
            sample = (BioSampleObject) sampleIter.next();
      %>
      
    <%  if (! firstSample ){ %>  <tr> <td colspan="2"><hr size=1 width="100%"></td></tr>  <% }  %> 

     <TR>	 
	<TD colspan=2>
	 <table cellpadding="1" cellspacing="0" border="0" width=100%>
	   <TR bgcolor="<%= DataConstants.BGCOLOR %>">  
           <th  nowrap align=left colspan=3>Sample:
           <!-- set anchor for linking to from hybridization section (may be on another page) -->
             <a name="<%= sample.get_bio_sample_id() %>"><B><%= sample.get_name() %></B></a>         
           </td>
	 </TR>
      
	 <% if ( sample.get_treatment_description() != null ) {    %>
           <TR valign="top"  >
	    <TD nowrap width="30%">Treatment Description:</TD>
	    <TD width="5%">&nbsp;</TD>    
	    <TD align=left ><%= sample.get_treatment_description() %> </TD>
	   
           </TR>    
         <% } %>
	 
	 <% if (sample.get_biomaterial_description() != null){ %>  
	   <TR >
	       <TD nowrap width="30%"> Sample Description: </TD>
	       <TD width="5%">&nbsp;</TD>
	       <TD align=left ><%= sample.get_biomaterial_description() %></TD>
	      
	   </TR>
	   <% } %>
	   
	   <% if (sample.get_scientific_name()!=null){ %>  
	   <TR ><TD width="30%">Organism:</TD>
	       <TD  width="5%">&nbsp;</TD>
	       <TD align=left ><%= EmptyTextConverter.convert(sample.get_scientific_name()) %></TD>
	      
           </TR>
	   <% } %>

	  <% if ( sample.get_biomaterial_type() != null ) { %>
	   <TR ><TD nowrap width="30%">Tissue Origin<%=DefinitionsLookup.createPopupLink("BioSample","biomaterial_type")%>:</TD>
	       <TD  width="5%">&nbsp;</TD>
	       <TD align=left> <%= sample.get_biomaterial_type() %></TD>
	      
           </TR>
	  <% } %> 

	  <% if ( sample.get_germplasm_id() != null ) { %>
	  <TR ><TD width="30%">Germplasm:<%=DefinitionsLookup.createPopupLink("Germplasm","class")%></TD>
	       <TD width="5%">&nbsp;</TD>
	       <TD align=left >
		 <a href="/servlets/TairObject?type=germplasm&id=<%= sample.get_germplasm_tair_object_id() %>" target=_blank>
		 <%= sample.get_germplasm_name() %></a>
	       </TD>
	   </TR>
           <% } %>

       <% if ( sample.getPlantStructureKeywords() != null ){ %>
   	   <TR ><TD width="30%">Plant Structure Keywords:</TD>
	        <TD width="5%">&nbsp;</TD>
		<TD align=left>
	     <% Iterator samKIter =  sample.getPlantStructureKeywords();
             boolean firstFactor = true;
		while( samKIter.hasNext()){
                     BioSampleKeyword keyword =  (BioSampleKeyword)samKIter.next();
                 if ( !firstFactor ) {
                    out.write( "; " );
	         }
	     %>
		 <A href="/servlets/TairObject?type=keyword&id=<%= keyword.getKeywordID() %>" target=_blank>
		  <%= keyword.getKeywordName()%></A>
	     <% firstFactor = false; %>
	     <% }  %>  
		</TD>
	   </TR>	  
       <% } %>
        <% if ( sample.get_anatomy_description() != null ){ %> 
	   <TR ><TD width="30%">Plant Structure Description:</TD>
	       <TD width="5%">&nbsp;</TD>
	       <TD align=left><%= sample.get_anatomy_description() %></TD>
	    </TR>
	 <% } %>
	    
       <% if ( sample.getDevelopmentalStageKeywords() != null ){ %>
   	   <TR ><TD width="30%">Development Keywords :</TD>
	        <TD width="5%">&nbsp;</TD>
		<TD align=left>
	     <% Iterator devKIter =  sample.getDevelopmentalStageKeywords();
		while( devKIter.hasNext()){
                     BioSampleKeyword keyword =  (BioSampleKeyword)devKIter.next();
	     %>
		 <A href="/servlets/TairObject?type=keyword&id=<%= keyword.getKeywordID() %>" target=_blank>
		  <%= keyword.getKeywordName()%> </A>&nbsp;
	     <% }  %>  
		</TD>
	   </TR>	  
       <% } %>
	   
	    
	  <% if ( sample.get_development_description() != null ) { %>
           <TR><TD nowrap width="30%">Developmental Stage Description:</TD>
	       <TD width="5%">&nbsp;</TD>
	       <TD align=left><%= sample.get_development_description() %></TD>
	   </TR>
	 <% } %>
          
	  <TR>
	      <TD nowrap width="30%">Sample Type<%=DefinitionsLookup.createPopupLink("Glossary","sample_type")%>:</TD>
	      <TD width="5%">&nbsp;</TD>
	      <td align=left><%= sample.getIsReferenceText() %></td>
         </tr>

	    <% if ( sample.get_probe_type() != null ) { %>
	      <TR><td width="30%">Probe Type (concentration)<%=DefinitionsLookup.createPopupLink("BioSample","probe_type")%>:</td>
                  <TD width="5%"> &nbsp; </TD>
		  <td align=left><%= sample.get_probe_type() %>( <%= sample.get_measurement () %>)</td>
	      </TR>
	     <% } %>

	     <% if ( sample.get_extraction_protocol_ref_id() != null ) { %>   
	      <TR><td width="30%">Extraction Protocol:</TD>
	          <TD width="5%"> &nbsp; </TD>
	          <td class="sm" align=left>
		     <a href="/servlets/TairObject?type=protocol&id=<%= sample.get_extraction_protocol_ref_id() %>" target=_blank><%= sample.get_protocol_title() %></a></td>
              </TR>
	     <% } %>
	      
	     <% if ( sample.hasLabelingProtocol() ) { %>
	      <TR><td nowrap width="30%">Labeling Protocol:</td>
                  <TD width="5%"> &nbsp; </TD>
		  <td class="sm" align=left>
            <%
                  Iterator lprotocolIter = sample.getLabelingProtocols() ;
                  while ( lprotocolIter.hasNext() ) {
		     TfcProtocol protocol = (TfcProtocol)lprotocolIter.next();
	                   
	    %>
                    <a href="/servlets/TairObject?type=protocol&id=<%= protocol.get_reference_id() %>" target=_blank>
		          <%= protocol.get_title() %> 
           <% } // end while  %>		    
		      </a>
		     </td>
                   <% } %>
              </tr>
             
	      
	 </table>
	</TD>
      </TR>
      
      <TR ><td colspan=2> &nbsp;</td></TR>
     <!-- conditions-->
      <% if ( sample.hasEnvConds()  ){  %>
        <tr valign="top">
	 <th colspan=2 class="sm" align="left" nowrap>Environmental Conditions & Treatments<%=DefinitionsLookup.createPopupLink("EnvironmentalCondition","class")%></th>
      </TR>	 
	 
      <tr valign="top">	 
         <td class="sm" colspan=2>
              <table cellpadding="1" cellspacing="0" border="1" width="100%">
                 <tr valign="bottom">
                    <th class="sm" align="left">condition type<%=DefinitionsLookup.createPopupLink("EnvironmentalCondition","condition_type")%></th>
                    <th class="sm" align="left">name<%=DefinitionsLookup.createPopupLink("EnvironmentalCondition","name")%></th>

	            <% if ( sample.hasConditionValue() ) { %>
                    <th class="sm" align="left">value<%=DefinitionsLookup.createPopupLink("EnvironmentalCondition","condition_value")%></th>
	            <% } %>

                    <% if ( sample.hasConditionDuration() ) { %>
                    <th class="sm" align="left">duration<%=DefinitionsLookup.createPopupLink("EnvironmentalCondition","duration")%></th>
	            <% } %>

	            <% if ( sample.hasApplicationFrequency() ) { %>
	            <th class="sm" align="left">frequency</th>
	            <% } %>

                    <th class="sm" align="left">variable<%=DefinitionsLookup.createPopupLink("BioSample_EnvCondition","is_variable")%></th>

                    <% if ( sample.hasOrderNumber() ) { %>
                    <th class="sm" align="left">order<%=DefinitionsLookup.createPopupLink("BioSample_EnvCondition","order_number")%></th>
	            <% } %>
		 </tr>

                <% Iterator envIter = sample.getEnvConds();
                   BioSamEnvConObject envCon = null;
                   while ( envIter.hasNext() ) {
                      envCon = (BioSamEnvConObject) envIter.next();
                 %>     

                 <tr valign="top">
                    <td class="sm"><%= EmptyTextConverter.convert( envCon.get_condition_type() ) %>&nbsp;</td>
                    <td class="sm"><%= EmptyTextConverter.convert( envCon.get_condition_name() ) %>&nbsp;</td>

                    <% if ( sample.hasConditionValue() ) { %>
                    <td class="sm"><%= EmptyTextConverter.convert( envCon.get_condition_value() ) %>&nbsp;</td>
                    <% } %>

                    <% if ( sample.hasConditionDuration() ) { %>
                    <td class="sm"><%= EmptyTextConverter.convert( envCon.get_condition_duration() ) %> <%= EmptyTextConverter.convert( envCon.get_duration_units() ) %>&nbsp;</td>
                    <% } %>

                    <% if ( sample.hasApplicationFrequency() ) { %>
                    <td class="sm"><%= EmptyTextConverter.convert( envCon.get_application_frequency() ) %>&nbsp;</td>
                    <% } %>

                    <td class="sm"><%= TextConverter.booleanToWord( envCon.get_is_experimental_variable() ) %>&nbsp;</td>

                    <% if ( sample.hasOrderNumber() ) { %>
                    <td class="sm"><%= EmptyTextConverter.convert( envCon.get_order_number() ) %>&nbsp;</td>
                    <% } %>
                 </tr>
                <% } %>
            </table>
	  </TD>
	  </TR>
	  <tr>
          <td class="sm" colspan="2">&nbsp;</td>
          </tr>
       <% } %>
      
   <%   firstSample = false ;

      } // end biosample while %>

  
  <% } // end biosample if %>
 
