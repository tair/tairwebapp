<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>


<%@ page
	import="org.tair.community.*,org.tair.utilities.*,java.util.*,org.tair.bs.community.*"%>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>

<%!String pageName = "Lab Submission Form";
  String highlight = "1";
  String helppage = "help/helppages/commreg.jsp";%>

<%
  BsOrganization organization = null;
  try {
    organization = SessionHandler.getOrganization(request);
  } catch (InvalidSessionException e) {
    request.setAttribute("exception", e);
    pageContext.forward("/jsp/common/session_error.jsp");

  }

  // default lab name & address to person's name & address if this
  // is this first time user has seen this form -- should be flagged
  // by "default" param in request (added by EditHandler of CommunityServlet)
  Boolean defaultParam = (Boolean)request.getAttribute("default");
  boolean useDefault =
    (defaultParam != null && defaultParam.booleanValue());

  BsCommunity community = null;
  BsPerson person = null;
  BsAddress address = null;

  if (useDefault && SessionHandler.hasPerson(request)) {
    try {
      person = SessionHandler.getPerson(request);
      if (person != null) {
        community = person.getCommunity();
        address = person.getCommunity().getAddress();
      }
    } catch (InvalidSessionException e) {
      request.setAttribute("exception", e);
      pageContext.forward("/jsp/common/session_error.jsp");
    }

  } else {
    community = organization.getCommunity();
    address = community.getAddress();
  }

  String labName =
    useDefault ? person.getFirstName() + " " + person.getLastName()
                 + " Laboratory" : organization.getName();

  String otherRegion = null;
  if (address != null && address.getRegion() != null
      && !DataConstants.getRegions().containsKey(address.getRegion())) {
    otherRegion = address.getRegion();
  }

  String countryStr =
    (address != null && (address.getCountryObject() == null || address.getCountryObject().getName() == null)) ? "USA"
        : (address != null && address.getCountryObject() != null ? address.getCountryObject().getName() : "USA");

  // break up URLs for display
  String url_1 = null;
  String webName_1 = null;
  String url_2 = null;
  String webName_2 = null;
  Collection<BsUrl> urls = community.getUrl();
  if (urls != null && !urls.isEmpty()) {
    int count = 0;
    for (BsUrl url : urls) {
      if (count == 0) {
        url_1 = url.getUrl();
        webName_1 = url.getWebSiteName();
      } else if (count == 1) {
        url_2 = url.getUrl();
        webName_2 = url.getWebSiteName();
        break; // only 2 allowed
      }
      count++;
    }
  }
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

<table align="center">
	<tr>
		<td align="center">
			<font class="mainheader">Community - Lab Submission Form</font> [
			<A href="/help/helppages/commreg.jsp">help</A>]
		</td>
	</tr>

	<tr>
		<td>
			<b>This page allows you to submit information about your lab.
				This information will be used by the ABRC for billing and shipping
				information if you or your lab members place stock orders.</B>


			<p>
				<b>If you are registering a new laboratory, you will be declared
					the PI for the lab, and will be responsible for any fees associated
					with stock orders placed by any member of your lab.</b>
			<p>
				Asterisk (
				<font class="req">*</font>) indicates Required fields.
		</td>
	</tr>
</table>

<p>
<table width="100%" bgcolor="#F1EFEC" align="center">
	<tr>
		<td>
			<form action="/servlets/Community" method="POST">
				<table align="center" border="0" cellspacing="0" cellpadding="2">
					<tr>
						<td colspan="2">
							<font class="header">Lab Information</font>
						</td>
					</tr>

					<tr>
						<td colspan="2" nowrap>
							<font class="req">*</font><font class="formheader">Lab
								Name</font>&nbsp; (Please keep the name format as: First name Last name
							Lab (e.g., John Smith lab)
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<input type="text" name="name" size="30" maxlength="100"
								value="<%=EmptyTextConverter.convert(labName)%>">
						</td>
					</tr>

					<td colspan="2">
						Check if this is a commercial organization
						<%=HTMLFactory.createCheckBox("commercial",
                                           "T",
                                           organization.getCommercial())%>
					</td>
					</tr>

					<tr>
						<td colspan="2">
							<font class="formheader">Other Names</font> (e.g., ABRC -
							separate multiple entries by return)
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<textarea name="alias" rows="3" cols="30" wrap="virtual"><%=EmptyTextConverter.convert(HTMLFactory.arrayToString(community.getAliasStringArray(),
                                                                     "\n"))%></textarea>
						</td>
					</tr>

					<tr>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<font class="header">Contact Information</font>
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<font class="formheader">Contact Person Information</font> (the
							contact person will be able to update the record for this
							organization and add/update affiliations)
						</TD>
					</tr>

					<tr>
						<td colspan="2">
							<!-- if person doesn't have a login id in session, assume they're adding org as part of new registration -->
							<%
		    BsPerson contactPerson = organization.getContactPerson();
		    java.math.BigInteger contactId = 
		      contactPerson != null ? contactPerson.getCommunityId() : null;
		    java.math.BigInteger loginId = 
		      SessionHandler.hasLoginId(request) ? 
		        SessionHandler.getLoginId(request) : null;
		    java.math.BigInteger communityId = 
		      SessionHandler.hasCommunityID(request) ? 
		        SessionHandler.getCommunityID(request) : null;
		    Boolean isContactPerson = false;
		    // If logged in and contact ID is the same as the community ID,
		    // set the contact-person flag to true. Note that the login ID can
		    // be different from the community ID if a curator is doing the
		    // operation for a user.
		    if (contactId != null && loginId != null && communityId != null &&
		        contactId.equals(communityId)) {
		      isContactPerson = true;
		    }
		  %>
							<%=HTMLFactory.createCheckBox("is_contact_person",
                                           "true",
                                           isContactPerson)%>
							I am the contact person for this organization
						</td>
					</tr>

					<tr>
						<td>
							<font class="req">*</font><font class="formheader">Address</font>
							(separate multiple lines with return)
						</td>
						<td>
							<font class="req">*</font><font class="formheader">City</font>
						</td>
					</tr>

					<tr valign="top">
						<td>
							<textarea name="address" cols="30" rows="3" wrap="virtual"><%=address != null ? EmptyTextConverter.convert(TextConverter.dbToText(address.getAddress())) : ""%></textarea>
						</td>
						<td>
							<input type="text" name="city" size="30" maxlength="30"
								value="<%=address != null ? EmptyTextConverter.convert(address.getCity()) : ""%>">
						</td>
					</tr>


					<tr>
						<td>
							<font class="req">*</font><font class="formheader">State/Province</font>
							(US/CANADA)
						</td>
						<td>
							<font class="formheader">State</font> (Other)
						</td>
					</tr>

					<tr>
						<td><%=HTMLFactory.createRegionSelect("region",
                                               address != null ? address.getRegion() : "",
                                               true)%></td>
						<td>
							<input type="text" name="region_other" size="30" maxlength="30"
								value="<%=EmptyTextConverter.convert(otherRegion)%>">
						</td>
					</tr>

					<tr>
						<td>
							<font class="req">*</font><font class="formheader">Country</font>
						</td>
						<td>
							<font class="req">*</font><font class="formheader">Zip/Postal
								Code</font>
						</td>
					</tr>

					<tr>
						<td><%=HTMLFactory.createCountrySelect("country", countryStr, false)%></td>
						<td>
							<input type="text" name="postal_code" size="10" maxlength="20"
								value="<%=address != null ? EmptyTextConverter.convert(address.getPostalCode()) : ""%>">
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<font class="formheader">E-mail </font>
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<input type="text" name="email" size="30" maxlength="100"
								value="<%=EmptyTextConverter.convert(community.getEmail())%>">
						</td>
					</tr>


					<tr>
						<td>
							<font class="formheader">Main Phone</font> (20 characters max)
						</td>
						<td>
							<font class="formheader">Fax</font> (20 characters max)
						</td>
					</tr>

					<tr>
						<td>
							<input type="text" name="phone_work" size="20" maxlength="20"
								value="<%=EmptyTextConverter.convert(community.getPhone("work"))%>">
						</td>
						<td>
							<input type="text" name="phone_fax" size="20" maxlength="20"
								value="<%=EmptyTextConverter.convert(community.getPhone("fax"))%>">
						</td>
					</tr>

					<tr>
						<td>
							<font class="formheader">URL</font>
						</td>
						<td>
							<font class="formheader">Website name</font>
						</td>
					</tr>

					<tr>
						<td>
							<input type="text" name="url_1" size="30" maxlength="255"
								value="<%=EmptyTextConverter.convert(url_1)%>">
						</td>
						<td>
							<input type="text" name="web_site_name_1" size="30"
								maxlength="100"
								value="<%=EmptyTextConverter.convert(webName_1)%>">
						</td>
					</tr>

					<tr>
						<td>
							<font class="formheader">URL</font>
						</td>
						<td>
							<font class="formheader">Website name</font>
						</td>
					</tr>

					<tr>
						<td>
							<input type="text" name="url_2" size="30" maxlength="255"
								value="<%=EmptyTextConverter.convert(url_2)%>">
						</td>
						<td>
							<input type="text" name="web_site_name_2" size="30"
								maxlength="100"
								value="<%=EmptyTextConverter.convert(webName_2)%>">
						</td>
					</tr>


					<tr>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<font class="header">Other Information</font>
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<font class="formheader">Description</font>
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<textarea name="description" cols="30" rows="3" wrap="virtual"><%=EmptyTextConverter.convert(organization.getDescription())%></textarea>
						</td>
					</tr>


					<%
             if (LoginChecker.isTairCurator(request)) {
           %>
					<tr>
						<td colspan="2">
							&nbsp;
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<font class="header">Curator Information</font>
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<font class="formheader">Status</font>
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<%=HTMLFactory.createStatusSelect("status",
                                                 community.getMemberStatus().toString(),
                                                 false)%>
							&nbsp;&nbsp;
							<%=HTMLFactory.createCheckBox("is_obsolete",
                                             "T",
                                             community.getObsolete())%>
							is Obsolete? &nbsp;
							<%=HTMLFactory.createCheckBox("NASC_fee_paid",
                                             "T",
                                             organization.getNascFeePaid())%>
							NASC fee paid? &nbsp;
							<%=HTMLFactory.createCheckBox("ABRC_fees_waived",
                                             "T",
                                             organization.getAbrcFeesWaived())%>
							ABRC fees waived?
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<font class="formheader">Seed Stock Center</font>
						</td>
					</tr>

					<tr>
						<td colspan="2"><%=HTMLFactory.createStockCenterSelect("seed_stock_center",
                                                      organization.getSeedStockCenter(),
                                                      true)%></td>
					</tr>



					<%
                               } else {
                             %>
					<input type="hidden" name="is_obsolete"
						value="<%=TextConverter.booleanToString(community.getObsolete())%>">
					<input type="hidden" name="NASC_fee_paid"
						value="<%=TextConverter.booleanToString(organization.getNascFeePaid())%>">
					<input type="hidden" name="ABRC_fees_waived"
						value="<%=TextConverter.booleanToString(organization.getAbrcFeesWaived())%>">
					<input type="hidden" name="status"
						value="<%=EmptyTextConverter.convert(organization.getCommunity().getMemberStatus().toString())%>">
					<%
                }
              %>

					<tr>
						<td align="center" colspan="2">
							<input type="hidden" name="action" value="update">
							<input type="hidden" name="org_type" value="lab">
							<input type="submit" value="Submit" name="submit">
							&nbsp;&nbsp;&nbsp;
							<input type="reset" value="Reset">
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
