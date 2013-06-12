<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2001 NCGR.  All rights
  reserved.
-->


<%@ page import = "java.util.Iterator, org.tair.abrc.stock.UnorderedStock, org.tair.abrc.OrderFormValidator, org.tair.abrc.CompositeOrder, org.tair.abrc.stock.Stock, org.tair.utilities.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "New/Update Order";
String highlight = "1";
%>

<%
CompositeOrder order = (CompositeOrder) session.getAttribute( "order" );
if ( order == null ) {
      InvalidSessionException e  = new InvalidSessionException( "No order in session for this user" );
      request.setAttribute( "exception", e );
      pageContext.forward( "/jsp/common/session_error.jsp" );
}


// show NASC message if stock center chosen as NASC
String seed_stock_center = order.get_seed_stock_center();
boolean NASC = ( seed_stock_center != null && seed_stock_center.equals( DataConstants.getNASCStockCenter() ) );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<form action="/servlets/Order" method="post">
<input type="hidden" name="state" value="updateOrder">

<table align="center">
        <tr>
          <td class="sm" align="center"><font class="mainheader">New/Update Order</font></td>
        </tr>
        <tr>
          <td class="sm" align="center">Please use the buttons provided to navigate through these screens.<br>  
          DO NOT use the back button on your browser unless prompted to do so.</td>
		</tr>
        <tr>
          <td>
            <!--**will only display if lab is located in Europe.**-->
            <% if ( NASC ) { %>
              <p>
              NOTE: According to our records, your lab is located in Europe.   
              You can no longer order seed stocks through TAIR.  Please order 
              directly from NASC at <a href="http://www.arabidopsis.info">http://www.arabidopsis.info</a>.  All DNA 
              orders placed through TAIR will be shipped by ABRC.
            <% } %>
          </td>
        </tr>
</table>

<br>
<table cellpadding="3" border="0" align="center"  cellspacing="0" width="100%">


      <tr bgcolor="<%= DataConstants.BGCOLOR %>">
        <td class="sm" colspan="2" align="center"><font class="header">Order Contents/Charges</font></td>
      </tr>

      <tr bgcolor="<%= DataConstants.BGCOLOR %>">
          <td class="sm" colspan="2" align="center">

         <!-- display stocks and charges with checkboxes for deletings stocks from order -->
             <% if ( order.hasStocks() ) { %>
              <jsp:include page="/jsp/abrc/order_summary_include.jsp" flush="true">
                <jsp:param name="showDelete" value="true" />
                <jsp:param name="editable" value="true" />
                <jsp:param name="useStatusLogic" value="true" />
              </jsp:include>


              <br>

              <!-- display dna/seed stock counts -->
              <jsp:include page="/jsp/abrc/stock_count_include.jsp" flush="true" />

          <% } else { %>

             No stocks currently in order.

        <% } %>

        </td>
      </tr>

      <tr bgcolor="<%= DataConstants.BGCOLOR %>">
        <td class="sm" colspan="2">&nbsp;</td>
      </tr>

      <tr bgcolor="<%= DataConstants.BGCOLOR %>">
                <td class="sm" colspan="2">&nbsp;</td>
      </tr>
        <!-- display stocks not ordered for any reason -->
      <tr bgcolor="<%= DataConstants.BGCOLOR %>">
        <td class="sm" colspan="2"><jsp:include page="/jsp/abrc/unordered_stock_include.jsp" flush="true" />&nbsp;</td>
      </tr>
      
      <tr  bgcolor="<%= DataConstants.BGCOLOR %>">
                <td class="sm"><font class="header">Add Stocks to Order</font></td>
        <td class="sm"><font class="header">Order Comments</font></td>
      </tr>

      <tr valign="bottom" bgcolor="<%= DataConstants.BGCOLOR %>">
                <td class="sm">
                Type Stock #s below <br>
                and click on Continue with Order.<br>
                (Separate stock #'s by returns).<br>
                <textarea name="stock_number" wrap="virtual" cols="30" rows="5"></textarea>
         </td>
                <td class="sm">
                (Stock #s entered here will NOT<br>
                be added to your order).<br><br>
                <textarea name="orderer_comments" wrap="virtual" cols="30" rows="5"><%= EmptyTextConverter.convert( TextConverter.dbToText( order.get_orderer_comments() ) ) %></textarea>
                </td>
      </tr>

     <!-- If order is placed by curator on behalf of user,
          allow curator to add comments and waive charges -->
     <% if ( order.getProxyOrder() ) { %>
      <tr valign="bottom" bgcolor="<%= DataConstants.BGCOLOR %>">
          <td class="sm">
              ABRC Comments:<br>
              <textarea name="ABRC_comments" wrap="virtual" cols="30" rows="5"><%= EmptyTextConverter.convert( TextConverter.dbToText( order.
get_ABRC_comments() ) ) %></textarea>
           </td>

           <td class="sm">
              ABRC Public Comments:<br>
              <textarea name="ABRC_public_comments" wrap="virtual" cols="30" rows="5"><%= EmptyTextConverter.convert( TextConverter.dbToText(
 order.get_ABRC_public_comments() ) ) %></textarea>
           </td>
       </tr>

       <tr bgcolor="<%= DataConstants.BGCOLOR %>">
           <td class="sm" colspan="2">
              Waive Order Charges?
              &nbsp;&nbsp;
              <%= HTMLFactory.createCheckBox( "no_charge", "true", order.get_no_charge() ) %>
           </td>

      <% } %>

      <tr bgcolor="<%= DataConstants.BGCOLOR %>">
           <td colspan="2">
            <p>
          </td>
      </tr>
      <tr bgcolor="<%= DataConstants.BGCOLOR %>">
        <td class="sm" colspan="2">&nbsp;</td>
      </tr>
        <tr>
                <td class="sm" align="left" colspan="2">
                <b>You may leave this page to search or browse, and return at any time by
                clicking on "My Home" and then "View Current Order".</b>
                </td>
        </tr>
        <tr>
      <td class="sm" align="center" colspan="2">
          <input type="submit" name="submit" value="Continue with Order">
          &nbsp;&nbsp;
          <input type="button" value="Search database" onClick="document.location.href='/index.jsp'">
                &nbsp;&nbsp;
          <input type="button" value="Browse ABRC Catalog" onClick="document.location.href='/servlets/Order?state=catalog'">
          <input type="button" value="Cancel Order" onClick="document.location.href='/servlets/Order/cancel'">
        </td>
   </tr>

</table>


</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
