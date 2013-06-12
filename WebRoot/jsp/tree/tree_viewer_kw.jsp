<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="org.tair.search.tree.*,org.tair.tfc.*,org.tair.utilities.*"%>

<%!
String pageName = "Keyword Viewer";
%>

<% 
String tree_type = "keyword";
String type = "tree";
Long selected_node_id = ( Long )request.getAttribute( "node_id" );
String session_id = ( String )SessionHandler.getSessionUuid(request);
String root_id = (String) request.getAttribute("root_id");
Long id = ( request.getAttribute( "id" ) != null ) ? ( Long )request.getAttribute( "id" ) : new Long( 0 );
TreeFetcher tree = new TreeFetcher( session_id + "_" + root_id, tree_type);
String display = ( request.getAttribute( "display_option" ) != null ) ? ( String )request.getAttribute( "display_option" ) : " ";
String pub_checked = ( display.equalsIgnoreCase( "Publication" ) ) ? "checked" : " ";
String locus_checked = ( display.equalsIgnoreCase( "Locus" ) ) ? "checked" : " ";
String comm_checked = ( display.equalsIgnoreCase( "Communication" ) ) ? "checked" : " ";
String ar_checked = ( display.equalsIgnoreCase( "AnalysisReference" ) ) ? "checked" : " ";
String bs_checked = ( display.equalsIgnoreCase( "BioSample" ) ) ? "checked" : " ";
String es_checked = ( display.equalsIgnoreCase( "ExpressionSet" ) ) ? "checked" : " ";
String ann_checked = ( display.equalsIgnoreCase( "Annotation" ) ) ? "checked" : " ";
// to be able to use getSelectedNodeData().<tfc methods>
tree.setSelectedNodeData( selected_node_id );
tree.setTree();
TfcKeyword keyword = ( TfcKeyword )tree.getSelectedNodeData();
String term = ( keyword.get_keyword() != null ) ? keyword.get_keyword() : " ";
String extdb_id = ( keyword.get_extdb_id() != null ) ? keyword.get_extdb_id() : " ";
String definition = ( keyword.get_definition() != null ) ? keyword.get_definition() : " ";
// handles the offset in the depth caused by the parentage of the top node
int depth_offset = 0 - tree.getNodeDepth( 0 );
%>

<SCRIPT LANGUAGE="JavaScript">
function mySubmit( action, node_id, id ) {
    document.tree_kw.action.value = action;
    document.tree_kw.node_id.value = node_id;	
    document.tree_kw.id.value = id;		
    document.tree_kw.submit();
}
</SCRIPT>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<form action="<%=response.encodeURL("/servlet/Search")%>" name="tree_kw" method="get">
<input type="hidden" name="action" value="new_tree" />
<input type="hidden" name="type" value="tree" />
<input type="hidden" name="tree_type" value="keyword" />
<input type="hidden" name="node_id" value="<%=selected_node_id%>" />
<input type="hidden" name="root_id" value="<%=root_id%>" />
<input type="hidden" name="id" value="<%=id%>" />
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
      <tr>
	<td width="100%" align="left"> 
          <b><font size="+1">TAIR Keyword Browser</font></b>
          [<A href="/help/helppages/keybrowse.jsp" target="_blank">Help</A>]
	</td>
      </tr>
      <tr bgcolor="#d5d9dd" width=100%>
	<td>
	    <table border="0" cellpadding="0" cellspacing="0">
              <tr>
	        <td class="sm">
		  <input type="button" value="Display" onClick="javaScript:mySubmit('new_options',<%=selected_node_id%>,<%=id%>)" ><BR></td>
		<TD><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
	        <td class="sm">
		  <input type="radio" name="display_option" value="Locus" <%=locus_checked%>>loci<BR>
	        </td>
		<TD><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
	        <td class="sm">
		  <input type="radio" name="display_option" value="Publication" <%=pub_checked%>>publications<BR>
	        </td>
		<TD><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
	        <td class="sm">
		  <input type="radio" name="display_option" value="Annotation" <%=ann_checked%>>annotations<BR>
	        </td>
		<TD><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
	        <td class="sm">
		  <input type="radio" name="display_option" value="ExpressionSet" <%=es_checked%>>microarray experiments<BR>
	        </td>	        
             </tr>
           </table>
	</td>
      </tr>
      <tr bgcolor="#d5d9dd" width=100%>
	<td class="sm"> 
           Check the box and click the display button to see numbers of associated data
	</td>
      </tr>	
      <tr>
	<td> 
            <table border="0" cellspacing="0" cellpadding="0">
	      <tr>
		<td class="sm" nowrap><b>Keyword:</b><%= DefinitionsLookup.createPopupLink("Keyword","keyword") %> 	
		</td>
		<td class="sm"><%=term%>	
		</td>
	      </tr>
	      <tr>
		<td class="sm" nowrap><b>ID:</b><%= DefinitionsLookup.createPopupLink("Keyword","extdb_id") %> 	
		</td>
		<td class="sm"><%=extdb_id%>	
		</td>
	      </tr>
	      <tr>
		<td class="sm" valign="top" nowrap><b>Definition:</b> 	
		</td>
		<td class="sm"><%=definition%>	
		</td>
	      </tr>
            </table>
	</td>
      </tr>
      <tr bgcolor="#d5d9dd" width=100%>
      	<td class="sm" align="center">
            <img src="/images/tree/is_a.gif" border=0> = 'is a' relationship&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="/images/tree/part_of.gif" border=0> = 'part of' relationship&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="/images/tree/develops_from.gif" border=0> = 'develops from' relationship&nbsp;&nbsp;&nbsp;&nbsp;
            <br>
            <img src="/images/tree/regulates.gif" border=0> = 'regulates' relationship&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="/images/tree/pos_regulates.gif" border=0> = 'positively regulates' relationship&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="/images/tree/neg_regulates.gif" border=0> = 'negatively regulates' relationship&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
      </tr>
      <tr>
        <td class="sm" valign="top">Keyword Categories - Click on the link to generate a treeview for the category.</td>
      </tr>
      <tr>
	<td> 
            <table border="0" cellspacing="0" cellpadding="0">
              <tr>
<%
TfcKeyword.setAspects();
String nodeID = TfcKeyword.getAspectID( "cellular_component" ).toString();
%>
                  <td class="sm" valign="top"><A href="/servlets/Search?action=new_tree&type=tree&tree_type=keyword&node_id=<%=nodeID%>"><IMG src="/images/cleargif.gif" width="20" height="1" border=0>GO Cellular Component</A></td>
<%
nodeID = TfcKeyword.getAspectID( "biological_process" ).toString();
%>
                  <td class="sm" valign="top"><A href="/servlets/Search?action=new_tree&type=tree&tree_type=keyword&node_id=<%=nodeID%>"><IMG src="/images/cleargif.gif" width="20" height="1" border=0>GO Biological Process</A></td>
<% 
nodeID = TfcKeyword.getAspectID( "plant structure development stage" ).toString();
%>
                  <td class="sm" valign="top"><A href="/servlets/Search?action=new_tree&type=tree&tree_type=keyword&node_id=<%=nodeID%>"><IMG src="/images/cleargif.gif" width="20" height="1" border=0>Plant Growth and Developmental Stages</A></td>
              </tr>
              <tr>
<%
nodeID = TfcKeyword.getAspectID( "molecular_function" ).toString();
%>
                  <td class="sm" valign="top"><A href="/servlets/Search?action=new_tree&type=tree&tree_type=keyword&node_id=<%=nodeID%>"><IMG src="/images/cleargif.gif" width="20" height="1" border=0>GO Molecular Function</A></td>
<% 
nodeID = TfcKeyword.getAspectID( "plant anatomical entity" ).toString();
%>
                  <td class="sm" valign="top"><A href="/servlets/Search?action=new_tree&type=tree&tree_type=keyword&node_id=<%=nodeID%>"><IMG src="/images/cleargif.gif" width="20" height="1" border=0>Plant Anatomical Entity</A></td>
<%
nodeID = TfcKeyword.getAspectID( "experimental method" ).toString();
%>
                  <td class="sm" valign="top"><A href="/servlets/Search?action=new_tree&type=tree&tree_type=keyword&node_id=<%=nodeID%>"><IMG src="/images/cleargif.gif" width="20" height="1" border=0>Experimental Method</A></td>
              </tr>
            </table>
	</td>
      </tr>
     <% if ( tree.getTreeSize() > 0 ) { %>
	<tr bgcolor="#d5d9dd" width=100%>
	   <td>
            <table border="0" cellspacing="0" cellpadding="0">
     <%for ( int row_num = 0; row_num < tree.getTreeSize(); row_num ++ ) { 
	if ( tree.getNode( row_num, "node_id" ) != null ) { %>
	 <tr><td class="sm" nowrap >
	   <% for ( int i = 0; i < ( tree.getNodeDepth( row_num ) + depth_offset ); i ++ ) %><img src="/images/tree/bar.gif" border=0>
     
           <% if ( tree.getNode( row_num, "state" ).equalsIgnoreCase("L") ) {

		if ( tree.isLastSib( row_num ) ) {  %>
	          <img src="/images/tree/leaf_corner.gif" border=0><img src=<%=tree.getNode( row_num, "node_icon" )%> border=0><A href="/servlets/TairObject?type=keyword&id=<%=tree.getNode( row_num, "node_id" )%>"> 
         <%=tree.getNode( row_num, "name" )%>
         </A><%=tree.getNode( row_num, "display_data_2" )%>
	     <% } else { %>
		  <img src="/images/tree/tee.gif" border=0><img src=<%=tree.getNode( row_num, "node_icon" )%> border=0><A href="/servlets/TairObject?type=keyword&id=<%=tree.getNode( row_num, "node_id" )%>"> 
         <%=tree.getNode( row_num, "name" )%>
         </A><%=tree.getNode( row_num, "display_data_2" )%>
	     <% }

              } else if ( tree.getNode( row_num, "state" ).equalsIgnoreCase("E") ) { 

		if ( tree.isLastSib( row_num ) ) { %>
		  <A href="javaScript:mySubmit('collapse',<%=tree.getNode( row_num,"node_id" )%>,<%=tree.getNode( row_num,"row_id" )%>)"><img src="/images/tree/corner_minus.gif" border=0><img src=<%=tree.getNode( row_num, "node_icon" )%> border=0></A><A href="/servlets/TairObject?type=keyword&id=<%=tree.getNode( row_num, "row_id" )%>"> 
         <%=tree.getNode( row_num, "name" )%>
         </A>&nbsp;<%=tree.getNode( row_num, "display_data_2" )%>
	     <% } else { %>
	          <A href="javaScript:mySubmit('collapse',<%=tree.getNode( row_num,"node_id" )%>,<%=tree.getNode( row_num,"row_id" )%>)"><img src="/images/tree/tee_minus.gif" border=0></A><img src=<%=tree.getNode( row_num, "node_icon" )%> border=0><A href="/servlets/TairObject?type=keyword&id=<%=tree.getNode( row_num, "row_id" )%>"> 
         <%=tree.getNode( row_num, "name" )%>
         </A>&nbsp;<%=tree.getNode( row_num, "display_data_2" )%>
             <% }

  	      } else if ( tree.getNode( row_num, "state" ).equalsIgnoreCase("C") ) { 
		if ( tree.isLastSib( row_num ) ) { %>
 	          <A href="javaScript:mySubmit('expand',<%=tree.getNode( row_num,"node_id" )%>,<%=tree.getNode( row_num,"row_id" )%>)"><img src="/images/tree/corner_plus.gif" border=0></A><img src=<%=tree.getNode( row_num, "node_icon" )%> border=0><A href="/servlets/TairObject?type=keyword&id=<%=tree.getNode( row_num, "node_id" )%>"> 
         <%=tree.getNode( row_num, "name" )%>
         </A>&nbsp;<%=tree.getNode( row_num, "display_data_2" )%>
             <% } else { %>
                  <A href="javaScript:mySubmit('expand',<%=tree.getNode( row_num,"node_id" )%>,<%=tree.getNode( row_num,"row_id" )%>)"><img src="/images/tree/tee_plus.gif" border=0></A><img src=<%=tree.getNode( row_num, "node_icon" )%> border=0><A href="/servlets/TairObject?type=keyword&id=<%=tree.getNode( row_num, "node_id" )%>"> 
         <%=tree.getNode( row_num, "name" )%>
         </A>&nbsp;<%=tree.getNode( row_num, "display_data_2" )%>
             <% }
	      } %>

        </td></tr>
    <% } } } %>
         </table>
        </td>
      </tr>
      <tr>
        <td><A href="/servlets/Search?action=new_search&type=keyword">Go back to search page</A>
        </td>
      </tr>
</table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
