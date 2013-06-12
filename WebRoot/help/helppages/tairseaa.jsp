<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="org.tair.utilities.*"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("");
setNext("initials.jsp");
writeHeader();
</script>
<title>TAIR navigation</title>
<!-- End of header -->
</head>

<body>
<br>

<h2><a name="contents"></a>Navigating TAIR pages</h2><hr>
<ul>Contents
<li><a href="#header">Using the navigation bar</a>
<li><a href="initials.jsp#447173">Using the Simple search</a>
<li><a href="#footer">Using the page footer</a>
</ul>
<h4><a name="header"></a>Using the navigation bar</h4>
<font class="cont">The navigation bar is found at the top of most TAIR pages. OIt can be used to rapidly move between different sections of the database, website and FTP site. Each page also includes the 'Quick Search' which allows you to search the database OR website, from any page. Click on any of the sections in the navigation bar shown below to see where each link is connected. For example click on <img src="/images/navbar/sitemap.gif"> to view the expanded list of contents for the website.</font>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true" />
</table><br><br>
<center><font class="cont">Each of the items in the toolbar is linked to a specific page or function at TAIR.</font><br></center>
<p>
<table width="602" border="1" align="center">
<tr><td><b>Item</b></td><td><b>Link/Function</b></td></tr>
<tr><td><img src="/images/navbar/home.gif"></td><td>Returns you to the TAIR home page (www.arabidopsis.org)</td></tr>
<tr><td><img src="/images/navbar/about.gif"></td><td>Takes you to website section with information about TAIR database,staff, software and data.</td></tr>
<tr><td><img src="/images/navbar/sitemap.gif"></td><td>Displays the major contents of the website</td></tr>
<tr><td><img src="/images/navbar/contact.gif"></td><td>Displays a list of snailmail/email addresses and phone numbers for TAIR collaborating organizations and staff members.</td></tr>
<tr><td><img src="/images/navbar/help.gif"></td><td>Opens a page with links to all help documents, TAIR glossary and related pages.</td></tr>
<tr><td><img src="/images/navbar/order.gif"></td><td>Use this to place an order if you already know the stock number you are looking for.If you are already logged in to TAIR- clicking this link will open a new (or in process) order form for ABRC stocks. If you are not logged in, you will first be prompted to login before you can place an order.You can also use this to access seed and DNA stock searches.</td></tr>
<tr><td><img src="/images/navbar/login.gif"></td><td>For registered users, this links to a login page where you can input your username and password. Login is required for ordering, updating personal information,registering gene symbols and making comments on detail pages.</td></tr>
<tr><td><img src="/images/navbar/myhome.gif"></td><td>This link displays only when you are logged into TAIR.Returns you to the 'Welcome' page where you can update your personal profile, register gene symbols, place orders and view your order history.</td></tr>
<tr><td><img src="/images/navbar/tairdb_g.gif"></td><td>Links to TAIR's general data/keyword search and to advanced searching for specific types of data.</td></tr>
<tr><td><img src="/images/navbar/logout.gif"></td><td>Only displays if you are logged in to TAIR.Clicking on this will log you out of TAIR.Any orders in process that have not been completed, will be lost upon logout.</td></tr>
<tr><td><img src="/images/navbar/tools_g.gif"></td><td>Links to TAIR analysis and genome display tools such as the genome browser (SeqView) map displays (MapViewer), BLAST servers, bulk download tools and more.</td></tr>
<tr><td><img src="/images/navbar/info_g.gif"></td><td>Links to a wide variety of information about Arabidopsis, its natural and experimental history, genetic and molecular resources (e.g. Microarrays, Knock-out lines) and current 2010 projects including lists of genes being studied.</td></tr>
<tr><td><img src="/images/navbar/news_g.gif"></td><td>Follow this link to find job listings, the Arabidopsis newsgroup and the latest about what is new/updated at TAIR.</td></tr>
<tr><td><img src="/images/navbar/links_g.gif"></td><td>Use this to find links to other websites, databases and analysis software.</td></tr>
<tr><td><img src="/images/navbar/ftp_g.gif"></td><td>Use this to access the TAIR FTP site where you can obtain specialized and large datasets such as BLAST datasets, raw microarray data etc.... Each FTP directory includes a "README" which describes the contents of the directory.</td></tr>
<tr><td><img src="/images/navbar/stocks_g.gif"></td><td>Use this to link to ABRC stock searches and information about the ABRC and major stock collections.</td></tr>
</table>
<h4><a name="footer"></a>TAIR page footer</h4>
<font class="cont">Clicking on the graphic icons will take you to the home pages of TAIR: ABRC and NCGR respectively. Use the mail links to contact TAIR or ABRC curators.</font>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true" />
<!-- footer using external javascript file starts here -->
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("");
setNext("initials.jsp");
writeFooter();
</script>
<!-- end footer -->

</body>
</html>
