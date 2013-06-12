<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.querytools.*, org.tair.tfc.*, org.tair.utilities.*, java.util.*"
%>

<%!
String pageName = "Definition Search Results";
String highlight = "1";
%>

<%
DefinitionsCollection definitions = (DefinitionsCollection) request.getAttribute( "definitions" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />


<% if ( definitions.isEmpty() ) { %>
   <center>
   No definitions found for table: <font class="emphasis"><%= definitions.getTableName() %></font>

      <p>
      <form action="/servlets/processor" method="post">
	<input type="hidden" name="type" value="definition">
	<input type="hidden" name="update_action" value="add">
	<input type="hidden" name="table_name" value="<%= definitions.getTableName() %>">
	
	<table>

	  <tr> 
	    <td><input type="submit" value="Add Definition"></td>
	    <td><input type="button" value="Search Again" 
                 onClick="document.location.href='/servlets/processor?type=definition'"></td>
	  </tr>  
	</table>

      </form>
   </center>
    
<% } else { %> 


   <table width="100%" cellpadding="2" border="0" CELLSPACING=0>
    <form action="/servlets/processor" method="post">
      <input type="hidden" name="type" value="definition">
      <input type="hidden" name="update_action" value="add">
      <input type="hidden" name="table_name" value="<%= definitions.getTableName() %>">
    	<tr>
	  <td colspan="5" align="center">
	    <input type="submit" value="Add Row"> 
	    &nbsp;&nbsp;
            <input type="button" value="Search Again" onClick="document.location.href='/servlets/processor?type=definition'">
	  </td>
	</tr>

       </form>
   <%
      Iterator iter = definitions.iterator();
      Definitions definition = null;
      while ( iter.hasNext() ) {
         definition = (Definitions) iter.next();
         Long id = definition.get_definitions_id() ; 
         String color = myBgColor.toggleBgColor();
   %>
      <form action="/servlets/processor" method="post">
          <input type="hidden" name="type" value="definition">
          <input type="hidden" name="update_action" value="update">
          <input type="hidden" name="definitions_id" value="<%= definition.get_definitions_id() %>">

      <tr <%= color %> >
        <td><table><tr>
        <td><%= id %></td>
	<td>Table Name<BR><input name="table_name" value="<%= definition.get_table_name() %>"></td>
	<td>Field Name<BR><input name="field_name" value="<%= EmptyTextConverter.convert( definition.get_field_name()) %>"></td>
	<td>Field Value<BR><input name="field_value" value="<%= EmptyTextConverter.convert( definition.get_field_value() ) %>"></td>	
        <td>Display Value<BR><input name="display_value" value="<%= EmptyTextConverter.convert( definition.get_display_value() ) %>"></td>
         </tr></table></td>
      </tr>

  <tr <%= color %> valign="top">   
      <td>
      <table>
        <tr>
        <td>Reference<BR><input name="reference" value="<%= EmptyTextConverter.convert( definition.get_reference() ) %>"></td>
        <td>Definition<BR>
             <textarea name="definition" cols="20" rows="2" wrap="virtual"><%= EmptyTextConverter.convert( definition.get_definition() ) %></textarea>
        </td>
         <td>Do Stats<BR>
             <%= HTMLFactory.createCheckBox( "do_stats", "true", definition.get_do_stats() ) %>
         </td> 
         <td>Do Glossary<BR>
             <%= HTMLFactory.createCheckBox( "is_glossary", "true", definition.get_is_glossary() ) %>
         </td> 
        <td align="center"> 
           Updated By/Date<BR>
           <% if ( definition.get_community_id() != null ) { %>
               <a href="/servlets/Community?action=view&type=<%= definition.getCommunityLinkType() %>&communityID=<%= definition.get_community_id() %>"><%= definition.getCommunityDisplayName() %></a>
               &nbsp;&nbsp;
           <% } %>
           <BR>
           <%= EmptyTextConverter.convert( definition.get_date_last_modified() ) %>
        </td>

        <td>
           <table>
              <tr>
                <td colspan="2" align="center"><input type="checkbox" name="delete" value="true">Delete Row</td>
              </tr>
              <tr> 
                <td><input type="submit" value="Submit"></td>
                <td><input type="reset" value="Reset"></td>
             </tr>
           </table>
        </td>
        
       </tr></table></td>
     </tr>
     
      <tr <%= color%>><td>&nbsp;</td></tr>

   </form>
  <% } %>	

   </table>


<% } %>	



<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
