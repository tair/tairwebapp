<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output doctype-public="HTML 4.01 Transitional//EN"/>

<xsl:template match="pages">
 <table align="center" summary="pages">
  <tr align="center">
   <td>
    <xsl:for-each select="page">
     <xsl:if test="@href"> <a href="{@href}"><xsl:value-of select="@name"/></a> </xsl:if>
     <xsl:if test="not(@href)"> <xsl:value-of select="@name"/> </xsl:if>
     <xsl:if test="not(position()=last())"> | </xsl:if>
    </xsl:for-each>
   </td>
  </tr>
 </table>
</xsl:template>

<xsl:template name="form_controls">
 <table align="center" summary="order form controls">
  <tr>
   <td class="sm"> <input type="submit" value="Order Stocks"/> <input type="reset" value="Reset" style="margin-left:10px"/> </td>
   <td class="sm">
    If you have checked any stocks to order, please click on "Order Stocks"
    before leaving this page.  You can return to this page by using the 
    "Back" button on your browser.
   </td>
  </tr>
 </table>
</xsl:template>

<xsl:template match="/">
<html>
 <head>
  <title><xsl:value-of select="*/title"/></title>
  <link rel="stylesheet" type="text/css" href="/css/main.css"/>
  <link rel="stylesheet" type="text/css" href="/css/search.css"/>
 </head>
 <body bgcolor="#F5F9FF">
  <center>
   <img src="/images/abrc_med.gif" alt="abrc"/>
   <xsl:call-template name="preamble"/>
  </center>
  <form action="/servlets/Order/current" method="POST">
   <input type="hidden" name="state" value="addStock"/>
   <xsl:call-template name="form_controls"/>
   <xsl:apply-templates select="*/pages"/>
   <table cellpadding="1" width="100%" align="center" summary="stock data table">
    <xsl:call-template name="table_header"/>
    <xsl:call-template name="main"/>
   </table>
   <xsl:apply-templates select="*/pages"/>
   <xsl:call-template name="form_controls"/>
  </form>
  <table width="602" align="center" summary="footer">
   <tr> <td align="center"><img src="/images/abrc.gif" alt="abrc"/></td> </tr>
   <tr>
    <td align="center" class="sm">
     If you have comments or questions concerning seed stocks, 
     DNA stocks, stock orders, or fee structure/invoice/payment information,
     please email ABRC at <a href="mailto:abrc@osu.edu">abrc@osu.edu</a>
    </td>
   </tr>
  </table>
 </body>
</html>
</xsl:template>

</xsl:stylesheet>
