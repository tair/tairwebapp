<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page 
errorPage = "/jsp/common/gen_error.jsp" 
import = "org.tair.tfc.*, org.tair.community.*, org.tair.querytools.*, org.tair.utilities.*, java.net.*, java.util.*, org.tair.bs.community.*" 
%>


<%!
String pageName = "Protocol Detail";
%>

<% ProtocolDetail detail = (ProtocolDetail) request.getAttribute("detail" ); %> 

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<table width="100%" border="0" colspan="2" cellspacing="0" >

  <tr>
    <td colspan="3"><b><font size="+1">Protocol:<%= detail.get_protocol_title() %></font></b></td>
  </tr>

  <tr <%=myBgColor.toggleBgColor()%> >
    <th class="sm" align="left" valign="top">TAIR Accession</th>
    <td class="sm">&nbsp;&nbsp;</td>	
    <td class="sm" ><%= detail.getAccession() %></td>
  </tr>

  <% if ( detail.get_protocol_authors() != null) { %>
  <tr <%= myBgColor.toggleBgColor() %> >
    <th class="sm" align="left" nowrap>Author(s) <%=DefinitionsLookup.createPopupLink("Protocol","authors")%></th>
    <td class="sm">&nbsp;</td>
    <td class="sm"><%= detail.get_protocol_authors() %></td>
  </tr>
  <% } %>

  <% if ( detail.get_date_last_modified() != null) { %>
  <tr <%=myBgColor.toggleBgColor()%> >
    <th class="sm" align="left" nowrap>Date last modified</th>
    <td class="sm">&nbsp;&nbsp;</td>	
    <td class="sm" ><%= detail.get_date_last_modified() %></td>
  </tr>
  <% } %>

  <% if ( detail.getCommunities() != null ) { %>  
    <tr <%=myBgColor.toggleBgColor() %> valign="top">
      <th class="sm" align="left" nowrap>Community</th>
	  <td class="sm">&nbsp;</td>
	  <td class="sm">
            <table width="100%" cellpadding="1" cellspacing="0" border="0">
	      <tr>
	         <th class="sm" align="left">name</th>
	         <th class="sm" align="left">email</th>
              </tr>
       
              <% Iterator commIter = detail.getCommunities();	
                 while ( commIter.hasNext() ) {
	            ListCommunity comm = (ListCommunity) commIter.next(); 
              %>

              <tr>
               <td class="sm"><a href="/servlets/TairObject?type=<%= comm.getCommunityType() %>&id=<%= comm.getCommunityID() %>"><%= EmptyTextConverter.convert( comm.getDisplayName() ) %></a></td>
               <td class="sm"><%= EmptyTextConverter.convert( comm.getEmail() )%></td>
             </tr>             

             <% } %>
        </table>
     </td>
  </tr>   
  <% } %>

  <% if ( detail.get_protocol_description() != null) { %>
  <tr <%=myBgColor.toggleBgColor()%> >
    <th class="sm" align="left" nowrap valign="top">Description<%=DefinitionsLookup.createPopupLink("Protocol","description")%></th>
    <td class="sm">&nbsp;&nbsp;</td>	
    <td class="sm" ><%= detail.get_protocol_description() %></td>
  </tr>
  <% } %>

  <% if ( detail.get_protocol_usage() != null) { %>
  <tr <%=myBgColor.toggleBgColor()%> >
    <th class="sm" align="left" nowrap>Usage<%=DefinitionsLookup.createPopupLink("Protocol","usage")%></th>
    <td class="sm">&nbsp;&nbsp;</td>	
    <td class="sm" ><%= detail.get_protocol_usage() %></td>
  </tr>
  <% } %>
 
  <% if ( detail.get_protocol_methods() != null) { %>
  <tr <%=myBgColor.toggleBgColor()%> >
    <th class="sm" align="left" nowrap>Methods<%=DefinitionsLookup.createPopupLink("Protocol","method")%></th>
    <td class="sm">&nbsp;&nbsp;</td>	
    <td class="sm" ><%= detail.get_protocol_methods() %></td>
  </tr>
  <% } %>
 
  <% if ( detail.get_protocol_pubmed_id() != null ) { %>
  <tr <%=myBgColor.toggleBgColor() %> >
    <th class="sm" align="left" nowrap>PubMed ID</th>
    <td class="sm">&nbsp;&nbsp;</td>	
    <td class="sm"><a href="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=<%= detail.get_protocol_pubmed_id() %>&dopt=Abstract"><%= detail.get_protocol_pubmed_id() %></a></td>
  </tr>
  <% } %>

 <!-- publication -->
  <% if ( detail.hasPublication() ) { %>
  <tr <%=myBgColor.toggleBgColor() %> >
    <th class="sm" align="left" nowrap>Publication<%=DefinitionsLookup.createPopupLink("Protocol","publication_id")%></th>
    <td class="sm">&nbsp;&nbsp;</td>	
    <td class="sm" ><a href="/servlets/TairObject?type=publication&id=<%= detail.get_publication_reference_id() %>"><%= detail.get_publication_title() %></a></td>
  </tr>
  <% } %>


 <!-- communication -->
  <% if ( detail.hasCommunication() ) { %>
  <tr>
    <th class="sm" align="left" valign="top">Communication</th>
    <td class="sm">&nbsp;&nbsp;</td>	
    <td class="sm"><a href="/servlets/TairObject?type=communication&id=<%= detail.get_communication_reference_id() %>"><%= detail.get_communication_name() %></a></td>
  </tr>
  <% }  %>
  
  <% if ( detail.hasURLs() ) { %>
  <tr <%=myBgColor.toggleBgColor() %> valign="top">
    <th class="sm" align="left" valign="top" nowrap>Download/View</th>
    <td class="sm">&nbsp;&nbsp;</td>
    <td class="sm">
      <% Iterator urlIter = detail.get_url_references();
         boolean firstURL = true;
         while ( urlIter.hasNext() ) {
           ReferenceURL url = (ReferenceURL) urlIter.next(); 
           if ( !firstURL ) {
             out.print( "<br>" );
           }
           out.print( HTMLFactory.urlToHTML( url.getUrl().getUrl(), url.getUrl().getWebSiteName() ) );
           firstURL = false;
         } 
       %>
    </td>
  </tr>
  <% } %>

 <!-- keywords -->
 <% if ( detail.hasKeywords() ) { %>
    <tr <%= myBgColor.toggleBgColor() %> valign=top>
       <th class="sm" valign="top" align="left">Associated Keywords<%=DefinitionsLookup.createPopupLink("Keyword","keyword")%></th>
       <td class="sm">&nbsp;</td>
       <td class="sm">  
   <%  Iterator keywordIter = detail.getKeywords();
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
</table>
	
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

