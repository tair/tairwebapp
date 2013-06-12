<%@ page contentType="text/html; charset=UTF-8" %>
<!-- Generic code for displaying lists of stocks not ordered for any reason -->

<%@ page import="org.tair.utilities.*, org.tair.abrc.stock.*, java.util.*" %>


<%
// Unordered stock collection might be in request, session or in an EmptyOrderException
// depending on page that contains include. Check all possibilities.

UnorderedStock unordered = (UnorderedStock) request.getAttribute( "unordered" );

if ( unordered == null ) {
      unordered = (UnorderedStock) session.getAttribute( "unordered" );
      
      // if we found it in session, remove it to avoid future confusion
      if ( unordered != null ) { 
           session.removeAttribute( "unordered" );
      }
}

if ( unordered == null ) {
    EmptyOrderException e = (EmptyOrderException) request.getAttribute( "exception" );
    if ( e != null && e.hasUnordered() ) {
        unordered = e.getUnordered();
    }
}


%>

<table align="center" width="85%" border="0" bgcolor="#D5D9DD">
<% if ( unordered != null && !unordered.isEmpty() ) { %>


      <tr>
           <td colspan="2">
              The following stocks were <b>not</b> added to your order:</font>
              <br><br>
           </td>
      </tr>

       <tr>
           <td><font class="formheader">Stock #</font></td>
           <td><font class="formheader">Reason</font></td>
       </tr>

    <% 
       if ( unordered.hasInvalidStock() ) { 
           for ( Iterator iter = unordered.getInvalidStock(); iter.hasNext(); ) { 
    %>

          <tr>
             <td><%= (String) iter.next() %></td>
             <td>Stock number not found</td>
          </tr>
        
         <% } %>

    <% } %>


    <%  if ( unordered.hasfwtoNASCStock() ) { 
           for ( Iterator iter = unordered.getfwtoNASCStock(); iter.hasNext(); ) { 
                 Stock stock = (Stock) iter.next();
    %>

          <tr>
             <td><%= stock.get_name() %></td>
             <td>order directly from NASC </td>                       
          </tr>
        
         <% } %>

    <% } %>
    <%  if ( unordered.hasUnavailableStock() ) { 
           for ( Iterator iter = unordered.getUnavailableStock(); iter.hasNext(); ) { 
                 Stock stock = (Stock) iter.next();
    %>

          <tr>
             <td><%= stock.get_name() %></td>
             <td><%= stock.get_stock_availability_type() %></td>                       
          </tr>
        
         <% } %>

    <% } %>


    <%
       if ( unordered.hasRestrictedStock() ) { 
           for ( Iterator iter = unordered.getRestrictedStock(); iter.hasNext(); ) { 
                 Stock stock = (Stock) iter.next();
    %>

          <tr>
             <td><%= stock.get_name() %></td>
              <td>restricted to academic labs</td>
          </tr>
        
         <% } %>

    <% } %>



 <% } %>
    </table>
