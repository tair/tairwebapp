<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.querytools.*, org.tair.utilities.*, java.util.*, org.tair.tfc.*, org.tair.bs.community.*"
%>

<%!
String pageName = "Host Strain Detail";
%>

<%
// Get detail object from request
HostStrainDetail detail = (HostStrainDetail) request.getAttribute("detail");

// Get Notepad display settings
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

<%@ include file="/jsp/includes/order_functions.jsp" %>

<table width="100%" border="0" colspan="2" cellspacing="0" >		

    <tr>
        <td colspan="3"><b><font size="+1">Host Strain: <%= detail.get_original_name() %></font></b></td>
    </tr>

    <tr <%= myBgColor.toggleBgColor() %> >  
        <th class="sm" align="left">Date last modified</th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm"><%= detail.get_date_last_modified() %></td>
    </tr>

    <tr <%= myBgColor.toggleBgColor() %> >  
        <th class="sm" align="left">Name</th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm"><%= detail.get_original_name() %></td>
    </tr>

   <% if ( detail.hasAliases() ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign=top">
        <th class="sm" align="left">Aliases</th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class=sm ><%= detail.get_alias_string() %></td>
    </tr>
   <% } %>

    <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" align="left">TAIR Accession</th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm"><%=  detail.getAccession() %></td>
    </tr>



   <% if ( detail.hasTaxon() ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign="top">
        <th class="sm" align="left">Taxon</th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm">
            <table cellpadding="2">
                <tr valign="botton">
                   <th class="sm" align="left">Genus</th>
                   <th class="sm" align="left">Species</th>
                   <th class="sm" align="left" nowrap>Common Name</th>
                   <th class="sm" align="left">Taxonomy</th>
                </tr>
 
                <tr valign="top">
                   <td class="sm"><%= EmptyTextConverter.convert( detail.get_genus() ) %></td>
                   <td class="sm"><%= EmptyTextConverter.convert( detail.get_species() ) %></td>
                   <td class="sm"><%= EmptyTextConverter.convert( detail.get_common_name() ) %></td>
                   <td class="sm"><%= EmptyTextConverter.convert( detail.get_taxonomy() ) %></td>
                </tr>
             </table>
        </td>
    </tr>
   <% } %>
       
   <% if ( detail.get_genotype() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign="top">
        <th class="sm" align="left">Genotype</th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm"><%= detail.get_genotype() %></td>
    </tr>
   <% } %>

   <% if ( detail.get_antibiotic_resistance() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign="top">
        <th class="sm" align="left">Antibiotic Resistance</th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm"><%= detail.get_antibiotic_resistance() %></td>
    </tr>
   <% } %>

   <% if ( detail.get_media() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign="top">
        <th class="sm" align="left">Media</th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm"><%= detail.get_media() %></td>
    </tr>
   <% } %>


   <% if ( detail.get_growth_temperature() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign="top">
        <th class="sm" align="left">Growth Temperature</th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm"><%= detail.get_growth_temperature() %></td>
    </tr>
   <% } %>


   <% if ( detail.get_description() != null ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign="top">
        <th class="sm" align="left">Description</th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm"><%= detail.get_description() %></td>
    </tr>
   <% } %>
   
    <!-- images -->
    <% if ( detail.hasImages() ) { %>
        <tr <%= myBgColor.toggleBgColor() %> valign="top">
        <th class="sm" align="left">Images</th>
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm">
        <% Iterator imageIter = detail.getImages();
        TfcImage image = null;
        while ( imageIter.hasNext() ) {
            image = (TfcImage) imageIter.next();
    %>
            <% if ( image.hasThumbnail() ) { %>
                <a href="/jsp/common/image.jsp?id=<%= image.get_image_id() %>&format=<%= image.getLinkSuffix() %>">
                <img src="/servlets/images/thumb_<%= image.get_image_id() %>.<%= image.getLinkSuffix() %>" border="0"></a>
            <% } else { %>
                <a href="/jsp/common/image.jsp?id=<%= image.get_image_id() %>&format=<%= image.getLinkSuffix() %>">View Image</a>
            <% } %>
        <% } %>
        </td>
        </tr>
    <% } %>

   <% if ( detail.has_external_links() ) { %>
    <tr <%= myBgColor.toggleBgColor() %> >
        <th class="sm" align="left" valign=top">External Link</th> 
        <td class="sm">&nbsp;&nbsp;</td>
        <td class="sm">
           <table>
             <% Iterator iter = detail.get_external_links();
                while ( iter.hasNext() ) {
                    ExternalLinkObject elo = (ExternalLinkObject) iter.next();
                    String web_site_name = elo.get_web_site_name();
             %>

                <tr> 
                   <td class="sm"><%= elo.get_external_HTML_link( web_site_name ) %></td>
                </tr> 

             <% } %>

           </table>
       </td>
    </tr>
   <% } %>

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
                   Iterator annotationIter = detail.get_annotations();
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


   <% String commentColor =  myBgColor.toggleBgColor(); %>
    <tr <%= commentColor %>  valign="top">
        <th class="sm" align="left">Comments (shows only the most recent comments by default)
           <form action="/servlets/updater" method="post">  
             <input type="hidden" name="type" value="notepad">
             <input type="hidden" name="update_action" value="add">
             <input type="hidden" name="tair_object_id" value="<%= detail.get_tair_object_id() %>">
             <input type="hidden" name="accession" value="<%= detail.getAccession() %>" >

            <% String hideText = hidden ? "Show Comments" : "Hide Comments"; %>
            <% boolean hideOption = !hidden; %>
            <% String allText = showAll ? "Show Recent Comments" : "Show All Comments"; %>
            <% boolean showAllOption = !showAll; %>

        </th>

        <% if ( !hidden && detail.hasNotepad() ) { %>
                <td class="sm">&nbsp;</td>
                <td class="sm">
                  <table cellpadding="2" width="100%">
                    <tr align="left">
                      <th class="sm">entered by</th>
	              <th class="sm">date</th>
	              <th class="sm">comment</th>
	            </tr>
                 <%                          
                   Iterator noteIter = detail.getNotepad( showAll );
                   Notepad note = null;
                   while ( noteIter.hasNext() ) {
                      note = (Notepad) noteIter.next();
                      String display_note = note.get_comment() ;
                      if ( display_note.length() > 100){
                          display_note =  TextConverter.truncateString( note.get_comment(), 100 );
                      }
                 %>
		        <tr valign="top">
                           <td class="sm" nowrap><a href="/servlets/TairObject?type=person&id=<%= note.get_community_id() %>"><%= note.get_person_name() %></a></td>
 	                   <td class="sm" nowrap><%= TextConverter.dateToString( note.get_date_entered() ) %></td>
                           <td class="sm"><a href="/servlets/TairObject?type=notepad&id=<%= note.get_notepad_id() %>"><%= display_note  %></a></td> 
                        </tr>

                 <% } %>
                </table>
              </td>

        <% } else { %>
           <td class="sm" colspan="2"> &nbsp;
          </td>
        <% } %>
      </tr>

      <tr<%= commentColor  %>  valign="top"  %> 
          <td class="sm" colspan=3 align=center>
            <input type="submit" VALUE="Add My Comment">&nbsp;&nbsp;
            <input type="button" value="<%= hideText %>" onClick="document.location.href='/servlets/TairObject?accession=<%= detail.getAccession() %>&hideNote=<%= hideOption %>'">&nbsp;&nbsp;
            <input type="button" value="<%= allText %>" onClick="document.location.href='/servlets/TairObject?accession=<%= detail.getAccession() %>&showAllNote=<%= showAllOption %>'"> 
          </td>
      </tr>
   </form>
       

   <!-- attribution -->
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
                   for ( BsAttribution attribution : detail.get_attributions() ) {
                 %>
	            <tr>
 	                   <td class="sm"><%= EmptyTextConverter.convert( attribution.getType().getAttributionType() ) %></td>
  	                   <td class="sm" nowrap>&nbsp; &nbsp;</th>
                           <td class="sm"><a href="/servlets/TairObject?type=<%= attribution.getCommunityLinkType() %>&id=<%= attribution.getCommunityId().toString() %>"><%= attribution.getCommunity().getName() %></a></td>
 	                   <td class="sm" nowrap>&nbsp; &nbsp;</th>
                           <td class="sm"><%= TextConverter.dateToString( attribution.getAttributionDate() ) %></td>
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
             Iterator comIter = detail.get_communication_references() ;
             while ( comIter.hasNext() ) {
                CommunicationObject  communication = (CommunicationObject)comIter.next();
        %>

	     <tr>
	        <td class="sm"><a href="/servlets/TairObject?type=communication&id=<%= communication.get_reference_id() %>"><%= EmptyTextConverter.convert(communication.get_name() )%></a></td>
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
	  <th class="sm" valign="top" align="left">Publication</th>
	  <td class="sm">&nbsp;&nbsp;</td>
	  <td class="sm">
       	        <table>
	           <tr align="left">
	              <th class="sm">title</th>
	              <th class="sm" nowrap>&nbsp; &nbsp;</th>
	              <th class="sm">source</th>
	              <th class="sm" nowrap>&nbsp; &nbsp;</th>
	              <th class="sm">date</th>
	          </tr>

                  <%
                    Iterator pubIter = detail.get_publications();
                    while ( pubIter.hasNext() ) {
                         PublicationObject publication = (PublicationObject) pubIter.next();
		  %>

	          <tr>
	             <td class="sm"><a href="/servlets/TairObject?type=publication&id=<%= publication.get_reference_id() %>"><%= EmptyTextConverter.convert( publication.get_title() )%></a></td>
 	             <td class="sm" nowrap>&nbsp; &nbsp;</th>
                     <td class="sm"><%=EmptyTextConverter.convert( publication.get_pub_source_name() )%></td>
 	             <td class="sm" nowrap>&nbsp; &nbsp;</th>
                    <td class="sm"><%=EmptyTextConverter.convert( publication.get_year() )%></td>
                 </tr>
                <% } %>
                </table>
	     </td>
           </tr>
        <% } %>

 
   <!-- stock --> 
  <% if ( detail.hasStocks() ) { %>
     <% 
       Iterator stockIter = detail.getStocks(); 
       while ( stockIter.hasNext() ) {
          StockObject stock = (StockObject) stockIter.next();
     %>

      <tr <%= myBgColor.toggleBgColor() %> >
         <th class="sm" valign="top" align="left">Stock</th>
         <td class="sm">&nbsp;</td>
         <td class="sm">
            <table>
                <tr>
                    <th class="sm" align="left">Stock #<%= DefinitionsLookup.createPopupLink("Stock","name") %></th> 
	            <th class="sm">&nbsp;&nbsp;</th>
                    <th class="sm" align="left">Donor</th>
	            <th class="sm">&nbsp;&nbsp;</th>
                    <th class="sm" align="left">Donor Stock #</th>
                </tr>

                <tr>
                    <td class="sm"><a href="/servlets/TairObject?type=stock&id=<%= stock.get_stock_id() %>"><%= stock.get_name() %></a></td>
		    <td class="sm">&nbsp;&nbsp;</td>

                    <% if ( stock.hasDonors() ) { 
                           Donor donor = null;
                           boolean firstDonor = true;

                           // keep track of donor stock numbers and only show distinct numbers
                           List distinct = new ArrayList();
    		           String donorNumber = null;

                           for ( Iterator iter = stock.getDonors(); iter.hasNext(); ) {
                                donor = (Donor) iter.next();

		                donorNumber = donor.getDonorStockNumber();
		                if ( donorNumber == null || distinct.contains( donorNumber ) ) {
                                    donorNumber = "";
                                } else {
		                   distinct.add( donorNumber );
                                }

                                if ( !firstDonor ) { 
                    %>

                                   <tr>
                                       <td colspan="2">&nbsp;</td>
                             <% } %>
                          
                           <td class="sm"><a href="/servlets/TairObject?type=<%= donor.getCommunityType() %>&id=<%= donor.getCommunityID() %>"><%= donor.getDisplayName() %></td>
			   <td class="sm">&nbsp;&nbsp;</td>
                           <td class="sm"><%= donorNumber %></td>
                           
                             <% firstDonor = false; %>
                        <% } %>
                    <% } else { %>
                          <td colspan="3">&nbsp;</td>
                    <% } %>
                </tr>
           </table>
         </td>
      </tr>

      <tr>
         <td class="sm" colspan="3">
            <% if ( DataConstants.getAvailableStock().equals( stock.get_stock_availability_type() ) ) { %>
              <form action="/servlets/Order/current" onSubmit="orderFormWindow( this ) ">
                <input type="hidden" name="state" value="addStock">
                <input type="hidden" name="stock_number" value="<%= stock.get_name() %>">
	        <input type="submit" value="Order from ABRC">
              </form>
            <% } else { %>
               Stock not available for ordering
            <% } %>
         </td>
       </tr>
     <% } %>
   <% } else { %>
         <tr <%= myBgColor.toggleBgColor() %> >
          <th class="sm" valign="top" align="left">Stock</th>
          <td class="sm">&nbsp;</td>
          <td class="sm">not an ABRC stock</td>
       </tr>
   <% } %>
   
   <!-- URLs -->
   <% if ( detail.hasURLs() ) { %>
    <tr <%= myBgColor.toggleBgColor() %> >
    <th class="sm" valign="top" align="left">Associated URLs</th>
    <td>&nbsp;</td>
    <td clas="sm" align="left">
    <%
    Iterator urlIter = detail.getURLs();
    while ( urlIter.hasNext() ) {
        BsUrl url = (BsUrl) urlIter.next();
        if (url.getWebSiteName() == null || url.getWebSiteName() == ""){
        %>
            <a href="<%=url.getUrl()%>"><%=url.getUrl()%></a><br /><%
        }else{
        %>
            <a href="<%=url.getUrl()%>"><%=url.getWebSiteName()%></a><br /><%
        }
    }
    %>
    </td>
    </tr>
  <% } %>



 </table>      



<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


