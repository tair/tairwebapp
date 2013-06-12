   <tr valign="top">
	<th class="sm" align="left" nowrap>Submission Number<%=DefinitionsLookup.createPopupLink("ExpressionSet","submission_number")%></th>
	<td class="sm"><%= detail.get_submission_number() %></td>
   </tr>
     
   <tr>
	<th class="sm" align="left" nowrap>TAIR Accession<%= DefinitionsLookup.createPopupLink("Glossary","TAIR Accession") %>
	 </th>
	<td class="sm"><%= detail.getAccession() %></td>
   </tr>

  
   <%  if (detail.hasPersonAttributions() ){    %>
    <tr>
	<th class="sm" align="left" nowrap>Author(s)</th>
	<td class="sm">
       <%  boolean firstPerson = true;
           for (org.tair.bs.community.BsAttribution attrib : detail.getPersonAttributions()) {
              if ( !firstPerson ) {
                 out.write( ", " );
	      }
       %>
          <a href="/servlets/TairObject?type=<%= attrib.getCommunity().getCommunityType() %>&id=<%= attrib.getCommunityId().toString() %>" target=_blank><%= attrib.getCommunity().getName() %></a>
	     <% firstPerson = false; %>
	  <% } %>
	</td>
      </tr>
   <% } %>
       
   <%  if (detail.hasOrganizationAttributions() ) {   %>
    <tr>
	<th class="sm" align="left" nowrap>Organization(s)</th>
	<td class="sm">
       <%   boolean firstOrg = true;
            for (org.tair.bs.community.BsAttribution attrib : detail.getOrganizationAttributions()) {
                 if ( !firstOrg ) {
                    out.write( ", " );
	             }
          %>
             <a href="/servlets/TairObject?type=<%= attrib.getCommunity().getCommunityType() %>&id=<%= attrib.getCommunityId().toString() %>" target=_blank><%= attrib.getCommunity().getName() %></a>
	     <% firstOrg = false; %>
	     <% } %>
	</td>
      </tr>
      <% } %>
       
      <!-- variables-->
      
     <% Iterator factorIter = detail.getExperimentFactors();
        if ( factorIter != null ) {
     %>
      <tr>
	<th class="sm" align="left" nowrap>Experimental Variables<%=DefinitionsLookup.createPopupLink("RelationshipType","experimental_factor")%>
	 </th>
	<td class="sm">
	  <% 
	     TairObjectKeyword factorKeyword = null;
             boolean firstFactor = true;
             while ( factorIter.hasNext() ) {
	         factorKeyword = (TairObjectKeyword) factorIter.next();
                 if ( !firstFactor ) {
                    out.write( ", " );
	         }
          %>
	     <a href="/servlets/TairObject?type=keyword&id=<%= factorKeyword.getKeywordID() %>" target=_blank><%= factorKeyword.getKeywordName() %></a>
	     <% firstFactor = false; %>
	  <% } %>
	</td>
      </tr>
      <% } %>

     <!-- variable type--> 

       <tr valign="top">
	<th class="sm" align="left" nowrap>Variable Type</th>
	<td class="sm">
            <table width="100%" cellpadding="1" cellspacing="0" border="0">
	        
               <tr>
		 <%  if ( detail.get_plant_material_is_variable() != null
		    && detail.get_plant_material_is_variable().booleanValue() ){ %> 
                    <TD class="sm" align="left">Plant Material
	           </tD>
		 <%  } %>
		  
		 <% if ( detail.get_probe_type_is_variable() != null &&
		    detail.get_probe_type_is_variable().booleanValue() ){ %>
                  <td class="sm" align="left">Probe Type
		   </td>
		 <%  }  %>
		 <% if (detail.get_harvesting_is_variable()!= null &&
		    detail.get_harvesting_is_variable().booleanValue() ){ %> 
                  <td class="sm" align="left">Harvesting
		  </td>
		 <% } %>

		 <% if (detail.get_environment_is_variable()!= null &&
		    detail.get_environment_is_variable().booleanValue() ){ %>
		   <td class="sm" align="left">Environment
		   </td>
		 <% } %>  
               </tr>
	     </table>
        </td>
      </tr>
      
    <!--catogory-->
     <% Iterator categoryIter = detail.getExperimentCategories();
       if ( categoryIter != null ) { 
     %>
      <tr>
	<th class="sm" align="left" nowrap>Experiment Category<%=DefinitionsLookup.createPopupLink("RelationshipType","experiment_category")%></th>
	<td class="sm">

       	  <% TairObjectKeyword catKeyword = null;
             boolean firstCategory = true;
             while ( categoryIter.hasNext() ) {
                 catKeyword = (TairObjectKeyword) categoryIter.next();
                 if ( !firstCategory ) {
                    out.write( ", " );
	         }
          %>
                 <a href="/servlets/TairObject?type=keyword&id=<%= catKeyword.getKeywordID() %>" target=_blank>
	         <%= catKeyword.getKeywordName() %></a>
	     <% firstCategory = false; %>
	  <% } %>
	</td>
      </tr>
   <% } %>

  <!--goal-->
   <% Iterator goalIter = detail.getExperimentGoals();
       if ( goalIter != null ) { 
     %>
      <tr>
	<th class="sm" align="left" nowrap>Experiment Goals<%=DefinitionsLookup.createPopupLink("RelationshipType","experimental_goal")%></th>
	<td class="sm">
	  <% 
	     TairObjectKeyword goalKeyword = null;
             boolean firstGoal = true;
             while ( goalIter.hasNext() ) {
	         goalKeyword = (TairObjectKeyword) goalIter.next();
                 if ( !firstGoal ) {
                    out.write( ", " );
	         }
          %>
	     <a href="/servlets/TairObject?type=keyword&id=<%= goalKeyword.getKeywordID() %>" target=_blank><%= goalKeyword.getKeywordName() %></a>
	     <% firstGoal = false; %>
	  <% } %>
	</td>
      </tr>
      <% } %>

     

      <% if ( detail.get_exp_date() != null ) { %>
      <tr>
	<th class="sm" align="left" nowrap>Date of Completion</th>
	<td class="sm"><%= detail.get_exp_date() %></td>
      </tr>
      <% } %>

   
      <!-- summary-->
      <% if ( detail.get_description() != null ) { %>
      <tr valign="top">
	<th class="sm" align="left" nowrap>Description</th>
	<td class="sm"><%= detail.get_description() %></td>
      </tr>
      <% } %>
      
        <tr valign="top">
	<th class="sm" align="left" nowrap>Data Counts</th>
	<td class="sm">
           <table cellpadding="1" cellspacing="0" border="0">
              <tr>
	        <th class="sm" align="center" nowrap>Number of Slides</th>
                <th class="sm">&nbsp;&nbsp;&nbsp;</th>
	        <th class="sm" align="center" nowrap>Number of Replicate Sets</th>
                <th class="sm">&nbsp;&nbsp;&nbsp;</th>
	        <th class="sm" align="center" nowrap>Number of BioSamples</th>
              </tr>

              <tr>     
                <td class="sm" align="center"><%= detail.getNumberHybData() %></td>
                <td class="sm">&nbsp;</td>
	        <td class="sm" align="center"><%= detail.getNumberHybDescriptions() %></td>
                <td class="sm">&nbsp;</td>
	        <td class="sm" align="center"><%= detail.getNumberBioSamples() %></td>
              </tr>
            </table>
        </td>

      </tr>
 
      <% if ( detail.hasPublications() ) { %>
      <tr>
	<th class="sm" align="left" nowrap>Publication(s)</th>
	<td class="sm">
	  <% Iterator pubIter = detail.get_publications();
             PublicationObject pub = null;
             boolean firstPub = true;
             while ( pubIter.hasNext() ) {
	         pub = (PublicationObject) pubIter.next();
                 if ( !firstPub ) {
                    out.write( ", " );
	         }
          %>
             <a href="/servlets/TairObject?type=publication&id=<%= pub.get_reference_id() %>" target=_blank><%= pub.get_title() %></a>
	     <% firstPub = false; %>
	  <% } %>
	</td>
      </tr>
      <% } %>

    



