<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="standard_page.xsl"/>

<xsl:template name="preamble">
 <h2>Education Kits</h2>
 <p>Sorted by stock number</p>
 <p>Displaying <xsl:value-of select="/EducationKitCatalogPage/@floor"/> - <xsl:value-of select="/EducationKitCatalogPage/@ceiling"/> of <xsl:value-of select="/PooledGenomicCatalogPage/@resultSize"/> in category</p>
</xsl:template>

<xsl:template name="table_header">
 <tr valign="bottom">
  <th class="sm">Order</th>
  <th class="sm">Stock #</th>
  <th class="sm">Description</th>
  <th class="sm">Price ($)</th>
 </tr>
</xsl:template>

<xsl:template name="main">
  <xsl:for-each select="EducationKitCatalogPage/stocks/stock">
  <tr valign="top">
   <td class="sm" align="center"><input type="checkbox" name="stock_number" value="{@name}"/></td>
   <td class="sm" align="center" style="white-space: nowrap">
    <a href="/servlets/TairObject?type=stock&amp;id={@stockId}" target="_blank"><xsl:value-of select="@name"/></a>
   </td>
   <td class="sm"><xsl:value-of select="description"/></td>
   <td class="sm" align="center"><xsl:value-of select="@basePrice"/></td>
  </tr>
  <tr><td class="sm" colspan="4"><hr/></td></tr>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
