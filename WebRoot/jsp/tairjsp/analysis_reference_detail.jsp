<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, org.tair.bs.community.*"%>
<%!
String pageName = "Analysis Reference";
%>

<%      
// Get detail object from request
  AnalysisReferenceDetail  object = (AnalysisReferenceDetail) request.getAttribute("detail");
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />
<table width="100%" border="0" cellspacing="0" >
 <tr>
     <td colspan="3">
     <b><font size="+1"> AnalysisReference:<%= EmptyTextConverter.convert(object.get_analysis_reference_name() ) %></font></b>
     </td>
 </tr>

 <!-- name -->
 <% if ( object.get_analysis_reference_name() != null ) { %>
     <tr <%= myBgColor.toggleBgColor() %> >
	 <th class="sm" valign="top" align="left">Name</th>
	 <td class="sm">&nbsp;&nbsp;</td>
	 <td class="sm" width="80%"><%= object.get_analysis_reference_name() %></td>
     </tr>
 <% } %>

 

 <!-- tfc_analysis_reference -->
 <tr  <%=myBgColor.toggleBgColor() %> >
      <th class="sm" align="left" valign="top" >Title</th>
      <td class="sm">&nbsp;&nbsp;</td>	
      <td class="sm" ><%= EmptyTextConverter.convert(object.get_analysis_reference_name() ) %>&nbsp;</td>
 </tr>

 <%   if(object.getAccession() != null){ %>
     <tr  <%=myBgColor.toggleBgColor() %> >
          <th class="sm" align="left" valign="top" >TAIR accession</th>
          <td class="sm">&nbsp;&nbsp;</td>	
          <td class="sm"><%= object.getAccession() %></td>
     </tr>
 <% } %>


  <% if ( object.get_parameters() != null ) { %>
   <tr  <%=myBgColor.toggleBgColor() %> >
      <th class="sm" align="left" valign="top" >Parameters</th>
      <td class="sm">&nbsp;&nbsp;</td>	
      <td class="sm" ><%= object.get_parameters() %></td>
   </tr>
  <% } %>

  <% if ( object.get_output_definition_criteria() != null ) { %>
   <tr <%=myBgColor.toggleBgColor()%> >
      <th class="sm" align="left" valign="top" >Output Criteria</th>
      <td class="sm">&nbsp;&nbsp;</td>	
      <td class="sm" ><%=object.get_output_definition_criteria()%></td>
   </tr>
 <% } %>

  <% if ( object.get_date_run() != null ) { %>
   <tr  <%=myBgColor.toggleBgColor()%> >
      <th class="sm" align="left" valign="top" >Analysis Date</th>
      <td class="sm">&nbsp;&nbsp;</td>	
      <td class="sm" ><%= object.get_date_run() %></td>
   </tr>
  <% } %>

  <% if ( object.get_is_nucleotide() != null ) { %>
   <tr  <%=myBgColor.toggleBgColor() %> >
      <th class="sm" align="left" valign="top" >Nucleotide Analysis</th>
      <td class="sm">&nbsp;&nbsp;</td>	
      <td class="sm" ><%= object.get_is_nucleotide() %></td>
   </tr>
  <% } %>

  <% if ( object.get_is_peptide() != null ) { %>
   <tr  <%=myBgColor.toggleBgColor() %> >
      <th class="sm" align="left" valign="top">Protein Analysis</th>
      <td class="sm">&nbsp;&nbsp;</td>	
      <td class="sm" ><%=object.get_is_peptide()%></td>
   </tr>
  <% } %>
 
 <!-- tfc_analysis_software -->
 <% if ( object.get_analysis_software_id() != null ) { %>
  <% if ( object.get_program_name() != null ) { %>
   <tr  <%=myBgColor.toggleBgColor() %> >
      <th class="sm" align="left" valign="top" >Software Program</th>
      <td class="sm">&nbsp;&nbsp;</td>	
      <td class="sm" width="80%" ><%=object.get_program_name()%></td>
   </tr>
  <% } %>

  <% if ( object.get_description() != null ) { %>
   <tr  <%=myBgColor.toggleBgColor() %> >
       <th class="sm" align="left" valign="top" width="20%">Software Description</th>
       <td class="sm" width="5%">&nbsp;&nbsp;</td>	
       <td class="sm" width="80%" ><%=object.get_description()%></td>
   </tr>
  <% } %>

  <% if ( object.get_sw_function() != null ) { %>
   <tr  <%=myBgColor.toggleBgColor() %> >
       <th class="sm" align="left" valign="top" >Software Function</th>
       <td class="sm">&nbsp;&nbsp;</td>	
       <td class="sm" ><%=object.get_sw_function()%></td>
   </tr>
  <% } %>

  <% if ( object.get_source() != null ) { %> 
   <tr <%=myBgColor.toggleBgColor()%> >
       <th class="sm" align="left" valign="top" >Software Source</th>
       <td class="sm">&nbsp;&nbsp;</td>	
       <td class="sm" width="75%"><%=object.get_source()%></td>
   </tr>
  <% } %>

  <% if ( object.get_author() != null ) { %> 
   <tr <%=myBgColor.toggleBgColor()%> >
        <th class="sm" align="left" valign="top" >Software Author(s)</th>
        <td class="sm">&nbsp;&nbsp;</td>	
        <td class="sm" ><%=object.get_author()%></td>
   </tr>
   <% } %>


  <% if ( object.get_date_released() != null ) { %> 
   <tr  <%=myBgColor.toggleBgColor() %> >
        <th class="sm" align="left" valign="top" >Software Release Date</th>
        <td class="sm">&nbsp;&nbsp;</td>	
        <td class="sm" ><%=object.get_date_released()%></td>
   </tr>
  <% } %>

  <% if ( object.get_version() != null ) { %> 
   <tr  <%=myBgColor.toggleBgColor() %> >
        <th class="sm" align="left" valign="top">Software Version</th>
        <td class="sm">&nbsp;&nbsp;</td>	
        <td class="sm" ><%=object.get_version()%></td>
   </tr>
  <% } %>
<% } %> 
<!-- end of analysis software -->


 <!-- url_vector  -->
  <% if( object.get_url_references()!= null ){ %>
  <tr <%= myBgColor.toggleBgColor() %> > 
        <th class="sm" align="left" valign="top">URL</th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm">
    <%
          Iterator urlIter = object.get_url_references();
          ReferenceURL url;
          while ( urlIter.hasNext() ) {
             url = (ReferenceURL) urlIter.next();
          
    %>
         <%= HTMLFactory.urlToHTML( url.getUrl().getUrl(), url.getUrl().getWebSiteName() )%><br>
    <% } %>

        </td>
    </tr>
   <% } %>   	      

</table>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

