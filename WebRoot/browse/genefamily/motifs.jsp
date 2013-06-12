<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - Characteristic Sequence Motifs";
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

		
		<!-- Content goes here //--> 

<span class="header">Characteristic Sequence Motifs</span><br> 
<p><p>
Characteristic Sequence Motifs for <i> Arabidopsis</i> MAPK, MAPKK, MAPKKK &  MAPKKKK gene families. <br><b>Contact:</b> <a href="/servlets/Community?action=view&type=person&communityID=1213417">Laszlo B&ouml;gre</a> and <a href="/servlets/Community?action=view&type=person&communityID=7034">Laszlo Okresz</a>
<p>



 <TABLE  align="center" border="0" cellspacing="0" cellpadding="2">
        

          

<TR bgcolor=c0c0c0>    <TH><B>Family<BR>Name:</B></TH>
        <TH><B>No:</B></TH>
        <TH><B>Group:</B></TH>    
        <TH><B>No:</B></TH>
        <TH><B>Named Members:</B></TH>
	<TH><B>Signature Motif:</b></th>
            </TR>
            

<TR bgcolor=ededed>    <TD ROWSPAN=5 valign=top><B>MAPK</b></td>
                        <td ROWSPAN=5 valign=top>23</td>
			<td>A</td>
			<td>3</td>
			<td>MPK3/6/10</td>
			<td valign=center ROWSPAN=5>T(E/D)YVxTRWYRAPE(L/V)</td></tr>

<TR  bgcolor=ededed>
<td>B</td>
<td>5</td>
<td>MPK4/5/11/12/13</td>
</tr>


<TR  bgcolor=ededed>
<td valign=middle>C</td>
<td valign=middle>4</td>
<td>MPK1/2/7/14</td>
</tr>

<TR  bgcolor=ededed>
<td valign=middle>D</td>
<td valign=middle>8</td>
<td>MPK8/9/15/16/17/18/19/20</td>
</tr>

<TR  bgcolor=ededed>
<td valign=middle>MHK</td>
<td valign=middle>3</td>
<td>&nbsp;</td>
</tr>

<tr><TD ROWSPAN=4 valign=top><B>MAPKK</b></td>
                        <td ROWSPAN=4 valign=top>10</td>
			<td valign=middle>A</td>
			<td valign=middle>3</td>
			<td>MKK1/2/6</td>
			<td valign=middle ROWSPAN=4>VGTxxYMSPER</td></tr>

<tr>
<td valign=middle>B</td>
<td valign=middle>1</td>
<td>MKK3</td></tr>

<tr>
<td valign=middle>C</td>
<td valign=middle>2</td>
<td>MKK4/5</td></tr>

<tr>
<td valign=middle>D</td>
<td valign=middle>4</td>
<td>MKK7/8/9/10</td></tr>

<tr BGCOLOR="
EDEDED">
<td VALIGN=TOP ROWSPAN="3"><b>MAPKKK</b></td>

<td VALIGN=TOP ROWSPAN="3">80</td>

<td VALIGN=CENTER>MEKK-like</td>

<td VALIGN=CENTER>21</td>

<td>MEKK1, ANP1-3, MAP3Ke1</td>

<td VALIGN=CENTER ROWSPAN="3">G(T/S)Px(W/Y/F)MAPEV
<p>GTPEFMAPE(L/V)Y
<br>GTxx(W/Y)MAPE</td>
</tr>

<tr BGCOLOR="
EDEDED">
<td VALIGN=CENTER>ZIK</td>

<td VALIGN=CENTER>11</td>

<td>ZIK1</td>
</tr>

<tr BGCOLOR="
EDEDED">
<td VALIGN=CENTER>Raf-like</td>

<td VALIGN=CENTER>48</td>

<td>EDR1, CTR1</td>
</tr>


<tr><td ROWSPAN=1 valign=top><B>MAPKKKK</b></td>
<td ROWSPAN=1 valign=top>10</td>
<td>Ste20/PAK-like</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>TFVGTPxWMAPEV</td></tr>
</table>




<P>
  <center>Last modified on September 2, 2003</center>



<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
