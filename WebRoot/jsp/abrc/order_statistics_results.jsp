<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, org.tair.abrc.stock.*, java.util.*" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%!
String pageName = "User Orders Management System";
String highlight = "7";
%>

<%
// Generic page to display results of statistics search for number 
// of orders and stocks placed within result set.  Since statistics
// display is simple, this page should work for all search modes that
// use statistics search
SearchResultsCollection searchCollection = (SearchResultsCollection) request.getAttribute( "searchCollection" );

int numberStocks = searchCollection.getResultSize();
int numberOrders = searchCollection.getSecondaryResultSize();
String searchCriteria = searchCollection.getSearchCriteria();

// get search URL & querystring params for returning to correct search
String searchPage = (String) request.getAttribute( "searchPage" );
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


<table cellpadding="2" align="center" border="0" width="100%">
	<tr>
	  <td class="sm" align="center">
	    <font class="mainheader">User Orders Management System</font>
          </td>
        </tr>

        <tr>
          <td class="sm">
	    <p>
	    <%= searchCriteria %>
	  </td>

	</tr>	

	<tr>
	  <td>&nbsp;</td>
	</tr>

        <tr>
	  <td>
             <table align="center">
                  <tr>
                     <th align="right">Total # of Stocks Items shipped:</font></th>
                     <td><%= numberStocks %></td>
                  </tr>

                  <tr>
                     <th align="right">Total # of Orders shipped:</font></th>
                     <td><%= numberOrders %></td>
                  </tr>
             </table>
          </td>
        </tr>

	<tr>
	  <td>&nbsp;</td>
	</tr>
	
	<tr>
	  <td align="center">
	<form>

	  <input type="button" value="Search Again" onClick="document.location.href='<%= searchPage %>'">
	</form>
	</td>
      </tr>
    </table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
