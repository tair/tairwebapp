<!-- Generic code for displaying map locations on a detail page for any MapElement. -->
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, org.tair.tfc.*, org.tair.querytools.*, java.util.*" %>

<%
MapElementDetail object = (MapElementDetail) request.getAttribute("detail");
%>

<th class="sm" align="left" valign="top">Map Locations<br><%= DefinitionsLookup.createPopupLink("Glossary","Map Locations") %></th>
<td class="sm">&nbsp;</td>
<td class="sm">
    <table width="100%" border="0" cellpadding="1">
        <tr align="left" valign="bottom">
            <th class="sm" align="left">chrom</th>
            <th class="sm" align="left">map</th>
            <th class="sm" align="left">map type<%= DefinitionsLookup.createPopupLink("Map","map_type") %></th>
            <th class="sm" align="left">coordinates</th>
            <th class="sm" align="left">orientation</th>
            <th class="sm" align="left">attrib</th>
        </tr>

       <%
       Iterator globalAssignmentIter = object.getGlobalAssignments();
       while ( globalAssignmentIter.hasNext() ) { 
            GlobalAssignment globalAssignment = (GlobalAssignment) globalAssignmentIter.next();
            %>

            <tr>
                <td class="sm"><%= EmptyTextConverter.convert( globalAssignment.getMapChromosome() ) %></td>
                <td class="sm"><a href="/servlets/TairObject?type=map&id=<%= globalAssignment.getMapId() %>"> <%= globalAssignment.getMapName() %></a></td>
                <td class="sm"><%= globalAssignment.getMapType() %></td>
                <td class="sm"> <%= EmptyTextConverter.convert( globalAssignment.getFormatStartPosition() ) %> - <%= EmptyTextConverter.convert( globalAssignment.getFormatEndPosition() ) %> <%= EmptyTextConverter.convert( globalAssignment.getUnits() ) %> </td>
                <td class="sm"> <%= globalAssignment.getFormatOrientation() %></td>
                <td class="sm">&nbsp;</td>
                <td class="sm">
                    <% if ( globalAssignment.hasDetails() ) { %>
                        <a href="/servlets/TairObject?id=<%= globalAssignment.getGlobalAssignmentId() %>&type=global_assignment">details</a>
                    <% } %>
                </td>
            </tr>

            <% 
            // Get Super Assignments for this Global Assignment

            if ( globalAssignment.hasSuperAssignments() ) {
                Iterator superAssignmentIter = globalAssignment.getSuperAssignments();
                while ( superAssignmentIter.hasNext() ) { 
                    LocalAssignment superAssignment = (LocalAssignment) superAssignmentIter.next();
                    %>

                    <tr>
                        <td class="sm"><%= EmptyTextConverter.convert( superAssignment.getMapElementChromosome() ) %></td>
                        <td class="sm"><a href="/servlets/TairObject?type=<%= superAssignment.getLinkType() %>&id=<%= superAssignment.getLinkId() %>"> <%= superAssignment.getMapElementName() %></a></td>
                        <td class="sm"><%= superAssignment.getMapElementType() %></td>
                        <td class="sm"> <%= EmptyTextConverter.convert( superAssignment.getFormatStartPosition() ) %> - <%= EmptyTextConverter.convert( superAssignment.getFormatEndPosition() ) %> <%= EmptyTextConverter.convert( superAssignment.getUnits() ) %> </td>
                        <td class="sm"> <%= superAssignment.getFormatOrientation() %></td>
                    </tr>
                <% } %>
            <% } %>
        <% } %>
    </table>
</td>

