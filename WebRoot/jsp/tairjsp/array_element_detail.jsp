<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*, java.util.*" %>

<%!
String pageName = "Array Element Detail";
%>

<% ArrayElementDetail object = (ArrayElementDetail) request.getAttribute("detail");
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<table width="100%" border="0" colspan="2" cellspacing="0" >

  <tr>
    <td colspan="3"><b><font size="+1">Array Element: <%= object.get_name() %></font></b></td>
  </tr>
  <tr>
      <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3"><b>
        Please note that TAIR stopped accepting new microarray data submissions in June 2005. 
        Newer and more comprehensive microarray data sets are available at <a href="http://www.ncbi.nlm.nih.gov/geo/">GEO</a>, <a href="http://www.ebi.ac.uk/arrayexpress/ ">ArrayExpress</a> 
        and <a href="http://affymetrix.arabidopsis.info/narrays/experimentbrowse.pl">NASCArrays</a>.
        </b></td>
      </tr>
      <tr>
      <td>&nbsp;</td>
      </tr>
  
   <%@ include file="/jsp/includes/array_element_info.jsp" %>

   <% boolean fullArrayDesign = false ;
      boolean fullPresent =  false ;
      boolean fullExpressed =  false ;
      String base_url = "/servlets/TairObject?id="+object.get_array_element_id(); 
   %>
  
 
  <%@ include file="/jsp/includes/array_ele_present_experi.jsp" %> 
  <%@ include file="/jsp/includes/array_ele_expressed_experi.jsp" %> 
  <%@ include file="/jsp/includes/array_ele_array_design.jsp" %>
 </table>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
