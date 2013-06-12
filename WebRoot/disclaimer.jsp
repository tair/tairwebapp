<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("0") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
		
		<!--
		
			Content goes here
			
		//-->
<span class="mainheader">Site disclaimer</span><BR><BR>
<CENTER><B>THE ARABIDOPSIS INFORMATION RESOURCE (TAIR)</B></center>
<P>
<B>Notice</B>
<P>
To assure the integrity of information on this server, we reserve
the right to monitor system access if malicious actions are taken
to disable our on-line services or intentionally gain unauthorized
access to TAIR systems. 
<P>
<B>Disclaimer of Liability</B>
<P>
THE MATERIALS AND INFORMATION YOU FIND ON THE WEBSITE ARE PROVIDED "AS IS",
WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT
LIMITATION ANY WARRANTY FOR INFORMATION, SERVICES OR PRODUCTS PROVIDED
THROUGH OR IN CONNECTION WITH THE WEBSITE AND ANY IMPLIED WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, EXPECTATION OF PRIVACY OR
NON-INFRINGEMENT. Some jurisdictions do not allow the exclusion of implied 
warranties, so the above exclusion may not apply to you.
<P>  
<B>Disclaimer of Endorsement</B>
<P>
General -- The Carnegie Institution of Washington, NCGR and TAIR do not endorse 
or recommend any commercial products, processes, or services. 
The views and opinions of authors expressed on TAIR's
Websites may not be used for advertising or product endorsement
purposes. 
<P>
External Links -- Some TAIR web pages may provide links to
other Internet sites only for the convenience of World Wide Web
users. TAIR is not responsible for the availability or content of
these external sites, nor does TAIR endorse, warrant or
guarantee the products, services or information described or
offered at these other Internet sites. 
<P>
E-mails --  Email addresses of registered users on the TAIR website are provided exclusively for the purpose of furthering scientific discussions and collaborations.  TAIR does not permit the sending of unsolicited and unauthorized single or bulk emails or online communications such as but not limited to bulletin boards, user-groups or instant messaging services to these email addresses.  TAIR  only permits the sending of emails to recipients who would have reasonable expectations of receiving email from the sender.  Visitors are not allowed to compile and potentially distribute these addresses to third parties, or use these addresses to advertise products or services, send junk mail, spam or chain letters.

 
<P>
<B>Copyright Status</B>
<P>
Most information at this site is in the public domain. Unless
stated otherwise, documents and files on TAIR Web servers can
be freely downloaded and reproduced. However, you may
encounter documents or portions of documents that were
contributed by private companies and other organizations, who
may retain all rights to publish or reproduce these
documents or to allow others to do so. Some documents
available from this server may be protected under the U. S. and
foreign copyright laws. Permission to reproduce these
documents may be required.
<P>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
