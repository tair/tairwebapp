<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.utilities.*, org.tair.bs.community.*"
%>

<%!
String pageName = "Update Country";
String highlight = "1";
%>

<%
String currentDate = TextConverter.dateToString( new java.util.Date() );

// if creating a new country, all member vars of country will be null
BsCountry country = (BsCountry) request.getAttribute( "country" );

%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>

    <form action="/servlets/processor" method="post">
      <input type="hidden" name="type" value="country">
      <input type="hidden" name="update_action" value="update">

      <input type="hidden" name="country_id" value="<%= EmptyTextConverter.convert( country.getCountryId().toString() ) %>">

      <table width="100%">

		<tr>
		  <td align="center"><font class="mainheader">Update Country</font></td>
		</tr>

		<tr>
		  <td>&nbsp;</td>
		</tr>

        <tr>
          <td>
		   <table border align="center" cellpadding="3" cellspacing="2">
		    <tr> 
			  <td><font class="formheader">Name</td>

			  <td>
			  	<%= HTMLFactory.createTextField( "name",
			  									 30,
			  									 30,
			  									 EmptyTextConverter.convert( country.getName() ) ) %>
		      </td>
			</tr>


			<tr>
			  <td><font class="formheader">Stock Center</font></td>
			  <td>
			  	  <%= HTMLFactory.createRadio( "stock_center",
			  	                               DataConstants.getABRCStockCenter(),
			  	                               new Boolean(BsCountry.StockCenter.ABRC.equals( country.getStockCenter() ) ) ) %>
			  	  <font class="formheader">ABRC</font>
			  	  
			  	  &nbsp;&nbsp;&nbsp;
	
			  	  <%= HTMLFactory.createRadio( "stock_center",
			  	                               DataConstants.getNASCStockCenter(),
			  	                               new Boolean( BsCountry.StockCenter.NASC.equals( country.getStockCenter() ) ) ) %>
	
			  	  <font class="formheader">NASC</font>
			  	  
			  	  &nbsp;&nbsp;&nbsp;
	
	
			  	  <%= HTMLFactory.createRadio( "stock_center",
			  	                               DataConstants.getOptionalStockCenter(),
			  	                               new Boolean( BsCountry.StockCenter.OPTIONAL.equals(country.getStockCenter()) ) ) %>
	
			  	  <font class="formheader">Optional</font>
	          </td>
	       </tr>
	       
	       <tr>
	       	 <td><font class="formheader">Phytosanitary Certificate Required?</font></td>
	       	 <td>
				<%= HTMLFactory.createCheckBox( "phytosanitary_required",
				                                "true",
				                                country.getPhytosanitaryRequired() ) %>
	         </td>
	       </tr>

	       <tr>
	       	 <td><font class="formheader">Express Shipping Multiplier</font>
	       	 <td>
	       	 	<%= HTMLFactory.createTextField( "express_shipping_multiplier",
	       	 	                                 10,
	       	 	                                 10,
	       	 	                                 EmptyTextConverter.convert( country.getExpressShippingMultiplier() ) ) %>
	         </td>
	        </tr>
	
	        <tr>
				<td><font class="formheader">Date Last Modified</font></td>
				<td>
	       	 	<%= HTMLFactory.createTextField( "date_last_modified",
	       	 	                                 10,
	       	 	                                 10,
												 currentDate ) %>
				</td>
		    </tr>
	    </table>
	  </td>
	</tr>

	<tr>
	  <td>&nbsp;</td>
	</tr>


	<tr>
	  <td align="center">
	    <input type="submit" value="Update Country">
	    &nbsp;&nbsp;
	    <input type="reset" value="Reset">
	  </td>
	</tr>

	 </table>
 </form>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
