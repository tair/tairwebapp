<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>

<%@ page import="org.tair.utilities.*, org.tair.community.*" %>


<%!
String pageName = "Add Affiliations";
String highlight = "2";
%>

  

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>


<table align="center" width="400">
      <tr>
	<td align="center"><font class="mainheader">Affiliations</font></td>
      </tr>

      <tr>
	<td>
	  You <font class="req">MUST</font> be affiliated with a lab to place stock orders through
	  ABRC.  Any charge incurred by a stock order will be billed to the Primary Investigator (PI) of 
	  your lab.
	</td>
      </tr>
</table>


    <table width="100%" cellpadding="2" cellspacing="0" border="0" bgcolor="<%= DataConstants.BGCOLOR %>">
      <tr>
	<td><font class="header">Lab Affiliations/ABRC Billing Information</font></td>
      </tr>
      
      <tr>
	<td>
	  
	  
	  <table cellpadding="3">
           <form action="/servlets/Community" method="post">
         
	    <tr>
	      <td nowrap>
		  <input type="hidden" name="action" value="edit">
		  <input type="hidden" name="lab" value="true">
		  <input type="hidden" name="new" value="true">
		  <input type="hidden" name="type" value="organization">
		  <input type="submit" value="Add My Lab">
		</form>

	      </td>
	      <td>If you are the PI of your own lab, add your lab here.</td>
	    </tr>
	  </table>
	  <p>
	    Otherwise, if you are a member of someone else's lab, find the 
            lab by entering your PI's last name below:

	  <form action="/servlets/Community" method="post">	    
	    <table>
	      <tr>
		<td>
                  <input type="hidden" name="action" value="search">
		  <input type="hidden" name="path" value="pi">
		  <input type="submit" value="Search and Add Me to a Lab">
		  <input type="hidden" name="last_name_method" value="<%= DataConstants.SEARCH_CONTAINS %>">
		</td>
		<td><input type="text" name="last_name" size="15" maxlength="30" value=""></td>
	      </tr>
	    </table>
	  </form>

	</td>
      </tr>
      
      <tr>
	<td>&nbsp;</td>
      </tr>

      <tr>
	<td><font class="header">Other Organization Affiliations</font></td>
      </tr>
      
      <tr>
	<td>
	  
	  Affiliate yourself to other organizations in the TAIR database such as institutes, stock centers 
	  or committees by entering the organization's name below:
	  
	  <form action="/servlets/Community" method="POST">
	  <table cellpadding="3">
	      <tr>
		<td>
                  <input type="hidden" name="action" value="search">
		  <input type="hidden" name="path" value="person_org">
		  <input type="hidden" name="name_method" value="<%= DataConstants.SEARCH_CONTAINS %>">
		  <input type="submit" value="Search and Add Me to an Organization">
		</td>
		<td><input type="text" name="name" size="15" maxlength="100" value=""></td>
	      </tr>
	    </table>
	  </form>
	</td>
      </tr>

      <tr>
	<td>&nbsp;</td>
      </tr>

	<tr>
	  <form action="/servlets/Community" method="Get">
	  <td align="center">
            <input type="hidden" name="action" value="redirect">
	    <input type="hidden" name="req_page" value="personProfile">
	    <input type="submit" value="Continue">
	  </td>
          </form>
	</tr>
      </table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
