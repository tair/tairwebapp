<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.tair.utilities.*,org.tair.tfc.*"%>

<%!
String pageName = "Keyword Search Results";
%>

<% 
// get results of search
// if the search was initiated from GeneralSearchHandler the search criteria will exist 
// in a SearchResultsCollection object the first time through, otherwise it will exist 
// in the request object
String summary_type = "keyword";
String originatingForm = ( request.getAttribute( "origForm" ) != null ) ? ( String )request.getAttribute( "origForm" ) : " ";  
String queryID = (String) request.getAttribute( "query_id" );
int page_size = ( request.getAttribute( "size" ) != null ) ? ( ( Integer )request.getAttribute( "size" ) ).intValue() : 25;
int current_page = ( request.getAttribute( "pageNum" ) != null ) ? ( ( Integer )request.getAttribute( "pageNum" ) ).intValue() : 1;
String search_criteria = ( request.getAttribute( "searchCriteria" ) != null ) ? ( String )request.getAttribute( "searchCriteria" ) : " "; 
String mode = ( request.getAttribute( "mode" ) != null ) ? ( String )request.getAttribute( "mode" ) : " ";       
if ( request.getAttribute( "searchCriteria" ) == null ) { // request came through GeneralSearchHandler
  SearchResultsCollection searchCollection = ( SearchResultsCollection ) request.getAttribute( "searchCollection" );
  search_criteria = searchCollection.getSearchCriteria();
}
ResultsFetcher results = new ResultsFetcher( queryID, summary_type );
results.setPageSize( page_size );
results.setSummaryPage( current_page );
// set up the paging links for display at the bottom of the page
String scrollLinks = null;
if ( results.getTotPages() > 0 ) {
  scrollLinks = ScrollCalculator.getTableScrollLinks( page_size, current_page, results.getResultSetSize(), results.getTotPages(), originatingForm, queryID );
}
%>

<SCRIPT LANGUAGE="JavaScript">
<!--

function mySubmit( pageNum, action, size, origForm, query_id) {
    document.keyword_search_result.pageNum.value = pageNum;
    document.keyword_search_result.action.value = action;
    document.keyword_search_result.size.value = size;
    document.keyword_search_result.origForm.value = origForm;
    document.keyword_search_result.query_id.value = query_id;
    document.keyword_search_result.submit();
}
function mySubmitForm1() {
if ( document.form1.radiobutton[1].checked == true ) { 
        document.form1.type.value = "keyword";
}
document.form1.submit();
}

function checkAll()
    {
	for(i=0;i<document.keyword_search_result.elements.length;i++)
           {
             var c = document.keyword_search_result.elements[i];   
             c.checked = i;   
	   }
    }
// here if ya need it
function unCheckAll()
    {
	for(i=0;i<document.keyword_search_result.elements.length;i++)
           {
             var c = document.keyword_search_result.elements[i];   
             c.checked ='';   
	   }
    }

// -->
</SCRIPT>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" />
<% if ( originatingForm.equalsIgnoreCase( "general" ) ) { %>
	  <FORM name="form1" action="/servlet/Search" method="get">
         <INPUT type="hidden" name="type" value="general" />
	     <INPUT type="hidden" name="action" value="search" />	
	     <INPUT type="hidden" name="origForm" value="general" />
     	 <INPUT type="hidden" name="mode" value="<%=mode%>" />		

	    <TABLE width="100%" border="0" cellspacing="0" bgcolor="#F1EFEC">
	      <TR> 
		<TD colspan="11"> 
		  <H2 align="center"><A href="/help/helppages/initials.jsp#447035">General Search</A></H2>
		</TD>
	      </TR>

	      <TR valign="top">
                <td valign="middle"><img src="/images/cleargif.gif" width="20" height="1"></td>
		<TD valign="middle"> 
		    <INPUT type="radio" name="radiobutton" value="name" checked>name<BR>
                    <INPUT type="radio" name="radiobutton" value="keyword">keyword</P> 
                </TD>
		<TD valign="middle"><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
	        <TD valign="middle"><%= HTMLFactory.createSearchMethodSelect( "method", DataConstants.SEARCH_STARTS, false ) %></TD>
		<TD valign="middle"><IMG src="/images/cleargif.gif" width="20" height="1"></TD>		
		<TD valign="middle"> 
		  <INPUT type="text" name="name" size="20">
		</TD>
                <td><img src="/images/cleargif.gif" width="20" height="1"></td>
		<TD valign="middle"> 
                  <input type="button" value="submit" onClick="mySubmitForm1()" > 
		</TD>
		<TD valign="middle"><IMG src="/images/cleargif.gif" width="20" height="1"></TD>

		<TD valign="middle"><INPUT type="reset" name="reset" value="reset"></TD>

                <td valign="middle"><img src="/images/cleargif.gif" width="20" height="1"></td>
	      </TR>
	      <TR><TD colspan="11">&nbsp;</td></TR>
	    </TABLE>
	  </FORM>

<% } else if ( originatingForm.equalsIgnoreCase( "keyword" ) ) { %>

	  <FORM name="keyword_form1" action=<%=response.encodeURL("/servlet/Search")%> method="get">
             <INPUT type="hidden" name="type" value="keyword">
	     <INPUT type="hidden" name="action" value="search">
	     <INPUT type="hidden" name="origForm" value="keyword">
	     <INPUT type="hidden" name="mode" value=<%=mode%>>	

	    <TABLE width="100%" border="0" cellspacing="0" bgcolor="#F1EFEC">
	      <TR> 
		<TD> 
		  <H2 align="center"><A href="/help/helppages/keyser.jsp">Keyword Search</A></H2>
		</TD>
	      </TR>

              <TR > 
                <TD valign="top"> 
                  <TABLE width="100%" border="0" align="center">
                    <TR>
                        <TD><img src="/images/cleargif.gif" width="20" height="1"></TD>
		        <TD> keyword  </TD> 
		        <TD><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
		        <TD><SELECT name="method">
        			<OPTION value="1">contains</OPTION>
        			<OPTION value="2"selected>starts with</OPTION>
        			<OPTION value="3">ends with</OPTION>	   
        			<OPTION value="4">exactly</OPTION>
      			</SELECT>
		        </TD>

		        <TD><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
		        <TD> 
		         <INPUT type="text" name="name" size="20">
		        </TD>
                        <td><img src="/images/cleargif.gif" width="20" height="1"></td>
                    </TR>
                  </TABLE>
                </TD>
              </TR>

      <tr>
        <td class="sm" valign="top">Restrict your search to keyword category by checking the box below</td>
      </tr>

      <tr>
	<td> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
              <tr>
		  <TD><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
                  <td class="sm"><input type="checkbox" name="category" value="comp">GO Cellular Component<BR></td>
		  <TD><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
                  <td class="sm"><input type="checkbox" name="category" value="proc">GO Biological Process<BR></td>
		  <TD><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
                  <td class="sm"><input type="checkbox" name="category" value="grow">Plant Growth and Developmental Stages<BR></td>
              </tr>
              <tr>
		  <TD><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
                  <td class="sm"><input type="checkbox" name="category" value="func">GO Molecular Function<BR></td>
		  <TD><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
                  <td class="sm"><input type="checkbox" name="category" value="stru">Plant Anatomical Entity<br /></td>
		  <TD><IMG src="/images/cleargif.gif" width="20" height="1"></TD>
                  <td class="sm"><input type="checkbox" name="category" value="meth">Experimental Method<BR></td>
              </tr>
            </table>
	</td>
      </tr>
              <TR colspan="2"> 
                <TD> 
                  <TABLE border="0" cellspacing="0" cellpadding="5" width="100%">
                    <TR> 
                      <TD> 
                        <INPUT type="reset" name="reset" value="reset" onClick="resetHelper()">
                      </TD>
     <td><img src="/images/cleargif.gif" width="20" height="1"></td>
                      <TD align="right"> 
                        <INPUT type="submit" name="search" value="submit query">
                      </TD>
                    </TR>
                  </TABLE> 
                </TD>  
              </TR>

            </TABLE>
           </FORM>	
<% } %>







<form action="<%=response.encodeURL("/servlet/Search")%>" name="keyword_search_result" method="post">
<input type="hidden" name="action" value="search">
<input type="hidden" name="type" value="keyword">
<input type="hidden" name="size" value=<%=page_size%>>
<input type="hidden" name="pageNum" value=<%=current_page%>>
<input type="hidden" name="origForm" value=<%=originatingForm%>>
<input type="hidden" name="mode" value=<%=mode%>>	
<input type="hidden" name="query_id" value= "" />
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="2" bgcolor="#ffffff">
      <tr>
	<td width="100%" align="left"> 
          <b><font size="+1">TAIR Keyword Search Results</font></b>
	</td>
      </tr>      
      <tr>
	   <% if ( results.getResultSetSize() > 0 ) { %>
         	<td><%=search_criteria%><font class="emphasis"><%=results.getResultSetSize()%></font> matches.
            	<p>
             	 Displaying <%=results.getStartRow()%> - <%=results.getEndRow()%> of <%=results.getResultSetSize()%> records on page <%=current_page%> of <%=results.getTotPages()%> pages.
         	</td>
	   <% } else { %>
		<td>
		<%=search_criteria%><font class="emphasis"><%=results.getResultSetSize()%></font> matches.
            	<p>
            	Please consider the following as you modify your query and try again:<br><br>
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Check the spelling.<br><br>
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- For a broader or narrower search make the appropriate selection from the name drop-down menu.<br>
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- If you are searching based upon location, check that the appropriate map type or range is entered.</font></P><br>
	 	</td>
	<% } %>
       </tr>
        <% if ( results.getResultSetSize() > 0 ) { %>
	<tr>
           <% if ( mode.equalsIgnoreCase( "curator" ) ) { %>
           <td><input type="button" name="check7" value="Check All" onClick="checkAll()"><input type="button" name="check8" value="Uncheck All" onClick="unCheckAll()"><input type="button" value="download" onClick="javaScript:mySubmit( 0,'download', 25)" ><BR>
		check the boxes below and download results</td> 
	   <% } %>
        </tr>
	<tr>
	   <td>
            <table width="100%" border="0" cellspacing="0" bgcolor="#ffffff">
              <tr  <%=myBgColor.toggleBgColor()%> > 
                <% if ( mode.equalsIgnoreCase( "curator" ) ) { %>
                <td class="sm">&nbsp; </td> 
	        <% } %>
                <td class="sm" nowrap><%=results.getDisplayName("keyword")%><%= DefinitionsLookup.createPopupLink("Keyword","keyword") %></td>
                <td class="sm"nowrap><%=results.getDisplayName("keyword_type")%><%= DefinitionsLookup.createPopupLink("KeywordType","keyword_type") %></td>
                <td class="sm"nowrap>Tree View<%= DefinitionsLookup.createPopupLink("Tools","treeview") %></Td>
                <td class="sm"nowrap>Associated Data(to this term and to children terms) </td>
             </tr>

          <%for (int row_num = 0; row_num < results.getPageSize(); row_num ++) {
	     if ((results.getStartRow() + row_num) <= results.getResultSetSize()) {%>
             <tr <%=myBgColor.toggleBgColor()%> valign="top">
                <% if ( mode.equalsIgnoreCase( "curator" ) ) { %>
                <td class="sm" align="left" valign="top"><%=(results.getStartRow() + row_num)%><input type="checkbox" name="id" value="<%=results.getCell(row_num,"id")%>"></td>
	        <% } %>
                <td class="sm" valign="top"><A href="/servlets/TairObject?type=keyword&id=<%=results.getCell(row_num,"id")%>"> 
         <%=results.getCell(row_num,"keyword")%></A></td>
                <td class="sm" valign="top"><%=results.getCell(row_num,"keyword_type")%>&nbsp;</td>
                <td class="sm" valign="top"><A href="/servlets/Search?action=new_tree&type=tree&tree_type=<%=summary_type%>&node_id=<%=results.getCell(row_num,"id")%>">treeview</A></td>
		<td class="sm" valign="top"><%=results.getCell(row_num,"annotation_counts")%>&nbsp;</td>
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
