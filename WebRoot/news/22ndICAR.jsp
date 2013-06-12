<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%String pageName = "TAIR - News - ICAR Abstracts";
String highlight = "4";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>

<%@ page
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<jsp:include page="/jsp/includes/newsSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="ICAR Abstracts"/>  
</jsp:include>


<div id="rightcolumn">


<span class="mainheader">Pictures from the 22nd International Conference on Arabidopsis Research</span>
<dd><b>Madison, Wisconsin, June 22-25, 2011</b></dd>
<dl>

<dt>

<b>This year's conference t-shirt</b> <p>
<img src="/i/ICAR2011_shirt.jpg" width="350" height="325" alt="shirt"/>

<p>
<b>Joe Ecker of the Salk Institue begins his seminar after Eliott Meyerowitz presented him with the 2011 Genetics Society of America's George W. Beadle Award 
for outstanding contributions to the community of genetics researchers:</b>
<img src="/i/Ecker2.jpg" width="350" height="300" alt="Ecker"/>
<p>
<b>Jiaqiang Sun- winner of the first ICAR iPad giveaway:</b>
<img src="/i/iPad2.jpg" width="300" height="350" alt="iPad"/>
<p>
<b>Hanging out at the final banquet:</b> <p>
<img src="/i/NickP.jpg" width="325" height="190" />
<img src="/i/Peeps1.jpg" width="325" height="235"/>
<img src="/i/Peeps2.jpg" width="325" height="185" />
<img src="/i/Peeps6.jpg" width="325" height="235" />
<img src="/i/Peeps3.jpg" width="324" height="247" />
<p>
    <b>Karaoke, anyone?</b> <p>
    <img src="/i/Braybrook.jpg" width="325" height="255" />
<p>
    <b>Time to eat and drink...</b> <p>
    <img src="/i/Banquet3.jpg" width="325" height="205" />
    <img src="/i/Banquet2.jpg" width="325" height="235" />
    
    <p>
    <b>Ladies from ABRC...</b> <p>
    <img src="/i/Peeps7.jpg" width="324" height="163" />
    <p>
<b>We know how to party...</b> <p>
    <img src="/i/Dance2.jpg" width="324" height="214" />
    <img src="/i/GuitarHeros.jpg" width="324" height="376" />
    <p>
<b>Game Faces... On</b> <p>
    <img src="/i/Pool" width="324" height="197" />
    <img src="/i/Pool2.jpg" width="324" height="218" />
    <img src="/i/Bowling1.jpg" width="324" height="231" />
    <img src="/i/Bowling2.jpg" width="324" height="222" />
    <p>
<b>Watch me line up this shot</b> <p>
<img src="/i/Pool5.jpg" width="324" height="411" />

<br>
<b>Image credits: Joanna Friesner</b>
</dd>
<center>Last modified on July 28, 2011</center>

</div>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
