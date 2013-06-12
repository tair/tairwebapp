<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="standard_page.xsl"/>

<xsl:template name="preamble">
 <h2>Protein Chips</h2>
 <p>Sorted by Stock name</p>
 <p>Displaying <xsl:value-of select="/ProteinChipsCatalogPage/@floor"/> - <xsl:value-of select="/ProteinChipsCatalogPage/@ceiling"/> of <xsl:value-of select="/ProteinChipsCatalogPage/@resultSize"/> in category</p>
</xsl:template>

<xsl:template name="table_header">
 <tr valign="bottom">
  <th class="sm">Order</th>
  <th class="sm">Stock #</th>
  <th class="sm">Donor(s) / Donor#</th>
  <th class="sm">Description</th>
 </tr>
</xsl:template>

<xsl:template name="main">
  <xsl:for-each select="ProteinChipsCatalogPage/stocks/stock">
  <tr valign="top">
   <td class="sm" align="center">
     <xsl:if test="@availability='available'">
     <input type="checkbox" name="stock_number" value="{@name}"/>
     </xsl:if>

     <xsl:if test="@availability='available_soon'">
     available_soon
     </xsl:if>
   </td>
  
   <td class="sm" align="center" style="white-space: nowrap">
    <a href="/servlets/TairObject?type=stock&amp;id={@stockId}" target="_blank"><xsl:value-of select="@name"/></a>
   </td>
   <td class="sm" align="left" style="white-space: nowrap">
    <xsl:for-each select="donors/donor">
     <a href="/servlets/TairObject?type={@communityType}&amp;id={@communityId}" target="_blank"><xsl:value-of select="@displayName"/></a>
     <xsl:if test="@donorStockNumber"> 
       / <xsl:value-of select="@donorStockNumber" /> 
     </xsl:if>
     <xsl:if test="not(position()=last())"><br/></xsl:if>
    </xsl:for-each>
   </td>
   <td class="sm"><xsl:value-of select="description"/> </td>
  </tr>
  <tr><td class="sm" colspan="5"><hr/></td></tr>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
