<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page 
errorPage="/jsp/common/gen_error.jsp"
%>

<%!
String pageName = "Upload Microarray Excel File";
String highlight = "1";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<H4> Uploading Microarray Data </H4>


Please enter the Microarray Experiment Excel file name to upload. 
Submitted file must be in the same format as listed under microarray
 data submission <a href="/submit/microarray.submission.jsp">guidelines</a>: 

<p>
<form action="/servlets/MultiServlet" enctype="multipart/form-data" method="post">
<input type="hidden" name="type" value="upload_microarray">
<input type="hidden" name="upload_action" value="confirm">
<input type="file" name="file">
<input type="submit" value="upload">
</form>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />