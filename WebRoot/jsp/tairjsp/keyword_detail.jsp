<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>

<%!
String pageName = "Keyword Detail";
%>

<%
    KeywordDetail  object =
       (KeywordDetail)request.getAttribute("detail");
     
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
      <td colspan="3"><b><font size="+1">Keyword:<%= object.get_keyword() %></font></b></td> 
 </tr>

 <!-- date_last_modified-->
 <% if ( object.get_date_last_modified() != null ) { %>  
 <tr  <%= myBgColor.toggleBgColor() %> >  
      <th class="sm" align="left">Date last modified</th>
      <td class="sm">&nbsp;&nbsp;</td>
      <td class="sm"><%=  object.get_date_last_modified()  %></td>
 </tr>
 <% }  %>
 
 <!-- name -->
 <% if ( object.get_keyword() != null ) { %>
 <tr <%=myBgColor.toggleBgColor() %> >
     <th class="sm" valign="top" align="left">Keyword<%= DefinitionsLookup.createPopupLink("Keyword","keyword") %></th>
     <td class="sm">&nbsp;&nbsp;</td>
     <td class="sm"><%= object.get_keyword() %></td>
 </tr>
 <% } %>

 <!-- synonyms -->
 <% if ( object.has_synonyms() ) { %> 
 <tr <%= myBgColor.toggleBgColor() %> >
     <th class="sm" valign="top" align="left">Synonyms<%= DefinitionsLookup.createPopupLink("Synonym","class") %></th>
     <td class="sm">&nbsp;</td>
     <td class="sm">
        <%= EmptyTextConverter.convert( object.getSynonymString( ) ) %>&nbsp;
     </td>
 </tr>
 <% } %>

 
 <!-- definition -->
 <% if ( object.get_definition() != null ) { %>
 <tr <%=myBgColor.toggleBgColor() %> >
     <th class="sm" valign="top" align="left">Definition</th>
     <td class="sm">&nbsp;&nbsp;</td>
     <td class="sm"><%= EmptyTextConverter.convert(object.get_definition()) %></td>
 </tr>
 <% } %>
 
 <!-- note -->
 <% if ( object.get_note() != null ) { %>
 <tr <%=myBgColor.toggleBgColor() %> >
     <th class="sm" valign="top" align="left">Note</th>
     <td class="sm">&nbsp;&nbsp;</td>
     <td class="sm"><%= EmptyTextConverter.convert(object.get_note()) %></td>
 </tr>
 <% } %>
 
 <% boolean is_go_term = false ;
    if (EmptyTextConverter.convert(object.get_extdb_id()).toUpperCase().startsWith("GO")){
         is_go_term = true;
    }
 %>
 <!-- go id -->
 <% if ( object.get_extdb_id() != null ) { %>
 <tr <%=myBgColor.toggleBgColor() %> >
     <th class="sm" valign="top" align="left">Keyword ID<%= DefinitionsLookup.createPopupLink("Keyword","extdb_id") %></th>
     <td class="sm">&nbsp;&nbsp;</td>
     <td class="sm">
    <%  // link to poc site for poc terms
       String extdb_id =  object.get_extdb_id();
       if ( ! TextConverter.isEmpty ( extdb_id ) &&  extdb_id.startsWith ("PO:")) {
    %> 
      <A href="http://www.plantontology.org/amigo/go.cgi?view=details&query=<%= extdb_id %>" target=_blank >
        <%= extdb_id%>
      </A>
   <%  }else{  %> 
      <%= EmptyTextConverter.convert(object.get_extdb_id()) %>
   <%  }  %>
   </td>
 </tr>
 <% } %>
  
 <!-- go vocabulary type -->
 <% if ( object.get_keyword_type() != null ) { %>
 <tr <%=myBgColor.toggleBgColor() %> >
     <th class="sm" valign="top" align="left">Keyword Category<%= DefinitionsLookup.createPopupLink("KeywordType","keyword_type") %></th>
     <td class="sm">&nbsp;&nbsp;</td>
     <td class="sm"><%= EmptyTextConverter.convert(object.get_keyword_type()) %></td>
 </tr>
 <% } %>
 
<!-- associated date -->
 <% if ( object.hasToTermCounts() ) { %>
 <tr <%= myBgColor.toggleBgColor() %> >

     <th class="sm" valign="top" align="left">Data Associated To This Term<%= DefinitionsLookup.createPopupLink("Glossary","data_to_term") %></th>
     <td class="sm">&nbsp;&nbsp;</td>
     <td class="sm">
     <%  Iterator toTermIter = object.getToTermCounts();
       if ( toTermIter != null ) {
	while ( toTermIter.hasNext() ) {
	  AnnotationCount ac = ( AnnotationCount )toTermIter.next();
          if(!ac.getChildTableName().equalsIgnoreCase(TfcAnnotationType.GENE) && ac.getCount()>0){
   %>   
      <%= EmptyTextConverter.convert(ac.getShortHyperlink()) %><BR>
     <% }}} %>
     </TD>
 </TR>
 <% } %>

 <!-- associated date -->
 <% if ( object.hasToChildrenCounts() ) { %>
 <tr <%=myBgColor.toggleBgColor() %> >
     <th class="sm" valign="top" align="left">Data Associated To Children Terms<%= DefinitionsLookup.createPopupLink("Glossary","data_to_child") %></th>
     <td class="sm">&nbsp;&nbsp;</td>
     <td class="sm">
   <%  Iterator toChildrenIter = object.getToChildrenCounts();
       if ( toChildrenIter != null ) {
	while ( toChildrenIter.hasNext() ) {
	  AnnotationCount ace = ( AnnotationCount )toChildrenIter.next();
          if(!ace.getChildTableName().equalsIgnoreCase(TfcAnnotationType.GENE) && ace.getCount()>0){
   %>   
    <%= EmptyTextConverter.convert(ace.getShortHyperlink()) %><BR>
     <% }}} %>
    </TR>   
 </tr>
<% } %>

 <!-- link to tree view -->
 <tr <%=myBgColor.toggleBgColor() %> >
     <th class="sm" valign="top" align="left">TreeView<%= DefinitionsLookup.createPopupLink("Tools","treeview") %></th>
     <td class="sm">&nbsp;&nbsp;</td>
     <td class="sm">
        <A Href="/servlets/Search?action=new_tree&type=tree&tree_type=keyword&node_id=<%=object.get_keyword_id() %>">
          TreeView</A>
     </td>
 </tr>

<% if (is_go_term){  // display link to GO site  %>
<tr <%=myBgColor.toggleBgColor() %> >
     <th class="sm" valign="top" align="left">Similarly Annotated Genes From Other Organisms</th>
     <td class="sm">&nbsp;&nbsp;</td>
     <td class="sm">
        <A Href="http://godatabase.org/cgi-bin/go.cgi?query=<%= object.get_extdb_id() %>&view=details&search_constraint=terms&depth=0" target="_blank">GO Database</A>
     </td>
 </tr>
<% }  %>
 

 
 
 
</table>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
