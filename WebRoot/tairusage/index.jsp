<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="java.util.*,java.io.*,org.tair.utilities.*"
%>
<%!
String pageName = "TAIR Web Server Statistics";
String cssfile="/css/page/search.css";
String dataFile="/home/arabidopsis/data/";
%>

<script language="JavaScript" src="/js/navbar.js"></script>
<link rel="stylesheet" type="text/css" href="/css/main.css">
<link rel="stylesheet" type="text/css" href="/css/search.css">
<script language='JavaScript'>
var highlight = 0; var helpfile="/help/helppages/initials.jsp";
</script>

<!-- End of template code -->

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>"></jsp:param>
<jsp:param name="pageName" value="<%= pageName %>"></jsp:param>
<jsp:param name="cssfile" value="<%=cssfile %>"></jsp:param>
<jsp:param name="id" value="0" />
</jsp:include>

<!--Content -->
<span class="mainheader"> TAIR Web Server Statistics</span>
<!-- graph code begins here-->
<script type="text/javascript" src="/js/wz_jsgraphics.js"></script>
<p class="intro">Click on the Statistics Breakdown link on the right hand side for a more detailed breakdown of the totals</p>

<% 
Usage w_stats = new Usage("executive", "wusage");
Usage a_stats = new Usage("executive", "AWstats");
%>

<p align="right"><b><A href = "breakdown.jsp">Click Here for Statistics Breakdown</A></b></p>
<p> <b>Executive Summary of Unique Visitors (average visitors/month)</b> </p>
<center><div id="uvCanvas" style="position:relative; height:300px;width:700px"></div></center>
<p align="center"> <b> <font color="blue"> BLUE LINE<font color="black"> represents statistics generated by Awstats |
                   <b> <font color="red"> RED LINE <font color="black"> represents statistics generated by Wusage &nbsp; </p>
<ul>&nbsp;</ul>
<p> <b>Daily Averages Total Page Views (average page views/month)</b> </p>
<center><div id="pvCanvas" style="position:relative; height:300px;width:700px"></div></center>
<p align="center"> <b> <font color="blue"> BLUE LINE<font color="black"> represents statistics generated by Awstats |
                   <b> <font color="red"> RED LINE <font color="black"> represents statistics generated by Wusage &nbsp; </p>

<script type="text/javascript">
var pv_jg = new jsGraphics("pvCanvas");
var uv_jg = new jsGraphics("uvCanvas");
var xcoords;

pv_jg.setColor("black"); // black
uv_jg.setColor("black"); // black
pv_jg.setStroke(2);
uv_jg.setStroke(2);
pv_jg.drawRect(0, 0, 700, 300);
uv_jg.drawRect(0, 0, 700, 300);
pv_jg.setFont("arial","15px",Font.BOLD);
uv_jg.setFont("arial","15px",Font.BOLD);

pv_jg.setColor("grey");
uv_jg.setColor("grey");

<% int year=1999; 
for (int i=100; i<600; i= i+w_stats.get_xdiv() ){ 
%>
    pv_jg.drawString(<%=year%>, <%= i %>, 270);
    uv_jg.drawString(<%=year%>, <%= i %>, 270);

<% year++; 
} 
int w_fs_max = w_stats.get_fs_coord_max();
int w_uv_max = w_stats.get_uv_coord_max();
int w_pv_max = w_stats.get_pv_coord_max();
int a_fs_max = a_stats.get_fs_coord_max();
int a_uv_max = a_stats.get_uv_coord_max();
int a_pv_max = a_stats.get_pv_coord_max();
int fs_max=0;
int uv_max=0;
int pv_max=0;
if (w_fs_max > a_fs_max) { fs_max = w_fs_max; } else{ fs_max = a_fs_max; }
if (w_uv_max > a_uv_max) { uv_max = w_uv_max; } else{ uv_max = a_uv_max; }
if (w_pv_max > a_pv_max) { pv_max = w_pv_max; } else{ pv_max = a_pv_max; }

w_stats.max_recalculate(fs_max, uv_max, pv_max);
a_stats.max_recalculate(fs_max, uv_max, pv_max);

for (int i=30; i<300; i= i+w_stats.get_ydiv() ){%>
    uv_jg.drawString(<%=uv_max%>, 10, <%= i %>);
    pv_jg.drawString(<%=pv_max%>, 10, <%= i %>);
    uv_jg.setStroke(Stroke.DOTTED);
    uv_jg.drawLine(10, <%= i %>, 690, <%= i %>);
    pv_jg.setStroke(Stroke.DOTTED);
    pv_jg.drawLine(10, <%= i %>, 690, <%= i %>);
<% 
uv_max = uv_max - w_stats.get_uv_yunit();
fs_max = fs_max - w_stats.get_fs_yunit();
pv_max = pv_max - w_stats.get_pv_yunit();
} 
%>


<%
Iterator w_iter = null;
Iterator a_iter = null;
UsageData w_ud = null;
UsageData a_ud = null;
w_iter = w_stats.iterator();
a_iter = a_stats.iterator();
%>
var w_fs = new Array();
var w_uv = new Array();
var w_pv = new Array();
var w_xs_coord = new Array();
var w_temp = 100;
var a_fs = new Array();
var a_uv = new Array();
var a_pv = new Array();
var a_xs_coord = new Array();
var a_temp = 100;
<%
int i=0;
while (w_iter.hasNext() ){
    w_ud = (UsageData) w_iter.next();
    if ( (int)w_ud.get_fs_coord() !=0 &&
         (int)w_ud.get_uv_coord() !=0 &&
         (int)w_ud.get_pv_coord() !=0 ){

%>
    w_fs[<%=i%>] = <%= (300 - w_stats.get_ydiv()) - (int)w_ud.get_fs_coord() %>;
    w_uv[<%=i%>] = <%= (300 - w_stats.get_ydiv()) - (int)w_ud.get_uv_coord() %>;
    w_pv[<%=i%>] = <%= (300 - w_stats.get_ydiv()) - (int)w_ud.get_pv_coord() %>;
    w_xs_coord[<%=i%>] = <%= (int)w_ud.get_x_coord()%>;
    <%= w_ud.get_x_coord() %>
<%  i++;
    }
} %>

<%
i=0;
while (a_iter.hasNext() ){
    a_ud = (UsageData) a_iter.next();
    if ( (int)a_ud.get_fs_coord() !=0 &&
         (int)a_ud.get_uv_coord() !=0 &&
         (int)a_ud.get_pv_coord() !=0 ){
%>
    a_fs[<%=i%>] = <%= (300 - a_stats.get_ydiv()) - (int)a_ud.get_fs_coord() %>;
    a_uv[<%=i%>] = <%= (300 - a_stats.get_ydiv()) - (int)a_ud.get_uv_coord() %>;
    a_pv[<%=i%>] = <%= (300 - a_stats.get_ydiv()) - (int)a_ud.get_pv_coord() %>;
    a_xs_coord[<%=i%>] = <%= (int)a_ud.get_x_coord()%>;
<%  i++;
    } 
}%>
uv_jg.setColor("red");
pv_jg.setColor("red");
uv_jg.setStroke(4);
pv_jg.setStroke(4);
uv_jg.drawPolyline(w_xs_coord, w_uv);
pv_jg.drawPolyline(w_xs_coord, w_pv);

uv_jg.setColor("blue");
pv_jg.setColor("blue");
uv_jg.setStroke(4);
pv_jg.setStroke(4);
uv_jg.drawPolyline(a_xs_coord, a_uv);
pv_jg.drawPolyline(a_xs_coord, a_pv);

uv_jg.setColor("black");
pv_jg.setColor("black");

for (var loop=0; loop < w_fs.length; loop++){
    uv_jg.fillEllipse(w_xs_coord[loop], w_uv[loop]-5, 10, 10);
    pv_jg.fillEllipse(w_xs_coord[loop], w_pv[loop]-5, 10, 10);
}

for (var loop=0; loop < a_fs.length; loop++){
    uv_jg.fillEllipse(a_xs_coord[loop], a_uv[loop]-5, 10, 10);
    pv_jg.fillEllipse(a_xs_coord[loop], a_pv[loop]-5, 10, 10);
}

uv_jg.setPrintable(true);
pv_jg.setPrintable(true);
uv_jg.paint();
pv_jg.paint();
</script>
<!-- graph code ends here-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true"></jsp:include>
