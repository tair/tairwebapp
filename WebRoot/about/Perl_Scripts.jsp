<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%@ page contentType="text/html; charset=UTF-8" %>
<%!
String pageName = "TAIR - About TAIR - TAIR Software - Little Perl Scripts";
String highlight = "0";
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

<jsp:include page="/jsp/includes/aboutSidebar.jsp" flush="true">
<jsp:param name="sidebarName" value="TAIR Software"/>  
</jsp:include>

<div id="rightcolumn">		
		<!--		
			Content goes here
			
		//-->
<span class="mainheader">Perl (and other) Scripts</span><%@ page import="java.net.URLEncoder" %>


    <table width=500 border = 1>

      

      
<TR><TH>Name</TH><TH>Code</TH><TH>Documentation</TH><TH>Description</TH></TR>
<TR><TD>fastaFileCheck.pl<TD><a href=/about/software/fastaFileCheck.txt>Source</A><TD><a href=/about/software/fastaFileCheck.jsp>POD</a><TD>A Perl program that checks the integrity of fasta files. Latest version (2.1) works on both proteins and DNA files!</td></tr>
<TR><TD>

    commFasta.pl </TD><TD><A HREF=/about/software/commFasta.txt>Source</A></TD><TD><A HREF=/about/software/commFasta.jsp>POD</A></TD><TD>A Perl program that compares two fasta files and prints out fasta formatted file of the corresponding and different sequences.</TD></TR>

    <TR><TD>sim4parser.pm</TD><TD><A HREF=/about/software/sim4parser.pm>Source</A></TD><TD><A HREF=/about/software/sim4parser.jsp>POD</A></TD><TD>A perl module for manipulating sim4 reports.</TD></TR>

<TR><TD>newpatmatch</TD><TD>N.A.</TD><TD><A HREF=/about/software/newpatmatch.jsp>POD</A></TD><TD>Pattern matching for large datasets</TD></TR>



</TABLE>

<center>Last modified on November 13, 2002</center>
		

<jsp:include page="/jsp/includes/gen_footer.jsp" flush ="true">
<jsp:param name="cssfile" value="<%=cssfile %>" />
</jsp:include>