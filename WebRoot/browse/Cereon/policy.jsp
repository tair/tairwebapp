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
<span class="mainheader">Monsanto Arabidopsis Polymorphism and Ler Sequence Collection Privacy Policy & Security</span>
<!-- CONTENT IN HERE -->
<dl><dt>
<dd>
<P>
<B>Privacy Policy</B> 

<P>
                      We respect your privacy and maintain your profile information on a secure server. It can be
                      accessed, maintained and used by you and us and will not be shared with any third party.
                      Monsanto shall not authorize any other use of your confidential information. 
<P>
                      We are not concerned with who is using our site, but rather how our site is being used. We track
                      the usage in order to modify the site according to our users' needs. We pay attention to what
                      information is requested and attempt to make it easier to find in the future. Please understand
                      that any data captured from this system is for internal use only and is not shared with anyone
                      else. 
<P>
<B>Security </B>
<P>
                      The Internet security technology developed to ensure private and authenticated
                      communications with this Web site (called Secure Sockets Layer protocol or SSL) is an open
                      platform put into the public domain for the Internet community. SSL encrypts anything passed
                      between computers through the Internet. SSL is used to ensure the protection of the Monsanto
                      Information and the information provided by you, the user. The security features offered by this
                      technology protect all forms of communication from interception, misappropriation and fraud
                      that could otherwise occur as information passes through Internet computers. 
<P>
                      To assure privacy at your end of the system, be sure to exit your browser before leaving your
                      computer to clear all of your personal information. 
<P>
</dl>


<p><center>Last modified on September 1, 2006</center></p>

</div> <!--right column-->


<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

