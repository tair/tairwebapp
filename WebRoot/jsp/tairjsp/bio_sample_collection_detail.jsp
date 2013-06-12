<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.querytools.*, org.tair.tfc.*, org.tair.utilities.*, java.util.*"
%>

<%!
String pageName = "Bio Sample Collection Detail";
%>


<% 
BioSampleCollectionDetail detail = (BioSampleCollectionDetail) request.getAttribute( "detail" ); 
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />
<% String  bgColor = null;  %>

<map name="file_map">

 <area shape="rect" coords="17,3,96,23" href="/servlets/TairObject?type=expression_set&id=<%= detail.get_tair_object_id() %>">
  <area shape="rect" coords="117,4,198,24" href="/servlets/TairObject?type=bio_sample_collection&id=<%=  detail.get_tair_object_id() %>">
  <area shape="rect" coords="222,5,290,23" href="/servlets/TairObject?type=hyb_descr_collection&id=<%=  detail.get_tair_object_id() %>">
  <area shape="rect" coords="318,1,385,24" href="/servlets/TairObject?type=array_design_info&id=<%=  detail.get_tair_object_id() %>">
  <area shape="rect" coords="423,3,496,25" href="/servlets/TairObject?type=expression_set_full&id=<%=  detail.get_tair_object_id() %>">
</map>

<table width="100%" border="0" colspan="2" cellspacing="0" >
      <tr>
        <td colspan="2"><B><font size="+1">Experiment: <%= detail.get_original_name() %></font></B></td>
      </tr>
      <tr>
      <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2"><b>
        Please note that TAIR stopped accepting new microarray data submissions in June 2005. 
        Newer and more comprehensive microarray data sets are available at <a href="http://www.ncbi.nlm.nih.gov/geo/">GEO</a>, <a href="http://www.ebi.ac.uk/arrayexpress/ ">ArrayExpress</a> 
        and <a href="http://affymetrix.arabidopsis.info/narrays/experimentbrowse.pl">NASCArrays</a>.
        </b></td>
      </tr>
      <tr>
      <td>&nbsp;</td>
      </tr>
      <tr>
        <TD colspan="2">
	   <img src="/images/samples.gif" usemap="#file_map" border="0">
        </TD>
      </tr>
    
     <%@ include file="/jsp/includes/bio_sample_collection.jsp" %>

</table>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
