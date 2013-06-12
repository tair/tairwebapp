  <!-- array design-->
<tr  <%= myBgColor.toggleBgColor() %>>
   <TH class="sm" align=left colspan=3>
    <% if ( fullArrayDesign ){  %>
       <a href="<%= base_url%>&type=array_element"><img src="/images/minus_off.gif" alt="collapse" name="minus" width="18" height="23" border="0"></a>
  <% }else{ %>
       <a href="<%= base_url%>&type=array_element_design"><img src="/images/plus_on.gif" alt="collapse" name="plus" width="18" height="23" border="0"></a>
  <% } %>See list of array designs<%= DefinitionsLookup.createPopupLink("ArrayDesign","name") %> containing this element (<%= object.arrayDesignCount() %>)
 
   </TH>
   </TR>
   
  <% if (   object.hasArrayDesign() && fullArrayDesign ){  %>   
  <TR>
   <td class="sm" colspan=3 align=left>
   <table width="100%" border=0 cellspacing="0"  cellpadding="2">
   <tr  <%= myBgColor.sameBgColor() %>>
   <th nowrap align=left>Array Name </TH>
   <th>&nbsp;</TH>
   <th nowrap align=left>Manufacturer </TH>
   <th>&nbsp;</TH>
   <th nowrap align=left>Type </TH>
   <th>&nbsp;</TH>
   <TH align=left>Number of elements </tH>
   </TR>
   
   <%  Iterator arrayIter = object.getArrayDesigns();
       while ( arrayIter.hasNext() ) {
            TfcArrayDesign  arrayDesign = (TfcArrayDesign)arrayIter.next();
  %>
   <tr <%= myBgColor.toggleBgColor() %>>
    <TD align=left valign=top>
       <%= arrayDesign.get_name() %></TD>
    <td>&nbsp;</td>
    <TD align=left valign=top>
       <%=  arrayDesign.get_manufacturer() %></TD>
    <td>&nbsp;</td>
    <TD align=left valign=top>
       <%=  arrayDesign.get_platform_type() %>
    </TD>
    <td>&nbsp;</td>  
    <TD align=left valign=top>
       <%=  arrayDesign.get_num_spots()  %>
    </TD>
   <% 
       }
   %>
   </TD>
   </TR>
  <% } %>

     
   
