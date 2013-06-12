<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String pageName = "TAIR - ABC Transporter Gene Family";
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
 

<A NAME="ABC"><h2><b><i> Arabidopsis</i> ABC Superfamily</B></h2></A>

<TABLE><TR>

<TD valign=top><B>Source:</B></TD> <TD>Theodoulou Lab<br />
Paul J. Verrier<sup>1</sup>, David Bird<sup>2</sup>, Bo Burla<sup>3</sup>, Elie Dassa<sup>4</sup>, Cyrille Forestier<sup>5</sup>, Markus Geisler<sup>3</sup>, Markus Klein<sup>3</sup>, &Uuml;ner Kolukisaoglu<sup>6</sup>, Youngsook Lee<sup>7</sup>, Enrico Martinoia<sup>3</sup>, Angus Murphy<sup>8</sup>, Philip A. Rea<sup>9</sup>, Lacey Samuels<sup>10</sup>, Burkhard Schulz<sup>8</sup>, Edgar J. Spalding<sup>11</sup>, Kazufumi Yazaki<sup>12</sup> and Frederica L. Theodoulou (2008)<a href="/servlets/TairObject?type=publication&id=501724055">
Plant ABC proteins &#150; a unified nomenclature and updated inventory.</a>
<i>Trends in Plant Science</i> 
Volume 13, Issue 4, April 2008, Pages 151-159 
</td></tr>


<TR><TD><B>Contact:</B></TD>
<TD><A HREF="mailto:paul.verrier@bbsrc.ac.uk" target="display">Paul Verrier</A><br />
<A HREF="/servlets/TairObject?type=person&id=2028" target="display">Freddie Theodoulou</A><br />
<A HREF="/servlets/TairObject?type=person&id=5076" target="display">Angus Murphy</A>
</TD>
</TR>
<TR><TD><B>Plant ABC protein File:</B></TD>
<td>Due to the size of the file, we chose to attach it rather than displaying the complete file on this page. <br />
<ul>
    <li>ABC Protein File [<a href="ABC+family.pdf">PDF</a>]</li>
    <li>ABC Protein File [<a href="ABC.xls">Excel</a>]</li>
</ul>
</td>
</tr>

<TR><TD><B>Additional references:</B></TD>
<td>
    <ul>
        <li>Ward, J. (2001) <a href="/servlets/TairObject?type=publication&id=501680716">Identification of novel families of membrane proteins from the model plant <i>Arabidopsis thaliana</i>.</a> <i>Bioinformatics</i>, <b>17</b>, 560-563.</li>
        <li>Sanchez-Fernandez, R.,Davies, T. G.,Coleman, J. O.,Rea, P. A. (2001)
        <A HREF="/servlets/TairObject?type=publication&id=501680567" target="display">The Arabidopsis thaliana ABC Protein Superfamily, a Complete Inventory.
        </A> Journal of Biological Chemistry. 276: 30231-44.</li>
        <li>van den Br&ucirc;le S. and Smart, C.C. (2002) <A href="/servlets/TairObject?type=publication&id=501682515">The plant PDR family of ABC transporters.</A><i>Planta</i> 216: 95-106.</li>
    </ul>
</td>
</tr>

</TABLE> 

 

<P>
<A href="index.jsp"><IMG SRC="/images/arrow.small.up.gif"border=0>Return to Gene Family Index</A>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
	<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>
