<script>
var previous_link = '';
var next_link='';

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

function setPrevious(link) {
    previous_link = link;
}

function setNext(link) {
    next_link = link;
}

function writeHeader() {
	document.write ('<body link="#3366CC" vlink="#9999CC" text="#000000" alink="#0000CC" bgcolor="#F0F0F0" background="/search/images/backgrnd.gif">');
	document.write ('<table border="0" align="left" width=100% cellpadding=0 cellspacing=0>');
	document.write ('<tr><td valign="top">');
	document.write('<table border=0 cellspacing=0 cellpadding=0>');
	document.write('<tr><td><a href="/index.jsp"><img src="/images/logosmall.gif" width=100 height=35 border="0"></a></td></tr>');
	document.write ('<tr><td><a href="/servlets/Search?type=general&action=new_search">TAIR DB SEARCH</A></font>');
	document.write ('</td></tr></table>');
	document.write ('<td valign="top" align=right>');
	document.write('<table border=0 cellspacing=0 cellpadding=0>');
	document.write ('<tr><td><a href="/help/helpcontents.jsp"><img src="/images/navtoc.gif" width="83" height="23" border="0" alt="TOC"> </a></td>');
	if (previous_link) {
		document.write ('<td valign=top><a href="' + previous_link + '"><img src="/images/navprev.gif" width="80" height="23" border="0" alt="PREV"> </a></td>');
	}
	else {
		document.write ('<td valign=top><img src="/images/navprevx.gif" width="80" height="23" border="0" alt="PREV"></td>');
	}
	if (next_link) {
		document.write ('<td valign=top><a href="' + next_link + '"><img src="/images/navnext.gif" width="83" height="23"  border="0" alt="NEXT"> </a></td>');
	}
	else {
		document.write ('<td valign=top><img src="/images/navnextx.gif" width="83" height="23"  border="0" alt="NEXT"></td>');
	}

	document.write('</td></tr>');
	document.write('<tr><td valign=top colspan=3>');
 	document.write('<FORM method=GET action=http://www.google.com/u/TAIR>');
	document.write('<INPUT TYPE=text name=q size=15 maxlength=255 value="">&nbsp;');
        	document.write('<input type=submit value="Search Help"></td>');
       	document.write('<font face=arial,sans-serif size=-1>');
	document.write('<input type=hidden name=domains value="www.arabidopsis.org">');
	document.write('<input type=hidden name=sitesearch value="www.arabidopsis.org">');
	document.write('<input type=hidden name=hq value="inurl:arabidopsis.org/help">');
        	document.write('</font><br>');
        	document.write('</td></tr>');
    	document.write('</TABLE>');
	document.write('</FORM>');
	document.write('</td></tr></table>');
	document.write ('<br clear="all">');
	document.write ('<hr align="left"></hr>');
}
</script>
