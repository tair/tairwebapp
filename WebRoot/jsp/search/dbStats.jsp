<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<title>DB Stats</title>
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


// specific functions to open & order window after placing stock order
var orderWind
function orderFormWindow( form ) {
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


function closeOrderWindow( ) {
	if ( orderWind && !orderWind.closed ) {
		orderWind.close();
	}
}


    // -->
    
</SCRIPT>

</head>

<!-- Start of template code (POST /HEAD) -->

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#F5F9FF" onUnload="closeOrderWindow()">
<TABLE width="602" align="center" border="0" cellspacing="0" cellpadding="0"> <TR> <TD width=100 valign="bottom"><A href="/index.jsp"><IMG src="/images/logosmall.gif" width="100" height="35" alt="TAIR logo" border=0></A></TD><TD align="right" valign="bottom"><A href="/index.jsp"><IMG src="/images/navbar/home.gif" alt="" border="0" height="10" vspace="0"></A><IMG src="/images/navbar/upper_s.gif" alt="" border="0" height="10" vspace="0"><A href="/about/"><IMG src="/images/navbar/about.gif" alt="" border="0" height="10" vspace="0"></A><IMG src="/images/navbar/upper_s.gif" alt="" border="0" height="10" vspace="0"><A href="/sitemap.jsp"><IMG src="/images/navbar/sitemap.gif" alt="" border="0" height="10" vspace="0"></A><IMG src="/images/navbar/upper_s.gif" alt="" border="0" height="10" vspace="0"><A href="/contact/"><IMG src="/images/navbar/contact.gif" alt="" border="0" height="10" vspace="0"></A><IMG src="/images/navbar/upper_s.gif" alt="" border="0" height="10" vspace="0"><A href="/help/index.jsp"><IMG src="/images/navbar/help.gif" alt="" border="0" height="10" vspace="0"></A><IMG src="/images/navbar/upper_s.gif" alt="" border="0" height="10" vspace="0"><A href="/servlets/Community?action=login"><IMG src="/images/navbar/login.gif" alt="" border="0" height="10" vspace="0"></A><IMG src="/images/navbar/upper_s.gif" alt="" border="0" height="10" vspace="0"><A href="/servlets/Community?action=logout"><IMG src="/images/navbar/logout.gif" alt="" border="0" height="10" vspace="0"></A></TD> </TR> <TR> <TD colspan=2><IMG src="/images/cleargif.gif" width="100" height="2"></TD> </TR> <TR> <TD colspan=2 bgcolor="#cccccc"><IMG src="/images/cleargif.gif" width="100" height="8"></TD> </TR> <TR> <TD colspan=2><IMG src="/images/cleargif.gif" width="100" height="2"></TD> </TR> </TABLE> <TABLE width="602" align="center" border="0" cellspacing="0" cellpadding="0"> <TR> <TD valign="top"> <A href="/servlets/SearchTest?type=general&action=new_search"><IMG src="/images/navbar/tairdb_y.gif" name="lownav1" alt="" border=0></A> <IMG src="/images/navbar/lower_s.gif" alt="" border="0"><A href="/tools/" onMouseOver="turnOnR('lownav2'); window.status = 'Analysis and Visualization Tools'" onMouseOut="turnOffR('lownav2')"><IMG src="/images/navbar/tools_g.gif" name="lownav2" alt="" border="0"></A> <IMG src="/images/navbar/lower_s.gif" alt="" border="0"><A href="/info/" onMouseOver="turnOnR('lownav3'); window.status = 'Arabidopsis Information'" onMouseOut="turnOffR('lownav3')"><IMG src="/images/navbar/info_g.gif" name="lownav3" alt="" border="0"></A>  <IMG src="/images/navbar/lower_s.gif" alt="" border="0"><A href="/news/" onMouseOver="turnOnR('lownav4'); window.status = 'TAIR News'" onMouseOut="turnOffR('lownav4')"><IMG src="/images/navbar/news_g.gif" name="lownav4" alt="" border="0"></A> <IMG src="/images/navbar/lower_s.gif" alt="" border="0"><A href="/links/" onMouseOver="turnOnR('lownav5'); window.status = 'External Links'" onMouseOut="turnOffR('lownav5')"><IMG src="/images/navbar/links_g.gif" name="lownav5" alt="" border="0"></A> <IMG src="/images/navbar/lower_s.gif" alt="" border="0"><A href="ftp://ftp.arabidopsis.org/home/tair/" onMouseOver="turnOnR('lownav6'); window.status = 'FTP'" onMouseOut="turnOffR('lownav6')"><IMG src="/images/navbar/ftp_g.gif" name="lownav6" alt="" border="0"></A>  <IMG src="/images/navbar/lower_s.gif" alt="" border="0"><A href="/abrc" onMouseOver="turnOnR('lownav7'); window.status = 'Stocks'" onMouseOut="turnOffR('lownav7')"><IMG src="/images/navbar/stocks_g.gif" name="lownav7" alt="" border="0"></A>  </TD> <TD align="right" valign="top"><TABLE cellspacing="4" cellpadding="0" border="0"><TR><TD><FORM action="/cgi-bin/AT-site2000search.cgi" method=post><INPUT type="hidden" name="sp" value="sp"><TABLE cellspacing="0" border="0"><TR><TD valign="middle" class="minilinks"><INPUT type="text" name="search"  size="5"></TD><TD valign="middle" class="minilinks"><INPUT type="image" border="0" src="/images/siteSrch.gif" width="70" height="16"></TD></TR></TABLE></TD></TR><TR><TD></FORM><FORM action="/servlets/SearchTest" method="post"><INPUT type="hidden" name="type" value="general"><INPUT type="hidden" name="action" value="search"><INPUT type="hidden" name="method" value="4"><TABLE cellspacing="0" border="0"<tr><TD valign="middle" class="minilinks"><INPUT type="text" name="name" size="5"></TD><TD valign="middle" class="minilinks"><INPUT type="image" border="0" src="/images/dbSrch.gif" width="70" height="16"></TD></TR></TABLE></FORM></TD></TR></TABLE></TD> </TR> </TABLE> 
<TABLE width="602" align="center" border="1" cellspacing="0" cellpadding="2">
	<TR>
	<TD width="602" align="center"> 










 
    <TR>
      <TD class="lg" valign="top" align="center">
        <H2>TAIR Database Statistics</H2>
      </TD>
    </TR>
    <TR> 
      <TD>
	<TABLE border="0" cellspacing="0" cellpadding="4" width="100%">
	 
<TR bgcolor="#F1EFEC" >
   <TD bgcolor="#F1EFEC"  class="lg">Clones:</TD>

   <TD bgcolor="#F1EFEC"  class="sm">YAC    </TD>
   
   <TD bgcolor="#F1EFEC"  class="sm">TAC    </TD>
   
   <TD bgcolor="#F1EFEC"  class="sm">P1     </TD>
   
   <TD bgcolor="#F1EFEC"  class="sm">unknown</TD>
   
   <TD bgcolor="#F1EFEC"  class="sm">cosmid </TD>
   
   <TD bgcolor="#F1EFEC"  class="sm">BAC    </TD>
   
   <TD bgcolor="#F1EFEC"  class="sm">null_type</TD>
   
   <TD bgcolor="#F1EFEC"  class="sm">plasmid</TD>
   
   <TD bgcolor="#F1EFEC"  class="sm">lambda </TD>
   
   <TD bgcolor="#F1EFEC" class="sm"><B>Total</B></TD>
</TR>
<TR bgcolor="#F1EFEC" >
    <TD bgcolor="#F1EFEC"  class="sm">&#160;</TD>


    <TD bgcolor="#F1EFEC"  class="sm"> 7978 </TD>
    

    <TD bgcolor="#F1EFEC"  class="sm"> 10753 </TD>
    

    <TD bgcolor="#F1EFEC"  class="sm"> 9690 </TD>
    

    <TD bgcolor="#F1EFEC"  class="sm"> 10 </TD>
    

    <TD bgcolor="#F1EFEC"  class="sm"> 239 </TD>
    

    <TD bgcolor="#F1EFEC"  class="sm"> 23360 </TD>
    

    <TD bgcolor="#F1EFEC"  class="sm"> 34 </TD>
    

    <TD bgcolor="#F1EFEC"  class="sm"> 37390 </TD>
    

    <TD bgcolor="#F1EFEC"  class="sm"> 97 </TD>
    
    <TD bgcolor="#F1EFEC" class="sm"> 89551 </TD>
</TR>

	




	 
<TR>
   <TD class="lg">Genes:</TD>

   <TD class="sm">protein_coding</TD>
 
   
   <TD class="sm">pre_trna</TD>
 
   
   <TD colspan="7" class="sm">&#160;</TD>
   <TD class="sm"><B>Total</B></TD>
</TR>
<TR>
    <TD class="sm">&#160;</TD>


    <TD class="sm">26818</TD>
   

    <TD class="sm">82</TD>
   
    <TD colspan="7" class="sm">&#160;</TD>
    <TD class="sm"> 26900 </TD>
</TR>




 
	 
<TR bgcolor="#F1EFEC">
   <TD class="lg">Genetic Markers:</TD>

   <TD bgcolor="#F1EFEC" class="sm">PCR_based</TD>
   
   <TD bgcolor="#F1EFEC" class="sm">RFLP</TD>
   
   <TD bgcolor="#F1EFEC" class="sm">visible</TD>
   
   <TD bgcolor="#F1EFEC" class="sm">AFLP</TD>
   
   <TD bgcolor="#F1EFEC" class="sm">SSLP</TD>
   
   <TD bgcolor="#F1EFEC" class="sm">unknown</TD>
   
   <TD bgcolor="#F1EFEC" class="sm">SNP</TD>
   
   <TD bgcolor="#F1EFEC" class="sm">RAPD</TD>
   
   <TD bgcolor="#F1EFEC" class="sm">CAPS</TD>
   
   <TD bgcolor="#F1EFEC" class="sm"><B>Total</B></TD>
</TR>
<TR bgcolor="#F1EFEC">
    <TD  bgcolor="#F1EFEC" class="sm">&#160;</TD>


    <TD class="sm" bgcolor="#F1EFEC"> 8 </TD>
    

    <TD class="sm" bgcolor="#F1EFEC"> 638 </TD>
    

    <TD class="sm" bgcolor="#F1EFEC"> 463 </TD>
    

    <TD class="sm" bgcolor="#F1EFEC"> 1267 </TD>
    

    <TD class="sm" bgcolor="#F1EFEC"> 180 </TD>
    

    <TD class="sm" bgcolor="#F1EFEC"> 385 </TD>
    

    <TD class="sm" bgcolor="#F1EFEC"> 412 </TD>
    

    <TD class="sm" bgcolor="#F1EFEC"> 1 </TD>
    

    <TD class="sm" bgcolor="#F1EFEC"> 282 </TD>
    
    <TD class="sm">3636 </TD>
</TR>





	 
<TR>
   <TD class="lg">Community:</TD>

   <TD class="sm">organization</TD>
   
   <TD class="sm">person</TD>
   
   <TD colspan="7" class="sm">&#160;</TD> 
   <TD class="sm"><B>Total</B></TD>
</TR>
<TR>
    <TD class="sm">&#160;</TD>


    <TD class="sm"> 3273 </TD>
    

    <TD class="sm"> 9375 </TD>
    
     <TD colspan="7" class="sm">&#160;</TD>
    <TD class="sm"> 12648 </TD>
</TR>

	




	 
<TR bgcolor="#F1EFEC">
   <TD bgcolor="#F1EFEC" class="lg">Publication:</TD>

   <TD  bgcolor="#F1EFEC" class="sm">press_article</TD>
   
   <TD  bgcolor="#F1EFEC" class="sm">unknown</TD>
   
   <TD  bgcolor="#F1EFEC" class="sm">review</TD>
   
   <TD  bgcolor="#F1EFEC" class="sm">book</TD>
   
   <TD  bgcolor="#F1EFEC" class="sm">abstract</TD>
   
   <TD  bgcolor="#F1EFEC" class="sm">research_article</TD>
   
   <TD  bgcolor="#F1EFEC" class="sm">null_type</TD>
   
   <TD  bgcolor="#F1EFEC" class="sm">book_chapter</TD>
   
<TD bgcolor="#F1EFEC" class="sm">&#160;</TD>
<TD bgcolor="#F1EFEC" class="sm"><B>Total</B></TD>
</TR>
<TR bgcolor="#F1EFEC">
    <TD bgcolor="#F1EFEC" class="sm">&#160;</TD>


    <TD bgcolor="#F1EFEC" class="sm"> 3 </TD>
    

    <TD bgcolor="#F1EFEC" class="sm"> 1565 </TD>
    

    <TD bgcolor="#F1EFEC" class="sm"> 456 </TD>
    

    <TD bgcolor="#F1EFEC" class="sm"> 15 </TD>
    

    <TD bgcolor="#F1EFEC" class="sm"> 70 </TD>
    

    <TD bgcolor="#F1EFEC" class="sm"> 8319 </TD>
    

    <TD bgcolor="#F1EFEC" class="sm"> 588 </TD>
    

    <TD bgcolor="#F1EFEC" class="sm"> 129 </TD>
    
<TD bgcolor="#F1EFEC" class="sm">&#160;</TD>
<TD bgcolor="#F1EFEC" class="sm"> 11145 </TD>
</TR>

	



  
          
       </TABLE>
      </TD>
     </TR>
      
    </TD>
	</TR>
</TABLE>

<TABLE width="602" align="center"><TR><TD colspan="3"><BR><HR size=1 width="90%"></TD></TR><TR><TD><A href="http://www.ncgr.org"><IMG src="/images/ncgrlogoredsmall.gif" alt="" border="0" align="left"></A></TD><TD><A href="http://abrc.osu.edu/"><IMG src="/images/abrc.gif" alt="" border="0" align="left"></A></TD><TD><A href="http://carnegiedpb.stanford.edu"><IMG src="/images/ciw-logosmall.gif" alt="" border="0" align="right"></A></TD></TR><TR><TD colspan=3 ALIGN = "CENTER">general comments or questions to: <A href="mailto:curator@arabidopsis.org"><B>curator@arabidopsis.org</B></A><BR>comments or questions about seed stocks to: <A href="mailto:seedstock@arabidopsis.org"><B>seedstock@arabidopsis.org</B></A><BR>comments or questions about DNA stocks to: <A href="mailto:dnastock@arabidopsis.org"><B>dnastock@arabidopsis.org</B></A></TABLE>
</BODY>
</HTML>

















