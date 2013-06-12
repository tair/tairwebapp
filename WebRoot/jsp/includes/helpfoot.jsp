<script>
var previous_link = '';
var next_link='';

function setPrevious(link) {
    previous_link = link;
}

function setNext(link) {
    next_link = link;
}

function writeFooter() {
	document.write ('<body link="#3366CC" vlink="#9999CC" text="#000000" alink="#0000CC" bgcolor="#F0F0F0">');
	document.write ('<br clear="all">');
	document.write ('<hr align="left"></hr>');
	document.write ('<table border="0" align ="right"><tr><td><font class="footer">To report problems:<br><a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">curator@arabidopsis.org</a></font></td></tr></table>');
	document.write ('<table border="0" align="right">');
	document.write ('<tr><td><a href="/index.jsp"><img src="/images/logosmall.gif" border="0"></a></td></tr>');
	document.write ('</table>');
	document.write ('<table width="243" border="0" align="left" cellpadding="0" cellspacing="0">');
	document.write ('<tr><td><a href="/help/helpcontents.jsp"><img src="/images/navtoc.gif" width="84" height="23" border="0" alt="TOC"> </a></td>');
if (previous_link) {
		document.write (' <td valign="top"><a href="' + previous_link + '"><img src="/images/navprev.gif" width="80" height="23" border="0" alt="PREV"> </a></td>');
	}
	else {
		document.write (' <td valign="top"><img src="/images/navprevx.gif" width="80" height="23" border="0" alt="PREV"></td>');
	}
	if (next_link) {
		document.write ('<td valign="top"><a href="' + next_link + '"><img src="/images/navnext.gif" width="83" height="23"  border="0" alt="NEXT"> </a></td>');
	}
	else {
		document.write ('<td valign="top"><img src="/images/navnextx.gif" width="83" height="23"  border="0" alt="NEXT"></td>');
	}
	document.write ('</tr></table>');


}
</script>
