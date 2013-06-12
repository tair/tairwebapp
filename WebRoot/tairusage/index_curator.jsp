<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="java.util.*,org.tair.utilities.*,org.tair.community.*"
%>
<%!
String pageName = "TAIR Web Server Statistics";
String cssfile="/css/page/search.css";
String dataFile="/home/arabidopsis/data/";
%>

<% 
boolean curator = LoginChecker.isTairCurator ( request );
%>

<script language="JavaScript" src="/js/navbar.js"></script>
<script type="text/javascript" src="/awstats/basiccalendar.js"></script>
<link rel="stylesheet" type="text/css" href="/css/main.css">
<link rel="stylesheet" type="text/css" href="/css/search.css">
<script language='JavaScript'>
var highlight = 0; var helpfile="/help/helppages/initials.jsp";
</script>

<!-- End of template code -->

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="cssfile" value="<%=cssfile %>" />
<jsp:param name="id" value="0" />
</jsp:include>

<%
if (curator == true){
    
String mode = ( request.getParameter( "mode" ) != null ) ? ( String )request.getParameter( "mode" ) : " "; 
GregorianCalendar cal = new GregorianCalendar();
int year = cal.get(Calendar.YEAR);
int currentYear;
%>

<script language = "JavaScript">

var curYear=new Date().getFullYear(), capYear;

function init(){
    capYear=document.all?document.all("CapYear"):document.getElementById("CapYear");
    capYear.innerHTML=curYear;
    var selectedYear=document.getElementById("YearSelect");
    for (x=0; x<selectedYear.length; x++){
        if (selectedYear.options[x].text == curYear) {
            selectedYear.options.selectedIndex = x;
            break;
        }
    }
}

function yearChange(){
    curYear=parseInt(document.getElementById("YearSelect").value,10);
    capYear.innerHTML=curYear;
    
    for (var i=1; i<=12; i++) {
        var cal = eval("gfFlat_"+i);
    }
    gfFlat_1.fSetCal(curYear, 1, 0, true);
    gfFlat_2.fSetCal(curYear, 2, 0, true);
    gfFlat_3.fSetCal(curYear, 3, 0, true);
    gfFlat_4.fSetCal(curYear, 4, 0, true);
    gfFlat_5.fSetCal(curYear, 5, 0, true);
    gfFlat_6.fSetCal(curYear, 6, 0, true);
    gfFlat_7.fSetCal(curYear, 7, 0, true);
    gfFlat_8.fSetCal(curYear, 8, 0, true);
    gfFlat_9.fSetCal(curYear, 9, 0, true);
    gfFlat_10.fSetCal(curYear, 10, 0, true);
    gfFlat_11.fSetCal(curYear, 11, 0, true);
    gfFlat_12.fSetCal(curYear, 12, 0, true);
}

function open_year(){
    var openURL = "/cgi-bin/awstats/awstats.pl?config=awstats&month=all&year=" + curYear;
    window.open(openURL, "AWStats Yearly Stats");
}

</script>


<!--Content -->
<span class="mainheader"> TAIR Web Server Statistics</span>
<p class="intro">Click on a particular day, month, or year to view the statistics generated for that time period.</p>

<table cellpadding=0 cellspacing=0 bgcolor="#FFFFFF">
   <tr>
   <td>
   Year: <SELECT id='YearSelect' class='yearTitle' onchange='yearChange()'>
    <% for (int i=year; i>=2006; i--){ %>
        <OPTION value='<%= i %>'><%= i %></OPTION>
    <% } %>
   </SELECT>
    </tr>
    </td>
</table>

<br>
<!form name="myForm">



<BODY onload = "init()">
    <fieldset>
    <A HREF="javascript:void(0)" onclick="open_year()">
    <legend style="font:12pt Arial Western">Year: <span id="CapYear">loading..</span></legend>
    </a>
    <table border=0 cellpadding=0 cellspacing=4 bgcolor="#FFFFFF">
    <tr valign="top">

    <td>
    <iframe width=126 height=105 name="[gToday[0],1]:statscal:agenda.js:gfFlat_1" 
    id="[gToday[0],1]:statscal:agenda.js:gfFlat_1" src="/awstats/iflateng.htm" scrolling="no" frameborder="0">
    </iframe></td><td width=10></td>

    <td>
    <iframe width=126 height=105 name="[gToday[0],4]:statscal:share[gfFlat_1]:gfFlat_4" 
    id="[gToday[0],4]:statscal:share[gfFlat_1]:gfFlat_4" src="/awstats/iflateng.htm" scrolling="no" frameborder="0">
    </iframe></td><td width=10></td>

    <td>
    <iframe width=126 height=105 name="[gToday[0],7]:statscal:share[gfFlat_1]:gfFlat_7" 
    id="[gToday[0],7]:statscal:share[gfFlat_1]:gfFlat_7" src="/awstats/iflateng.htm" scrolling="no" frameborder="0">
    </iframe></td><td width=10></td>

    <td>
    <iframe width=126 height=105 name="[gToday[0],10]:statscal:share[gfFlat_1]:gfFlat_10" 
    id="[gToday[0],10]:statscal:share[gfFlat_1]:gfFlat_10" src="/awstats/iflateng.htm" scrolling="no" frameborder="0">
    </iframe></td>

    </tr>

    <tr valign="top">

    <td>
    <iframe width=126 height=105 name="[gToday[0],2]:statscal:share[gfFlat_1]:gfFlat_2" 
    id="[gToday[0],2]:statscal:share[gfFlat_1]:gfFlat_2" src="/awstats/iflateng.htm" scrolling="no" frameborder="0">
    </iframe></td><td></td>

    <td>
    <iframe width=126 height=105 name="[gToday[0],5]:statscal:share[gfFlat_1]:gfFlat_5" 
    id="[gToday[0],5]:statscal:share[gfFlat_1]:gfFlat_5" src="/awstats/iflateng.htm" scrolling="no" frameborder="0">
    </iframe></td><td></td>

    <td>
    <iframe width=126 height=105 name="[gToday[0],8]:statscal:share[gfFlat_1]:gfFlat_8" 
    id="[gToday[0],8]:statscal:share[gfFlat_1]:gfFlat_8" src="/awstats/iflateng.htm" scrolling="no" frameborder="0">
    </iframe></td><td></td>

    <td>
    <iframe width=126 height=105 name="[gToday[0],11]:statscal:share[gfFlat_1]:gfFlat_11" 
    id="[gToday[0],11]:statscal:share[gfFlat_1]:gfFlat_11" src="/awstats/iflateng.htm" scrolling="no" frameborder="0">
    </iframe></td>

    </tr>

    <tr valign="top">

    <td>
    <iframe width=126 height=105 name="[gToday[0],3]:statscal:share[gfFlat_1]:gfFlat_3" 
    id="[gToday[0],3]:statscal:share[gfFlat_1]:gfFlat_3" src="/awstats/iflateng.htm" scrolling="no" frameborder="0">
    </iframe></td><td></td>

    <td>
    <iframe width=126 height=105 name="[gToday[0],6]:statscal:share[gfFlat_1]:gfFlat_6" 
    id="[gToday[0],6]:statscal:share[gfFlat_1]:gfFlat_6" src="/awstats/iflateng.htm" scrolling="no" frameborder="0">
    </iframe></td><td></td>

    <td>
    <iframe width=126 height=105 name="[gToday[0],9]:statscal:share[gfFlat_1]:gfFlat_9" 
    id="[gToday[0],9]:statscal:share[gfFlat_1]:gfFlat_9" src="/awstats/iflateng.htm" scrolling="no" frameborder="0">
    </iframe></td><td></td>

    <td>
    <iframe width=126 height=105 name="[gToday[0],12]:statscal:share[gfFlat_1]:gfFlat_12" 
    id="[gToday[0],12]:statscal:share[gfFlat_1]:gfFlat_12" src="/awstats/iflateng.htm" scrolling="no" frameborder="0">
    </iframe></td>

    </tr>
    </table>

</fieldset>

</td>

</BODY>
<% } else { %>
    <BODY>
    You must be logged in as a curator to view this page. Please log in <a href = /servlets/Community?action=login>here.</a>
    </BODY>
<% } %>

<!--End Content-->
<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true"></jsp:include>



            
