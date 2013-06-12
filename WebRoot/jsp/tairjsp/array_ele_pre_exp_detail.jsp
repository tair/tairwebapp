<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*, java.util.*" %>

<%!
String pageName = "Array Element Detail";
%>

<%  ArrayElementPresentExperimentsDetail object = (ArrayElementPresentExperimentsDetail) request.getAttribute("detail");
%>


<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<table width="100%" border="0" colspan="2" cellspacing="0" >
<tr>
    <td colspan="3"><h1>Array Element: <%= object.get_name() %></h1></td>
  </tr>
  
   <%@ include file="/jsp/includes/array_element_info.jsp" %>
   <%  boolean fullArrayDesign = false ;
      boolean fullPresent =  true ;
      boolean fullExpressed = false;
      String base_url = "/servlets/TairObject?id="+object.get_array_element_id(); 
   %>
   
   <%@ include file="/jsp/includes/array_ele_present_experi.jsp" %> 
   <%@ include file="/jsp/includes/array_ele_expressed_experi.jsp" %>
   <%@ include file="/jsp/includes/array_ele_array_design.jsp" %>
</table>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
