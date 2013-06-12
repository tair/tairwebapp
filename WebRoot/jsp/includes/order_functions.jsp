<%@ page contentType="text/html; charset=UTF-8" %>
<% /* %>
    This page contains the JavaScript functions that are needed for JSP pages 
    that dynamically include order_header.jsp.
<% */ %>

<%@ page import="org.tair.utilities.*, org.tair.abrc.*" %>

<%
// determine whether order in progress has lab & person. If so,
// adding stocks will launch new window; if not then main window will redirect 
// to first stages of order process for user to log in and pick a lab
boolean orderInProgress = false;
//if ( SessionHandler.orderInProgress( request ) ) {
//      CompositeOrder tmpOrder = SessionHandler.getOrder( request );
//      orderInProgress = ( tmpOrder.hasPerson() && tmpOrder.hasOrganization() );
//}
%>

   <script language='JavaScript' src="/js/navbar.js"></script>
      <link rel="stylesheet" type="text/css" href="/css/main.css">
      <link rel="stylesheet" type="text/css" href="/css/search.css">
    <SCRIPT LANGUAGE="JavaScript">

    <!--

// specific functions to open & order window after placing stock order
var orderWind

// value determined by JSP scriptlet above
var orderInProgress = "<%= orderInProgress %>"

function orderFormWindow( form ) {

      if ( orderInProgress == "true" ) {
         if ( !orderWind || orderWind.closed ) {
             orderWind = open( "", "target","height=450,width=670,dependent,resizable,scrollbars");
	     if ( !orderWind.opener ) {
		orderWind.opener = window;
             }
	 } else {
		orderWind.focus();
	 }
	 form.target = "target";
      }
}


function closeOrderWindow( ) {
	if ( orderWind && !orderWind.closed ) {
		orderWind.close();
	}
}

    // -->
    
</SCRIPT>
