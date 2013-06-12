 <% if ( object.hasExpressedExpressionSet() ) {   %>
   <TR  <%= myBgColor.toggleBgColor() %>>
   <TH class="sm" align=left colspan=3>
     <% if ( fullExpressed ){ %>

 <a href="<%= base_url%>&type=array_element"><img src="/images/minus_off.gif" alt="collapse" name="minus" width="18" height="23" border="0"></a>
<% }else{ %>
     <a href="<%= base_url%>&type=array_ele_expre_exp"><img src="/images/plus_on.gif" alt="collapse" name="plus" width="18" height="23" border="0"></a>
    <% } %> See list of slides where this element <%= object.getArrayDesignPlatformType().equals("dual")? "is expressed": "has an absolute call 'Present'" %> (<%= object.expressedExpressionSetCount() %>)

   </TH>
   </TR>

   
  <% if ( object.hasExpressedExpressionSet() && fullExpressed ){ %>  
   <TR>
   <td colspan=3>
   <table width="100%" border=0 cellspacing="0"  cellpadding="2">

   <TR  <%= myBgColor.toggleBgColor() %>>
   <th nowrap align=left> Slide name<%= DefinitionsLookup.createPopupLink("HybData","name") %> </TH>
   <th>&nbsp;</TH>
   <TH align=center nonwrap>

   <% if ( object.getArrayDesignPlatformType().equals("dual")){ %>
       Fold&nbsp;Change<BR>(std err)<%= DefinitionsLookup.createPopupLink("DualChannelHybData","fold_change") %>
   <% }else{ %>  
       Signal<BR>(signal percentile)<%= DefinitionsLookup.createPopupLink("SingleChannelHybData","signal") %>
   <% } %>
     
   </TH>

   <TH>&nbsp;</TH>
   <TH nowrap align=center nonwrap>Replicate<BR> ID (name)<%= DefinitionsLookup.createPopupLink("HybDescription","replicate_id") %></TH>
   <TH>&nbsp;</TH>
   <TH align=center>Experiment<BR> Name<%= DefinitionsLookup.createPopupLink("ExpressionSet","class")%> </TH>
   <TH>&nbsp;</TH>
   <TH align=center>Experiment <BR>Category<%= DefinitionsLookup.createPopupLink("RelationshipType","experiment_category")%> </TH>
   </TR>
  
   <%  Iterator expressionIter = object.getExpressedExpressionSets();
       while ( expressionIter.hasNext() ) {
            ArrayElementExpressionSet  set = (ArrayElementExpressionSet)expressionIter.next();
   %>
    <TR <%= myBgColor.toggleBgColor() %>>
    <%  if ( set.hasHybDescriptions() ) {
        Iterator hybIter =  set.getHybDescriptions();
        boolean firstHyb = true; 
        while ( hybIter.hasNext() ) {
           ArrayElementHybDescription hybDescription =  ( ArrayElementHybDescription)hybIter.next();
           String hybDescUrl = "/servlets/TairObject?type=hyb_descr_collection&id=" +
                               set.get_tair_object_id() + "#"+ hybDescription.get_hyb_description_id();
           if ( ! firstHyb ){
               out.print("<tr "+ myBgColor.sameBgColor()+">" );
           }
   %>
		 
   <TD align=left valign=top>
      <A href='<%= hybDescUrl %>'><%= hybDescription.getHybName() %> </A>
   </TD>
   
   <td>&nbsp;</td>
   
   <td valign=top align=left>
     <% if ( object.getArrayDesignPlatformType().equals("dual") ){ %>
       <%= hybDescription.getDisplayFoldChangeAndStdErr( )  %>
     <% } else{  %>
       <%= hybDescription. getDisplaySignalAndPercentile() %> 
     <% } %>
   </td>
   
    <td>&nbsp;</td>
    
   <TD align=left valign=top>
      <A href='<%= hybDescUrl %>'><%=  hybDescription.get_hyb_description_id() %> (<%= hybDescription.get_name() %>) 
    </A>
   </TD>

   <% if (firstHyb ){  %>
   <td rowspan='<%= set.hybDescriptionsCount()%>'>&nbsp;</td>
   <TD valign=top align=left rowspan='<%= set.hybDescriptionsCount()%>'>
        <A href="/servlets/TairObject?type=expression_set&id=<%= set.get_tair_object_id() %>">
            <%= set.get_name() %></A>
   </TD>
   <td rowspan='<%= set.hybDescriptionsCount()%>'>&nbsp;</td>
   <td valign=top rowspan='<%= set.hybDescriptionsCount()%>'>
   <% if ( set.hasCategoryKeywords()){  
      Iterator kwIter =  set.getCategoryKeywords();
      while ( kwIter.hasNext() ) {
           TfcKeyword kw =  ( TfcKeyword)kwIter.next();
           String kwdetail = "/servlets/TairObject?type=keyword&id=" +kw.get_keyword_id() ;
   %>
      <A href='<%= kwdetail %>'><%=  kw.get_keyword() %> </A><BR>
      
   <% } }else{ %>&nbsp;<% } %>
   </td>
  <%  } // end if firstHyb
    firstHyb= false;
  %>  
   </TR>
  <% } }  %> 
   <% } // end   while ( expressionIter.hasNext() )
    }
   %>
   </table>
   </td>
   </TR>
    <% } // end expressionSet %>

   
     
   
