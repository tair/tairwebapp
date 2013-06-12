<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.utilities.Timer"
%>

<%!
String pageName = "Viewer Initializing";
String highlight = "1";
%>

<%
Timer timer = (Timer) request.getAttribute( "timer" );
long elapsed = timer.elapsed();

long seconds = elapsed / 1000;
int minutes = 0;
if ( seconds > 60 ) {
	minutes = Math.round( seconds / 60 );
}
seconds = seconds - ( minutes * 60 );

%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


<table width="100%" cellpadding="2">
      <tr>
		<td align="center"><font class="header">Viewer Initializing</font></td>
      </tr>

      <tr>
		<td>
			The TAIR viewer is currently initializing and cannot handle requests.
			Initialization occurs following a server restart, which
			occurs periodically for maintenance reasons.  During this time,
			visualization requests cannot be handled.
			
			<p>
			This initialization usually takes around 10 minutes. Please try
			again later.

			</p>
			
			<p>
			Elapsed time: <%= minutes %> minutes <%= seconds %> seconds
		</td>
      </tr>
</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
