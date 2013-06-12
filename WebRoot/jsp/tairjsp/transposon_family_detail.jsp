<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*, org.tair.search.*, org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>

<%!
String pageName = "Transposon Family Detail";
%>

<% // Get detail object from request
TransposonFamilyDetail object = (TransposonFamilyDetail) request.getAttribute("detail");
Object something = request.getAttribute("detail");
String hiddenReq = request.getParameter( "hideNote" );
boolean hidden = ( hiddenReq != null && hiddenReq.equals( "true" ) );

String showAllReq = request.getParameter( "showAllNote" );
boolean showAll = ( showAllReq != null && showAllReq.equals( "true" ) );
// show properties -- individual include names are listed above each section
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
    <jsp:param name="pageName" value="<%= pageName %>" />
    <jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<table width="100%" border="0" colspan="3" cellspacing="0" >
    
    <% 
    String obsoleteText = " ";
    //if ( object.get_is_obsolete().booleanValue() ) { 
    //    obsoleteText = " (OBSOLETE)";
    //}  %>
    <tr>
        <td colspan="3"><b><font size="+1">Transposon Family: <%= object.get_name() %>
        </font><font size="+1" color = "red"><%= obsoleteText %></font></b> [
        <A href="/help/helppages/transposondeta.jsp" target="_blank">Help</A> ]</td>
    </tr>
    
    
    <!-- DATE_LAST_MODIFIED-->

    <% if ( object.get_date_last_updated() != null ) { %>  
        <tr  <%= myBgColor.toggleBgColor() %> valign = "top">  
            <th class="sm" align="left" valign="top">Date last modified:</th>
            <td class="sm"><%=object.get_date_last_updated()%></td>
            <td class="sm">&nbsp;</td>
            <td class="sm">&nbsp;</td>
        </tr>
    <% }  %>
    
    <!-- FAMILY_NAME -->

    <% if ( object.get_name() != null ) { %>  
        <tr  <%= myBgColor.toggleBgColor() %> valign = "top">  
            <th class="sm" align="left" valign="top">Name:</th>
            <td class="sm"><%=object.get_name()%></td>
            <td class="sm">&nbsp;</td>
            <td class="sm">&nbsp;</td>
        </tr>
    <% }  %>
    
    <!-- SUPER_FAMILY_NAME-->

    <% if ( object.get_super_family_name() != null ) { %>  
        <tr  <%= myBgColor.toggleBgColor() %> valign = "top">  
            <th class="sm" align="left" valign="top">Super Family Name: </th>
            <td class="sm"><%=object.get_super_family_name()%></td>
            <td class="sm">&nbsp;</td>
            <td class="sm">&nbsp;</td>
        </tr>
    <% }  %>
 
    <!-- ASSOCIATED TRANSPSONS-->

    <% if ( object.hasAssocTransposon() ) { %>  
        <tr  <%= myBgColor.toggleBgColor() %> valign = "top">  
            <th class="sm" align="left" valign="top">Associated Transposons: </th>
            <th class = "sm" align="left">Name</th>
            <th class = "sm" align="left">Chromosome</th>
            <th class = "sm" align="left">Coordinates</th>
        </tr>
        <%
            String transposon = "";
            Iterator trans_iter = object.getAssocTransposon();
            while (trans_iter.hasNext() ){
                Transposon t = (Transposon)trans_iter.next();
                
                transposon = "<A href = '/servlets/TairObject?type=transposon&id=" + t.get_transposon_id()+"'>" + t.get_name() + "</A>";
                if (t.has_gas()){
                    Iterator ga_iter = t.get_gas(); 
                    GlobalAssignment ga = new GlobalAssignment();
                    //GlobalAssignmentCollection gac = new GlobalAssignmentCollection(conn, t.get_map_element_id()); 
                    while (ga_iter.hasNext() ){
                        //GlobalAssignment ga = (GlobalAssignment)ga_iter.next();
                        ga = (GlobalAssignment)ga_iter.next();
                        String coord = "";        
                
                    }%>
                    <tr>
                        <td class="sm">&nbsp;</td>
                        <td class="sm"><%=transposon%></td>
                        <td class="sm"><%=t.get_chromosome()%></td>
                        <td class="sm"><%=ga.getFormatStartPosition() + " ..." + ga.getFormatEndPosition()%></td>
                    </tr>
                <% }else{ %>
                <tr>
                    <td class="sm">&nbsp;</td>
                    <td class="sm"><%=transposon%></td>
                    <td class="sm"><%=t.get_chromosome()%></td>
                    <td class="sm">&nbsp;</td>
                </tr>
                <% } %>
            <% } %>
        <% } %>
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


