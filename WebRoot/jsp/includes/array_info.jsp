 <%  // if the including page if expression set full
     // the link in "sapmle employed" is internal page link , otherwise, link to other page

      boolean  from_all_page = false ;
      from_all_page = (detail.getClass().getName().equals("org.tair.querytools.ExpressionSetFullDetail")) ;

      String slide_sum_page ="/servlets/TairObject?type=hyb_descr_collection&id="+detail.get_tair_object_id();
    
      HybDescriptionObject hybDescr = null ;

      if ( detail.getUniqArrayDesignIds() != null ){
         Iterator array_design_ids = detail.getUniqArrayDesignIds();
         boolean firstArray = true;
         while (array_design_ids.hasNext() ) {
             Long array_design_id = (Long) array_design_ids.next();
             hybDescr = detail.getFirstHybDescriptionForArrayDesign( array_design_id );
      
 %>
    
  <%  if (! firstArray ){ %>  <tr> <td colspan="2"> <hr size=1 width="100%"></td></tr>  <% }  %>
  
        <TR>
	    <TH colspan=2 align=left> Array Info<%=DefinitionsLookup.createPopupLink("ArrayDesign","class")%>:</TH>
        </TR>

	<% if ( hybDescr.get_array_design_name() != null ) { %>
           <TR> <TD class="sm" align="left"  width=30% > Name:</td>
                <td  nowrap align="left" ><%= hybDescr.get_array_design_name() %></td>
	   </TR>
         <% } %>

         <% if ( hybDescr.get_array_manufacturer() != null ) { %>
	    <TR> <TD class="sm" align="left">Manufacturer:</tD>
	         <td  align="left"><%= hybDescr.get_array_manufacturer() %></td>
             </TR>
	  <% } %>

         <% if ( hybDescr.get_platform_type() != null ) { %>
	      <TR> <TD class="sm" align="left">Platform type<%=DefinitionsLookup.createPopupLink("ArrayDesign","platform_type")%>:</TD>
		   <td  align="left"><%= hybDescr.get_platform_type() %></td>
	      </TR>	   
         <% } %>

         <% if ( hybDescr.get_surface_type() != null ) { %>
	      <TR>  <TD  align="left">Surface type<%=DefinitionsLookup.createPopupLink("ArrayDesign","surface_type")%>:</TD>
		    <td  align="left"><%= hybDescr.get_surface_type() %></td>
                  </TR>		    
         <% } %>

         <% if ( hybDescr.get_num_spots() != null ) { %>
	      <TR>  <TD  align="left">Number of elements<%=DefinitionsLookup.createPopupLink("ArrayDesign","num_spots")%>:</TD>
		    <td   align="left"><%= hybDescr.get_num_spots() %></td>
                 </TR>
        <% } %>

        <% if ( hybDescr.get_number_of_slides() != null ) { %>
              <TR><TD  align="left">Number of slides:</TD>
		  <td  align="left"><%= hybDescr.get_number_of_slides() %></td>
              </TR>
        <% } %>

         <% if ( hybDescr.get_array_description() != null ) { %>
	      <TR> <TD  align="left">Description:</TD>
		 <td  align="left"><%= hybDescr.get_array_description() %></td>
                    </TR>
         <% } %>
		    
         <TR> <TD  align="left" valign=top> Slides:</TD>
	      <TD  align="left">
         <%  if (detail.getNumberUniqArrayDesignIds() == 1 ){    %>
             all slides had this array design
         <% } else {		 
              Iterator hybIter = detail.getHybDescriptionsForArrayDesign( array_design_id );
	      while ( hybIter.hasNext() ) {
		 HybDescriptionObject hyb_descr = (HybDescriptionObject) hybIter.next();
                 if ( hyb_descr.hasHybData() ) {
                     Iterator dataIter = hyb_descr.getHybData();
	             while ( dataIter.hasNext() ) {
                        HybData data = (HybData) dataIter.next();
         %>
    
          <A HREF='<%=  from_all_page? "":slide_sum_page %>#<%= data.get_hyb_data_id() %>' <%=  from_all_page? "":"target=_blank" %> >
		<%= EmptyTextConverter.convert( data.get_name() ) %></A> &nbsp;
         <% } }}}  %>
	    </TD>	
      <%        firstArray = false ;
	    }// end while arraydesign.ids
      %>
   	    
    <tr> <td colspan="2"> <hr size=1 width="100%"></td></tr> 		    
    <TR> <th class="sm" align="left" colspan=2>Hybridization Info:</th>
           </TR>

     <% if (  hybDescr.get_protocol_title() != null ) { %>
          <TR  >
              <TD  align="left" nowrap>Hybridization protocol<%=DefinitionsLookup.createPopupLink("HybDescription","hyb_protocol_ref_id")%>:</TD>
              <td class="sm"><a href="/servlets/TairObject?type=protocol&id=<%= hybDescr.get_hyb_protocol_ref_id() %>" target=_blank><%= hybDescr.get_protocol_title() %></a></td>
           </TR>
     <% } %>
    
  <% } // end if   %>

      
