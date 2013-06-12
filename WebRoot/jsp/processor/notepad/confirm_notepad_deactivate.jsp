<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page 
errorPage="/jsp/common/gen_error.jsp"
import="org.tair.querytools.*, org.tair.utilities.*"
%>

<%!
String pageName = "Confirm Notepad Deactivation";
%>

<%
NotepadDetail note = (NotepadDetail) request.getAttribute( "note" );
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="" />
</jsp:include>

<br><br>

<table width="100%" cellspacing="2" cellpadding="2">

    <tr>
         <td class="sm" align="center"><font class="mainheader">Confirm Notepad Deactivation</font></td>
    </tr>

    <tr>
         <td class="sm">&nbsp;</td>
    </tr>

    <tr>
        <td class="sm">
            You have selected the following notepad entry for deactivation.
	    To deactivate the entry so that it does not display on detail pages, 
            click "Deactivate". To select a different notepad entry, click 
            "Search Again".
        </td>
    </tr>

    <tr>
         <td class="sm">&nbsp;</td>
    </tr>


    <tr>
         <td class="sm">
            <table align="center" border>
                <tr>
                   <th class="sm" align="left">Entered By</th>
		   <td class="sm">
                       <a href="/servlets/TairObject?type=person&id=<%= note.get_community_id() %>"><%= note.get_person_name() %></a>
                   </td>
                </tr>
    
                <tr>
                   <th class="sm" align="left" nowrap>Annotated<br>Data Object</th>
                   <td class="sm">
                       <a href="/servlets/TairObject?accession=<%= note.getAccession() %>"><%= note.getAccession() %></a>
                   </td>
                </tr>
    
                <tr valign="top">
                   <th class="sm" align="left">Comment</th>
                   <td class="sm"><%= note.get_comment() %></td>
                </tr>
            </table>
         </td>
      </tr>


      <tr>
          <td class="sm">&nbsp;</td>
      </tr>

      <form action="/servlets/processor" method="post"> 
      <input type="hidden" name="type" value="notepad">
      <input type="hidden" name="update_action" value="deactivate">
      <input type="hidden" name="notepad_id" value="<%= note.get_notepad_id() %>">

      <tr>
         <td class="sm" align="center">
             <input type="submit" value="Deactivate">
             &nbsp;&nbsp;
             <input type="button" value="Search Again" onClick="document.location.href='/servlets/processor?type=notepad&update_action=search'">
         </td>
      </tr>  
      </form>

 </table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
