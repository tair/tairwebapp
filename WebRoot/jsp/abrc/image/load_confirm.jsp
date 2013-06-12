<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2003 NCGR.  All rights 
  reserved.
-->

<%@ page 
import="javazoom.upload.*, javazoom.upload.parsing.*, org.tair.processor.image.*, org.tair.community.*, java.util.*, java.lang.ClassLoader"
errorPage="/jsp/common/gen_error.jsp" 
%>

<%!
String pageName = "Bulk Image Loader";
String highlight = "7";
%>

<% 
Vector unstored = null;
if (request.getAttribute( "unstored" )  != null ) { 
    unstored = (Vector) request.getAttribute( "unstored" );  
    session.setAttribute("unstored", unstored);
}
Vector unstored_errors = null;
if (request.getAttribute( "unstored_errors" ) != null ) { 
    unstored_errors = (Vector) request.getAttribute( "unstored_errors" ); 
    session.setAttribute("unstored_errors", unstored_errors);
} 

ImageUploadBean upBean = null;
if (request.getAttribute("upBean" ) != null ) { 
    upBean = (ImageUploadBean) request.getAttribute( "upBean" ); 
    session.setAttribute("upBean", upBean);
}

MultipartFormDataRequest mrequest = null;
if (request.getAttribute( "mrequest" ) != null ) {
    mrequest = (MultipartFormDataRequest) request.getAttribute( "mrequest" );
    Hashtable map = mrequest.getFiles();
    session.setAttribute( "mrequest_files", map);
}
if (request.getAttribute( "mrequest_files") != null ) {
    Hashtable map = (Hashtable) request.getAttribute("mrequest_files");
    session.setAttribute( "mrequest_files", map);
}
%>

<script type="text/javascript">
function replace_image(filename, filenumber) {
    var form=document.replace_image_form;
    form.filename.value = filename;
    form.filenumber.value = filenumber;
    form.submit();
    return false;
}

function replace_image_links(filename, filenumber) {
    var form=document.replace_image_links_form;
    form.filename.value = filename;
    form.filenumber.value = filenumber;
    form.submit();
    return false;
}
</script>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<form method="post" name="BulkUpload" enctype="multipart/form-data">

<table align="center" width="100%">
  <tr align="center">
    <td>
    <p> <a href="/jsp/abrc/image/image_upload.jsp">Return to Image Loader</a> | <a href="/jsp/abrc/image/image_link_edit.jsp">Image Link Editor</a></p>
    </td>
  </tr>
  <tr>
    <td colspan="3"> <b>Files Not Loaded :</b></td>
  </tr>
<%
    if (unstored != null && unstored_errors != null) {
    for (int i=0; i<unstored.size(); i++){
        UploadFile file = (UploadFile) unstored.elementAt(i);
        String error = (String) unstored_errors.elementAt(i);
%>
        <% 
        if (error.equals("file_format") ){
        %>
        
        <tr>
        <td><br><br>Unstored file : <%=file.getFileName() %> </td>
        </tr><tr>
        <td>Error : Incorrect file format. File must be GIF or JPEG</td>
        </tr>
        
        <%
        }else if (error.equals("image_replaced") ) {
        %>
        
        <tr>
        <td><br><br>Replaced file : <%=file.getFileName()%></td>
        </tr><tr>
        <td>The file has been replaced. </td>
        </tr>
        
        <%
        } else if (error.equals("already_exists") ){
        %>
        
        <tr>
        <td><br><br>Unstored file : <%=file.getFileName()%> </td>
        </tr><tr>
        <td>Error : An image with this filename already exists. </td>
        </tr>
<%
        Hashtable links = upBean.findImageLinks(file.getFileName() );
        if (links.isEmpty() ){
%>
            <tr><td>The current image in the DB is not linked to anything. </td></tr>
            <tr><td><a href="" onclick="return replace_image('<%=file.getFileName()%>', <%=i%>)">[replace image]</a></td></tr>

<%      } else {    %>
            <tr><td>The current image is linked to the following objects : 
<%        
            for (Enumeration e = links.keys(); e.hasMoreElements(); ){
                String table_key = (String) e.nextElement();
                String table_name = (String) links.get(table_key);
                String table_keys[] = table_key.split(":");
                String tair_object_id = table_keys[0];
%>
                <%="<a href=/servlets/TairObject?id="+tair_object_id+"&type="+table_name+">"+table_name + ":" +tair_object_id + "</a>"%>, 
            <% } %>
            </td>
            </tr><tr>
                <td><a href="" onclick="return replace_image_links('<%=file.getFileName()%>', <%=i%>)">[replace image and delete all links]</a></td>
                <td><a href="" onclick="return replace_image('<%=file.getFileName()%>', <%=i%>)">[replace image and keep all links]</a></td>
            </tr>
        <% } %>
    <% } %>
<% }} %>
  <tr>
    <td colspan="3"><br><br><br><b>Files Loaded : </b></td>
  </tr>
<%
    Vector history = null;
    if (upBean != null && upBean.getHistory() != null ) {
        history = upBean.getHistory();
        session.setAttribute("uploadHistory", history);
        for (int i=0;i<history.size();i++){
            UploadParameters up = (UploadParameters) history.elementAt(i);
%>
        <tr><td>Uploaded file : <%=up.getFilename()%> (<%=up.getFilesize()%> bytes) Content Type : <%=up.getContenttype()%></td></tr>
<%
        }
    }
%>

</table>
</form>

<form name="replace_image_form" method="get" action="/servlets/processor">
<input type="hidden" name="type" value="image"></input>
<input type="hidden" name="update_action" value="replace_image"></input>
<input type="hidden" name="filename" value=""></input>
<input type="hidden" name="filenumber" value=""></input>
</form>

<form name="replace_image_links_form" method="get" action="/servlets/processor">
<input type="hidden" name="type" value="image"></input>
<input type="hidden" name="update_action" value="replace_image_links"></input>
<input type="hidden" name="filename" value=""></input>
<input type="hidden" name="filenumber" value=""></input>
</form>

<br><br>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
