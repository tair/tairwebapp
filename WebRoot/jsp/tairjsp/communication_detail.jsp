<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*, java.util.*, org.tair.bs.community.*"%>
<%!
String pageName = "Communication Detail";
%>
<% 
 
   CommunicationDetail object = (CommunicationDetail)request.getAttribute("detail");
%> 

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />


<table width="100%" border="0" colspan="2" cellspacing="0" >
  
<%  if(object.get_name() != null){ %>
  <tr>
    <td colspan="3"><b><font size="+1">Communication:<%= object.get_name() %></font></b></td>
  </tr>
<% }  %>

<!--date-->

<% if ( object.get_date() != null){ %>
     <tr <%=myBgColor.toggleBgColor()%> >
         <th class="sm" align="left" valign="top" >Date last modified </th>
         <td class="sm">&nbsp;&nbsp;</td>	
         <td class="sm" ><%= object.get_date() %></td>
     </tr>
<% } %>   	


<!--author_name-->

 <%  if(object.get_author_name() != null){  %>
  <tr <%=myBgColor.toggleBgColor() %>  >
      <th class="sm" align="left" valign="top" >Author Name</th>
      <td class="sm">&nbsp;&nbsp;</td>	
      <td class="sm" ><%= object.get_author_name() %></td>
  </tr>
 <% } %>

<%  if(object.get_name() != null){ %>
  <tr <%=myBgColor.toggleBgColor() %>  >
      <th class="sm" align="left" valign="top" >Name</th>
      <td class="sm">&nbsp;&nbsp;</td>	
      <td class="sm" ><%= object.get_name() %></td>
  </tr>
 <% } %>

 <%   if(object.getAccession() != null){ %>
     <tr  <%=myBgColor.toggleBgColor() %> >
          <th class="sm" align="left" valign="top" >TAIR accession</th>
          <td class="sm">&nbsp;&nbsp;</td>	
          <td class="sm"><%= object.getAccession() %></td>
     </tr>
 <% } %>

 <%  if (object.get_communication() != null ) {  %>
  <tr <%=myBgColor.toggleBgColor() %>  >
      <th class="sm" align="left" valign="top" >Communication Detail</th>
      <td class="sm">&nbsp;&nbsp;</td>	
      <td class="sm" ><%= object.get_communication() %></td>
  </tr>
 <% } %>     
  
	      
 <!-- url_vector -->
 <%  if(object. get_url_references()!=null){ %>
     <tr <%=myBgColor.toggleBgColor() %> valign="top">
          <th class="sm" align="left" valign="top">URL</th>
          <td class="sm">&nbsp;&nbsp;</td>
          <td class="sm">
             <%  Iterator urlIter = object.get_url_references();
                 while ( urlIter.hasNext() ) {
                    ReferenceURL url = (ReferenceURL)urlIter.next(); 
              %>
                   <%= HTMLFactory.urlToHTML( url.getUrl().getUrl(), url.getUrl().getWebSiteName() ) %><br>
             <% } %>
          </td>
      </tr>
 <% } %>	      

 
</table>
	
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

