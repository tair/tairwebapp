<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page 
errorPage="/jsp/common/gen_error.jsp" 
import="org.tair.querytools.*, org.tair.tfc.*, org.tair.utilities.*, java.util.*, org.tair.processor.transposonfamily.*"
%>

<%!
String pageName = "Transposon Families List";
String highlight = "1";
String id="206";
%>

<%
TransposonFamilyCollection families = (TransposonFamilyCollection) request.getAttribute("browse_fams");
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="highlight" value="<%= highlight %>" />
</jsp:include>
<jsp:useBean id="myBgColor" scope="page" class="org.tair.utilities.BgColorBean" /> 

 
<span class="mainheader">Browse Transposon Families<a name="back"></a></span>
  

<h4>Click on a letter below to browse Transposon Families starting with that letter.</h4>
<%-- The ABCDEF...Z header --%>
<center>

<% for(char ch = 'A'; ch <= 'Z'; ch++) { 
    Iterator iter = families.iteratorDisplayValueStartsWith(""+ch);
    if (iter == null) { %>
        <%= ch %>
    <% } else { %>
        <a href="#<%= ch %>"><%= ch %></a>
    <% } %>       

<% } %>
</center>

<table width="100%" border="0" colspan="2" cellspacing="0" >

    <% int last_count = 0; %> 
    <% for(char ch = 'A'; ch <= 'Z'; ch++) { %>
        
        <%
        Iterator iter = families.iteratorDisplayValueStartsWith(""+ch);
        if (iter!= null){
        %>
        
        <TR <%=myBgColor.toggleBgColor() %> > 
            <% if (last_count >25){ %>
            <TH align=left valign=top><a name="<%= ch %>"></A><%= ch %> <font size=2><a href="#back">BACK TO TOP</A></font></TH>
            <% } else { %>
            <TH align=left valign=top><a name="<%= ch %>"></A><%= ch %></TH>
            <% } 
            last_count = 0;
            %>
            <TD>&nbsp;</TD>
            <TD>&nbsp;</TD>
            <TD>&nbsp;</TD>
            <TD>&nbsp;</TD>
            <TD>&nbsp;</TD>
        </TR>
        
        <TR <%=myBgColor.toggleBgColor() %> >
            <TD>&nbsp;</TD>
            <TH align=left valign=top>Family Name</TH>
            <TD>&nbsp;</TD>
            <TH align=left valign=top>Super Family</TH>
            <TD>&nbsp;</TD>
            <TH align=left valign=top>Number of Transposable Elements</TH>
        </TR>
        
        <% } %>
    
        <%
        if (iter != null) {
            while (iter.hasNext()) {
                TransposonFamily fam = (TransposonFamily) iter.next();
                last_count++;
        %>
            <TR <%=myBgColor.toggleBgColor() %> >
                <TD>&nbsp;</TD>
                <% 
                    String family_link = "";
                    family_link = "<A href = '/servlets/TairObject?type=transposon_family&id=" + fam.get_transposon_family_id() + "'>" + fam.get_name() + "</A>";
                %>
                <TD valign=top><%=family_link%></TD>
                <TD>&nbsp;</TD>
                <TD valign=top><%= fam.get_super_family_name() %></TD>
                <TD>&nbsp;</TD>
                <TD valign=top> <%= fam.get_assoc_transposons_size() %> </TD>
            </TR>
            <% } %>
        <% } %>       
    <% } %>

</table>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
