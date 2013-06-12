<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.utilities.*, org.tair.tfc.*"
%>

<%!
String pageName = "Update ABRC Stock";
String highlight = "7";
%>

<%
String currentDate = TextConverter.dateToString( new java.util.Date() );
TfcStock stock = (TfcStock) request.getAttribute( "stock" );
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

    <form action="/servlets/Order" method="post">
      <input type="hidden" name="state" value="updateStock">
      <input type="hidden" name="update_action" value="update">
      <input type="hidden" name="stock_id" value="<%= stock.get_stock_id() %>">

      <table width="100%">
	<tr>
	  <td align="center"><font class="mainheader">Stock Number <%= stock.get_name() %></font></td>
	</tr>
    <tr>
          <td align="right">
          <input type="submit" value="Update Stock">
          </td>
    </tr>

	<tr>
	  <td>
	    

	    <table width="100%" cellpadding="2" cellspacing="0" border="0" bgcolor="<%= DataConstants.BGCOLOR %>">
	      <tr>
		<td colspan="4" align="center"><font class="formheader">General Information</font></td>
	      </tr>

	      <tr>
		<td align="right">Stock Type</td>
		<td><%= HTMLFactory.createStockTypeSelect( "stock_type_id", EmptyTextConverter.convert( stock.get_stock_type_id() ), false ) %></td>
		<td align="right">Availability</td>
		<td><%= HTMLFactory.createStockAvailabilitySelect( "stock_availability_type_id", EmptyTextConverter.convert( stock.get_stock_availability_type_id() ), false ) %></td>
              </tr>


              <tr valign="top">
                <td colspan="4">
                  <table align="center">
                     <tr>
                        <td nowrap>
   		           <%= HTMLFactory.createCheckBox( "is_seed", "true", stock.get_is_seed() ) %> Is Seed Stock
  		           <br>
		           <%= HTMLFactory.createCheckBox( "NASC_request_fee", "true", stock.get_NASC_request_fee() ) %> Forward Request to NASC (user fee)
		           <br>
		           <%= HTMLFactory.createCheckBox( "NASC_request", "true", stock.get_NASC_request() ) %> Forward Request to NASC (no user fee)
		           <br>
 		           <%= HTMLFactory.createCheckBox( "is_restricted", "true", stock.get_is_restricted() ) %> Restricted to Academic Labs
                        </td>

                        <td nowrap>
	 	           <%= HTMLFactory.createCheckBox( "is_molecular_mapping", "true", stock.get_is_molecular_mapping() ) %> Is Molecular Mapping
 		           <br>
		           <%= HTMLFactory.createCheckBox( "is_classical_mapping", "true", stock.get_is_classical_mapping() ) %> Is Classical Mapping
		           <br>
		           <%= HTMLFactory.createCheckBox( "has_stock_notes", "true", stock.get_has_stock_notes() ) %> Has stock notes?
		           <br>
		           <%= HTMLFactory.createCheckBox( "MTA_signature", "true", stock.get_MTA_signature() ) %> MTA Signature Required Before Shipment
                        </td>
                     </tr>
                  </table>
		</td>
	      </tr>
      
	      <tr>
		<td valign="top">Description</td>
		<td valign="top" colspan="3"><textarea name="description" cols="50" rows="5" wrap="virtual"><%= EmptyTextConverter.convert( stock.get_description() ) %></textarea></td>
	      </tr>

	      <tr>
		<td>Base Price</td>
		<td colspan="3">
		  <input type="text" name="base_price" size="15" maxlength="15" value="<%= TextConverter.floatToString( stock.get_base_price() ) %>">
		  &nbsp;&nbsp;&nbsp;
		  <%= HTMLFactory.createCheckBox( "fixed_price", "true", stock.get_fixed_price() ) %> Fixed Price Stock
		</td>
	      </tr>

              <tr>
                <td>Express Shipping Charge</td>
                <td colspan="3">
    	            <input type="text" name="express_shipping_charge" size="15" maxlength="15" value="<%= TextConverter.floatToString( stock.get_express_shipping_charge() ) %>">
	    			&nbsp;&nbsp;&nbsp;           
	           		<%= HTMLFactory.createCheckBox( "express_shipping_required", "true", stock.get_express_shipping_required() ) %> Express Shipping Required?
                
              </tr>


	      <tr>
		<td colspan="4">&nbsp;</td>
	      </tr>

	      <tr>
		<td colspan="4" align="center"><font class="formheader">Shipping Information</font></td>
	      </tr>

	      <tr>
		<td>Format Received</td>
		<td><input type="text" name="format_received" size="20" maxlength="20" value="<%= EmptyTextConverter.convert( stock.get_format_received() ) %>"></td>
		<td valign="top" rowspan="2">Kit Contents</td>
		<td valign="top" rowspan="2"><textarea name="kit_contents" cols="20" rows="4" wrap="virtual"><%= EmptyTextConverter.convert( stock.get_kit_contents() ) %></textarea></td>
	      </tr>

	      <tr>
		<td>Format Shipped</td>
		<td><input type="text" name="format_shipped" size="20" maxlength="100" value="<%= EmptyTextConverter.convert( stock.get_format_shipped() ) %>"></td>
	      </tr>

	      <tr>
		<td>Number in Set</td>
		<td><input type="text" name="number_in_set" size="5" maxlength="5" value="<%= EmptyTextConverter.convert( stock.get_number_in_set() ) %>"></td>
		<td>Number of Lines</td>
		<td><input type="text" name="num_lines" size="5" maxlength="5" value="<%= EmptyTextConverter.convert( stock.get_num_lines() ) %>"></td>
	      </tr>

	      <tr>
		<td colspan="4">&nbsp;</td>
	      </tr>

	      <tr>
		<td colspan="4" align="center"><font class="formheader">Growth/Storage Information</font></td>
	      </tr>

	      <tr>
		<td>Media</td>
		<td><input type="text" name="media" size="20" maxlength="20" value="<%= EmptyTextConverter.convert( stock.get_media() ) %>"></td>
		<td rowspan="3" valign="top">Maintenance<br>Method</td>
		<td rowspan="3" valign="top"><textarea name="maintenance_method" cols="20" rows="4" wrap="virtual"><%= EmptyTextConverter.convert( stock.get_maintenance_method() ) %></textarea></td>
	      </tr>

	      <tr>
		<td>Duration of Growth</td>
		<td><input type="text" name="duration_of_growth" size="20" maxlength="20" value="<%= EmptyTextConverter.convert( stock.get_duration_of_growth() ) %>"></td>
	      </tr>

	      <tr>
		<td>Growth Temperature</td>
		<td><input type="text" name="growth_temperature" size="20" maxlength="20" value="<%= EmptyTextConverter.convert( stock.get_growth_temperature() ) %>"></td>
	      </tr>

	      <tr>
		<td>Box</td>
		<td><input type="text" name="box" size="20" maxlength="20" value="<%= EmptyTextConverter.convert( stock.get_box() ) %>"></td>
		<td rowspan="3" valign="top">ABRC<br>Comments</td>
		<td rowspan="3" valign="top"><textarea name="ABRC_comments" cols="20" rows="4" wrap="virtual"><%= EmptyTextConverter.convert( stock.get_ABRC_comments() ) %></textarea></td>
	      </tr>

	      <tr>
		<td>Position</td>
		<td><input type="text" name="position" size="20" maxlength="20" value="<%= EmptyTextConverter.convert( stock.get_position() ) %>"></td>
	      </tr>

	      <tr>
		<td>Location</td>
		<td><input type="text" name="location" size="20" maxlength="20" value="<%= EmptyTextConverter.convert( stock.get_location() ) %>"></td>
	      </tr>

	      <tr>
		<td colspan="4">&nbsp;</td>
	      </tr>

	      <tr>
		<td>Date Entered</td>
		<td><input type="text" name="date_entered" size="10" maxlength="10" value="<%= EmptyTextConverter.convert( TextConverter.dateToString( stock.get_date_entered() ) ) %>"></td>
		<td>Release Date</td>
		<td><input type="text" name="release_date" size="10" maxlength="10" value="<%= EmptyTextConverter.convert( TextConverter.dateToString( stock.get_release_date() ) ) %>"></td>
	      </tr>

	      <tr>
		<td>Date Last Modified</td>
		<td colspan="3">
		  <input type="text" name="date_last_modified" size="10" maxlength="10" value="<%= currentDate %>">
		  &nbsp;&nbsp;&nbsp;
		  <%= HTMLFactory.createCheckBox( "is_obsolete", "true", stock.get_is_obsolete() ) %> Is Obsolete
		</td>
	      </tr>

	    </table>
	  </td>
	</tr>

	<tr>
	  <td align="center">
	    <input type="submit" value="Update Stock">
	    &nbsp;&nbsp;
	    <input type="reset" value="Reset">
	  </td>
	</tr>

      </table>
    </form>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
