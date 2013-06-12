<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*, java.util.HashMap"%>
<%!
String pageName = "Expression Search Results";
String highlight = "1";
%>

<% 
// get results of search
String summaryType = "expression";
String sessionID = (String)request.getSession( true ).getId();
String queryID = (String) request.getAttribute( "query_id" );
String searchCriteria = ( request.getAttribute( "searchCriteria" ) != null ) ? ( String )request.getAttribute( "searchCriteria" ) : " ";
String ntfMsg = ( request.getAttribute( "ntfMsg" ) != null ) ? ( String )request.getAttribute( "ntfMsg" ) : " ";
String color = ( request.getAttribute( "color" ) != null ) ? ( String )request.getAttribute( "color" ) : "RG";
int pageSize = ( request.getAttribute( "size" ) != null ) ? ( ( Integer )request.getAttribute( "size" ) ).intValue() : 25;
int currentPage = ( request.getAttribute( "pageNum" ) != null ) ? ( ( Integer )request.getAttribute( "pageNum" ) ).intValue() : 1;
String sortColumn = ( request.getAttribute( "sortColumn" ) != null ) ? ( String )request.getAttribute( "sortColumn" ) : " ";
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
document.expression_search_result.pageNum.value = pageNum;
document.expression_search_result.action.value = action;
document.expression_search_result.size.value = size;
document.expression_search_result.query_id.value = query_id;
document.expression_search_result.submit();
}

function checkAll()
{
for(i=0;i<document.expression_search_result.elements.length;i++)
{
var c = document.expression_search_result.elements[i];   
c.checked = i;   
}
}
// here if ya need it
function unCheckAll()
{
for(i=0;i<document.expression_search_result.elements.length;i++)
{
var c = document.expression_search_result.elements[i];   
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

<form action="<%=response.encodeURL("/servlets/Search")%>" name="expression_search_result" method="post">
<input type="hidden" name="action" value="search">
<input type="hidden" name="type" value="<%=summaryType%>" />
<input type="hidden" name="size" value="<%=pageSize%>" />
<input type="hidden" name="pageNum" value="<%=currentPage%>" />
<input type="hidden" name="color" value="<%=color%>" />
<input type="hidden" name="query_id" value="" />
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
<tr>
<TD width="100%" align="left"> 
<SPAN class="header">TAIR Microarray Expression Search</SPAN>
[<A href="/help/helppages/expression_search.jsp" target="_blank">Help</A>]
	  <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#F1EFEC">
	    <tr>
	      <TD align="center" width="33%" class="sm">
		<input type="button" value="new search" onClick="javaScript:mySubmit('1','new_search', 25)" ><BR>
		new expression search
	      </TD>
         <td align="center" width="33%" class="sm">
		   <input type="button" value="download all" onClick="mySubmit( 0, 'downloadAll', <%= resultSize %>, '<%=queryID%>' )" ><BR>
                       download all results
         </td>
	      <TD align="center" width="34%" class="sm">
		<input type="button" value="download checked" onClick="javaScript:mySubmit( 0,'download', 25, '<%=queryID%>')" ><BR>
		check the boxes below and download results
	      </TD>
	    </tr>
	  </table>
</TD>
</tr>

<tr>
<% if ( results.getResultSetSize() > 0 ) { %>
        <TD>
        <%=searchCriteria%><font class="emphasis"><%=results.getResultSetSize()%></font> records. 
        <p>Displaying <%=results.getStartRow()%> - <%=results.getEndRow()%> of <%=results.getResultSetSize()%> records on page <%=currentPage%> of <%=results.getTotPages()%> pages.<%=ntfMsg%>
        </TD>
<% } else { %>
        <TD>
        <%=searchCriteria%><font class="emphasis"> <%=results.getResultSetSize()%></font> records. 
        <p><%=ntfMsg%>
        <p>
        Please consider the following as you modify your query and try again:<br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Check the spelling.<br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- For a broader or narrower search make the appropiate selection from the name drop-down           menu.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- If you are searching based upon location, check that the appropriate map type or range           is entered.</font></P><br>
        </TD>
<% } %>
</tr>
      
<% if ( results.getResultSetSize() > 0 ) { %>
<TR>
   <TR valign="top" bgcolor="#F5F9FF">
      <TD><input type="button" name="check7" value="Check All" onClick="checkAll()">
	  <input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()"> 
          <input type="button" value="re-sort by" onClick="javaScript:mySubmit( 1,'re_sort',<%=pageSize%>)" > 
                    <select name="sortColumn">
                        <%selected = ( sortColumn.equalsIgnoreCase( "name" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="name"><%=results.getDisplayName("name")%></option>
		      
                        <%selected = ( sortColumn.equalsIgnoreCase( "locus" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="locus"><%=results.getDisplayName("locus")%></option>
		      
                        <%selected = ( sortColumn.equalsIgnoreCase( "experiment_name" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="experiment_name">Experiment Name</option>
		      
                        <%selected = ( sortColumn.equalsIgnoreCase( "ABS(repl_fold_change) DESC" ) ) ? "selected" : " ";%>
		    <option <%=selected%> value="ABS(repl_fold_change) DESC"><%=results.getDisplayName("repl_fold_change")%> (high to low) </option>

		       <%selected = ( sortColumn.equalsIgnoreCase( "ABS(repl_fold_change)" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="ABS(repl_fold_change)"><%=results.getDisplayName("repl_fold_change")%> (low to high) </option>

		       <%selected = ( sortColumn.equalsIgnoreCase( "repl_fold_change_stderr" ) ) ? "selected" : " ";%>
                    <option <%=selected%> value="repl_fold_change_stderr"><%=results.getDisplayName("repl_fold_change_stderr")%></option>
                    </select> 

        </TD>
    </TR> 
<TD>

<TABLE width="100%" border="0" cellspacing="0">

<TR <%=myBgColor.toggleBgColor()%> >
<TD class="sm">&nbsp; </TD> 
<TD class="sm" align="center">
    <h5><font color="#800000">
    <%=results.getDisplayName("name")%><%=DefinitionsLookup.createPopupLink("ArrayElement","name")%>
<br>(<%=results.getDisplayName("locus")%><%=DefinitionsLookup.createPopupLink("Locus","class")%>)
    </font></h5>
</TD>

<TD class="sm" align="center">
   <h5><font color="#800000">
   <%=results.getDisplayName("experiment_name")%><%= DefinitionsLookup.createPopupLink("ExpressionSet","class") %>
   </font></h5>
</TD>

<TD class="sm" align="center" nowrap>
    <h5><font color="#800000">Sample Variables<br>(Cy5 vs Cy3)
    </font></h5>
</TD>

<TD class="sm" align="center">
    <h5><font color="#800000">RepSet<br>ID/name<%= DefinitionsLookup.createPopupLink("HybDescription","class") %> 
    </font></h5>
</TD>

<TD class="sm" align="center">
    <h5><font color="#800000">RepSet<br>Fold Change<%=DefinitionsLookup.createPopupLink("DualChannelHybData","repl_fold_change")%><br>(std error<%=DefinitionsLookup.createPopupLink("DualChannelHybData","repl_fold_change_stderr")%>) 
    </font></h5>
</TD>
<%--
<TD colspan= 4>
 <TABLE width="100%" border="1" cellspacing="0" height="100%">
  <TR>
  <!--slide-external_id-->
  <TD class="sm" valign="center" align="center" width="50%">
   <h5><font color="#800000">Slide<%= DefinitionsLookup.createPopupLink("HybData","name") %><br> External ID
   </font></h5>
  </TD>
  <!--fold_change -->
  <TD class="sm" valign="center" align="center" width="18%">
   <h5><font color="#800000">Slide<br>Fold Change<%=DefinitionsLookup.createPopupLink("DualChannelHybData","fold_change")%><br>(std error<%=DefinitionsLookup.createPopupLink("DualChannelHybData","fold_change_stderr")%>)
   </font></h5>
  </TD>
  <!--ch2_signal-->
  <TD class="sm" valign="center" align="center" width="16%">
    <h5><font color="#800000">Cy5 <br>Intensity <%=DefinitionsLookup.createPopupLink("DualChannelHybData","ch2_signal")%>
    </font></h5>
  </TD>
  <!--ch1_signal-->
 <TD class="sm" valign="center" align="center" width="16%">
     <h5><font color="#800000">Cy3 <br>Intensity <%=DefinitionsLookup.createPopupLink("DualChannelHybData","ch1_signal")%>
   </font></h5>
 </TD>
 </TR>
 </TABLE>
 </TD>

 --%>
 
<TD class="sm" align="center">
   <h5><font color="#800000">Slide<%= DefinitionsLookup.createPopupLink("HybData","name") %><br> External ID
   </font></h5>
  </TD>

  <TD class="sm" align="center">
   <h5><font color="#800000">Slide<br>Fold Change<%=DefinitionsLookup.createPopupLink("DualChannelHybData","fold_change")%><br>(std error<%=DefinitionsLookup.createPopupLink("DualChannelHybData","fold_change_stderr")%>)
   </font></h5>
</TD>

<TD class="sm" align="center">
   <h5><font color="#800000">Cy5 <br>Intensity <%=DefinitionsLookup.createPopupLink("DualChannelHybData","ch2_signal")%>
   </font></h5>
</TD>

<TD class="sm" align="center">
   <h5><font color="#800000">Cy3 <br>Intensity <%=DefinitionsLookup.createPopupLink("DualChannelHybData","ch1_signal")%>
   </font></h5>
</TD>

</TR>


<%for (int row_num = 0; row_num < results.getPageSize(); row_num ++) {
  if ((results.getStartRow() + row_num) <= results.getResultSetSize()) {%>

<TR <%=myBgColor.toggleBgColor()%> valign="top">
 <% int numberHybData = results.getLookupCell( row_num,"hyb_data_id" ).length; %>
<TD class="sm" align="left" valign="top" rowspan=<%= numberHybData %>><%=(results.getStartRow() + row_num)%><input type="checkbox" name="id" value="<%=results.getCell(row_num,"id")%>"></TD>

<!-- array element-->
<TD class="sm" valign="top" align="left" nowrap rowspan=<%= numberHybData %>>
   <A href="/servlets/TairObject?id=<%=results.getCell(row_num,"array_element_id")%>&type=array_element">
   <%=results.getCell(row_num,"name")%></A><br>(<A href="/servlets/TairObject?id=<%=results.getCell(row_num,"locus_id")%>&type=locus"> 
   <%=results.getCell(row_num,"locus")%>)</A>
</TD>

<% String expression_baseurl = "/servlets/TairObject?id="+results.getCell(row_num,"exp_tair_object_id"); %>
<TD class="sm" valign="top" rowspan=<%= numberHybData %>>
       <A href="<%= expression_baseurl %>&type=expression_set">
       <%=results.getCell(row_num,"experiment_name")%>&nbsp;</A>
</TD>

<!-- cy5 vi cy3-->
<TD class="sm" valign="top" align="left" rowspan=<%= numberHybData %>>
  <A href="<%= expression_baseurl %>&type=hyb_descr_collection#<%= results.getCell(row_num,"hyb_desc_id") %>">
   <%=  results.getLookupCell(row_num,"environmental_variables")[0] %><BR>VS<BR>
   <%=  results.getLookupCell(row_num,"environmental_variables")[1] %>   
  </A>  
</TD>

<!--hybdescription-->
<TD class="sm" valign="top" align="center" rowspan=<%= numberHybData %>>
   <A href="<%= expression_baseurl %>&type=hyb_descr_collection#<%= results.getCell(row_num,"hyb_desc_id") %>">
     <%=results.getCell(row_num,"hyb_desc_id")%>/<BR><%=results.getCell(row_num,"hyb_desc_name")%></A>
</TD>

<!--repl_fold_change -->
 <TD class="sm" valign="top" align="center" bgcolor=<%= ExpressionColorValue.getColor( results.getCell(row_num,"repl_fold_change"),color)%> rowspan=<%= numberHybData %> >
    <%=results.getCell(row_num,"repl_fold_change") %><BR>(<%=results.getCell(row_num,"repl_fold_change_stderr")%>) 
 </TD>
<%--
<TD colspan= 4>
 <TABLE width="100%" border="0" cellspacing="0" height="100%">
  --%> 
 <% for (int i = 0; i < numberHybData ; i ++ ) {
      if (i > 0){
         out.print ("<TR '"+ myBgColor.sameBgColor()+ "'>");
      }
 %>
  <!--slide-external_id-->
  <TD class="sm" valign="top" align="center">
    <A href="<%= expression_baseurl %>&type=hyb_descr_collection#<%= results.getLookupCell(row_num,"hyb_data_id")[i] %>">
    <%=results.getLookupCell(row_num,"hyb_data_name")[i]%></A><br><%=results.getCell(row_num,"external_id") %><br>
  </TD>
  <!--fold_change -->
  <TD class="sm" valign="top" align="right" bgcolor=<%=ExpressionColorValue.getColor(results.getLookupCell(row_num,"fold_change")[i],color)%>>
    <%=results.getLookupCell(row_num,"fold_change")[i] %><BR>(<%= EmptyTextConverter.convert(results.getLookupCell(row_num,"fold_change_stderr")[i])%>)
  </TD>
  <!--ch2_signal-->
  <TD class="sm" valign="top" align="right" >
     <%=results.getLookupCell(row_num,"ch2_signal")[i] %> 
  </TD>
  <!--ch1_signal-->
 <TD class="sm" valign="top" align="right" >
   <%=results.getLookupCell(row_num,"ch1_signal")[i]%> 
 </TD>
 </TR>
 <% } %>
 <%--
 </TABLE>
 </TD>
 --%>
</TR>

<% }%>
<% }%>
<% }%>
</TABLE>
</TD>
</TR>
</TABLE>
</form>

<% if ( scrollLinks != null ) { %>
<TR>
<TD class="sm" align="center"><%= scrollLinks %></TD>
</TR>
<% } %>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

