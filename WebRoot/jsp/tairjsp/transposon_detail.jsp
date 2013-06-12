<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2000 NCGR.  All rights 
  reserved.
-->
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*, org.tair.search.*, org.tair.querytools.*, org.tair.utilities.*, java.util.*, java.net.*"
%>

<%
String pageName = "Transposon Detail";
%>

<% 
TransposonDetail object = (TransposonDetail) request.getAttribute("detail");
Object something = request.getAttribute("detail");
//String something = request.getKey("detail");
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

<table width="100%" border="0" colspan="3" cellspacing="0" >
    
    <% 
    String obsoleteText = " ";
    %>
    <tr>
        <td colspan="3"><b><font size="+1">Transposon: <%= object.get_transposon_name() %>
        </font><font size="+1" color = "red"><%= obsoleteText %></font></b> [
        <A href="/help/helppages/transposondeta.jsp" target="_blank">Help</A> ]</td>
    </tr>
    <!-- DATE_LAST_MODIFIED-->

    <% if ( object.get_date_last_updated() != null ) { %>  
        <tr  <%= myBgColor.toggleBgColor() %> valign = "top">  
            <th class="sm" align="left" valign="top">Date last modified</th>
            <td class="sm">&nbsp;</td>
            <td class="sm"><%=object.get_date_last_updated()%></td>
        </tr>
    <% }  %>
    
    <!-- TRANSPOSON_NAME -->

    <% if ( object.get_transposon_name() != null ) { %>
        <tr <%=myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Name</th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%= object.get_transposon_name() %></td>
        </tr>
    <% } %>
    <!-- CHROMOSOME -->

    <% if ( object.get_chromosome() != null ) { %>
        <tr <%=myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Chromosome</th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%= object.get_chromosome() %></td>
        </tr>
    <% } %>

    <!-- TRANSPOSON_FAMILY -->
    
    <% if ( object.get_family_name()!= null ) { %>
        <tr <%=myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Family Name</th>
            <td class="sm">&nbsp;&nbsp;</td>
            <%  
                String familylink = "<A href = '/servlets/TairObject?type=transposon_family&id=" + object.get_family_id() + "'>" + object.get_family_name() + "</A>";
            %>
            <td class="sm"><%= familylink %></td>
        </tr>
    <% } %>
    
    <!-- TRANSPOSON_SUPER_FAMILY -->
    
    <% if ( object.get_family_name() != null ) { %>
        <tr <%=myBgColor.toggleBgColor() %> >
            <th class="sm" valign="top" align="left">Super Family Name</th>
            <td class="sm">&nbsp;&nbsp;</td>
            <td class="sm"><%= object.get_super_family_name() %></td>
        </tr>
    <% } %>
    
    <!-- SEQUENCE  -->

    <% if ( object.get_sequences() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %> >
    <th class="sm" valign="top" align="left">Nucleotide Sequence<%= DefinitionsLookup.createPopupLink("NucleotideSequence","class") %></th>
    <td class="sm">&nbsp;</td>
    <td class="sm" nowrap>
    <% Iterator seqIter = object.get_sequences();
    boolean firstSeq = true;
        while ( seqIter.hasNext() ) {
            Sequence sequence = (Sequence) seqIter.next();
            // only show sequences where type == genomic (per Sue 11.19.2003)
            if ( sequence.get_nucleotidesequence_type() != null && sequence.get_nucleotidesequence_type().equals( "genomic" ) ) {
                String seq_name = sequence.get_format_sequence_name();
                if ( !firstSeq ) {
                    out.write( "&nbsp;&nbsp;" );
                }
                firstSeq = false;
    %>
    
    <a href="/servlets/TairObject?type=sequence&id=<%= sequence.get_nucleotide_seq_id() %>"><%= seq_name %></a>
            <% } %>
        <% } %>
    </tr>
    <% } %>
        
    <!-- TRANSPOSABLE ELEMENTS SEQUENCES-->

    <% if ( object.hasCanon() ) { %>  
        <tr  <%= myBgColor.toggleBgColor() %> valign = "top">  
            <th class="sm" align="left" valign="top">Associated Transposable <br>Element Genes</th>
            <td class="sm">&nbsp;</td>
            <%
            String loci = "";
            Iterator loci_iter = object.getCanon();
            while (loci_iter.hasNext() ){
                Locus canon = (Locus)loci_iter.next();
                loci += "<A href= '/servlets/TairObject?type=locus&id="+ canon.get_locus_id()+"'>" + canon.get_name() + "</A>, ";
            }
            loci = loci.substring(0, loci.lastIndexOf(", ")); //remove the last ","
            %>
            <td class="sm"><%=loci%></td>
        </tr>
    <% }  %>
    
    <!-- GLOBAL ASSINGMENTS -->
    
    <% if (object.hasGlobalAssignments() ) { %>
        <tr  <%= myBgColor.toggleBgColor() %> valign = "top"> 
        <jsp:include page="/jsp/includes/map_locations.jsp" flush ="true"/> 
        </tr>
    
    <% } %> 

    <!--- CREATE LINKS TO VIWERS IF POSSIBLE -->
    <% if (object.hasGlobalAssignments() ){ %>
        <tr  <%= myBgColor.toggleBgColor() %> valign = "top">
        <th class ="sm" align="left">Map Links</th>
        <td class="sm">&nbsp;</td>
        <td class="sm">
            <table>
                <tr>
                    <td class="sm">
                    <%----
                    <%= HTMLFactory.createSeqViewerLinks( "Sequence Viewer", object.get_seqviewer_type(), object.get_tair_object_id(), object.getAGIChromosomes(), "&nbsp;" ) %>
                    &nbsp;&nbsp;&nbsp;
                    ---%>
                    <a href="/cgi-bin/gbrowse/arabidopsis/?name=<%= object.get_transposon_name()  %>">GBrowse</a>
                    </td>
                </tr>
            </table>
        </td>
        </tr>
    <% } %>


</table>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


