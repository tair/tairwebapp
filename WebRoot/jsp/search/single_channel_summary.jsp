<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, java.math.*"%>
<%!
String pageName = "Expression Search Results";
String highlight = "1";
%>

<% 
// get results of search
String summaryType = "single_channel";
String searchCriteria = ( request.getAttribute( "searchCriteria" ) != null ) ? ( String )request.getAttribute( "searchCriteria" ) : " ";
String ntfMsg = ( request.getAttribute( "ntfMsg" ) != null ) ? ( String )request.getAttribute( "ntfMsg" ) : " ";
String color = ( request.getAttribute( "color" ) != null ) ? ( String )request.getAttribute( "color" ) : "RG";
int pageSize = ( request.getAttribute( "size" ) != null ) ? ( ( Integer )request.getAttribute( "size" ) ).intValue() : 25;
int currentPage = ( request.getAttribute( "pageNum" ) != null ) ? ( ( Integer )request.getAttribute( "pageNum" ) ).intValue() : 1;
String queryID = (String) request.getAttribute( "query_id" );
// by default , it's sort by ABS(repl_signal) DESC;
String sortColumn = ( request.getAttribute( "sortColumn" ) != null ) ? ( String )request.getAttribute( "sortColumn" ) : "ABS(repl_signal) DESC";
String reSort = ( request.getAttribute( "reSort" ) != null ) ? ( String )request.getAttribute( "reSort" ) : " ";
String selected = " "; // default value for re-sort drop down menu, selected option
ResultsFetcher results = new ResultsFetcher( queryID, summaryType );
int resultSize = results.getResultSetSize();
results.setPageSize( pageSize );
if ( ( !reSort.equals( " " ) || reSort.equals( "T" ) ) && !sortColumn.equals( " " ) ) {
    results.setSort( sortColumn );
    currentPage = 1;    
}
results.setSummaryPage( currentPage );
// set up the paging links for display at the bottom of the page
String scrollLinks = null;
if ( results.getTotPages() > 0 ) {
scrollLinks = ScrollCalculator.getTableScrollLinks( pageSize, currentPage, results.getTotPages(), queryID );
}
%>
<SCRIPT LANGUAGE="JavaScript">
<!--

function mySubmit( pageNum, action, size, query_id ) {
document.single_channel_search_result.pageNum.value = pageNum;
document.single_channel_search_result.action.value = action;
document.single_channel_search_result.size.value = size;
document.single_channel_search_result.query_id.value = query_id;
document.single_channel_search_result.submit();
}

function checkAll()
{
for(i=0;i<document.single_channel_search_result.elements.length;i++)
{
var c = document.single_channel_search_result.elements[i];   
c.checked = i;   
}
}
// here if ya need it
function unCheckAll()
{
for(i=0;i<document.single_channel_search_result.elements.length;i++)
{
var c = document.single_channel_search_result.elements[i];   
c.checked ='';   
}
}

// -->
</SCRIPT>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />

<form action="<%=response.encodeURL("/servlets/Search")%>" name="single_channel_search_result" method="post">
<input type="hidden" name="action" value="search">
<input type="hidden" name="type" value='<%=summaryType%>' />
<input type="hidden" name="size" value='<%=pageSize%>' />
<input type="hidden" name="pageNum" value='<%=currentPage%>' />
<input type="hidden" name="color" value='<%=color%>' />
<input type="hidden" name="query_id" value="" />
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
<tr>
<td width="100%" align="left"> 
<SPAN class="header">TAIR Microarray Expression Search</SPAN>
[<A href="/help/helppages/expression_search.jsp" target="_blank">Help</A>]
	  <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#F1EFEC">
	    <tr>
	      <td align="center" width="33%" class="sm">
		<input type="button" value="new search" onClick="javaScript:mySubmit('1','new_search', 25)" ><BR>
		new expression search
	      </td>
          <td align="center" width="33%" class="sm">
		   <input type="button" value="download all" onClick="mySubmit( 0, 'downloadAll', <%= resultSize %>, '<%=queryID%>' )" ><BR>
                       download all results
           </td>
	      <td align="center" width="34%" class="sm">
		<input type="button" value="download checked" onClick="javaScript:mySubmit( 0,'download', 25, '<%=queryID%>')" ><BR>
		check the boxes below and download results
	      </td>
	    </tr>
	  </table>
</td>
</tr>

<tr>
<% if ( results.getResultSetSize() > 0 ) { %>
        <td>
        <%=searchCriteria%><font class="emphasis"><%=results.getResultSetSize()%></font> records. 
        <p>Displaying <%=results.getStartRow()%> - <%=results.getEndRow()%> of <%=results.getResultSetSize()%> records on page <%=currentPage%> of <%=results.getTotPages()%> pages.<%=ntfMsg%>
        </td>
<% } else { %>
        <td>
        <%=searchCriteria%><font class="emphasis"> <%=results.getResultSetSize()%></font> records. 
        <p><%=ntfMsg%>
        <p>
        Please consider the following as you modify your query and try again:<br><br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Make sure you selected the<font class="emphasis"> right name type</font> within the <b>'Select Genes/Array Elements'</b> section.<br><br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Make sure you selected the <font class="emphasis">right array type</font> and/or <font class="emphasis">array design</font> within the <b>'Select Array Type/Design'</b> section.<br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Modify the<font class="emphasis"> expression values</font> selected within the <b>'Limit Search By Expression Values'</b> section.<br><br>

	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Modify the<font class="emphasis"> experiments</font> selected within the <b>'Limit by Experiment Parameters'</b> section.<br>
        </td>
<% } %>
</tr>
      
<% if ( results.getResultSetSize() > 0 ) { %>
<tr>
        <tr valign="top" bgcolor="#F5F9FF">
           <td><input type="button" name="check7" value="Check All" onClick="checkAll()"><input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()"> 
                    <input type="button" value="re-sort by" onClick="javaScript:mySubmit( 1,'re_sort','<%=pageSize%>','<%=queryID%>')" > 
                    <select name="sortColumn">
                        <%selected = ( sortColumn.equalsIgnoreCase( "experiment_name" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="experiment_name"><%=results.getDisplayName("experiment_name")%></option>
                        <%selected = ( sortColumn.equalsIgnoreCase( "hyb_desc_name" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="hyb_desc_name">Replicate Set</option>
                        <%selected = ( sortColumn.equalsIgnoreCase( "name" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="name"><%=results.getDisplayName("name")%></option>
                        <%selected = ( sortColumn.equalsIgnoreCase( "locus" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="locus"><%=results.getDisplayName("locus")%></option>
                        <%selected = ( sortColumn.equalsIgnoreCase( "ABS(repl_signal) DESC" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="ABS(repl_signal) DESC"><%=results.getDisplayName("repl_signal")%>(high to low)</option>
		    	<%selected = ( sortColumn.equalsIgnoreCase( "ABS(repl_signal)" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value= "ABS(repl_signal)" ><%=results.getDisplayName("repl_signal")%>(low to high)</option>
                        <%selected = ( sortColumn.equalsIgnoreCase( "ABS(repl_signal_percentile) DESC"  ) ) ? "selected" : " ";%>
                    <option <%=selected%> value= "ABS(repl_signal_percentile) DESC" ><%=results.getDisplayName("repl_signal_percentile")%>(high to low)</option>
		    	<%selected = ( sortColumn.equalsIgnoreCase( "ABS(repl_signal_percentile)" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value= "ABS(repl_signal_percentile)" ><%=results.getDisplayName("repl_signal_percentile")%>(low to high)</option>
                    </select> 

                </td>
        </tr> 
<td>

<table width="100%" border="0" cellspacing="0">

<tr  <%=myBgColor.toggleBgColor()%> >

<td class="sm">&nbsp; </td> 

<td class="sm" align="center">
    <h5><font color="#800000">
    <%=results.getDisplayName("name")%><%=DefinitionsLookup.createPopupLink("ArrayElement","name")%>
<br>(<%=results.getDisplayName("locus")%><%=DefinitionsLookup.createPopupLink("Locus","class")%>)
    </font></h5>
</td>
<td class="sm">&nbsp; </td> 
<td class="sm" align="center">
   <h5><font color="#800000">
   <%=results.getDisplayName("experiment_name")%><%= DefinitionsLookup.createPopupLink("ExpressionSet","class") %>
   </font></h5>
</td>

<td class="sm">&nbsp; </td> 

<td class="sm" align="center" wrap>
    <h5><font color="#800000"><%=results.getDisplayName("environmental_variables")%><%= DefinitionsLookup.createPopupLink("Glossary","Sample Variables") %>
    </font></h5>
</td>

<td class="sm" align="center">
    <h5><font color="#800000"><%=results.getDisplayName("hyb_desc_id")%><br>id/name<%= DefinitionsLookup.createPopupLink("HybDescription","class") %>   
    </font></h5>
</td>

<td class="sm" align="center">
    <h5><font color="#800000"><%=results.getDisplayName("repl_detection")%> Call <br>(<%=results.getDisplayName("repl_detection_pvalue")%>/<br>
<%=results.getDisplayName("repl_detection_pvalue_stderr")%>)<%= DefinitionsLookup.createPopupLink("SingleChannelHybData","repl_detection") %>
    </font></h5>
</td>

<td class="sm" align="center">
   <h5><font color="#800000"><%=results.getDisplayName("repl_signal")%>
<br>(<%=results.getDisplayName("repl_signal_stderr")%>)<%= DefinitionsLookup.createPopupLink("SingleChannelHybData","repl_signal") %>
   </font></h5>
</td>

<td class="sm" align="center">
   <h5><font color="#800000"><%=results.getDisplayName("repl_signal_percentile")%><br>(<%=results.getDisplayName("repl_signal_percentile_stderr")%>)<%= DefinitionsLookup.createPopupLink("SingleChannelHybData","repl_signal_percentile") %>
   </font></h5>
</td>

<td class="sm" align="center">
   <h5><font color="#800000"><%=results.getDisplayName("hyb_data_name")%><%= DefinitionsLookup.createPopupLink("HybData","name") %>
   </font></h5>
</td>

<td class="sm" align="center">
   <h5><font color="#800000"><%=results.getDisplayName("detection")%> Call
<BR>(<%=results.getDisplayName("detection_pvalue")%>)<%= DefinitionsLookup.createPopupLink("SingleChannelHybData","detection") %>
   </font></h5>
</td>

<td class="sm" align="center">
   <h5><font color="#800000"><%=results.getDisplayName("signal")%><%= DefinitionsLookup.createPopupLink("SingleChannelHybData","signal") %>
   </font></h5>
</td>

<td class="sm" align="center">
   <h5><font color="#800000"><%=results.getDisplayName("signal_percentile")%><%= DefinitionsLookup.createPopupLink("SingleChannelHybData","signal_percentile") %>
   </font></h5>
</td>
</tr>

<%for (int row_num = 0; row_num < results.getPageSize(); row_num ++) {
if ((results.getStartRow() + row_num) <= results.getResultSetSize()) {%>
<tr <%=myBgColor.toggleBgColor()%> valign="top">

<td class="sm" align="left" valign="top"><%=(results.getStartRow() + row_num)%><input type="checkbox" name="id" value="<%=results.getCell(row_num,"id")%>"></td>

<!-- array element-->
<td class="sm" valign="top" align="center" nowrap >
   <A href="/servlets/TairObject?id=<%=results.getCell(row_num,"array_element_id")%>&type=array_element">
   <%=results.getCell(row_num,"name")%></A><br>(<A href="/servlets/TairObject?id=<%=results.getCell(row_num,"locus_id")%>&type=locus"> 
   <%=results.getCell(row_num,"locus")%>)</A>
</td>

<td class="sm">&nbsp; </td> 
<% String expression_baseurl = "/servlets/TairObject?id="+results.getCell(row_num,"exp_tair_object_id"); %>

<!-- Experment Name-->
<td class="sm" valign="top">
       <A href="<%= expression_baseurl %>&type=expression_set">
       <%=results.getCell(row_num,"experiment_name")%>&nbsp;</A>
</td>

<td class="sm">&nbsp; </td> 

<!-- environmental variables -->
<% int varCount = results.getLookupCell( row_num,"environmental_variables" ).length; %>

<td class="sm" valign="top" align="left" wrap>

	<% for (int i = 0; i < varCount; i ++ ) { 
	  if ( i > 0 ) {  out.println(" ,<br> ");}
        %>
  <A href="<%= expression_baseurl %>&type=bio_sample_collection">
  <%= results.getLookupCell(row_num,"environmental_variables" )[i] %></A>

	<% } %> 
</td>

<!-- Repl Set -->
<td class="sm" valign="top" align="center">
   <A href="<%= expression_baseurl %>&type=hyb_descr_collection#<%= results.getCell(row_num,"hyb_desc_id") %>">
     <%=results.getCell(row_num,"hyb_desc_id")%><BR><%=results.getCell(row_num,"hyb_desc_name")%></A>
</td>

<!-- Repl Set Detection-->
<td class="sm" valign="top" align="center" nowrap>
<% BigDecimal converted = null;
   String detectionDisplay = null;  
   if ( results.getCell(row_num,"repl_detection").equalsIgnoreCase( "P" ) ) {
	detectionDisplay = "P";
   } else if ( results.getCell(row_num,"repl_detection").equalsIgnoreCase( "A" ) ) {
	detectionDisplay = "A";
   } else if ( results.getCell(row_num,"repl_detection").equalsIgnoreCase( "M" ) ) {
	detectionDisplay = "M";
   } else {
	detectionDisplay = " ";
   } 
   if ( results.getCell(row_num,"repl_detection_pvalue").equals ( " " ) || results.getCell(row_num,"repl_detection_pvalue_stderr").equals ( " " ) ) { %>
		n/a
	<% } else { 
		converted = new BigDecimal( results.getCell(row_num,"repl_detection_pvalue") );%> 
		<%=detectionDisplay%><br>(<%=converted.setScale( 3, BigDecimal.ROUND_HALF_UP )%>/<br> 
        <% converted = new BigDecimal( results.getCell(row_num,"repl_detection_pvalue_stderr") );%>
		<%=converted.setScale( 3, BigDecimal.ROUND_HALF_UP )%>)
	<% } %>

</td>

<!-- Repl Set Signal-->
<td class="sm" valign="top" align="center">
<% if ( results.getCell(row_num,"repl_signal").equals ( " " ) || results.getCell(row_num,"repl_signal_stderr").equals ( " " ) ) { %>
	n/a
<% } else { 
		converted = new BigDecimal( results.getCell(row_num,"repl_signal") );%> 
		<%=detectionDisplay%><br>(<%=converted.setScale( 3, BigDecimal.ROUND_HALF_UP )%>/<br> 
        <% converted = new BigDecimal( results.getCell(row_num,"repl_signal_stderr") );%>
		<%=converted.setScale( 3, BigDecimal.ROUND_HALF_UP )%>)
<% } %>
</td>

<!-- Repl Set Percentile-->
<td class="sm" valign="top" align="center">
<% if ( results.getCell(row_num,"repl_signal_percentile").equals ( " " ) || results.getCell(row_num,"repl_signal_percentile_stderr").equals ( " " ) ) { %>
	n/a
<% } else { 
		converted = new BigDecimal( results.getCell(row_num,"repl_signal_percentile") );%> 
		<%=detectionDisplay%><br>(<%=converted.setScale( 3, BigDecimal.ROUND_HALF_UP )%>/<br> 
        <% converted = new BigDecimal( results.getCell(row_num,"repl_signal_percentile_stderr") );%>
		<%=converted.setScale( 3, BigDecimal.ROUND_HALF_UP )%>)
<% } %>
</td>



<% int slideCount = results.getLookupCell( row_num,"hyb_data_id" ).length;%>

<!-- Slide --> 
<td class="sm" valign="top" align="center">

	<% for (int i = 0; i < slideCount; i ++ ) { %>

  <A href="<%= expression_baseurl %>&type=hyb_descr_collection#<%= results.getLookupCell(row_num,"hyb_data_id")[i] %>">
  <%=results.getLookupCell(row_num,"hyb_data_name")[i]%></A><br> 

	<% } %> 

</td>

<!-- Detection -->
<td class="sm" valign="top" align="center">
<% for (int i = 0; i < slideCount; i ++ ) {
   if ( results.getLookupCell(row_num,"detection")[i].equalsIgnoreCase( "P" ) ) {
		detectionDisplay = "P";
	} else if ( results.getLookupCell(row_num,"detection")[i].equalsIgnoreCase( "A" ) ) {
		detectionDisplay = "A";
	} else if ( results.getLookupCell(row_num,"detection")[i].equalsIgnoreCase( "M" ) ) {
		detectionDisplay = "M";
	} else {
		detectionDisplay = " ";
	}%>
	<% if ( results.getLookupCell(row_num,"detection_pvalue")[i] == null ) { %>
		<%=detectionDisplay%><br>(n/a)<br>
	<% } else { 
		converted = new BigDecimal( results.getLookupCell(row_num,"detection_pvalue")[i] );%> 
		<%=detectionDisplay%><br>(<%=converted.setScale( 3, BigDecimal.ROUND_HALF_UP )%>)<br> 
	<% } %>
<% } %> 

</td>
<!-- Slide Signal --> 
<td class="sm" valign="top" align="center">

	<% for (int i = 0; i < slideCount; i ++ ) { 
		converted = new BigDecimal( results.getLookupCell(row_num,"signal")[i] );%> 

  <%=converted.setScale( 3, BigDecimal.ROUND_HALF_UP )%><br> 

	<% } %> 

</td>

<!-- Slide Percentile --> 
<td class="sm" valign="top" align="center">

	<% for (int i = 0; i < slideCount; i ++ ) {
		converted = new BigDecimal( results.getLookupCell(row_num,"signal_percentile")[i] );%> 

  <%=converted.setScale( 3, BigDecimal.ROUND_HALF_UP )%><br> 

	<% } %> 

</td>


</tr>
<% }%>
<% }%>
<% }%>
</table>
</td>
</tr>
</table>
</form>

<% if ( scrollLinks != null ) { %>
<tr>
<td class="sm" align="center"><%= scrollLinks %></td>
</tr>
<% } %>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

