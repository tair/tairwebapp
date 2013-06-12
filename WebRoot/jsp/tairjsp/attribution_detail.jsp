<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, org.tair.bs.community.*"%>

<%!
String pageName = "Attributions Detail";
%>

<% AttributionDetail detail = (AttributionDetail) request.getAttribute( "detail" ); %>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>


<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<table width="100%" cellspacing="0" border="0">
    <% if ( detail.getOriginalName() != null ) { %>  
      <tr>
	<td><h1><%= detail.getOriginalName() %></h1></td>
	</tr>
	<%}%>

    <!-- date_entered-->
    <% if ( detail.getDateEntered() != null ) { %>  
      <tr  <%= myBgColor.toggleBgColor() %> >  

        <th class="sm" align="left">Date entered</th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm"><%=  detail.getDateEntered()  %></td>
      </tr>
    <% } %>

    <!-- external_link -->
    <%  if ( detail.hasExternalLinks() ) { %>
   
      <tr <%= myBgColor.toggleBgColor() %> valign="top">
        <th class="sm" align="left">External Link</th> 
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm">
         <% Iterator iter = detail.getExternalLinks();
            boolean first = true;
            while ( iter.hasNext() ) {
                ExternalLinkObject elo = (ExternalLinkObject) iter.next();
                String web_site_name = elo.get_web_site_name();
		if ( !first ) {
		    out.write( "<br>" );
		}
		first = false;
         %>  
	        <%= elo.get_external_HTML_link( web_site_name ) %>
         <% } %>
        </td>
      </tr>
    <% } %>

    <!-- annotation -->
      <% if ( detail.hasAnnotations() ) { %>
       <tr <%= myBgColor.toggleBgColor() %> valign="top" >
	    <th class="sm" valign="top" align="left">Annotations</th>
	    <td class="sm">&nbsp;</td>
	    <td class="sm">
              <table>
	         <tr align="left">
	           <th class="sm">date</th>
	           <th class="sm">by</th>
  	           <th class="sm">annotation</th>
	         </tr>

                <% 
                   Iterator annotationIter = detail.getAnnotations();
                   while ( annotationIter.hasNext() ) {
                      AnnotationObject annotation = (AnnotationObject) annotationIter.next();
                %>

                 <tr valign="top">
                   <td class="sm"><%= EmptyTextConverter.convert( annotation.get_date_entered() )%></td>
                   <td class="sm"><%= EmptyTextConverter.convert( annotation.get_annotation_source() ) %></td>
                   <td class="sm" colspan="2"><%= EmptyTextConverter.convert( annotation.get_short_annotation() ) + " " + EmptyTextConverter.convert( annotation.get_long_annotation() ) %></td>
                </tr>
                 <% } %>
              </table>
            </td>
	 </tr>
       <% } %>	



    <!-- attribution object-->
    <% if ( detail.hasAttributions() ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
         <th class="sm" valign="top" align="left">Attribution</th>
         <td class="sm">&nbsp;</td>
         <td class="sm">
	    <table>
	       <tr align="left">
	         <th class="sm">type</th>
	         <th class="sm" nowrap>&nbsp; &nbsp;</th>
	         <th class="sm">name</th>
	         <th class="sm" nowrap>&nbsp; &nbsp;</th>
	         <th class="sm">date</th>
	       </tr>

                 <%
                   for ( BsAttribution attribution : detail.getAttributions() ) {
                       BsAddress address = attribution != null ? attribution.getCommunity().getAddress() : null;
                 %>


                  <tr>
                     <td class="sm" valign="top"><%=EmptyTextConverter.convert( attribution.getType().getAttributionType())%></td>
                     <td class="sm" nowrap>&nbsp; &nbsp;</th> 
                     <td class="sm" valign="top">
                        <a href="/servlets/Community?action=view&type=<%= attribution.getCommunityLinkType() %>&communityID=<%= attribution.getCommunityId().toString() %>"><%= attribution.getCommunity().getName() %></a><br>
	  		<%= address != null ? EmptyTextConverter.convert( TextConverter.dbToHTML( address.getAddress() ) ) : "" %><br>
          		<%= address != null ? EmptyTextConverter.convert( address.getCity() ) : "" %><br>
	  		<%= address != null ? EmptyTextConverter.convert( address.getRegion() ) : "" %>&nbsp;<%= address != null ? EmptyTextConverter.convert( address.getPostalCode() ) : "" %><br>
          		<%= address != null && address.getCountryObject() != null ? EmptyTextConverter.convert( address.getCountryObject().getName() ) : "" %><br>
                        <% if ( attribution.getCommunity().getEmail() != null ) { %>
                          <a href="mailto:<%= attribution.getCommunity().getEmail() %>"><%= attribution.getCommunity().getEmail() %></a><br>
                        <% } %>

                        <% if ( attribution.getCommunity().getUrl().size() > 0 ) {
                              Iterator urlIter = attribution.getCommunity().getUrl().iterator();
                              while ( urlIter.hasNext() ) {
	    		         BsUrl url = (BsUrl) urlIter.next();
                         %>
	  		      <%= HTMLFactory.urlToHTML( url.getUrl(), url.getWebSiteName() ) %><br>
          	            <% } %>       
         	        <% } %>       
                      </TD>
                     <td class="sm" nowrap>&nbsp; &nbsp;</td>
                     <td class="sm" valign="top"><%=TextConverter.dateToString( attribution.getAttributionDate())%></td>
                  </tr>
                <% } %>
               </table>
             </td>
            </tr>
	<% } %>

       <!-- communication -->
     <% if ( detail.hasCommunicationReferences() ) { %>  
       <tr <%= myBgColor.toggleBgColor() %> >
	 <th class="sm" valign="top" align="left">Communication</th>
	 <td class="sm">&nbsp;&nbsp;</td>
	 <td class="sm">
       	 <table> 
            <tr align="left">
	       <th class="sm">Name</th>
	       <th class="sm" nowrap>&nbsp; &nbsp;</th>
	       <th class="sm">Author Name</th>
	       <th class="sm" nowrap>&nbsp; &nbsp;</th>
               <th class="sm">date</th>
	     </tr>
	    
        <%
             Iterator comIter = detail.getCommunicationReferences() ;
             while ( comIter.hasNext() ) {
                CommunicationObject  communication = (CommunicationObject)comIter.next();
        %>

	     <tr>
	        <td class="sm"><a href=/servlets/TairObject?type=communication&id=<%= communication.get_reference_id() %>><%= EmptyTextConverter.convert(communication.get_name() )%></a></td>
 	        <td class="sm" nowrap>&nbsp; &nbsp;</th>
                <td class="sm"><%=EmptyTextConverter.convert( communication.get_author_name() )%></td>
                <td class="sm" nowrap>&nbsp; &nbsp;</td>
               
                <td class="sm"><%= EmptyTextConverter.convert( communication.get_date() ) %></td>
             </tr>
         <% } %>
          </table>
	 </td>
       </tr>
   <% } %>
  
   <!-- publication -->
   <% if ( detail.hasPublications() ) { %>
      <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" valign="top" align="left">Reference</th>
	<td class="sm">&nbsp;&nbsp;</td>
	<td class="sm">
	     <table>
             <% Iterator pubIter = detail.getPublications();
                while ( pubIter.hasNext() ) {
	            PublicationObject publication = (PublicationObject) pubIter.next();
               %>
             
	        <tr>
	          <td class="sm">
                    <%= EmptyTextConverter.convert( publication.get_authors() ) %>
                    <%= EmptyTextConverter.convert( publication.get_year() ) %>
	            <%= EmptyTextConverter.convert( publication.get_title() ) %>
                    <%= EmptyTextConverter.convert( publication.get_pub_source_name() ) %>
	            <%= EmptyTextConverter.convert( publication.get_volume() ) %>
                    <%= EmptyTextConverter.convert( publication.get_page_start() ) %>
                  </td>
              </tr>
  
             <% } %>
           </table>
	 </td>
      </tr>
    <% } %>


</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
