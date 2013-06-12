<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,org.tair.community.*,  java.util.*, java.net.*, org.tair.bs.community.*"%>
<%!
String pageName = "Publication Detail";
%>
<%    
  PublicationDetail object= (PublicationDetail) request.getAttribute("detail");	
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<table width="100%" border="0" colspan="2" cellspacing="0" >
  <tr>
    <td colspan="3"><b><font size="+1">Title: <%= object.get_title() %></font></b>
    </td>
  </tr>
 <!-- Authors -->
 <%  if ( object.get_author_string() != null ) {  %>
 <tr <%=myBgColor.toggleBgColor() %>  >
      <th class="sm" align="left" valign="top" >Authors</th>
      <td class="sm">&nbsp;&nbsp;</td>	
      <td class="sm" ><%= EmptyTextConverter.convert( object.get_author_string()) %>
      </td>
  </tr>
 <% } %>

<!--community-->
 <%  if (object.getCommunities() != null ) { %>  
    <tr <%=myBgColor.toggleBgColor() %>  >
      <th class="sm" valign="top" align="left">Community</th>
	  <td class="sm">&nbsp;</td>
	  <td class="sm">
            <table >
	      <tr>
	          <th class="sm" align=left>name</th>
                  <th class="sm">&nbsp;</th>
	          <th class="sm" align=left>email</th>
               </tr>
       
<%      Iterator commIter = object.getCommunities();	
        while ( commIter.hasNext() ) {
	     ListCommunity comm = (ListCommunity) commIter.next(); 
             if( comm.getCommunityID() != null){
%>
            <TR>
               <td class="sm"> 
         <a href="/servlets/Community?action=view&type=<%= comm.getLinkType() %>&communityID=<%= comm.getCommunityID() %>">
             <%= EmptyTextConverter.convert( comm.getDisplayName() ) %></A>
               </td>
               <td class="sm">&nbsp;</td>
               <td class="sm"><%= EmptyTextConverter.convert( comm.getEmail())%></td>
            </TR>             
         <% } } %>
           </table>
        </td>
   </TR>   
 <%  } %>
 

 <% if ( object.get_pub_source_name()!= null ) { %>
     <tr <%=myBgColor.toggleBgColor()%> >
        <th class="sm" align="left" valign="top" >Type</th>
        <td class="sm">&nbsp;&nbsp;</td> 
        <td class="sm" ><%= object.getDisplayType() %></td>
     </tr>
 <%  } %>  
 
 <% if ( object.get_pub_source_name()!= null ) { %>
     <tr <%=myBgColor.toggleBgColor()%> >
        <th class="sm" align="left" valign="top" ><%= object.get_pub_source_type() %></th>
        <td class="sm">&nbsp;&nbsp;</td> 
        <td class="sm" ><%= object.get_pub_source_name() %></td>
     </tr>
 <%  } %> 
	 
 <% if ( object.get_year() != null){ %>
     <tr <%=myBgColor.toggleBgColor()%> >
         <th class="sm" align="left" valign="top" >Year</th>
         <td class="sm">&nbsp;&nbsp;</td>	
         <td class="sm" ><%= object.get_year() %></td>
     </tr>
 <% } %>   	      

 <%  if(object.get_volume()!= null&& object.get_volume().trim().length()>0 ){ %>
     <tr  <%=myBgColor.toggleBgColor() %> >
          <th class="sm" align="left" valign="top" >Volume</th>
          <td class="sm">&nbsp;&nbsp;</td>	
          <td class="sm"><%= object.get_volume() %></td>
     </tr>
 <% } %>

 <%  if(object.get_issue()!= null ){ %>
     <tr  <%=myBgColor.toggleBgColor() %> >
          <th class="sm" align="left" valign="top" >Issue</th>
          <td class="sm">&nbsp;&nbsp;</td>	
          <td class="sm"><%= object.get_issue() %></td>
     </tr>
 <% } %>

   	      
 <%  if(object.get_page_start() != null && object.get_page_start().trim().length()>0 ){ %>
     <tr  <%=myBgColor.toggleBgColor() %> >
          <th class="sm" align="left" valign="top">Start Page</th>
          <td class="sm">&nbsp;&nbsp;</td>	
          <td class="sm" ><%= object.get_page_start() %></td>
     </tr>
 <% } %>   	      

 <%   if(object.getAccession() != null){ %>
     <tr  <%=myBgColor.toggleBgColor() %> >
          <th class="sm" align="left" valign="top" >TAIR accession</th>
          <td class="sm">&nbsp;&nbsp;</td>	
          <td class="sm"><%= object.getAccession() %></td>
     </tr>
 <% } %>

 <% if ( object.get_pubmed_id() != null ) { %>
     <tr  <%=myBgColor.toggleBgColor() %> >
          <th class="sm" align="left" valign="top" >PubMed ID</th>
          <td class="sm">&nbsp;&nbsp;</td>	
          <td class="sm"><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=<%= URLEncoder.encode( object.get_pubmed_id().trim(), "UTF-8" ) %>&dopt=Abstract"><%= object.get_pubmed_id() %></a></td>
     </tr>
 <% } %>

 <%  if(object.get_abstract_text() != null){ %>
     <tr  <%=myBgColor.toggleBgColor() %> >
           <th class="sm" align="left" valign="top">Abstract</th>
           <td class="sm">&nbsp;&nbsp;</td>	
           <td class="sm" ><%= object.get_abstract_text_with_urls() %></td>
     </tr>
 <% } %>

  <!-- url_vector -->
 <%  if(object. get_url_references()!=null){ %>
     <tr <%=myBgColor.toggleBgColor() %> valign="top">
          <th class="sm" align="left" valign="top">URL</th>
          <td class="sm">&nbsp;&nbsp;</td>
          <td class="sm">
             <%  Iterator urlIter = object.get_url_references();
                 if ( urlIter.hasNext() ) {
                    ReferenceURL urlRef = (ReferenceURL)urlIter.next(); 
                    BsUrl url = urlRef.getUrl();
              %>
                   <%= HTMLFactory.urlToHTML( url.getUrl(), url.getWebSiteName() ) %><br>
             <% } %>
          </td>
      </tr>
 <% } %>

 <!-- keywords -->
 <% if ( object.hasKeywords() ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign=top>
       <th class="sm" valign="top" align="left">Associated Keywords</th>
       <td class="sm">&nbsp;</td>
       <td class="sm">  
   <%  Iterator keywordIter = object.getKeywords();
       StringBuffer display = new StringBuffer();
       boolean first = true ;	 
       while ( keywordIter.hasNext() ) {
           KeywordLite  kw = (KeywordLite) keywordIter.next();
	   if( ! first){
              display.append("; ");
	   }
	   display.append(
                "<A href='/servlets/TairObject?type=keyword&id="+kw.getKeywordID()+"'>"
	         +kw.getKeywordName()+"</A>") ;
	   first = false;   
       }
    %> <%= display.toString() %>
       </TD>
     </TR>  
 <% } %>

<!-- associated loci -->
<% if (object.get_associated_loci() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign=top>
        <th class="sm" valign="top" align="left">Associated Loci</th>
        <td class="sm">&nbsp;</td>
        <td class="sm">  
            <% 
            Iterator iter = object.get_associated_loci();
            Locus locus = null;
            while ( iter.hasNext() ) {
                locus = (Locus) iter.next(); 
            %>
            <a href="/servlets/TairObject?name=<%=locus.get_name()%>&type=locus"><%=locus.get_name()%></a>&nbsp;
            <% } %>
       </td>
    </tr>
<% } %>

<!-- annotations -->
<%  if( object.hasAnnotations()){ %>
    <tr <%= myBgColor.toggleBgColor() %> valign=top>
       <th class="sm" valign="top" align="left">Annotations Based on this Publication</th>
       <td class="sm">&nbsp;</td>
       <td class="sm">  
    <a href="/servlets/Search?action=search&type=annotation&reference_id=<%= object.get_reference_id() %>&pub_title=<%= object.get_title() %>"><%= object.getAnnotationCount() %> annotations </a>
       </td>
    </tr>  

 <% } %>   
</table>
	
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

