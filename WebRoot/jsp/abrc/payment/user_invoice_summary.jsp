<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, org.tair.community.*, org.tair.search.*, org.tair.abrc.payment.*, java.util.*, java.text.*, java.math.*, org.tair.bs.community.*"%>
<%
String pageName = "ABRC Invoice Search Results";
%>

<% 
// get results of search
String summaryType = "invoice";
String queryId = (String) request.getAttribute( "query_id" );
String searchCriteria = ( request.getAttribute( "searchCriteria" ) != null ) ? ( String )request.getAttribute( "searchCriteria" ) : " ";
BsPerson person = (BsPerson) request.getAttribute( "person" );
BsAddress personAddress = person != null ? person.getCommunity().getAddress() : null;
BsOrganization organization = (BsOrganization) request.getAttribute("lab");
BsAddress orgAddress = organization != null ? organization.getCommunity().getAddress() : null;
int currentPage = ( request.getAttribute( "pageNum" ) != null ) ? ( ( Integer )request.getAttribute( "pageNum" ) ).intValue() : 1;
String isLabSearch = (request.getAttribute("is_lab_search") != null ) ? (String) request.getAttribute( "is_lab_search" ) : "";
ISearchResultsManager<InvoiceSearchResult, Long> results = SessionHandler.getSearchSession(request).getInvoiceResultsManager(queryId);
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<table align="center" border="0" cellpadding="3" width="600">
    <tr>
        <td colspan="2" align="center" nowrap class="sm"><font class="mainheader">ABRC User Invoice Search</font></td>
    </tr>    
    
    <tr>
        <td> &nbsp;
    </tr>

    <tr>
        <% if ( results.size() > 0 ) { %>
        <td colspan="2" align="center">Click on the invoice # to view and print an individual invoice. </td>  
        <% }else{ %>
        <td colspan="2" align="center">Your search did not yield any results. </td>  
        <% } %>
    </tr>      
    
    <tr>
        <td> &nbsp;</td>
    </tr>
    
    <% if (!isLabSearch.equals("true") ){ %>
        <tr valign="top">
            <td>                                                                                                                                                                               
            <font class="formheader">Personal Information</font><br>                                                                                                                                            
        
            <a href="/servlets/TairObject?type=person&id=<%= person.getCommunityId()%>"><%= person.getCommunity().getName() %></a>                                                                                         
            <%= EmptyTextConverter.convert( person.getSuffix() ) %><br>                                                                                                                                       
            <%= personAddress != null ? EmptyTextConverter.convert( TextConverter.dbToHTML( personAddress.getAddress() ) ) : "" %><br>                                                                                                            
            <%= personAddress != null ? EmptyTextConverter.convert( personAddress.getCity() ) : "" %>                                                                                                                                             
            <% if ( personAddress != null && personAddress.getRegion() != null ) { %>, <%= personAddress.getRegion() %><% } %>                                                                                                                      
            &nbsp; <%= personAddress != null ? EmptyTextConverter.convert( personAddress.getPostalCode() ) : "" %><br>                                                                                                                           
            <%= personAddress != null ? EmptyTextConverter.convert( personAddress.getCountryObject().getName()) : ""  %><br><br>                                                                                                                                  
            </td>            
           
            <td>                                                                                                                                                                               
                <%
                boolean first = true;
                for (BsAffiliation lab : person.getActiveLabs()) {
                  if (first) {
                %>
                <font class="formheader">Lab Affiliation</font>                                                                                                                                     
                <% } %>
                    <br>                                                                                                                                                                                               
                    <a href="/servlets/TairObject?type=organization&id=<%= lab.getOrganization().getCommunityId() %>"><%= lab.getOrganization().getName() %></a>                                                            
                <% } %>
            </td> 
        </tr>
    <% } else { %>
        <tr align=center>
            <td align="center" class="sm">
                <font class="formheader">Lab Information</font>
                <br>
                <a href="/servlets/TairObject?type=organization&id=<%= organization.getCommunityId() %>"><%= organization.getName() %></a><br>
                <%= orgAddress != null ? EmptyTextConverter.convert( TextConverter.dbToHTML( orgAddress.getAddress() ) ) : "" %><br>
                <%= orgAddress != null ? EmptyTextConverter.convert( orgAddress.getCity() ) : ""%>
                <% if ( orgAddress != null && orgAddress.getRegion() != null ) {%>, <%= orgAddress.getRegion() %><% } %>
                &nbsp; <%= orgAddress != null ? EmptyTextConverter.convert( orgAddress.getPostalCode() ) : "" %><br>
                <%= orgAddress != null && orgAddress.getCountryObject() != null ? EmptyTextConverter.convert( orgAddress.getCountryObject().getName() ) : "" %>
                <br> &nbsp; <br>
            </td>
        </tr>
    <% } %>
            
</table>

    
    <%-- ACTUALLY DISPLAYING THE INVOICES --%>
    <% 
    if ( results.size() > 0 ) { 
    BigDecimal total = BigDecimal.ZERO;
    %>
    <table align="center" border="2">
        <tr>
            <th align="center">Invoice #</th>
            <th align="center">Date</th>
            <th align="center">Order #</th>
            <% if (isLabSearch.equals("true") ){ %>
                <th align="center">Ordered By</th>
            <% } else { %>
                <th align="center">Billed to</th>
            <% } %>
            <th align="center">Invoice Total</th>
            <th align="center">Amount Due</th>
        </tr>
    
        <%for (InvoiceSearchResult result : results) { 
        	Format format = new SimpleDateFormat("MM/dd/yyyy");
		    java.sql.Timestamp date = result.getDateInvoiceCreated();
		    String dateStr = date != null ? format.format(date) : "&nbsp;";
        %>
        <tr>
            <td class="sm" align="center">
                <A href="/servlets/Search?type=invoice&orders_id=<%=result.getOrdersId()%>&search_action=userdetail" target="_blank">
                <%=result.getId()%></A>
            </td>
            
            <td class="sm" nowrap align="center" ><%=dateStr%></td>
            
            <td class="sm" align="center" >
                <A href="/servlets/Order?state=search&search_action=detail&mode=user&orders_id=<%=result.getOrdersId()%>" target="_blank">
                <%=result.getOrderNumber()%></A>
            </td>
            
            <% if (isLabSearch.equals("true") ){ %>
            <td class="sm" align="center"><%=result.getPersonName()%></td>
            <% }else{ %>
            <td class="sm" align="center" ><%=result.getLabName()%></td>
            <% } %>

            <td class="sm" align="right" ><%=result.getInvoiceTotal()%></td>

            <td class="sm" align="right" ><%=result.getBalanceDue().setScale(2, RoundingMode.HALF_UP)%></td>
            <%
            BigDecimal balanceDue = result.getBalanceDue();
            if (balanceDue != null) {
                total = total.add(balanceDue).setScale(2, RoundingMode.HALF_UP);
            }
            %>
        </tr>
        <% }%>
        <tr>
            <td colspan="6">&nbsp;</td>
        </tr>
        <tr> 
            <td colspan="6" align="right"><b>TOTAL AMOUNT DUE: $<%=total%></b></td>
        </tr>
    </table>
    <% } %>

    
    <%-- DISPLAY TEXT ON THE BOTTOM --%>
    <table align="center" border="0" cellpadding="3" width="600">
    <tr>
        <td>
        <br><br>
        Payments for individual invoices can be made with a credit card from the invoice detail page.  If you would like to pay for multiple invoices without 
        entering credit card information for every invoice, please send a check to us.  Be sure to include the invoice # with the check. 
        <a href="https://abrc.osu.edu/how-make-payments"> Details on how to make payments.</a>
        <br><br>
        Alternatively, you can print this page and give it to the appropriate person for payment. He/she will need a login and password to access the invoice. 
        The invoice and receipt can be printed at TAIR (<a href="/">http://arabidopsis.org</a>), by accessing the 'Stocks' drop down menu, and clicking on "Search ABRC 
        Invoices". The invoice # or the order # can be entered and the invoice will be displayed. Thank you. 
        </td>
    </tr>
    </table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

