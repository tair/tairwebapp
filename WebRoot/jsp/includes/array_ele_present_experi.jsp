  <% if ( object.hasPresentExpressionSet() ) {  %>
   <tr  <%= myBgColor.toggleBgColor() %>>
   <TH class="sm" align=left colspan=3 nonwrap>
   <% if ( fullPresent ){  %> 
     <a href="<%= base_url%>&type=array_element"><img src="/images/minus_off.gif" alt="collapse" name="minus" width="18" height="23" border="0"></a>
<% }else{ %>
     <a href="<%= base_url%>&type=array_ele_pre_exp"><img src="/images/plus_on.gif" alt="collapse" name="plus" width="18" height="23" border="0"></a>
    <% } %> See list of all experiments where this element is included  (<%= object.presentExpressionSetCount() %>)

     
   </TH>
   </TR>

 <% if ( object.hasPresentExpressionSet() && fullPresent ){  %>
   <tr  <%= myBgColor.sameBgColor() %>>
   <td class="sm" colspan=3 align=left>
   <%  Iterator expressionIter = object.getPresentExpressionSets();
       while ( expressionIter.hasNext() ) {
            ArrayElementExpressionSet  set = (ArrayElementExpressionSet)expressionIter.next();
  %>
     --&nbsp;<A href="/servlets/TairObject?type=expression_set&id=<%= set.get_tair_object_id() %>">
            <%= set.get_name() %><BR></A>
   <% }  %>
     
   </TD> 
   </TR>
  <% } // end if fullPresent %>  
  <% } // end if  %>

   
     
   
