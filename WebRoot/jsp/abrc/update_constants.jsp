<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  Page that allows ABRC curators to edit the values of various
  constants used in the stock ordering tools.
-->

<%@ page
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.abrc.*, org.tair.tfc.*, org.tair.utilities.*, java.util.*"
%>

<%!
String pageName = "Abrc Constants";
%>

<%
AbrcConstantCollection constants = 
  (AbrcConstantCollection) request.getAttribute( "constants" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>


<form action="/servlets/Order" method="post">
<input type="hidden" name="state" value="constant">
<input type="hidden" name="update_action" value="update">

<p>

<table width="100%">
    <tr>
        <td align="center"><font class="header">ABRC Constants</font></td>
    </tr>

    <tr>
        <td>
            <p>
              Below are the current values of all constants used 
              in the stock ordering process to determine amounts such
              as stock prices and shipping charges for different users
              and labs according to their profiles.
            </p>

            <p>
              Constant values can be updated by changing the numeric
              value and clicking the "Update" button.  NOTE: all constants
              will be updated to the values currently displaying in the form.
            </p>
        </td>
    </tr>

    <tr>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td>
            <table align="center" width="100%" cellpadding="2" border>
                <tr>
                   <th nowrap>Constant Name</th>
                   <th nowrap>Description</th>
                   <th nowrap>Constant Value</th>
                </tr>


        <!-- 
             Print out all constants in db currently.  Editable form fields named to
             include abrc_constant_id with field name to allow for updating of all 
             constants in single form 
        -->

             <% for ( Iterator iter = constants.iterator(); iter.hasNext(); ) { %>
                <% TfcAbrcConstant constant = (TfcAbrcConstant) iter.next(); %>
   
                    <tr valign="top">
                        <td><%= constant.get_name() %></td>
                        <td><%= EmptyTextConverter.convert( constant.get_description() ) %></td>

                        <% String id = constant.get_abrc_constant_id().toString(); %>
                        <% String constantFieldName = "constant_" + id; %>

                        <td>
                            <input type="text" size="5" maxlength="5" name="<%= constantFieldName %>" value="<%= constant.get_constant() %>">
                        </td>
                    </tr>
             <% } %>

            </table>
        </td>
    </tr>

    <tr>
        <td>&nbsp;</td>
    </tr>

    <tr>
        <td align="center">
            <input type="submit" value="Update">
            &nbsp;&nbsp;&nbsp;
            <input type="reset" value="reset">
        </td>
    </tr>

</table>
</form>



<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />


