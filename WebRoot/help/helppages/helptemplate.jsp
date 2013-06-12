<html>
<head>
<title>TAIR Community Details</title>
<link rel="stylesheet" type="text/css" href="/css/help.css">
<!-- HEADER using external JavaScript file -->
<jsp:include page="/jsp/includes/helpheader.jsp" flush="true" />
<script>
setPrevious("");
setNext("");
writeHeader();
</script>

<!-- End of header -->
</head>

<body>
<br>

<h2><a name=""> </a>Main Header Here</h2>

<font class ="cont"><a name=""> </a>content goes here</font>
<p><a name=""> </a>

Format for adding images<img src="images/commdet1.gif">

<h4><a name=""> </a>SubHeader</h4>

<font class="cont"><a name=""> </a>Subheader content goes here</font>
<p>

<!-- footer using external javascript file starts here --> 
<jsp:include page="/jsp/includes/helpfoot.jsp" flush="true" />
<script>
setPrevious("");
setNext("");
writeFooter();
</script>
<!-- end footer -->
</body>
</html>
