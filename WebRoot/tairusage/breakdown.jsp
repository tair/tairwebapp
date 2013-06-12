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

<% 
Usage w_stats = new Usage("yearly", "wusage");
Usage a_stats = new Usage("yearly", "AWstats");
%>

<p align="right"><b><A href = "index.jsp">Click Here for Statistics Summary</A></b></p>

<center><table border = 5 cellpadding= 2>
<tr>
<th rowspan="2"> &nbsp;YEAR&nbsp; </th> 
<th rowspan="2"> &nbsp;MONTH&nbsp; </th> 
<th colspan="2"> &nbsp;wusage&nbsp; </th>
<th colspan="2"> &nbsp;awstats&nbsp; </th>
</tr>
<tr>
<th> &nbsp;UNIQUE VISITORS&nbsp; </th> 
<th> &nbsp;PAGE VIEWS&nbsp; </th> 
<th> &nbsp;UNIQUE VISITORS&nbsp; </th> 
<th> &nbsp;PAGE VIEWS&nbsp; </th> 
</tr>
<%
Iterator w_iter = null;
UsageData w_ud = null;
Iterator a_iter = null;
UsageData a_ud = null;
GregorianCalendar cal = new GregorianCalendar();

w_iter = w_stats.iterator();
a_iter = a_stats.iterator();

while (a_iter.hasNext() && w_iter.hasNext()) {
    a_ud = (UsageData) a_iter.next();
    w_ud = (UsageData) w_iter.next();

    //have to put +1 because January starts with 0
    if (a_ud.get_year() == cal.get(Calendar.YEAR) && a_ud.get_month() > cal.get(Calendar.MONTH)+1 ){
    
    //our oldest wusage statistics are only until the nov of 1999, dont show before
    }else if (a_ud.get_year() == 1999 && a_ud.get_month() < 11) {
    }else{
        
    %>
        <tr>
        <td> &nbsp; <%=a_ud.get_year()%> &nbsp; </td> 
        <td> &nbsp; <%=a_ud.get_month()%> &nbsp; </td> 
        <% if (w_ud.get_uv() == 0){ %> <td> &nbsp; </td> <% } else{ %> <td> &nbsp; <%=(int)w_ud.get_uv() %> &nbsp; </td> <% } %> 
        <% if (w_ud.get_pv() == 0){ %> <td> &nbsp; </td> <% } else{ %> <td> &nbsp; <%=(int)w_ud.get_pv() %> &nbsp; </td> <% } %> 
        <% if (a_ud.get_uv() == 0){ %> <td> &nbsp; </td> <% } else{ %> <td> &nbsp; <%=(int)a_ud.get_uv() %> &nbsp; </td> <% } %> 
        <% if (a_ud.get_pv() == 0){ %> <td> &nbsp; </td> <% } else{ %> <td> &nbsp; <%=(int)a_ud.get_pv() %> &nbsp; </td> <% } %> 
        </tr>
        <%
    }
}
%>

</table></center>


</script>
<!-- graph code ends here-->

<!--End Content-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true"></jsp:include>

<div id="searchbox">
<!-- FF needs this it seems, although only for certain machines -->
    <script type="text/javascript">setFooter();</script>
</div>




