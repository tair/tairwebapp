<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>


<%@ page import="java.util.*, org.tair.community.*, org.tair.utilities.*, java.text.*, org.tair.bs.community.*" %>
<%@ page errorPage = "/jsp/common/gen_error.jsp" %>

<%!
String pageName = "Community Person Submission Form"; 
String highlight = "1";
String helpfile="/help/helppages/commreg.jsp";
%>

<%
BsPerson person = null;
try {
      person = SessionHandler.getPerson( request );
} catch ( InvalidSessionException e ) {
      request.setAttribute( "exception", e );
      pageContext.forward( "/jsp/common/session_error.jsp" );
}

// set strings for display - lump code up here to keep HTML as simple as possible

// Extract the password string and trim it if it's there to get rid of trailing blanks,
// as these cause the JSP to compare and see a difference.
String password = person.getCommunity().getPassword();
if (password != null) {
  password = password.trim();
}

// if not US/Canada, populate otherRegion textbox with region info.
String otherRegion = null;
BsAddress address = person != null ? person.getCommunity().getAddress() : null;
if ( address != null && address.getRegion() != null && !DataConstants.getRegions().containsKey( address.getRegion() ) ) {
          otherRegion =  address.getRegion();
}

// default selected country to USA if new record
String countryStr = "USA";
if (address != null && address.getCountryObject() != null) {
  countryStr = ( address.getCountryObject().getName() == null ) ? "USA" : address.getCountryObject().getName();
}

// create display strings for urls
String url_1 = null;
String webName_1 = null;
String url_2 = null; 
String webName_2 = null;
int count = 0;
for (BsUrl url : person.getCommunity().getUrl()) {
  if (count == 0) {
    url_1 = url.getUrl();
    webName_1 = url.getWebSiteName();
  } else if (count == 1) {
    url_2 = url.getUrl();
    webName_2 = url.getWebSiteName();
  }
  count++;
}

// make string for keyword text boxes filled with pre-selected values
StringBuffer keywordStr = new StringBuffer();
String[] keywords = HTMLFactory.getKeywordTextFields( person.getCommunity().getKeywordStringArray() );
for ( int j = 0; j < keywords.length; j++ ) {
      keywordStr.append( keywords[ j ] + "&nbsp;\n" );
      if ( j > 0 && ( j + 1 ) % 2 == 0 ) {
      keywordStr.append( "<br>\n" );
    }
 }

// make string for organism checkboxes - fill in selected boxes
String[] organisms = person.getCommunity().getOrganismStringArray();
StringBuffer checkBoxStr = new StringBuffer();
String[] checkboxes = HTMLFactory.getOrganismCheckboxes( organisms );
int i = 0;
while ( ( i + 1 ) <= checkboxes.length / 2 ) {
      checkBoxStr.append( checkboxes[ i++ ] + "&nbsp;" );
}
checkBoxStr.append( "</td>\n</tr>\n<tr>\n<td>\n" );
while ( i < checkboxes.length ) {
      checkBoxStr.append( checkboxes[ i++ ] + "&nbsp;" );
}

// set flags for new person
CommunityState state = SessionHandler.getCommunityState( request );
boolean newPerson = state.getBooleanValue( "new_person" );

// create string to show textboxes if new, or uneditable text if existing record
String userNameStr = null;
String nameStr = null;
String lastNameStr = null;
if ( newPerson || LoginChecker.isTairCurator( request ) ) { 
      userNameStr = "<input type=\"text\" name=\"user_name\" size=\"15\" maxlength=\"30\" value=\"" + EmptyTextConverter.convert( person.getCommunity().getUserName() ) + "\">";
      // Set name to empty if it is the default value "Enter Last Name"
      if ("Enter Last Name".equals(person.getLastName())) {
        lastNameStr = "";
      } else {
        lastNameStr = person.getLastName();
      }
} else { 
      userNameStr = person.getCommunity().getUserName() + "<input type=\"hidden\" name=\"user_name\" value=\"" + person.getCommunity().getUserName() + "\">"; 
      if ( person.getMiddleName() != null ) {
         nameStr = person.getFirstName() + " " + person.getMiddleName() + " " + person.getLastName() + " " + EmptyTextConverter.convert( person.getSuffix() );
      } else {
         nameStr = person.getFirstName() + " " + person.getLastName() + " " + EmptyTextConverter.convert( person.getSuffix() );
      }
      // Set the last name to empty if it is the default value "Enter Last Name", otherwise set to last name.
      if ("Enter Last Name".equals(person.getLastName())) {
        lastNameStr = "";
      } else {
        lastNameStr = person.getLastName();
      }
}

// opt in new user's "send me mail" check box by default, or show their stored value 
Boolean sendMail = ( newPerson ) ? new Boolean( true ) : person.getSendMail();
%>



<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
<jsp:param name="helpfile" value="<%= helpfile %>" />
</jsp:include>


<table align="center">
      <tr>
	<td align="center"><font class="mainheader">Community - Person Submission Form</font> <A href="/help/helppages/commreg.jsp">[help]</A></td>
      </tr>
	  
      <tr>
	<td>
           Use this page to register as a TAIR Community member.
           Only registered users are allowed to update their personal
	  information, submit data to TAIR, and order stocks from ABRC. Fields with
	  asterisk (<font class="req">*</font>) are required.

	  Please fill in the form below, in and click 'Submit'.

	  <P>
	  Maximum number of characters for phone numbers is 20. Please separate extensions from main
	  number with an X and include no spaces (e.g.510-325-1521X310).
	    
	</td>
      </tr>
</table>

<p>


<table width="100%" bgcolor="#F1EFEC" align="center">
      <tr>
	<td>
	  <form action="/servlets/Community"  method="POST">
	    <table align="center" border="0" cellspacing="0" cellpadding="2">

	      <tr>
		<td colspan="2">
		  <font class="header">Personal Information</font>
		</td>
	      </tr>


              <% if ( newPerson || LoginChecker.isTairCurator( request ) ) { %>

	      <tr>
		<td><font class="req">*</font><font class="formheader">First Name</font></td>
		<td><font class="formheader">Middle Name</font></td>
	      </tr>
	      <tr>
		<td><input type="text" name="first_name" size="20" maxlength="30" value="<%= EmptyTextConverter.convert( person.getFirstName() ) %>"></td>
		<td><input type="text" name="middle_name" size="20" maxlength="30" value="<%= EmptyTextConverter.convert(  person.getMiddleName() ) %>"></td>
	      </tr>

	      <tr>
		<td colspan=2><font class="req">*</font><font class="formheader">Last Name</font> (e.g., Smith-Woo, Perez Rodriguez, de Vries)</td>
                
	      </tr>

	      <tr>
                <td><input type="text" name="last_name" size="20" maxlength="30" value="<%= EmptyTextConverter.convert( lastNameStr ) %>"></TD>
                <td><%= HTMLFactory.createCheckBox( "send_mail", "T", sendMail ) %> <font color="990000">Email me monthly TAIR release notes</font></TD>
               <td>&nbsp;</td>
	      </tr>

	      <tr>
		<td><font class="formheader">Suffix</font> (e.g., Sr, Jr)</td>
		<td><font class="formheader">Birthdate</font> (mm/dd/yyyy)</td>
	      </tr>

	      <tr>
		<td><input type="text" name="suffix" size="10" maxlength="10" value="<%= EmptyTextConverter.convert(  person.getSuffix() ) %>"></td>
		<td><input type="text" name="birthdate" size="10" maxlength="10" value="<%= EmptyTextConverter.convert( TextConverter.dateToString( person.getBirthdate() ) ) %>"></td>
	      </tr>


            <% } else { %>

	      <tr>
		<td colspan="2"><font class="formheader">Name</font></td>
	      </tr>

              <tr>
                <td>
                   <%= nameStr%>
                   <p>
                   <a href="javascript:location.href='mailto:curator@arabidopsis.org?SUBJECT=' + document.title + '&BODY=' +'URL: ' + escape(location.href)" onClick="javascript:urchinTracker('/outgoing/curator_at_arabidopsis_org');">Request a name change</a> by emailing the TAIR curators.
                   <input type="hidden" name="first_name" value="<%= person.getFirstName() %>">
                   <input type="hidden" name="middle_name" value="<%= EmptyTextConverter.convert( person.getMiddleName() ) %>">
                   <input type="hidden" name="last_name" value="<%= lastNameStr %>">
                   <input type="hidden" name="suffix" value="<%= EmptyTextConverter.convert( person.getSuffix() ) %>">
                </td>
                 <td> <%= HTMLFactory.createCheckBox( "send_mail", "T", sendMail ) %><font color="990000"> Email me monthly TAIR release notes</font></TD>
              </tr>

              <tr>
                <td colspan="2">&nbsp;</td>
              </tr>


	      <tr>
		<td><font class="formheader">Birthdate</font> (mm/dd/yyyy)</td>
                <td>&nbsp;</td>
	      </tr>

	      <tr>
		<td><input type="text" name="birthdate" size="10" maxlength="10" value="<%= EmptyTextConverter.convert( TextConverter.dateToString( person.getBirthdate() ) ) %>"></td>
                <td>&nbsp;</td>
	      </tr>

           <% } %>


	      <tr>
		<td colspan="2"><font class="req">*</font><font class="formheader">Primary Job Title</font></td>
	      </tr>
	      <tr>
		<td colspan="2"><%= HTMLFactory.createTitleSelect( "primary_job_title", person.getPrimaryJobTitle(), true ) %></td>
	      </tr>

	      <tr>
		<td colspan="2"><font class="formheader">Author Name</font> (last, first)</td>
	      </tr>
	      <tr>
		<td colspan="2"><input type="text" name="author_name" size="20" maxlength="50" value="<%= EmptyTextConverter.convert(  person.getCommunity().getAuthorName() ) %>"></td>
	      </tr>

	      <tr>
		<td colspan="2">
		  <font class="formheader">Other Names</font> (last, first e.g.  Watson, Bill) 
		  - separate multiple entries by return
		</td>
	      </tr>

	      <tr>
		<td colspan="2"><textarea name="alias" rows="3" cols="30" wrap="virtual"><%= EmptyTextConverter.convert( HTMLFactory.arrayToString( person.getCommunity().getAliasStringArray(), "\n" ) ) %></textarea></td>
	      </tr>

	      <tr>
		<td colspan="2">&nbsp;</td>
	      </tr>

              <tr>
		<td colspan="2">
		  <font class="header">Contact Information</font>
		</td>
	      </tr>

	      <tr>
		<td><font class="req">*</font><font class="formheader">Address</font> (separate multiple lines with return)</td>
		<td><font class="req">*</font><font class="formheader">City</font></td>
	      </tr>

	      <tr valign="top">
		<td><textarea name="address" cols="30" rows="3" wrap="virtual"><%=  address != null ? EmptyTextConverter.convert( TextConverter.dbToText(address.getAddress() ) ) : "" %></textarea></td>

		<td><input type="text" name="city" size="20" maxlength="30" value="<%= address != null ? EmptyTextConverter.convert( address.getCity() ) : "" %>"></td>
	      </tr>


	      <tr>
		<td><font class="req">*</font><font class="formheader">State/Province</font></td>
		<td><font class="formheader">Other</font></td>
	      </tr>

	      <tr>
		<td><%= HTMLFactory.createRegionSelect( "region", address != null ? address.getRegion() : null, true, "USA/Canada" ) %></td>
		<td><input type="text" name="region_other" size="20" maxlength="30" value="<%= EmptyTextConverter.convert(  otherRegion) %>"></td>
	      </tr>

	      <tr>
		<td><font class="req">*</font><font class="formheader">Country</font></td>
		<td><font class="req">*</font><font class="formheader">Zip/Postal Code</font></td>
	      </tr>

	      <tr>
		<td><%= HTMLFactory.createCountrySelect( "country", countryStr, false ) %></td>
		<td><input type="text" name="postal_code" size="10" maxlength="20" value="<%= EmptyTextConverter.convert(  address != null ? address.getPostalCode() : null ) %>"></td>
	      </tr>

	      <tr>
		<td colspan=2><font class="req">*</font><font class="formheader">E-mail </font></td> 
	      </tr>

	      <tr>
		<td  colspan=2><input type="text" name="email" size="20" maxlength="100" value="<%= EmptyTextConverter.convert(  person.getCommunity().getEmail() ) %>"></td>  
              
	      </tr>

	      <tr>
		<td><font class="formheader">Office Phone</font> (20 characters max)</td>
		<td><font class="formheader">Lab Phone</font> (20 characters max)</td>
	      </tr>

	      <tr>
		<td><input type="text" name="phone_work" size="20" maxlength="20" value="<%= EmptyTextConverter.convert( person.getCommunity().getPhone( "work" ) ) %>"></td>
		<td><input type="text" name="phone_lab" size="20" maxlength="20" value="<%= EmptyTextConverter.convert(  person.getCommunity().getPhone( "lab" ) ) %>"></td>
	      </tr>


	      <tr>
		<td><font class="formheader">Mobile Phone</font> (20 characters max)</td>
		<td><font class="formheader">Fax</font> (20 characters max)</td>
	      </tr>

	      <tr>
		<td><input type="text" name="phone_mobile" size="20" maxlength="20" value="<%= EmptyTextConverter.convert(  person.getCommunity().getPhone( "mobile" ) ) %>"></td>
		<td><input type="text" name="phone_fax" size="20" maxlength="20" value="<%= EmptyTextConverter.convert(  person.getCommunity().getPhone( "fax" ) ) %>"></td>
	      </tr>

	      <tr>
		<td><font class="formheader">URL</font></td>
		<td><font class="formheader">Website name</font></td>
	      </tr>

	      <tr>
		<td><input type="text" name="url_1" size="20" maxlength="255" value="<%= EmptyTextConverter.convert(  url_1) %>"></td>
		<td><input type="text" name="web_site_name_1" size="20" maxlength="100" value="<%= EmptyTextConverter.convert(  webName_1) %>"></td>
	      </tr>

	      <tr>
		<td><font class="formheader">URL</font></td>
		<td><font class="formheader">Website name</font></td>
	      </tr>

	      <tr>
		<td><input type="text" name="url_2" size="20" maxlength="255" value="<%= EmptyTextConverter.convert(  url_2) %>"></td>
		<td><input type="text" name="web_site_name_2" size="20" maxlength="100" value="<%= EmptyTextConverter.convert(  webName_2) %>"></td>
	      </tr>

	      
	      <tr>
		<td colspan="2">&nbsp;</td>
	      </tr>
	      
	      <tr>
		<td colspan="2">
		  <font class="header">Login Information</font>
		</td>
	      </tr>


	      <tr>
		<td colspan="2">
		  <table cellpadding="3" cellspacing="0" border="0">
		    <tr>
		      <td><font class="req">*</font><font class="formheader">Username</font></td>
		      <td><font class="req">*</font><font class="formheader">Password</font></td>
		      <td><font class="req">*</font><font class="formheader">Confirm Password</font>&nbsp;&nbsp;</td>
		    </tr>
		    <tr>
		      <td><%= userNameStr %></td>
		      <td><input type="password" name="password" size="10" maxlength="10" value="<%= EmptyTextConverter.convert( password ) %>"></td>
		      <td><input type="password" name="password_confirm" size="10" maxlength="10" value="<%= EmptyTextConverter.convert(  password ) %>"></td>
		    </tr>
		  </table>
		</td>	
	      </tr>

	      <tr>
		<td colspan="2"><font class="formheader">Password Hint</font> (NOTICE: your password hint is NOT secure. Please do not include any wording that would compromise your password security.)</td>	
	      </tr>

	      <tr>
		<td colspan="2"><input type="text" name="password_hint" size="30" maxlength="100" value="<%= EmptyTextConverter.convert(  person.getCommunity().getPasswordHint() ) %>"></td>
	      </tr>

	      <tr>
		<td colspan="2">&nbsp;</td>
	      </tr>

              <tr>
		<td colspan="2">
		  <font class="header">Other Information</font>
		</td>
	      </tr>

	      
	      <tr>
		<td colspan="2"><font class="formheader">Organism(s) of Interest</font></td>
	      </tr>
	      <tr>
		<td colspan="2">
		  <table>
		    <tr valign="top">	
			<td><%= checkBoxStr.toString() %></td>
		    </tr>

		    <tr>
		      <td>
			 Other: 
			<input type="text" name="organism" size="20" maxlength="200" value="<%= EmptyTextConverter.convert( HTMLFactory.getOtherOrganisms( organisms ) ) %>">
		      </td>
		    </tr>
		  </table>
		</td>
	      </tr>

	      <tr>
		<td colspan="2"><font class="formheader">Research Interest</font> (e.g., seeds, genome sequencing)</td>
	      </tr>
	      <tr>
		<td colspan="2"><textarea name="research_interest" cols="30" rows="3" wrap="virtual"><%= EmptyTextConverter.convert(  person.getResearchInterest() ) %></textarea></td>
	      </tr>

	      <tr>
		<td colspan="2">
		  <font class="formheader">Keywords</font> 
		  (choose up to six keywords that describe your research interest)
		</td>
	      </tr>
	      <tr>
		<td colspan="2"><%= keywordStr.toString() %></td>
	      </tr>

              <% if ( LoginChecker.isTairCurator( request ) ) { %>
              <tr>
                 <td colspan="2">&nbsp;</td>
              </tr>


              <tr>
                 <td colspan="2"><font class="header">Curator Information</font></td>
              </tr>

              <tr>
                 <td colspan="2"><font class="formheader">Status</font></td>
              </tr>

              <tr>
                <td colspan="2">
                   <%= HTMLFactory.createStatusSelect( "status", person.getCommunity().getMemberStatus(), false ) %>
                   &nbsp;&nbsp;
                   <%= HTMLFactory.createCheckBox( "is_obsolete", "T", person.getCommunity().getObsolete() ) %> Is Obsolete?
                   &nbsp;
                   <%= HTMLFactory.createCheckBox( "is_user_focus", "T", person.getUserFocus() ) %> Is User Focus?
                   &nbsp;
                   <%= HTMLFactory.createCheckBox( "is_external_curator", "T", person.getExternalCurator() ) %> External Curator?
                   &nbsp;
                   <%= HTMLFactory.createCheckBox( "is_tair_curator", "T", person.getTairCurator() ) %> TAIR Curator?
                </td>

              </tr>
              
              <% } else { %>

                   <input type="hidden" name="status" value="<%= EmptyTextConverter.convert( person.getCommunity().getMemberStatus() ) %>">
                   <input type="hidden" name="is_obsolete" value="<%= TextConverter.booleanToString( person.getCommunity().getObsolete() ) %>">
                   <input type="hidden" name="is_user_focus" value="<%= TextConverter.booleanToString( person.getUserFocus() ) %>">
                   <input type="hidden" name="is_tair_curator" value="<%= TextConverter.booleanToString( person.getTairCurator() ) %>">
                   <input type="hidden" name="is_external_curator" value="<%= TextConverter.booleanToString( person.getExternalCurator() ) %>">
              <% } %>
 
       <tr>
		<td align="center" colspan="2">
                  <input type="hidden" name="action" value="update">
		  <input type="submit" value="Submit" name="submit">
		  &nbsp;&nbsp;&nbsp;
		  <input type = "reset" value="Reset">
		</td>
	      </tr>
	      
	    </table>
	  </FORM>
	</td>
      </tr>
    </table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
