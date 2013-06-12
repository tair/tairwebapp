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

<%
Hashtable unstored_links = null;
Hashtable stored_links = null;
String error = "";
if (request.getAttribute( "unstored_links" ) != null ) { 
    unstored_links = (Hashtable) request.getAttribute("unstored_links"); 
    session.setAttribute("unstored_links", unstored_links);
}
if (request.getAttribute("stored_links") != null ) {
    stored_links = (Hashtable) request.getAttribute("stored_links");
    session.setAttribute("stored_links", stored_links);
}
if (request.getAttribute("error") != null ) {
    error = (String) request.getAttribute("error");
}
%>

<script type="text/javascript">
function showMenu(divname) {
    document.getElementById(divname).style.display = '';
}

function makeLink(image_name) {
    var form=document.make_link;
    var doctype = image_name + "_link_type";
    var docname = image_name + "_link_name";
    var cvec = image_name + "_clone_vector";
    var cins = image_name + "_clone_insert";
    if (document.getElementById(doctype).value == "Clone" && 
       (document.getElementById(cvec).value == "" ||
        document.getElementById(cins).value == "") ){
            alert ("when making a link, the clone vector and clone insert types must be filled out");
    }else{
        form.clone_vec.value = document.getElementById(cvec).value;
        form.clone_ins.value = document.getElementById(cins).value;
        form.link_type.value = document.getElementById(doctype).value;
        form.link_name.value = document.getElementById(docname).value;
        form.image_name.value = image_name;
        form.submit();
    }
    return false;
}

function deleteLink(image_name, tair_object_id, tair_object_type) {
    var form=document.delete_link;
    form.image_name.value = image_name;
    form.tair_object_id.value = tair_object_id;
    form.link_type.value = tair_object_type;
    form.submit();
    return false;
}

function showClone(image_name) {
    var doctype = image_name + "_link_type";
    var clonediv = image_name + "_clone";
    if (document.getElementById(doctype).value == "Clone"){ 
        document.getElementById(clonediv).style.display='';
    }else{
        document.getElementById(clonediv).style.display='none';
    }
}

</script>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<form method="get" name="delete_link" action="/servlets/processor" enctype="multipart/form-data">
<input type="hidden" name="tair_object_id" value=""></input>
<input type="hidden" name="link_type" value=""></input>
<input type="hidden" name="image_name" value=""></input>
<input type="hidden" name="type" value="image"></input>
<input type="hidden" name="update_action" value="delete_link"></input>
</form>

<form method="get" name="make_link" action="/servlets/processor" enctype="multipart/form-data">
<input type="hidden" name="clone_vec" value=""></input>
<input type="hidden" name="clone_ins" value=""></input>
<input type="hidden" name="link_type" value=""></input>
<input type="hidden" name="link_name" value=""></input>
<input type="hidden" name="image_name" value=""></input>
<input type="hidden" name="type" value="image"></input>
<input type="hidden" name="update_action" value="make_link"></input>
</form>

<form method="get" name="links_form" action="/servlets/processor" enctype="multipart/form-data">
<input type="hidden" name="message" value=""></input>
<input type="hidden" name="type" value="image"></input>
<input type="hidden" name="update_action" value="update_links"></input>

<table align="center" border="0" cellpadding="2" width="100%">
    <tr>
        <td align="center" nowrap><font class="mainheader">Image Link Editor</font></td>
    </tr>
    <tr>
        <td align="center"><font color="red"><%=error%></font></td>
    </tr>
</table>

<table align="center" border="0" cellpadding="0" width="100%">
    <tr>
        <td colspan="3"><b> Links Not Made : <br><br></b></td>
    </tr>
    <%  
        if (unstored_links != null ) {
        for (Enumeration e = unstored_links.keys(); e.hasMoreElements();) { 
        String key = (String) e.nextElement();
    %>
    <tr> 
        <td colspan="3"><%=key%><br><%=unstored_links.get(key)%></td>
    </tr>
    <tr><td><br></td></tr>
    <% } } %>
    <tr>
        <td colspan="3"><b>Links Made : <br><br></b></td>
    </tr>
    <%  
        if (stored_links != null ) {
        for (Enumeration e = stored_links.keys(); e.hasMoreElements();) { 
            String key = (String) e.nextElement();
            Hashtable table = (Hashtable) stored_links.get(key);
    %>
    <tr> <td><%=key%></td><td><a href="javascript:showMenu('<%= key %>');">[ add new link ]</a></td></tr>
    <tr><td>
        <div id="<%= key %>" style="display:none">
        Link image to object type: <select id="<%=key%>_link_type" name="<%=key%>_link_type" onchange="showClone('<%=key%>')">
            <option value="Stock">Stock</option>
            <option value="Germplasm">Germplasm</option>
            <option value="Clone">Clone</option>
            <option value="Vector">Vector</option>
            <option value="Library">Library</option>
            <option value="HostStrain">Host Strain</option>
            </select>
        &nbsp;&nbsp;
        object name:<input id="<%=key%>_link_name" name="<%=key%>_link_name" /> 
        &nbsp;&nbsp;
        <input type="submit" onclick="return makeLink('<%= key %>');"></div>
        <div id="<%=key%>_clone" name="<%=key%>_clone" style="display:none">
            &nbsp;&nbsp;clone vector type: 
            <input id="<%=key%>_clone_vector" name="<%=key%>_clone_vector"/>
            &nbsp;&nbsp;clone insert type: 
            <input id="<%=key%>_clone_insert" name="<%=key%>_clone_insert"/>
        </div>
    </td></tr>
    
    <%        
            if (table != null ) {
            for (Enumeration n = table.keys(); n.hasMoreElements();) {
                String table_key = (String) n.nextElement();
                String[] table_keys = table_key.split(":");
                String tair_object_id = table_keys[0];
                String tair_object_type = (String) table.get(table_key);
    %>
    <tr><td>Link made to : <a href='/servlets/TairObject?id=<%=tair_object_id%>&type=<%=tair_object_type%>'><%=tair_object_type%>:<%=tair_object_id%>
    </td><td><a href="javascript:deleteLink('<%= key %>','<%=tair_object_id%>', '<%=tair_object_type%>');">[ delete link ]</a></td></tr>
    <%      } } %>
    <tr><td><br></td></tr>  
    
    <% } } %>
</table>
</form>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
