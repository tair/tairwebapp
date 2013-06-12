<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="/jsp/common/gen_error.jsp" %>
<%@ page import="org.tair.processor.statistics.*, java.util.*, org.tair.utilities.*" %>

<%!
String pageName = "public table statistics";
String highlight = "1";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<% 
   TableStatisticsCollection coll = ( TableStatisticsCollection)request.getAttribute("table_statistics_collection") ;
%>

<center>
<TABLE width="602" align="center" border="0" cellspacing="0" cellpadding="2">
	<TR>
	<TD width="602" align="center"> 
<TR>
    <TD class="lg" valign="top" align="center">
        <H2>TAIR Database Statistics</H2></TD>
</TR>
<TR>
    <TD class="lg" valign="top" align="center">
        Date Run : <%=  coll.get_date_last_run()  %>
    </TD>
</TR>

<TR>
    <TD>
   <center>
   <TABLE border="1" cellspacing="0" cellpadding="4" width="80%">

 <%
      if ( coll != null && coll.get_tables_statistics () != null){
	Iterator coll_iter = coll.get_tables_statistics () ;
	while ( coll_iter.hasNext() ) {
            TableStatistics stat  = (TableStatistics)coll_iter.next() ;
            String tableColor =  myBgColor.toggleBgColor();
            int field_names_count = stat.field_names_count();
           // has more than two fields(l larger)
	    boolean hasl2fields = false ;
            if (  field_names_count > 1 ){  hasl2fields = true ;}
 %>    
 
   <TR <%= tableColor  %>>    
     <TD valign=top rowspan=<%= stat.fileds_count()+1 %> class="lg">
        <%= stat.get_table_name()  %> 
     </TD>
     <TD  colspan=2><B>TOTAL</B></TD>
     <TD><B><%=  EmptyTextConverter.convert(stat.get_table_statistics())  %></B> </TD>
  </TR>
  <%    String field_display_name = "";
	Iterator field_names = stat.getFieldNames ( );
	if (field_names != null){
	    while ( field_names.hasNext () ){
		 String field_name = (String) field_names.next();
                 field_display_name = "";
                 if ( field_name.equals("gene_model_type_id")){
                      field_display_name = "gene_model_type";
                 }else {
                      field_display_name = field_name ;
                 }
                 field_display_name = field_display_name.replace('_', ' ') ;
                 boolean first_field_name = true ;
  		 Iterator field_statses = stat.getFieldAndStats ( field_name );
                 if (field_statses != null ){
	            while ( field_statses.hasNext() ){
                       FieldStatistics  field_stats =(FieldStatistics )field_statses.next();

   %> 

 <TR <%= tableColor %> >
      <% if (hasl2fields && first_field_name ){  %>
      <TD class="sm" rowspan=<%= stat.fileds_count(field_name) %> valign=top><%=  field_display_name %></TD>
      <TD class="sm"><%= field_stats.get_display_value () %></TD>
      <% }else if (hasl2fields && ! first_field_name ){ %>
      <TD class="sm"><%= field_stats.get_display_value () %></TD>
      <% }else{ %>
      <TD class="sm" colspan=2><%= field_stats.get_display_value () %></TD>
      <% } %>
     <TD><%= field_stats.get_field_stats()  %> </TD>
 </TR>
 
<% first_field_name = false; }  }  }}} } %>
 
</table>
</center>
</TD>
</TR>
 </TABLE>
    </TD>
   </TR>
</TABLE>
</center>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />






