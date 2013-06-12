<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*"%>

<%!
String pageName = "GOSlim Results";
String highlight = "1";
%>

<% 
// get results of search
String summary_type = "goslim";
//String session_id = ( String )request.getSession( true ).getId();
String query_id = ( String ) request.getAttribute( "query_id" );
String input_query_id = ( String ) request.getAttribute( "input_query_id" );
int page_size = ( request.getAttribute( "size" ) != null ) ? ( ( Integer )request.getAttribute( "size" ) ).intValue() : 150;
int currentPage = ( request.getAttribute( "pageNum" ) != null ) ? ( ( Integer )request.getAttribute( "pageNum" ) ).intValue() : 1;
// default the sort option to annotation_count descending
String sortColumn = ( request.getAttribute( "sortColumn" ) != null ) ? ( String )request.getAttribute( "sortColumn" ) : "keyword_type_id, annotation_count DESC";
String selected = " "; // default value for re-sort drop down menu, selected option 
ResultsFetcher results = new ResultsFetcher( query_id, summary_type );
results.setPageSize( page_size );
results.setSort( sortColumn );
results.setSummaryPage( currentPage );
%>

<SCRIPT LANGUAGE="JavaScript">
<!--

function mySubmit( action, query_id, input_query_id ) {
    document.goslim_result.action.value = action;		
    document.goslim_result.query_id.value = query_id;
    document.goslim_result.input_query_id.value = input_query_id;
    document.goslim_result.submit();
}

function checkAll()
    {
	for(i=0;i<document.goslim_result.elements.length;i++)
           {
             var c = document.goslim_result.elements[i];   
             c.checked = i;   
	   }
    }
// here if ya need it
function unCheckAll()
    {
	for(i=0;i<document.goslim_result.elements.length;i++)
           {
             var c = document.goslim_result.elements[i];   
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

<form action="<%=response.encodeURL("/servlet/Search")%>" name="goslim_result" method="post">
<input type="hidden" name="action" value="list" />
<input type="hidden" name="type" value="goslim" />
<input type="hidden" name="query_id" value="query_id" />
<input type="hidden" name="input_query_id" value="input_query_id" />
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2">
      <tr>
	<td width="100%" align="left"> 
          <b><font size="+1">Functional Categorization Listing</font></b>
	[<A href="/help/helppages/go_slim_help.jsp" target="_blank">Help</A>]
	</td>
    <td align="left" class="sm">
			<input type="button" value="new search" onClick="mySubmit('new_search')" >
	</td>
      </tr> 

	  <table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#D5D9DD">
	    <tr>
        <td class="sm" align="right">
           <select name="chartType">
           		<option value="annotation" selected>Annotation Pie Chart</option>
             	<option value="loci">Gene Bar Chart</option>
           </select>
        </td> 
	    <td align="left" class="sm">
		 	<input type="button" name="chartify" value="Draw" onClick="mySubmit('chartify', '<%= query_id %>', '<%=input_query_id%>')">
	    </td>

        <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td class="sm" align="right"> 
           <input type="button" value="re-sort by" onClick="javaScript:mySubmit('re_sort', '<%=query_id%>')" >
	    </td>               
	    <td class="sm" align="left"> 
     		<select name="sortColumn">
                        <%selected = ( sortColumn.equalsIgnoreCase( "keyword_type_id, annotation_count DESC" ) ) ? "selected" : " ";%>
                    	<option <%=selected%> value="keyword_type_id, annotation_count DESC"><%=results.getDisplayName("annotation_count")%></option>
                        <%selected = ( sortColumn.equalsIgnoreCase( "keyword_type_id, loci_count DESC" ) ) ? "selected" : " ";%>
                    	<option <%=selected%> value="keyword_type_id, loci_count DESC"><%=results.getDisplayName("loci_count")%></option>
                        
       		</select> 
	    </td>
	    </tr>
	  </table>
     
      <tr>
	   <% if ( results.getResultSetSize() > 0 ) {%> 
		<td>
            	<p>
             	 Displaying <%=results.getResultSetSize()%> records.
         	</td>
	   <% } else { %>
		<td>
		<%=results.getResultSetSize()%> matches.
            	<p>
            	Please consider the following as you modify your query and try again:<br><br>
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Check the spelling.<br><br>
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Verify entries in text area and/or submitted file are valid loci<br>
            	</P><br>
	 	</td>
  	   <% } %>
       </tr>
           <% if ( results.getResultSetSize() > 0 ) { %>
	<tr>
	   <td>
            <table width="100%" border="0" cellspacing="0">
              <tr  <%=myBgColor.toggleBgColor()%> >
                <td class="sm" nowrap><b><%=results.getDisplayName("keyword_type")%></b></td>
                <td class="sm" nowrap><b><%=results.getDisplayName("slim_name")%></b></td>
                <td class="sm" nowrap><b><%=results.getDisplayName("annotation_count")%></b></td>
                <td class="sm" nowrap><b><%=results.getDisplayName("loci_count")%></b></td>                
             </tr>

          <%for (int row_num = 0; row_num < results.getPageSize(); row_num ++) {
	     if ((results.getStartRow() + row_num) <= results.getResultSetSize()) { %>
             <tr <%=myBgColor.toggleBgColor()%> valign="top">
                <td class="sm" nowrap><%=results.getCell( row_num, "keyword_type")%></td>
                <td class="sm"nowrap><%=results.getCell(row_num,"slim_name")%></td>
                <td class="sm"nowrap><%=results.getCell(row_num,"annotation_count")%></td>
                <td class="sm"nowrap><A href="/servlets/Search?type=gene&action=search&taxon=1&origin=locigoslim&origin_identifier=<%=query_id%>&slim_name=<%=results.getCell(row_num,"slim_name")%>"><%=results.getCell( row_num, "loci_count")%></A></td>
            </tr>
	  <% }%>
	  <% }%>
         </table>
         </td>
         </tr>
        <% }%>
 
</table>
</form>
<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
