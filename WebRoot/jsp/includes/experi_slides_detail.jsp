 <% if ( detail.hasHybDescriptions() ) { %>
    <tr BGCOLOR="#99CCCC">
	<td colspan="2"><b>Analysis Info</b></td>
    </tr>
   
   <%
      Iterator hybIter = detail.getHybDescriptions();
      boolean first = true;
     // bgColor = myBgColor.toggleBgColor();
      while ( hybIter.hasNext() ) {
            HybDescriptionObject hybDescr = (HybDescriptionObject) hybIter.next();
            if ( hybDescr.hasHybData() ) {
               Iterator dataIter = hybDescr.getHybData();
	        while ( dataIter.hasNext() ) {
                   HybData data = (HybData) dataIter.next();
      
  %>
   
   <%  if (! first ){ %>  <tr> <td colspan="2"> <hr size=1 width="100%"></td></tr>  <% }  %> 
    
    <tr bgcolor="<%= DataConstants.BGCOLOR %>">
         <td colspan="2"><font class="formheader"> Slide
<%=DefinitionsLookup.createPopupLink("Glossary","asterisk")%>: <a name="#<%= data.get_hyb_data_id() %>"><%= EmptyTextConverter.convert( data.get_name() ) %></A></font>
	 </td>
    </tr>
    
    <TR valign="top" >
          <th  align="left" nowrap colspan=2>Normalization Info<%=DefinitionsLookup.createPopupLink("HybDescription","normalization_desc") %>:</th>
    </TR>
    
  
    <% if ( hybDescr.get_normalization_desc() != null ) { %>
      <tr valign="top">
          <td  align="left" nowrap width=30%>User Normalization Description:</td>
          <td  align="left"><%= hybDescr.get_normalization_desc() %></td>
      </tr>
     <% } %>
       
     <% if ( data.get_normalization_factor() != null ) { %>
      <tr valign="top">
           <td  align="left" nowrap width=30%>Normalization Factor:</td>
           <td  align="left"><%= data.get_normalization_factor() %></td>
       </tr>
     <% } %>
     
     <% if ( data.get_scaling_factor() != null ) { %>
      <tr valign="top">
           <td  align="left" nowrap width=30%>Scaling Factor:</td>
           <td  align="left"><%= data.get_scaling_factor() %></td>
       </tr>
     <% } %> 

     <% if ( data.get_anova_sector_user() != null ){ %>
       <tr valign="top">
	  <td  align="left" nowrap width=30%>Submitted ANOVA sector:</td>
          <td  align="left"><%= data.get_anova_sector_user() %> </TD>
         </tr>
     <% } %>
	 
      <% if ( data.get_anova_plate_user() != null ){ %>
      <tr valign="top">
	  <td  align="left" nowrap width=30%>Submitted ANOVA plate: </TD>
          <td  align="left"><%= data.get_anova_plate_user() %></TD>
      </tr>
     <% } %>
      
      <% if ( data.get_anova_sector_tair() != null){ %>
      <tr valign="top">
	 <td  align="left" nowrap width=30%>TAIR ANOVA sector: </TD>
         <td  align="left"><%= data.get_anova_sector_tair()%></TD>
      </tr>
     <% } %>

     <% if ( data.get_anova_plate_tair() != null){ %>
       <tr valign="top">
	   <td  align="left" nowrap width=30%>TAIR ANOVA plate:</TD>
           <td  align="left"><%= data.get_anova_plate_tair() %> </TD>
      </tr>
     <% } %>

    <TR> <th  align="left" colspan=2>Analysis Info:</th>
    </TR>

    <% if ( hybDescr.get_program_name() != null ) { %>
     <tr  >
          <TD  align="left" nowrap width=30%>Scanning software<%=DefinitionsLookup.createPopupLink("HybDescription","scanning_software_id")%></TD>
           <td  align="left"><%= hybDescr.get_program_name() %></td>
     </tr>
    <% } %>
	   
     <% if ( hybDescr.get_scanner() != null ) { %>
      <tr  >
          <TD  align="left" nowrap width=30%>Scanning hardware<%=DefinitionsLookup.createPopupLink("HybDescription","scanner")%></TD>
          <td  align="left"><%= hybDescr.get_scanner() %></td>
      </tr>
    <% } %>

    <!--  Scanning parameters:(HybData.scan_parameters)-->
     <% if ( data.get_scan_parameters() != null ) { %>
     <tr  >
          <TD  align="left" nowrap width=30%>Scanning parameters  </TD>
          <td  align="left"><%= data.get_scan_parameters() %></td>
      </tr>
    <% } %>
      

  <% if (data.hasAffyMetrics() ) {  %>     
      
    <TR> <th  align="left" colspan=2>Analysis Parameters:</th></TR>

    <% if ( data.get_TGT_value() != null ) { %>
	<tr valign="top">
	  <td class="sm" align="left"  nowrap width="30%"> TGT value</td>
	  <td class="sm" align="left"><%= data.get_TGT_value() %> </td>
        </tr>
   <% } %>
    
    <% if ( data.get_SDTm() != null ) { %>
       <tr>
	 <td class="sm" align="left"  nowrap width="30%">SDTm</td>
	 <td class="sm"><%= data.get_SDTm() %></td>
       </tr>
    <% } %>

    <% if ( data.get_SRT() != null ) { %>
        <tr>
	 <td class="sm" align="left"  nowrap width="30%">SRT</td>
	 <td class="sm"><%= data.get_SRT() %></td>
       </tr>
    <% } %>
       
    <% if ( data.get_noise() != null ) { %>
    <tr>
	 <td class="sm" align="left"  nowrap width="30%">Noise</td>
	 <td class="sm"><%= data.get_noise() %></td>
     </tr>
   <% } %>

   <% if ( data.get_FC_intensity_threshold() != null ) { %>
      <tr>
	 <td class="sm" align="left"  nowrap width="30%">Fold Change Intensity Threshold</td>
         <td class="sm"><%= data.get_FC_intensity_threshold() %></td>
      </tr>
    <% } %>

    <% if ( data.get_abs_dec_matrix() != null ) { %>
        <tr>
	  <td class="sm" align="left"  nowrap width="30%">Absolute Decision Matrix</td>
	  <td class="sm"><%= data.get_abs_dec_matrix() %></td>
	</tr>
   <% } %>

  <% if ( data.get_background_avg() != null ) { %>
	<tr>
	  <td class="sm" align="left"  nowrap width="30%">Background average (standard deviation)</td>
          <td class="sm"><%= data.get_background_avg() %> (<%= data.get_background_stdev() %>)</td>
        </tr>
  <% } %>

  <% if ( data.get_central_minus_count() != null ) { %>
     	<tr>
	  <td class="sm" align="left"  nowrap width="30%">Central minus: Count (Average)</td>
	  <td class="sm"><%= data.get_central_minus_count() %> (<%= data.get_central_minus_avg() %>)</td>
	</tr>
  <% } %>

  <% if ( data.get_corner_minus_count() != null ) { %>
	<tr valign="top">
	  <td class="sm" align="left"  nowrap width="30%"> Corner minus: Count (Average)</td>
	  <td class="sm" align="left"><%= data.get_corner_minus_count() %> (<%= data.get_corner_minus_avg() %>)</td>
        </tr>
 <% } %>

 <% if ( data.get_corner_plus_count() != null ) { %>
	<tr valign="top">
	  <td class="sm" align="left"  nowrap width="30%"> Corner plus: Count (Average)</td>
	  <td class="sm" align="left"><%= data.get_corner_plus_count() %> (<%= data.get_corner_plus_avr() %>)</td>
        </tr>
 <% } %>

 <% if ( data.get_alpha1() != null ) { %>
	<tr valign="top">
	  <td class="sm" align="left"  nowrap width="30%"> Alpha1</td>
	  <td class="sm" align="left"><%= data.get_alpha1() %> </td>
        </tr>
 <% } %>

 <% if ( data.get_alpha2() != null ) { %>
	<tr valign="top">
	  <td class="sm" align="left"  nowrap width="30%"> Alpha2</td>
	  <td class="sm" align="left"><%= data.get_alpha2() %> </td>
        </tr>
 <% } %>

 <% if ( data.get_tau()  != null ) { %>
	<tr valign="top">
	  <td class="sm" align="left"  nowrap width="30%"> TAU</td>
	  <td class="sm" align="left"><%= data.get_tau() %> </td>
        </tr>
 <% } %>


<%--
<% if ( data.get_gamma1h() != null  ||data.get_gamma1l() != null ||
        data.get_gamma2h() != null  ||data.get_gamma2l() != null ) { %>

	<tr valign="top">
	  <td class="sm" align="left"  colspan=2>
            <table width="100%" border="1"  cellspacing="0" >
	     <TR><TH Align=left> Gamma1h</TH> <TH> Gamma1l</TH><TH> Gamma2h</TH><TH> Gamma2l</TH></TR>
	     <TR><TD><%= EmptyTextConverter.convert( data.get_gamma1h()) %></TD>
                 <TD  Align=center><%= EmptyTextConverter.convert( data.get_gamma1l()) %></TD>
                 <TD  Align=center><%= EmptyTextConverter.convert( data.get_gamma2h()) %></TD>
		 <TD  Align=center><%= EmptyTextConverter.convert( data.get_gamma2l()) %></TD>
              </TR>
	     </table> 
	  </td>
        </tr>
<%  } %>
	--%>
	
<% if ( data.get_gamma1h() != null ) { %>
	<tr valign="top">
	  <td class="sm" align="left"  nowrap width="30%"> Gamma1h</td>
	  <td class="sm" align="left"><%= data.get_gamma1h() %> </td>
        </tr>
 <% } %>
	
<% if ( data.get_gamma1l() != null ) { %>
	<tr valign="top">
	  <td class="sm" align="left"  nowrap width="30%"> Gamma1l</td>
	  <td class="sm" align="left"><%= data.get_gamma1l() %> </td>
        </tr>
 <% } %>
	
<% if ( data.get_gamma2h() != null ) { %>
	<tr valign="top">
	  <td class="sm" align="left"  nowrap width="30%"> Gamma2h</td>
	  <td class="sm" align="left"><%= data.get_gamma2h() %> </td>
        </tr>
 <% } %>
	
<% if ( data.get_gamma2l() != null ) { %>
	<tr valign="top">
	  <td class="sm" align="left"  nowrap width="30%"> Gamma2l</td>
	  <td class="sm" align="left"><%= data.get_gamma2l() %> </td>
        </tr>
 <% } %>
	
<% if ( data.get_perturbation() != null ) { %>
	<tr valign="top">
	  <td class="sm" align="left"  nowrap width="30%"> Perturbation</td>
	  <td class="sm" align="left"><%= data.get_perturbation() %> </td>
        </tr>
 <% } %>
	
<% if ( data.get_baseline_noise() != null ) { %>
	<tr valign="top">
	  <td class="sm" align="left"  nowrap width="30%"> Baseline Noise</td>
	  <td class="sm" align="left"><%= data.get_baseline_noise() %> </td>
        </tr>
 <% } %>
	
<% if ( data.get_baseline_sf() != null ) { %>
	<tr valign="top">
	  <td class="sm" align="left"  nowrap width="30%"> Baseline SF</td>
	  <td class="sm" align="left"><%= data.get_baseline_sf() %> </td>
        </tr>
 <% } %>
	
<% }  %> <!-- end affymetrics data -->

		 
  <%  first = false;
       } // end while ( dataIter.hasNext() ) {
       }}// end while ( hybIter.hasNext() )
      
  }  %>

      
