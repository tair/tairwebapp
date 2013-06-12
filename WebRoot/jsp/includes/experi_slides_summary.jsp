<%  // if the including page if expression set full
    // the slide and sample is internal page link , otherwise, link to other page

    boolean  is_all_page = false ;
    is_all_page = (detail.getClass().getName().equals("org.tair.querytools.ExpressionSetFullDetail")) ;

  //  String hyb_page = "/servlets/TairObject?type=hyb_descr_collection&sample=detail&id="+detail.get_tair_object_id();
    String sample_page = "/servlets/TairObject?type=bio_sample_collection&id="+detail.get_tair_object_id();

    String bgColor = myBgColor.toggleBgColor();

    if ( detail.hasHybDescriptions() ) {
%>

      <tr  BGCOLOR="#99CCCC">
	<td colspan="2"><b>Slide Details</b></td>
      </tr> 
   
     <form>
      <tr valign="top">
          <td class="sm" colspan=3 >
             <table cellpadding="1" cellspacing="0" border="1" width="100%">
	      <tr valign="bottom">
	      <th class="sm" align="center" valign=center>
	<%  if (detail.getManufacturer().equals("Affymetrix") ){  %>
		Slide Name<%=DefinitionsLookup.createPopupLink("Glossary","asterisk")%>	
	<% }else{ %>	
		Slide<BR>(name<%=DefinitionsLookup.createPopupLink("Glossary","asterisk")%> :<BR>description)
        <% } %>
	      </th>

		<th class="sm" align="center" valign=center>External<br>ID<%=DefinitionsLookup.createPopupLink("HybData","external_id")%></th>
	      <th class="sm" align="center" valign=center>Replicate<%=DefinitionsLookup.createPopupLink("HybDescription","class")%><br>(id<%=DefinitionsLookup.createPopupLink("HybDescription","replicate_id")%>:name)</th>
	      <th class="sm" align="center" valign=center>Replicate<br>type<%=DefinitionsLookup.createPopupLink("Glossary","replicate_type")%></th>
              <th class="sm" align="center" valign=center nonwrap>
		<%  if (detail.getManufacturer().equals("Affymetrix") ){  %>
		 Control<br>replicate<%=DefinitionsLookup.createPopupLink("HybDescription","controller_id")%>
		<% }else{  %>
		 Reverse<br>replicate<%=DefinitionsLookup.createPopupLink("HybDescription","reverse_id")%>
		<% }  %>
	      </th>
              <th class="sm" align="center" valign=center>Sample<%=DefinitionsLookup.createPopupLink("BioSample","class")%></th>
              <th class="sm" align="center" valign=center>Experimental<br>variables</th>
              <th class="sm" align="center" valign=center>Label<%=DefinitionsLookup.createPopupLink("LabeledSample","label")%></th>
              <th class="sm" align="center" valign=center>Get Data<%=DefinitionsLookup.createPopupLink("Glossary","get_data")%></th>
	   </tr>

      <% Iterator hybIter = detail.getHybDescriptions();
         HybDescriptionObject hybDescr = null;
         int counter = 1;
         while ( hybIter.hasNext() ) {
            hybDescr = (HybDescriptionObject) hybIter.next();
            String hybColor = myBgColor.toggleBgColor() ;		 
            if ( hybDescr.hasHybData() ) {
		Iterator dataIter = hybDescr.getHybData();
	        HybData data = null;
		 
                while ( dataIter.hasNext() ) {
	            data = (HybData) dataIter.next();
	            if ( hybDescr.hasLabeledSamples()){
		        int numberSamples =  hybDescr.getNumberLabeledSamples();
		        Iterator samplesIter = hybDescr.getLabeledSamples();
		        boolean firstSample = true;
		        while ( samplesIter.hasNext() ) {
                            LabeledSample sample = (LabeledSample) samplesIter.next();
      %>
    
     
     	       <tr  <%= hybColor %> >
		 <% if (firstSample){  %>
		    <!-- Slide<BR>(name:desc), only display name if is affymetrix-->
	            <td class="sm"   rowspan=<%= numberSamples %> > 
		      <A name='#<%= data.get_hyb_data_id()%>'>
		        <%= EmptyTextConverter.convert( data.get_name() ) %> </A>
                      <%  if (! detail.getManufacturer().equals("Affymetrix") ){   %>: <BR>
		        <%= EmptyTextConverter.convert( data.get_slide_description() ) %>
		      <%  } %>
		    </td>
		    <!--External ID-->
	            <td class="sm" align="center"  rowspan=<%= numberSamples %>>
		     <% if ( data.getExperimenterFormatAbbrevName() != null && data.get_experiment_id() != null ){ %> 
		       <%= EmptyTextConverter.convert( data.getExperimenterFormatAbbrevName() ) %>:<BR>
		       <%= data.get_experiment_id() %>
		     <% }else { %>
                        N/A
		     <% } %>  
                    </td>
		    
		    <!--Repl. Set<br>(#:name)-->
		    <td  rowspan=<%= numberSamples %> align=center>
		       <a name="#<%=  hybDescr.get_hyb_description_id() %>">
		       <%=  hybDescr.get_hyb_description_id() %>:</a><BR>
		       <%=  EmptyTextConverter.convert(hybDescr.get_name()) %>
		    </td>
		    <!--Replicate<br>type-->
		    <td class="sm" align="center" rowspan=<%= numberSamples %>>
		       <%= EmptyTextConverter.convert( data.getReplicateType() ) %>&nbsp;
		    </td>
		    <!--Reverse of<br>Repl. Set , display control_id if if affymetrix #-->
		    <td  rowspan=<%= numberSamples %> align=center>
                     <%  if (detail.getManufacturer().equals("Affymetrix") ){   %>
                        <% if( hybDescr.get_controller_id()!= null){  %>
		        <a href= "#<%=  hybDescr.get_controller_id() %>">
		        <%= EmptyTextConverter.convert(hybDescr.get_controller_id()) %></A>
		        <% } else { out.print( "N/A"); }
                     }else {  %>  
		     <% if( hybDescr.get_reverse_id()!= null){  %>
		        <a href= "#<%=  hybDescr.get_reverse_id() %>">
		        <%= EmptyTextConverter.convert(hybDescr.get_reverse_id()) %></A>
		     <% } } %>&nbsp;</td>
		     
		   <% }// end   if (firstSample){  %>    
		    
		   <td class="sm" align="center">
		       <A HREF='<%=  is_all_page? "":sample_page %>#<%= sample.get_bio_sample_id()%>' <%=  is_all_page? "":"targate=_blank" %> > 
		         <%= EmptyTextConverter.convert( sample.getBioSampleName() ) %>
		       </A>
		    </td>
		    <!-- experiment variables-->
	            <td class="sm" align="left" valign="center">
                 <% if ( sample.hasExperimentalEnvConds()  ){ 
                       Iterator envIter = sample.getExperimentalEnvConds();
		       boolean first = true ;
		       while ( envIter.hasNext() ) {
                          BioSamEnvConObject  envCon = (BioSamEnvConObject) envIter.next();
		          if (!first){ out.write("<BR>"); }
		 %>
		      
		   <%= EmptyTextConverter.convert( envCon.get_condition_name() ) %>
		   <% if( envCon.hasConditionValue() || envCon.hasConditionDuration() ) { out.write ("("); %><%--
		      --%><%= EmptyTextConverter.convert( envCon.get_condition_value() ) %><%--
		 --%><% if( envCon.hasConditionValue() && envCon.hasConditionDuration() ) { out.write (", "); } %><%--
                    --%><%= EmptyTextConverter.convert( envCon.get_condition_duration() ) %>
		     <%= EmptyTextConverter.convert( envCon.get_duration_units() ) %><%--
		 --%><%  out.write (")"); } %>
		  <%  first =  false;
		      } }  out.write("&nbsp;");    %>
		    </td>
	            <td class="sm" align="center">
		       <%= EmptyTextConverter.convert( sample.get_label() ) %>
		    </td>
		   <% if (firstSample){  %>
                     <td class="sm" align="center" valign="center" rowspan=<%= numberSamples %>>
		      <% if ( data.getNormFtpURL()!= null ) { %>
		         <input type="button" value="Download"
		          onClick="window.open( '<%= data.getNormFtpURL() %>')">
		      <% } else { %> &nbsp; <% } %>
		    </td>
		   <% }  %>  
	     </TR> 
         <%  firstSample = false;
	    } }} }}
	 %>
            </table></td></tr>
	   <tr ><td colspan="2">&nbsp;</td></tr> 

<% } %>
   
	    
      
