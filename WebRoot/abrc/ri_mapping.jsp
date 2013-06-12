<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page errorPage="/jsp/common/gen_error.jsp"%>
<jsp:include page="/jsp/includes/dyn_header.jsp" flush ="true">
<jsp:param name="pageName" value='<%= URLEncoder.encode("TAIR") %>' />
<jsp:param name="highlight" value='<%= URLEncoder.encode("0") %>' />
<jsp:param name="helpfile" value='<%= URLEncoder.encode("") %>' />
</jsp:include>
<H3><CENTER><B><IMG SRC="/images/abrc.gif" WIDTH=86 HEIGHT=30 
X-CLARIS-USEIMAGEWIDTH X-CLARIS-USEIMAGEHEIGHT ALIGN=left>Sets
of Recombinant Inbred lines and Mapping lines</B></CENTER></H3>

<P>&nbsp;</P>

<CENTER>&nbsp;

<P><TABLE BORDER=1 WIDTH=450>
    <TR>
       <TD VALIGN=top>
          <P><FONT SIZE="+1"><B>Recombinant Inbred
          Lines</B></FONT></P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P></P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P><A HREF="dean_ri.jsp"><B>C. Lister/C. Dean
          lines</B></A></P>
       </TD>
    </TR>
    <TR>
       <TD VALIGN=top>
          <P>CS4859, complete set of 300 stocks (includes CS1899 +
          CS4858)</P>
       </TD>
    </TR>
    <TR>
       <TD VALIGN=top>
          <P>&nbsp; &nbsp;CS1899, base set of 100 stocks</P>
       </TD>
    </TR>
    <TR>
       <TD VALIGN=top>
          <P>&nbsp; &nbsp;CS4858, additional 200 stocks</P>
       </TD>
    </TR>
    <TR>
       <TD VALIGN=top>
          <P></P>
       </TD>
    </TR>
    <TR>
       <TD VALIGN=top>
          <P><B>P. Scolnik lines</B></P>
       </TD>
    </TR>
    <TR>
       <TD VALIGN=top>
          <P>CS2225, complete set of 153 stocks</P>
       </TD>
    </TR>
    <TR>
       <TD VALIGN=top>
          <P></P>
       </TD>
    </TR>
    <TR>
       <TD VALIGN=top>
          <P><A HREF="koornneef_ri.jsp"><B>M. Koornneef
          lines</B></A></P>
       </TD>
    </TR>
    <TR>
       <TD VALIGN=top>
          <P>CS22000, complete set of 162 stocks (includes CS22477 +
          CS22478)</P>
       </TD>
    </TR>
    <TR>
       <TD VALIGN=top>
          <P>&nbsp; &nbsp;CS22477, base set of 50 lines</P>
       </TD>
    </TR>
    <TR>
       <TD VALIGN=top>
          <P>&nbsp; &nbsp;CS22478, 112 lines not in base set</P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P></P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P><A HREF="holub_beynon_crute.jsp"><B>E. Holub/J.
          Beynon/I. Crute lines</B></A></P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P>&nbsp; &nbsp;CS1696, complete set of 98 stocks</P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P></P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P><A HREF="somerville_ri.jsp"><B>S. Somerville
          lines</B></A></P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P>CS84999, complete set of 128 stocks</P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P></P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P><A HREF="Loudet_Chaillou_ri.jsp"><B>O. Loudet and S.
          Chaillou lines</B></A></P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P>CS57920, compete set of 411 lines</P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P>&nbsp; &nbsp; CS57921, basic set of 165, intended for
          mapping new markers and for optimised QTL mapping when using
          all 411 lines is impractical.</P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P>&nbsp; &nbsp; CS57922, set of 18, not intended for any
          markers or QTL mapping, but rather to give an idea of the
          variability and transgression of any specific trait.</P>
       </TD>
    </TR>
</TABLE>
</P>

<P>&nbsp;</P>

<P><TABLE BORDER=1 WIDTH=450>
    <TR>
       <TD HEIGHT=18>
          <P><FONT SIZE="+1"><B>Mapping Lines</B></FONT></P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P></P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P><A HREF="vanlijsebettens.jsp"><B>M. van Lijsebettens
          Marker Lines with Mapped T-DNA Insertions</B></A></P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P><A HREF="preuss.jsp"><B>D. Preuss mapping population for
          tetrad analysis</B></A></P>
       </TD>
    </TR>
    <TR>
       <TD>
          <P></P>
       </TD>
    </TR>
</TABLE>
</P></CENTER>
<P>
<center>Last modified on November 19, 2002</center>

<jsp:include page="/jsp/includes/gen_footer.jsp" flush="true" />
