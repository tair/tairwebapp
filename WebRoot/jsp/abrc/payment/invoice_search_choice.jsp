<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Copyright (c) 2003 NCGR.  All rights 
  reserved.
-->

<%@ page
	import="org.tair.community.*,java.util.*,java.lang.ClassLoader,org.tair.bs.community.*"
	errorPage="/jsp/common/gen_error.jsp"%>

<%!String pageName = "User Invoice Management System";
	String highlight = "7";%>

<%
  BsPerson person = (BsPerson)request.getAttribute("person");
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<script type="text/javascript">

function userSearch() {
    var form = document.user_search_form;
    form.type.value = "invoice";
    form.mode.value = "user";
    form.search_action.value = "search";
    form.pi_user_confirm.value = "true";
    form.submit();
}

function labSearch(labname) {
    var form = document.lab_search_form;
    form.type.value = "invoice";
    form.mode.value = "user";
    form.search_action.value ="labsearch";
    form.communityID.value = labname;
    form.submit();
}
</script>

<FORM name="user_search_form" method="get" action="/servlets/Search">
	<input type="hidden" name="type" value=""></input>
	<input type="hidden" name="mode" value=""></input>
	<input type="hidden" name="search_action" value=""></input>
	<input type="hidden" name="pi_user_confirm" value=""></input>
</form>

<FORM name="lab_search_form" method="get" action="/servlets/Search">
	<input type="hidden" name="type" value=""></input>
	<input type="hidden" name="mode" value=""></input>
	<input type="hidden" name="search_action" value=""></input>
	<input type="hidden" name="communityID" value=""></input>
</form>

<table align="center" border="0" cellpadding="2" width="100%">

	<tr>
		<td align="center" nowrap>
			<font class="mainheader">Search ABRC Invoices</font>
		</td>
	</tr>

	<tr>
		<td class="sm" align="center">
			<br>
			If you would like to search for invoices for your personal stock
			orders, select
			<br>
			<br>
			<input type="button" name="userinvoice" value="View My Invoices"
				onClick="userSearch()"></input>
			<br>
			<br>

		</td>
	</tr>
	<tr>
		<td class="sm" align="center">
			<%
			  BsOrganization lab = null;
			  boolean first = true;
			  for (BsAffiliation activeLab : person.getActiveLabs()) {
			    // Display only active labs for which the logged-in user is
			    // either PI or contact person.
			    Boolean isPi = activeLab.getPi();
			    Boolean isContact =
			      activeLab.getContactPerson() == null ? Boolean.FALSE
			          : activeLab.getContactPerson();
			    if (isPi || isContact) {
			      lab = activeLab.getOrganization();
			      if (first) {
			%>
			<br>
			If you would like to search for invoices for orders placed by all
			members of your lab, select the appropriate link below.
			<br>
			<%
			  first = false;
			      }
			%>
			<br>
			<input type="button" name="labinvoice"
				value="<%=lab.getName()%> Invoices"
				onClick="labSearch(<%=lab.getCommunityId()%>)"></input>
			<%
			  }
			  }
			%>
		</td>
	</tr>
</table>



<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
