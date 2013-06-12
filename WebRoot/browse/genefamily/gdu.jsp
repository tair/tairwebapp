<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "Glutamine Dumper (GDU) Family";
	String highlight = "3";
	String helpfile="";
	String cssfile="/css/page/pagelevels.css";
%>
<%@ page
	errorPage="/jsp/common/gen_error.jsp"
	import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*,java.util.*, java.net.*"
%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
	<jsp:param name="pageName" value="<%= pageName %>" />
	<jsp:param name="highlight" value="<%= highlight %>" />
	<jsp:param name="helpfile" value="<%= helpfile %>" />
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>

<!-- Content goes here //-->

<h2><b><i>Arabidopsis thaliana</i> Glutamine Dumper (GDU) Family</B></h2>

<TABLE><TR>

<TD valign=top><B>Source: </B></TD>
<td><b>Pilot, G.,Stransky, H.,Bushey, D. F.,Pratelli, R.,Ludewig, U.,Wingate, V. P.,Frommer, W. B.</b> (2004) <a href="/servlets/TairObject?type=publication&id=501712614">
Overexpression of GLUTAMINE DUMPER1 Leads to Hypersecretion of Glutamine from Hydathodes of Arabidopsis Leaves.</A> <i>THE PLANT CELL</i> <b>16:1827-1840</b><br />

<b>Pratelli, R&#233;jane, Pilot, Guillaume</b> (2006) <a href="/servlets/TairObject?type=publication&id=501720617
">The plant-specific VIMAG domain of Glutamine Dumper1 is necessary for the function of the protein in arabidopsis.</A> <i>FEBS LETTERS</i> <b>580:6961-6966</b> <br />
</td>
</TR>

<TR><TD><B>Contact: </B></TD>
<TD><a href="/servlets/Community?action=view&type=person&communityID=4110">Guillaume Pilot</a><br />
<a href="/servlets/Community?action=view&type=organization&communityID=1501415330">Wolf Frommer Laboratory at Stanford</a>
</TD></TR>

</TABLE> 

<TABLE  align="center" border="1" cellspacing="0" cellpadding="2">
    <tr>    
        <th><b>Gene Name:</b></th>
        <th><b>Chromosomal Locus:</b></th>
        <th><b>Protein Function/Description:</b></th>
    </tr>
    
    <tr class="alt">    
        <td>AtGDU1</td>
        <td>At4g31730</td>
        <td>unknown</td>
    </tr>
    
    <tr class="alt">    
        <td>AtGDU2</td>
        <td>At4g25760</td>
        <td>unknown</td>
    </tr>
    
    <tr class="alt">    
        <td>AtGDU3</td>
        <td>At5g57685</td>
        <td>unknown</td>
    </tr>
    
    <tr class="alt">    
        <td>AtGDU4</td>
        <td>At2g24762</td>
        <td>unknown</td>
    </tr>
    
    <tr class="alt">    
        <td>AtGDU5</td>
        <td>At5g24920</td>
        <td>unknown</td>
    </tr>
    
    <tr class="alt">    
        <td>AtGDU6</td>
        <td>At3g30725</td>
        <td>unknown</td>
    </tr>
    
    <tr class="alt">    
        <td>AtGDU7</td>
        <td>At5g38770</td>
        <td>unknown</td>
    </tr>
    
</TABLE>


<p>
<a href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</a>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
    
