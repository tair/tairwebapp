<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%!
String pageName = "Stocks";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%= cssfile %>" />
<jsp:param name="id" value="100" />
</jsp:include>

<jsp:include page="/jsp/includes/stockSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="" />
</jsp:include>

<div id="rightcolumn">


<span class="mainheader">ABRC Stocks Overview</span>
<p>

The <a href="http://abrc.osu.edu/">Arabidopsis Biological Resource Center (ABRC)</a> at <a href="http://www.osu.edu/">The Ohio State University</a> provides the following services to the Arabidopsis community: 1) Collection, preservation and distribution of seeds; 2) Storage and distribution of DNA clones and libraries; and 3) Curation of data for stocks, orders and related information. 
Primary support of the ABRC is provided by a <a href="http://www.nsf.gov">National Science Foundation</a> grant.
</p>
<dl>
<dt><a href="https://abrc.osu.edu/"> ABRC Home</a>
<dd>Link to the ABRC home page at The Ohio State University. 
<dt><a href="/servlets/Order?state=catalog">Browse ABRC Catalog</a>
<dd>An online catalog of ABRC stocks compiled from the TAIR database. 
<dt><a href="/abrc/major_stocks.jsp">Supplement to ABRC Catalog</a>
<dd>Additional information not included in the ABRC catalog on insertion lines, RI lines and other seed stocks.
<dt><a href="/servlets/Search?action=new_search&type=dna">Search ABRC DNA/Clones Stocks</a>
<dd>Use the TAIR DNA search to find DNA resources including clones, libraries, genomic DNA, and filters, many of which are available as stocks from ABRC. To restrict your search to stocks that can be ordered through the TAIR web site, check the "is ABRC stock" option in the "Restrict by Features" section of the search form.
<dt><a href="/servlets/Search?action=new_search&type=germplasm">Search ABRC Seed/Germplasm Stocks</a>
<dd>Use the TAIR Germplasm search to find seed stocks of Arabidopsis thaliana and other species including species variants, mutant lines and mapping resources, most of which are available as stocks from ABRC. To restrict your search to stocks that can be ordered through the TAIR web site, check the "is ABRC stock" option in the "Restrict by Features" section of the search form.
<dt><a href="/servlets/Order?state=search&mode=stock_number">ABRC Stock Order History</a>
<dd>Search the order history of any stock by stock number. Dates of orders and the names of any laboratories that have ordered the s
tock are returned.
<dt><a href="https://abrc.osu.edu/fee-structure">ABRC Fee Structure</a>
<dd>A summary of ABRC stock, order and shipping fees.
<dt><a href="/servlets/Order?state=view">Place ABRC Order</a>
<dd>Registered users, log in to place an order for ABRC stocks and enter payment information via a secure online form.
<dt><a href="/servlets/Order?state=search&mode=user">Search My ABRC Orders</a>
<dd>Registered users, log in to search your current and past ABRC orders by order date, order number or stock number.
<dt><a href="/user_invoice_form.jsp">Search ABRC Invoices</a>
<dd>Search for an ABRC invoice by invoice number or order number. Invoices are available only for orders where all stocks have been shipped.
<dt><a href="https://abrc.osu.edu/how-make-payments">How to Make Payments to ABRC</a>
<dd>Instructions for making check or credit card payments to ABRC.
<dt><a href="https://abrc.osu.edu/donate-stocks">ABRC Stock Donation</a>
<dd>Forms and instructions for seed and DNA stock donation.



</dl>
<center>Last modified on October 5, 2006</center>
		</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
