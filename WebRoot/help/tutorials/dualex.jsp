




<SCRIPT LANGUAGE="JavaScript">
<!--

function mySubmit( pageNum, action, size, query_id ) {
document.expression_search_result.pageNum.value = pageNum;
document.expression_search_result.action.value = action;
document.expression_search_result.size.value = size;
document.expression_search_result.query_id.value = query_id;
document.expression_search_result.submit();
}

function checkAll()
{
for(i=0;i<document.expression_search_result.elements.length;i++)
{
var c = document.expression_search_result.elements[i];   
c.checked = i;   
}
}
// here if ya need it
function unCheckAll()
{
for(i=0;i<document.expression_search_result.elements.length;i++)
{
var c = document.expression_search_result.elements[i];   
c.checked ='';   
}
}

// -->
</SCRIPT>









<html>
<head>
<title>Expression Search Results</title>




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
var highlight = 1; var helpfile = "";


    // Brings up a new Definitions window.
    function launchDefinitions(id) {
        remote = window.open("/servlets/TairObject?"
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






<script language="javascript">

if (helpfile == "")
{
    helpfile = "/help/index.jsp";
}

document.write('<table width="602" align="center" border="0" cellspacing="0" cellpadding="0"> <tr> ');

document.write('<td width=100 valign="bottom"><a href="/index.jsp"><img src="/images/logosmall.gif" width="100" height="35" alt="TAIR logo" border=0></a></td>');
document.write('<td align="right" valign="bottom">');

document.write('<a href="/index.jsp"><img src="/images/navbar/home.gif" alt="" border="0" height="10" vspace="0"></a><img src="/images/navbar/upper_s.gif" alt="" border="0" height="10" vspace="0"><a href="/about/"><img src="/images/navbar/about.gif" alt="" border="0" height="10" vspace="0"></a><img src="/images/navbar/upper_s.gif" alt="" border="0" height="10" vspace="0"><a href="/sitemap.jsp"><img src="/images/navbar/sitemap.gif" alt="" border="0" height="10" vspace="0"></a><img src="/images/navbar/upper_s.gif" alt="" border="0" height="10" vspace="0"><a href="/contact/"><img src="/images/navbar/contact.gif" alt="" border="0" height="10" vspace="0"></a><img src="/images/navbar/upper_s.gif" alt="" border="0" height="10" vspace="0"><a href="', helpfile,'"><img src="/images/navbar/help.gif" alt="" border="0" height="10" vspace="0"></a><img src="/images/navbar/upper_s.gif" alt="" border="0" height="10" vspace="0"><a href="/servlets/Order?state=view"><img src=/images/navbar/order.gif border="0"></a><img src="/images/navbar/upper_s.gif" alt="" border="0\" height="10" vspace="0">');


	document.write('<a href="/servlets/Community?action=login"><img src="/images/navbar/myhome.gif" alt="" border="0" height="10" vspace="0"></a>');
	document.write('<img src="/images/navbar/upper_s.gif" alt="" border="0\" height="10" vspace="0">');
        document.write('<a href="/servlets/Community?action=logout"><img src="/images/navbar/logout.gif" alt="" border="0" height="10" vspace="0"></a>');


document.write('</td> ');

document.write('</tr> <tr> <td colspan=2><img src="/images/cleargif.gif" width="100" height="2"></td> </tr> <tr> ');
document.write('<td colspan=2 bgcolor="#cccccc"><img src="/images/cleargif.gif" width="100" height="8"></td> </tr> <tr> ');
document.write('<td colspan=2><img src="/images/cleargif.gif" width="100" height="2"></td> </tr> </table> ');

document.write('<table width="602" align="center" border="0" cellspacing="0" cellpadding="0"> <tr> ');
document.write('<td valign="top"> ');

if (highlight ==1 || highlight=="db") 
{
   document.write('<a href="/servlets/Search?type=general&action=new_search"><img src="/images/navbar/tairdb_y.gif" name="lownav1" alt="" border=0></a> ');
}
else
{
   document.write('<a href="/servlets/Search?type=general&action=new_search" onMouseOver="turnOnR(\'lownav1\'); window.status = \'TAIR Database\'" onMouseOut="turnOffR(\'lownav1\')"><img src="/images/navbar/tairdb_g.gif" name="lownav1" alt="" border=0></a> ');
}
 
if (highlight ==2 || highlight=="tools" )
{
   document.write('<img src="/images/navbar/lower_s.gif" alt="" border="0"><a href="/tools/"><img src="/images/navbar/tools_y.gif" name="lownav2" alt="" border="0"></a> ');
}
else
{ 
   document.write('<img src="/images/navbar/lower_s.gif" alt="" border="0"><a href="/tools/" onMouseOver="turnOnR(\'lownav2\'); window.status = \'Analysis and Visualization Tools\'" onMouseOut="turnOffR(\'lownav2\')"><img src="/images/navbar/tools_g.gif" name="lownav2" alt="" border="0"></a> ');
}

if (highlight == 3 || highlight=="info") 
{
document.write('<img src="/images/navbar/lower_s.gif"><a href="/info/"><img src="/images/navbar/info_y.gif" name="lownav3" alt="" border="0"></a>  ');
}
else
{
   document.write('<img src="/images/navbar/lower_s.gif" alt="" border="0"><a href="/info/" onMouseOver="turnOnR(\'lownav3\'); window.status = \'Arabidopsis Information\'" onMouseOut="turnOffR(\'lownav3\')"><img src="/images/navbar/info_g.gif" name="lownav3" alt="" border="0"></a>  ');
}

if (highlight ==4 || highlight=="news")
{
   document.write('<img src="/images/navbar/lower_s.gif" alt="" border="0"><a href="/news/"><img src="/images/navbar/news_y.gif" name="lownav4" alt="" border="0"></a> ');
}
else
{
   document.write('<img src="/images/navbar/lower_s.gif" alt="" border="0"><a href="/news/" onMouseOver="turnOnR(\'lownav4\'); window.status = \'TAIR News\'" onMouseOut="turnOffR(\'lownav4\')"><img src="/images/navbar/news_g.gif" name="lownav4" alt="" border="0"></a> ');
}

if (highlight ==5 || highlight=="links")
{
   document.write('<img src="/images/navbar/lower_s.gif" alt="" border="0"><a href="/links/"><img src="/images/navbar/links_y.gif" name="lownav5" alt="" border="0"></a> ');
}
else
{
   document.write('<img src="/images/navbar/lower_s.gif" alt="" border="0"><a href="/links/" onMouseOver="turnOnR(\'lownav5\'); window.status = \'External Links\'" onMouseOut="turnOffR(\'lownav5\')"><img src="/images/navbar/links_g.gif" name="lownav5" alt="" border="0"></a> ');
}

if (highlight ==6 || highlight=="ftp")
{
    document.write('<img src="/images/navbar/lower_s.gif" alt="" border="0"><a href="ftp://ftp.arabidopsis.org/home/tair/"><img src="/images/navbar/ftp_y.gif" name="lownav6" alt="" border="0"></a>  ');
}
else
{
   document.write('<img src="/images/navbar/lower_s.gif" alt="" border="0"><a href="ftp://ftp.arabidopsis.org/home/tair/" onMouseOver="turnOnR(\'lownav6\'); window.status = \'FTP\'" onMouseOut="turnOffR(\'lownav6\')"><img src="/images/navbar/ftp_g.gif" name="lownav6" alt="" border="0"></a>  ');
}
if (highlight ==7 || highlight=="stocks")
{
    document.write('<img src="/images/navbar/lower_s.gif" alt="" border="0"><a href="/abrc"><img src="/images/navbar/stocks_y.gif" name="lownav7" alt="" border="0"></a>  ');
}
else
{
   document.write('<img src="/images/navbar/lower_s.gif" alt="" border="0"><a href="/abrc" onMouseOver="turnOnR(\'lownav7\'); window.status = \'Stocks\'" onMouseOut="turnOffR(\'lownav7\')"><img src="/images/navbar/stocks_g.gif" name="lownav7" alt="" border="0"></a>  ');
}
document.write('</td></tr> ');
document.write('<tr><td align="right" valign="top"> ');
function valueSubmit(value, form, form_query_var) {
    if (form.action) {
        form_query_var.value = value;
        form.submit();
        return false;
    }
    return true;
}
document.write('<table><tr><td valign="bottom"><form name="search_textbox_form" onSubmit="return document.search_choice.onsubmit()"><input name="textbox" type="text" size="10"></form></td><td valign="bottom"><FORM name="google_form" method="GET" action="http://www.google.com/custom"><INPUT TYPE=hidden name=q size=10 maxlength=255 value=""><INPUT type=hidden name=cof VALUE="L:http://www.arabidopsis.org/images/logosmall.gif;AH:left;GL:0;S:http://www.arabidopsis.org;AWFID:56b9e4624af96ab2;"><input type=hidden name=domains value="arabidopsis.org"><input type=hidden name=sitesearch value="arabidopsis.org"></FORM><form name="tairdb_form" action="/servlets/Search" method="post"><input type="hidden" name="type" value="general"><input type="hidden" name="action" value="search"><input type="hidden" name="method" value="4"><input type="hidden" name="name" size="10"></form> ');
function doSearch(choice) {
    if (choice == "db") {
        return valueSubmit(document.search_textbox_form.textbox.value,
                           document.tairdb_form,
                           document.tairdb_form.name)
    }
    else if (choice == "site") {
        return valueSubmit(document.search_textbox_form.textbox.value,
                           document.google_form,
                           document.google_form.q)
    }
    return false;
}
document.write('<form name="search_choice" onSubmit="return doSearch(document.search_choice.choice.options[document.search_choice.choice.selectedIndex].value)"><select name="choice"><option value="db" selected>TAIR Database</option><option value="site">TAIR Website</option></select><input type="submit" value="Quick Search"></form></td></tr></table></td></tr></table>');


</script>


<table width="602" align="center" border="0" cellspacing="0" cellpadding="2">
	<tr>

	    <td width="602">


<!-- End template code -->




<form action="/servlet/Search" name="expression_search_result" method="post">
<input type="hidden" name="action" value="search">
<input type="hidden" name="type" value=expression>
<input type="hidden" name="size" value=25>
<input type="hidden" name="query_id" value=<%=query_id%>>
<input type="hidden" name="pageNum" value=1>
<input type="hidden" name="color" value=RG>
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
<tr>
<td width="100%" align="left"> 
<SPAN class="header">TAIR Microarray Expression Search</SPAN>
[<A href="/help/helppages/expression_search.jsp" target="_blank">Help</A>]
	  <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#D5D9DD">
	    <tr>
	      <td align="center" width="33%" class="sm">
		<input type="button" value="new search" onClick="javaScript:mySubmit('1','new_search', 25)" ><BR>
		new expression search
	      </td>
	      <td align="center" width="34%" class="sm">
		<input type="button" value="download" onClick="javaScript:mySubmit( 0,'download', 25)" ><BR>
		check the boxes below and download results
	      </td>
	    </tr>
	  </table>
</td>
</tr>

<tr>

        <td>
        Your query for expression values for  array type of <font class="emphasis">dual channel</font>  where locus  matches exactly <font class="emphasis">AT1G19850</font>  , the array design of <font class="emphasis"> any</font>  , the analysis level of the values at the <font class="emphasis">replicate</font>  level  , absolute expression is <font class="emphasis">expressed</font>  , relative expression is <font class="emphasis">any</font>  with fold change values of <font class="emphasis">2</font>  and standard error of  <font class="emphasis">any</font>  resulted in <font class="emphasis">8</font> records. 
        <p>Displaying 1 - 8 of 8 records on page 1 of 1 pages. 
        </td>

</tr>
      

<tr>
        <tr valign="top" bgcolor="#F5F9FF">
           <td><input type="button" name="check7" value="Check All" onClick="checkAll()"><input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()"> 
                    <input type="button" value="re-sort by" onClick="javaScript:mySubmit( 1,'re_sort',25)" > 
                    <select name="sortColumn">
                        
                    <option   value="name">Array Element</option>
                        
                    <option   value="locus">Locus Identifier</option>
                        
                    <option   value="experiment_name">Experiment Name</option>
                        
                    <option   value="ABS(fold_change) DESC">Slide Fold Change (high to low) </option>
                        
                    <option   value="ABS(fold_change)">Slide Fold Change (low to high) </option>
                        
                    <option   value="fold_change_std_err">std error</option>
                        
                    <option   value="ABS(avg_fold_change) DESC">Replicate Set Fold Change (high to low) </option>
                        
                    <option   value="ABS(avg_fold_change)">Replicate Set Fold Change (low to high) </option>
                        
                    <option   value="avg_fold_change_std_err">std error</option>
                    </select> 

                </td>
        </tr> 
<td>

<table width="100%" border="0" cellspacing="0">

<tr   bgcolor=#D5D9DD  >

<td class="sm">&nbsp; </td> 

<td class="sm" align="center">
    <h5><font color="#800000">
    Array Element <a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(500101708);"><img src='/images/questionmark.gif' width='10' height='12' border='0' alt='(?)'></a>
    </font></h5>
</td>

<td class="sm" align="center">
   <h5><font color="#800000">
   Locus Identifier <a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(650);"><img src='/images/questionmark.gif' width='10' height='12' border='0' alt='(?)'></a>
   </font></h5>
</td>

<td class="sm" align="center">
   <h5><font color="#800000">
   Description <a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(500101749);"><img src='/images/questionmark.gif' width='10' height='12' border='0' alt='(?)'></a>
   </font></h5>
</td>

<td class="sm" align="center">
   <h5><font color="#800000">
   Experiment<br>name <a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(500101643);"><img src='/images/questionmark.gif' width='10' height='12' border='0' alt='(?)'></a>
   </font></h5>
</td>

<td class="sm" align="center">
    <h5><font color="#800000">Replicate Set id : name <a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(500101655);"><img src='/images/questionmark.gif' width='10' height='12' border='0' alt='(?)'></a> 
    </font></h5>
</td>

<td class="sm" align="center">
    <h5><font color="#800000">Experimental Variables 
(Cy5 vs Cy3)
    </font></h5>
</td>

<td class="sm" align="center">
   <h5><font color="#800000">
    Replicate Set Fold Change  <a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(500101715);"><img src='/images/questionmark.gif' width='10' height='12' border='0' alt='(?)'></a>(std error <a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(500101714);"><img src='/images/questionmark.gif' width='10' height='12' border='0' alt='(?)'></a>)
   </font></h5>
</td>

<td class="sm" align="center">
   <h5><font color="#800000">
   Slide Fold Change <a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(500101711);"><img src='/images/questionmark.gif' width='10' height='12' border='0' alt='(?)'></a><BR>(std error <a href="javascript:void(0);"  onMouseover="window.status=''" onClick="javascript:launchDefinitions(500101713);"><img src='/images/questionmark.gif' width='10' height='12' border='0' alt='(?)'></a>)
   </font></h5>
</td>

<td class="sm" align="center">
   <h5><font color="#800000">Slide external ID
   </font></h5>
</td>
</tr>


<tr  valign="top">

<td class="sm" align="left" valign="top">1<input type="checkbox" name="id" value="1414464"></td>

<!-- array element-->
<td class="sm" valign="top">
   <A href="/servlets/TairObject?id=11673&type=array_element" target="_blank">
   IAA24</A>
</td>

<!-- locus-->
<td class="sm" valign="top">
        <A href="/servlets/TairObject?id=30761&type=locus" target="_blank">
        AT1G19850</A>
</td>

<td class="sm" valign="top">transcription factor MONOPTEROS (MP) / a...&nbsp;</td>

<td class="sm" valign="top">
       <A href="/servlets/TairObject?id=1005823531&type=expression_set" target="_blank">
       ap2 mutant&nbsp;</A>
</td>

<td class="sm" valign="top" align="center">
   <A href="/servlets/TairObject?id=1005823531&type=hyb_descr_collection#170" target="_blank">
     170<BR>Cell type specific mRNAs</A>
</td>

<!-- cy5 vi cy3-->
<td class="sm" valign="top" align="center">
  <A href="/servlets/TairObject?id=1005823531&type=hyb_descr_collection#170" target="_blank">
   
   ag mutant <BR>VS<BR> ap2 mutant</A>
</td>


<td class="sm" valign="top" align="right" bgcolor=ccffcc>-2.583<BR>(0.297)</td>

<td class="sm" valign="top" align="right" bgcolor=99ff99>-3.347<BR>
  
  </td>
  
<td class="sm" valign="top">
  <A href="/servlets/TairObject?id=1005823531&type=hyb_descr_collection#170" target="_blank">
  AFGC:<br>12302</A></td> 
</td>

</tr>


<tr  bgcolor=#D5D9DD  valign="top">

<td class="sm" align="left" valign="top">2<input type="checkbox" name="id" value="1615773"></td>

<!-- array element-->
<td class="sm" valign="top">
   <A href="/servlets/TairObject?id=11673&type=array_element" target="_blank">
   IAA24</A>
</td>

<!-- locus-->
<td class="sm" valign="top">
        <A href="/servlets/TairObject?id=30761&type=locus" target="_blank">
        AT1G19850</A>
</td>

<td class="sm" valign="top">transcription factor MONOPTEROS (MP) / a...&nbsp;</td>

<td class="sm" valign="top">
       <A href="/servlets/TairObject?id=1005823506&type=expression_set" target="_blank">
       T-DNA disruption of TTR1&nbsp;</A>
</td>

<td class="sm" valign="top" align="center">
   <A href="/servlets/TairObject?id=1005823506&type=hyb_descr_collection#202" target="_blank">
     202<BR>T-DNA disruption of TTR1</A>
</td>

<!-- cy5 vi cy3-->
<td class="sm" valign="top" align="center">
  <A href="/servlets/TairObject?id=1005823506&type=hyb_descr_collection#202" target="_blank">
   
   wildtype ; Fafard Growing mix #1 <BR>VS<BR> ttr1 transgenic ; Fafard Growing mix #2</A>
</td>


<td class="sm" valign="top" align="right" bgcolor=ccffcc>-2.205<BR>(0.974)</td>

<td class="sm" valign="top" align="right" bgcolor=cccccc>-1.117<BR>
  
  </td>
  
<td class="sm" valign="top">
  <A href="/servlets/TairObject?id=1005823506&type=hyb_descr_collection#202" target="_blank">
  AFGC:<br>17087</A></td> 
</td>

</tr>


<tr  valign="top">

<td class="sm" align="left" valign="top">3<input type="checkbox" name="id" value="3593552"></td>

<!-- array element-->
<td class="sm" valign="top">
   <A href="/servlets/TairObject?id=11673&type=array_element" target="_blank">
   IAA24</A>
</td>

<!-- locus-->
<td class="sm" valign="top">
        <A href="/servlets/TairObject?id=30761&type=locus" target="_blank">
        AT1G19850</A>
</td>

<td class="sm" valign="top">transcription factor MONOPTEROS (MP) / a...&nbsp;</td>

<td class="sm" valign="top">
       <A href="/servlets/TairObject?id=1005823524&type=expression_set" target="_blank">
       Profiling genes expressed during Arabidopsis shoot development in tissue culture&nbsp;</A>
</td>

<td class="sm" valign="top" align="center">
   <A href="/servlets/TairObject?id=1005823524&type=hyb_descr_collection#161" target="_blank">
     161<BR>Shoot Development Affy Scan 2</A>
</td>

<!-- cy5 vi cy3-->
<td class="sm" valign="top" align="center">
  <A href="/servlets/TairObject?id=1005823524&type=hyb_descr_collection#161" target="_blank">
   
   control <BR>VS<BR> IAA and IPA</A>
</td>


<td class="sm" valign="top" align="right" bgcolor=ff0000>9.051<BR>(0.291)</td>

<td class="sm" valign="top" align="right" bgcolor=ff0000>11.68<BR>
  
  </td>
  
<td class="sm" valign="top">
  <A href="/servlets/TairObject?id=1005823524&type=hyb_descr_collection#161" target="_blank">
  AFGC:<br>12107</A></td> 
</td>

</tr>


<tr  bgcolor=#D5D9DD  valign="top">

<td class="sm" align="left" valign="top">4<input type="checkbox" name="id" value="3600046"></td>

<!-- array element-->
<td class="sm" valign="top">
   <A href="/servlets/TairObject?id=11673&type=array_element" target="_blank">
   IAA24</A>
</td>

<!-- locus-->
<td class="sm" valign="top">
        <A href="/servlets/TairObject?id=30761&type=locus" target="_blank">
        AT1G19850</A>
</td>

<td class="sm" valign="top">transcription factor MONOPTEROS (MP) / a...&nbsp;</td>

<td class="sm" valign="top">
       <A href="/servlets/TairObject?id=1005823524&type=expression_set" target="_blank">
       Profiling genes expressed during Arabidopsis shoot development in tissue culture&nbsp;</A>
</td>

<td class="sm" valign="top" align="center">
   <A href="/servlets/TairObject?id=1005823524&type=hyb_descr_collection#158" target="_blank">
     158<BR>Shoot Development Affy Scan 1</A>
</td>

<!-- cy5 vi cy3-->
<td class="sm" valign="top" align="center">
  <A href="/servlets/TairObject?id=1005823524&type=hyb_descr_collection#158" target="_blank">
   
   control <BR>VS<BR> 2,4-D and kinetin</A>
</td>


<td class="sm" valign="top" align="right" bgcolor=ff3333>5.166<BR>(0.053)</td>

<td class="sm" valign="top" align="right" bgcolor=ff6666>4.904<BR>
  
  </td>
  
<td class="sm" valign="top">
  <A href="/servlets/TairObject?id=1005823524&type=hyb_descr_collection#158" target="_blank">
  AFGC:<br>11992</A></td> 
</td>

</tr>


<tr  valign="top">

<td class="sm" align="left" valign="top">5<input type="checkbox" name="id" value="4476911"></td>

<!-- array element-->
<td class="sm" valign="top">
   <A href="/servlets/TairObject?id=11673&type=array_element" target="_blank">
   IAA24</A>
</td>

<!-- locus-->
<td class="sm" valign="top">
        <A href="/servlets/TairObject?id=30761&type=locus" target="_blank">
        AT1G19850</A>
</td>

<td class="sm" valign="top">transcription factor MONOPTEROS (MP) / a...&nbsp;</td>

<td class="sm" valign="top">
       <A href="/servlets/TairObject?id=1005823540&type=expression_set" target="_blank">
       Tissue comparison&nbsp;</A>
</td>

<td class="sm" valign="top" align="center">
   <A href="/servlets/TairObject?id=1005823540&type=hyb_descr_collection#55" target="_blank">
     55<BR>Tissue comparison (reference-vs-flowers)</A>
</td>

<!-- cy5 vi cy3-->
<td class="sm" valign="top" align="center">
  <A href="/servlets/TairObject?id=1005823540&type=hyb_descr_collection#55" target="_blank">
   
   whole plant <BR>VS<BR> flower</A>
</td>


<td class="sm" valign="top" align="right" bgcolor=ffcccc>2.428<BR>(0.426)</td>

<td class="sm" valign="top" align="right" bgcolor=cccccc>1.703<BR>
  
  </td>
  
<td class="sm" valign="top">
  <A href="/servlets/TairObject?id=1005823540&type=hyb_descr_collection#55" target="_blank">
  AFGC:<br>7201</A></td> 
</td>

</tr>


<tr  bgcolor=#D5D9DD  valign="top">

<td class="sm" align="left" valign="top">6<input type="checkbox" name="id" value="4651891"></td>

<!-- array element-->
<td class="sm" valign="top">
   <A href="/servlets/TairObject?id=11673&type=array_element" target="_blank">
   IAA24</A>
</td>

<!-- locus-->
<td class="sm" valign="top">
        <A href="/servlets/TairObject?id=30761&type=locus" target="_blank">
        AT1G19850</A>
</td>

<td class="sm" valign="top">transcription factor MONOPTEROS (MP) / a...&nbsp;</td>

<td class="sm" valign="top">
       <A href="/servlets/TairObject?id=1005823540&type=expression_set" target="_blank">
       Tissue comparison&nbsp;</A>
</td>

<td class="sm" valign="top" align="center">
   <A href="/servlets/TairObject?id=1005823540&type=hyb_descr_collection#54" target="_blank">
     54<BR>Tissue comparison (reference-vs-flowers)</A>
</td>

<!-- cy5 vi cy3-->
<td class="sm" valign="top" align="center">
  <A href="/servlets/TairObject?id=1005823540&type=hyb_descr_collection#54" target="_blank">
   
   flower <BR>VS<BR> whole plant</A>
</td>


<td class="sm" valign="top" align="right" bgcolor=ffcccc>2.428<BR>(0.426)</td>

<td class="sm" valign="top" align="right" bgcolor=ff9999>3.461<BR>
  
  </td>
  
<td class="sm" valign="top">
  <A href="/servlets/TairObject?id=1005823540&type=hyb_descr_collection#54" target="_blank">
  AFGC:<br>7200</A></td> 
</td>

</tr>


<tr  valign="top">

<td class="sm" align="left" valign="top">7<input type="checkbox" name="id" value="4969642"></td>

<!-- array element-->
<td class="sm" valign="top">
   <A href="/servlets/TairObject?id=11673&type=array_element" target="_blank">
   IAA24</A>
</td>

<!-- locus-->
<td class="sm" valign="top">
        <A href="/servlets/TairObject?id=30761&type=locus" target="_blank">
        AT1G19850</A>
</td>

<td class="sm" valign="top">transcription factor MONOPTEROS (MP) / a...&nbsp;</td>

<td class="sm" valign="top">
       <A href="/servlets/TairObject?id=1005823524&type=expression_set" target="_blank">
       Profiling genes expressed during Arabidopsis shoot development in tissue culture&nbsp;</A>
</td>

<td class="sm" valign="top" align="center">
   <A href="/servlets/TairObject?id=1005823524&type=hyb_descr_collection#160" target="_blank">
     160<BR>Shoot Development Affy Scan 2</A>
</td>

<!-- cy5 vi cy3-->
<td class="sm" valign="top" align="center">
  <A href="/servlets/TairObject?id=1005823524&type=hyb_descr_collection#160" target="_blank">
   
   IAA and IPA <BR>VS<BR> control</A>
</td>


<td class="sm" valign="top" align="right" bgcolor=ff0000>9.051<BR>(0.291)</td>

<td class="sm" valign="top" align="right" bgcolor=ff0000>7.008<BR>
  
  </td>
  
<td class="sm" valign="top">
  <A href="/servlets/TairObject?id=1005823524&type=hyb_descr_collection#160" target="_blank">
  AFGC:<br>12106</A></td> 
</td>

</tr>


<tr  bgcolor=#D5D9DD  valign="top">

<td class="sm" align="left" valign="top">8<input type="checkbox" name="id" value="4973762"></td>

<!-- array element-->
<td class="sm" valign="top">
   <A href="/servlets/TairObject?id=11673&type=array_element" target="_blank">
   IAA24</A>
</td>

<!-- locus-->
<td class="sm" valign="top">
        <A href="/servlets/TairObject?id=30761&type=locus" target="_blank">
        AT1G19850</A>
</td>

<td class="sm" valign="top">transcription factor MONOPTEROS (MP) / a...&nbsp;</td>

<td class="sm" valign="top">
       <A href="/servlets/TairObject?id=1005823524&type=expression_set" target="_blank">
       Profiling genes expressed during Arabidopsis shoot development in tissue culture&nbsp;</A>
</td>

<td class="sm" valign="top" align="center">
   <A href="/servlets/TairObject?id=1005823524&type=hyb_descr_collection#157" target="_blank">
     157<BR>Shoot Development Affy Scan 1</A>
</td>

<!-- cy5 vi cy3-->
<td class="sm" valign="top" align="center">
  <A href="/servlets/TairObject?id=1005823524&type=hyb_descr_collection#157" target="_blank">
   
   2,4-D and kinetin <BR>VS<BR> control</A>
</td>


<td class="sm" valign="top" align="right" bgcolor=ff3333>5.166<BR>(0.053)</td>

<td class="sm" valign="top" align="right" bgcolor=ff3333>5.441<BR>
  
  </td>
  
<td class="sm" valign="top">
  <A href="/servlets/TairObject?id=1005823524&type=hyb_descr_collection#157" target="_blank">
  AFGC:<br>11991</A></td> 
</td>

</tr>




















</table>
</td>
</tr>
</table>
</form>



<!-- Start of template code (POST CONTENT) -->
	   </td>
	</tr>
</TABLE>

<!-- FOOTER -->


<TABLE width="602" align="center">
      <tr>
        <td colspan="3"><br><hr size=1 width="100%"></td>
      </tr>

      <tr>
        <td><a href="http://www.ncgr.org"><img src="/images/ncgrlogoredsmall.gif" alt="" border="0" align="left"></a></td>
        <td><a href="http://abrc.osu.edu/"><img src="/images/abrc.gif" alt="" border="0" align="left"></a></td>
        <td><a href="http://carnegiedpb.stanford.edu"><img src="/images/ciw-logosmall.gif" alt="" border="0" align="right"></a></td>
      </tr>

      <TR>
        <TD colspan=3 ALIGN = "CENTER">

          General comments or questions: <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');"><B>curator@arabidopsis.org</B></a><br>
          Seed or DNA stock questions (donations, availability, orders, etc): <a href="mailto:abrc@osu.edu"><B>abrc@osu.edu</B></a>
<!--   
          comments or questions about seed stocks to: <a href="mailto:seedstock@arabidopsis.org"><B>seedstock@arabidopsis.org</B></a><br>
          comments or question about DNA stocks: <a href="mailto:dnastock@arabidopsis.org"><B>dnastock@arabidopsis.org</B></a>
-->
        </TD>
        </TR>
    </table>

</body>
</html>
<!-- End template -->


