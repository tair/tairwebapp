<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%

/*
 Use this page to display images from the database.  Create
 a bare bones HTML page and embed image id & format into <img>
 tag that calls TairImageServlet to get binary data.  Embedding
 servlet call in an HTML page instead of directly writing to the
 browser from the servlet is a little clunky, but is used as a
 workaround to a nasty bug that crashes Netscape on Solaris when
 image is requested directly through a hyperlink
*/


/*
 retrieve image id & format from request, and combine to
 make request in <img> tag.  TairImageServlet will parse the
 string to get info. it needs to retrieve binary image data from
 database, and set content-type header appropriately
*/
String id = request.getParameter( "id" );
String format = request.getParameter( "format" );
%>





<html>
<head>
<title>TAIR Image</title>
</head>

<body>


<img src="/servlets/images/<%= id %>.<%= format %>">


</body>





</html>




