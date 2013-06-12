<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<%@ page import="org.tair.tfc.*,org.tair.querytools.*, org.tair.utilities.*, java.util.*, java.net.*,java.sql.* "%>

<%!
String pageName = "TAIR: Chromosome Map Utility";
%>

<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value="<%= pageName %>" />
<jsp:param name="id" value="87" />
</jsp:include>


<TABLE width="602" align="center" border="0" cellspacing="0" cellpadding="2">
    <TR><TD colspan=2> 
       <span class=header>Chromosome Map Tool</span><P>
	This utility allows you to draw maps of the Arabidopsis genome using
 a list of locus names (i.e. At1g01010). The list should contain one locus name per line.<BR><BR>


       </TD>
    </TR>
    <TR>
     <TD valign="top">
<!--     <FORM ACTION="gene_family_action.jsp" METHOD="POST"> -->
     <FORM ACTION="/servlets/ViewChromosomes" METHOD="POST">
    
      <TEXTAREA NAME="SEQIDS" ROWS="15" COLS="20"></TEXTAREA><BR>
      <BR>
      <BR>
      Zoom Factor: <INPUT TYPE="TEXT" NAME="ZOOM" VALUE="100" SIZE="3">
      <!-- BR>
      Background color: <INPUT TYPE="checkbox" VALUE="ON" NAME="BGCOLOR">White
      <BR -->
	<BR><BR>
      Page title: (optional) <INPUT TYPE="TEXT" NAME="TITLE" SIZE="20">
      <BR><BR>
      Chromosome color: <SELECT name=CHRCOLOR>
	<OPTION value=GREEN>green</OPTION>
	<OPTION value=SAUSAGE>sausage</OPTION>
	<OPTION value=GRAY>gray</OPTION>
	<OPTION value=LIGHTGRAY>light gray</OPTION>
	<OPTION value=BLACK>black</OPTION>
</SELECT>
	<P>
       Tickmark color: <SELECT name=TICKCOLOR>
	<OPTION value=WHITE>white</OPTION>
	<OPTION value=BLACK>black</OPTION>
	<OPTION value=GRAY>gray</OPTION>
	<OPTION value=YELLOW>yellow</OPTION>
	<OPTION value=VARIABLE>variable</OPTION>
</SELECT>	
	<P>
      <INPUT TYPE="SUBMIT" VALUE="DISPLAY ON CHROMOSOMES">
      <BR>
      <BR>
      <INPUT TYPE="RESET">
     </FORM>
      <BR>
    </TD>
    <TD valign="top">
You can add an alternate display name after the locus name if you prefer another name for the locus to be displayed (i.e, entering: 'At1g01010 hello' will display 'hello' on the chromosome). Entering a dot as the alternate name suppresses display of the name (i.e. 'At1g01010 .'), only a little tickmark on the chromosome will be drawn. This is useful if you have many loci and would like to get a sense of their distribution on the chromosomes.<BR><BR>
The Zoom Factor allows you to make the chromosome smaller (<100) or larger (>100). A zoom of 100% corresponds to 50,000 bp/screen pixel.<BR><BR>
Do not enter more than a few hundred loci at a time.
<!-- BR><BR>
Sample output:
<BR><BR>
<IMG SRC="chromosomemap_example.jpg"  -->


    </TD>
   </TR>
</TABLE>


<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />

   
