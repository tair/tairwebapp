<%@ page contentType="text/html;charset=ISO-8859-1" %>

<%!

    String bg_color = " "; 
    public String toggleBgColor() 
    {
 
      if(bg_color.equals(" bgcolor=#D5D9DD ")){
         bg_color = "";
      }
      else{
         bg_color = " bgcolor=#D5D9DD " ;
      }
      return bg_color;
    }
    public String sameBgColor() {
      return bg_color;
    }
    public String get_color(){
      return bg_color;
    }
    public void set_color(String value){
	bg_color = value;
    }
%>

<html>
<head>
<title><%=pageName%></title>

<%  String helpfile=""; 
    if (request.getAttribute("helpfile") != null){
       helpfile = (String)request.getAttribute("helpfile"); 
    }
%>


  <script language='JavaScript' src="/js/navbar.js"></script>
      <link rel="stylesheet" type="text/css" href="/css/main.css">
      <link rel="stylesheet" type="text/css" href="/css/search.css">
    <SCRIPT LANGUAGE="JavaScript">

    <!--

    function launch(newURL, newName, newFeatures, orgName) {
	remote = open(newURL, newName, newFeatures);
	if ( !remote.opener ) {
          remote.opener = window;
	}
       remote.opener.name = orgName
     
      return remote;

    }

    function noHelp() {
       myRemote = launch("/search/no_help.html", "no_help", "height=200,width=300,channelmode=0,dependent=1,directories=0,fullscreen=0,location=0,menubar=0,resizable=1,scrollbars=0,status=0,toolbar=0", "helpWin");
    }
    function launchRemote() {
       myRemote = launch("/search/not_impl.html", "not_impl", "height=200,width=300,channelmode=0,dependent=1,directories=0,fullscreen=0,location=0,menubar=0,resizable=1,scrollbars=0,status=0,toolbar=0", "helpWin");
    }

// nav bar settings
var highlight = <%= highlight %>; var helpfile = "<%= helpfile  %>";


    // Brings up a new Definitions window.
    function launchDefinitions(id) {
        remote = window.open("<%= request.getContextPath() %>/servlets/TairObject?"
                          + "type=definitions&id="+id,
                      'Glossary',
                      'location=no,menubar=no,scrollbars=yes,status=no,resizable=yes,width=300,height=200');
        if(! remote.opener ) {
            remote.opener = window;
        }
	remote.resizeTo(300, 200);     // Netscape 4 compatibility issue.
	// remote.scrollbar.visible=true; // Netscape 4 compatibility issue.
	remote.focus()
        return remote;
    }

    // -->
</SCRIPT>

</head>

<!-- Start of template code (POST /HEAD) -->

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#F5F9FF">
<script language='JavaScript' SRC='/js/header'></script>
<table width="602" align="center" border="0" cellspacing="0" cellpadding="2">
	<tr>
	<td width="602">
<!-- End template code -->

