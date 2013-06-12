<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="standard_page.xsl"/>

<xsl:template name="preamble">
 <h2>Characterized Mutant Lines</h2>
 <p>Sorted by allele symbol</p>
 <p>Displaying <xsl:value-of select="/MutantSeedCatalogPage/@floor"/> - <xsl:value-of select="/MutantSeedCatalogPage/@ceiling"/> of <xsl:value-of select="/MutantSeedCatalogPage/@resultSize"/> in category</p>
</xsl:template>

<xsl:template name="table_header">
 <tr valign="bottom">
  <th class="sm">Order</th>
  <th class="sm">Stock #</th>
  <th class="sm">Allele Symbol(s)</th>
  <th class="sm">Gene name(s)</th>
  <th class="sm">Locus</th>
  <th class="sm">Background</th>
  <th class="sm" style="white-space: nowrap">Donor/Donor Stock #</th>
  <th class="sm" align="center">Image</th>
 </tr>
</xsl:template>

<xsl:template name="main">
<xsl:for-each select="/MutantSeedCatalogPage/stocks/stock">
 <tr valign="top">

  <td class="sm" align="center"><input type="checkbox" name="stock_number" value="{@name}"/></td>
  <td class="sm" align="center" style="white-space: nowrap">
   <a href="/servlets/TairObject?type=germplasm&amp;id={germplasm/@tair_object_id}" target="_blank"><xsl:value-of select="@name"/></a>
  </td>

  <td class="sm" align="center">
  <xsl:for-each select="germplasm/polymorphisms/polymorphism">
   <a href="/servlets/TairObject?type=polyallele&amp;id={@ref_polymorphism_id}" target="_blank"><xsl:value-of select="@original_name"/></a>
    <xsl:if test="not(position()=last())"> , </xsl:if>
  </xsl:for-each>
  </td>

  <td class="sm" align="center">
   <xsl:for-each select="germplasm/polymorphisms/polymorphism">
    <xsl:for-each select="symbol">
     <a href="/servlets/TairObject?type=gene&amp;id={../@geneID}" target="_blank"><xsl:value-of select="@name"/></a>
     <xsl:if test="not(position()=last())"> / </xsl:if>
    </xsl:for-each>
    <xsl:for-each select="gene">
     <a href="/servlets/TairObject?type=gene&amp;id={../@geneID}" target="_blank"><xsl:value-of select="@name"/></a>
    </xsl:for-each>
    <xsl:if test="not(position()=last())"> ; </xsl:if>
   </xsl:for-each>
  </td>

  <td class="sm" align="center">
   <xsl:for-each select="germplasm/polymorphisms/polymorphism/locus">
    <a href="/servlets/TairObject?type=locus&amp;id={@id}" target="_blank"><xsl:value-of select="@name"/></a>
    <xsl:if test="not(position()=last())"> , </xsl:if>
   </xsl:for-each>
  </td>

  <td class="sm" align="center">
   <xsl:for-each select="germplasm/PedigreeSpeciesVariant">
    <a href="/servlets/TairObject?type=species_variant&amp;id={@id}" target="_blank"><xsl:value-of select="@abbrevName"/></a>
    <xsl:if test="not(position()=last())"><br/></xsl:if>
   </xsl:for-each>
  </td>

  <td class="sm" style="white-space: nowrap">
   <xsl:for-each select="donors/donor">
    <a href="/servlets/TairObject?type={@communityType}&amp;id={@communityId}" target="_blank"><xsl:value-of select="@displayName"/></a>
    <xsl:if test="@stockNumber">/<xsl:value-of select="@stockNumber"/></xsl:if>
    <xsl:if test="not(position()=last())"><br/></xsl:if>
   </xsl:for-each>
  </td>

  <td class="sm" align="center">
   <xsl:for-each select="image">
    <a href="/jsp/common/image.jsp?id={@id}&amp;format={@linkSuffix}" target="_blank"><img src="/images/camera.gif" border="0" alt="picture available"/></a>
    <xsl:if test="not(position()=last())"><br/></xsl:if>
   </xsl:for-each>
  </td>
 </tr>

 <xsl:if test="description or special_growth_conditions">
 <tr>
  <td class="sm">&nbsp;</td>
  <td class="sm" colspan="8">
  <xsl:if test="description"><b>Description:</b> <xsl:value-of select="description"/><br/></xsl:if>
  <xsl:if test="special_growth_conditions"><b>Growth req.:</b> <xsl:value-of select="special_growth_conditions"/></xsl:if>
  </td>
 </tr>
 </xsl:if>

 <tr> <td class="sm" colspan="8"><hr/></td> </tr>

</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
