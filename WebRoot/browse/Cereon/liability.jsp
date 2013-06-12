<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%!
String pageName = "Browse";
String highlight = "3";
String helpfile="";
String cssfile="/css/page/pagelevels.css";
%>


<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
errorPage="/jsp/common/gen_error.jsp"%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
<jsp:param name="cssfile" value="<%= cssfile %>" />
</jsp:include>

<jsp:include page="/jsp/includes/browseSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="Monsanto SNP and Ler Collections" />
</jsp:include>

<div id="rightcolumn">

<span class="mainheader">General Liability Statement</span><br>
<!-- CONTENT IN HERE -->
<dl><dt>
<dd>

<B>Monsanto SNP and Ler Sequence Collection</B>
<BR><BR>
Thank you for visiting this Website. Monsanto reserves the right to change the Agreement at any time, and
                      you agree that your use of the Monsanto Information shall be subject to the terms and conditions set forth
                      in the Agreement at the time the Monsanto Information is downloaded. 
<P>
                      This disclaimer of liability applies to any damages or injury caused by any failure of performance, error,
                      omission, interruption, deletion, defect, delay in operation or transmission, computer virus,
                      communication line failure, theft or destruction or unauthorized access to, alteration of, or use of record,
                      whether for breach of contract, tortious behavior, negligence or under any other cause of action. 
<P>
                      You specifically acknowledge that Monsanto is not liable for your defamatory, offensive, infringing or illegal
                      materials or conduct, or that of third parties, and Monsanto reserves the right to remove such materials
                      from the Website without liability. 
<P>
                      The contents of the Website pages, including, but not limited to text, graphics and icons, are copyrighted
                      materials owned or controlled by Monsanto and may contain Monsanto Company's name,
                      trademarks, service marks and trade names. Under the terms of the Agreement, you may download one
                      copy of these materials on any single computer and print a copy of the materials for the uses permitted
                      by the Agreement. No other permission is granted to you to print, copy, reproduce, distribute, transmit,
                      upload, download, store, display in public, alter or modify these materials. No permission is granted here
                      to you to use Monsanto's icons, site address or other means to hyperlink other Internet
                      sites with any page in the Website, except as provided under "Proprietary Notices" section of the
                      Agreement. Monsanto may make improvements and/or changes in the Monsanto Information accessible from
                      the Website, including the terms and conditions of your use of this Website, without liability. 
<P>
                      THE MATERIALS AND INFORMATION YOU FIND ON THE WEBSITE ARE PROVIDED "AS IS", WITHOUT
                      WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION ANY
                      WARRANTY FOR INFORMATION, SERVICES OR PRODUCTS PROVIDED THROUGH OR IN CONNECTION
                      WITH THE WEBSITE AND ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
                      PARTICULAR PURPOSE, EXPECTATION OF PRIVACY OR NON-INFRINGEMENT. Some jurisdictions do
                      not allow the exclusion of implied warranties, so the above exclusion may not apply to you. 
</dl>



<p><center>Last modified on September 1, 2006</center></p>

</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>



