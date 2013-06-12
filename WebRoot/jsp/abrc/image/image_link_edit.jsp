<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
Copyright (c) 2003 NCGR.  All rights 
reserved.
-->

<%@ page 
import="javazoom.upload.*, org.tair.community.*, java.util.*, java.lang.ClassLoader"
errorPage="/jsp/common/gen_error.jsp" 
%>

<%!
String pageName = "Image Link Editor";
String highlight = "7";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<form method="get" name="links_form" action="/servlets/processor" enctype="multipart/form-data">
<input type="hidden" name="message" value=""></input>
<input type="hidden" name="type" value="image"></input>
<input type="hidden" name="update_action" value="update_links"></input>

<table align="center" border="0" cellpadding="2" width="100%">
    <tr>
        <td align="center" nowrap><font class="mainheader">Image Link Editor</font></td>
    </tr><tr>
        <td> This tool allows you to edit image links. Type in the image names seperated by carriage returns that you want to edit the links for. 
        <br><br>
        For example: 
        <br>CS20A.jpg<br>CS20B.jpg<br>
        <br>
        </td>
    </tr><tr>
        <td><textarea name="links" rows="20" cols="80"></textarea></td>
    </tr><tr>
        <td align="center"><input type="submit"></input></td>
    </tr>
</table>

</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
